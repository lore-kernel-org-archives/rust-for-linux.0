Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974163;
	b=TFRjMVllV6ymwDbiorTYkBTHnpUCMPwXlydACGJXpdYwymPYd2RUd76U34FfnDk339HN
	 BdSOzDZvVCsFRyvjkn4ZnAVat0KGUA1qUPcUwDHpReKALgotAotjoPNLy9UJUC8fQeRoQ
	 Tz3q5EJMkfjOi+AcDlYo2PiHaJ7Ryb6XcyB/BkPqo0Kb5sx81XrrEeej3diOzfh1UaZqb
	 gBYitk+DQXYf1EK2+uhb/3etbnqpXUJEXlp2K9eOzjvZX8PrjDgaslK8bxTSdnoSAP4mw
	 rKvMOcmoKjWpA/jz7gLXKIk35f6RD/pOWvI7+ukEZH9LfklFUHk2UVVwSM6Wma53Ksg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974163;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+l3jNbIDS76WPNvh/NK944sUo4wbpr4s9at1CgYGR6g=;
	b=3h04aN4iHlGJxNDwCY60yDOGmDAFTuP7pTvoh+NVw/1wzBN8AhECFzacxkbl5gMIPp6y
	 R2iRU0IVoIHyyjRQMeedEHqWsT2FJhaoCImedOXteqpH0oMQHw3UzxTCRz3rjErOhWnD4
	 8k1JbC4VlY/T+knqVt9bYRZV3m9Pr2QjyBzL1yOtRRfBL10ffwLgZdNQlOypfwOtaynNP
	 dflFq2kTUr9p3Y/8W/h8DfIV0hKsN+ujJ7I6FqNiSzz+aJa9NRTlx50lceLLom6UFpNOn
	 83cQQ4x3VwFhAOmFyP+u2BE7Ys8fp2b3BgAbL8MJ8wOi5ULEYCeSthtHG61SkFIXtfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WeDynIun;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA31606A326;
	Fri,  6 Nov 2026 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WeDynIun
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884051F0089F;
	Fri,  6 Nov 2026 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974162;
	bh=+l3jNbIDS76WPNvh/NK944sUo4wbpr4s9at1CgYGR6g=;
	h=From:To:Cc:Subject:Date;
	b=WeDynIunenyp7YlBM64P8U3/KYF0JPTr973XGHfE2NzH0frBK2n8pb+XsD1F0/euL
	 meQ9bkWa3mWhIUnXMqfJu1iDyFgS7gfyHOANjx/AP+MzknIFIv4FIP5liLS4jmZaBY
	 7RJpgWn7SZKCjxI39fU1kIQokvODS75dvDCyQtU5t8N2jsip/1wZd9owG5lNwtqRVc
	 ZvmjiHLQHoiuVdQs2ww8KXJDqJ4PT/51uBXAMWFEV8qcemh50A5zSm8DhjYrQ+u5yZ
	 2Pk+E1OiGo3xH9DrRXl5xFuZED716nN+JsCyUuM7bVriCNc38R567HkPjm6oRYXnGh
	 +SHu+aFUatZgA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
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
	Matthew Brost <matthew.brost@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 0/8] rust: Add drm::JobQueue
Date: Fri,  6 Nov 2026 15:07:45 +0100
Message-ID: <20261106140752.520386-2-phasta@kernel.org>
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

Changes since RFCv7:
  - Write a bunch of documentation, mostly about the kill() backend_ops.
  - Add creations of own work_queues (requires some work with the life
    times still; last relevant TODO AFAICS).

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


Philipp Stanner (8):
  rust: DmaFence: Implement Deref for FenceContext
  rust: DmaFence: Add ID accessor for FenceContext
  rust: DmaFence: Don't drop on signal
  rust: DmaFence: Replace call_rcu() with synchronize_rcu()
  rust: DmaFence: Replace is_signaled() with status()
  rust: DmaFence: Pass result in callbacks
  rust: drm: Add JobQueue
  MAINTAINERS: Add drm::JobQueue to drm_sched's entry

 MAINTAINERS                      |   1 +
 rust/helpers/dma_fence.c         |   4 +-
 rust/kernel/dma_buf/dma_fence.rs | 234 ++++-----
 rust/kernel/dma_buf/mod.rs       |   3 +-
 rust/kernel/drm/job_queue.rs     | 873 +++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs           |   4 +
 6 files changed, 996 insertions(+), 123 deletions(-)
 create mode 100644 rust/kernel/drm/job_queue.rs


base-commit: 7a6bc132f1b51437063c9203e7221067b40a791e
prerequisite-patch-id: f5e24f7b3717f2ab0445b5395c7f12b554861d78
prerequisite-patch-id: e4ebcb108207c2d06130382c59c12ffe09a7a6db
prerequisite-patch-id: 8dc24064e858240a6bb5411a261a987a7eae3fad
prerequisite-patch-id: eefbd4a72ed6da0083e20811882738cc3b05604f
prerequisite-patch-id: ea89aac6f42582c91174068c1db4d171bd7a8920
-- 
2.56.0

