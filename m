Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD23911CA;
	Fri,  5 Jun 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655672; cv=none; b=i9stI0jTUZ2FQ+XXYPw9OkjmNkWB/3AVpvWqmOGbHfLQpSybzqb0kXcM7cfO+bCQtgp884kskrEgiZ4Hs5WXSDIXs9dq0lubI2IvVuZ7Un0uOPYpVCV+Lsvq1zwOJ/TZvi03vuWITy2dxi0jcizLaIoVNXG9CeBhm81R2sQ/BRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655672; c=relaxed/simple;
	bh=eRfxmUkQqrmh+7ydAl1CyAaP+7fYfnTrTU8habC1k08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhL1i0cNfFF/NCibC7IxHAhCwvfmzMwgAHwVbpiSWDk6u9s5tzT5i3N+izm8nMx+ZfF7A0T6dWfBruI2BekDqCGgOmBSrD4OdBpHbN+/y4ypUg/nGfOKVtPvxrPLgpnZWPcM3zmbP6NO83NUL7iD+qs6HXhNFlFFYn3PnkatIYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGC2KChr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGC2KChr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA091F00893;
	Fri,  5 Jun 2026 10:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780655671;
	bh=dFrQhcTjYjYlQDboe4vfQTAW28MKKhrj+2TnMlIO5uI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iGC2KChr+cM2ShXwX3tEWOKqXt5ArIT5thwI9IvtSsOdSElCRqDB5wZzh4JJuHkPm
	 k0hqAYp/ZaOPUPhjIrphb10bvG3JyQcC/q1vkXtIN55OJMZS4QqO/agY3zwS9yOFYu
	 i1JJGQR2W25GI8iWhaSaR8/YGXqWzYH4FKEQmHa6C5NAOOdaorhiYzPU/FczqiFVvy
	 5c7x6vV+sSk9dx26IDFXsQ2l1a67/eSfiJioaiqEbNSauQSPHBvKsOKlnuJvGr52u1
	 Z61ZJZIS99KE/OB1HRZi3lRAwKJlrizHbL1CnaKH3/MIKcu3sNbKZP8rfTmVpwVTB6
	 NfED15UIHCS2g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 12:34:13 +0200
Subject: [PATCH v4 1/2] rust: sync: atomic: add atomic_per_byte_memcpy
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-page-volatile-io-v4-1-0e217d9bf11a@kernel.org>
References: <20260605-page-volatile-io-v4-0-0e217d9bf11a@kernel.org>
In-Reply-To: <20260605-page-volatile-io-v4-0-0e217d9bf11a@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Boqun Feng <boqun@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3097; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=eRfxmUkQqrmh+7ydAl1CyAaP+7fYfnTrTU8habC1k08=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIqYpP6qiupR/U70KNHOs89WvnUNI/gtu/Zo+7
 I2fFFhQiB2JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiKmKQAKCRD6UCkIqsW9
 0KeKEACD8pnjBqC3fn4EZ4nMld6CxkNc5dIvf62nnvTRQ9TfcKZ55qD3cn26nWR3IgsvXuOQ7FS
 sZMCsWA5S93ZlCU2egckrQByPuy6y02y1FFoFDWon2RzwGnk5rRSB5iwIweKS2UxmUXRI8slSxD
 A4+Fj6P9iBMXDSlOsVbSFVqgKBjU8i0WYExpQYvaLldVS3BgU/QB0ox4Xo0C5ac+0YiDYnc8WnY
 lUJ3cqJ7L7GOG/jj9IzFDy3HQvzvmLIZ7LGNaw1kzHNf6PxitsWdeg7GZZJ1GU4CiEd9soq4trD
 dhYxD2Z6pYiONUDXkrAukSUBGPhO/6Wggoo+nZJ/gG2t+4G5DlZsPs+KHMu97myYs70ZizEuzmh
 LbYRRyMNDK3dES8QEgRZTThIAD+MKhlREdR/FDBHi7leiFRzGBT2RM5i1NpL2c3xbDQHZOEKk79
 +zu4SAMu4Ybii5E6FMJxIq6duOOVwNzCealyZ7QgmaP0YCF+lZBWlzO3Ode17DSPSDn1H+2YgV6
 KYn6cGor9f91TO30z+Pes0qekQyGSA9adg/ick7oJqHC47OyZj6vvB7mINgIyagCCxNYmZAlVff
 1SbIVuRcSPEqMNPrIIiVhut7pxJPJIYi6L+4pfGpvO3M4wZgSt2KL5FnnHeu7sp5GYOlFRx+5VI
 cHUC+hGGeYphYbA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a helper to copy `len` bytes from `src` to `dst` using byte-wise
atomic memory operations. This is the concurrent-safe counterpart of
`core::ptr::copy()` (the equivalent of standard C's `memcpy()`).
Because of the atomicity at byte level, when the copy races with
another concurrent atomic access (or when a normal read races with
an atomic read), or with an external access (from DMA or userspace),
the behavior of this function is defined: the memory is copied at
(at least) byte granularity.

The helper is the building block for higher-level byte-wise atomic
copy methods (e.g., on `Page`) that need to remain defined under
racing accesses, such as when copying to or from a buffer that may
be concurrently accessed by userspace or DMA.

The implementation forwards to the kernel's `memcpy()`, which is
implemented in a way that byte-wise atomic memory load/store
instructions are used.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/atomic.rs | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 9cd009d57e35..3c76f1a14b53 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -848,3 +848,38 @@ pub unsafe fn cmpxchg<T: AtomicType, Ordering: ordering::Ordering>(
     // per LKMM.
     unsafe { Atomic::from_ptr(ptr) }.cmpxchg(old, new, o)
 }
+
+/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
+///
+/// This is the concurrent-safe counterpart of `core::ptr::copy()` (the equivalent of standard
+/// C's `memcpy()`). Because of the atomicity at byte level, when racing with another concurrent
+/// atomic access (or when a normal read races with an atomic read), or with an external access
+/// (from DMA or userspace), the behavior of this function is defined: the memory is copied at
+/// (at least) byte granularity.
+///
+/// Implementation note: this is currently implemented by the kernel's `memcpy()`, which is
+/// implemented in a way such that byte-wise atomic memory load/store instructions are used.
+///
+/// This copy operation is volatile.
+///
+/// # Safety
+///
+/// Callers must ensure that:
+///
+/// - `src` is valid for atomic reads for `len` bytes for the duration of the call.
+/// - `dst` is valid for atomic writes for `len` bytes for the duration of the call.
+pub unsafe fn atomic_per_byte_memcpy(src: *const u8, dst: *mut u8, len: usize) {
+    // SAFETY: By the safety requirements of this function, the following operation will not:
+    //  - Trap.
+    //  - Invalidate any reference invariants.
+    //  - Race with any operation by the Rust AM, as `bindings::memcpy` is a byte-wise atomic
+    //    operation and all operations by the Rust AM to the involved memory areas use byte-wise
+    //    atomic semantics.
+    unsafe {
+        bindings::memcpy(
+            dst.cast::<kernel::ffi::c_void>(),
+            src.cast::<kernel::ffi::c_void>(),
+            len,
+        )
+    };
+}

-- 
2.51.2


