Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D22D4A206F
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966635; cv=none; b=EfnCdl4P0nGmVIOwuZRfPGqXKrXM9d1KKwjWATvKhpJRVHBE9L8G7MpKi9XW7jBIxMhhXv5hWQpFoFDOdHvqq8GCWTuOkABw7LWkwk+W/0tLm5sMPBNKhTg2U7072ObYbmn0oxnVYeLdaFSOjRKb6Ss9Bq9EvC/hc/U7melFMDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966635; c=relaxed/simple;
	bh=CRGNd6AdWngmPVn+rLpuSNpTPHNgmS3ELwk6FAQt0eY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LHXNlKkbdg+NTBNgV4PznAOQDFXZft9thrS/Cuu2A/IneUdjPI0lNaNWFjkfhCZyBwLiq/HwnxWLw2aHCxYkQGDrBi/EUiuMrlymHazM8tT4LeSQES3ZIlFziwSyoqu8lkDec7Vh/+iOy0OlfW8jSEcOFZiuZS5TqwuOxXSYIOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mcRu5AtZ; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mcRu5AtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ffmdeeo6nbeerhetyg45nvglyu.protonmail2; t=1791966628;
	x=1792225828; bh=zS13lC//sDJzv9LZnZcLr3nqKd1FhOddrZQrqYGzasM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mcRu5AtZVw1HX2hAGHR22wAuZwRJ6KoXJt+60OSGNKn12fMcbvljI/aBnptiqMu/I
	 T3BPiUNE1KZpZseOZjvndBqE+O2tPgHVd65bwU3gAYoqFDPhbNpan6Z4WXOInMtLw0
	 mBmR2+qIhBVrOk8SnFWuhbyMpDrFjZEQ6GczfgD4e8j+V6ghcp9GevxacR3Zp/ZHKB
	 FkkGXUr3MSWGzTK+P0LyqFvUzhkKM4eRsL6IgbhDazLZfN+NhQMZdrftALDQb4GC1J
	 gXNQ2uiSO5r7bncy/c1nUj6CGDrESyM0f6PgHKlF4h29OUxG7LeA97N6GoyND1c8ZM
	 lL0ddoRWaxooA==
Date: Wed, 14 Oct 2026 08:30:22 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Subject: [PATCH v3 1/2] rust: non_empty: add NonEmpty
Message-ID: <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me>
In-Reply-To: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: aee2185bc7cab387a35f3d0868002dca655f3fb9
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some functions reject an empty container up front and later rely on it
having at least one element. The type system does not see that check,
so the later access ends up as an `unwrap_unchecked()` with a SAFETY
comment pointing back at it, or as an `unwrap()` or an error path that
can never be taken. `strcpy_into_buf()` in uaccess is one such case.

Add `NonEmpty<C>`, a transparent wrapper whose constructors check that
the container is not empty. It dereferences to the container, and a
method whose `Option` only exists for the empty case can be shadowed by
a version that returns the value directly.

`DerefMut` is implemented per container, only where a mutable reference
cannot change the length. For a growable container it would let
`clear()` break the invariant.

For now only slices and arrays are supported. A slice of unknown
length goes through `try_from_mut()`, which returns `None` if it is
empty. An array goes through `from_mut()`, which checks the length at
compile time instead of returning an `Option`. The resulting
`&mut NonEmpty<[T; N]>` coerces to `&mut NonEmpty<[T]>`, so a caller
with a fixed-size buffer needs no runtime check and no extra cast. The
only accessor is `last_mut()`, which uaccess needs. Other containers
and accessors can follow with their users.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DM0D9TERQAM3.2Y3HV6P68E2N8@gar=
yguo.net/
Link: https://github.com/Rust-for-Linux/linux/issues/1262
Signed-off-by: Lorenzo Delgado <lnsdev@proton.me>
---
 rust/kernel/lib.rs       |   1 +
 rust/kernel/non_empty.rs | 123 +++++++++++++++++++++++++++++++++++++++++++=
++++
 2 files changed, 124 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 7225abc64084..8e1928deac35 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -105,6 +105,7 @@
 pub mod module_param;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod non_empty;
 pub mod num;
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
diff --git a/rust/kernel/non_empty.rs b/rust/kernel/non_empty.rs
new file mode 100644
index 000000000000..5eec67a4f8a7
--- /dev/null
+++ b/rust/kernel/non_empty.rs
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Containers that are known not to be empty.
+
+use crate::build_assert::const_assert;
+use core::ops::{
+    Deref,
+    DerefMut, //
+};
+
+/// A container that can report whether it holds any element.
+///
+/// The result must not change while the container is only reachable throu=
gh a shared reference.
+///
+/// Unsafe code may only rely on the result for a container type whose imp=
lementation it trusts,
+/// such as the ones in this module, since a safe implementation can retur=
n anything.
+pub trait IsEmpty {
+    /// Returns `true` if the container holds no element.
+    fn is_empty(&self) -> bool;
+}
+
+impl<T> IsEmpty for [T] {
+    #[inline]
+    fn is_empty(&self) -> bool {
+        <[T]>::is_empty(self)
+    }
+}
+
+/// A container that holds at least one element.
+///
+/// [`NonEmpty`] dereferences to the container it wraps, so the container'=
s API stays available.
+/// Methods whose result is only optional because the container could be e=
mpty can be shadowed by
+/// versions that return the result directly. They are added as users need=
 them. For now that is
+/// only [`NonEmpty::last_mut`] on a slice, which returns `&mut T` instead=
 of `Option<&mut T>`.
+///
+/// # Invariants
+///
+/// The wrapped container is not empty. Unsafe code may rely on this only =
for arrays and for
+/// container types whose [`IsEmpty`] implementation is in this module.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::non_empty::NonEmpty;
+///
+/// let mut buf =3D [1u8, 2, 3];
+/// let slice: &mut NonEmpty<[u8]> =3D NonEmpty::from_mut(&mut buf);
+/// *slice.last_mut() =3D 0;
+/// assert_eq!(slice.len(), 3);
+/// assert_eq!(buf, [1, 2, 0]);
+///
+/// let mut buf =3D [1u8, 2, 3];
+/// let slice =3D NonEmpty::try_from_mut(&mut buf[..2]).ok_or(EINVAL)?;
+/// *slice.last_mut() =3D 0;
+/// assert_eq!(buf, [1, 0, 3]);
+///
+/// let mut empty: [u8; 0] =3D [];
+/// assert!(NonEmpty::try_from_mut(&mut empty[..]).is_none());
+/// # Ok::<(), Error>(())
+/// ```
+#[repr(transparent)]
+#[derive(Debug)]
+pub struct NonEmpty<C: ?Sized>(C);
+
+impl<C: ?Sized + IsEmpty> NonEmpty<C> {
+    /// Creates a [`NonEmpty`] from a mutable reference to a container, or=
 returns [`None`] if the
+    /// container is empty.
+    #[inline]
+    pub fn try_from_mut(container: &mut C) -> Option<&mut Self> {
+        if container.is_empty() {
+            return None;
+        }
+
+        // INVARIANT: `container` was checked to be non-empty above.
+        // SAFETY: `NonEmpty<C>` is transparent to `C`, so the cast keeps =
both the layout and the
+        // pointer metadata, and the pointer comes from a valid `&mut C` w=
ith the same lifetime.
+        Some(unsafe { &mut *(core::ptr::from_mut(container) as *mut Self) =
})
+    }
+}
+
+impl<T, const N: usize> NonEmpty<[T; N]> {
+    /// Creates a [`NonEmpty`] array from a mutable reference to an array.
+    ///
+    /// Unlike [`NonEmpty::try_from_mut`], this does not return an [`Optio=
n`]: the array length is
+    /// checked at compile time, and using it with an empty array is a bui=
ld error. The result
+    /// coerces to a [`NonEmpty`] slice, which is where its accessors are.
+    #[inline]
+    pub const fn from_mut(array: &mut [T; N]) -> &mut Self {
+        const_assert!(N > 0);
+
+        // INVARIANT: `array` has `N` elements, and `N > 0` was checked at=
 compile time.
+        // SAFETY: `NonEmpty<[T; N]>` is transparent to `[T; N]`, so the c=
ast keeps the layout, and
+        // the pointer comes from a valid `&mut [T; N]` with the same life=
time.
+        unsafe { &mut *core::ptr::from_mut(array).cast::<Self>() }
+    }
+}
+
+impl<T> NonEmpty<[T]> {
+    /// Returns a mutable reference to the last element of the slice.
+    #[inline]
+    pub fn last_mut(&mut self) -> &mut T {
+        // SAFETY: By the type invariant, the slice is not empty, so it ha=
s a last element.
+        unsafe { self.0.last_mut().unwrap_unchecked() }
+    }
+}
+
+impl<C: ?Sized> Deref for NonEmpty<C> {
+    type Target =3D C;
+
+    #[inline]
+    fn deref(&self) -> &C {
+        &self.0
+    }
+}
+
+// `DerefMut` is only sound for containers whose length cannot change thro=
ugh a mutable
+// reference. For a growable container such as `KVec`, `clear()` would emp=
ty it.
+impl<T> DerefMut for NonEmpty<[T]> {
+    #[inline]
+    fn deref_mut(&mut self) -> &mut [T] {
+        &mut self.0
+    }
+}

--=20
2.55.0


