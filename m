Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996CD48C3E3
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 11:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806046; cv=none; b=aYOvllqm8/xBHe1VdTgpn8D5moLwNxr6MPViU9ASMM4gTzAndAQ0CL6PS9x6Gv5mRNGBqKAqegaiN7GBvNSSL4qHaMfDEnYIRgF4m4X/2RYoecWt7DTtFcjafp5mRwE5ZLAwhcru27eSKvf+x2xCAK1ovnDpep7b3YXeWz1Ht4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806046; c=relaxed/simple;
	bh=qg2kWZvPlSbWNuKIgIh67XXUmjLFLlX5xpSn6IOlvcA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cLBXI4SSQFOAMW+MtfzczHtCWspgtdgkr/EaeRS85N6at0ZP0yfGne8EpSUAgDFKVcVM9M5N0+CF+z3xG4XS74EfPRpqlC6DOvnuGZSns2dG4qAL/5MMs+gc0bCN5ipEX98m8UkdQbWGBi+RCBdtB0bzMp2AruChnTb7ZiLrWWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=onGoc9nh; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="onGoc9nh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791806034; x=1792065234;
	bh=PrdO5L8pvJ0DBb3zbDMTPL8321B89dA6obo2DiA0aCI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=onGoc9nhF5/yiGQY0aaHiUyH3JhqJcm1IPg/3Irbeta5/4hxMyEqBIsKqS3+I/l6F
	 Q9mET/yEKMLpIdBdsKhu3dIJWESA+2opRKhxyq8KtOPQxC/sZ9o/ZDD9bMLbeVCcYx
	 KPy9JSj1Mn4CyJi2fH39yxZ6LUGatrHyqDaB0lXDu6PJa4/6Nuz3j6s35p9N/Y6BLu
	 /L9fkpz4rJw3Ay1urygTCak9ikd8RmYim0oLzdG+wqtTBLqDHsk3IPNIR2VaYIpoB2
	 nSbGJ+EYkvEQiS1x1WxuHE+ijZJznacfKY6JnlzIIjD27PSh29dT/NFxvHErFm+L99
	 j+gT7dHddKeWw==
Date: Mon, 12 Oct 2026 11:53:49 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
From: Lorenzo Delgado <lnsdev@proton.me>
Cc: Lorenzo Delgado <lnsdev@proton.me>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Subject: [PATCH 2/2] rust: uaccess: use NonEmpty in strcpy_into_buf()
Message-ID: <20261012-nonempty-slice-v1-2-37d1fecff82c@proton.me>
In-Reply-To: <20261012-nonempty-slice-v1-0-37d1fecff82c@proton.me>
References: <20261012-nonempty-slice-v1-0-37d1fecff82c@proton.me>
Feedback-ID: 53083996:user:proton
X-Pm-Message-ID: 4e875e24c75ded22800616ebaffd2938e2763405
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


