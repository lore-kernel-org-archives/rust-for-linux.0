Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC43A3E73
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 04:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782190476; cv=none; b=tp4uDz9k/entH8P53N1ln2ljQDlLJGtGGzxtuWyTH7f7gnsbWIAWsSXcBGie24jzeIsqX+eq9IanT59r+4dC0ibG2SlndxfidzD9ocnchjNmZYtiTGffoDb5BBwB/U9tMCD1FDvGurG6xr+iMG145B6yys7TBMFRlH0ZyeEl+vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782190476; c=relaxed/simple;
	bh=6g8qUc8FCq1CnK+XKm/AncchNHM3Qel/DID7TCn/4dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyLAN9CbArUDZqsTY65G8YcsuFVtoybRtNvBwOHVLOiWm4ykmHhVilIdggkxJbJTI7ca5QXnmoYisrvAHpFW1/m/1AeT0tQBIdzvdH+juQvl0QbbnJeITB/vspxxIJWFsHtfKkT/WLEBZ0NH/GqcaCpkeuJOvd1RA65iWbWUMQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XB1zH3S7; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XB1zH3S7"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37cae11ba85so3697949a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jun 2026 21:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782190474; x=1782795274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ukv3JrrvOYdolrSr5/I1MGzSjkItvq535Qfo/fGV5j4=;
        b=XB1zH3S7gb35GpxbJVMMQjUQof/gdP1PfQjf2m6u9qIVnOqBlX+dXkVWcHfZbA78T7
         VnVeGhJYAlhHa5VrshtAI4HOMjAL/Y5HRjy1EMOMoIVG1JkxhoLo8EGk6Ofbeg+Uodke
         h6z1tnws1xanNv6n02ngborA9Pm41JBF2sk9Merfl+T9b1S+25Z02FwBDQQhGTHiv+iY
         uFBxsb6e39jQn2eSFKt3gIWuywXxoGH91QLMYxvvpbhkP4pSrM8maUd1hy/1D9OffJUh
         wxQsBBsrzmLm0pEfBSTJruLqAI/OqpukMuRJTImWZiMWjju7JT5dsSeBFryJoGxTcx/9
         kEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782190474; x=1782795274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ukv3JrrvOYdolrSr5/I1MGzSjkItvq535Qfo/fGV5j4=;
        b=s+rxcJQWe/8uKxzNJAOO2q/SrwYf2n2w/eVXWstKCrghYcvfcHsPj8co7vzSWT/xim
         WSUTvMbcMc3inSovar4uG8MdZl7DfareyywtkYOS+PzIHdZSzkDfyHwGdoNzv+FTPQSH
         1mb1r8fbChQm097D9oFiG3ElvnA4Ulq+89gHdP5tNXppzeiTanJQ7NyRR2DJ4nAchupm
         V9V+tA1qgUsQMRV/d8HDi5/Tjvm6UrChIFa7OfNvymjytVTUvegTSSZ+ibBJTAMHuBe9
         nqvrR4DqQyqCczccrhQDFfbmnToYa8qSEBJzgFrfwf9WwCdkR1J+rwFF1aagRQH/ZnDf
         iWWw==
X-Forwarded-Encrypted: i=1; AHgh+RqL4eZSsbrX/NNDigIO22KqHE2fMOfVnJ1Yw8xTHTRliH3NR/PM6PXnu9bQviLw7vdE+8E2IRrRAXcZSC9nEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHeYBw23ElM2jeN9PvL3MkfQUvz++BBm3B1PFqh/9j9u2TqAJ1
	t6fOB5ZMySyW9iVoVT0OPljfHhPTZQeH0QYw49bqfL3dOpfX2j1Z4mT/
X-Gm-Gg: AfdE7cndTYV28R5BHa/D/ATKstVI6HyvMXLR07LPjlbbhwpzAoHqnsii+qhuRQNLrUw
	T2BSU5wEQsFfztr2mF3mOyniUpXB2VxgyCro6Jg22IbRDaUBU/xPXHe0e4wn9N5SM2QSZE0mRWu
	T8oR/R1UqatxsGTiab0FngdL74qTUMw52vVBa7Tw2o2f4QvdmiAxuAC9IF9iYJessbwijEV3Y09
	uCI81pX96Sf0mzxWAhT8pi1uNdf2iun6SU7VQp7EMjkgU9M21j5y+eZJCfaosBqt0d9lnwMtzoA
	z5L4Cd6ftgPtIDxx3oXlNtI7ncCXzFz+ns1iwcgq0NB3X+1HzPljfD+bJzLEOvUryKUR9PkEZva
	psSbNSUpRp+e8KiYK+c9tLKJt5LM4ylqdhZ66UbF4ESDk7oojl6960Ju9idTP+wFyH4bpOak7Wh
	yNexd6xpXsuoqf2UHK550F3vZso53idw==
X-Received: by 2002:a17:902:e547:b0:2ba:924b:3948 with SMTP id d9443c01a7336-2c718ee158dmr179781315ad.15.1782190474309;
        Mon, 22 Jun 2026 21:54:34 -0700 (PDT)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:13b2:851f:d9cb:44c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8cf0sm89734785ad.50.2026.06.22.21.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 21:54:33 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: akpm@linux-foundation.org,
	rust-for-linux@vger.kernel.org,
	linux-pci@vger.kernel.org,
	jic23@kernel.org,
	bhelgaas@google.com,
	lukas@wunner.de,
	alistair@alistair23.me,
	linux-cxl@vger.kernel.org,
	djbw@kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan.Cameron@huawei.com
Cc: alistair23@gmail.com,
	boqun.feng@gmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	wilfred.mallawa@wdc.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	tmgross@umich.edu
Subject: [PATCH v2 02/21] rust: create basic untrusted data API
Date: Tue, 23 Jun 2026 14:53:47 +1000
Message-ID: <20260623045406.2589547-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623045406.2589547-1-alistair.francis@wdc.com>
References: <20260623045406.2589547-1-alistair.francis@wdc.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benno Lossin <benno.lossin@proton.me>

When the kernel receives external data (e.g. from userspace), it usually
is a very bad idea to directly use the data for logic decision in the
kernel. For this reason, such data should be explicitly marked and
validated before making decision based on its value.

The `Untrusted<T>` wrapper type marks a value of type `T` as untrusted.
The particular meaning of "untrusted" highly depends on the type `T`.
For example `T = u8` ensures that the value of the byte cannot be
retrieved. However, `T = [u8]` still allows to access the length of the
slice. Similarly, `T = KVec<U>` allows modifications.

Signed-off-by: Benno Lossin <benno.lossin@proton.me>
Message-ID: <20250814124424.516191-3-lossin@kernel.org>
---
 rust/kernel/lib.rs      |   1 +
 rust/kernel/validate.rs | 148 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 rust/kernel/validate.rs

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 9512af7156df..af7a7558cde2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -134,6 +134,7 @@
 pub mod uaccess;
 #[cfg(CONFIG_USB = "y")]
 pub mod usb;
+pub mod validate;
 pub mod workqueue;
 pub mod xarray;
 
diff --git a/rust/kernel/validate.rs b/rust/kernel/validate.rs
new file mode 100644
index 000000000000..2b28625c25ef
--- /dev/null
+++ b/rust/kernel/validate.rs
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Untrusted data API.
+//!
+//! # Overview
+//!
+//! Untrusted data is marked using the [`Untrusted<T>`] type. See [Rationale](#rationale) for the
+//! reasons to mark untrusted data throughout the kernel. It is a totally opaque wrapper, it is not
+//! possible to read the data inside.
+//!
+//! APIs that write back into userspace usually allow writing untrusted bytes directly, allowing
+//! direct copying of untrusted user data back into userspace without validation.
+//!
+//! # Rationale
+//!
+//! When reading data from an untrusted source, it must be validated before it can be used for
+//! **logic**. For example, this is a very bad idea:
+//!
+//! ```
+//! # fn read_bytes_from_network() -> KBox<[u8]> {
+//! #     Box::new([1, 0], kernel::alloc::flags::GFP_KERNEL).unwrap()
+//! # }
+//! let bytes: KBox<[u8]> = read_bytes_from_network();
+//! let data_index = bytes[0];
+//! let data = bytes[usize::from(data_index)];
+//! ```
+//!
+//! While this will not lead to a memory violation (because the array index checks the bounds), it
+//! might result in a kernel panic. For this reason, all untrusted data must be wrapped in
+//! [`Untrusted<T>`]. This type only allows validating the data or passing it along, since copying
+//! data from userspace back into userspace is allowed for untrusted data.
+
+use core::ops::{Deref, DerefMut};
+
+use crate::{
+    alloc::{
+        Allocator,
+        Vec, //
+    },
+    transmute::{
+        cast_slice,
+        cast_slice_mut, //
+    },
+};
+
+/// Untrusted data of type `T`.
+///
+/// Data coming from userspace is considered untrusted and should be marked by this type.
+///
+/// The particular meaning of [`Untrusted<T>`] depends heavily on the type `T`. For example,
+/// `&Untrusted<[u8]>` is a reference to an untrusted slice. But the length is not considered
+/// untrusted, as it would otherwise violate normal Rust rules. For this reason, one can easily
+/// convert that reference to `&[Untrusted<u8>]`. Another such example is `Untrusted<KVec<T>>`, it
+/// derefs to `KVec<Untrusted<T>>`. Raw bytes however do not behave in this way, `Untrusted<u8>` is
+/// totally opaque.
+///
+/// # Usage in API Design
+///
+/// The exact location where to put [`Untrusted`] depends on the kind of API. When asking for an
+/// untrusted input value, or buffer to write to, always move the [`Untrusted`] wrapper as far
+/// inwards as possible:
+///
+/// ```ignore
+/// // use this
+/// pub fn read_from_userspace(buf: &mut [Untrusted<u8>]) { todo!() }
+///
+/// // and not this
+/// pub fn read_from_userspace(buf: &mut Untrusted<[u8]>) { todo!() }
+/// ```
+///
+/// The reason for this is that `&mut Untrusted<[u8]>` can beconverted into `&mut [Untrusted<u8>]`
+/// very easily, but the converse is not possible.
+///
+/// For the same reason, when returning untrusted data by-value, one should move the [`Untrusted`]
+/// wrapper as far outward as possible:
+///
+/// ```ignore
+/// // use this
+/// pub fn read_all_from_userspace() -> Untrusted<KVec<u8>> { todo!() }
+///
+/// // and not this
+/// pub fn read_all_from_userspace() -> KVec<Untrusted<u8>> { todo!() }
+/// ```
+///
+/// Here too the reason is that `KVec<Untrusted<u8>>` is more restrictive compared to
+/// `Untrusted<KVec<u8>>`.
+#[repr(transparent)]
+pub struct Untrusted<T: ?Sized>(T);
+
+impl<T: ?Sized> Untrusted<T> {
+    /// Marks the given value as untrusted.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::validate::Untrusted;
+    ///
+    /// # mod bindings { pub(crate) unsafe fn read_foo_info() -> [u8; 4] { todo!() } };
+    /// fn read_foo_info() -> Untrusted<[u8; 4]> {
+    ///     // SAFETY: just an FFI call without preconditions.
+    ///     Untrusted::new(unsafe { bindings::read_foo_info() })
+    /// }
+    /// ```
+    pub fn new(value: T) -> Self
+    where
+        T: Sized,
+    {
+        Self(value)
+    }
+}
+
+impl<T> Deref for Untrusted<[T]> {
+    type Target = [Untrusted<T>];
+
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: `Untrusted<T>` transparently wraps `T`.
+        unsafe { cast_slice(&self.0) }
+    }
+}
+
+impl<T> DerefMut for Untrusted<[T]> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        // SAFETY: `Untrusted<T>` transparently wraps `T`.
+        unsafe { cast_slice_mut(&mut self.0) }
+    }
+}
+
+impl<T, A: Allocator> Deref for Untrusted<Vec<T, A>> {
+    type Target = Vec<Untrusted<T>, A>;
+
+    fn deref(&self) -> &Self::Target {
+        let ptr: *const Untrusted<Vec<T, A>> = self;
+        // CAST: `Untrusted<T>` transparently wraps `T`.
+        let ptr: *const Vec<Untrusted<T>, A> = ptr.cast();
+        // SAFETY: `ptr` is derived from the reference `self`.
+        unsafe { &*ptr }
+    }
+}
+
+impl<T, A: Allocator> DerefMut for Untrusted<Vec<T, A>> {
+    fn deref_mut(&mut self) -> &mut Self::Target {
+        let ptr: *mut Untrusted<Vec<T, A>> = self;
+        // CAST: `Untrusted<T>` transparently wraps `T`.
+        let ptr: *mut Vec<Untrusted<T>, A> = ptr.cast();
+        // SAFETY: `ptr` is derived from the reference `self`.
+        unsafe { &mut *ptr }
+    }
+}
-- 
2.54.0

