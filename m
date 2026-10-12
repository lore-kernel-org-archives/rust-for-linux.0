Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C22C488202;
	Mon, 12 Oct 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805602; cv=none; b=nUd440SB2mNZJQhvG7oEeJrVLDLcGqbpRApT2HIAfF/76KvEQgvmBxxwRHFZmot6lQw63AOsaiicVv2omYdl2+FgjEx700RUqvFpZYh5Wa8Th6BaYu3+FtW+gY6NkcnrBgS7uEHQQxBCGmYPmn3yshqMiNw1boFxRHQvAwnQf2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805602; c=relaxed/simple;
	bh=PROxAeNA0R+4J89U+DJA3SfuaEX+HBqaijRt1B3Ayag=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XJ9i1mjXsLGZG01WQH1xFnTzMPFBA13ZCbcar58E0zh2UISwfrD7s17RhCd384uWa5WL4CMcjoc9c0IdTtyN+Ogy8m46EXd1shBqTiVcSMXFHeF6vf50GFX4juNe1Iuhs4vo4eg5Rh5Xn85B4qRwSir+2R2rd699jeGCm2JtdZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=V/LACyna; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="V/LACyna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791805591; x=1792064791;
	bh=vTw89YlT0whyzA6zK9LMXUomrmb8QaDmVZwglxO7v+M=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=V/LACynawInQ4149eurH3+gBepSMcfcAr3toYvf3ARR5S+zSeXJIB2kptAR+ZLHMu
	 CRw+e04jq87SonaU/aBVE835uPjutlv+gKj5vKQcYEXiG5ZkZCzLNWN6gVFwA+e57A
	 tImJpKNzIEdHbSlZhGIEwtF+EbYFRGtR96P5kiVrrv/AnT22okYALAyZL7z+iEo7qZ
	 G0LK5nBPnt15CcSL+QixLjANjbHPYnsJulMLhUA3Q4PBTHzCjUeT7iKLDPrwWxsMuA
	 UUCo9wYqYaH3t5eJBTCDF1HZUT12odMz6vfsA1i48UA7A7d3kXyxwmUk7t3EqXfLoi
	 P2OM8+2Mm/Tfw==
Date: Mon, 12 Oct 2026 11:46:26 +0000
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>, Lorenzo Delgado <lnsdev@proton.me>
Subject: [PATCH 1/2] rust: non_empty: add NonEmpty
Message-ID: <20261012-nonempty-slice-v1-1-4a15dee398dd@proton.me>
In-Reply-To: <20261012-nonempty-slice-v1-0-4a15dee398dd@proton.me>
References: <20261012-nonempty-slice-v1-0-4a15dee398dd@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: b3df24088d4283db03e6029f07aee6bd6d4e0b0d
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

Add `NonEmpty<C>`, a transparent wrapper that can only be created from
a container its `IsEmpty` implementation reports as non-empty. It
dereferences to the container, and a method whose `Option` only exists
for the empty case can be shadowed by a version that returns the value
directly.

`DerefMut` is implemented per container, only where a mutable reference
cannot change the length. For a growable container it would let
`clear()` break the invariant.

For now only slices are supported, with the one constructor and
accessor that the uaccess conversion needs. Other containers and
accessors can follow with their users.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DM0D9TERQAM3.2Y3HV6P68E2N8@gar=
yguo.net/
Link: https://github.com/Rust-for-Linux/linux/issues/1262
Signed-off-by: Lorenzo Delgado <lnsdev@proton.me>
---
 rust/kernel/lib.rs       |   1 +
 rust/kernel/non_empty.rs | 100 +++++++++++++++++++++++++++++++++++++++++++=
++++
 2 files changed, 101 insertions(+)

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
index 000000000000..9617414f51f9
--- /dev/null
+++ b/rust/kernel/non_empty.rs
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Containers that are known not to be empty.
+
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
for container types
+/// whose [`IsEmpty`] implementation is in this module.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::non_empty::NonEmpty;
+///
+/// let mut buf =3D [1u8, 2, 3];
+/// let slice =3D NonEmpty::try_from_mut(&mut buf[..]).ok_or(EINVAL)?;
+/// *slice.last_mut() =3D 0;
+/// assert_eq!(slice.len(), 3);
+/// assert_eq!(buf, [1, 2, 0]);
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


