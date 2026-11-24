Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523423;
	b=kRv4sUwtyXMcXuHlIQ5PwP7jEky5jfIhRtM5DnmAkhzvDAHQBhoSxw5RMf5yrsizDOyq
	 FGtV2m71eXHPMS+tHI3/Q8qdKD0XrZn7EHF8qpZvq6ikSnbN1oVV91RaXkwGfdwyRaKiU
	 LTYCkZv8dKKbhqO553w9xA3xjAzjgSyAuibI+BeOjoH+ZIra8fGv7WM6hk0vZbupmqq42
	 9Fd+Q43R9J3f2RxSq9zeHggoc2KyAtnMhaLjaRiLArB1Bb4b9MeHkOUbV7iOwi2ShhDVx
	 93I06lKFQ9POrzmlpJUgbCzW+TWANrG4dqK4cC321n+2sO6x9iHgkP3wDy8HjL0ib0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523423;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VG8BxwmxK2eEGyGiTPMxLHYfSj68j9MEuEHEhkL+Yaw=;
	b=PRgMmZ2NyySwMU7HLtoHEgU7H+BJSQO3ulpvSV3uZY4cLndbcjQOeMgBVvJMGXuigQbT
	 6bKwJEt+zdBTC8Wy8Q+dDgsFReeijnixkS4+YldGkZnytYHa9nhz6O68/cu9G0ZFgj8GA
	 wL8oWzXQGyZHBaFz2aSQtn9bKe3tuFhVeT+gqo3w5oYNTtFIjg/4tDqwNSd2YvvU0Cchy
	 9n0TToTxg5zHXQy83vlUtkOyKOCiew0IDwKoQIn42K1qbDxI37g32PtDYUEDH20dJiYJ4
	 S5WZZSvsASTX82X08HNmlvHvIdoewkCTbsf+yyWwZlgvED+yXNoJIVrLnzGb902LbtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OHAhYtW7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8CC606A326;
	Tue, 24 Nov 2026 12:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OHAhYtW7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325981F000CF;
	Tue, 24 Nov 2026 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523423;
	bh=VG8BxwmxK2eEGyGiTPMxLHYfSj68j9MEuEHEhkL+Yaw=;
	h=From:To:Cc:Subject:Date;
	b=OHAhYtW7ROWFK6+c+ktPF4Oqi42/OuyUcEwEabMdWWwFXxEvlkv6JwJKqJ0xsajr3
	 sBCDSVsct1SwREWbbE6oy1t+4eM34eIS0gaqB5GI9da5Pq6H/NdK6Nb1hZ7IveZsz6
	 mLA76U5yUuTAKMDsIHqRWPqCp71YNSnw0j54GltcApNScy7XNxi9Y5BGN0PiVVvYwk
	 1Qp39dxEIQQ1FCv1ESm7XKETxZ6Hm2si1GzThbaXfvoGFv7USVpawKC37Q33indmow
	 nnuv++EJpYHBs84WwLwv5hIVqGaw9VHBU7qUScU/uTLnkHNSrNyjw2vKK8cQFR7zwL
	 VCXNwVDoohsVA==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	Sumit Semwal <sumit.semwal@linaro.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	"Paul E . McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 00/10] rust: Add drm::JobQueue
Date: Tue, 24 Nov 2026 13:29:42 +0100
Message-ID: <20261124122951.878199-2-phasta@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
  - Fence:
    - Use cond_synchronize_rcu() to speed up fence dropping. (Gary)
    - status(): Don't lock anymore, since I fixed the misordering
      in C [1].
  - JQ:
    - In v1, jobs could be forgotten without being submitted, causing
      UAF. Fixed it by incrementing the atomic by 1, decremented then
      later in submit.
    - Fix bug where I was holding the lock while dropping stuff. (Younes)
    - Add support for park() and unpark() for Tyr.
    - Do not check for parked (revoked) in DropWorker, so that a
      park()ed JQ can continue to drop. Is safe thx to drop order.
    - Use our own workqueues, with MEM_RECLAIM flag set for the submit
      workqueue.
    - Rename SubmitWorker consistently to RunWorker. Now, submit always
      means job.submit(), and run always means run_job().
    - Add max_capacity, so you can never submit jobs that are too
      expensive.
    - Dependency fences:
        - Do not kill the JQ anymore if dependencies got signaled with
	  an error. Just run these jobs anyways, like drm_sched. (Boris)
	- Thus, remove the kill() callback.
	- In a future extension, we can pass the error codes through a
	  suitable data structure to the driver in run_job().
	- Why was this done? To be discussed in detail, but implementing
	  it like this allows us for centralizing dep error handling in
	  run_job(), *if* drivers should care. As far as can be seen in
	  the DRM drivers, they don't.
	  And if they do we would have to come to a common position
	  about fences' errors' meaning.
	  So the proposal is to upstream it like this for now to unblock
	  Tyr. Dependency error checking can then be added once our
	  discussions reached a common ground.
  - Fix CLIPPY warnings.
  - Update the docu to reflect the points above.
  - Update the doctest examples accordingly.

Changes since RFCv7:
  - Write a bunch of documentation, mostly about the kill() backend_ops.
  - Add creations of own work_queues (requires some work with the life
    times still; last relevant TODO AFAICS).

[1] https://lore.kernel.org/dri-devel/20261120111615.2940647-2-phasta@kernel.org/


Depends on the workqueue series:
https://lore.kernel.org/rust-for-linux/20261020-rust-workqueue-v3-0-ea7c74d02068@google.com/

Besides based on drm-rust-next

Daniel tested an earlier RFC (v6 I think) on Tyr and reports that it ran
well. In v2 I want to have our own workqueues ready, perhaps after the
workqueue has gone upstream.

But I thought it's time to present this as v1 since we settled on the
design, it's mostly working already and we can now begin diving out the
remaining problems.

So please review :)

Thx again to everyone who helped with moving this forward.

Last RFC:
https://lore.kernel.org/dri-devel/20261103153138.1087330-2-phasta@kernel.org/

Repo:
https://gitlab.freedesktop.org/pstanner/linux-drm-work/-/tree/jobqueue-jobqueue-v1-2?ref_type=heads


PS:
Note that this version now obtains a fence->error under lock,
because I strongly suspect that this pattern

if (dma_fence_is_signaled(f))
  pr_info("err: %i\n", f->error);

is UB since there is no memory ordering between the reads (which would
proof that fences' locks are not "just for the cb_list", as was sometimes
suggested). My discussions regarding fixing that in C can be found here:

https://lore.kernel.org/dri-devel/20261020100034.759183-2-phasta@kernel.org/
https://lore.kernel.org/dri-devel/2db0f1b4-6628-465e-928e-d779b89f59dc@amd.com/

Philipp Stanner (10):
  rust: rcu: Add get_state_synchronize_rcu()
  rust: rcu: Add cond_synchronize_rcu()
  rust: DmaFence: Implement Deref for FenceContext
  rust: DmaFence: Add ID accessor for FenceContext
  rust: DmaFence: Don't drop on signal
  rust: DmaFence: Replace call_rcu() with cond_synchronize_rcu()
  rust: DmaFence: Replace is_signaled() with status()
  rust: DmaFence: Pass result in callbacks
  rust: drm: Add JobQueue
  MAINTAINERS: Add drm::JobQueue to drm_sched's entry

 MAINTAINERS                      |   1 +
 rust/helpers/rcu.c               |   5 +
 rust/kernel/dma_buf/dma_fence.rs | 261 +++++-----
 rust/kernel/dma_buf/mod.rs       |   3 +-
 rust/kernel/drm/job_queue.rs     | 863 +++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs           |   4 +
 rust/kernel/sync/rcu.rs          |  23 +
 7 files changed, 1038 insertions(+), 122 deletions(-)
 create mode 100644 rust/kernel/drm/job_queue.rs


base-commit: 4325f4aad9727a6e8e7f10c5d2ebf490470cf938
prerequisite-patch-id: f5e24f7b3717f2ab0445b5395c7f12b554861d78
prerequisite-patch-id: e4ebcb108207c2d06130382c59c12ffe09a7a6db
prerequisite-patch-id: e19d2e11fc6c6fc121d65c8502bfa557e1dfc5ec
prerequisite-patch-id: 47301119dc7bc6fdc83256002e92c781a872b142
-- 
2.56.0

