Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85D49B1E5;
	Wed, 14 Oct 2026 08:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966642; cv=none; b=BQyYN+bU0pWUgy82ZLxMYCo5zsc0KCSq+JG/M2/WmV/yDOjX3c6Y+VGHcc2Q7i5tiIKopwF3bHN46JQ5LdS3nirGhXSmOgfNQY4DBMy+shU9WdsUH6rgODgorW+RpsnLOueLSTVehpaTYFnYaiLyiaQh6CEi173iz0lEbUvdeRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966642; c=relaxed/simple;
	bh=Pd6hPfYOxhDoz6f8d83lF522bEeXBTN7VFKw/aLAgGo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TkaTITCjmFUzPXEiWEYDWqgDxt9PJQ/6fhnlHxQwKr21HI1aeEWfwtqNLD+oS+hhHTWG8XtNTLrDJ+9shm5xwc4xlReJKnpLDtXdrZusdlic2pzSUfmp0qbCAky78kM2pqUDSeQyw8YbyJ9FFsYLrYbG3Fp7+x2vUw4B3SbPFfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Z7rszobh; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Z7rszobh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791966633; x=1792225833;
	bh=xqfnnbza4W5QBgqcKoZ501uM3WgY3pys7WChvCB1Rtg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Z7rszobhRrUwLs2tsvBjRxl2IDhIZ3qFR4Z0+9aGvhdv7jq+q/miysnEkSSYklMM2
	 2lxYkeEej5zZA7BWSxf7uMrS9rskw1th9RRPNFomvYQQwUs7G/7I+kX1LjQ64LwFw4
	 Rl+Zg5HBc43KxF2Nnwj8o2Vxp62Nz5dk/5pOuA4K+Hyq0dxhgDp1v8pWQgdQkelhxT
	 t8ZoJJ13WF/LFJ+rX58V7IfqxmlegYyNBuX8aSI7RpyfsK7exn9k/+94AYCr8CWwqA
	 KQ6DGhTrIzxXdeferHCpBk0XV9sH+VR2JHcry4pnmozfr9nOwx6wP8k9Gf+in26FFF
	 VjPndsygRCQ3Q==
Date: Wed, 14 Oct 2026 08:30:28 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Subject: [PATCH v3 2/2] rust: uaccess: use NonEmpty in strcpy_into_buf()
Message-ID: <20261013-nonempty-slice-v3-2-4463cc0338f8@proton.me>
In-Reply-To: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: e51d3631fc60c352ed93c6f5aa244c43066a5455
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

`strcpy_into_buf()` returns `EINVAL` for an empty buffer and later
writes the NUL terminator through `last_mut().unwrap_unchecked()`,
relying on that earlier check.

Take the buffer as a `NonEmpty<[u8]>` instead, so the requirement is in
the signature. The `EINVAL` case goes away, and `last_mut()` returns
the element directly, which removes the `unsafe` block. There are no
callers to convert. A caller with an array buffer can pass it through
`NonEmpty::from_mut()` without a runtime check.

The `MaybeUninit` cast still starts from `[u8]`, so its SAFETY comment
does not depend on the layout of the wrapper.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DM0D9TERQAM3.2Y3HV6P68E2N8@gar=
yguo.net/
Link: https://github.com/Rust-for-Linux/linux/issues/1262
Signed-off-by: Lorenzo Delgado <lnsdev@proton.me>
---
 rust/kernel/uaccess.rs | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 5f6c4d7a1a51..1cc5c7580d3a 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -11,6 +11,7 @@
     error::Result,
     ffi::{c_char, c_void},
     fs::file,
+    non_empty::NonEmpty,
     prelude::*,
     ptr::KnownSize,
     transmute::{AsBytes, FromBytes},
@@ -383,20 +384,16 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec=
<u8, A>, flags: Flags) -> R
     /// Read a NUL-terminated string from userspace and return it.
     ///
     /// The string is read into `buf` and a NUL-terminator is added if the=
 end of `buf` is reached.
-    /// Since there must be space to add a NUL-terminator, the buffer must=
 not be empty. The
+    /// Since there must be space to add a NUL-terminator, `buf` is a [`No=
nEmpty`] slice. The
     /// returned `&CStr` points into `buf`.
     ///
     /// Fails with [`EFAULT`] if the read happens on a bad address (some d=
ata may have been
     /// copied).
     #[doc(alias =3D "strncpy_from_user")]
-    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'bu=
f CStr> {
-        if buf.is_empty() {
-            return Err(EINVAL);
-        }
-
+    pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut NonEmpty<[u8]>) -> R=
esult<&'buf CStr> {
         // SAFETY: The types are compatible and `strncpy_from_user` doesn'=
t write uninitialized
         // bytes to `buf`.
-        let mut dst =3D unsafe { &mut *(core::ptr::from_mut(buf) as *mut [=
MaybeUninit<u8>]) };
+        let mut dst =3D unsafe { &mut *(core::ptr::from_mut::<[u8]>(buf) a=
s *mut [MaybeUninit<u8>]) };
=20
         // We never read more than `self.length` bytes.
         if dst.len() > self.length {
@@ -422,9 +419,7 @@ pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8])=
 -> Result<&'buf CStr> {
             // This means that we filled the buffer exactly. In this case,=
 we add a NUL-terminator
             // and return it. Unlike the `len < dst.len()` branch, don't m=
odify `len` because it
             // already represents the length including the NUL-terminator.
-            //
-            // SAFETY: Due to the check at the beginning, the buffer is no=
t empty.
-            unsafe { *buf.last_mut().unwrap_unchecked() =3D 0 };
+            *buf.last_mut() =3D 0;
         }
=20
         // This method consumes `self`, so it can only be called once, thu=
s we do not need to

--=20
2.55.0


