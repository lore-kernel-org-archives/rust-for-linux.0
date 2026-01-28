Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C6523BCFF;
	Wed, 28 Jan 2026 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609157; cv=none; b=g8pv/Oh4WRcVFT2V+Be6PwpuI39bdn2oxQdP7yChou4vBReNFUPS+1jxfHZ48UGLE81CYXWd9odTd4woBQA8dw6rKdQOCoUe4AyES4DrrfmjFc/WHhzMJ53jZG/Y+TMBPEErzDpdLIz1peaKHDE9GZYsutZpbakVU18ohJU58+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609157; c=relaxed/simple;
	bh=txJuOmahfeQQFJpqYSBKf5UmRlgG24SeVBW4qVAAzlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jEqihdW+PltQcf9ovWJgM5kAo1t6B7+WNo0RUXvZaKAyf4CF/AMo5Y28QILTp4UM+XA2dM8wv5rHNUpYsuNSp/9rHZDbSyAqhouWZZb4MMrh1ba1D2O15vUQxp+/a3GXzVXJQl1E9B+BzY1ZRPWpcveia62B0fR6ghKRvqe2Hn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7VnnZKH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7VnnZKH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49AA6C4CEF7;
	Wed, 28 Jan 2026 14:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769609156;
	bh=txJuOmahfeQQFJpqYSBKf5UmRlgG24SeVBW4qVAAzlI=;
	h=From:Date:Subject:To:Cc:From;
	b=H7VnnZKHXCISR1c/HsPaxlCe9UI/TPsNDeU+BF7o9+okHwGut2cZqedZ9pM4oQU8y
	 cBNrI1sSI6yzkOhZOdf6HzvZ6yfYpMuoVfMvAqWun4bUW+q18hQAaH4WuAXg4/q4Ra
	 3kJVGLVdjzyxU21TZUbl8mQqKTq9ncqdNXg+GQtnz68Ci3EuAShQ761RsbnfdRnI+8
	 pxQBBeDXYgbq1zTsUnmux9rH1n6qndxbaJopWxxCYjWP//5RMif2sIAFn3f30IK/NE
	 oRTWzg+clibywFQ00OArv6rRJ0h6mV/pBEu24XGWzTj1Co6Cydj/xZrrMGrDXfeNQa
	 hJGlq6HlP9ftA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 28 Jan 2026 15:05:20 +0100
Subject: [PATCH] rust: add `CacheAligned` for easy cache line alignment of
 values
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ8XemkC/x3MQQqAIBBA0avIrBNUoqSrRAsZRx0IC4UIxLsnL
 d/i/waVClOFTTQo9HDlKw/oSQAmlyNJ9sNglFmUNlaiw0TSnRwzeYkzKofBrioEGM1dKPD7//a
 j9w+cRIXrXwAAAA==
X-Change-ID: 20260128-cache-aligned-c4c0acf870ff
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3215; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=txJuOmahfeQQFJpqYSBKf5UmRlgG24SeVBW4qVAAzlI=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpeheu5pGTCy2TY5SA1f7CzovmK4rLW74FV4U97
 R3yj5T5ftqJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaXoXrgAKCRDhuBo+eShj
 d3JLEAC2lIlPtjQi7Trjq2Vx8x7JBfwrxNFafoC8ZCsUCxl1ZD8vWzZQBhGxd+4QC9BeLZ+e7HE
 frgH27q4pyaod1QwfBsULeeRQVgyRJQCs2DW+irUj517FWqy1QXK0nGl0eEIOmbV9oC0uQ790/d
 Wx//FzlBLoaVybeBvvpWaQ0Gqj5zSQ/TW2mWxyyQugj6L7WqwMNNlKaK6qkFSQm9W76sywdENmy
 7MWAGF1nGdpy0xjVj5MSblDt4XU6MLLuNf1CJ7V3pz5fbknrG77lyAR9hyYmCXGoWbeUFjsepDy
 ELIirYh3JTjVjlxx7uNhuGvIwq2S+U3q7oENr6hY/oAGHInxwafacUMopYHtr6sJyRija/t0gNi
 10VpJnqGxSW+dk34RD5t4gkIQlt9rfXKvGIPmBbjQOqrpNE7jzzQ2q6C319cwyzbK6t+I7rQNX/
 rz/AntKfhbdXic+dnl1eXXu32RdRhLOlLX+WBXgqVC0pFhamCXMdOa9TJ2d7OT5t4Y8joV5i2rt
 CLfaTEbSvh4mGa1ghQcOcmF8T5uBSbhFhbRfokePEgaN+j19ljX/TrIJ1pQkB07C5btIlhIe7Yo
 5wzhyysYji0z7aKvu44lu4jD2bb+ANNcjy3+VK1DmUT9ubucCviLE02AWutCpXJkS9SxCzRHEzk
 lSdCgbAnhIVOVhQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`CacheAligned` allows to easily align values to a 64 byte boundary.

An example use case is the kernel `struct spinlock`. This struct is 4 bytes
on x86 when lockdep is not enabled. The structure is not padded to fit a
cache line. The effect of this for `SpinLock` is that the lock variable and
the value protected by the lock might share a cache line, depending on the
alignment requirements of the protected value. Wrapping the value in
`CacheAligned` to get a `SpinLock<CacheAligned<T>>` solves this problem.

Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
---
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/cache_aligned.rs | 59 ++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs           |  2 ++
 2 files changed, 61 insertions(+)

diff --git a/rust/kernel/cache_aligned.rs b/rust/kernel/cache_aligned.rs
new file mode 100644
index 0000000000000..9c33b8613c077
--- /dev/null
+++ b/rust/kernel/cache_aligned.rs
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::try_pin_init;
+use pin_init::{
+    pin_data,
+    pin_init,
+    PinInit, //
+};
+
+/// Wrapper type that alings content to a 64 byte cache line.
+#[repr(align(64))]
+#[pin_data]
+pub struct CacheAligned<T: ?Sized> {
+    #[pin]
+    value: T,
+}
+
+impl<T> CacheAligned<T> {
+    /// Creates an initializer for `CacheAligned<T>` form an initalizer for `T`
+    pub fn new(t: impl PinInit<T>) -> impl PinInit<CacheAligned<T>> {
+        pin_init!( CacheAligned {
+            value <- t
+        })
+    }
+
+    /// Creates a fallible initializer for `CacheAligned<T>` form a fallible
+    /// initalizer for `T`
+    pub fn try_new(
+        t: impl PinInit<T, crate::error::Error>,
+    ) -> impl PinInit<CacheAligned<T>, crate::error::Error> {
+        try_pin_init!( CacheAligned {
+            value <- t
+        }? crate::error::Error )
+    }
+
+    /// Get a pointer to the contained value without creating a reference.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be dereferenceable.
+    pub const unsafe fn raw_get(ptr: *mut Self) -> *mut T {
+        // SAFETY: by function safety requirements `ptr` is valid for read
+        unsafe { &raw mut ((*ptr).value) }
+    }
+}
+
+impl<T: ?Sized> core::ops::Deref for CacheAligned<T> {
+    type Target = T;
+
+    fn deref(&self) -> &T {
+        &self.value
+    }
+}
+
+impl<T: ?Sized> core::ops::DerefMut for CacheAligned<T> {
+    fn deref_mut(&mut self) -> &mut T {
+        &mut self.value
+    }
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf1200428..af6d48b078428 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -75,6 +75,7 @@
 pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
+mod cache_aligned;
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
@@ -156,6 +157,7 @@
 
 #[doc(hidden)]
 pub use bindings;
+pub use cache_aligned::CacheAligned;
 pub use macros;
 pub use uapi;
 

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-cache-aligned-c4c0acf870ff

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


