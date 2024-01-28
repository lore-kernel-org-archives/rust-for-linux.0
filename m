Received: from a11-123.smtp-out.amazonses.com (a11-123.smtp-out.amazonses.com [54.240.11.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10CC8F68
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Jan 2024 06:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.11.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706424968; cv=none; b=mv0Gu6tD092Jrz4Rg3+JF0qZPrQX8dSe2BkUBkYY/TnrUFBPH3PuZsxV95Xc4yviKDMTqO+NUyKe2ibsnsOdTXTrvBSPELsRabVSqm4NFUghGNluuNjqMWPNUuxEQeMEpULM7MleJOxcIJFni9f9vVL1Th5eE3GWzvl7kWpQHNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706424968; c=relaxed/simple;
	bh=pfvU5czETa1orXWAI5PaOi/GpH0o/cGr/6qscYptKVI=;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:References:
	 Message-ID; b=KVlD+FbOTAxNz0EyNYaahykfuaDcNW6KZ+DNdGS+O6jXNsbHiHp3qGdalnXIhQXCza7cnUJIZxTTqkvYySUkuBRU6xSIH0NpOwNKPHMLJbhlk9A7CjHCi9HcX/h0//HL2p/eNGHpzz0U02qGihNtEpQJVmsx4/IFSAWI3lVEwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b=ZrDIEY7z; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=a83qnR7l; arc=none smtp.client-ip=54.240.11.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b="ZrDIEY7z";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="a83qnR7l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ph73stw23v46e7miqo4f44bv344ybkbc; d=obei.io; t=1706424962;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=pfvU5czETa1orXWAI5PaOi/GpH0o/cGr/6qscYptKVI=;
	b=ZrDIEY7zzPdwbOAFgBGp5/bbh+UndmHTxKqoVU1YpvknhOnAIbYZdQpT3GphdoeK
	j8hFD49rjoIM079UyqdYKJViNUWUX/OTTOKDB3chKUSf+BM5sQdOOR4PBZj1d0y5VUk
	fed38fiCa3ObrAjL2OPYigLj7etC8h7VH+rmMvAxZIqsghe2Q1Vp7MeHu2wUWQuluwI
	0MVY6PEUh+EJuhgyVNs6H8jR1Wi4UgMtna4tIXG/B+jYSgluhTRcbpdk/B2yQZoAvOe
	qGdNiNwxYR4VmGgvbFe4Qjy8juqacotSs+/Pa25+hUMxWD1NzZp5OQMkK5KeU6Pw3Dv
	mTpk4icBqw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1706424962;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=pfvU5czETa1orXWAI5PaOi/GpH0o/cGr/6qscYptKVI=;
	b=a83qnR7lbBnXaBAQ1GNAPgyBb47qXKwdDiAxgQesyc0/O0fLdY876H+l7zjnzqYg
	6915Ox+2QR0JHRu9ORGOz4VjK3kSQc/oZnUKyqoX99Vs6SwU8gTi2GQ20BMIOiI/M8T
	wjh7SRjcK6CzhNva0a7uwMvWYkKCwFjE5d8BBd7w=
Subject: [PATCH v4] rust: types: Add `try_from_foreign()` method
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
Date: Sun, 28 Jan 2024 06:56:02 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <20240128065550.7373-1-linux@obei.io>
X-Mailer: Amazon WorkMail
Thread-Index: AQHaUbcNQXaEoLqAQ/uVhqu8zrljhA==
Thread-Topic: [PATCH v4] rust: types: Add `try_from_foreign()` method
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1706424961
Message-ID: <0100018d4eda8d8e-d2ed98c4-e663-4f2c-b3bd-29a26d12e042-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2024.01.28-54.240.11.123

Currently `ForeignOwnable::from_foreign()` only works for non-null=0D=0Ap=
ointers for the existing impls (e.g. Box, Arc). It may create a few=0D=0A=
duplicate code like:=0D=0A=0D=0A```rust=0D=0A// `p` is a maybe null point=
er=0D=0Aif p.is_null() {=0D=0A  None=0D=0A} else {=0D=0A  unsafe { Some(S=
elf::from_foreign(ptr)) }=0D=0A}=0D=0A```=0D=0A=0D=0AAdding a `try_from_f=
oreign()` method that will return null if `ptr`=0D=0Ais null, otherwsie r=
eturn `from_foreign(ptr)`.=0D=0A=0D=0ALink: https://github.com/Rust-for-L=
inux/linux/issues/1057=0D=0ASigned-off-by: Obei Sideg <linux@obei.io>=0D=0A=
Reviewed-by: Alice Ryhl <aliceryhl@google.com>=0D=0A---=0D=0A rust/kernel=
/types.rs | 17 +++++++++++++++++=0D=0A 1 file changed, 17 insertions(+)=0D=
=0A=0D=0Adiff --git a/rust/kernel/types.rs b/rust/kernel/types.rs=0D=0Ain=
dex fdb778e65d79..04a356ec3534 100644=0D=0A--- a/rust/kernel/types.rs=0D=0A=
+++ b/rust/kernel/types.rs=0D=0A@@ -46,6 +46,23 @@ pub trait ForeignOwnab=
le: Sized {=0D=0A     /// Additionally, all instances (if any) of values =
returned by [`ForeignOwnable::borrow`] for=0D=0A     /// this object must=
 have been dropped.=0D=0A     unsafe fn from_foreign(ptr: *const core::ff=
i::c_void) -> Self;=0D=0A+=0D=0A+    /// Tries to convert a foreign-owned=
 object back to a Rust-owned one.=0D=0A+    ///=0D=0A+    /// A convenien=
ce wrapper over [`from_foreign`] that returns [`None`] if `ptr` is null.=0D=
=0A+    ///=0D=0A+    /// # Safety=0D=0A+    ///=0D=0A+    /// `ptr` must=
 either be null or satisfy the safety requirements for [`from_foreign`].=0D=
=0A+    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Opti=
on<Self> {=0D=0A+        if ptr.is_null() {=0D=0A+            None=0D=0A+=
        } else {=0D=0A+            // SAFETY: The safety requirements of =
this function ensure that `ptr` comes from a previous=0D=0A+            /=
/ call to [`into_foreign`].=0D=0A+            unsafe { Some(Self::from_fo=
reign(ptr)) }=0D=0A+        }=0D=0A+    }=0D=0A }=0D=0A=20=0D=0A impl<T: =
'static> ForeignOwnable for Box<T> {=0D=0A--=20=0D=0A2.39.2=0D=0A=0D=0A
