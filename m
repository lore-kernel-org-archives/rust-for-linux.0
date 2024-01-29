Received: from a8-156.smtp-out.amazonses.com (a8-156.smtp-out.amazonses.com [54.240.8.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18A34CDE5
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 06:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.8.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706509143; cv=none; b=HssnLz0yt8hNTSaU27cnZOwTWQ2sVQb5li8sxp81Pj9+gtm877mxnHy/+2/MYxWIstlcbtGDlaea0UnXEeN9V9Uz4gQgXfgk49oGrBRFn4coBGGzIc7yoHwpHiZ3KRv+VVKioOY9311X+zHs2QDioK8tnhcjBo3PjkmpOvas8RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706509143; c=relaxed/simple;
	bh=kQmUYix/bL4a8QAMdhblVjpaVTqQqg2QbSxCdM99pcw=;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:References:
	 Message-ID; b=GLxczbhar1xKx9YyI8zgJGaKBqaGLoiMikQ6eMZWR5yYIDHuzGdBbPLGv+XMEvABxVgMZyUdXY7JDRlP4MBkznkkekcRd0r45eHEOo0O7OorkAgYtr++dl7TNfV42l1RkLOl8VpylbpfIUwnV/pubfNk5uyZyzwdSPYyModd/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b=Uxz6GadW; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=XlPnbnEs; arc=none smtp.client-ip=54.240.8.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b="Uxz6GadW";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="XlPnbnEs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ph73stw23v46e7miqo4f44bv344ybkbc; d=obei.io; t=1706509140;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=kQmUYix/bL4a8QAMdhblVjpaVTqQqg2QbSxCdM99pcw=;
	b=Uxz6GadW5JWTBA7uitDUJ7bRKEU7DNMEC/texK9foStJeH6Kj5JmTmRH2ttYYKof
	B236csyCBZXlJE5OgwQO74mWRgXZJ7X9cKFIAA6SFxy0Lt8k7afYszLVIuoW32d7JUw
	ONOEd0P8NHNTc9vbPLXYyEecCvsBhxDEmVbw2k/ddvvO3B5oNUT3eM9uJOes5evROiK
	zjzMJRm7JTzOTw1GjQi8qnbVvPtAaYISc8s0nCVa7AotoP194qotzfEzVU8P3xgGvdj
	m2X6RuUs6fpFatZHccbo4g9YvA06GdrYo95HNGNGGgPiLrTJs6QeCbql+WaHljeyNW+
	URvi/joX9Q==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1706509140;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=kQmUYix/bL4a8QAMdhblVjpaVTqQqg2QbSxCdM99pcw=;
	b=XlPnbnEsMA13EPcwLvl8Ie/Y4CCs+YsH7DBnkMGeOkqdvyZfBINsauk/VE+ePJTO
	O65HULc6xYVrTbYmVPriRZTjdX6FBLgv3zrPGiksh+Tzl0l2v9cHA9cSLnw1E0XkNqC
	PSUToHvXjfQvQ76cmcPP5yINsJjJJkabP63+3TkY=
Subject: [PATCH v5] rust: types: Add `try_from_foreign()` method
From: =?UTF-8?Q?Obei_Sideg?= <linux@obei.io>
To: =?UTF-8?Q?aliceryhl=40google=2Ecom?= <aliceryhl@google.com>
Cc: =?UTF-8?Q?a=2Ehindborg=40samsung=2Ecom?= <a.hindborg@samsung.com>, 
	=?UTF-8?Q?alex=2Egaynor=40gmail=2Ecom?= <alex.gaynor@gmail.com>, 
	=?UTF-8?Q?benno=2Elossin=40proton=2Eme?= <benno.lossin@proton.me>, 
	=?UTF-8?Q?bjorn3=5Fgh=40protonmail=2Ecom?= <bjorn3_gh@protonmail.com>, 
	=?UTF-8?Q?boqun=2Efeng=40gmail=2Ecom?= <boqun.feng@gmail.com>, 
	=?UTF-8?Q?gary=40garyguo=2Enet?= <gary@garyguo.net>, 
	=?UTF-8?Q?Obei_Sideg?= <linux@obei.io>, 
	=?UTF-8?Q?ojeda=40kernel=2Eorg?= <ojeda@kernel.org>, 
	=?UTF-8?Q?rust-for-linux=40vger=2Ekernel=2Eorg?= <rust-for-linux@vger.kernel.org>, 
	=?UTF-8?Q?wedsonaf=40gmail=2Ecom?= <wedsonaf@gmail.com>
Date: Mon, 29 Jan 2024 06:19:00 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <20240129061852.4469-1-linux@obei.io>
X-Mailer: Amazon WorkMail
Thread-Index: AQHaUnsLFQ/IojlfRkWErBf2/EiEfw==
Thread-Topic: [PATCH v5] rust: types: Add `try_from_foreign()` method
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1706509139
Message-ID: <0100018d53df01f6-18506de0-811f-45fb-83f0-d64ec8a9d594-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2024.01.29-54.240.8.156

Currently `ForeignOwnable::from_foreign()` only works for non-null=0D=0Ap=
ointers for the existing impls (e.g. Box, Arc). It may create a few=0D=0A=
duplicate code like:=0D=0A=0D=0A```rust=0D=0A// `p` is a maybe null point=
er=0D=0Aif p.is_null() {=0D=0A  None=0D=0A} else {=0D=0A  unsafe { Some(S=
elf::from_foreign(ptr)) }=0D=0A}=0D=0A```=0D=0A=0D=0AAdding a `try_from_f=
oreign()` method that will return `None` if `ptr`=0D=0Ais null, otherwsie=
 return `Some(from_foreign(ptr))`.=0D=0A=0D=0ALink: https://github.com/Ru=
st-for-Linux/linux/issues/1057=0D=0ASigned-off-by: Obei Sideg <linux@obei=
=2Eio>=0D=0AReviewed-by: Alice Ryhl <aliceryhl@google.com>=0D=0ASigned-of=
f-by: Obei Sideg <linux@obei.io>=0D=0A---=0D=0A rust/kernel/types.rs | 17=
 +++++++++++++++++=0D=0A 1 file changed, 17 insertions(+)=0D=0A=0D=0Adiff=
 --git a/rust/kernel/types.rs b/rust/kernel/types.rs=0D=0Aindex fdb778e65=
d79..04a356ec3534 100644=0D=0A--- a/rust/kernel/types.rs=0D=0A+++ b/rust/=
kernel/types.rs=0D=0A@@ -46,6 +46,23 @@ pub trait ForeignOwnable: Sized {=
=0D=0A     /// Additionally, all instances (if any) of values returned by=
 [`ForeignOwnable::borrow`] for=0D=0A     /// this object must have been =
dropped.=0D=0A     unsafe fn from_foreign(ptr: *const core::ffi::c_void) =
-> Self;=0D=0A+=0D=0A+    /// Tries to convert a foreign-owned object bac=
k to a Rust-owned one.=0D=0A+    ///=0D=0A+    /// A convenience wrapper =
over [`from_foreign`] that returns [`None`] if `ptr` is null.=0D=0A+    /=
//=0D=0A+    /// # Safety=0D=0A+    ///=0D=0A+    /// `ptr` must either b=
e null or satisfy the safety requirements for [`from_foreign`].=0D=0A+   =
 unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<Self=
> {=0D=0A+        if ptr.is_null() {=0D=0A+            None=0D=0A+       =
 } else {=0D=0A+            // SAFETY: The safety requirements of this fu=
nction ensure that `ptr` comes from a previous=0D=0A+            // call =
to [`into_foreign`].=0D=0A+            unsafe { Some(Self::from_foreign(p=
tr)) }=0D=0A+        }=0D=0A+    }=0D=0A }=0D=0A=20=0D=0A impl<T: 'static=
> ForeignOwnable for Box<T> {=0D=0A--=20=0D=0A2.39.2=0D=0A=0D=0A
