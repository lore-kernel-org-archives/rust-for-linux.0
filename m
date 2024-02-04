Received: from a48-182.smtp-out.amazonses.com (a48-182.smtp-out.amazonses.com [54.240.48.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EE18F66
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Feb 2024 07:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.48.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707033519; cv=none; b=HqvscinsAgtnGVjdpYA5M1Napfa+0aV8uNzBGL/e7aJEhMAPfMuR2APFchd7rEb7rjh+Od0ITiJgJjd3/bwnRXY2/Analn2eO+mvCilqhQNMnGsOEmnxdSOWIgwTwU9mLN3R6OPVoiRavwz5i7wjcgomftU2Z6vxFptzUbZHJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707033519; c=relaxed/simple;
	bh=m0DGozVOKUQhg6PotdOAix3w99PJ7ywHPO/LYri9cQc=;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:In-Reply-To:
	 References:Message-ID; b=NwQ0+ycnb1zjmO6bSlEjgvE4Wy5OMpVtsrSjtJlmTmIp2oBMvdq3mhMgzR7FFKS711rZkSfi4Seyf+nQJ/iXbxvVzbH0BZygkf5km0g8Keut0aNuaLVJBYD4Tg8l9StZ5G57ZBY2TO/S4Ro2vVs4NX4UOJLXNc7vk/NR7Ipp1qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b=kpfDmEnY; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=OjDvolgQ; arc=none smtp.client-ip=54.240.48.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b="kpfDmEnY";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="OjDvolgQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ph73stw23v46e7miqo4f44bv344ybkbc; d=obei.io; t=1707033516;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=m0DGozVOKUQhg6PotdOAix3w99PJ7ywHPO/LYri9cQc=;
	b=kpfDmEnYeEcuMHmy6rZdAy/WrxhVLAvModFmnPRSFKhRR16aW49yoUEyXwlIP7HB
	Pai80bzUcdNnUR04KX6KkWnqUTr5WYgArEFsBws0Fgyk5C1bu7xmj2xlkZdPsCmcNJT
	nDc2NPJYJiEP6G+SgG8M76bpNuFlb8flnD5OPbcK4aRGsQViBpJSW81AnLRSTUt1hro
	qNREAKd7zT+Af6ua+RZFN9hQL0rf4Riwx9ZiGtGVpsc+r4YVr5kVCYzgmcXps+TW6aS
	5gw25HY/TmSrmUSiX4B0c1nzGlto9zc/pAoSVb0/5xthS40MYJmMjg0RlL6CmDs1N0G
	ZQJwDRSAXw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1707033516;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=m0DGozVOKUQhg6PotdOAix3w99PJ7ywHPO/LYri9cQc=;
	b=OjDvolgQ1vIOnhhzlixSq1l7H7q+JGR7FnnGKMtWcN4aK0y81OCjleKL5pturYTH
	Sem9e31tpZHJcfOmuACf7+o00YGzkpl01im+PGuxt0fW57EtcpPR9lDfJf9vpLGONKf
	qsYQtbrntNsx0e+JlpmTFjOfSccW64I012noiojo=
Subject: Re: [PATCH v6] rust: types: Add `try_from_foreign()` method
From: =?UTF-8?Q?Obei_Sideg?= <linux@obei.io>
To: =?UTF-8?Q?Obei_Sideg?= <linux@obei.io>
Cc: =?UTF-8?Q?a=2Ehindborg=40samsung=2Ecom?= <a.hindborg@samsung.com>, 
	=?UTF-8?Q?alex=2Egaynor=40gmail=2Ecom?= <alex.gaynor@gmail.com>, 
	=?UTF-8?Q?aliceryhl=40google=2Ecom?= <aliceryhl@google.com>, 
	=?UTF-8?Q?benno=2Elossin=40proton=2Eme?= <benno.lossin@proton.me>, 
	=?UTF-8?Q?bjorn3=5Fgh=40protonmail=2Ecom?= <bjorn3_gh@protonmail.com>, 
	=?UTF-8?Q?boqun=2Efeng=40gmail=2Ecom?= <boqun.feng@gmail.com>, 
	=?UTF-8?Q?gary=40garyguo=2Enet?= <gary@garyguo.net>, 
	=?UTF-8?Q?ojeda=40kernel=2Eorg?= <ojeda@kernel.org>, 
	=?UTF-8?Q?rust-for-linux=40vger=2Ekernel=2Eorg?= <rust-for-linux@vger.kernel.org>, 
	=?UTF-8?Q?wedsonaf=40gmail=2Ecom?= <wedsonaf@gmail.com>, 
	=?UTF-8?Q?Trevor_Gross?= <tmgross@umich.edu>
Date: Sun, 4 Feb 2024 07:58:36 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com>
References: 
 <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com> 
 <20240204075827.10747-1-linux@obei.io>
X-Mailer: Amazon WorkMail
Thread-Index: AQHaUn69oxRsr4DETbySDB5t5Fc8cgEwTcWf
Thread-Topic: [PATCH v6] rust: types: Add `try_from_foreign()` method
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1707033515
Message-ID: <0100018d73205a53-b7739657-2731-4164-b940-c633200a221c-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2024.02.04-54.240.48.182

Currently `ForeignOwnable::from_foreign()` only works for non-null=0D=0Ap=
ointers for the existing impls (e.g. Box, Arc). It may create a few=0D=0A=
duplicate code like:=0D=0A=0D=0A```rust=0D=0A// `p` is a maybe null point=
er=0D=0Aif p.is_null() {=0D=0A  None=0D=0A} else {=0D=0A  unsafe { Some(S=
elf::from_foreign(ptr)) }=0D=0A}=0D=0A```=0D=0A=0D=0AAdd a `try_from_fore=
ign()` method that will return `None` if `ptr`=0D=0Ais null, otherwise re=
turn `Some(from_foreign(ptr))`.=0D=0A=0D=0ALink: https://github.com/Rust-=
for-Linux/linux/issues/1057=0D=0ASigned-off-by: Obei Sideg <linux@obei.io=
>=0D=0AReviewed-by: Alice Ryhl <aliceryhl@google.com>=0D=0AReviewed-by: T=
revor Gross <tmgross@umich.edu>=0D=0A---=0D=0A  V5 -> V6: Remove duplicat=
e `Signed-off-by` and Add changelog=0D=0A  V4 -> V5: Add the solution des=
cription to the commit message=0D=0A  V3 -> V4: Improve safety comment=0D=
=0A  V2 -> V3: Improve method comment=0D=0A  V1 -> V2: Add the trait defa=
ult implementation for `try_from_foreign()`=0D=0A=0D=0A rust/kernel/types=
=2Ers | 17 +++++++++++++++++=0D=0A 1 file changed, 17 insertions(+)=0D=0A=
=0D=0Adiff --git a/rust/kernel/types.rs b/rust/kernel/types.rs=0D=0Aindex=
 fdb778e65d79..04a356ec3534 100644=0D=0A--- a/rust/kernel/types.rs=0D=0A+=
++ b/rust/kernel/types.rs=0D=0A@@ -46,6 +46,23 @@ pub trait ForeignOwnabl=
e: Sized {=0D=0A     /// Additionally, all instances (if any) of values r=
eturned by [`ForeignOwnable::borrow`] for=0D=0A     /// this object must =
have been dropped.=0D=0A     unsafe fn from_foreign(ptr: *const core::ffi=
::c_void) -> Self;=0D=0A+=0D=0A+    /// Tries to convert a foreign-owned =
object back to a Rust-owned one.=0D=0A+    ///=0D=0A+    /// A convenienc=
e wrapper over [`from_foreign`] that returns [`None`] if `ptr` is null.=0D=
=0A+    ///=0D=0A+    /// # Safety=0D=0A+    ///=0D=0A+    /// `ptr` must=
 either be null or satisfy the safety requirements for [`from_foreign`].=0D=
=0A+    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Opti=
on<Self> {=0D=0A+        if ptr.is_null() {=0D=0A+            None=0D=0A+=
        } else {=0D=0A+            // SAFETY: The safety requirements of =
this function ensure that `ptr` comes from a previous=0D=0A+            /=
/ call to [`into_foreign`].=0D=0A+            unsafe { Some(Self::from_fo=
reign(ptr)) }=0D=0A+        }=0D=0A+    }=0D=0A }=0D=0A=20=0D=0A impl<T: =
'static> ForeignOwnable for Box<T> {=0D=0A--=20=0D=0A2.39.2=0D=0A=0D=0A
