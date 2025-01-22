Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A30211484;
	Wed, 22 Jan 2025 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737549520; cv=none; b=Y1B3gZhii/qnQ2K+zqgCd130iK+dGUIAeXwpBmbGq4q7XNyTzhEIdKcN4YAWOi94jPnqc+cKmXglLPOHpFdo2M3ZkyjS9nw4Tw073wUM0aO7cy8Ix2yWA7GH8mGH8QEveHtBfIT/BN9KMI5bkAG6nmoYySs4GnFrH+CMab0tCPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737549520; c=relaxed/simple;
	bh=Izv9utzdfp1zB6jrmm0SrdK/2UXYvADzA8JwK5UjU10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lddGKL/fEQF7IFvOP2PDWoT8c04sirpQZW6Fll2GihefvrC21z5NtDbRzppVy7HnCNmA6kWgpjYYJ4yZ5aT4Er2iz2WYbvpLMSMT1AhF6HVJJP6yljsvZWbIPdKW3/peE9jqswKbaxW854lTKO0f0Xk7aiga6jdAEyQHPb/DJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=LZR6dC0F; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="LZR6dC0F"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1737549512; bh=Iur9wEfdiGAs3xsv9pab5l3ui4audQ+RCQw3QYUuSIg=;
	h=From:Date:Subject:To:Cc;
	b=LZR6dC0FzCq9AQKk4wkFV16OAqV7tvb+jn4UekETwv6iMqHa87q5mIF8cLWkgPRon
	 NTCU2g6ihd9Gq9RGUlDZvutE6krUTr7KW8GB5O7SW6OsQjk62GTBE/4MvojhCI0RDA
	 dxVuci7dipvTGVcO6PWtd/ewceWwr3F3tIJru7NY=
Date: Wed, 22 Jan 2025 13:38:09 +0100
Subject: [PATCH] rust: io: move offset_valid and io_addr(_assert) to IoRaw
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-rust-io-offset-v1-1-914725ab55ed@kloenk.dev>
X-B4-Tracking: v=1; b=H4sIALDmkGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMj3aLS4hLdzHzd/LS04tQSXfMkY8skQ8NUC5PEZCWgpoKi1LTMCrC
 B0bG1tQBXjHmBYAAAAA==
X-Change-ID: 20250122-rust-io-offset-7b39b11e84ac
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fiona Behrens <me@kloenk.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=7134; i=me@kloenk.dev;
 h=from:subject:message-id; bh=Izv9utzdfp1zB6jrmm0SrdK/2UXYvADzA8JwK5UjU10=;
 b=owJ4nJvAy8zAJdbGuXyr5NPHToyn1ZIY0ic8O6LZ5DTlrnPBnic2ST2b7tqwReyTWsE+fe6r0
 FWTPCNjGQU6SlkYxLgYZMUUWbZ43b//I3NZlv39u90wc1iZQIYwcHEKwER6ZRj+pxyI2qZxo/+e
 251q+0TL43Gbiv+cz98qHlsTceY/F9fhNEaGB0c6Om/eM6qXqeS0czimH96iXvi/mJvxi4rj3dc
 +fwW5ATFhTA8=
X-Developer-Key: i=me@kloenk.dev; a=openpgp;
 fpr=B44ADFDFF869A66A3FDFDD8B8609A7B519E5E342

Move the helper functions `offset_valid`, `io_addr` and
`io_addr_asset` from `Io` to `IoRaw`. This allows `IoRaw` to be reused
if other abstractions with different write/read functions are
needed (e.g. `writeb` vs `iowrite` vs `outb`).

Make this functions public as well so they can be used from other
modules if you aquire a `IoRaw`.

Signed-off-by: Fiona Behrens <me@kloenk.dev>
---
 rust/kernel/io.rs | 98 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 63 insertions(+), 35 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index d4a73e52e3ee68f7b558749ed0108acde92ae5fe..a6d026f458608626113fd194ee5a8616b4ef76fe 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -15,6 +15,11 @@
 /// Instead, the bus specific MMIO implementation must convert this raw representation into an `Io`
 /// instance providing the actual memory accessors. Only by the conversion into an `Io` structure
 /// any guarantees are given.
+///
+/// # Invariant
+///
+/// `addr` plus `maxsize` has to fit in memory (smaller than [`usize::MAX`])
+/// and `maxsize` has to be smaller or equal to `SIZE`.
 pub struct IoRaw<const SIZE: usize = 0> {
     addr: usize,
     maxsize: usize,
@@ -23,7 +28,7 @@ pub struct IoRaw<const SIZE: usize = 0> {
 impl<const SIZE: usize> IoRaw<SIZE> {
     /// Returns a new `IoRaw` instance on success, an error otherwise.
     pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
-        if maxsize < SIZE {
+        if maxsize < SIZE || addr.checked_add(maxsize).is_none() {
             return Err(EINVAL);
         }
 
@@ -32,15 +37,66 @@ pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
 
     /// Returns the base address of the MMIO region.
     #[inline]
-    pub fn addr(&self) -> usize {
+    pub const fn addr(&self) -> usize {
         self.addr
     }
 
     /// Returns the maximum size of the MMIO region.
     #[inline]
-    pub fn maxsize(&self) -> usize {
+    pub const fn maxsize(&self) -> usize {
         self.maxsize
     }
+
+    /// Check if the offset plus the size of the type `U` fits in the bounds of `size`.
+    /// Also checks if the offset is aligned with the type size.
+    #[inline]
+    pub const fn offset_valid<U>(offset: usize, size: usize) -> bool {
+        let type_size = core::mem::size_of::<U>();
+        if let Some(end) = offset.checked_add(type_size) {
+            end <= size && offset % type_size == 0
+        } else {
+            false
+        }
+    }
+
+    /// Check if the offset (plus the type size) is out of bounds.
+    ///
+    /// Runtime checked version of [`io_addr_assert`].
+    ///
+    /// See [`offset_valid`] for the performed offset check.
+    ///
+    /// # Errors
+    ///
+    /// Returns [`EINVAL`] if the type does not fit into [`IoRaw`] at the given offset.
+    ///
+    /// [`offset_valid`]: Self::offset_valid
+    /// [`io_addr_assert`]: Self::io_addr_assert
+    #[inline]
+    pub fn io_addr<U>(&self, offset: usize) -> Result<usize> {
+        if !Self::offset_valid::<U>(offset, self.maxsize()) {
+            return Err(EINVAL);
+        }
+
+        // Probably no need to check, since the safety requirements of `Self::new` guarantee that
+        // this can't overflow.
+        self.addr().checked_add(offset).ok_or(EINVAL)
+    }
+
+    /// Check at build time if the offset (plus the type size) is out of bounds.
+    ///
+    /// Compiletime checked version of [`io_addr`].
+    ///
+    /// See [`offset_valid`] for the performed offset check.
+    ///
+    ///
+    /// [`offset_valid`]: Self::offset_valid
+    /// [`io_addr`]: Self::io_addr
+    #[inline]
+    pub const fn io_addr_assert<U>(&self, offset: usize) -> usize {
+        build_assert!(Self::offset_valid::<U>(offset, SIZE));
+
+        self.addr() + offset
+    }
 }
 
 /// IO-mapped memory, starting at the base address @addr and spanning @maxlen bytes.
@@ -116,7 +172,7 @@ macro_rules! define_read {
         $(#[$attr])*
         #[inline]
         pub fn $name(&self, offset: usize) -> $type_name {
-            let addr = self.io_addr_assert::<$type_name>(offset);
+            let addr = self.0.io_addr_assert::<$type_name>(offset);
 
             // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
             unsafe { bindings::$name(addr as _) }
@@ -128,7 +184,7 @@ pub fn $name(&self, offset: usize) -> $type_name {
         /// out of bounds.
         $(#[$attr])*
         pub fn $try_name(&self, offset: usize) -> Result<$type_name> {
-            let addr = self.io_addr::<$type_name>(offset)?;
+            let addr = self.0.io_addr::<$type_name>(offset)?;
 
             // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
             Ok(unsafe { bindings::$name(addr as _) })
@@ -145,7 +201,7 @@ macro_rules! define_write {
         $(#[$attr])*
         #[inline]
         pub fn $name(&self, value: $type_name, offset: usize) {
-            let addr = self.io_addr_assert::<$type_name>(offset);
+            let addr = self.0.io_addr_assert::<$type_name>(offset);
 
             // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
             unsafe { bindings::$name(value, addr as _, ) }
@@ -157,7 +213,7 @@ pub fn $name(&self, value: $type_name, offset: usize) {
         /// out of bounds.
         $(#[$attr])*
         pub fn $try_name(&self, value: $type_name, offset: usize) -> Result {
-            let addr = self.io_addr::<$type_name>(offset)?;
+            let addr = self.0.io_addr::<$type_name>(offset)?;
 
             // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
             unsafe { bindings::$name(value, addr as _) }
@@ -190,34 +246,6 @@ pub fn maxsize(&self) -> usize {
         self.0.maxsize()
     }
 
-    #[inline]
-    const fn offset_valid<U>(offset: usize, size: usize) -> bool {
-        let type_size = core::mem::size_of::<U>();
-        if let Some(end) = offset.checked_add(type_size) {
-            end <= size && offset % type_size == 0
-        } else {
-            false
-        }
-    }
-
-    #[inline]
-    fn io_addr<U>(&self, offset: usize) -> Result<usize> {
-        if !Self::offset_valid::<U>(offset, self.maxsize()) {
-            return Err(EINVAL);
-        }
-
-        // Probably no need to check, since the safety requirements of `Self::new` guarantee that
-        // this can't overflow.
-        self.addr().checked_add(offset).ok_or(EINVAL)
-    }
-
-    #[inline]
-    fn io_addr_assert<U>(&self, offset: usize) -> usize {
-        build_assert!(Self::offset_valid::<U>(offset, SIZE));
-
-        self.addr() + offset
-    }
-
     define_read!(readb, try_readb, u8);
     define_read!(readw, try_readw, u16);
     define_read!(readl, try_readl, u32);

---
base-commit: 01b3cb620815fc3feb90ee117d9445a5b608a9f7
change-id: 20250122-rust-io-offset-7b39b11e84ac

Best regards,
-- 
Fiona Behrens <me@kloenk.dev>

