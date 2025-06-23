Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AB3770E2
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 15:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692321; cv=none; b=VJwIdrwSh9K/WgtmJwWBvs9gVb9wTyJv8KR95fxztNLCg0IA9lOnjCY8iryePi6M2fZSSdDGjt3WLIhH/j7Kwkt97c3UpHLkgM/4rTwpmzTHCr5bo/EbDStDrrJHdddD17OrVuwFp6l+mhIaOjtOIhAdQvkuqZgjYpN8P34Fa2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692321; c=relaxed/simple;
	bh=rooemphzOqtubFfw/F97wIDqZd1so1tZE56RR6AJh4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tA6jBVClXe5NxXRTuRc1SslfCJdQXMEPJQslGyxy4TLABkJmR7JH2HBuS6X2KbF94fYIyBxYKumN6mOzRqNh38GULlptt52n4vU9yPbVFQFzns4tFD3cafM1h0aDBsDUgwjJxJ11U3DgoXJe8xFal0Jx5zRTiXHW4E4E+KGUsSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jcRyYChw; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jcRyYChw"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso3669920f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 08:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750692318; x=1751297118; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmXZjjSvv6KRZI/6FKBR1ZLR3DullsuqN4s2MM1/x5M=;
        b=jcRyYChwZ05ZY9W149+v1RAesLOW1R3rb6v9juG24u9Ou6qpjkBuL0bRUXcKL10RET
         Z6TzSf9LPMLE5MfUF1bfTo8Tf+39iarYFUgXYgSq8GZiqoP5E+BN4+7a51Bl7F0N4q2R
         gn2Iq9yxyqCX20fqY6AtWMGAQbdTEq3In+YMieQS+2N4cRpPZIrxkv/YgIwECmxltLIm
         zrHGVGnQHOYkDE6ISWlwjC0XZTDZBSymqrbvwfSyvqxG+CCOcAjuK8ag4pSVA+ypL78u
         CsQIx5+9OF73RlphUQm3x2XjC5vuEjcqK9r/7DcmrfAM9qIvvypuR2SbD3Vr6jPVp2Ux
         aZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692318; x=1751297118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmXZjjSvv6KRZI/6FKBR1ZLR3DullsuqN4s2MM1/x5M=;
        b=rIhrYYL1hZ0kIf8t5kC2xnS5DToO5mvA6YZxc/6KZswYkGkvVFCXJFVclv5uKQ/Pnx
         TWN3XAnbxsaER+Hbr52LVS0dRb65jnsLlQagjfTVk1FQI+tgAvnGo02a8PCYfAl5wVbv
         6D02rnBp2UHd+jdfhFbbnoq3++tjjkK29TcPN9ikL+WerVZ5Kd6ZG57tszGOY+Gp5brw
         j2UzTwEr9EJRWMWbXStFt0vF3S8ynJgb0Tl4bfL2qbW7ulBI8lQew59ZlURgjRnXbmEt
         zSxo4MGAqRNBU1KyUZwjPMnmfCGr+AzV9lOZiwd5qCQYZSBGLO9Bl1ZN8MZwTy/iBggQ
         6Q1A==
X-Forwarded-Encrypted: i=1; AJvYcCWvsMd9S9VAr4ioUrcViCJkUxHtXmIlOM9Gtn026rWUeo8JiwrdiSuo3XF3ORlTS9hbnIP5E5zt8Q80RlNy1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx48t6OpEz4J+3ydT8G2jW4Vo3oeoYtOQ9DFkJwof4a8YhKvOWp
	mEHpoWs/SEQbt8lyjLH5lSQKieDzz1BclkCFT4SH0HiYZP/6dJflK3/MVhirHc3Mv6RVScH6JSl
	PgUSf+QSxi/QzCk3TB99j57OrAOTMQTgMqPCOKgbP
X-Gm-Gg: ASbGncu7nMBFSYmP0Fc5AP8W1DNtKlExHA44hD2mRA3OxuyJFOWuCh5JNn8KMSZ9ACW
	zvIwFyPZ+dbxkxpL1Qq6+1BmDtGnt/wC4AdbExRpr7IOuSc3oZgW/XgWuN40ff4vY7rRQx/MI5p
	J8/5HWttj6P74qkWHRIqjBdF0C0cOo3iIHDhPAxjxPAVUcetOxF+C1CoQpw5n7rq1YPwG2vgc=
X-Google-Smtp-Source: AGHT+IFM///a/o7NHCUrhz8JPaRc40ICRJPP9JISkr8ZSl+zk8SDCl551tho6AamwirxjOCO4tDCa3hYmXK5w6/vb8o=
X-Received: by 2002:a05:6000:1a8e:b0:3a4:eeb5:21cb with SMTP id
 ffacd0b85a97d-3a6d12e5b71mr10700599f8f.26.1750692317667; Mon, 23 Jun 2025
 08:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-topics-tyr-request_irq-v4-0-81cb81fb8073@collabora.com>
 <20250608-topics-tyr-request_irq-v4-3-81cb81fb8073@collabora.com>
 <aEbJt0YSc3-60OBY@pollux> <CAH5fLghDbrgO2PiKyKZ87UrtouG25xWhVP_YmcgO0fFcnvZRkQ@mail.gmail.com>
 <aFlxVlMYWig1N2Hy@cassiopeiae>
In-Reply-To: <aFlxVlMYWig1N2Hy@cassiopeiae>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Jun 2025 16:25:05 +0100
X-Gm-Features: Ac12FXxyv0kAilreQ5Zm3W4KKmQb04F-9AgepG9LhG7dkMGHyJnrjjLP_SjGXbo
Message-ID: <CAH5fLghr7Z4NGdwZO6MqnYCpwp4pwKVaTq78dnm3PNYYvL8cCA@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] rust: irq: add support for non-threaded IRQs and handlers
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Benno Lossin <lossin@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 4:23=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon, Jun 23, 2025 at 04:10:50PM +0100, Alice Ryhl wrote:
> > On Mon, Jun 9, 2025 at 12:47=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Sun, Jun 08, 2025 at 07:51:08PM -0300, Daniel Almeida wrote:
> > > > +        dev: &'a Device<Bound>,
> > > > +        irq: u32,
> > > > +        flags: Flags,
> > > > +        name: &'static CStr,
> > > > +        handler: T,
> > > > +    ) -> impl PinInit<Self, Error> + 'a {
> > > > +        let closure =3D move |slot: *mut Self| {
> > > > +            // SAFETY: The slot passed to pin initializer is valid=
 for writing.
> > > > +            unsafe {
> > > > +                slot.write(Self {
> > > > +                    inner: Devres::new(
> > > > +                        dev,
> > > > +                        RegistrationInner {
> > > > +                            irq,
> > > > +                            cookie: slot.cast(),
> > > > +                        },
> > > > +                        GFP_KERNEL,
> > > > +                    )?,
> > > > +                    handler,
> > > > +                    _pin: PhantomPinned,
> > > > +                })
> > > > +            };
> > > > +
> > > > +            // SAFETY:
> > > > +            // - The callbacks are valid for use with request_irq.
> > > > +            // - If this succeeds, the slot is guaranteed to be va=
lid until the
> > > > +            // destructor of Self runs, which will deregister the =
callbacks
> > > > +            // before the memory location becomes invalid.
> > > > +            let res =3D to_result(unsafe {
> > > > +                bindings::request_irq(
> > > > +                    irq,
> > > > +                    Some(handle_irq_callback::<T>),
> > > > +                    flags.into_inner() as usize,
> > > > +                    name.as_char_ptr(),
> > > > +                    slot.cast(),
> > > > +                )
> > > > +            });
> > > > +
> > > > +            if res.is_err() {
> > > > +                // SAFETY: We are returning an error, so we can de=
stroy the slot.
> > > > +                unsafe { core::ptr::drop_in_place(&raw mut (*slot)=
.handler) };
> > > > +            }
> > > > +
> > > > +            res
> > > > +        };
> > > > +
> > > > +        // SAFETY:
> > > > +        // - if this returns Ok, then every field of `slot` is ful=
ly
> > > > +        // initialized.
> > > > +        // - if this returns an error, then the slot does not need=
 to remain
> > > > +        // valid.
> > > > +        unsafe { pin_init_from_closure(closure) }
> > >
> > > Can't we use try_pin_init!() instead, move request_irq() into the ini=
tializer of
> > > RegistrationInner and initialize inner last?
> >
> > We need a pointer to the entire struct when calling
> > bindings::request_irq. I'm not sure this allows you to easily get one?
> > I don't think using container_of! here is worth it.
>
> Would `try_pin_init!(&this in Self { ...` work?

Ah, could be. If that works, then that's fine with me.

Alice
