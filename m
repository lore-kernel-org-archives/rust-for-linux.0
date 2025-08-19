Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6156265606
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 22:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755644033; cv=none; b=TWq9zUzQLYS/A/C73vD4hZxTDgbb6GgWJuWQSC1oQ0isAkPCgoRrGt4eRrz2hdM4tQuuUQwRHzH4kYI9qJiGc3MJgkmjbQ06VmGB8yWtDIZuc4zFlZcedYQROZA5zpqJlgIsCAPtQbsrS7YOBWPsCdYOs33NoiU5TNWJ+pH+Jfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755644033; c=relaxed/simple;
	bh=LgVE70Exr9MebvQgLl2/p51njoOXYcatQNyOcdi3UNU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q7pGzH6K/bvYjutUnkd0I4MdmRsrY89C9+3xDxQud32xml3c8it2xQl/LocnBMqE9An7kb+fl2PgMbwEwBpsLxMRpGmgEeLjohaSpUDD/Gw7+ijY5g/lElj6wMFmQWX/pgjP0eIv1tpOu3y9ogkBb327E327juhpVKKxcHhQspY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c0hqOXTS; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c0hqOXTS"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-244581ce388so132082015ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Aug 2025 15:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755644031; x=1756248831; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRluY9LNozQ5/bivWkiW6p+82OL/8mCZ5RHLv0QIIwY=;
        b=c0hqOXTSc7A2QDFmOu483vRlcPPcKSaFo3+DmCr1dgv8Q9fEcWhVPq2yDkyR4W9I72
         IWMCRRF4kLsxd8N/IXPxDKoAO7WaDKEefYt9REv1uQ2OUQ6oTSoJJ1vDw1TrMPV0FLbz
         vIQ6pX4qC5bzRa5YwKLgZluTurR1HP5bjQCJVH4GI2oxCv97Z+p6waJC/lDv7YNV1Y22
         fYLJ6vjper+6tEgRETOIxWUx6JyFUEd7z0qEDse7hf48x7XDBQ8w/yRSjiWWAwVX139P
         t4Ip2im6VhXMqklqF7FuNzdCZy/m3OCXnECyNOnVUcMKn3N9mrw5dv/AfPyegsakyZZL
         PGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755644031; x=1756248831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRluY9LNozQ5/bivWkiW6p+82OL/8mCZ5RHLv0QIIwY=;
        b=nPFEWVPso5MwCaC2njW8DV0QK5t11Efqn547K43HPC4FX8L7BJ7pQsW8ksLPuuphCK
         uce1otnOXNU1N4sesNX9CzhWNuawinvNrXJiwX1T1Ohb1lnX8vAvD12U7doFs3LMl/yo
         4Qlh1GR5EY1Sd81rFANjJm9UmpvHob4I5t114VvRI+UufQ6LcyceUdt4NXx1A/poSNoV
         qoL0ihzh5Ufl9h5PlM/12YTOgJ78QVGGEVSPVpXhVnufOTxIUR9TOw9uaD73paDSc2qy
         laSAZm36LQKoDzacconIgupZKlwQQjSrfO9DZQJ6J+/59OyUI9LcUq9+42jn/RSF2GUZ
         AHfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVbZjqluPgn9yDu74RAgQXO7BBxCXM3fXUjtNVQBuex+4F2RQ0ozQVezS8ne25jbttynyFr3FMQW5eTGrDmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWxCyyonLyGoCMacr/1vacO157C8r5PwiAPsiXN4oGrGLoro+l
	1F/hDiCMTrGMK6fzp0uDyIL23uQKo2BT9TyjrfZCTOjsq1x8POr7y5pFK6CxKXh9LkQjTZ45RY9
	Lty76i7r+TA==
X-Google-Smtp-Source: AGHT+IGdrOzV7i91Ri5nCXJFbGeFIMcS2nMKO8t8GS8h0YIrL5C0k2wIG1zRldKx0LZr2bGqQFR3vvJw5JxL
X-Received: from plnq2.prod.google.com ([2002:a17:902:f782:b0:23f:c627:bd6d])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ced0:b0:242:9bbc:c773
 with SMTP id d9443c01a7336-245ef287c6amr7974025ad.54.1755644031091; Tue, 19
 Aug 2025 15:53:51 -0700 (PDT)
Date: Tue, 19 Aug 2025 22:53:39 +0000
In-Reply-To: <20250819-debugfs-rust-v10-0-86e20f3cf3bb@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250819-debugfs-rust-v10-0-86e20f3cf3bb@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755644022; l=10621;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=LgVE70Exr9MebvQgLl2/p51njoOXYcatQNyOcdi3UNU=; b=Uhz2yFwSTqO8EFH5FIStOa9+c28rNUOLUVBGjWtryQ8irg6IPrpQpKIsoUQGOAYwZS6VFJ7tD
 q8FYD/5jh8vD1NssjGlCBn82W0IzCoIyqO46pSdGDp6/IwNUfjHOROh
X-Mailer: b4 0.14.2
Message-ID: <20250819-debugfs-rust-v10-4-86e20f3cf3bb@google.com>
Subject: [PATCH v10 4/7] rust: debugfs: Add support for callback-based files
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, 
	Dirk Beheme <dirk.behme@de.bosch.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Extends the `debugfs` API to support creating files with content
generated and updated by callbacks. This is done via the
`read_callback_file`, `write_callback_file`, and
`read_write_callback_file` methods.

These methods allow for more flexible file definition, either because
the type already has a `Render` or `UpdateFromSlice` method that doesn't
do what you'd like, or because you cannot implement it (e.g. because
it's a type defined in another crate or a primitive type).

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs                   |  95 ++++++++++++++++++++++++
 rust/kernel/debugfs/callback_adapters.rs | 122 +++++++++++++++++++++++++++++++
 rust/kernel/debugfs/file_ops.rs          |   8 ++
 3 files changed, 225 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 62bc2b1d4e5a4b21441a09e03bff74c32c6781d2..a843d01506a54d5f8626dab5223d006c9a363a91 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -12,12 +12,16 @@
 use crate::str::CStr;
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
+use crate::uaccess::UserSliceReader;
+use core::fmt;
 use core::marker::PhantomPinned;
 use core::ops::Deref;
 
 mod traits;
 pub use traits::{Render, UpdateFromSlice};
 
+mod callback_adapters;
+use callback_adapters::{FormatAdapter, NoRender, WritableAdapter};
 mod file_ops;
 use file_ops::{FileOps, ReadFile, ReadWriteFile, WriteFile};
 #[cfg(CONFIG_DEBUG_FS)]
@@ -137,6 +141,48 @@ pub fn read_only_file<'a, T: Render + Send + Sync + 'static, E: 'a, TI: PinInit<
         self.create_file(name, data, file_ops)
     }
 
+    /// Creates a read-only file in this directory, with contents from a callback.
+    ///
+    /// `f` must be a function item or a non-capturing closure.
+    /// This is statically asserted and not a safety requirement.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use core::sync::atomic::{AtomicU32, Ordering};
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// # use kernel::prelude::*;
+    /// # let dir = Dir::new(c_str!("foo"));
+    /// let file = KBox::pin_init(
+    ///     dir.read_callback_file(c_str!("bar"),
+    ///     AtomicU32::new(3),
+    ///     &|val, f| {
+    ///       let out = val.load(Ordering::Relaxed);
+    ///       writeln!(f, "{out:#010x}")
+    ///     }),
+    ///     GFP_KERNEL)?;
+    /// // Reading "foo/bar" will show "0x00000003".
+    /// file.store(10, Ordering::Relaxed);
+    /// // Reading "foo/bar" will now show "0x0000000a".
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn read_callback_file<
+        'a,
+        T: Send + Sync + 'static,
+        E: 'a,
+        TI: PinInit<T, E> + 'a,
+        F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result + Send + Sync,
+    >(
+        &'a self,
+        name: &'a CStr,
+        data: TI,
+        _f: &'static F,
+    ) -> impl PinInit<File<T>, E> + 'a {
+        let file_ops = <FormatAdapter<T, F>>::FILE_OPS.adapt();
+        self.create_file(name, data, file_ops)
+    }
+
     /// Creates a read-write file in this directory.
     ///
     /// Reading the file uses the [`Render`] implementation.
@@ -155,6 +201,33 @@ pub fn read_write_file<
         self.create_file(name, data, file_ops)
     }
 
+    /// Creates a read-write file in this directory, with logic from callbacks.
+    ///
+    /// Reading from the file is handled by `f`. Writing to the file is handled by `w`.
+    ///
+    /// `f` and `w` must be function items or non-capturing closures.
+    /// This is statically asserted and not a safety requirement.
+    pub fn read_write_callback_file<
+        'a,
+        T: Send + Sync + 'static,
+        E: 'a,
+        TI: PinInit<T, E> + 'a,
+        F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result + Send + Sync,
+        W: Fn(&T, &mut UserSliceReader) -> Result<(), Error> + Send + Sync,
+    >(
+        &'a self,
+        name: &'a CStr,
+        data: TI,
+        _f: &'static F,
+        _w: &'static W,
+    ) -> impl PinInit<File<T>, E> + 'a {
+        let file_ops =
+            <WritableAdapter<FormatAdapter<T, F>, W> as file_ops::ReadWriteFile<_>>::FILE_OPS
+                .adapt()
+                .adapt();
+        self.create_file(name, data, file_ops)
+    }
+
     /// Creates a write-only file in this directory.
     ///
     /// The file owns its backing data. Writing to the file uses the [`UpdateFromSlice`]
@@ -173,6 +246,28 @@ pub fn write_only_file<
     ) -> impl PinInit<File<T>, E> + 'a {
         self.create_file(name, data, &T::FILE_OPS)
     }
+
+    /// Creates a write-only file in this directory, with write logic from a callback.
+    ///
+    /// `w` must be a function item or a non-capturing closure.
+    /// This is statically asserted and not a safety requirement.
+    pub fn write_callback_file<
+        'a,
+        T: Send + Sync + 'static,
+        E: 'a,
+        TI: PinInit<T, E> + 'a,
+        W: Fn(&T, &mut UserSliceReader) -> Result<(), Error> + Send + Sync,
+    >(
+        &'a self,
+        name: &'a CStr,
+        data: TI,
+        _w: &'static W,
+    ) -> impl PinInit<File<T>, E> + 'a {
+        let file_ops = <WritableAdapter<NoRender<T>, W> as WriteFile<_>>::FILE_OPS
+            .adapt()
+            .adapt();
+        self.create_file(name, data, file_ops)
+    }
 }
 
 #[pin_data]
diff --git a/rust/kernel/debugfs/callback_adapters.rs b/rust/kernel/debugfs/callback_adapters.rs
new file mode 100644
index 0000000000000000000000000000000000000000..1b6001306bf4efabf144cb24aa793e07ea8ac2fb
--- /dev/null
+++ b/rust/kernel/debugfs/callback_adapters.rs
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2025 Google LLC.
+
+//! Adapters which allow the user to supply a render or update implementation as a value rather
+//! than a trait implementation. If provided, it will override the trait implementation.
+
+use super::{Render, UpdateFromSlice};
+use crate::prelude::*;
+use crate::uaccess::UserSliceReader;
+use core::fmt;
+use core::fmt::Formatter;
+use core::marker::PhantomData;
+use core::ops::Deref;
+
+/// # Safety
+///
+/// To implement this trait, it must be safe to cast a `&Self` to a `&Inner`.
+/// It is intended for use in unstacking adapters out of `FileOps` backings.
+pub(crate) unsafe trait Adapter {
+    type Inner;
+}
+
+/// Adapter to implement `UpdateFromSlice` via a callback with the same representation as `T`.
+///
+/// * Layer it on top of `RenderAdapter` if you want to add a custom callback for `render`.
+/// * Layer it on top of `NoRender` to pass through any support present on the underlying type.
+///
+/// # Invariants
+///
+/// If an instance for `WritableAdapter<_, W>` is constructed, `W` is inhabited.
+#[repr(transparent)]
+pub(crate) struct WritableAdapter<D, W> {
+    inner: D,
+    _writer: PhantomData<W>,
+}
+
+// SAFETY: Stripping off the adapter only removes constraints
+unsafe impl<D, W> Adapter for WritableAdapter<D, W> {
+    type Inner = D;
+}
+
+impl<D: Render, W> Render for WritableAdapter<D, W> {
+    fn render(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
+        self.inner.render(fmt)
+    }
+}
+
+impl<D: Deref, W> UpdateFromSlice for WritableAdapter<D, W>
+where
+    W: Fn(&D::Target, &mut UserSliceReader) -> Result + Send + Sync + 'static,
+{
+    fn update_from_slice(&self, reader: &mut UserSliceReader) -> Result {
+        // SAFETY: WritableAdapter<_, W> can only be constructed if W is inhabited
+        let w: &W = unsafe { materialize_zst() };
+        w(self.inner.deref(), reader)
+    }
+}
+
+/// Adapter to implement `Render` via a callback with the same representation as `T`.
+///
+/// # Invariants
+///
+/// If an instance for `FormatAdapter<_, F>` is constructed, `F` is inhabited.
+#[repr(transparent)]
+pub(crate) struct FormatAdapter<D, F> {
+    inner: D,
+    _formatter: PhantomData<F>,
+}
+
+impl<D, F> Deref for FormatAdapter<D, F> {
+    type Target = D;
+    fn deref(&self) -> &D {
+        &self.inner
+    }
+}
+
+impl<D, F> Render for FormatAdapter<D, F>
+where
+    F: Fn(&D, &mut Formatter<'_>) -> fmt::Result + 'static,
+{
+    fn render(&self, fmt: &mut Formatter<'_>) -> fmt::Result {
+        // SAFETY: FormatAdapter<_, F> can only be constructed if F is inhabited
+        let f: &F = unsafe { materialize_zst() };
+        f(&self.inner, fmt)
+    }
+}
+
+// SAFETY: Stripping off the adapter only removes constraints
+unsafe impl<D, F> Adapter for FormatAdapter<D, F> {
+    type Inner = D;
+}
+
+#[repr(transparent)]
+pub(crate) struct NoRender<D> {
+    inner: D,
+}
+
+// SAFETY: Stripping off the adapter only removes constraints
+unsafe impl<D> Adapter for NoRender<D> {
+    type Inner = D;
+}
+
+impl<D> Deref for NoRender<D> {
+    type Target = D;
+    fn deref(&self) -> &D {
+        &self.inner
+    }
+}
+
+/// For types with a unique value, produce a static reference to it.
+///
+/// # Safety
+///
+/// The caller asserts that F is inhabited
+unsafe fn materialize_zst<F>() -> &'static F {
+    const { assert!(core::mem::size_of::<F>() == 0) };
+    let zst_dangle: core::ptr::NonNull<F> = core::ptr::NonNull::dangling();
+    // SAFETY: While the pointer is dangling, it is a dangling pointer to a ZST, based on the
+    // assertion above. The type is also inhabited, by the caller's assertion. This means
+    // we can materialize it.
+    unsafe { zst_dangle.as_ref() }
+}
diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index 30f6a0532c7f5f4a2974edc8f1100f5485aa8da9..d11c09520d4464417003362b7468c9b9e1a2e1bf 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -2,6 +2,7 @@
 // Copyright (C) 2025 Google LLC.
 
 use super::{Render, UpdateFromSlice};
+use crate::debugfs::callback_adapters::Adapter;
 use crate::prelude::*;
 use crate::seq_file::SeqFile;
 use crate::seq_print;
@@ -44,6 +45,13 @@ pub(crate) const fn mode(&self) -> u16 {
     }
 }
 
+impl<T: Adapter> FileOps<T> {
+    pub(super) const fn adapt(&self) -> &FileOps<T::Inner> {
+        // SAFETY: `Adapter` asserts that `T` can be legally cast to `T::Inner`.
+        unsafe { core::mem::transmute(self) }
+    }
+}
+
 #[cfg(CONFIG_DEBUG_FS)]
 impl<T> Deref for FileOps<T> {
     type Target = bindings::file_operations;

-- 
2.51.0.rc1.167.g924127e9c0-goog

