Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FD62C190
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Feb 2024 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707144544; cv=none; b=JO0e9vpknzukUFaDmmhc5KeYSDkLhXmlNJ75r8QI/a2hKaQu4ojESlQZ7Xg529FYIWeYBtWA3zWjpKVuf9XI80oZosJJKznuhechd8cgMCeLAi2/VutLGStS/y1I36kfu2wkQ8siWD/b46tc3H+w/NTqhLUSp1UTKxUgnqALD3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707144544; c=relaxed/simple;
	bh=/6DJvGzD35AFyjPhLhl7t1+UJViPSj6sdjJTOyOO1hE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MZV81k9pH7NosqLy1b/tQVivKhBGOFkTeEw03YhHaG8axBWBOewfh15qV87dzoc37YEEkxwCnBmInOSkH0ToAfZh9cQXJ1/ZSrInsE+0adz7GmSxnd2+NsErVc9p6YPGN9zIeSkidtQFOwl7QrmDhU2AO4H0C9gDobO484C+Q0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yZEV13tb; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yZEV13tb"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7d6275d7d4dso1881701241.2
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 06:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707144541; x=1707749341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=si+3V1Q5dweK4VJCAZCFOJEa+8h/+ibTZSZYbpiMglo=;
        b=yZEV13tb8KbXCayul5+92WhKE3k9jSdNaYNFvtW6vjA6DuOlOh0Qz2se13I/bfVhpx
         HSFF+OvpOEEYETdk7SIDYY866pVMann4tqT0mhAfw9P/oGxg4OQEmpxRPS3gDhakQOIA
         BEjuc65BhePrwoloHsbVIgZIecBI509+gI/A5T5lEqyLaa9+rUVs6zPz1jWmfpxf76PT
         n3qRoiEGMR5bYovTYxubd4hWQikxHY4nZmbuJgoaPjhxjsDZuKm2rDyYSkzx3i21TCRH
         +LREgnowtjmzigk68jAvHfoJ+S4dMpPaLGzY+SE0mAyUH4hT/zEBaGPWn3pCsMgn6TfN
         NL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707144541; x=1707749341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=si+3V1Q5dweK4VJCAZCFOJEa+8h/+ibTZSZYbpiMglo=;
        b=lsWpC7IlN/Nz6osOkUjAQ7jz1nYeTzpCdabskO4ZPw3QM6WUzqE1bcvgN7W4zycuYL
         VLZsKaEkge8bUan3aeRfdDF4TtohWwxLXtcpXQk5aC1qZTLX4QzTo8QcX/1yYXei7vzs
         7YvabxW+BV9gQdcLuUuuKWoTouCATr84PJuRfyDG+yi0RBgeBt2Rs5NQpUj9zHd2bR52
         gDDIyVgbyEiLIUX+Rd39OXRkuGqjuTo2WKawN3zkT7tE5KEm78OGjTG1c2r09uQ25ifB
         MGCwR+hxyesO6B9usmDJJwjxy2Numu0QVPmydnykNZqn0Voml44fMWCKMKANHDBEWFY0
         E7Kw==
X-Gm-Message-State: AOJu0Yx9V3QIKPzm0kIcE6z22DyZaZvH1i31zkr/N7Xj/zSsYCsurGSZ
	ymudBw7y5oPt6k2j1YskuPx4fFmGhVPFzo31+5y8W7pCsvIs6TD7BJyMc9kmhS+LAbmmWtQinzE
	0sctrEZzFeDDbirlHa8qXVM2XSCifvG/BsOce
X-Google-Smtp-Source: AGHT+IEOrFcrIwn+L1T9aDMR4eOnP6k6MWt4C6cG5ajciw/rAtnY5mpL0579+cWlyrTYqRjrT16iXfsJLtOrcSTFMwo=
X-Received: by 2002:a67:e94b:0:b0:46d:2ba7:c531 with SMTP id
 p11-20020a67e94b000000b0046d2ba7c531mr14090vso.6.1707144541230; Mon, 05 Feb
 2024 06:49:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240203182735.295946-1-tahbertschinger@gmail.com>
 <CAH5fLggUe-O8Zh+y-Lh7pquRNEWsEorkoT=xXjjOC-Cp7gcwyA@mail.gmail.com> <20240205144638.GB296718@fedora-laptop>
In-Reply-To: <20240205144638.GB296718@fedora-laptop>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 5 Feb 2024 15:48:50 +0100
Message-ID: <CAH5fLgjPNP1WHhJiWWtHnPd-DMOC_NnFUUTsfrZ5MNddUWq+qQ@mail.gmail.com>
Subject: Re: [PATCH] rust: place generated init_module() function in .init.text
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 3:46=E2=80=AFPM Thomas Bertschinger
<tahbertschinger@gmail.com> wrote:
>
> On Mon, Feb 05, 2024 at 10:45:19AM +0100, Alice Ryhl wrote:
> > On Sat, Feb 3, 2024 at 7:28=E2=80=AFPM Thomas Bertschinger
> > <tahbertschinger@gmail.com> wrote:
> > >
> > > diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> > > index d62d8710d77a..d09be1bee397 100644
> > > --- a/rust/macros/module.rs
> > > +++ b/rust/macros/module.rs
> > > @@ -225,6 +225,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStr=
eam {
> > >              #[cfg(MODULE)]
> > >              #[doc(hidden)]
> > >              #[no_mangle]
> > > +            #[link_section =3D \".init.text\"]
> > >              pub extern \"C\" fn init_module() -> core::ffi::c_int {{
> > >                  __init()
> > >              }}
> >
> > Perhaps this function should be made unsafe? I don't think there's
> > currently anything preventing safe non-init Rust code from calling it
> > directly as-is.
> >
> > Alice
>
> That's a good point. That makes sense to me; I can work on a v2 that does
> this.

With that fixed, you may add

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
