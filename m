Received: from a8-40.smtp-out.amazonses.com (a8-40.smtp-out.amazonses.com [54.240.8.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349BB1B7E1
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.8.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706095976; cv=none; b=j0+/ey4ShodF9eMOzAPANjgTST6rF+wAegx84yVHHWXOcNxKc7LJ+lAYfmapotQyd3pvM7G769xlzA29pswtqsoSa4vUYx2KAVU+eIdfIdRnm4Y1tUJ+aa0fDGGYTnickaI/WByQTSUUf5ZiD3vbxe4gVKvcuslcX2QZEV7RxRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706095976; c=relaxed/simple;
	bh=EZOsyifv1BkWnkp9FvT/IZZpHkou77NKdArbuZzwDXc=;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:References:
	 Message-ID; b=T9wlNEyHJ8a9+4/tjWM+lEIh2aNvVCRO/iY15tvc6iR05M4J5zaiMtJTKfuJMdyFbx3eGWLf88Tej5IHhWoptJIOI0EGO5I4soAmnPlrcrGJO4Idvbu0xf9BvEbec7EGhraMlYBFXq7cRgXECfONHtXREni9UqiaFLJgsYnasH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b=R5GDt+bD; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=Fuhsv2nK; arc=none smtp.client-ip=54.240.8.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b="R5GDt+bD";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Fuhsv2nK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ph73stw23v46e7miqo4f44bv344ybkbc; d=obei.io; t=1706095974;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=EZOsyifv1BkWnkp9FvT/IZZpHkou77NKdArbuZzwDXc=;
	b=R5GDt+bDKS9GtleYx7K4YXL6CkfzhgN/me367euRRS0cQvqk2fzxhM4XGJ1yjmX/
	lh94hWSBHtqxN3eeDcflDwnejvbGjGO1/TUKlZovm4Oj5Q/8U44MbFUAj+KXCAwn13C
	wEg+AfJrgyg5feWhZPSlJHqCuIwoXacXs/T8gK37npQU0JMP1PRU869nO7xgUPa16I/
	Ap53kXV4mF01RbbwLUsLDWKUKmhiVDuR75hHVc09kEwJlWaHi8sY7x85TNztK2s4yBv
	o9Ntte6guVwUyKpw/Q9nSDpAslX/OHSa3MOponsmgDoDVOueKdv+nS2vh5S3Hfnluvh
	LqF7uJFaRg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1706095974;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=EZOsyifv1BkWnkp9FvT/IZZpHkou77NKdArbuZzwDXc=;
	b=Fuhsv2nK8QRjrdb5JLmPH882lf1Ko/6BjY3y+yqNjTFBTOJJ5Yg/mc9naIpOP3GE
	bP/RkoXRh4wxLW9ewojtwehkjkGB91QBCo29Wt07hAz9k2L5iJ36NsOZxC7/E5C2Ymr
	TqQ0ayMosXdWfxRGQqtIKW6wFm4HdeNgmRsBz3Gc=
Subject: [PATCH v3] rust: types: Add `try_from_foreign()` method
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
	=?UTF-8?Q?Obei_Sideg?= <linux@obei.io>
Date: Wed, 24 Jan 2024 11:32:53 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <20240124113241.380026-1-linux@obei.io>
X-Mailer: Amazon WorkMail
Thread-Index: AQHaTrkR834YhMf2RJGh30NlrNjP4w==
Thread-Topic: [PATCH v3] rust: types: Add `try_from_foreign()` method
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1706095973
Message-ID: <0100018d3b3e9621-dd8655bf-d355-41fc-8a10-a6167b67d77b-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2024.01.24-54.240.8.40

Currently `ForeignOwnable::from_foreign()` only works for non-null=0D=0Ap=
ointers for the existing impls (e.g. Box, Arc). It may create a few=0D=0A=
duplicate code like:=0D=0A=0D=0A```rust=0D=0A// `p` is a maybe null point=
er=0D=0Aif p.is_null() {=0D=0A  None=0D=0A} else {=0D=0A  Some(unsafe { T=
::from_foreign(p) })=0D=0A}=0D=0A```=0D=0A=0D=0ALink: https://github.com/=
Rust-for-Linux/linux/issues/1057=0D=0ASigned-off-by: Obei Sideg <linux@ob=
ei.io>=0D=0A---=0D=0A rust/kernel/types.rs | 20 ++++++++++++++++++++=0D=0A=
 1 file changed, 20 insertions(+)=0D=0A=0D=0Adiff --git a/rust/kernel/typ=
es.rs b/rust/kernel/types.rs=0D=0Aindex fdb778e65d79..f27f007ca543 100644=
=0D=0A--- a/rust/kernel/types.rs=0D=0A+++ b/rust/kernel/types.rs=0D=0A@@ =
-46,6 +46,26 @@ pub trait ForeignOwnable: Sized {=0D=0A     /// Additiona=
lly, all instances (if any) of values returned by [`ForeignOwnable::borro=
w`] for=0D=0A     /// this object must have been dropped.=0D=0A     unsaf=
e fn from_foreign(ptr: *const core::ffi::c_void) -> Self;=0D=0A+=0D=0A+  =
  /// Tries to convert a foreign-owned object back to a Rust-owned one.=0D=
=0A+    ///=0D=0A+    /// A convenience wrapper over [`from_foreign`] tha=
t returns [`None`] if `ptr` is null.=0D=0A+    ///=0D=0A+    /// # Safety=
=0D=0A+    ///=0D=0A+    /// `ptr` must have been returned by a previous =
call to [`ForeignOwnable::into_foreign`] for=0D=0A+    /// which a previo=
us matching [`ForeignOwnable::from_foreign`] hasn't been called yet.=0D=0A=
+    /// Additionally, all instances (if any) of values returned by [`For=
eignOwnable::borrow`] for=0D=0A+    /// this object must have been droppe=
d.=0D=0A+    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) ->=
 Option<Self> {=0D=0A+        if ptr.is_null() {=0D=0A+            None=0D=
=0A+        } else {=0D=0A+            // SAFETY: The safety requirements=
 of this function ensure that `ptr` comes from a previous=0D=0A+         =
   // call to `Self::into_foreign`.=0D=0A+            unsafe { Some(Self:=
:from_foreign(ptr)) }=0D=0A+        }=0D=0A+    }=0D=0A }=0D=0A=20=0D=0A =
impl<T: 'static> ForeignOwnable for Box<T> {=0D=0A--=20=0D=0A2.39.2=0D=0A=
=0D=0A
