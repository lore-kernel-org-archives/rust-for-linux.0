Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003706;
	b=g/PzQy600xEfTn7+B7JgKTC3n3Kkr4a7/a2FDCim1/4tEa3EzAh7VqzENCfjsPJkoSES
	 v3lbLGzPVccjzLUr5UmU1cs9LLl1o62/b3rQ9GuUInyy3HSDwFEJwNhAzJbzH+YNUKdhk
	 vXTSrM0oqOg17cxbLL355TNvYWIIkr4h2T0li8iuUmtL3HEmNeTaIL0VW1doIEl/oLNL7
	 r5Bsa745dut4/nyP0rtKKURpiwjoCta7nNhACUnM0TGnS88lzzISQ5lwdqTT86/75dZSA
	 jfPiCASLH62CuQBV17JIz0D+epLQ8P/sBMYfW5P0IvrXGOj9TCKFAeNquYuXWctaC4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003706;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=05Nm6HzmdIZXjFb2zu8EqHf0YxdihZclsdnjfiwF+TU=;
	b=UHOnMtLfwzJg5iE3Pz9csWaWT/QcAj/SBUh7mfbEeD5RTpjS8vIn7HRNj/sLrpyHTLE9
	 sBADVgPm2N5OUh9L1KwgOsk/PIROzZjqEKRHAR3o/Zl/yzMxva98dbG2IkCBvyJu80hQi
	 iIjZjWtjV8CHV8V5unZ/BEwK896DFeZ2FjNAMXovyqH93ba5tDWwVb6iL3tNk+uxCecjn
	 LLI0cg7ObNDBg9+1ae1p0CIYgHC7iX30lq3ZpALCkkoKQz8hm90zW+f6CYueD9n+NSOD8
	 9SYggIVoOMh0dbHZKDf6urfA5a3Cn1rMEYrOvys/mTGhZ5kn1if51p/U5+3012wv+Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FzNjTayr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232B1606A333;
	Wed, 18 Nov 2026 12:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FzNjTayr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25EA01F000C4;
	Wed, 18 Nov 2026 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795003705;
	bh=05Nm6HzmdIZXjFb2zu8EqHf0YxdihZclsdnjfiwF+TU=;
	h=From:To:Cc:Subject:Date;
	b=FzNjTayrwOoCN1PjGWNbdV6fBFqeU+ib/IZaJwhEAy+P5ituS/39Bti3QCbmoRl0Q
	 OVCIRXzGlbL5PkPZhqwZWT+8orOza+uiCKHxYjU7c05AN+JEQ9vA3H1BXJTFpTqW76
	 mg3nbSsYC0dTwVoAxbXOdQu44t3ObaEs42HPnM+EikKx4X0ULYBf+f4UbKp29wHq5j
	 7vhww0tHNf+yO1za975kQwbuOqe5zzM1GS2u3OOEf/CV4MKXKrWbCVeWqSVMMBs5UB
	 g5g5jPDgL999QweAexDTD8F44UdNMzdFxYpv20VNgN7tmXKY0SrniP/7O3dgncKx0a
	 C5GfrjKounpFw==
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
Subject: [PATCH v2] rust: DamFence: Remove warning about unsignaled drop
Date: Wed, 18 Nov 2026 13:08:14 +0100
Message-ID: <20261118120813.1539288-2-phasta@kernel.org>
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
Changes in v2:
  - Also update the documentation accordingly.
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

