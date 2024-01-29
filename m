Received: from a11-77.smtp-out.amazonses.com (a11-77.smtp-out.amazonses.com [54.240.11.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DAE4E1C5
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jan 2024 06:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.11.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706510730; cv=none; b=BLawo0NmBWOp8V1JrcBIZAT4jD/cGVGmC8Ci+vhLW8kuQn6rs9A6z52ldYqrt9V6IZX7Q1TQ4AEnmQK5iNIEi0Iij9SSeZOqRc/NuPy/4Env2QDapDnsvLClPu21vvs2MwAxowy6kj2wAX81JuaQwZzd1GsXVGi+ASkcJcrGSSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706510730; c=relaxed/simple;
	bh=XaIsH/BFjbubAfuRHtpB1ErFXhd0PRB1LrLqSzbhqY8=;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:References:
	 Message-ID; b=mGPsHf07v7mg6ybLrZqem2+zwfwQ080B9xJU7uQytp3IAFYMPljjWHLuCgT9oeeD/3PEM7UQVROn0ffUqygjUL9454r9jDNyIxOQse9XxKPQBC682NkWph1gubB5webAZCjVoHR/4t/GqL2L95Ly6Zi6U6nTNV644jb7viS6HXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b=jTYZkN4f; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=BMra6pNx; arc=none smtp.client-ip=54.240.11.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b="jTYZkN4f";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="BMra6pNx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ph73stw23v46e7miqo4f44bv344ybkbc; d=obei.io; t=1706510727;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=XaIsH/BFjbubAfuRHtpB1ErFXhd0PRB1LrLqSzbhqY8=;
	b=jTYZkN4fN6OFwH5YmsqOORy/HDHbEnTy01RVuO4jlvSN3mOi/AfYtXMdWq8a/Ys6
	H1RF88deHtIcDw1khvSXYMyOrikLLhmo7DGN4EG2YsOGIF/P6g3t+HMdPFRLD7A1UsN
	/Pq01/XbeuLW6nhZnCrZQYfv5FBUx0gsPWs5VGOG077G/0grCSYrfOgEdYf8CmiRPXq
	2TSDils8n2xruVIV0LXsvQOQ4xQXFhLQdUp54K4Daynur6cSwU8RW21ktk5wiuC+8j3
	VL567nkTx2DVfkjmbyCsXjtWyswATgRy3z91QfiiyVJ2jGehBol+z/0IvxyTAoxu3Ra
	Auq++YmTSw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1706510727;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=XaIsH/BFjbubAfuRHtpB1ErFXhd0PRB1LrLqSzbhqY8=;
	b=BMra6pNxLJmal3Sq9FhezZwbl5/rlAVNLWgETpHx/Hv8Dz45TfaEIvAMcBZeM/Xv
	7Hr1LTqcZ9nXMe2r1rKxqTqUroGi+m5/uFY2hzpFNHGiRFrElBgGuBDwy2Meok23CuU
	yOMB+F1ARWeO0ok5bBntd/ticDBSZI5Q//lVXdFA=
Subject: [PATCH v6] rust: types: Add `try_from_foreign()` method
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
Date: Mon, 29 Jan 2024 06:45:27 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <20240129064519.7137-1-linux@obei.io>
X-Mailer: Amazon WorkMail
Thread-Index: AQHaUn69oxRsr4DETbySDB5t5Fc8cg==
Thread-Topic: [PATCH v6] rust: types: Add `try_from_foreign()` method
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1706510726
Message-ID: <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2024.01.29-54.240.11.77

Currently `ForeignOwnable::from_foreign()` only works for non-null=0D=0Ap=
ointers for the existing impls (e.g. Box, Arc). It may create a few=0D=0A=
duplicate code like:=0D=0A=0D=0A```rust=0D=0A// `p` is a maybe null point=
er=0D=0Aif p.is_null() {=0D=0A  None=0D=0A} else {=0D=0A  unsafe { Some(S=
elf::from_foreign(ptr)) }=0D=0A}=0D=0A```=0D=0A=0D=0AAdding a `try_from_f=
oreign()` method that will return `None` if `ptr`=0D=0Ais null, otherwsie=
 return `Some(from_foreign(ptr))`.=0D=0A=0D=0ALink: https://github.com/Ru=
st-for-Linux/linux/issues/1057=0D=0ASigned-off-by: Obei Sideg <linux@obei=
=2Eio>=0D=0AReviewed-by: Alice Ryhl <aliceryhl@google.com>=0D=0A---=0D=0A=
 rust/kernel/types.rs | 17 +++++++++++++++++=0D=0A 1 file changed, 17 ins=
ertions(+)=0D=0A=0D=0Adiff --git a/rust/kernel/types.rs b/rust/kernel/typ=
es.rs=0D=0Aindex fdb778e65d79..04a356ec3534 100644=0D=0A--- a/rust/kernel=
/types.rs=0D=0A+++ b/rust/kernel/types.rs=0D=0A@@ -46,6 +46,23 @@ pub tra=
it ForeignOwnable: Sized {=0D=0A     /// Additionally, all instances (if =
any) of values returned by [`ForeignOwnable::borrow`] for=0D=0A     /// t=
his object must have been dropped.=0D=0A     unsafe fn from_foreign(ptr: =
*const core::ffi::c_void) -> Self;=0D=0A+=0D=0A+    /// Tries to convert =
a foreign-owned object back to a Rust-owned one.=0D=0A+    ///=0D=0A+    =
/// A convenience wrapper over [`from_foreign`] that returns [`None`] if =
`ptr` is null.=0D=0A+    ///=0D=0A+    /// # Safety=0D=0A+    ///=0D=0A+ =
   /// `ptr` must either be null or satisfy the safety requirements for [=
`from_foreign`].=0D=0A+    unsafe fn try_from_foreign(ptr: *const core::f=
fi::c_void) -> Option<Self> {=0D=0A+        if ptr.is_null() {=0D=0A+    =
        None=0D=0A+        } else {=0D=0A+            // SAFETY: The safe=
ty requirements of this function ensure that `ptr` comes from a previous=0D=
=0A+            // call to [`into_foreign`].=0D=0A+            unsafe { S=
ome(Self::from_foreign(ptr)) }=0D=0A+        }=0D=0A+    }=0D=0A }=0D=0A=20=
=0D=0A impl<T: 'static> ForeignOwnable for Box<T> {=0D=0A--=20=0D=0A2.39.=
2=0D=0A=0D=0A
