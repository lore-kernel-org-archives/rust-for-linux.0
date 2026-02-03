Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF4239446E;
	Tue,  3 Feb 2026 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770106475; cv=none; b=QS+oHSBBXftkqQqgTocNw05AX9JmDRQhwDvQkCqERrxzJop2c5xRcmxG/nFkD/LWdnfnYUkgS4z/xGqp26uhbxJnRz9EmZvm5GNGyHkePSR+b8LwX/k3R+WroOT3LrvZvRIOzo9JV3yXlqS9Yg55PDA94BXVq2sIqx5wprecB0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770106475; c=relaxed/simple;
	bh=SLo4nt2/7u4YTvmd+3zLjSjXIBXcfm5WckOqNZ7cT/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=idEnaMSSHLyFuBJ9QcjVrkaT9as46ODz8ptno8/bFbFf7KapfUGcDJta5L06z0pcXde8XU/R1Pn8Uw0W0VGnveGzLrUoxVlnY6PlJRAGEiWQGXIDQpkteYna6QM9ph+ijfCzoN6r/yigh0bCu72j1Cn0HM/P0cDB8Lrpn5WKiqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAlIvkfn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAlIvkfn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF32C116D0;
	Tue,  3 Feb 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770106474;
	bh=SLo4nt2/7u4YTvmd+3zLjSjXIBXcfm5WckOqNZ7cT/o=;
	h=From:To:Cc:Subject:Date:From;
	b=DAlIvkfnHpeJPsB4WcjT7eyYc57pIsh/jhzzdDWc0BqPdvo4nuWWFH+57NcALK+RB
	 d/+RZBcW2w3mzTBbFgjFy+QtgeazEae7fYWtaSlEQ8dpHsdDHCkKn5d8tuHjtHielm
	 ycwWNTi4OiqzZ2/P/LOcLZQBrLVTNH/r9YRidJygnCYq6+rbOIwQQEHAk36l2o44sn
	 gjSehSIplce8S3+xGyuVz9JvwTnHC7WaFtqxkXkRsKM9lIauS0Y4Ll0EbUjlN+AAMD
	 9P8++3LBGg1f7J40YqYMdpV5oqq+1e31EYFaZzbCSYC0KauLnFetqdbCAQyaYRU89v
	 Le7KLTnkjI21A==
From: Philipp Stanner <phasta@kernel.org>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [RFC PATCH 0/4] Add dma_fence abstractions and DRM Jobqueue
Date: Tue,  3 Feb 2026 09:13:59 +0100
Message-ID: <20260203081403.68733-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series is a followup to my WIP RFC [1]. I will not send out
separate DmaFence series's anymore, because the DmaFence only makes
sense with a user, and the first user for now is Jobqueue.

Changes since the WIP RFC:
  - Complete a first working prototype for DRM Jobqueue, without timeout
    handling, and with some work to do for clean teardown.
  - Write test code for DRM Jobqueue.
  - Add abstraction for dma_fence_is_signaled() to DmaFence, since this
    is needed for the testing code.

I am happy to be able to announce that I can now provide the community
with a first operational prototype for DRM Jobqueue. I have tested it
with the code you can see in patch №4 and trust it enough to share it
with you.

This is an RFC, intended to show the rough design and to provide folks
like Tyr with something they can give some early testing.

Note that, unfortunately, I did not yet have time to take more detailed
code feedback about things like Deref into account, given by Daniel and
Boqun. Also, I still need to improve things like naming and move the
DmaFence code to the appropriate place (dma-buf).

That's all going to be done over the next weeks.

Most notably, I intend to rework the DmaFence implementation. On one
side, to implement the given feedback and make it more convenient to
use.

On the other side, Christian König is currently reworking the C
dma_fence implementation [2]. Thereby, he is trying to solve the exact same
issue that we have solved so far with the ArcBorrow for dma_fence context:
that dma_fences can outlive their fence context, thereby causing UAF.

Once that problem got solved on the C side, this will allow us for
significantly simplifying Rust DmaFence.

Note that there is still more work to do to ensure maximum robustness of
the Rust API against driver API abuse and misuse. Notably:

1. We will probably want to have Jobqueue::submit_job() return a
   DmaFence wrapper which cannot be signaled by anyone except the
   jobqueue itself. So that users can only register their own events on
   that fence. The reason is that we have already observed that with drm_sched,
   we do have drivers who signal the scheduler's internal fences.
2. Jobqueue itself still needs some more work to be resistant against
   callback-code UAF bugs (not data UAF) in case a jobqueue drops before the last
   fence and the jobqueue code (module) is unloaded.
3. There is a problem with propagating an allocation error when creating
   the jobqueue's submit WorkItem. See the corresponding TODO and the
   code, and please participate in the discussion. That's currently the
   biggest remaining design challenge.
4. We would now finally have the chance to enforce the mysterious,
   mythological "dma_fence rules" ;)
   For now my ideas regarding this would be to implement it in a way so
   that fences can only be signaled through their fence_context, like
   so:
   fctx.signal_up_to_sequence_number(50); // signals all unsignaled fences up to number 50
   So for the first time, we could actually enforce that fences must be
   signaled by increasing sequence number.


So you see, there is still a lot to do and a lot to discuss – but we're
now finally heading somewhere.


Cheers,
P.

[1] https://lore.kernel.org/rust-for-linux/20251118132520.266179-2-phasta@kernel.org/
[2] https://lore.kernel.org/dri-devel/20260120105655.7134-1-christian.koenig@amd.com/

Philipp Stanner (4):
  rust: list: Add unsafe for container_of
  rust: sync: Add dma_fence abstractions
  rust/drm: Add DRM Jobqueue
  samples: rust: Add jobqueue tester

 rust/bindings/bindings_helper.h        |   1 +
 rust/helpers/dma_fence.c               |  28 +
 rust/helpers/helpers.c                 |   1 +
 rust/helpers/spinlock.c                |   5 +
 rust/kernel/drm/jq.rs                  | 680 +++++++++++++++++++++++++
 rust/kernel/drm/mod.rs                 |   2 +
 rust/kernel/list/impl_list_item_mod.rs |  12 +-
 rust/kernel/sync.rs                    |   2 +
 rust/kernel/sync/dma_fence.rs          | 396 ++++++++++++++
 samples/rust/Kconfig                   |  11 +
 samples/rust/Makefile                  |   1 +
 samples/rust/rust_jobqueue_tester.rs   | 180 +++++++
 12 files changed, 1313 insertions(+), 6 deletions(-)
 create mode 100644 rust/helpers/dma_fence.c
 create mode 100644 rust/kernel/drm/jq.rs
 create mode 100644 rust/kernel/sync/dma_fence.rs
 create mode 100644 samples/rust/rust_jobqueue_tester.rs

-- 
2.49.0

