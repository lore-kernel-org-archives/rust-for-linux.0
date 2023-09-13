Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736D9AD5C
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 22:14:32 +0000 (UTC)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7821999
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 15:14:31 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d7ecdb99b7aso330009276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Sep 2023 15:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694643271; x=1695248071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AG5fBwc5KN0m8WNTk9acpQ/Cde0GxHOKBtx3rHi4dbI=;
        b=gbPR/hn8puLIaQeDwRcCs3VfAQ2WB+EHrg0CWAFDJaDRbaCyNDMrIMnwGdgmH4DA2o
         mKLsjV8Vf61IMhNzLISOy0UX+2loSWvrMF6qnhW779vayFXMkLXX6gkVuTZoguhmmOMl
         xxBoVa0YwsCrcr+hAYjEEQdegHscejGZbGdM6nhmcR250EYsKBWbgaeyoVT/B+vXFLtL
         CjABO2RlL70ruuvRgSelhZMMFcE8YQTS5dL3xxihKyax4GaWSyTrnashvxr7k74oDzBx
         Oi+s+waF0xHpeWnm9WKqRrnRnpWe/4zDeUQhToqx0KDDBBoUX8B1eVmRkFGriqDbxa1f
         38Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694643271; x=1695248071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AG5fBwc5KN0m8WNTk9acpQ/Cde0GxHOKBtx3rHi4dbI=;
        b=RfmK67h/feiDBf1JpZ9O5CU+/KpbVrYmH2bU+8BC7FH3BGev5dEX+q2tlGQ7wbiRcw
         eg2VLE98yZ0kXkmhB3WjeF1MvSvjfK4HvvFay2bISbBTwuqOkgbwhE+2L7OeB7i1axfO
         n/nHmXlrlZacDnu6nSrM9sdjNQNDOevrR9DIk3rNcMiw4MYJDAVLt6og0+h8+zOhAkXj
         G/bvVOxlDiDoKj5PJrpHuNwwRQ8KSCUY/Av5JNpahrNAnI+Rc0P4XLqPvNzh2p0pzafw
         sJQGth7o0leSzrqbJwqJcmEt9765If6lZ2BaiXfOR9oKLXJw2rYOXaXBGAAA7mklEtgr
         sQhg==
X-Gm-Message-State: AOJu0Yy6GOtBH6ohU3rKD/ZJMgDs1AFtymdRhGqbxEzZ3BroY0h1CeTp
	Fh+7Wrv5eA7LgnNgzhQkKs46dw3LImLaQ6K93Fg=
X-Google-Smtp-Source: AGHT+IEDRYAlEemO61MAfCxetit8A/X9lEL7ZBiBtzxF0Aio4wDP1UacgnwkpPUQkdU+BjWcGPN+PsXubV/hsbLkhN4=
X-Received: by 2002:a25:738c:0:b0:d3f:208:b8ea with SMTP id
 o134-20020a25738c000000b00d3f0208b8eamr3820806ybc.11.1694643270805; Wed, 13
 Sep 2023 15:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com> <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
In-Reply-To: <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 14 Sep 2023 00:14:19 +0200
Message-ID: <CANiq72nPjG2insBR3STcFhKcPo2ORforrinSAYHf18aJz7saCA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Answering a few of the bits here not already discussed -- and, by the
way, thanks a lot for taking a look at these early RFCs and making the
effort on reading Rust code.

On Wed, Sep 13, 2023 at 10:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> How does this scale when there are 200 subsystems using binding
> helpers?

This should be solved with the new build system. The plan is to have
bindings per subsystem (in your own folder etc.), as well as the
abstractions etc.

> > +            _ =3D> DeviceState::Unknown,
>
> This should not happen, and if it does something bad is going
> on. WARN_ONCE() so we know about it.

An alternative could be to return an error instead. That way having a
`DeviceState` already guarantees one has a valid state.

> Does Rust have the concept of a bit? Anything like the BIT() macro?
> We have seen bugs where developers have not realized these are bits,
> and so have defined 1, 2, 3, not 1, 2, 4. We can avoid that sort of
> error by using BIT(0), BIT(1), and then the next one is obviously
> BIT(2), not 3.

We have some bit utils around, but not upstreamed yet, yeah, e.g.
things like https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/t=
ypes.rs#L312

Cheers,
Miguel
