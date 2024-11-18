Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D3C3BBF2
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 03:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731899682; cv=none; b=XP9FKP6d2UhmLt4Xeyu913Nt/apRjILcjy93cYIVRc0KvLN4vajSCC6iuFbjp4yD26evBdYrkTRrwS+CS5vGi8p+wDolZx0LuHXaPMrlFpEYtGMF+i3dfc0PIA95KtOhx4pl0A2LLKq38Mtthv8s2cduD/WadmtdIPoGJS/xsg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731899682; c=relaxed/simple;
	bh=XY59ISUptXRYCSU+AJy0JeZAWMP3TegwoYy9OZbTJcQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fB8aufkNLN78ie7cEOEiUYC+hl/MUEyp6HY7eG0Gnb+5PqFu8o31fTM/EMZVDl16434A0Zo49E/9CDxE7vfJ1SZJvuN9H2nHPXNW3VMkf46QhcsvJVCYDFMk/9CY7bLtXymToQSofuNdURBA9qmzabf9D//uyTX3qsasz0MCY9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io; spf=pass smtp.mailfrom=mandragore.io; dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b=KklW9vbH; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mandragore.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mandragore.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandragore.io header.i=@mandragore.io header.b="KklW9vbH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandragore.io;
	s=protonmail3; t=1731899663; x=1732158863;
	bh=62TybkuSsITuOtLWbZvJVVtVVcWCmH06iOofM9IW8TY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=KklW9vbH14Hqav1ZC8nch2PCPhGQDwrGKZjKOntGe2lk3/04+6Gp3Pr0/sJKUnKYv
	 EmspG3UEJHJSFOSDCBkItOYK9LA/CldD4YDqjW2QO2g35L5A9lFJjLBNMzAq1aU3Xp
	 KkRqFEuvuUWw0nm5ntcjk0ZMTGqQm8Ei08mP60ErxRGBmoZC+v0pjspRIs7Fiv1zoi
	 iMIJHgGY99W7n0Yddw+joFa27DAeOO9AY6rfY+8bQqo55NItVRguGYec4eC4JIxaJf
	 TZfKxJbUj74Daoosz8uEYVySY66+Mpzf4o2ZEG7Z/XayyKohCMkfdKx2cmbHPNTqdX
	 hsml6bouSBBTA==
Date: Mon, 18 Nov 2024 03:14:17 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Konstantin Andrikopoulos <kernel@mandragore.io>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, Konstantin Andrikopoulos <kernel@mandragore.io>
Subject: [PATCH v2] rust: add safety comment in rust_fmt_argument
Message-ID: <20241118031225.38080-1-kernel@mandragore.io>
Feedback-ID: 125704292:user:proton
X-Pm-Message-ID: c088e9fbd7d4fdb7671a51df9d216056bcc90b55
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The function rust_fmt_argument dereferences a pointer, and thus it
needs an unsafe block. The safety comment for that block was missing.

Link: https://github.com/Rust-for-Linux/linux/issues/351.

Signed-off-by: Konstantin Andrikopoulos <kernel@mandragore.io>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/print.rs | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index a28077a7cb30..57a4fc48bbcd 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -13,8 +13,27 @@
=20
 use crate::str::RawFormatter;
=20
-// Called from `vsprintf` with format specifier `%pA`.
-#[expect(clippy::missing_safety_doc)]
+/// Handles the `%pA` format specifier.
+///
+/// This function is called by [`vsprintf`] when it encounters a `%pA` for=
mat specifier in a
+/// format string. `ptr` points to the corresponding argument, `buf` point=
s to a buffer to hold
+/// the formatted argument, and `end` points at the buffer's end.
+///
+/// `rust_fmt_argument` treats `ptr` as a pointer to a [`core::fmt::Argume=
nts`], which it formats,
+/// and writes the result to `buf`.
+///
+/// It returns the address after the last byte it has written in `buf`.
+///
+/// # Safety
+///
+/// `buf` and `end` must follow the requirements of [`RawFormatter`]. `ptr=
` must be valid for
+/// reading a [`core::fmt::Arguments`].
+///
+/// `vsprintf` guarantees that `buf` and `end` will uphold their requireme=
nts. However, it will
+/// just forward the argument that corresponds to `%pA`. Callers that prov=
ide format strings must
+/// guarantee that arguments which correspond to `%pA` are valid pointers.
+///
+/// [`vsprintf`]: srctree/lib/vsprintf.c
 #[no_mangle]
 unsafe extern "C" fn rust_fmt_argument(
     buf: *mut c_char,
@@ -24,7 +43,8 @@
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less =
than `end`.
     let mut w =3D unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast())=
 };
-    // SAFETY: TODO.
+    // SAFETY: The safety preconditions require that `ptr` is a valid poin=
ter to a `fmt::Arguments`
+    // struct.
     let _ =3D w.write_fmt(unsafe { *(ptr as *const fmt::Arguments<'_>) });
     w.pos().cast()
 }
@@ -104,7 +124,8 @@ pub unsafe fn call_printk(
 ) {
     // `_printk` does not seem to fail in any path.
     #[cfg(CONFIG_PRINTK)]
-    // SAFETY: TODO.
+    // SAFETY: The format string and the module name are valid to pass to =
`_printk` as required
+    // by the preconditions. Additionally we pass a pointer to a valid `fm=
t::Arguments` struct.
     unsafe {
         bindings::_printk(
             format_string.as_ptr() as _,
@@ -124,7 +145,7 @@ pub unsafe fn call_printk(
 pub fn call_printk_cont(args: fmt::Arguments<'_>) {
     // `_printk` does not seem to fail in any path.
     //
-    // SAFETY: The format string is fixed.
+    // SAFETY: The format string is fixed and we pass a valid pointer to a=
 `fmt::Arguments`.
     #[cfg(CONFIG_PRINTK)]
     unsafe {
         bindings::_printk(
--=20
2.47.0


