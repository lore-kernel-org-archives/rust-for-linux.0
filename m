Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1492D2390
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773672001; cv=none; b=QK/1wS5qePKNI3PjVJn+APhpAho7YWznJ/ebkMUmjtbmbkQ8qJurLaXI9r5Lg20uVEji5XqT4XZ7jEc1njaV1S9H1XzXTgVRXAtnSzsT9uUrISmY8zfHJCD7IfJn7J/hvPeaX/fMt09DorO0LBgkPzsEoYwB5tDyu/JsWwp0NvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773672001; c=relaxed/simple;
	bh=aiJBXUWZoCkL9JBuYE/sxZNUSZazvV9zx3ST2l5lDx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEQQwx20ze/fwpwUUIks20IKDjvUs38R1L7nykl8zPzHu4vVMWiEeaauncT9pHNZGPmsrlF9Ip8EOg+og86RV57BUSArp1wd/VbbGlVT4ea57x89Vjoj7vG6TnuHjBQeNKOX8UfueAHSV89eLBBVFBKCfm9Bcsh9loNVdJ4+qoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alice0.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alice0.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-794719afcd4so39869187b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 07:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773671999; x=1774276799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7BHFtsWS3nzJGP60mw6clGRoSuZRuFIm6vIHikDKbQs=;
        b=RrTIXVGBoffUREO4LV7bLlUuQ57tOf4nT/abX9x5AOtELR6wYQlByXAYL4ltaRT6ec
         HN6k88R8NMYg6MTc7tZf+0myzXBfw2WaqGfHbALCwfjfCwsPorzj8xJnsDe4E7f9vrvw
         IBzVP2offzFf71L+lreazJQ/tqGu2fWvfMqDhs/8iLTKvm5VJ71ljZnLCJkdViw+idZG
         IvFm49nfwAk23OQwJSL2Jsy9EnIs7ei42yP3vSQAcYrcMiS2oneofRgS6SPymZ3fys4x
         lwJi6RasrWtVIGO730ChqMYhdYNEa8E+74VAXMt6/l2AXW4jmTN822QLrXYBO7+ZW/XL
         6pSg==
X-Forwarded-Encrypted: i=1; AJvYcCVaK5kswRsZEAlOQOg/rVXtrOCWYHJJ7LyHDEYSoa6YoKJJ5RygcgsxVwoUy6vf9CcajR7P8b5MclQqdtxI/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMazCkivEJig8RhykKgS9cyS9qjIn81W7SlAn+uPnYhN4lT15U
	IvsDP5kL0QRpseeNVE2WNYxVv7QSf+55/iFC4pEZXX/gIEJJ5yGWPKG1O4+ezUNwVyc=
X-Gm-Gg: ATEYQzySatpzk+rNjzyTb8H+2IBZy8oZBYpHAFncWjnrn2O8KUJAPnzBia1+aZD6b3g
	PNR62V3+DjQDy8KBQn1yG0ick1FrKokQ3xBh/8DZlFCwlLitwgUVY84tVq0TxdfuPcpnjj8Oica
	tKFtUsTa+3jphQ5BnPhrn5HgXYgbbjmDHJbA3tiqTaybLTCOaeZZAloTYs4pxZeRqRKsezvg8eg
	L905x058SzGLO6fTpyAYF1aA8G86x2vHNexGfQz8VCi3JEmHo45w6XpnPPR2QUKv8yvuCVZPs6h
	/zsgebBwTiuFF7iNb8dt79FadBTdXsAIAGpjQhNaIF7fLNzsZM8XTIpK5vwPmLxSA+8M9APH6+/
	6K4w9q2TXviUiP1+05zCbqR6iytsY3UmRHaVxukmpBik7f2HeyJCqVZz9sZgGWEOmcSNxwQ06li
	8GRItJp4XVynGLvnIYymwMMJUVuXTVcMaaO4kFYvLDZr497IdpVDG9vQ==
X-Received: by 2002:a05:690c:c4fa:b0:79a:3a33:94a with SMTP id 00721157ae682-79a3a3360abmr67295257b3.4.1773671998939;
        Mon, 16 Mar 2026 07:39:58 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917ee5845sm88319327b3.33.2026.03.16.07.39.56
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 07:39:57 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-794719afcd4so39868557b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 07:39:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoARjrW1Yrpi2PAQrriD/m710y4FCiOSSDnIZHS7HoOeJw9mFMCarKVcuD/2qd6pbnahp4MmSfHlZi9d6uUg==@vger.kernel.org
X-Received: by 2002:a05:690c:48c9:b0:79a:5164:bb16 with SMTP id
 00721157ae682-79a51651643mr31543487b3.28.1773671996349; Mon, 16 Mar 2026
 07:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316082111.398170-1-a@alice0.com> <DH45DQFO909K.1JK6IKMX51ZAV@garyguo.net>
In-Reply-To: <DH45DQFO909K.1JK6IKMX51ZAV@garyguo.net>
From: "A.L.I.C.E" <a@alice0.com>
Date: Mon, 16 Mar 2026 10:39:41 -0400
X-Gmail-Original-Message-ID: <CAFJ+MKWy+1mi1XS0WNYoX0fapHNAcJsFjHrAURaAU+BxV1HcqQ@mail.gmail.com>
X-Gm-Features: AaiRm53cWP9IK-BmSPVwDoxVOaSTS5HVlK4v_jKWnrBsgGNVuUoPoTFYqKPHQpY
Message-ID: <CAFJ+MKWy+1mi1XS0WNYoX0fapHNAcJsFjHrAURaAU+BxV1HcqQ@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: completion: mark inline complete_all and wait_for_completion
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 10:51=E2=80=AFAM GMT Gary Guo <gary@garyguo.net> wr=
ote:
>
> On Mon Mar 16, 2026 at 8:21 AM GMT,  wrote:
> > From: Fabricio Parra <a@alice0.com>
>
> Your email header is malformed. It has "Fabricio Parra a@alice0.com" in t=
he from
> line instead of expected RFC 5322 format. People won't be able to just re=
ply to
> this email and get it delivered to your inbox.
>
> Please check and fix your git or email configuration.
>
> Best,
> Gary
>

My bad, I completely messed up my git-send-email config while I was setting
it up. I'll send a v2 with fixed headers shortly, thank you for pointing it=
 out!

Regards,
Fabricio

> >
> > When building the kernel using the llvm-22.1.0-rust-1.93.1-x86_64
> > toolchain provided by kernel.org with ARCH=3Dx86_64, the following symb=
ols
> > are generated:
> >
> > $ nm vmlinux | grep ' _R'.*Completion | rustfilt
> > ffffffff81827930 T <kernel::sync::completion::Completion>::complete_all
> > ffffffff81827950 T <kernel::sync::completion::Completion>::wait_for_com=
pletion
> >
> > These Rust methods are thin wrappers around the C completion helpers
> > `complete_all` and `wait_for_completion`. Mark them `#[inline]` to keep
> > the wrapper pattern consistent with other small Rust helper methods.
> >
> > After applying this patch, the above command will produce no output.
> >
> > Link: https://github.com/Rust-for-Linux/linux/issues/1145
> > Suggested-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Fabricio Parra <a@alice0.com>
> > ---
> >  rust/kernel/sync/completion.rs | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completi=
on.rs
> > index c50012a940a3..35ff049ff078 100644
> > --- a/rust/kernel/sync/completion.rs
> > +++ b/rust/kernel/sync/completion.rs
> > @@ -94,6 +94,7 @@ fn as_raw(&self) -> *mut bindings::completion {
> >      ///
> >      /// This method wakes up all tasks waiting on this completion; aft=
er this operation the
> >      /// completion is permanently done, i.e. signals all current and f=
uture waiters.
> > +    #[inline]
> >      pub fn complete_all(&self) {
> >          // SAFETY: `self.as_raw()` is a pointer to a valid `struct com=
pletion`.
> >          unsafe { bindings::complete_all(self.as_raw()) };
> > @@ -105,6 +106,7 @@ pub fn complete_all(&self) {
> >      /// timeout.
> >      ///
> >      /// See also [`Completion::complete_all`].
> > +    #[inline]
> >      pub fn wait_for_completion(&self) {
> >          // SAFETY: `self.as_raw()` is a pointer to a valid `struct com=
pletion`.
> >          unsafe { bindings::wait_for_completion(self.as_raw()) };
> >
> > base-commit: 79e25710e7227228902d672417b552dd1d7e5d3b
>
>
