Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C7F43B6CB;
	Fri, 16 Oct 2026 08:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141065; cv=none; b=ldy5Fzu6BmtcVHjsO9TOJZL8ootpoXUAUdqY89uhc2h0ekyPTcmsWIFK6xuSiQxl8FalEXnLLqWiIqgQ+nNE0WJwFBjMLYq647KZ2qVrRNWVRZAhvyOJOJrS5MDS4kGcmTzzR+MyMjM3c9dm69new19mA7s/VKrSi6pttBUHocU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141065; c=relaxed/simple;
	bh=EJiO2CazLnMRA5FW49tacdv8iguOTRATJo3OUbHAW5I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E8/ocF36FDwbhvPtLUBCnDK9zB3YZ8agynRXaR2IZ2cDiYpkWTc/bhHCO8JptgcFDshHPuPGwkFSHWkkyk/QNWfBhzX0TbCeDKEi7cV3WcO/5weiG2CGXHp8RoCofVn1SvDmlIIDZnnKGWbBAjLmoFLvG2n5YQNsduQIrkE6vNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CXa13UQS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXa13UQS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D7A1F000C7;
	Fri, 16 Oct 2026 08:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792141060;
	bh=aej8WaS0LNe5yTn1v0c4I4d5bR9AGZ4UhcXScLARNJI=;
	h=From:To:Cc:Subject:Date;
	b=CXa13UQStidtU8onQdyD3oodWfVDjbX856Xos2ITCz4avEPobh81jJN9HdAkKLnxt
	 Y9+/4Fj6NYdfY8UQxQSKEUh22TcBcheG7YEAwa2G0py0QAGYKTTVPyN5nfW3ckcUVM
	 TNzMpSgELG1yIiUtneBEt8Esnq12osXpMITlqRy/HduDlGea4okOEQ7eWoxNaPakKV
	 XNzz5O3aqj/B+6gEmeDAdpFX62wYkM2WoeGIvST8T8Bf1WFQLy45yAx1M69pTkFy5N
	 c2FZCyARH8BWO1FmYPI6hdArjiH90QrnJUeBfUnkUDvaNjvj9bAlW0oRKIpAnPeXcO
	 G5nl1FOKENAeA==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	John.harrison@igalia.com,
	da.gomez@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [RFC PATCH v6 0/5] rust: Add drm::JobQueue
Date: Fri, 16 Oct 2026 10:57:19 +0200
Message-ID: <20261016085724.1031766-2-phasta@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes in v6:
  - Rework DmaFence so you can signal fences without dropping them
    (since we'd have to drop in atomic context otherwise)
  - Use synchronize_rcu() for fence dropping for now – with a fast path
    optimization! – instead of call_rcu() because the latter can run in
    atomic context.
  - Add DropWorker for JobQueue which drops jobs and their fences in
    process context.
  - Rework locking design: All JQ API functions can be invoked without
    any driver locks. run_job() is not executed with the JQ lock held,
    thus the driver can sleep.
  - Add a seqno based approach to catch potential races with the
    unlocked call to run_job().
  - Redesign JobQueue::complete_jobs_up_to_seqno() so that by default
    jobs are completed with status == Ok(()). This is done because it
    makes the race-catcher above easier to implement (otherwise we'd
    have to carry the last error around, and if we ever implement batch
    submissions we'd need a list of errors).
  - Since our design assumption is that users will always close their
    ring and drop their JQ if anything goes wrong on the ring, just
    provide one function that signals with an error on teardown:
    JobQueue::teardown().
  - Move the work items out of the locked JobQueueInner, since the work
    queue lock already synchronizes everything. The
    Revocable<JobQueueInner> needs to stay, however, so that the
    SubmitWorker can be safely cancelled on JQ::drop().
  - Fix various logical bugs that I found (code is unfortunately still
    untested).
  - Extend documentation significantly.
  - Formatting.

Changes in v5:
  - Add back the Revocable<JobQueueInner…> from my earliest RFCs. Reason
    is still the same: JQ dropping while dependency fences signal could
    deadlock. Similarly, this solves a dependency kicking of the work
    item again while drop() is running.
  - Do not call run_job() with a lock held, since run_job() might sleep.
    AFAICS, this also makes the proposed XArray solution impossible and
    demands that we use a list.
  - Re-add the earlier credit-count-system, so that run_job() is
    infallible. Simplifies the design quite a bit. (Danilo)
  - Drop jobs in a deferred manner through the work item so that job
    payload data can do atomic-hostile stuff.
  - Because of the point above, I suggest that we stop dropping a
    DriverFence on signal (Danilo's and my idea). It has no real
    advantage, and getting rid of it allows for better controlling what
    drops when through JobQueue. For fence it's only relevant that there
    is an RCU grace period, thus:
  - Replace DriverFence::drop()'s call_rcu() with synchronize_rcu(). We
    would, therefore, demand that everyone who's got a problem with the
    delay drops via work item.

This can still not be tested as I'm blocked by pin-init vs self-ref.
Just FYI.

I would appreciate confirmation of these following thoughts on locking
design:

1.
I believe that callers of jq.new_job() and jq.submit_job() do not need
an outer serialization mutex. Reason is that JQ serializes with its
internal lock. Sequence numbers cannot take over older seqnos because it
is submit_job() who sets the seqno.

2.
I, furthermore, believe that a driver will not need to hold a
driver-lock while calling jq.complete_jobs_up_to_seqno().

IOW, I am suggesting that a driver can always safely use JQ without an
outer lock, and actually *should* do so to avoid potential locking
issues.

Reason:

let driver_stuff = foo.lock();
let current_gpu_seqno = driver_stuff.get_seqno();
drop(driver_stuff);
jq.complete_jobs_up_to_seqno(current_gpu_seqno);

Thus, I believe that it is OK for me to take the JQ lock in
jq.complete_jobs_up_to_seqno().

Please correct me if I'm missing something.

Should I be wrong and a lock inversion could occur, then we could
hypothetically add a fence Signaler object, with which we could signal
fences with a different lock. Similar to how drm_sched does it with the
hardware_fence.


Regards
P.


====

Cover letter from v4:

As the commit messages and code comments detail, progressing JobQueue is
currently somewhat blocked because of an issue with self-referential
PinInit, which Gary generously offered to investigate.

This code compiles, but the example does not because of the
aformentioned issue. Nevertheless, I wanted to provide another RFC here
so that we can move our discussions forward in the meantime, especially
since very much about JobQueue has changed.

Our, now upstreamed, DmaFence abstractions informed some of the notable
changes in JobQueue. Most notably, JobQueue now owns the FenceContext,
Jobs are created on the queue and own the DriverFence. Jobs, again, are
owned by the JobQueue. We hope to enforce correct behavior that way,
having FenceContext, JobQueue and firmware ring all correspond with each
other 1:1:1.

I suspect that a potential deadlock on JQ drop still exists. I
previously solved that with Revocable, which I tend to think will also
be the way to go here.

(One very great news btw is that we almost magically solved a number of
issues with the new DmaFence design – in combination with this JobQueue
design, for the first time it would be possible to fully support the
dma_fence backend_ops. The driver-unload-problem previously had most
users use intermediate fences, like the drm_sched_fence, which means
that callbacks, e.g. from userspace, could not be passed through to the
driver. Now, with FenceContextOps <-> JobQueueOps, we can theoretically
support all of them)

The differences between this draft and Daniel / Tyr's prototype which
probably are most noteworthy are the different lock design
("Philipp"-JobQueue has one big lock, wheres Tyr-JobQueue has 2, 3 if
you count the XArray lock) and the used data structure.

The presented solution uses lists over XArray because:
  1. XArray is semantically more complex and has an additional lock.
  2. An Xarray-as-ringbuffer needs own algorithms for index tracking,
     wrapp around etc. With list you enqueue into a waiting list, and
     for running you move into the running_list.
  3. The memory reservations we need for pre-allocating everything for
     our job-submission path are solved in one go with list, because a
     job simply contains a list head.
  4. Most notably, it is unclear how XArray behaves for ever-increasing
     indices with a sliding window, whereas the list semantic is well
     understood and deterministic.

I obviously don't claim to own all the wisdom in that regard; it's just
that I still propose this solution because these arguments make me
believe that it is the right one.

Since all the list handling is done with iterators, there is currently
no unsafe needed.


I hope we can discuss many things here before we, hopefully soon, can
address the lifetime issue and move to a v1.


This is based on drm-rust-next (10a6623a24a8), plus Danilo's ScopedWork
[1] and my patches [2][3] regarding 'static and lock errors.

Regards,
Philipp

[1] https://lore.kernel.org/rust-for-linux/20260807165252.3849875-1-dakr@kernel.org/
[2] https://lore.kernel.org/rust-for-linux/20260922083631.444614-2-phasta@kernel.org/
[3] https://lore.kernel.org/rust-for-linux/20260924085523.2620704-2-phasta@kernel.org/

Philipp Stanner (5):
  rust: DmaFence: remove static lifetime
  rust: DmaFence: Implement Deref for FenceContext
  rust: DmaFence: Don't drop on signal
  rust: DmaFence: Replace call_rcu() with synchronize_rcu()
  rust: drm: Add JobQueue

 rust/kernel/dma_buf/dma_fence.rs |  88 ++--
 rust/kernel/drm/job_queue.rs     | 700 +++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs           |   4 +
 3 files changed, 731 insertions(+), 61 deletions(-)
 create mode 100644 rust/kernel/drm/job_queue.rs

-- 
2.55.0

