Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B6F171D2
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 23:17:42 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01E7194
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 16:17:40 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3214d4ecd39so2655699f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Sep 2023 16:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695424659; x=1696029459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdAEW/VMKnnyh4JgzsIiYKZXW8KX6pRbc/22HkOLgDU=;
        b=IctfzmOM+0SxsISlYiWb2CerSO40El8JkLGXhHR8ygWoq+gDTCP9hEvL8iUQ4Gw8MI
         wXjkOwh3FFq90B4eFSGqEFNx8tM+xMFi42QeMxCr+Z5CZIN8RL5sNw3OMDAk3I5ExQ3D
         nRjHNDxVuvMyyGTj98HtsdGK6hcjiKW/wh+w84dHIlsRLq7x/cRDbnFFHXULpmp9kAlb
         64NCQqouHb92nrUTVmUg/sFch7eGKjFTVsnMWMq4uFsekwTdKIFrIww4+QPkwzCBwpgc
         558s2hzw5MnNVXI184AQ267v0moZ2Co9WqNfair2mVqrF5EK+5E7A+xP7DLQlaMC8EW+
         TJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695424659; x=1696029459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdAEW/VMKnnyh4JgzsIiYKZXW8KX6pRbc/22HkOLgDU=;
        b=NkcdEsFchP8pIFXkirl+ki9pFII26oE8sq6y89rtogwOxDDfzcSmBYW6KfaS9bVyAB
         r8jpbQ1sMTjK7FWtG/ngJprPDj+GxEDksl2ebboFplv5hUfwYSA14HqEsoEcTkivCuxZ
         iaNk2GSHV7KVM00SYUD3Otdmjq9Aqz7It9QPiA82tFaucm+aulEwvSf8ucV9Yo9Mn2yS
         MV6VcmZRFVBuXS81Lma+jmh/FE/uYXLDtPLeDQip3GWdwoEpf+oAI9pGdUb+vWi0mMSO
         64eVikD/IzI7AFByHnH1+CA+UH1/qR9GzpKrE8y9QUUS9VLiTMgyR16kFhYLCEsuvhCx
         iBog==
X-Gm-Message-State: AOJu0YwIP95yJpOyrlzt+dTiXJwiHOMjEfVn/U42sVTHan5g9LZHbqmw
	U3wQzIFo68oBnKiXs4jyuzXPwoOcqvuvo8dNsZZeUg==
X-Google-Smtp-Source: AGHT+IHINWUQ+MoiLHp7bXuPg2F80yTI1gLWfknrHO6OyzpveWLdSqhM0XGEYln356Ba3zsuPDqfA+OwcEpi3Ix9sVk=
X-Received: by 2002:a05:6000:715:b0:31f:fb7f:d701 with SMTP id
 bs21-20020a056000071500b0031ffb7fd701mr956931wrb.9.1695424658979; Fri, 22 Sep
 2023 16:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-4-fujita.tomonori@gmail.com> <dd12e8b8-16a0-4cc2-8b0c-78386ce2dabc@lunn.ch>
 <20230917.213248.712797486250583805.ubuntu@gmail.com> <CANiq72nBoj=skGOpp0LbARDo1U-ev-GWZad=hq3iVBsQBuwA-w@mail.gmail.com>
 <1299bee8-9378-4a13-8cb2-3b47e0dee417@lunn.ch>
In-Reply-To: <1299bee8-9378-4a13-8cb2-3b47e0dee417@lunn.ch>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 22 Sep 2023 19:17:27 -0400
Message-ID: <CALNs47tUFNFpbPP=vrLLjra0odPjivmw1mGroppAYxt=nrnE4w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/4] MAINTAINERS: add Rust PHY abstractions file to
 the ETHERNET PHY LIBRARY
To: Andrew Lunn <andrew@lunn.ch>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 19, 2023 at 12:34=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> So a question from a none Rust person. Why would it need to be in the
> 'kernel' crate?
>
> The PHY driver is a kernel module, which optionally can be built
> in. My maybe overly simplistic expectation is that the kernel runtime
> linker will link undefined symbols in the module to symbols which have
> already been loaded in the kernel, be they C, Rust, or assembly. The
> symbols just need EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL() so they are
> visible.
>
>    Andrew
>

I think that the abstractions just need to live under `rust/kernel`
because the way to handle dependencies hasn't been decided on. I
believe this is in the works but just not here yet.

The drivers themselves should be able to go anywhere though, kbuild
knows what to do.
