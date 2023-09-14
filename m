Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C7A210FE
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 19:42:28 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB3D2698
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 12:42:27 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a21b6d105cso171269666b.3
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 12:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694720546; x=1695325346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6YxwM42kLNGUnQ0mwCNT5uodVQ444lAyeasNbXAfcs=;
        b=KS6R/Wzt+etYL6zdc7UPJVbiPzzBmkUzhJSHZiASEcq94ZpQo7uMb+q6Q3LH0h/cne
         9jRiMQhyC4VnKWphdxXVGrXbaAsAjHBMFC66KWtsgXZ/hPJjR621sjpSyEph9PVaG5mF
         TWVIPbC1G0J7Li1dg8KrN7x7cDAHxVZ++Q6j16XwM1i4TDV3oW8fpikNxiH1v4+m03JD
         35yjayR13nRQADprj4usbLKaqekJtNCNMhPoGzxni0OcT7UTxL6Ern/2qiJD/RXlPX+E
         VlVbZU/kqTtB38L9e+8ynHqWbAzWu08IhPUmxHOjSeCpVMxQvCGf/5S0z12QA3zFn7/w
         IA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694720546; x=1695325346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6YxwM42kLNGUnQ0mwCNT5uodVQ444lAyeasNbXAfcs=;
        b=MzDoGKzWb2w5DnMAu+QYfVvZ+bo6sFBSi4VKP4dgvgAdsx6UJAOd0LTGEXIru2uMP+
         c0GRaNUpxygjKgKjY79skaZ+aBhQ4Dn0vruDVqzSnbiPZLSsNbuxfiBppBaA7N6vQNfT
         OotXB2a58ElGYMQiBec4Fqi7oUJfOFB6rugCo4LFxpEkpNSYDhndBo/434YSaKCvLe6e
         7865EiyRyK3j2EI0AAZ8qhgTFlhVASAOwyqkvJoMk0HZZYBNcj82mKbAziG1hPV8WRyQ
         40ckRzFVYotfO3/GY++1cbJVF/bA5o+PBK7rP/X9UTT5i/TS3VDjqN9RFIozq7l67E0D
         +dEQ==
X-Gm-Message-State: AOJu0YyIlk6DLpO1ev9VMu6nTVQfqOZ+dfQ4D5iihI33mRWFm8tu1Xfd
	dSs7QwZso2PLqqocU5SeI29UUr33wcPn4GhPZfU6wQ==
X-Google-Smtp-Source: AGHT+IFCIOyAsTqtaDCtYal3i6Sf2aIE40HRNADjxbk8n2OwpDRkMAs09/WYg+BaDvcuFrtxzDtmXqskFuS3FlGb77Y=
X-Received: by 2002:a17:906:20f:b0:9a6:5453:2018 with SMTP id
 15-20020a170906020f00b009a654532018mr5950120ejd.27.1694720546339; Thu, 14 Sep
 2023 12:42:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com> <CALNs47vAj=dLtAUiG0WGKJoZZuWRCXF8Wh8zPO+O1NUJ68Z0Sw@mail.gmail.com>
 <8a7e010e-b99a-4331-b7c4-e1c9b7782e94@lunn.ch>
In-Reply-To: <8a7e010e-b99a-4331-b7c4-e1c9b7782e94@lunn.ch>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 14 Sep 2023 15:42:14 -0400
Message-ID: <CALNs47vv99ri+2w=P_T7pYxH33x-6ftAyS_CeQqaRXOw38-jjA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2023 at 8:39=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
> [ ... ]
> >
> > These can embed the C bindings, but it does look clunky
> >
> >     pub enum DeviceState {
> >         Down =3D bindings::phy_state::PHY_DOWN as isize
> >         Ready =3D bindings::phy_state::PHY_READY as isize,
> >     }
>
> Just for my own ignorance of Rust. Does phy_state::PHY_DOWN refer to
> the C enum value:
>
> https://elixir.bootlin.com/linux/latest/source/include/linux/phy.h#L507

I actually stand corrected: we generate enums as consts rather than an
enum, so `phy_state_PHY_DOWN` would be correct. But yes, that gives it
the same numeric representation of the C enum value.

> I can take Clunky when i know i have the compilers on my side ensuring
> the two implementations are better in sync. Using this, it looks like
> that:
>
> 1) The values are guaranteed to be the same, no matter if the enum is cha=
nged
>
> 2) If an enum value is removed, the Rust code will fail to build if it
>    is also not changed.
>
> What is not addressed here is if an additional value is added to the
> enum.
>
> What some sometimes have in C is an enum value _LAST, which is clearly
> documented to always stay at the end, new values have to be inserted
> before it. Would it be possible to do a build time comparison of
> phy_state::_LAST and in this case Unknown, and fail the build if they
> have different values?

The `Down =3D some_value` pattern lets you convert from one of Rust's
enums to an integer and guarantees its internal representation, but it
does not let you automatically convert in the opposite direction for
the reason you mentioned. So, you still have to provide a conversion
like was in the original patch

> +        match state {
> +            phy_state_PHY_DOWN =3D> DeviceState::Down,
> +            /* .. */
> +            _ =3D> ??
> +    }

But the exhaustiveness is tricky. `match` is always compile-time
verified to be exhaustive, but there is the caveat that C enums can
technically be any value even if not specified (Rust enums can only
ever be on of the specified variants).

You and Miguel discussed that a bit but to summarize, you have the
following options:

1. - convert with a match, unknown states go to DeviceState::Unknown
  (like this patch does). The downside is you need to check for that
  extra variant everywhere you go.
2. convert with a match but make it an infallible operation by
  returning a `Result` type. You have to do something with the error at som=
e
  point
3. convert with a match, bail with `panic!` on an unexpected value.
  Of course this is heavy handed
4. assume that a phy_state will never have any value other than
  those specified in the C source, which then allows for exhaustive
  matching. This means that if a variant is added to the C enum then the
  compiler makes sure it is handled on the Rust side, but also means that
  things will silently fail if we ever get a value that isn't in the C enum

I think what you may be asking for, and what would be ideal, is a way
to do all of the following:
- make sure that every C enum variant has a Rust representation
- match that exhaustively for the conversion
- panic if we ever get something else because it means the C side
  produced a bad value that is probably causing problems there too

Unfortunately, I don't know of any way to do that. #3 comes close, but
then you panic on "value added in C that we just forgot to add in
Rust". But maybe this is okay since it means the code is unshippable?

This is kind of a good question for RFL in general, maybe the others
have thought about it more.
