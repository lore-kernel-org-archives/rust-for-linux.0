Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CCD2E1C63;
	Wed,  3 Dec 2025 22:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764800881; cv=none; b=ewqrDjB3kZ7lL/z8w8xPN14uPLDG5S3HEzMW9Th3lBRdNw6EBW+FiltEvKuqUOcGZHrmbkoGKXpNuhdthJGfkocGZFiVagjk8KnYX1gUUZNNcLLsRqS1wkztKzUHkkDJ1G1c9qB5M8PrzUUNsMp43K9yDf6s/2eegDrsABeKyQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764800881; c=relaxed/simple;
	bh=EgKnL1W+UwiuxsULarEIK2q/hy40ymVfLcMM6JgsJXE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HgzU+XeHCQNyZ6wLsoChldwvSND+EBykTH2IU3Zv0YP5+GvVIxDq52n2/98MS5wvYKA5jnpTQAyXeDY09u1mWEooX0kqgM5NrjapXhmZ1t/21O0KkpCpwVNeH0kXY2Vc+P21XkIXm50zYV0HKW6AMWaklWyC+ryIDQBkwQSOO7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxgpeGRO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxgpeGRO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5E1C4CEFB;
	Wed,  3 Dec 2025 22:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764800880;
	bh=EgKnL1W+UwiuxsULarEIK2q/hy40ymVfLcMM6JgsJXE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uxgpeGRO0E35cads8Sb1C6LbTBq2beLVcZrJTepd1N/mfJQVkyX0y+ylVd7KGVo1m
	 lxubBU4Pa2hJNr6ibK20oUK5OmggNdViFjSVgs2NFoe2lHCLIQSKc+vFUX2z7KTvCr
	 aP80CSQ3D6M69e7M/Yv8zlDUzxe9oiir9Z/vpwe7xZd+qAw9uAaKL8i/PeBu6jor5z
	 HOJzEkSIWY3znJqY0i5MBDjUyFmnAeqo4RwW84KXJI16vwnLHqgjqwdtTiLodfePmx
	 0LbFDywQYZSZ4nxHfHxg1Jmn7EHD52o6uHcDHJVi/BPA33lHl068MfFa8ciOg4zcum
	 3jP7FHgL0iOmQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 03 Dec 2025 23:26:40 +0100
Subject: [PATCH 10/10] rust: xarray: fix false positive lockdep warnings
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-xarray-entry-send-v1-10-9e5ffd5e3cf0@kernel.org>
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=15347;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=EgKnL1W+UwiuxsULarEIK2q/hy40ymVfLcMM6JgsJXE=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpMLkyFIRbHr52OBWfpO4IgzXeSFGVdYkVmVAlb
 2P8o6N6ngaJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaTC5MgAKCRDhuBo+eShj
 dz4LD/95g/PnD/dBq6jT0ZkAoTWQOu1tFHso+LdoBa1k96yPrxDemjaq409dpcxCw5SCztIavcT
 ZjwdwJ+HbFBNIgcYglK5pmZf2ImmWn3Isex5b9wkXOJ3Alj5SGXCBohGhj1P2ygAkKX/OO3UGVT
 vSsuit3CDxrZVUMVsqKJbJopfaujihdp41RHjv/EEUjl/HjD1I5ICYFzAFNG9V9MGEWmVF1Jfmn
 95zUhiaXmkb0dN2+8aH/NjVTlh+5IGgrREu4M5GfLCqx8hazQ8ju9D76ycC8Dbm47ZlJUzg0pdO
 Vs0GkYOkioRPuC8RgPhJJgzXzEeqL/H6QRoNoBvU+EROjqUJ75HyyIR2lxEvmgkX3taHqR3EL4O
 r0bguLdcnmtu632HCCl7ihzexs3ogd+hWk1JVeGz/pfDwAkoqUTIPMt+yTb0if/7+iBduDT7V3D
 rqE4cDftyzvBcxjTW62YCvEXMqQDMBKKbdrxD/W9wwsQ9uJ/3G7HHhgVgZ3kurrd5zj8E5swggz
 99MsQFJnQ5uG87lk2tTxZG6zOQPsfkdLT+SctYBklCDzrBI75zbYhjYWfDSuP20qmcYc38YjGah
 9i+a1MmXaIT+m8PuP9BpW0ou121Ng5j920mxZm6WiRDFt2kgvbf0eNPmyaCX63P4CaGaEZvlM4a
 HFAvRUrN1EEJGbg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Replace the `xa_init_flags` helper with direct initialization of XArray
structures using `__spin_lock_init`. This allows each XArray to have
its own lock class key for lockdep, preventing false positive warnings
about lock ordering violations.

Add a `new_xarray!` macro that automatically generates a unique lock
class key for each XArray instantiation site. The macro accepts an
optional name parameter and uses the `optional_name!` and
`static_lock_class!` macros to generate appropriate names and lock
classes.

Update the `XArray::new` method signature to accept explicit name and
lock class key parameters. This enables proper lockdep tracking while
maintaining flexibility for advanced use cases.

Remove `rust_helper_xa_init_flags` as it is now dead code.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/helpers/xarray.c       |  5 ---
 rust/kernel/xarray.rs       | 74 +++++++++++++++++++++++++++++++++------------
 rust/kernel/xarray/entry.rs | 55 ++++++++++++++++++---------------
 3 files changed, 86 insertions(+), 48 deletions(-)

diff --git a/rust/helpers/xarray.c b/rust/helpers/xarray.c
index 425a6cc494734..2852f63388eea 100644
--- a/rust/helpers/xarray.c
+++ b/rust/helpers/xarray.c
@@ -7,11 +7,6 @@ int rust_helper_xa_err(void *entry)
 	return xa_err(entry);
 }
 
-void rust_helper_xa_init_flags(struct xarray *xa, gfp_t flags)
-{
-	return xa_init_flags(xa, flags);
-}
-
 int rust_helper_xa_trylock(struct xarray *xa)
 {
 	return xa_trylock(xa);
diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
index a405f2b6fdcad..c393d4c01af2a 100644
--- a/rust/kernel/xarray.rs
+++ b/rust/kernel/xarray.rs
@@ -29,6 +29,8 @@
         Result, //
     },
     ffi::c_void,
+    str::CStr,
+    sync::LockClassKey,
     types::{
         ForeignOwnable,
         NotThreadSafe,
@@ -48,6 +50,19 @@
 
 mod preload;
 
+/// Creates a [`XArray`] initialiser with the given name and a newly-created lock class.
+///
+/// It uses the name if one is given, otherwise it generates one based on the file name and line
+/// number.
+#[macro_export]
+macro_rules! new_xarray {
+    ($kind:expr $(, $name:literal)? $(,)?) => {
+        $crate::xarray::XArray::new(
+            $kind, $crate::optional_name!($($name)?), $crate::static_lock_class!())
+    };
+}
+pub use new_xarray;
+
 /// An array which efficiently maps sparse integer indices to owned objects.
 ///
 /// This is similar to a [`crate::alloc::kvec::Vec<Option<T>>`], but more efficient when there are
@@ -62,9 +77,10 @@
 ///
 /// ```rust
 /// use kernel::alloc::KBox;
-/// use kernel::xarray::{AllocKind, XArray};
+/// use kernel::xarray::{new_xarray, AllocKind, XArray};
 ///
-/// let xa = KBox::pin_init(XArray::new(AllocKind::Alloc1), GFP_KERNEL)?;
+/// let xa: Pin<KBox<XArray<KBox<u32>>>> =
+///     KBox::pin_init(new_xarray!(AllocKind::Alloc1), GFP_KERNEL)?;
 ///
 /// let dead = KBox::new(0xdead, GFP_KERNEL)?;
 /// let beef = KBox::new(0xbeef, GFP_KERNEL)?;
@@ -124,7 +140,11 @@ pub enum AllocKind {
 
 impl<T: ForeignOwnable> XArray<T> {
     /// Creates a new initializer for this type.
-    pub fn new(kind: AllocKind) -> impl PinInit<Self> {
+    pub fn new(
+        kind: AllocKind,
+        name: &'static CStr,
+        key: Pin<&'static LockClassKey>,
+    ) -> impl PinInit<Self> {
         let flags = match kind {
             AllocKind::Alloc => bindings::XA_FLAGS_ALLOC,
             AllocKind::Alloc1 => bindings::XA_FLAGS_ALLOC1,
@@ -133,8 +153,14 @@ pub fn new(kind: AllocKind) -> impl PinInit<Self> {
             // SAFETY: `xa` is valid while the closure is called.
             //
             // INVARIANT: `xa` is initialized here to an empty, valid [`bindings::xarray`].
-            xa <- Opaque::ffi_init(|xa| unsafe {
-                bindings::xa_init_flags(xa, flags)
+            xa <- Opaque::ffi_init(|xa: *mut bindings::xarray| unsafe {
+                bindings::__spin_lock_init(
+                    &raw mut (*xa).xa_lock,
+                    name.as_ptr().cast(),
+                    key.as_ptr(),
+                );
+                (*xa).xa_flags = flags;
+                (*xa).xa_head = null_mut();
             }),
             _p: PhantomData,
         })
@@ -236,8 +262,12 @@ fn load(&self, index: usize) -> Option<NonNull<c_void>> {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{alloc::{flags::GFP_KERNEL, kbox::KBox}, xarray::{AllocKind, XArray}};
-    /// let xa = KBox::pin_init(XArray::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{
+    /// #     alloc::{flags::GFP_KERNEL, kbox::KBox},
+    /// #     xarray::{new_xarray, AllocKind, XArray},
+    /// # };
+    /// let xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     ///
     /// let mut guard = xa.lock();
     /// assert_eq!(guard.contains_index(42), false);
@@ -272,8 +302,9 @@ pub fn get_mut(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray, Entry}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// assert_eq!(guard.contains_index(42), false);
@@ -309,8 +340,9 @@ fn load_next(&self, index: usize) -> Option<(usize, NonNull<c_void>)> {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
@@ -339,8 +371,9 @@ pub fn find_next(&self, index: usize) -> Option<(usize, T::Borrowed<'_>)> {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
@@ -366,8 +399,9 @@ pub fn find_next_mut(&mut self, index: usize) -> Option<(usize, T::BorrowedMut<'
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// guard.store(10, KBox::new(10u32, GFP_KERNEL)?, GFP_KERNEL)?;
@@ -401,8 +435,9 @@ pub fn find_next_entry<'b>(&'b mut self, index: usize) -> Option<OccupiedEntry<'
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// guard.store(100, KBox::new(42u32, GFP_KERNEL)?, GFP_KERNEL)?;
@@ -505,8 +540,9 @@ pub fn store(
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// assert_eq!(guard.get(42), None);
diff --git a/rust/kernel/xarray/entry.rs b/rust/kernel/xarray/entry.rs
index 2d6ef4781f47d..6e370252309fc 100644
--- a/rust/kernel/xarray/entry.rs
+++ b/rust/kernel/xarray/entry.rs
@@ -26,8 +26,9 @@ impl<T: ForeignOwnable> Entry<'_, '_, T> {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray, Entry}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// let entry = guard.get_entry(42);
@@ -100,17 +101,17 @@ fn insert_internal(
     ///
     /// Returns a reference to the newly inserted value.
     ///
-    /// - This method will fail if the nodes on the path to the index
-    ///   represented by this entry are not present in the XArray and no memory
-    ///   is available via the `preload` argument.
+    /// - This method will fail if the nodes on the path to the index represented by this entry are
+    ///   not present in the XArray and no memory is available via the `preload` argument.
     /// - This method will not drop the XArray lock.
     ///
     ///
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray, Entry}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// assert_eq!(guard.get(42), None);
@@ -139,16 +140,16 @@ pub fn insert(
 
     /// Inserts a value and returns an occupied entry representing the newly inserted value.
     ///
-    /// - This method will fail if the nodes on the path to the index
-    ///   represented by this entry are not present in the XArray and no memory
-    ///   is available via the `preload` argument.
+    /// - This method will fail if the nodes on the path to the index represented by this entry are
+    ///   not present in the XArray and no memory is available via the `preload` argument.
     /// - This method will not drop the XArray lock.
     ///
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray, Entry}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// assert_eq!(guard.get(42), None);
@@ -182,8 +183,9 @@ pub fn insert_entry(
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray, Entry}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// assert_eq!(guard.get(42), None);
@@ -221,8 +223,9 @@ pub(crate) fn new(guard: &'b mut Guard<'a, T>, index: usize, ptr: NonNull<c_void
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray, Entry}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
@@ -266,8 +269,9 @@ pub fn remove(mut self) -> T {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray, Entry}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
@@ -287,8 +291,9 @@ pub fn index(&self) -> usize {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray, Entry}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
@@ -334,8 +339,9 @@ pub fn insert(&mut self, value: T) -> T {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray, Entry}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// guard.store(42, KBox::new(0x1337u32, GFP_KERNEL)?, GFP_KERNEL)?;
@@ -361,8 +367,9 @@ pub fn into_mut(self) -> T::BorrowedMut<'b> {
     /// # Examples
     ///
     /// ```
-    /// # use kernel::{prelude::*, xarray::{AllocKind, XArray, Entry}};
-    /// let mut xa = KBox::pin_init(XArray::<KBox<u32>>::new(AllocKind::Alloc), GFP_KERNEL)?;
+    /// # use kernel::{prelude::*, xarray::{new_xarray, AllocKind, XArray, Entry}};
+    /// let mut xa: Pin<KBox<XArray<KBox<u32>>>> =
+    ///     KBox::pin_init(new_xarray!(AllocKind::Alloc), GFP_KERNEL)?;
     /// let mut guard = xa.lock();
     ///
     /// guard.store(42, KBox::new(100u32, GFP_KERNEL)?, GFP_KERNEL)?;

-- 
2.51.2


