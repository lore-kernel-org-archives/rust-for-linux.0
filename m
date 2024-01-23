Received: from a11-32.smtp-out.amazonses.com (a11-32.smtp-out.amazonses.com [54.240.11.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B484F56760
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jan 2024 08:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.11.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705998490; cv=none; b=QxuH45uOrh7EFFUdTSLGocr+cekSExRIepwYZ8Xwl2ra2GNPHK3XqmNXbmriLFnG3JMbHMAuWivoZtVHeTJg+gKlE6Aw7mYmwMK0iU0YeYyjlfMICdDmZGohOSxoq37N+T3goDZwwH+piVtGHus1gIXzFzg86cGuIZ9uUlv3FLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705998490; c=relaxed/simple;
	bh=rhyfPJbfJX6l25HGQ5Ol+i3LmzQwYch7XRSEev+mUwg=;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:References:
	 Message-ID; b=uuoy9+qc09u+cguT9A2SM8S2uuTVovQPDeZxqdWBv0DXTCpmx2K+h+5HtHPOu9aGwcQs+vXn1R2yPs4RrbD+g+QuYRcBc+JaKXKW+pe7DhFuHh31/PCSxLpunVoVpdmfC/P5YVI69/Gwt55RbpH6ywuht/xKVd6WCqi9vg3KryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b=WPlAeWF+; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=b8mgIEcG; arc=none smtp.client-ip=54.240.11.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b="WPlAeWF+";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="b8mgIEcG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ph73stw23v46e7miqo4f44bv344ybkbc; d=obei.io; t=1705998487;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id;
	bh=rhyfPJbfJX6l25HGQ5Ol+i3LmzQwYch7XRSEev+mUwg=;
	b=WPlAeWF+ya0e57m/Az0xa3CifhDT//aHv8mg3DwWTksrouLaoEraD2zaJzTRW5Wn
	c1SkWZ35KbLbwVqeTEi1zh5oMVunRdk/XJ3qjbCSSZQVBKN/2y4nCLVZiawUaL0anaz
	M3xFAleteYUfOjsP/EN2WrWMbTvL0epLeRRbqfqoPbp/BQdgECNEHTXtx+26mGCmv+/
	nGd0I+y/Zn1UWGp2M3jpilnKYGTlN56/+0co2DG10fuyhkSkccRj8gvNBS3rZujsrRf
	0WE53S2eLnnzeDhyNSwul2/geHsEBh/LyFXczQ6Dgbt6jmy8OtR/qMGSOet26siEF1u
	IkabI8zfhg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1705998487;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:References:Message-Id:Feedback-ID;
	bh=rhyfPJbfJX6l25HGQ5Ol+i3LmzQwYch7XRSEev+mUwg=;
	b=b8mgIEcGA+mRO8Y6zRuf0708QU7oq6NrCWWMwNH81YQkoN7P+E3F4t/QxakGmRSR
	/hIJ6hmMzbuVwptaigbndH+2OrvLo17pw2wkv08RrSqpv7UHw8aGQaUAWbimcF/x7qB
	q5bsLBfYMHsmVdGB/I98f4zPLM4KHXW/rWteeoVU=
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
	=?UTF-8?Q?Matt_Gilbride?= <mattgilbride@google.com>, 
	=?UTF-8?Q?Trevor_Gross?= <tmgross@umich.edu>
Date: Tue, 23 Jan 2024 08:28:07 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <20240123082746.18284-1-linux@obei.io>
X-Mailer: Amazon WorkMail
Thread-Index: AQHaTdYWwLDDOt0mSvCKO8XVuM7/fA==
Thread-Topic: [PATCH] rust: types: Add `try_from_foreign()` method
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1705998486
Message-ID: <0100018d356f0fa5-1e771ce7-1787-4330-bc1e-0d7ce240288b-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2024.01.23-54.240.11.32

Currently `ForeignOwnable::from_foreign()` only works for non-null=0D=0Ap=
ointers for the existing impls (e.g. Box, Arc). It may create a few=0D=0A=
duplicate code like:=0D=0A=0D=0A```rust=0D=0A// `p` is a maybe null point=
er=0D=0Aif p.is_null() {=0D=0A  None=0D=0A} else {=0D=0A  Some(unsafe { T=
::from_foreign(p) })=0D=0A}=0D=0A``=0D=0A=0D=0ALink: https://github.com/R=
ust-for-Linux/linux/issues/1057=0D=0A=0D=0ACc: Alice Ryhl <aliceryhl@goog=
le.com>=0D=0ACc: Matt Gilbride <mattgilbride@google.com>=0D=0ACc: Miguel =
Ojeda <ojeda@kernel.org>=0D=0AReviewed-by: Trevor Gross <tmgross@umich.ed=
u>=0D=0ASigned-off-by: Obei Sideg <linux@obei.io>=0D=0A---=0D=0A rust/ker=
nel/types.rs | 19 +++++++++++++++++++=0D=0A 1 file changed, 19 insertions=
(+)=0D=0A=0D=0Adiff --git a/rust/kernel/types.rs b/rust/kernel/types.rs=0D=
=0Aindex fdb778e65d79..cfee102ab7b9 100644=0D=0A--- a/rust/kernel/types.r=
s=0D=0A+++ b/rust/kernel/types.rs=0D=0A@@ -46,6 +46,25 @@ pub trait Forei=
gnOwnable: Sized {=0D=0A     /// Additionally, all instances (if any) of =
values returned by [`ForeignOwnable::borrow`] for=0D=0A     /// this obje=
ct must have been dropped.=0D=0A     unsafe fn from_foreign(ptr: *const c=
ore::ffi::c_void) -> Self;=0D=0A+=0D=0A+    /// Tries to convert a foreig=
n-owned object back to a Rust-owned one.=0D=0A+    ///=0D=0A+    /// A co=
nvenience wrapper over [`from_foreign`] that returns [`None`]=0D=0A+    /=
// if `ptr` is null.=0D=0A+    ///=0D=0A+    /// # Safety=0D=0A+    ///=0D=
=0A+    /// `ptr` must have been returned by a previous call to [`Foreign=
Ownable::into_foreign`] for=0D=0A+    /// which a previous matching [`For=
eignOwnable::from_foreign`] hasn't been called yet.=0D=0A+    /// Additio=
nally, all instances (if any) of values returned by [`ForeignOwnable::bor=
row`] for=0D=0A+    /// this object must have been dropped.=0D=0A+    uns=
afe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<Self> {=0D=
=0A+        if ptr.is_null() {=0D=0A+            None=0D=0A+        } els=
e {=0D=0A+            Some(Self::from_foreign(ptr))=0D=0A+        }=0D=0A=
+    }=0D=0A }=0D=0A=20=0D=0A impl<T: 'static> ForeignOwnable for Box<T> =
{=0D=0A--=20=0D=0A2.39.2=0D=0A=0D=0A
