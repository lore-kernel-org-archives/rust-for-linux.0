Received: from mail-244122.protonmail.ch (mail-244122.protonmail.ch [109.224.244.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E1E474258
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 11:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805608; cv=none; b=Iu1gwAYzkNRaGdqu6Y9kuXdA42yfgIiiiweb/vyM/mkJhcz6EJk168J283bBSzbXzlSOXjZCPoXNo0dumz84g4NZ1uGYV+/3QIWiexdGQzRmy0rdygpiaUwPOaRHoAd07un+TI9yITQV0LjroHr7SX80mzThsP48DWDckQ2tIuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805608; c=relaxed/simple;
	bh=qg2kWZvPlSbWNuKIgIh67XXUmjLFLlX5xpSn6IOlvcA=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ky3svmfSBBbBjcvoZJjHbE4O3yFvG1DeorM4Cr19YOGXb3ATyB6UXZGI1lghHgVcl8U7vUPlg5qbV4hMyrAP+izlK2toMXy8Fvkh7N9rxYh8FJvBXDKqkzYPVKpDqfjnMI8aLncojVAnmT18+LuSqGuo3NDrKS2iIRE8oSE3juA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=hVXJmfxj; arc=none smtp.client-ip=109.224.244.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="hVXJmfxj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791805594; x=1792064794;
	bh=PrdO5L8pvJ0DBb3zbDMTPL8321B89dA6obo2DiA0aCI=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hVXJmfxjvANV3nXfWOZnaMHF8Vg3E9nymB2HdTPFznYr+C7IGdnj83dA7pW+sSx02
	 La+7y0Ui92ZEHVP4EfW6YgLYkUJyEfgbOWVyJYfT1LMhCod9x/s7JM0I//SeYPP7di
	 g7R7czXYh91XaYRDYB3ltQZouhUeksdPzzGYXMUJKlUOWpqrdlKtxdzKo2Hz3Dg/to
	 Jv+qbbtBvHEFPcXUj868/ip9U7qwKLqnDjYTTiFKpOzwqhD2Rm3uMSZrk7TpRA/NiD
	 s6GI2qZuCPj/jHAay6D3j80i3j/sivC1a07ADtGX1+4A9hHedjmjgRbtRu9RUwyoDx
	 AgmzypvvK4kyw==
Date: Mon, 12 Oct 2026 11:46:30 +0000
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>, Lorenzo Delgado <lnsdev@proton.me>
Subject: [PATCH 2/2] rust: uaccess: use NonEmpty in strcpy_into_buf()
Message-ID: <20261012-nonempty-slice-v1-2-4a15dee398dd@proton.me>
In-Reply-To: <20261012-nonempty-slice-v1-0-4a15dee398dd@proton.me>
References: <20261012-nonempty-slice-v1-0-4a15dee398dd@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: 57759cb844c5fc63bc054c2e0881f1d5dfe8c3c9
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

Turn the buffer into a `NonEmpty<[u8]>` at the start instead. The
emptiness check and its `EINVAL` stay the same, but `last_mut()` now
returns the element directly, so the `unsafe` block goes away.

The `MaybeUninit` cast still starts from `[u8]`, so its SAFETY comment
does not depend on the layout of the wrapper.

Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DM0D9TERQAM3.2Y3HV6P68E2N8@gar=
yguo.net/
Link: https://github.com/Rust-for-Linux/linux/issues/1262
Signed-off-by: Lorenzo Delgado <lnsdev@proton.me>
---
 rust/kernel/uaccess.rs | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index 5f6c4d7a1a51..044c20e87ee6 100644
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
@@ -390,13 +391,11 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec=
<u8, A>, flags: Flags) -> R
     /// copied).
     #[doc(alias =3D "strncpy_from_user")]
     pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8]) -> Result<&'bu=
f CStr> {
-        if buf.is_empty() {
-            return Err(EINVAL);
-        }
+        let buf =3D NonEmpty::try_from_mut(buf).ok_or(EINVAL)?;
=20
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
@@ -422,9 +421,7 @@ pub fn strcpy_into_buf<'buf>(self, buf: &'buf mut [u8])=
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


