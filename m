Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B423210B
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 12:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1+68d3A"
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0B7B9F
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 05:25:52 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-59c215f2f4aso54202117b3.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Oct 2023 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696854352; x=1697459152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6z5YYybfFDyzl7Y6Qs/2G20fX1dijl2UdcJ6VBd874=;
        b=H1+68d3Ap5tdEAwR4YwkBYRIUPEhZgDqyrI0PrSz6HlXQ1hovwcf228xYGmMpkghBX
         del/2edWwZJinWhHjqWYKV1DvETjT3Wn9cmV6yE+nXjGGgOAGyQxxBGOK+0C3xKn93pr
         +VFHSF/hlXxnGnLTxdh5F/CNhfC91V/U/1Z6P3NvaqRvmgVsuqdl+/ypPO2Ui7Bz0bFK
         V9kOuO/ZL7VsQwneQVH05Ne7H2Z5CniHtx3Y1raE6r/8BbbctaFKxATSFpvBgz4FD7Yu
         55ku76/nX4iBVr5ll4yKJs5dWEdVj1XQs0T8qY45EzXi8jFTuwafZuRU4da42x17qPLZ
         33Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696854352; x=1697459152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6z5YYybfFDyzl7Y6Qs/2G20fX1dijl2UdcJ6VBd874=;
        b=qVHLAL8FT6yGGLXGacHfQrRcS9ff1AeL1BCLMpNVVKAzWKw3XuD6+LmSyQNHa7hKdS
         z9pcFPNFtedvOQyjorE9ptGFuEw4cWqhqiPaMKvewEPahIFoH2uPS7yzY44HXqlacxxA
         LkiTxw5gqB7ao6A4K6gFxoSWnXYHjjYHBNTjUcGj8ySqCR892EkhnWgRi8yQuxQA7Uoa
         UdZAhiBNfOgYYK4Ml7mADZKENqilK44sPhhwLZY9hLelvsI3mPuVduz5RqPjmUwJKZ05
         Z7yFioSE2MtBcEVvqWWHrH8XN0BvqVafpw+GAzbo7GEZLyGt3forxzBFXWHwquaZSxiQ
         ihuA==
X-Gm-Message-State: AOJu0YyV3MzWe6P76ZVD3RWZSvbC+Y9Cb17HjHwkwTZ8WoU2Tw2jM42L
	plq4+6SiHtxnxBcW/OCIJJJNlWwFG8QKh2qSF1s=
X-Google-Smtp-Source: AGHT+IFVVGhxBTlHsIwVy12IlUS3FAGlp8FGeZA717aaxcTQCPemsjee7LodMZbVhYxXaEatpUaI1NRvqBStfcAoeaA=
X-Received: by 2002:a81:8316:0:b0:59b:9f06:1706 with SMTP id
 t22-20020a818316000000b0059b9f061706mr15484170ywf.26.1696854351904; Mon, 09
 Oct 2023 05:25:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <2023092900-manpower-runaround-859a@gregkh>
 <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
 <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com>
 <00d380b7-f0fc-4784-9f30-c98e630efacb@lunn.ch> <CANiq72n-w2Oknzn-yqa2F7NOWkSOv3AHPcmxw8OtpjFTKeJ5_Q@mail.gmail.com>
 <78da96fc-cf66-4645-a98f-80e404800d3e@lunn.ch>
In-Reply-To: <78da96fc-cf66-4645-a98f-80e404800d3e@lunn.ch>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Oct 2023 14:25:40 +0200
Message-ID: <CANiq72n3kHrJKXApx2eZ6MFisdoh==4KQi2qHYkxmDi=TYaHew@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Trevor Gross <tmgross@umich.edu>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org, 
	benno.lossin@proton.me, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 2, 2023 at 9:08=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> The kernel is documented using kerneldoc. It would seem odd to me to
> have a second parallel set of Documentation for Rust. Just like Rust
> is integrated into the kernel tree, is configured using Kconfig, built
> using make at the top level, i would also expect it to integrate into
> kerneldoc somehow. I see the Rust API for PHY drivers next to the C
> API for PHY drivers. Its just another API in the kernel, nothing
> special.

There are several differences that make it unlike other kernel APIs.
For instance, the Rust abstractions cannot be (in general) used by C
[*]. Many concepts simply have no equivalent in C.

Furthermore, the goal is to develop safe APIs in Rust that then Rust
modules can use. Modules are not supposed to mix the C and the Rust
API, so ideally a Rust module developer needs to only care about the
Rust APIs.

Therefore, so far, our intention with the documentation of the Rust
abstractions is that it can be used on its own as much as possible
(possibly linking to C docs or similar approaches to avoid duplication
as I was referring to in my previous message, but that is an
implementation detail).

In addition, the Rust native documentation system is quite good at
what it does. If there exists a Rust plugin for Sphinx that is good
enough, then yeah, we could use it.

[*] To be clear: one can export functions to C, of course, and the
kernel could actually have C functions that get reimplemented in Rust
(keeping the same signature) where it may make sense. Some people have
talked about this in the past, and it would be nice to see eventually.

> I just use 'make htmldocs' at the top level and out come the
> HTML documentation in Documentation/output/

Yes, this was discussed in the past and agreed to, and Carlos implemented i=
t.

> But kerneldoc is not my subsystem. MAINTAINERS say:
>
> DOCUMENTATION
> M:      Jonathan Corbet <corbet@lwn.net>
> L:      linux-doc@vger.kernel.org
> S:      Maintained
>
> So this discussion should really have Jonathon Corbet involved, if it
> has not already been done.

Yes, of course. I asked Jonathan about this early 2021 and he has been
following (and reporting on) the Rust progress in the kernel for a
long time (which is very nice).

Cheers,
Miguel
