Received: from a8-21.smtp-out.amazonses.com (a8-21.smtp-out.amazonses.com [54.240.8.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CA454F9E
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.8.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705940770; cv=none; b=RWbesxij3Itc8GqFSOywWLk1JX9ayEeZhNgaJM2sBx8ohfJZEVA45YTHVPB8KKgHu+8IZRYSvPjiSTQ8He3ZKIvKG1HaxE6CjecaUFoCaoYQ2zOJJeaIWUEqC9PGVPkSvMuXFjwFCyEJ8aRp4OjGVyqwRnd6sgw5X9SzbiHXDH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705940770; c=relaxed/simple;
	bh=XMOULrrXHulJl80bstpyVvnZbNdOFm104lT8q/nwsjU=;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:References:
	 Message-ID; b=VRWXPpRTEqscE4PIg9HPRCWs61Y/T4N5Vw+fGwCkp7qa9RnK83VsvQc81odzAZZPUNvsjTQyXnWu+lDvop5tcq7YUb9CcrsufjCqryIt8ynGvQr9Nt5r8NMAAIv3GoW379uZDB+SE5+NnExAIHjVLc4fYJRivrWGx+pcwS53TWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b=ebA1Pr0K; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=E5MQmbbE; arc=none smtp.client-ip=54.240.8.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b="ebA1Pr0K";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="E5MQmbbE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ph73stw23v46e7miqo4f44bv344ybkbc; d=obei.io; t=1705940767;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=XMOULrrXHulJl80bstpyVvnZbNdOFm104lT8q/nwsjU=;
	b=ebA1Pr0KTVfkPOCuT0hctVkHDu8lB+0RRdHk8+xlYscoF5ZDTjc1zE9GNbYxbEkc
	Oa691KKeM5oBqNm5IDmbFrepkCmjN0VB8rq2N6FpyTHJB+6gAnPn3LmX06o2JULMf30
	Ae4ffAdQcb6DUcUhS8n1FfDQgFRIe0BvnCztThE0Xfn0ji9lyc4On/0pw8UybRcKv+y
	FA29WG/TPZokw3/2MAs/xu/Jj+3CWovovTRlRXsLPzUpkxEzdD8qon/EVDr1fnPE1Wh
	hjkgIJaObXktL8a13XQadwJKWCjKVXpnt8/q4vmdJArhROgaA3fBb8ejOaZf11S0kzE
	TP6z1OOQ5g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1705940767;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=XMOULrrXHulJl80bstpyVvnZbNdOFm104lT8q/nwsjU=;
	b=E5MQmbbEMGU5CbMT2kXElB+DlgzWGI+vs3AlFKVcu1oskT+nsViYbecbIsAoR1qT
	iXoPv7KXfO9V34vknkSs4qr67cai395KrNL5UXlLaWiq90xMS85eYumrCFwP0FY3pYN
	c6KSVNzKg9IagB3McTSJ7LvKsjWjZN51xBcTtTDw=
Subject: [PATCH] rust: types: Add `try_from_foreign()` method
From: =?UTF-8?Q?Obei_Sideg?= <linux@obei.io>
To: =?UTF-8?Q?Miguel_Ojeda?= <ojeda@kernel.org>, 
	=?UTF-8?Q?Alex_Gaynor?= <alex.gaynor@gmail.com>, 
	=?UTF-8?Q?Wedson_Almeida_Filho?= <wedsonaf@gmail.com>
Cc: =?UTF-8?Q?Boqun_Feng?= <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Gary_Guo?= <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	=?UTF-8?Q?Benno_Lossin?= <benno.lossin@proton.me>, 
	=?UTF-8?Q?Andreas_Hindborg?= <a.hindborg@samsung.com>, 
	=?UTF-8?Q?Alice_Ryhl?= <aliceryhl@google.com>, 
	=?UTF-8?Q?rust-for-linux=40vger=2Ekernel=2Eorg?= <rust-for-linux@vger.kernel.org>, 
	=?UTF-8?Q?Obei_Sideg?= <linux@obei.io>, 
	=?UTF-8?Q?Matt_Gilbride?= <mattgilbride@google.com>
Date: Mon, 22 Jan 2024 16:26:07 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <20240122162553.64610-1-linux@obei.io>
X-Mailer: Amazon WorkMail
Thread-Index: AQHaTU+yA3pDfoRdQ+SOv21WOzE3SA==
Thread-Topic: [PATCH] rust: types: Add `try_from_foreign()` method
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1705940766
Message-ID: <0100018d31fe5238-538d9c26-64a3-49cb-ac76-22362f73d80f-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2024.01.22-54.240.8.21

Currently `ForeignOwnable::from_foreign()` only=0D=0Aworks for non-null p=
ointers for the existing=0D=0Aimpls (e.g. Box, Arc). It may create a few=0D=
=0Aduplicate code like:=0D=0A=0D=0A```rust=0D=0A// `p` is a maybe null po=
inter=0D=0Aif p.is_null() {=0D=0A  None=0D=0A} else {=0D=0A  Some(unsafe =
{ T::from_foreign(p) })=0D=0A}=0D=0A``=0D=0A=0D=0ALink: Rust-for-Linux/li=
nux#1059=0D=0A=0D=0ACc: Alice Ryhl <aliceryhl@google.com>=0D=0ACc: Matt G=
ilbride <mattgilbride@google.com>=0D=0ACc: Miguel Ojeda <ojeda@kernel.org=
>=0D=0ASigned-off-by: Obei Sideg <linux@obei.io>=0D=0A---=0D=0A rust/kern=
el/types.rs | 20 ++++++++++++++++++++=0D=0A 1 file changed, 20 insertions=
(+)=0D=0A=0D=0Adiff --git a/rust/kernel/types.rs b/rust/kernel/types.rs=0D=
=0Aindex fdb778e65d79..946067cd9c00 100644=0D=0A--- a/rust/kernel/types.r=
s=0D=0A+++ b/rust/kernel/types.rs=0D=0A@@ -46,6 +46,18 @@ pub trait Forei=
gnOwnable: Sized {=0D=0A     /// Additionally, all instances (if any) of =
values returned by [`ForeignOwnable::borrow`] for=0D=0A     /// this obje=
ct must have been dropped.=0D=0A     unsafe fn from_foreign(ptr: *const c=
ore::ffi::c_void) -> Self;=0D=0A+=0D=0A+    /// Tries to convert a foreig=
n-owned object back to a Rust-owned one.=0D=0A+    ///=0D=0A+    /// Like=
 [`from_foreign`], but returns [`None`] if `ptr` is null.=0D=0A+    ///=0D=
=0A+    /// # Safety=0D=0A+    ///=0D=0A+    /// `ptr` must have been ret=
urned by a previous call to [`ForeignOwnable::into_foreign`] for=0D=0A+  =
  /// which a previous matching [`ForeignOwnable::from_foreign`] hasn't b=
een called yet.=0D=0A+    /// Additionally, all instances (if any) of val=
ues returned by [`ForeignOwnable::borrow`] for=0D=0A+    /// this object =
must have been dropped.=0D=0A+    unsafe fn try_from_foreign(ptr: *const =
core::ffi::c_void) -> Option<Self>;=0D=0A }=0D=0A=20=0D=0A impl<T: 'stati=
c> ForeignOwnable for Box<T> {=0D=0A@@ -68,6 +80,14 @@ unsafe fn from_for=
eign(ptr: *const core::ffi::c_void) -> Self {=0D=0A         // call to `S=
elf::into_foreign`.=0D=0A         unsafe { Box::from_raw(ptr as _) }=0D=0A=
     }=0D=0A+=0D=0A+    unsafe fn try_from_foreign(ptr: *const core::ffi:=
:c_void) -> Option<Self> {=0D=0A+        if ptr.is_null() {=0D=0A+       =
     None=0D=0A+        } else {=0D=0A+            Some(Self::from_foreig=
n(ptr))=0D=0A+        }=0D=0A+    }=0D=0A }=0D=0A=20=0D=0A impl ForeignOw=
nable for () {=0D=0A--=20=0D=0A2.39.2=0D=0A=0D=0A
