Received: from a11-122.smtp-out.amazonses.com (a11-122.smtp-out.amazonses.com [54.240.11.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A54FC142
	for <rust-for-linux@vger.kernel.org>; Sun, 28 Jan 2024 06:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.11.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706424432; cv=none; b=bA4PydTa9rGkYIxg8oZLDQx8Mb15ULXMm4cuBW7iXYTKagICU+UUXyrIoWXmxrYh8pO/bjklILT+kfROWBiCUZBlLwlaMjT1s5UZ0HSs3mTvH7n63MKFtEVptXvc07+J3TtEoO2jfpT8EqzQ+RNtO0rsTY9JnLVwKRb9UbJrAIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706424432; c=relaxed/simple;
	bh=pfvU5czETa1orXWAI5PaOi/GpH0o/cGr/6qscYptKVI=;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:In-Reply-To:
	 References:Message-ID; b=j5n4qahu7eMuIU5s43x0TSDdeL+U/bSu7VdKDD8FjHzizTSVEadfxoSV2QBUk3xQOe50ouCK+EQB+q++5Xb1Dw0y8By6cJAgxjxexigPyeZTuOwTYyCdyvdBOUgw2Boa9ycYELzCWCLCevT0daBr8o+NGQ1TtvqPgo4drOjCWrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io; spf=pass smtp.mailfrom=amazonses.com; dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b=aP9UMXzN; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=IkSk6vqL; arc=none smtp.client-ip=54.240.11.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=obei.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=obei.io header.i=@obei.io header.b="aP9UMXzN";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="IkSk6vqL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=ph73stw23v46e7miqo4f44bv344ybkbc; d=obei.io; t=1706424429;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=pfvU5czETa1orXWAI5PaOi/GpH0o/cGr/6qscYptKVI=;
	b=aP9UMXzNaKon8NqFuIOUDl15EBnT8jBKYo4JfXrtSBUvil8fDyu537bE5WeNYJge
	E+pl7MSr5dT4/NaLK9InUQKa2GFjM43E5uYNRdJEOHfm5zqrjN3sINDDSes8hUHGxyF
	e7sKArDqnoaj5bCuo3DrY1f+JD/q7nfgjFUj8+bwsIPyrNlELWqbcjeDnrHk/y8u3k9
	FBfvs5gLfMIzmG/jY3TXOX7honV/zF/oz3kplyzsne3XDTD3buoQ7dmZ2uhEQ3LbKZX
	FattwseF3CQ3lcGxl4+e/g6ICP9BGMXrighbM3D7BnRTaXU+3rfj9THJGPqYUFGeiDq
	8DDnp6mXCQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1706424429;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=pfvU5czETa1orXWAI5PaOi/GpH0o/cGr/6qscYptKVI=;
	b=IkSk6vqLj604caOBzzJAa5LLS8lShVgUpxC9Bzw3cT5cfM0RHXLM7qLO1nJDmPUt
	Vqp+kbLW3wqcvuzKGA95r/K2vAmFnLZN/pfGUOjPCfCrU9aJQ1WQJVW6SQ8pBNM3FbB
	4gK1DCwEEWx7nnAVTGc+hm5rMOFgOrkn9I6n9bZI=
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
Date: Sun, 28 Jan 2024 06:47:09 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: 
 <CAH5fLghtZK94Co2+0agG91SZQrqke8H=oyHfmRxi2KbRTPJp2g@mail.gmail.com>
References: 
 <CAH5fLghtZK94Co2+0agG91SZQrqke8H=oyHfmRxi2KbRTPJp2g@mail.gmail.com> 
 <20240128064656.6039-1-linux@obei.io>
X-Mailer: Amazon WorkMail
Thread-Index: AQHaTrkR834YhMf2RJGh30NlrNjP4wAAtndRAL8vtlg=
Thread-Topic: [PATCH v4] rust: types: Add `try_from_foreign()` method
X-Original-Mailer: git-send-email 2.39.2
X-Wm-Sent-Timestamp: 1706424428
Message-ID: <0100018d4ed26b78-7c0d5d0c-cf92-48ff-9f97-a656a9560e2b-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2024.01.28-54.240.11.122

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
