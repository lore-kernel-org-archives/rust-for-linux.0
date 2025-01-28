Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F1319C54E;
	Tue, 28 Jan 2025 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738068377; cv=none; b=Evl1z5rfNvb67Qb6xnvWv19pxLr9kVXFQbEgiQhGl9lp+m+a5+HGFJwlNCqlohuJQ9qJzMrgiHjeHgsUsPiYUjL9LVorgPc65KeNgda6PVTW4GdFoBhnXJvtaM0QAfD3vyq9ol9J4DZjImQILsh5MyYc8EHc/B8hK1IGWMGz4BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738068377; c=relaxed/simple;
	bh=Dirfg2RCwDetyzBX3eKuY++hGWP+hMXFw6bK8y9el4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mFzE8hRCxo0/bdYV69Bn13L2gNahRpCEBijkkwN2YlycbOC6sAYPqa4ACFZAUZpuXgnXwE4q4saboGHL2PrOqSwIHqkKcyy/BIQYtqg49qaOKZVwYZo5L2jg3IspcqRdoIr3cK+fxfa3suXMFvt5bSfti6aSz2L40T8gF6dkXwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=qsiqSaf9; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="qsiqSaf9"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1738068370; bh=z4U1wS1oFuVXrD+vHluRQA/ZRiRPivC1iAVS78rS4iw=;
	h=From:Date:Subject:To:Cc;
	b=qsiqSaf9xB1z/2Q57QbzlWZz+TiYLsWfzT6pAecoqwV5rvn0i/vFhPmA2pGwpdb4q
	 7qmkvXPvu6bl5JDobD8BW/oO0o9NgaXpgkWK/VY3J8UuiO2xe1YF2kLYSLvOcMvSvp
	 /qbfr5JjPPcMAyAhhnELMImjaWazLJ0+aRTQ+n58=
Date: Tue, 28 Jan 2025 13:46:00 +0100
Subject: [PATCH v2] rust: io: move offset_valid and io_addr(_assert) to
 IoRaw
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-rust-io-offset-v2-1-222de7c96a34@kloenk.dev>
X-B4-Tracking: v=1; b=H4sIAIfRmGcC/3XMQQ6CMBCF4auQWTuGqTSIK+9hWBQ6lQmGmhYbD
 endrexd/i953waRg3CES7VB4CRR/FJCHSoYJ7PcGcWWBlUrXZNSGF5xRfHonYu8YjucuoGIz40
 ZoZyegZ28d/DWl54krj58dj/Rb/1LJULCjppWaTNozfY6Pzwv89Fygj7n/AVpuNoIrQAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7351; i=me@kloenk.dev;
 h=from:subject:message-id; bh=Dirfg2RCwDetyzBX3eKuY++hGWP+hMXFw6bK8y9el4A=;
 b=owJ4nJvAy8zAJdbGuXyr5NPHToyn1ZIY0mdc7E+texR8RN89IPZiT94hPx4ZO46se6beR313P
 XW26d03PbOjlIVBjItBVkyRZYvX/fs/Mpdl2d+/2w0zh5UJZAgDF6cATCT8GMN/p+NxPWWHHTj8
 XLRSzhbWN3Kttb0ZaJqw1nff7W8O6qcjGf4XH7vdkGix2cXpQEerLgebvP5W/bhlPv+umf4MEJ+
 eEsEMALYISkE=
X-Developer-Key: i=me@kloenk.dev; a=openpgp;
 fpr=B44ADFDFF869A66A3FDFDD8B8609A7B519E5E342

Move the helper functions `offset_valid`, `io_addr` and
`io_addr_asset` from `Io` to `IoRaw`. This allows `IoRaw` to be reused
if other abstractions with different write/read functions are
needed (e.g. `writeb` vs `iowrite` vs `outb`).

Signed-off-by: Fiona Behrens <me@kloenk.dev>
---
Changes in v2:
- make the io_addr functions private again
- reword the invariant description
- use the invariant (unchecked_add)
- Link to v1: https://lore.kernel.org/r/20250122-rust-io-offset-v1-1-914725ab55ed@kloenk.dev
---
 rust/kernel/io.rs | 99 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 64 insertions(+), 35 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index d4a73e52e3ee68f7b558749ed0108acde92ae5fe..c4dd8289705eacc93e285f4e25fb6262f605328c 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -15,6 +15,11 @@
 /// Instead, the bus specific MMIO implementation must convert this raw representation into an `Io`
 /// instance providing the actual memory accessors. Only by the conversion into an `Io` structure
 /// any guarantees are given.
+///
+/// # Invariant
+///
+/// - `maxsize` is larger or equal to `SIZE`.
+/// - `addr + maxsize` is always smaller then [`usize::MAX`] so that it fits in virtual memory.
 pub struct IoRaw<const SIZE: usize = 0> {
     addr: usize,
     maxsize: usize,
@@ -23,24 +28,76 @@ pub struct IoRaw<const SIZE: usize = 0> {
 impl<const SIZE: usize> IoRaw<SIZE> {
     /// Returns a new `IoRaw` instance on success, an error otherwise.
     pub fn new(addr: usize, maxsize: usize) -> Result<Self> {
-        if maxsize < SIZE {
+        if maxsize < SIZE || addr.checked_add(maxsize).is_none() {
             return Err(EINVAL);
         }
 
+        // INVARIANT: `maxsize` is at least `SIZE`, `addr + maxsize` is not wrapping.
         Ok(Self { addr, maxsize })
     }
 
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
+    const fn offset_valid<U>(offset: usize, size: usize) -> bool {
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
+    fn io_addr<U>(&self, offset: usize) -> Result<usize> {
+        if !Self::offset_valid::<U>(offset, self.maxsize()) {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: by the invariant of `IoRaw` this cannot overflow.
+        Ok(unsafe { self.addr().unchecked_add(offset) })
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
+    const fn io_addr_assert<U>(&self, offset: usize) -> usize {
+        build_assert!(Self::offset_valid::<U>(offset, SIZE));
+
+        // SAFETY: by the invariant of `IoRaw` this cannot overflow.
+        unsafe { self.addr().unchecked_add(offset) }
+    }
 }
 
 /// IO-mapped memory, starting at the base address @addr and spanning @maxlen bytes.
@@ -116,7 +173,7 @@ macro_rules! define_read {
         $(#[$attr])*
         #[inline]
         pub fn $name(&self, offset: usize) -> $type_name {
-            let addr = self.io_addr_assert::<$type_name>(offset);
+            let addr = self.0.io_addr_assert::<$type_name>(offset);
 
             // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
             unsafe { bindings::$name(addr as _) }
@@ -128,7 +185,7 @@ pub fn $name(&self, offset: usize) -> $type_name {
         /// out of bounds.
         $(#[$attr])*
         pub fn $try_name(&self, offset: usize) -> Result<$type_name> {
-            let addr = self.io_addr::<$type_name>(offset)?;
+            let addr = self.0.io_addr::<$type_name>(offset)?;
 
             // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
             Ok(unsafe { bindings::$name(addr as _) })
@@ -145,7 +202,7 @@ macro_rules! define_write {
         $(#[$attr])*
         #[inline]
         pub fn $name(&self, value: $type_name, offset: usize) {
-            let addr = self.io_addr_assert::<$type_name>(offset);
+            let addr = self.0.io_addr_assert::<$type_name>(offset);
 
             // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
             unsafe { bindings::$name(value, addr as _, ) }
@@ -157,7 +214,7 @@ pub fn $name(&self, value: $type_name, offset: usize) {
         /// out of bounds.
         $(#[$attr])*
         pub fn $try_name(&self, value: $type_name, offset: usize) -> Result {
-            let addr = self.io_addr::<$type_name>(offset)?;
+            let addr = self.0.io_addr::<$type_name>(offset)?;
 
             // SAFETY: By the type invariant `addr` is a valid address for MMIO operations.
             unsafe { bindings::$name(value, addr as _) }
@@ -190,34 +247,6 @@ pub fn maxsize(&self) -> usize {
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

