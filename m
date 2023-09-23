Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B922117
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 10:19:20 +0000 (UTC)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03D66E48
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 03:19:18 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d8164e661abso4022171276.1
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Sep 2023 03:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695464358; x=1696069158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcodTrF/q/YxDBqa1KS4wZDt9dqq6ZT7R9s7gbxMvik=;
        b=JSAHUCb8Kw+wE17ozYtZ096MTDiqwMlprCviBh3jI/uK3401Tc/xIrde61Gd24L4Tw
         3McTpO/dNFaQioIavurQ8/KFYlFwYDD/HEgJc16xu4GLNMkA99z0qWtNhtyfqelnP0el
         pb3SFbru438qLrA9Y+a6yMYzoH+jDbulsSdMD03xLX1mZ/CJ9d6ejHfaXaox6ZNMX7ZM
         WMPOnFJr91nEK0Z/ENpoJfF2ZR7m9aBLRGfskkjQlfmPufn2Aw4TP6PCt/sPPoOntlCT
         dyxJQGhGruChK5buScJDL8UlNjhzUuclXzKC33qHdZWdSTZsY5Pqmj8uN2dWrUseI8gC
         BmHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695464358; x=1696069158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gcodTrF/q/YxDBqa1KS4wZDt9dqq6ZT7R9s7gbxMvik=;
        b=NhPH+AIr1uJsqS5y7l3yBzFnPzD9pONpaWgzLM7FAmxeZcjLFbJWzK82RDh8Ur5Pl/
         O2TzNbE09XpWr1i9ZR1LmhZwiBLH5d3uzLzE6kpavYfpOyHLY279oM7PXlhRYHO9ttBl
         qgjBN7D8Q6jF/F2OqW1txuxNKwH96Qu6FVfHPVza0DcaziCeKGhW2ZOt+aA3HuDM+xfH
         JJNGnzgKpwMJAN1FiiD2gHJ/VZeSys1sXN5L3Tiwglsi+IpFf+RLdhUgtHCRqhDou8Xa
         03NBfSk17RUbNz0OL+3NdQ9Gv9OHXQ8Ug4XZNOkshbEiX5v6I/w9ucy1sMljSbBRbDQu
         vMsQ==
X-Gm-Message-State: AOJu0Yz0sx8VtDRYlwMX4CRCGaxZrBOitK2Jw3RtJ8MKANPTpZDr8toa
	cbwp2XxNsKkc8X1x0PYn8abpLUYd9GnYIRtXGu0=
X-Google-Smtp-Source: AGHT+IHD1MLnRobCai71A4EpXHnbkh5vGDMwdj5vcqR43mrnIvw5gS3Jc5MqXZvn+/s/LUKU4bpkmAX43JUcfeTbbvs=
X-Received: by 2002:a81:92ca:0:b0:59c:b22:b858 with SMTP id
 j193-20020a8192ca000000b0059c0b22b858mr2099001ywg.9.1695464358144; Sat, 23
 Sep 2023 03:19:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-4-fujita.tomonori@gmail.com> <dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
 <20230917.213248.712797486250583805.ubuntu@gmail.com> <CANiq72nBoj=skGOpp0LbARDo1U-ev-GWZad=hq3iVBsQBuwA-w@mail.gmail.com>
 <1299bee8-9378-4a13-8cb2-3b47e0dee417@lunn.ch> <CANiq72nkmL5jEqdnj+OoDk+Vja_jVUdD+EGneF3h+kdFSOJqPA@mail.gmail.com>
 <3dc9a1ea-fb04-4b9e-abf9-08165ea3b8c5@lunn.ch>
In-Reply-To: <3dc9a1ea-fb04-4b9e-abf9-08165ea3b8c5@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 23 Sep 2023 12:19:06 +0200
Message-ID: <CANiq72nnX5T4TLVpn9g7_9EDP0gudQAAqOc1oSvotsgKYUs8Jw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file to
 the ETHERNET PHY LIBRARY
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 23, 2023 at 3:36=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> My limited understanding of the Kernel Makefiles is that they all end
> up being one huge Makefile. So i think in principle you can place the
> files anywhere, and direct any object file towards any target. So i
> think you should be able to put the file for the kernel crate anywhere
> in the tree.

Files composing a Rust crate are automatically found by the compiler
following a pattern starting with the root of the translation unit,
i.e. it is unlike C.

It could still be done hacking things around, but we preferred to keep
things clean and then go for the new build system.

> I would prefer to keep the Rust file next to the C file to make
> Maintenance easier. We are less likely to make breaking changes if
> everything is kept together in the source tree.

Definitely, and as I mentioned, that is our plan. There are other
benefits too, e.g. reusing existing patterns in the `MAINTAINERS` file
(i.e. not having to add extra ones just for Rust).

If everything goes well, I would like to have something for LPC.

Cheers,
Miguel
