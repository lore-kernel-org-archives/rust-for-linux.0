Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341203159F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiktV+Wp"
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC298F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 14:00:26 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-d84f18e908aso6598011276.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 14:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696971626; x=1697576426; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=13kVeGf0npvhsU5r/CtCyaQky9CWw3CuRx++xmxfzyo=;
        b=ZiktV+WpiXyLhMwfAHbyTSNQ+M7lEFN1xjqcLAcvcYoGWfkgufKXHHNVKH2LlZ5O1U
         LLhPc6i3L3B7nEH7O4jBWBxf0Ke0sZ1AuJd8BsvKeSX9POjbS6qaplj0VQNABeGVAfCJ
         zfFbK252+UZUH6qstTN9w6xQOBQqfMYdgB9S1SHk/vGESZm1dxTsSPsCPbBfE0P6A1s9
         VURW6S4dUjfIWCFtzhsnS5WuhQY5i209liWNBny65YKf+MuMFzcexDYkOcRF4KZzMTV+
         3b4wL/zgXfF/FI6dPdefxr1/DvoFxz/WdJ2mttYeUBQLJEw4oy6JA2ZdOn+DURq8cCPc
         T43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696971626; x=1697576426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13kVeGf0npvhsU5r/CtCyaQky9CWw3CuRx++xmxfzyo=;
        b=vH8Z+ex/4Ox0WL0h5b6VzQ0SQJIGCGnWWgP3LQJeL1MAWj4+yPMIBHuEeXIjZ1DmLd
         zim4ql5BIxZx0QYuZLXX5+ypagaY99xyO+vz3vAYs17sAQ6LnHtK0NSrYAF6Iy5doBWn
         q/aBP3QD6QWazOeCErRtC9Gvknj2ZyH4DaOl2diy7AUBJwZC6nIZ+fL5hrSwic+MTO0y
         YdbgVhsvvYAskpmzgGmBJ9xbLsyFYWZQ1IDfckb9mBnbeWsAKO3GbLs1EdvSLR2wLKng
         1Zk6MfL5KB3tYhfl3Ri4difD8gIoqgt/izDmBr3tKU8P6xnvN6kZ6gA2a7VkddX9kEJq
         oqIA==
X-Gm-Message-State: AOJu0Yz71KtZ/aqAKlprQ6wpQ+/+74mAOt0x1KzwpU+Y7lwGeHUHoGSP
	YWV6fkxl+4Cg7YrEMVCGHQNvXZiTQk4e60gqpUo=
X-Google-Smtp-Source: AGHT+IHlhsKcyyVovs0wEyjroEd/HAY60qdjt9PxZGaZXenXdv9aGD4EgHyXLxyRUXbtO34OFrgIKpFE8I6tBR59sWg=
X-Received: by 2002:a25:ca49:0:b0:d90:c46d:16a8 with SMTP id
 a70-20020a25ca49000000b00d90c46d16a8mr21374303ybg.52.1696971625997; Tue, 10
 Oct 2023 14:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
 <8ecbc427-fba1-4941-a8e5-c9516f33df0a@lunn.ch>
In-Reply-To: <8ecbc427-fba1-4941-a8e5-c9516f33df0a@lunn.ch>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Tue, 10 Oct 2023 18:00:15 -0300
Message-ID: <CANeycqrwDjcZN2oYzH=HV12cfgeRD7TCpQWvFnyNGR1uXwre1w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, 10 Oct 2023 at 17:28, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > +/// Wraps the kernel's `struct phy_device`.
> > > +///
> > > +/// # Invariants
> > > +///
> > > +/// `self.0` is always in a valid state.
> > > +#[repr(transparent)]
> > > +pub struct Device(Opaque<bindings::phy_device>);
> >
> > Since this device is refcounted, ideally you would implement the
> > `AlwaysRefCounted` trait for Device.(One that calls `mdio_device_get`
> > and `mdio_device_put` to increment and decrement the refcount.)
>
> Dumb question. Why? No other PHY driver does this?

If you implement that trait, you get to use `ARef<Device>` as a
refcounted `Device`, which is guaranteed to not produce dangling
pointers in unsafe-free code. This is what all Rust-representations of
C ref-counted objects are supposed to use.

But if no driver needs to increment or decrement the refcount, we can
probably skip this until such a need arises (if ever).

> phy_attach_direct() does a get_device(d), and only after that is the
> probe function called. phy_detach() does a put on it.
>
> Maybe the device should not be refcounted?

I guess it needs to be refcounted because it is a kobject that exists
in sysfs, so likely unavoidable.

> > > +        let phydev = self.0.get();
> > > +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> > > +        unsafe { (*phydev).link() == LINK_IS_UP }
> >
> > Wouldn't it be more future-proof to do (*phydev).link() != 0? That's
> > what the C side does.
>
> Not really.
>
>         if (!phydev->link)
>                 return 0;
>
> And link is a bit field.
>
>         unsigned link:1;
>
> So it can only be 0 or 1.

It happens to be a bit field with a single bit now. If it gets
converted to say a bool, or to 2 bits, the existing C code continues
to work, but Rust as written by Tomo wouldn't. That's what I mean by
future-proof.

The C code absolutely does a != 0 check: https://godbolt.org/z/3rjjcjEK4

> (*phydev).link() == LINK_IS_UP seems more readable than
> (*phydev).link() != 0

Sure, how about you define and use LINK_IS_UP on the C side? Then
we'll use your C definition and mimic the behaviour on the Rust side.

> I also don't see how it can be more future proof. The link to the peer
> is either up or not. There are only two states, Schrodinger's cat is
> not involved here.

Yes, there are only two states, but if you ever switch to say an 8-bit
boolean to represent the states, then you have 255 values but only two
states and we'll have to do the proper mapping. As I said above, if
leave the code as is, C will do will thing and Rust will do something
else. I want to avoid this.

> > > +    }
> > > +
> > > +    /// Sets the speed of the PHY.
> > > +    pub fn set_speed(&mut self, speed: u32) {
> > > +        let phydev = self.0.get();
> > > +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> > > +        unsafe { (*phydev).speed = speed as i32 };
> > > +    }
> >
> > Should we perhaps saturate `speed` to `i32::MAX` so that it doesn't
> > become negative?
>
> How clever is the compiler here? The speed passed to this method is
> pretty much always a constant value. In C you could probably do a
>
> BUILD_BUG_ON(speed > INT_MAX && speed != SPEED_UNKNOWN);
>
> and have the build fail if it was passed too big a value.

Yes, we should be able to use build_assert for that. I like the idea.

> > The safety requirements for `from_raw` are (copied from above): For
> > the duration of the lifetime 'a,
> > the pointer must be valid for writing and nobody else may read or
> > write to the `phy_device` object.
> >
> > You don't explain how the second part is satisfied.
> >
> > >From a previous thread, it looks like C is holding the phydev mutex
> > while calling most of these functions. You should specify that as part
> > of the justification for safety. And for the functions that C doesn't
> > do that (IIRC, suspend and resume), you need to explain differently.
>
> Do you ever consider skipping documenting the safety assumptions and
> just proving the safety assumption?

Yes, I'd very much like to see that, but we don't have good-enough
tooling at the moment to that at compile-time only.

>
> It probably costs very little to actually test if the mutex is locked.
> And if it is not locked, that is probably a bug we need to find and
> fix.

Oh, you mean proving at runtime?

Torvalds has told me in the past that incrementing a cpu-local
word-sized counter was too expensive. I'd rather avoid runtime costs
unless really necessary.

> > > +/// kernel::module_phy_driver! {
> > > +///     drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
> > > +///     device_table: [
> > > +///         DeviceId::new_with_driver::<PhyAX88772A>(),
> > > +///         DeviceId::new_with_driver::<PhyAX88772C>(),
> > > +///         DeviceId::new_with_driver::<PhyAX88796B>()
> > > +///     ],
> >
> > I don't like the fact that we need to repeat names in `driver` and
> > `device_table`. A single list should suffice, no?
>
> All the C drivers do this. It was discussed before, there is not
> always a simple 1:1 mapping from struct phy_driver to struct
> mdio_device_id because of the way masks are used. Rust could be more
> restrictive, and that might help avoid some bugs where developers
> forget to put an entry in the struct mdio_device_id table.

If each driver supports more than one ID, what we should do is allow
them (the drivers) to declare a list of ids, not just one.

This is what we do for other drivers.

>
>         Andrew
