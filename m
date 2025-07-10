Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E22594B4
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 13:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752154819; cv=none; b=FEGJ4vGVT6dnOuL8o5HvG5+NH6oLAn2br1oGVe5bq5sitpPQ8bzhKqXaHWKoHz9qHScnNebXSGsQFliGyNanRj/cIUU5u9i8sJ3XRBSIYSqaHA7jPxM+b5scez+Sf25DB5SOfPOLBcMbdGw49FwK6qBdQiF9J7iyxZX2ESkHtiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752154819; c=relaxed/simple;
	bh=L8NAxkisOrUvB5X45MszjRrn1WdpFGJZaTdDegwtsNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJfFeyLm0sB5MbQNZPzVd01a4mr/gX55Y8O7ENL85q3000IOxSXR1M+o43RaqIrmGydrJC+hgRUUttzCaeYHUW7+AKmQBdOPnyqa5D4oBjXc8jO6HElSUfuutZ21UQIB5uKcrh/vBX+Flth8OH1WARyXwClf9D+qui4HVPFdaQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J6kWbWwh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J6kWbWwh"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3ab112dea41so605886f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jul 2025 06:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752154814; x=1752759614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4gK8SxTWD7UWQltVg6xSQeiZZywuBSSmhBPrVCrZSpc=;
        b=J6kWbWwhktu0zn0rmqPAT+d9t4PWigrqg4hIj2hrJUjrjk7ZqZXDXHaMBOg4y8hmUo
         wn7n8hxlyD73imVFAO9m3vdk6TtMd766+zqCYYyPX5/t0TVsZLy3VQRzBD29pe/4Ibm/
         M92I/QT+pw8NZhmIknNOn1u2rYAo+8Yz0GjyfGliuTeh4IFo6+LfVgWuRuH0/3nrGGFR
         DR3bhpB52lFRSWRVUlLEd4AWzkdrvGXHaORqu0ucsX5caWKWvD2QH2w8OK5iUPZDNuK6
         YQOOWjl72+gLSg2i5NW7WNqQZR/BMgJ3YTLdynYxGMVX85awrRbsK02ioAfDCj86lqCx
         RkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752154814; x=1752759614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4gK8SxTWD7UWQltVg6xSQeiZZywuBSSmhBPrVCrZSpc=;
        b=qtEIxOjXrbalhL5/Iwo60xmTnpU56rRP401fwhB4lhF66sPgLItR5Lfasp+qjhstHl
         kWjyzmmx7Bo1d9pW12+V2jHF5cl1QE9ptgK6Ac0cCapAw/IppX/MQn8J6NbT8MeK0LgQ
         DaDYno2wf+eLHOwHpdet7m9lWaSVqXv259scsAjMmFZtPdeRmGabhxxDGi51yIgSLhR0
         /7CZsueVibgIjDfbMYEFD/1iDQsoVliJEytqoSMltV0V4jpaw631gw+0J+CwDMg/P8F1
         tOTt3H6FQ5b4dg1cPAeJBt4DKkg8pErnSmyQBaXNckKuplE2el+KbSypcIsOe1Mq7DEH
         eFug==
X-Forwarded-Encrypted: i=1; AJvYcCVjD/RF1Tb94w0vg9CSYoBP6sFPk5pCwT5SCZEHnYiPEvM+U60vYs10XjAEAfx1biMXEU4uRj6bJ09u9c+f+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuHkydH385+UByKejOpJmggd7EmMG9dXiz2PoKJ5ZD4pSxRRdJ
	KWoOHYbjAYITjDVsl0IOywn1TgkNawyJriUhdX9GWxcSGX55uF1ASFrnHV5zJpfut7mEk/0yGYf
	GnGZ/mSL+uPgNIJoy2wrUCArTJovMCxaVHRnUTGJK
X-Gm-Gg: ASbGncvfT4XfjE1j2MmvP1b091Je6POASJV2QyNf7zzP9Y3N3jexO5elkNvWF1g6vVB
	uG8aICSNqXik62/raMsSPAWxQm1nnQDfTIbZKaphrKTmih2Iv8RKNdKjgR7fMqGbNvu/0snco/6
	IbewaeoUTSiENDro4HM4UGr2aPGWo51NpUEZTQuj/JwykrLohf71FW3zRe/f1688p9jnTD+b4Jq
	Q==
X-Google-Smtp-Source: AGHT+IHWb1Xq0/Oarnazs9jnrq9g3D/RI7LYjXDzHlYykaJcgX83KF6n4sioYqT/vG6R3lN9oMhfwlrmUvLkIfVqi5w=
X-Received: by 2002:a05:6000:220d:b0:3a4:ed10:c14 with SMTP id
 ffacd0b85a97d-3b5e44e94damr5777078f8f.14.1752154813861; Thu, 10 Jul 2025
 06:40:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-topics-tyr-platform_iomem-v12-0-1d3d4bd8207d@collabora.com>
 <20250704-topics-tyr-platform_iomem-v12-1-1d3d4bd8207d@collabora.com>
 <aGt6CZAUeuK0XnmP@google.com> <D7735793-D99E-44D4-945C-2AC0B500E1F9@collabora.com>
In-Reply-To: <D7735793-D99E-44D4-945C-2AC0B500E1F9@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 10 Jul 2025 15:40:01 +0200
X-Gm-Features: Ac12FXx_E1R9f789vX3XKeepzt_E4gBqlYxHx9ZWW5DK1vZvG_UyCpsA_of1z9Y
Message-ID: <CAH5fLghe0-s2SQ+_cwNmagw8depC+=6kUwUm_epLFz30k9gQJw@mail.gmail.com>
Subject: Re: [PATCH v12 1/3] rust: io: add resource abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Ying Huang <huang.ying.caritas@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 3:34=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> [=E2=80=A6]
>
> >
> >> +    }
> >> +
> >> +    /// Returns the name of the resource.
> >> +    pub fn name(&self) -> &'static CStr {
> >> +        let inner =3D self.0.get();
> >> +        // SAFETY: safe as per the invariants of `Resource`
> >> +        unsafe { CStr::from_char_ptr((*inner).name) }
> >> +    }
> >> +
> >> +    /// Returns the flags associated with the resource.
> >> +    pub fn flags(&self) -> Flags {
> >> +        let inner =3D self.0.get();
> >> +        // SAFETY: safe as per the invariants of `Resource`
> >> +        let flags =3D unsafe { *inner }.flags;
> >> +
> >> +        Flags(flags)
> >> +    }
> >> +}
> >> +
> >> +// SAFETY: `Resource` only holds a pointer to a C `struct resource`, =
which is
> >> +// safe to be used from any thread.
> >> +unsafe impl Send for Resource {}
> >> +
> >> +// SAFETY: `Resource` only holds a pointer to a C `struct resource`, =
references
> >> +// to which are safe to be used from any thread.
> >> +unsafe impl Sync for Resource {}
> >> +
> >> +/// Resource flags as stored in the C `struct resource::flags` field.
> >> +///
> >> +/// They can be combined with the operators `|`, `&`, and `!`.
> >> +///
> >> +/// Values can be used from the [`flags`] module.
> >> +#[derive(Clone, Copy, PartialEq)]
> >> +pub struct Flags(usize);
> >
> > Based on usage it looks like the correct type is c_int?
>
> Shouldn=E2=80=99t this be c_ulong because of:
>
> #[repr(C)]
> #[derive(Copy, Clone)]
> pub struct resource {
>     pub start: resource_size_t,
>     pub end: resource_size_t,
>     pub name: *const ffi::c_char,
>     pub flags: ffi::c_ulong, <=E2=80=94=E2=80=94
>
> In any case, we will have to cast this because __request_region
> expects c_int.

I saw that you called a C function that expects an int, so that's why
I suggested c_int. It sounds like the cast from int to long happens in
C code.

Alice
