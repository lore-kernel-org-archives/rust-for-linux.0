Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B78442A
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 18:42:18 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 536CDF9
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 11:42:17 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9ada609bb62so477141766b.2
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Sep 2023 11:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694976136; x=1695580936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tplxOZS0Unmq22QFTd+gO2V1zYBez7/Q/dvKdo1Vk+I=;
        b=g4nWKOL7FmwSJMSdRhEYYOpKyMmhWRyzLblnjFQz1iZKAob9k2p1GLmRWfaR15YDqw
         H+kLQ2j+kRrQhNGsCQ/eq7c6czA1tYYDqe8aGwbXpr+ubtyOc7CG5Zq+TfYBkkiWjKsK
         eqtdcbryAcjy8OIJAI48v6wKso/9PPQ+mfLB37c44brjN1ZiLEXXvErORx40XzPiWjG4
         g8IIKw6yVfIb7ZK5PYh2CfCPNl76Wtm3pu9TzSnlnH/o2F5ncVoEgK/ixwPR3nk76IJ8
         1eP/pI1ASdknVZA9z5a++4OFN143ylkerlK5z1t2y340j5e8DHgcHW/rBKZyX0UrkRIG
         kfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694976136; x=1695580936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tplxOZS0Unmq22QFTd+gO2V1zYBez7/Q/dvKdo1Vk+I=;
        b=Md2Oyamz2mORzFbmXrQCVozUOkJUxkCB+YwC/sV0lGc5Enh3Ik0E1dllj4SBr/5y1b
         iFruy5A8pzJLxQU7aNDOU43gX7YQF4pULOZG2BW9q6pRT5E5aQfjHdPgV/HCOzQMH1aO
         rKTUYVp8JJeAvEFqh1w6gZhSEFDGw/c8Cu3b+IeK1WA0OrqkuuZLw8GWdEZcrqD1W/qq
         KxEW0j7p8yUEkucNh7GZcqWf0zfKzeImekGseYjDY7dyAy3rog802ehmAegRl3qLiJjJ
         OzaCojyT5iBLshdj4fyjdaPTLD8nUl9NtbdYsL6W1gtJ6Y0zh84NLDReqVx2fDRXUyO9
         agCA==
X-Gm-Message-State: AOJu0Yz7kPUxMZRgb90RuA5Bujk9x6NRebVK5zFF1z5gbECdSo96ocqi
	jkYlhM04wkmgTgjZ5zy+fenLA2s3XGlW9rI05U9lww==
X-Google-Smtp-Source: AGHT+IF2Mj/pzt5vDItPkY5eOTue2TMJnC9BB3iegN4VkoOGaaVKXJ4Sd0VaoP+Bv+L02yc9R7JR/zaJ0W+8GeuhvLs=
X-Received: by 2002:a17:906:519c:b0:9a6:4f23:9d8f with SMTP id
 y28-20020a170906519c00b009a64f239d8fmr5712918ejk.47.1694976135741; Sun, 17
 Sep 2023 11:42:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com> <ec6d8479-f893-4a3f-bf3e-aa0c81c4adad@lunn.ch>
 <20230917.191708.2174483069021340663.ubuntu@gmail.com> <3fa5407b-c6f4-4e39-a743-812838b94d28@lunn.ch>
In-Reply-To: <3fa5407b-c6f4-4e39-a743-812838b94d28@lunn.ch>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 17 Sep 2023 14:42:02 -0400
Message-ID: <CALNs47uCFDJ5xz7_3qkjszmmAFXzA=dwB7CM4+sVeVtnSTZAcQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Sep 17, 2023 at 11:07=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
> [...]
> > If abstraction code just declare a function, a driver always need to
> > implement that function.
>
> Ah, that is not going to scale well. There is something like 250
> struct phy_driver at the moment. We keep adding new ops to that
> structure. I really don't want to have to modify all 250 of those
> structures when i add a new op which only one or two drivers need.

This concern is about adding a function pointer field to the C struct
without needing to update all future Rust drivers, correct? If so,
that will be fine currently. This comes from where the driver is
created

> +    fn driver(&self) -> bindings::phy_driver {
> +        bindings::phy_driver {
> +            name: self.name.as_char_ptr() as *mut i8,
> +            flags: <T>::FLAGS,
> +            soft_reset: if <T>::HAS_SOFT_RESET {
> +                Some(Self::soft_reset_callback)
> +            } else {
> +                None
> +            },
> +            // other fields ...
> +            ..unsafe { core::mem::MaybeUninit::<bindings::phy_driver>::z=
eroed().assume_init() }
> +        }

The `..` covers all unspecified fields and just says they will be
zeroed. How this all works is:

- A trait is created (`Driver`) that has one function for each function
  pointer field in a C vtable struct (`phy_driver`).
- Each function in the trait can either have no implementation, (every
  implementer needs to provide one), or a default implementation, (an
implementer can
  optionally provide one or fall back to the default). This is just
standard Rust, and
  I think that is what Fujita was saying
- What the `#[vtable]` macro does is give you a way to check if a
  implementer/driver provides their own implementation of the default
method. It does this by
  setting `HAS_FN_NAME`
- Then, when creating the c vtable struct from a type that implements the
  trait, you check that value for each field and either set it to null or t=
o a
  function pointer

This means that the `phy_driver` that C sees has null for all
unimplemented fields and not the default implementation. In the above
snip creating the `phy_driver`, it checks whether or not the driver
provides a `soft_reset` implementation with `HAS_SOFT_RESET`, and then
either sets that field to a null pointer `None` or a function pointer
`Some(Self::soft_reset_callback)`.

I think that technically the default implementations in the trait
could be `unimplemented!()` which calls back to `BUG()`, since their
use would indicate something incorrect with the abstraction like an
unhandled field. within this small subset of code.

Does any of that clear up concerns about providing nulls or adding new fiel=
ds?
