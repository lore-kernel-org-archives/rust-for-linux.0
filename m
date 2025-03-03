Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE81E9B3D
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 08:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740989839; cv=none; b=qD1bQKWZHSEHLHTKxNFVMsh5pPpmOKLFYeNvj5uUc44iIDVgq7JpMzjLui9DjmJvyJDKFRTwbFekPAu4x2LsHvckT15hXhURlxBd9nYQIKDWlDLNsCHnyXYHFAZhYvW/ZAwbZCRFDTW2Tsx08D0Bd7Pa335tO7zxlLL4MhmV2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740989839; c=relaxed/simple;
	bh=eEQbaOUOg9Ct9BioLacbMGP5yC7XwczqQxZikWutjqc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1o4n5LnBRFe0coQGanPeXQm4nrOg3tpPewCLCSauAlyt4TOsAW3nLmMvs6+EyMo/c/4wfBPCR8Gs1wEF8yFigG1XewyQf9gbeo3syywQLgW4HF/c3i/GSl4WCIzllJ5Ib7oJ79wG1vtJmAQPKuapEWuImJfwnDHcitJKfYORd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T0b68H6F; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T0b68H6F"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-390f69f8083so1723985f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 00:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740989835; x=1741594635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jA0dpvdILr7SLpPAx2h6QOM8iRHWeLVPpniq08kJ/yM=;
        b=T0b68H6FLXpHdwEpRUX/y/5eqnRLhVVn1Fk0wl25AjztpR469wnvopeV3sg3iXLno7
         xsSd5hLfT02JRNcqWKJFtdZdNl5F/4zkqvrKEl2TL9qFs+dZaCSIu977hbmXsrPPqT8P
         52SF/beL6xHheB9esqRXL2AsHDB76ycmQZdmH5zgIGYvyVGbCueegrB4LkPLwMQHH+mZ
         HjoZQiTGS/m2qqgAIW2LVROSTbb+ESbgggFK+aV7BYhcfWVJUf2aXcUlwNpZZUk0OjMm
         t3MzE4WUi5xdktHez63XUeXmOkGyJ5H7iWwW2j+gVHvVOrL5Whcfve5p33ItBV5Tz0tD
         2/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740989835; x=1741594635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jA0dpvdILr7SLpPAx2h6QOM8iRHWeLVPpniq08kJ/yM=;
        b=t6TIJB4Q4Qvl+TTPsUmvX04Pwn7p5FghgtggkfAvvOkpFcTR7e+wZCt8gI2F7KsiGL
         plnJbZ6U3yBEm7D4BnPx2xHRA8swNKOx5mmdz1FWxB2qVWL1yh0zKb9d1JjrS6gm70C+
         /hi4Utr+DQzbxklMqg5REkGpKxnrS/NdUPKuc41lToc2XZ+/FIzOe1CCYCojLYHgbXR/
         q4gY+0YT3zCqF4EVSHcg7++XAweLmQ38Na5Zrtl9CxFtpvKNWtYUsk40h28pongJh+r6
         OGqjFTEq7n/XLUOciCDONfZUaU7aBTseiCraCSXqpyiSL3/j851OYWZd7/juxLe4p4Vw
         yX1g==
X-Forwarded-Encrypted: i=1; AJvYcCUrLzNwaOq4RAyqcWSwiuxKYXw1vpDUEz1Rd3con3D0cvR6jUntMFQ8RVuGp1dxyExHX1N0IkB4Bl4XhJ18Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYrcX55YAAW3ixKIuqorHsgdlzCxuZN7btPz2OfhCP31KCkSoK
	mdI3XaA7KVzMIi1Of+MdvagNW4PhrXmlbpnEG8eo6MVnxXF/UiJILTmBW5LpnGdzcZ0TgTncq4F
	7VnizTXC0hjVpmoGOrbiiM5VWixxvAowmA67W
X-Gm-Gg: ASbGnctK+C1hSNdHL9zAn5Dle/r5hWfVM/lVeTDFFXPqtQ9FrjE9aXDfMrOFE4G3xSX
	8hOiN21jAo1TcebDbiCfjg0aDq2rB7LDCOTw1PEZHbzkBZhn+k76Ec/WMHwQbRuny4u/wAFllhk
	TXPFFfXDCg4fnie8BeBVPhjTby/3M7PkQjgYl9nTyL/tdk++xyX5fl4tFW
X-Google-Smtp-Source: AGHT+IFSYdPrfAT2czicp0H2L34T0MTTXxUfMLTH4DIdYq6oZerde5+Qjh15AbNt/anCVI0itN956I2sXy82N+8E8pk=
X-Received: by 2002:a05:6000:1acb:b0:391:6fd:bb81 with SMTP id
 ffacd0b85a97d-39106fdbd84mr2778396f8f.50.1740989835532; Mon, 03 Mar 2025
 00:17:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228-export-macro-v2-0-569cc7e8926c@google.com>
 <20250228-export-macro-v2-2-569cc7e8926c@google.com> <CAJ-ks9nn1_gAqz9f3H9O47QA7dwk5MaT5YK3NQtZtUJHyNXbVg@mail.gmail.com>
In-Reply-To: <CAJ-ks9nn1_gAqz9f3H9O47QA7dwk5MaT5YK3NQtZtUJHyNXbVg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 09:17:03 +0100
X-Gm-Features: AQ5f1JorySWi-KYwhNh-r8Q996knGQo2fkyzux-yfstz0yHdBixCTqR1Fqf-3Ok
Message-ID: <CAH5fLgjgfgaoMP7TD46u9OsYuje6yA4ooM+6eCd5whAx+tiTqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: macros: support additional tokens in quote!
To: Tamir Duberstein <tamird@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 4:26=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> On Fri, Feb 28, 2025 at 7:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com>=
 wrote:
> >
> > This gives the quote! macro support for the following additional tokens=
:
> >
> > * The =3D token.
> > * The _ token.
> > * Using #my_var with variables of type Ident.
> >
> > Additionally, some type annotations are added to allow cases where
> > groups are empty. For example, quote! does support () in the input, but
> > only when it is *not* empty. When it is empty, the compiler cannot infe=
r
> > the item type of `tokens`.
> >
> > These additional quote! features are used by a new proc macro that
> > generates code looking like this:
> >
> >         const _: () =3D {
> >             if true {
> >                 ::kernel::bindings::#name
> >             } else {
> >                 #name
> >             };
> >         };
> >
> > where #name has type Ident.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/macros/quote.rs | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/rust/macros/quote.rs b/rust/macros/quote.rs
> > index 33a199e4f176..c18960a91082 100644
> > --- a/rust/macros/quote.rs
> > +++ b/rust/macros/quote.rs
> > @@ -20,6 +20,12 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
> >      }
> >  }
> >
> > +impl ToTokens for proc_macro::Ident {
> > +    fn to_tokens(&self, tokens: &mut TokenStream) {
> > +        tokens.extend([TokenTree::from(self.clone())]);
> > +    }
> > +}
> > +
> >  impl ToTokens for TokenTree {
> >      fn to_tokens(&self, tokens: &mut TokenStream) {
> >          tokens.extend([self.clone()]);
> > @@ -40,7 +46,7 @@ fn to_tokens(&self, tokens: &mut TokenStream) {
> >  /// `quote` crate but provides only just enough functionality needed b=
y the current `macros` crate.
> >  macro_rules! quote_spanned {
> >      ($span:expr =3D> $($tt:tt)*) =3D> {{
> > -        let mut tokens;
> > +        let mut tokens: ::std::vec::Vec<::proc_macro::TokenTree>;
> >          #[allow(clippy::vec_init_then_push)]
> >          {
> >              tokens =3D ::std::vec::Vec::new();
> > @@ -65,7 +71,8 @@ macro_rules! quote_spanned {
> >          quote_spanned!(@proc $v $span $($tt)*);
> >      };
> >      (@proc $v:ident $span:ident ( $($inner:tt)* ) $($tt:tt)*) =3D> {
> > -        let mut tokens =3D ::std::vec::Vec::new();
> > +        #[allow(unused_mut)]
>
> It'd be nice to mention the need for this attribute in the commit
> message along with the added type annotations.

Adding a note to mention that when the () is empty, not only can't it
infer the item type, it's also never modified.

Alice
