Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5980D
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 01:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJ0yFRAm"
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C9392
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 18:57:04 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5a7c08b7744so16467687b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 18:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696989424; x=1697594224; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EV0HzFpxHFw4QxSOW9mZy6JTboY1L1W8GH7+TjJRP50=;
        b=FJ0yFRAmHMyj/5LzWPHVB5Jwq+cU7sHKjUCzaTbJZtQOCOPPmKLL6jfIZy3/SpbdXh
         KlH8isgUfGU3l26TNhrxfbzDSiAxg/6kSDVJg5bxtpqR06kdLStDUuaC2obeoDrWMQVE
         YZ1WDYZXEkWaOiHVWHVUsH7FOOqb8LbHTYPhQ7nzm7YdocaECICPw4c2XkhdDDWuhjsW
         WNhhohXo0t1s/5aXA/kWo1h+4Uhp+BI7EsbifdIc5yMcmrSLKnoVVEDECKXSfoUWXu+0
         zaH+yRpblpGACx1IUZB2GYPAbbanDGbTVbEisRN+v4RMZiabDsf/NSo+TMEwCfoMSg6g
         p8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696989424; x=1697594224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EV0HzFpxHFw4QxSOW9mZy6JTboY1L1W8GH7+TjJRP50=;
        b=NLgtQclJqPNsl85yEO1L2fvRVAMXxxZhiPB+mlskH7uRr3fNaNA1Sxdm/ZokykMrhe
         MXii2aZNOihpRPrJbZumBkuD4L96lOzZDTkQeaQdgARvAJ7JjNCqQNxbiiSopPniPBrX
         unbWV4V7YH6bBym7ztcBqVqzPyv8eVGWgP4elHxsZBphxsLo6vgBT6sb7LprLil5kf5L
         dZvxhRoAhpDOSfhfhjKbje0CKMcKswBdGIYtcBzMZJ8KJrcg9xK1m2O1Jj2WgAEQeIAF
         5JphI8mRGIAyBqEb3t9svBDGrTn6OhlrZXmMsuijvbhUSf/9edQJ9cHwJGTdSQfCoBzy
         GWAQ==
X-Gm-Message-State: AOJu0Yz6faTlxXnqgDMtCU+rbws5YhvtZ6sxhNQ4h+uHP3xU+LSpYSKp
	qVEO1w+xRycOl9gVVFnvtd/0iyIY3pQ9crLwlL0=
X-Google-Smtp-Source: AGHT+IENdn8ib1aqsX3BfWWNaSwQGg9ZgYAfX+UszPORnDtNWRTnQfFiM/7Lp2zkXIyl2HVau0N49iTGVI7Celfe/DY=
X-Received: by 2002:a25:24cd:0:b0:d81:cdda:729c with SMTP id
 k196-20020a2524cd000000b00d81cdda729cmr18056695ybk.23.1696989423855; Tue, 10
 Oct 2023 18:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
 <8ecbc427-fba1-4941-a8e5-c9516f33df0a@lunn.ch> <CANeycqrwDjcZN2oYzH=HV12cfgeRD7TCpQWvFnyNGR1uXwre1w@mail.gmail.com>
 <6983f638-3ff9-4ce1-b948-62287bb4c298@lunn.ch>
In-Reply-To: <6983f638-3ff9-4ce1-b948-62287bb4c298@lunn.ch>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Tue, 10 Oct 2023 22:56:52 -0300
Message-ID: <CANeycqpV12SCN19hA0dAiTD8XqPWCLy-=7ZT9NVdOjzKNy3d5Q@mail.gmail.com>
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

On Tue, 10 Oct 2023 at 20:34, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Oct 10, 2023 at 06:00:15PM -0300, Wedson Almeida Filho wrote:
> > On Tue, 10 Oct 2023 at 17:28, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > > +/// Wraps the kernel's `struct phy_device`.
> > > > > +///
> > > > > +/// # Invariants
> > > > > +///
> > > > > +/// `self.0` is always in a valid state.
> > > > > +#[repr(transparent)]
> > > > > +pub struct Device(Opaque<bindings::phy_device>);
> > > >
> > > > Since this device is refcounted, ideally you would implement the
> > > > `AlwaysRefCounted` trait for Device.(One that calls `mdio_device_get`
> > > > and `mdio_device_put` to increment and decrement the refcount.)
> > >
> > > Dumb question. Why? No other PHY driver does this?
> >
> > If you implement that trait, you get to use `ARef<Device>` as a
> > refcounted `Device`, which is guaranteed to not produce dangling
> > pointers in unsafe-free code. This is what all Rust-representations of
> > C ref-counted objects are supposed to use.
> >
> > But if no driver needs to increment or decrement the refcount, we can
> > probably skip this until such a need arises (if ever).
> >
> > > phy_attach_direct() does a get_device(d), and only after that is the
> > > probe function called. phy_detach() does a put on it.
> > >
> > > Maybe the device should not be refcounted?
> >
> > I guess it needs to be refcounted because it is a kobject that exists
> > in sysfs, so likely unavoidable.
>
> Is Rust putting a kobject in sysfs? I don't think so. So it is not
> really Rust problem. The core should be doing all the device
> references. And we don't want a driver papering over bugs in the core,
> we want to fix the core.

Rust isn't itself putting kobjects in sysfs. And I'm not suggesting
papering over bugs anywhere.

If a driver wants to hold on to a pointer to a `Device` beyond the
scope of the function (e.g., to defer some work to a work queue
thread), then it needs to increment the refcount to ensure that the
device remains alive -- nothing new here. I'm saying that Rust
implements unified abstractions for all C ref-counted types; for a
type to participate, it just needs to specify the incref and decref
functions.

It seems like you're arguing that PHY devices are so simple that they
should never need to do anything that involves
incrementing/decrementing the refcount. If that's the case, then fine,
we don't need to implement the trait now. We can do it later if the
need ever arises.

> > > > > +        let phydev = self.0.get();
> > > > > +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> > > > > +        unsafe { (*phydev).link() == LINK_IS_UP }
> > > >
> > > > Wouldn't it be more future-proof to do (*phydev).link() != 0? That's
> > > > what the C side does.
> > >
> > > Not really.
> > >
> > >         if (!phydev->link)
> > >                 return 0;
> > >
> > > And link is a bit field.
> > >
> > >         unsigned link:1;
> > >
> > > So it can only be 0 or 1.
> >
> > It happens to be a bit field with a single bit now. If it gets
> > converted to say a bool, or to 2 bits, the existing C code continues
> > to work, but Rust as written by Tomo wouldn't. That's what I mean by
> > future-proof.
> >
> > The C code absolutely does a != 0 check: https://godbolt.org/z/3rjjcjEK4
>
> It would be better to say the generated assembler does a != 0.
> On one particular instruction set. AVR seems to be a compare with
> 1. But that does seem to be the exception....

Let's look at the C spec:
https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1256.pdf

Last paragraph of page 79:
The result of the logical negation operator ! is 0 if the value of its
operand compares unequal to 0, 1 if the value of its operand compares
equal to 0. The result has type int. The expression !E is equivalent
to (0==E).

The compiler may generate whatever code it wants as long as it
complies with the semantics of the language. And the semantics calls
for a ==0 or != 0 comparison.

> >
> > > (*phydev).link() == LINK_IS_UP seems more readable than
> > > (*phydev).link() != 0
> >
> > Sure, how about you define and use LINK_IS_UP on the C side? Then
> > we'll use your C definition and mimic the behaviour on the Rust side.
>
> Patches welcome.

Tomo?

> > > I also don't see how it can be more future proof. The link to the peer
> > > is either up or not. There are only two states, Schrodinger's cat is
> > > not involved here.
> >
> > Yes, there are only two states, but if you ever switch to say an 8-bit
> > boolean to represent the states, then you have 255 values but only two
> > states and we'll have to do the proper mapping.
>
> Can you do a build time assert that link is a 1 bit bitfield? Fail to
> compile if it ever changes.

I don't know off the top of my head of a way to do it, but yeah, if we
can find one, that would be a better way to detect potentially
breaking changes.

> > > > > +    /// Sets the speed of the PHY.
> > > > > +    pub fn set_speed(&mut self, speed: u32) {
> > > > > +        let phydev = self.0.get();
> > > > > +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> > > > > +        unsafe { (*phydev).speed = speed as i32 };
> > > > > +    }
> > > >
> > > > Should we perhaps saturate `speed` to `i32::MAX` so that it doesn't
> > > > become negative?
> > >
> > > How clever is the compiler here? The speed passed to this method is
> > > pretty much always a constant value. In C you could probably do a
> > >
> > > BUILD_BUG_ON(speed > INT_MAX && speed != SPEED_UNKNOWN);
> > >
> > > and have the build fail if it was passed too big a value.
> >
> > Yes, we should be able to use build_assert for that. I like the idea.
>
> Yes, it clearly is a bug. Speed here is in Mbps. So that would be
> 2147483647Mbps. Current copper PHYs stop at around 40,000Mbps, and
> physics is going to get in the way going to much faster, you need to
> use fibre, and that is not phylibs job.

Ack.

> > > > The safety requirements for `from_raw` are (copied from above): For
> > > > the duration of the lifetime 'a,
> > > > the pointer must be valid for writing and nobody else may read or
> > > > write to the `phy_device` object.
> > > >
> > > > You don't explain how the second part is satisfied.
> > > >
> > > > >From a previous thread, it looks like C is holding the phydev mutex
> > > > while calling most of these functions. You should specify that as part
> > > > of the justification for safety. And for the functions that C doesn't
> > > > do that (IIRC, suspend and resume), you need to explain differently.
> > >
> > > Do you ever consider skipping documenting the safety assumptions and
> > > just proving the safety assumption?
> >
> > Yes, I'd very much like to see that, but we don't have good-enough
> > tooling at the moment to that at compile-time only.
>
> I don't see how tooling can determine that at compile time. Its in C
> code for a start. Maybe some sort of cross C and Rust LTO if it had
> access to the intermediary representation?

One way to do it at compile time is to attach pre and post conditions
to each function (Hoare style). Then pre-conditions are checked
locally at call sites and the tool fails (or requires manual
intervention) if it can't prove it; pre-conditions in function
definitions are then always considered true and can be used to infer
additional properties.

The language used to express the pre and post conditions would likely
need to be more expressive than C and Rust.

Anyway, we don't have that now and we won't have it anytime soon. So
we need to argue in prose about the validity of our safety
requirements. Tomo's argument is lacking here; AFAICT, it should be
easy to fix, except for suspend and resume (which I still don't know
what the claim is).

Cheers,
-Wedson
