Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C638EA1
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 00:49:27 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80B31120
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 17:49:25 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31ad9155414so3729144f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 17:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694998164; x=1695602964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIOzty32akt9zw+lDGaUBxROdjfr0kI/7T2QCqbXkYM=;
        b=gDafHoS0dbXrbxWlddNhu6+3AOGh8dQA8L0kNtLoMiR+Mhrsmv2eKZxLZixRP3Mc3E
         LFFrrVrR3fMP+ab6g1ke0zE+NrXcVyzt6VSdh9k8KS0WnvnCEsqQqYMgE9cm8H57NHAQ
         JZaz62s+DldK0WA8xKlb3/qy4KAH3SS6CLGtfPo6E7jt7evgW5M/6RR726rNhSPhSjHE
         Bs8EFcUwRmCMdZ51ZP4leQLyM8kmAntpbxMkm8f+8a+EkQt1uRNP64zX1XBDEAawBXDe
         xxAzd08sjQZXBQUD7apdiGWTm8V0jrQnEbcsvJYkLyEThxMa5oe8TRluAggKCxVPRHgE
         NAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694998164; x=1695602964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIOzty32akt9zw+lDGaUBxROdjfr0kI/7T2QCqbXkYM=;
        b=pXxCA5Z+NCL1OtftDupK0puHxckwM7NoN/xCMSLyqf7Bf8X5nZOhLlL/9msVkhJ8Tq
         geYeE3KOYWJOGDFYVXaqomU10pJaUGLX1NNJTuxKxzdLaeC0uAtZB4ZlO5unUOPbEgKq
         1MTUNcDq/29ITslQ1b8js82Rg5Y6Aj1TlPUvwsMBooN9aFl06i3AMcrLaJ/4ZruDNKff
         fTFoivtxonkX4Mr9CXzKxe5yGn8ENhr3zPoZ/aMzO/uGyHP/MXwZr2l8U9c+bbbFcqaR
         ifsIvFWtWnaDxrT8nIvlUZoqOivdmtsnj7KM8RH7ql1nSkquvhbTluXozqfZR/kLcLz+
         4GnQ==
X-Gm-Message-State: AOJu0YwTrL0xVgbT278EibLA4nSLZielLoZ0JunP3geAH+cQAXsYK9Xg
	bdEy3ywW3OmChKg+1vEvoIwQspi2yjWDPmLemaX7/Q==
X-Google-Smtp-Source: AGHT+IHDS3wD9Or0FFRC6qB1aKLmV6hDI9AGsJhdhjMStgQKe8Ha2ZjYy5rwC5cIclk8oc/Mn/l7is6P6KYSF50Amdo=
X-Received: by 2002:a5d:6102:0:b0:31f:e759:d68c with SMTP id
 v2-20020a5d6102000000b0031fe759d68cmr5084606wrt.71.1694998163919; Sun, 17 Sep
 2023 17:49:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com> <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <20230917.191708.2174483069021340663.ubuntu@gmail.com> <3fa5407b-c6f4-4e39-a743-812838b94d28@lunn.ch>
 <CALNs47uCFDJ5xz7_3qkjszmmAFXzA=dwB7CM4+sVeVtnSTZAcQ@mail.gmail.com> <f55a3e84-3865-432b-b009-c4051f9a3b0b@lunn.ch>
In-Reply-To: <f55a3e84-3865-432b-b009-c4051f9a3b0b@lunn.ch>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 17 Sep 2023 20:49:12 -0400
Message-ID: <CALNs47sRKxnD1NhJZaoorEZ2xyLjAse23RmkacoPuCiD7Enq=g@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 17, 2023 at 3:08=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Sep 17, 2023 at 02:42:02PM -0400, Trevor Gross wrote:
> > On Sun, Sep 17, 2023 at 11:07=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> w=
rote:
> > > [...]
> > > > If abstraction code just declare a function, a driver always need t=
o
> > > > implement that function.
> > >
> > > Ah, that is not going to scale well. There is something like 250
> > > struct phy_driver at the moment. We keep adding new ops to that
> > > structure. I really don't want to have to modify all 250 of those
> > > structures when i add a new op which only one or two drivers need.
> >
> > This concern is about adding a function pointer field to the C struct
> > without needing to update all future Rust drivers, correct?
>
> Partially. Assuming Rust is successful, and in 10 years time we have
> 250 devices supported by Rust, i also don't want to have to edit all
> 250 entries when a new member is added to the Rust version of struct
> phy_driver.
> [...]
> O.K, that is the behaviour we want, in terms of NULL, or a driver
> specific function pointer.

Currently if you add a field to the struct in C, everything in Rust
will continue to work without changes. If you want to be able to use
it in the Rust side, you need to update both the `Driver` trait and
`fn driver(&self) -> bindings::phy_driver` [1] but none of the
implementations.

> A follow up question to this. This currently does not apply to PHY
> drivers, but the concept of a structure of function pointers and maybe
> a few other data fields exists all over the kernel. There has been an
> effort to make them all const, so the C compiler puts them in the
> .rodata section. The kernel then uses the MMU to protect it, so it
> really is read only. That protects from a class to attacks where a
> function pointer gets overwritten and then jumped through.
>
> Can Rust create these structures read only in the .rodata section? Can
> this driver actually do this, which would be an improvement over the
> current C PHY drivers?
>
>         Andrew

Generally, this should be possible. Any function marked `const` can be
assigned to a static:

    const fn make_device() -> Device {
        todo!()
    }

    #[no_mangle]
    static _some_driver: Device =3D make_device();

That function can only call other const functions, but I don't think
that is a problem here. A caveat is that in a simple test I'm trying,
anything that contains a function pointer seems to go into `.data`
instead of `.rodata`. I'm trying to figure out why this but will have
to get back about it.

Is that something you would be interested in for the `phy_driver`? I
may be able to try it out if so, unless Fujita would like to.
`phy_driver_register` doesn't seem to take a pointer to const data,
but I assume it doesn't do any modification?

[1]: Updating `Driver` but not the mapping function would mean that
the default function in `Driver` may get called, but this would
generally be incorrect. That is why I suggested making them default to
something that `BUG()`s, but I'm also not sure what policy is on this.
