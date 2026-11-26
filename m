Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709564;
	b=qcs3MmieIfYVcUura9otoXkijIbqPV31WM+ctr+xHa5dXg3t6MRL+z0VFYVme82kV1/l
	 tPubXoo9ETzXFHxdAP4E9om/NkD1E0OTOX8yN06ww7YDxP4LMM12/ZJqlt0rtM9MPTdKC
	 INcQqq8FZNwolO1TH+JisPKNA9ycU3EWwYXYqgZDM5DIuGQFPaevqsAmFcDFR1JUtD7mS
	 vBE2kXskGfraBH73gJ0TOFd2Z28bkll+hAudrB9nzRupg9uFDkBI+gYFPTBhIEc5vnbix
	 ZQLZROZz3cC+50p0wDvRDglx3WE9VU2Nn0+D2SpnOZ0wdGagxvh5OsLIbeP2yUsNkhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709564;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DaEirMw/1djdkLL110qkB/wjVzmaSRnYjY3X7hDvR40=;
	b=aBxznVz8k02ge/dVLU3lG1tumYA20FXtZMDS3KRXHJ7i+ZR9BTVHIiWccztA9Elrstfl
	 W5JZne+llJFEfuy3mLMYHVIUyLMHkrF2WxP0hg8ZE1tcJqLzJcPUCbYVZ3D0GMYDMhUFX
	 KSAH6LXS8hNxzxiq1/R27DvhEg/lwlG+lZPjSxUP14KOaxy+Cqiv5zocdoVfsBDBdQhg1
	 rJ8AScN8vI8s6m4/xmbSb6KHKFxwJ92zx8nHIiM//slgWz9ccrtEpL6KBGPkza1oXNbsF
	 JuTGE7SH+CIQ2T6hg2IlHdfBSeK3SJsakNgn9mvJwPlWbqGMU5ujPpQcsjLfWBs8LSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sgyqsby1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BAF606A31C;
	Thu, 26 Nov 2026 16:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sgyqsby1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2A61F000C6;
	Thu, 26 Nov 2026 16:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795709563;
	bh=DaEirMw/1djdkLL110qkB/wjVzmaSRnYjY3X7hDvR40=;
	h=From:To:Cc:Subject:Date;
	b=Sgyqsby1rJTlvbxx1/BcyqfrxcTOaFYybGvJ1oEbx/1j+YRqHQaXhASvfxtF4Dihq
	 jj8/xkDY3rzyqnICs3QcWrY1McDRzcz1YNlHx+WLAF8eVgPhz/HBSOFyISdyPITtKc
	 R2L8W2N9tNwzrgeslg7pDV60iKy1nAL+eEpe9ANpYu+wL1BFDBVHpu/Iu/st7v5iJ7
	 bRWUgn6XuYOd9Fmi6Z7WZVIhZkgYxHCGYeR9etTX/ijTMdn3Ium9msrJT5n8Mm14zS
	 g3nAIvaMtVRJiphVcuj4opC0uHP3En4SMfbSLkFvaoezapvhgSV5TyAAvylcOV9VsG
	 Zl/p7XT9W435w==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v3] rust: DmaFence: Remove warning about unsignaled drop
Date: Thu, 26 Nov 2026 17:11:47 +0100
Message-ID: <20261126161144.2337064-4-phasta@kernel.org>
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

DriverFence::drop() contains a pr_err!() for when the fence drops
unsignaled. This warning gets in the way of canonical teardown in Rust:
when you drop a lock, it unlocks itself, when you drop a KBox, it frees
itself etc. Congruently, users should be able to tear down fences they
don't care about anymore with ECANCELED, which is already the default
error code.

Remove the warning.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v3:
  - Fix Typo. (Daniel)

Changes in v2:
  - Also update docu accordingly.
---
 rust/kernel/dma_buf/dma_fence.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index a1d851656562..01a7ae807273 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -631,8 +631,9 @@ struct DriverFenceData<'a, T: Send + Sync + FenceContextOps> {
 /// It is crucial that a [`DriverFence`] always correctly represents the state
 /// of the associated job on the hardware. Especially, it is strictly necessary
 /// that the owner ensures that all [`DriverFence`]s eventually get signaled.
-/// As a last resort, a [`DriverFence`] will signal itself if it drops
-/// unsignaled and print a warning.
+///
+/// A [`DriverFence`] that drops unsignaled will signal itself with the error
+/// code ECANCELED.
 ///
 /// This design intends to implement the [`bindings::dma_fence_ops`] in such a
 /// way that the driver-data necessary to implement the callback's functionality
@@ -942,7 +943,6 @@ fn drop(&mut self) {
         // SAFETY: `guard` is valid until the `call_rcu()` below.
         let signaled: bool = unsafe { bindings::dma_fence_test_signaled_flag(guard.as_raw()) };
         if !signaled {
-            pr_err!("DriverFence drops unsignaled. Danger of memory corruption!\n");
             // SAFETY: `guard` is valid until the `call_rcu()` below. The fence
             // must not have been signaled yet, which we check directly above.
             unsafe { bindings::dma_fence_set_error(guard.as_raw(), ECANCELED.to_errno()) };
-- 
2.56.0

