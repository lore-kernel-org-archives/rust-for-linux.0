Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C60275B08
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691465; cv=none; b=X8qzrO0confER4qTPr2oHmv/6qxUA2Z3uY2mVICUsfVoYJBoMiqlL5hldO27fQahL+PD/bLNbMf5g6XoW9K8NlVjIB+h7kkvgI5jfeOLSvDeb+Eln/0SqBugDpxCf/nIceU5Eot5vKUeyvg8lpVbajkcnbKTLLZKDEadMD8dXeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691465; c=relaxed/simple;
	bh=jEv91z8zM480LSWJXkafqleo76LfcQrG8VpYyTTB9GQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEZauPEltpVv3CRigoMM00bIt2Mkwlm2hmJ89aeuEzGFYc5Gz3PjdiIFbUheG/htKRxOtp4dNdcx72Bw7gwz8ivi7+Aou1DrNJXaLhxfEan29OQvKdIYacEtLxc8CQRaNIT18TiRawhBYGGaUK26G7CSdGuNmmfToncldwpV4os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HwwSmi2C; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HwwSmi2C"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45363645a8eso25596445e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 08:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750691462; x=1751296262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fi5o2yaz4+s089OaAYieOhB0VgSKSBKPZ+EJth1lI+U=;
        b=HwwSmi2Ci8pwPsCPLJmohd49l8nNqzM5fn2MRY9hdGeQqfs66XnokI2tjqFGnnmVOv
         U+s+E5yvHQ8G9p1sxhIP3SFOdoV1RysYH1+t9/1WH3uWyRGAWrKRgpl9C9MNXo8ONHhY
         kATx97WCWonGwYP4ku2Qmz6qfSNQkURtXbhe5ocx8xo6xSjfRnIvh1gVdbR+j+tpgL9v
         vh0W4I1/Ecu4o/2okTTVJ5o9nmFEP5sOPvYYxwhYEtQAuXEK5zHvOWt8RcAUgVW1zgYI
         ZGiirHAxRA2fQj1Ob4qFAXl/jyCm/d+0aRwx9/1gxFsUv64Op5MWnPqF9NursGgaKS+p
         2qdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691462; x=1751296262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fi5o2yaz4+s089OaAYieOhB0VgSKSBKPZ+EJth1lI+U=;
        b=nwc0p06PE9CibFU0Pr8OM1et6lQn2rwEF7mSv4Pv7W1kIj6N69ZbKUrcob3hsds541
         YYXwf07YCiD76GjXBcVyPi3BfjFsg68mbP5wyjkuJjZAKrI3e63CtoOZfaxz9yROxETj
         uJTkpvPSE9AskzbS9+FAgrpNeJ/ObU1/0GqFzkhX1xvijFMqBj8ITIsLbZxUNmrr4c7n
         fswv8QjQ2S9AwJA0o6jpuO+Sa4no4HKowi9urnj5psO8nd+m+6GvZWw+vlMJCIc4jLzK
         RD2XqMHghpLXZXKZ/hcASifzVMYAZiFmdH4uJFg8W624fj7/b8p2wp9MLe/e4tyqUvSB
         C2EA==
X-Forwarded-Encrypted: i=1; AJvYcCV4usc1lFESyR3ymfdFXEabtjpystwn21I1f0+KAkuW/v8tUOIaA8v7BypXRUGd9NGiaudUgTwVV+a8WY+C9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz93e+hD4ohhts9PiGZ/3vbYLdv4eueWsPKzrAyC1Mk9LXgw+I7
	CAi4ehvxhXivE60foDbTeS1+b3yDhU97rZqQ4vyZn9/FPQwBAC9IuYhyrYLPlAcpqD2vVRx2i3W
	1x9AvOrx9K6kmcGpuBMI0igHAnyJ0DFH25UaqEOBR
X-Gm-Gg: ASbGnctXInfzlFp39JyG3K84JEuO/Juf7Fdi8/T01A/MBl/WVti8vXAtAp1UPrDVe4m
	tA8yAYTydpGtOXC2dNRA5ZkWl5DaNNc/BkN/+H2rguzeVd2gRtDh2dPnxn1jjjgX3j0B7s4HIfR
	r3ZiYZDHYxNG8PaBdzHFJgL5yzGX7Y9FC1mKZ3k2PDR9VWZzUoXQUhrHRWy4+cgzbU9UIb0x4=
X-Google-Smtp-Source: AGHT+IGLuRvBZFI6cdaCxGSmIWXt3Z5HBr/dVeBKXUEewyNHiYzysYkKBKA0JlEWFc8BK13gMXdn7dAlCj5WVU6zCnA=
X-Received: by 2002:a05:6000:40c7:b0:3a4:d3ff:cef2 with SMTP id
 ffacd0b85a97d-3a6d12d8000mr10443314f8f.27.1750691461929; Mon, 23 Jun 2025
 08:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608-topics-tyr-request_irq-v4-0-81cb81fb8073@collabora.com>
 <20250608-topics-tyr-request_irq-v4-3-81cb81fb8073@collabora.com> <aEbJt0YSc3-60OBY@pollux>
In-Reply-To: <aEbJt0YSc3-60OBY@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 23 Jun 2025 16:10:50 +0100
X-Gm-Features: Ac12FXyhU1Gn_zPojF0g1yFViLygeSL94KPpCnlAMWtGWsT6z9SRZ83CnCo--bI
Message-ID: <CAH5fLghDbrgO2PiKyKZ87UrtouG25xWhVP_YmcgO0fFcnvZRkQ@mail.gmail.com>
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

On Mon, Jun 9, 2025 at 12:47=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Sun, Jun 08, 2025 at 07:51:08PM -0300, Daniel Almeida wrote:
> > +        dev: &'a Device<Bound>,
> > +        irq: u32,
> > +        flags: Flags,
> > +        name: &'static CStr,
> > +        handler: T,
> > +    ) -> impl PinInit<Self, Error> + 'a {
> > +        let closure =3D move |slot: *mut Self| {
> > +            // SAFETY: The slot passed to pin initializer is valid for=
 writing.
> > +            unsafe {
> > +                slot.write(Self {
> > +                    inner: Devres::new(
> > +                        dev,
> > +                        RegistrationInner {
> > +                            irq,
> > +                            cookie: slot.cast(),
> > +                        },
> > +                        GFP_KERNEL,
> > +                    )?,
> > +                    handler,
> > +                    _pin: PhantomPinned,
> > +                })
> > +            };
> > +
> > +            // SAFETY:
> > +            // - The callbacks are valid for use with request_irq.
> > +            // - If this succeeds, the slot is guaranteed to be valid =
until the
> > +            // destructor of Self runs, which will deregister the call=
backs
> > +            // before the memory location becomes invalid.
> > +            let res =3D to_result(unsafe {
> > +                bindings::request_irq(
> > +                    irq,
> > +                    Some(handle_irq_callback::<T>),
> > +                    flags.into_inner() as usize,
> > +                    name.as_char_ptr(),
> > +                    slot.cast(),
> > +                )
> > +            });
> > +
> > +            if res.is_err() {
> > +                // SAFETY: We are returning an error, so we can destro=
y the slot.
> > +                unsafe { core::ptr::drop_in_place(&raw mut (*slot).han=
dler) };
> > +            }
> > +
> > +            res
> > +        };
> > +
> > +        // SAFETY:
> > +        // - if this returns Ok, then every field of `slot` is fully
> > +        // initialized.
> > +        // - if this returns an error, then the slot does not need to =
remain
> > +        // valid.
> > +        unsafe { pin_init_from_closure(closure) }
>
> Can't we use try_pin_init!() instead, move request_irq() into the initial=
izer of
> RegistrationInner and initialize inner last?

We need a pointer to the entire struct when calling
bindings::request_irq. I'm not sure this allows you to easily get one?
I don't think using container_of! here is worth it.

Alice
