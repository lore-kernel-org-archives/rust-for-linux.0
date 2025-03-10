Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D5221576
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 11:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741607068; cv=none; b=K2NyMIxT5wen2sVEwTORkjU5gHQY+yn0L/3Xr8DfqGikziuCPlVfcUqpQ7tPIlpv/FtThjqj6dQ5GpXTVDkB4tqxXPmd6m9iJmdaIf8S3Et4q1SzFETWY7uyjuoB8nmyCBiuEJ/fML2CX82sJC4895tfITJg/HcDCAH6z71MNyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741607068; c=relaxed/simple;
	bh=0IrI9FdaopGtKLOIXX1VUbBx9Fs7ebXPM1YkORinNVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HxFDSEKxbKlRK7YfrQYDlaYdiNTHMaw56+YzxIwEjM3AxjgkP+LOeSP/8y0brIXdij1X7vlw9UUw/lIB4+LTTVL8T/v8Tlm6OZ0ea2jk1A5vAfxM3JUvG722zMIDlfRGVcTtfnFpvbWk4z1hzAep/IBgVzk5QTaX4r4iYU5GiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ssDbcpOK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ssDbcpOK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39127512371so2256919f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Mar 2025 04:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741607065; x=1742211865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IrI9FdaopGtKLOIXX1VUbBx9Fs7ebXPM1YkORinNVg=;
        b=ssDbcpOKw2Svsx5osKAkflwtEvh16vn5iXyIJXZQ3a+pKrhXiy9Nfng5y71PgM32g7
         6fyGLNEgOY4hyXXqvu+K5Y3y1cdU+vQR6AeHyKiJCXrAk25UTYlesg+PijcCya4k7O5/
         PFjgswoosbYnaHd7u7IdrN83BUozlNbgFV/EdvoVDRzYVOzScjPiZARz8VyJoLwz+XtX
         uyyUVN5rGPqn/ZuiN73GwdZ4OoXbwGqE8TrqpFvUWYUDN5GwgiLvNM+C6QlzSuSndE3k
         /GdNrqxmECAXwQd3rohn/Cw/K7RmwPkQcQuj+WmZUun0NXevagXy4AKA45jIx3gIGPm0
         /TJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741607065; x=1742211865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IrI9FdaopGtKLOIXX1VUbBx9Fs7ebXPM1YkORinNVg=;
        b=PNn1cpaiJyE1ocaqen/ztb6rsPTwTmvjHjcKozt0oWmNsxrHoLYbFs+RQBSiOKmsuB
         0BIgr9SS96veKoDkyUWhvtWsuGM4hK/ZTTlQHIQbpXxGwZDC5RR5RkpTwtle4m+rzDIX
         kjumYRX3iEazrXcTBprFMHpBQZSyeFjPGUzknC0Rchn7cC3hSxi8e8wsnqaydeed34RL
         gpkqu29YoO4RleCS1eQb/k2m11TLzYoOBXgCDqhNedPwceY+/GZ4l6lgFgVIEKmQmGvm
         no/IXjtd8wGh9gIeIccegmXK12Silah55Yzsz9YZ9Q1XmO4JAJFUs3pTZ6na2jJCWFC8
         cQRg==
X-Forwarded-Encrypted: i=1; AJvYcCVEacQjaMB994XjuDVd8Zcsfc2XPOkIPxQ6KRtaUtPtjohBcllV70DzVICqru+ZsOl9fqxI/p2c8ploYx/Hvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPOeCzQVyOlHt5IQ9hq42pkrYZaHl8MDnJbhZGwSl2P0RHaGYF
	McymKoV0INx3btzEl5QJcLQqjhdExpAlhhbj1GlPR0CUOIJ9IROf6n/UcZ2u8bA9AaLp0I53APr
	dYrJtrJWzNoSvskA+1iJaZaYgnTSw900zYH+P
X-Gm-Gg: ASbGncvpJBOJ39zncazJjQmZAiepc4YkX6f8ipxUXqfkvsGyBz+voLBNtDyW7VBo+m/
	DPdimrMs4CJ5Jbl/M2CFRmpKp+zFnUJf/cv8gC9KB9dXG+mrHeEg4oaQhTjS4tBZzVqjdAdRrsb
	hv8rH3SDXmQauKM/VDtxw5fpst7DKBtCDS1YmPCe0+d3675myweeqt6w==
X-Google-Smtp-Source: AGHT+IE7B1UYHeaXlm+Rs1PUlDtw0KdbyXU2RKfDQAGpxGR6ZJC6Lkc9/sArkb3lz0K5BFbuAd57jS8ndRkY2yPVbGI=
X-Received: by 2002:a05:6000:1849:b0:391:3fd2:610f with SMTP id
 ffacd0b85a97d-3913fd26306mr4676571f8f.13.1741607064635; Mon, 10 Mar 2025
 04:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310073040.423383-1-richard120310@gmail.com>
 <20250310073040.423383-2-richard120310@gmail.com> <Z860iWGtaEFMD2hj@google.com>
 <Z87JpNJU5gxN0YgS@vaxr-BM6660-BM6360>
In-Reply-To: <Z87JpNJU5gxN0YgS@vaxr-BM6660-BM6360>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 10 Mar 2025 12:44:12 +0100
X-Gm-Features: AQ5f1JpNF9ypxpEOLJQP_OHzmzJH77QM5OOCwzuX8EZKFBAaIB9z1lOqXLa0UJA
Message-ID: <CAH5fLgiUj7R4SvKYT3HGxqSDnjs4T6EKB91bX1JFe-a9a=fHsg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] rust: list: Implement normal initializer for ListLinks
To: I Hsin Cheng <richard120310@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, jserv@ccns.ncku.edu.tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 12:14=E2=80=AFPM I Hsin Cheng <richard120310@gmail.=
com> wrote:
>
> On Mon, Mar 10, 2025 at 09:44:41AM +0000, Alice Ryhl wrote:
> > On Mon, Mar 10, 2025 at 03:30:39PM +0800, I Hsin Cheng wrote:
> > > Currently ListLinks only supports to create an initializer through
> > > "new()", which will need further initialization because the return ty=
pe
> > > of "new()" is "impl Pininit<Self>". Not even "ListLinksSlefPtr" use t=
he
> > > method to create a new instance of "ListLinks".
> > >
> > > Implement a normal method to create a new instance of type "ListLinks=
".
> > > This may be redundant as long as there exist a convenient and proper =
way
> > > to deal with "ListLinks::new()".
> > >
> > > For now it's introduce for the simplicity of examples in the followin=
g
> > > patches.
> > >
> > > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> >
> > This change is not good. The ListLinks type has an invariant about when
> > the pointers are null. The existing constructor argues that the
> > invariant is satisfied because pin-init initializers can't be used in a=
n
> > existing Arc. Why is that satisfied here?
> >
> > Alice
>
> Hi Alice,
>
> Thanks for your kindly review. Indeed , I was trying to find a way to
> cope with "ListLinks::new()", wondering if there's any macros like
> "ListLinks::try_pin_init!()" to help us deal with "impl PinInit", so I
> try to send a RFC patch for it.
>
> Sorry I overlooked "commit 52ae96f"[1], it demonstrate a good way to
> handle the basic structure for "List", I'll fix the patch and send a v2
> as soon as possible.
>
> Still I would love to ask why don't we provide "ListLinks::pin_init" or
> "ListLinks::try_pin_init" to support for the pin-init initializer
> returned by "ListLink::new()" ? Maybe there're special reasons behind
> the pin-init initializer here ? I would love to learn if that's
> possible.
>
> I tried "Kbox::pint_init" but it
> wouldn't give variable of type "ListLinks".

Please see the examples from:
https://lore.kernel.org/rust-for-linux/20250210-cursor-between-v7-2-36f0215=
181ed@google.com/

Alice
