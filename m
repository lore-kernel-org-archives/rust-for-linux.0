Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FE61864
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 11:39:50 +0000 (UTC)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C071AB
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 04:39:49 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a2478862dbso3633167b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 04:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695987588; x=1696592388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kO3djRAZLJYuBbTTlbndF1Xl8s/Qz6RFkMVlQaeSmUY=;
        b=TDwtCzIOFT9LfYq8RycakEtpiYgY9RnbyJIzQeipD7X7r26AMAz4trdK4E0ZjTsTsa
         FPNTOR/VqNkPn8K46uxzxcg59+h279CmKlRwhcmAldaAeffgoAHcJcwQJweqbEDLTz30
         RleFvNj5XobE98XnnJtnv2C/HwO7D01f+eP1MldplY2BK3Ot6xTH7sLidGwZ6QV6aZiS
         Z/NGjCPh2FksC195jpdvmbN8lohi4u6eNA4gTenQdOk4VTztKW3uv4S1qREGdmeTOPYb
         D9JYGDccsWRmKE8ZXmpGh2fvSPlCMEgtPkFuIhmJR4Q3c2BY/WvQn8dSAcQ2ENM/L21O
         9V6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695987588; x=1696592388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kO3djRAZLJYuBbTTlbndF1Xl8s/Qz6RFkMVlQaeSmUY=;
        b=W5J4nH5jju1tzw1zT/PQ/fS8rEfB3PO3AtpnISn4v2xQbVXEjWvX/IpHxPKkIxlAUH
         VUhdPCi+2ZpmE4qx4OC8gBMOfK1p1rTAPSJ6aOija2zIi/4ZADPrn3xd2JiF/1MT+f+g
         nXawPWJF9uDXV6CLK/uRulXiXtafDYzVA3NbVKeQ0HW6TA9VJDgLu5kKgvkNIf3iXK4o
         oGjg/xRcfODk3HudwuOxq4t0uE4exw/jYGEBrpHDSvR7y7UAtnbj+1L+GnzIADERTe5S
         eNS+zfO1xWCOoDAzzt6uUZEf7LinlgIZGTYYfE6WbbXff1CSCn0MrO00zgAdS7ks5HGL
         OR1w==
X-Gm-Message-State: AOJu0YyZ1uJ/XDrTs4FTPbDrcUCzDhN50RA63qbp8lT6ciWpZxtnmFob
	vYKFAIVwoWTNhSMK6meHc9RRcZtJOaj2SeazVIg=
X-Google-Smtp-Source: AGHT+IEaLaaybY+RrVn5jqLTp6ESs5Vl5f4B7deCvJLEJQdLzE9nXTgOiebCX23/O4V1xdhs979EcVQc/Gg7h/HKBVY=
X-Received: by 2002:a0d:d54f:0:b0:59b:be67:84cb with SMTP id
 x76-20020a0dd54f000000b0059bbe6784cbmr3904972ywd.26.1695987588277; Fri, 29
 Sep 2023 04:39:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <2023092900-manpower-runaround-859a@gregkh>
 <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
In-Reply-To: <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Sep 2023 13:39:36 +0200
Message-ID: <CANiq72n6XuRdhzOYPQ=RRSYVEN4LqwxScoD-hYuovPhAp_16nw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	tmgross@umich.edu, benno.lossin@proton.me, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 29, 2023 at 10:38=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> As I wrote above, it's guaranteed that C and Rust code never
> diverge. However, as you said, suley it's troublesome to maintain this.
>
> We could directly use enum generated from C's enum at compile
> time. Then we can remove this conversion. The names are not pretty
> from Rust's view though.
>
> Any concerns from Rust side?

We have always wanted to generate as much as possible automatically,
but we still want to have the "final" types and docs that we would
like. In order to achieve that automatically, this could mean:

  - For the code part, getting exactly the `enum` that we want (i.e.
the one we would have written manually, e.g. without a `repr(*32)`),
including the conversion methods too (being discussed at
https://github.com/rust-lang/rust-bindgen/issues/2646).

  - For naming, we could use an algorithmic approach to convert them.
Or simply use the C names if we are really going to directly use the
generated `enum`. After all, these would be fieldless Rust enums, so
it may not be too bad.

  - For docs, ideally we would be able to provide them in the C side,
and then show them in the Rust side. There are several sub-approaches
here. An easy solution would be to show the C docs as-is (i.e.
fixed-width font), but it isn't ideal and would not allow us to use
some of the Rust-side features like intra-doc links. Another one is
automatically linking the C docs from the Rust side, but that assumes
the C side is well-documented. Another would be to allow to write the
Rust docs in the C side.

Ideally, for all this, we would augment the C side to give us more
information. For instance, by converting `#define`s into `enum`s
(thanks Andrew for being open to this -- it would already help
substantially), by providing documentation for each enumeration
constant, by specifying the underlying type (C23) and so on.

Some of these extra details could be considered improvements to the C
side too, so those would be likely fine. However, other details may
only be needed by the Rust side -- but if we allowed to provide those
in the C headers/types, then it would mean we may only need to
maintain things in a single place.

When we started the project, we didn't want to assume the C side
could/should change, so we went for the "manual" approach. It is the
most flexible and also allowed us to showcase what can be done when
cleanly writing abstractions (and their docs!). It worked fine so far,
even though it takes some work. As long as we can make mistakes
compile-time errors, it should be OK.

In summary, we should definitely automate as much as possible, but
only as long as it gets us to a place that is reasonably close to what
we can manually achieve otherwise.

Cheers,
Miguel
