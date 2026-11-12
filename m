Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478229;
	b=eXvUA4q7gB0DD6pH9JeP3GOc6q16G0jtmXZ4q77ZXuW48BgBPmdUItUP+0AhVmchokPt
	 aheD4/ypN8Q2O5/vJ+US3igWeG0k2wykx67os+PHOG0Ssom4opMtMFh+jdSIbVxDx/bE+
	 KY2ylyYx8Ym/P70U1mMIY8xnRcqYNkQTDXp3L9MHrM9be5rkudtxSCGTrVjy8jNWlglB/
	 wpFiUKbc3OiZFHisT4Eus8KfId8z/Or6CcUKWaBGxYvQoHE4kNN2Hj2+l5N/tcmH+biS8
	 nXoK60Z1uAa0b9sdaJ/Jrvbhr2tC0Shldk+7i4QYzKtkxB7xTkss8wsoIP+EvTYNxvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478229;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q2h1KqWhx9zf6M/IsRZG4oHpBMjjaTsrgJqfO4pjmVU=;
	b=uhhC2vL1rQzupqPtoDDJ0o7Pg4dbrMKqH/RZYAssGJvaEZzEQjSzW+4NnAxtS+5X1pDt
	 D+LRmCtC3oxCZkHhVO3MHHjP3uzj8oA8HuigCDl2x+N9hMyEwIBptfVB17mytSruBre4D
	 ikJU7D6fUKrJk9WjmMOo1D7YtvvwNl+BorDZD7VmcwS2eflVx9CdD5PTyI2wrJ/UcYDlP
	 bt9YZYTc5JahbFtP5uSq3CePXKu/8nLZSg9Xzii7hn2VuaxE+qj3L1/HpWcPz5whNCgAO
	 /kWPwUOmlRYTCIFfr7mgni4qjVDOPh567/5wFQtQyQ07oP3pQmbK2eGQ1lycJ8Blu5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bT4qsb6R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3DE606A327;
	Thu, 12 Nov 2026 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bT4qsb6R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF4C1F00A05;
	Thu, 12 Nov 2026 10:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478229;
	bh=q2h1KqWhx9zf6M/IsRZG4oHpBMjjaTsrgJqfO4pjmVU=;
	h=From:To:Cc:Subject:Date;
	b=bT4qsb6R3vWqNaYgvRTIzxP+EWXVWGsIdFYs3MY0T/+45P+WFccsLNOsR2qNd7o+N
	 EylF7rFaycZPaDtoSfOcpsecSwIfMKV/SA3PvC3T7Lf55QI84bQYnqomGKnRkJJVVI
	 bGl5Za89sQ+f2DN25PCtVEw1v7JKgmfCj5wD7Llj7Njl66vZ/RZuvBJLRtamaeyg8h
	 aFsMaeE//j351W1bMTmTaSMXqWVBvOEjFjzAmHdsfxSPQTkbdwC2j41aHrpMsqcO6A
	 darkJNapZIt2NwwMyOD1ZwZUaTt001l9atqLiGCUcfYNHdc+FzPmrTeh1gd+lN2QkN
	 Blb0AquGbj/Vg==
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: DamFence: Remove warning about unsignaled drop
Date: Thu, 12 Nov 2026 11:10:16 +0100
Message-ID: <20261112101015.528127-2-phasta@kernel.org>
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

DriverFence::drop() contains a pr_warn!() for when the fence drops
unsignaled. This warning gets into the way of canonical teardown in
Rust: when you drop a lock, it unlocks itself, when you drop a KBox, it
frees itself etc. Congruently, users should be able to tear down fences
they don't care about anymore with ECANCELED, which is already the
default error code.

Remove the warning.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 rust/kernel/dma_buf/dma_fence.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/kernel/dma_buf/dma_fence.rs b/rust/kernel/dma_buf/dma_fence.rs
index a1d851656562..2c8001cb9a59 100644
--- a/rust/kernel/dma_buf/dma_fence.rs
+++ b/rust/kernel/dma_buf/dma_fence.rs
@@ -942,7 +942,6 @@ fn drop(&mut self) {
         // SAFETY: `guard` is valid until the `call_rcu()` below.
         let signaled: bool = unsafe { bindings::dma_fence_test_signaled_flag(guard.as_raw()) };
         if !signaled {
-            pr_err!("DriverFence drops unsignaled. Danger of memory corruption!\n");
             // SAFETY: `guard` is valid until the `call_rcu()` below. The fence
             // must not have been signaled yet, which we check directly above.
             unsafe { bindings::dma_fence_set_error(guard.as_raw(), ECANCELED.to_errno()) };
-- 
2.56.0

