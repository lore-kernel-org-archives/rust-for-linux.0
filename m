Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493B1AD47
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 08:50:53 +0000 (UTC)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC3894
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 01:50:51 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-d81b42a3108so15606041276.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 01:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695977450; x=1696582250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bV6AOcPHHZNge9h22Pz4Bc+8Yqe16NjxouQh1t3CC1o=;
        b=dcPnYSOYmfx3jwVAP1tSjM55L9sWe3ZGCxY1ATtghMf/0cSD4zWmKVzaBm6u79FLiZ
         DI5FoocXk/LM40YSsf8E6Xk9b5cCzojXAiuM9Sd7Po9SVcO/Qr+Ed7jikZSnW/vIsxUC
         x0YpvvwdEXEuiuLA9u5b1GTWJAtKioSyOqjP40daPgRe+pB8W0m4p8rFjkfK/dfE+5OP
         Fp2ppuPZlC78z8BHTAIj7kat2O0YepNm2cEmnYsuIP+HX+avoYj600bPln2zt0c7LNa7
         bCr1L9xf+q+/RPtk2g7VTGmEsU73+YLDt5PBIO416vw9m6yYZW0kibMzu0nCwZ9gSnNI
         6lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695977450; x=1696582250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bV6AOcPHHZNge9h22Pz4Bc+8Yqe16NjxouQh1t3CC1o=;
        b=RpPWKHg4yJ4o55gn/jf8zldnJiI08D5ggfh18cHczWUAFqBuuB9zAhP404ZDrhjHpj
         ImEK2Wk+ypddVLyOwMbTJFKzqxnBwjJQ42wGbFS2lFZe84JMK2JnaMXHXTjnr+37+zM7
         Q8+6ydivvTLKGcpmLdIMGKmRn2iPFM6AX5s6Wyymwsjq9ln4byj/5UurHH2QdFFI+ffL
         Uq2pWqMthnguRFticf+rwjEVvCx1cXQNoGpjOGqb8EJ5o8OIwcWET0NbFVnXVHWIfNjU
         z8RPWmn9msnTGEHQHDpKBIcNQWwvH4+VXnQX+vEq7MlYKzTSyxe5Q47Tbj9Y5fV1j2oK
         m1cA==
X-Gm-Message-State: AOJu0Yx45yLw8G3/hGChWA5Ub3IYxfNGrbCNqVOUkrZCQvPJwbLqR/09
	jZlGK0wND4brSJH3xrsQTdP2PhuzGW+QgZH35uUgyQ==
X-Google-Smtp-Source: AGHT+IHCvx/ZFYQc0Kg3uS/b9eeC+UQUFKmBfZOsi6P7pzlxnbXb8GPBCQfTNAG/U9Pudfw3WN58OOSNCkvsNEfCwbg=
X-Received: by 2002:a25:5106:0:b0:d81:7798:4f31 with SMTP id
 f6-20020a255106000000b00d8177984f31mr3218075ybb.41.1695977450333; Fri, 29 Sep
 2023 01:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <2023092900-manpower-runaround-859a@gregkh>
In-Reply-To: <2023092900-manpower-runaround-859a@gregkh>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 29 Sep 2023 04:50:39 -0400
Message-ID: <CALNs47vWYFgBLUyDXUYVO94+G85V8k6tgx4Hs0n_HXk0S7kekA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: Greg KH <gregkh@linuxfoundation.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	andrew@lunn.ch, miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

I see Fujita beat me to responding :) but I'll share anyway

On Fri, Sep 29, 2023 at 2:09=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Sep 29, 2023 at 07:55:16AM +0900, FUJITA Tomonori wrote:
> > +/// Corresponds to the kernel's `enum phy_state`.
> > +#[derive(PartialEq)]
> > +pub enum DeviceState {
> > +    /// PHY device and driver are not ready for anything.
> > +    Down,
> > +    /// PHY is ready to send and receive packets.
> > +    Ready,
> > +    /// PHY is up, but no polling or interrupts are done.
> > +    Halted,
> > +    /// PHY is up, but is in an error state.
> > +    Error,
> > +    /// PHY and attached device are ready to do work.
> > +    Up,
> > +    /// PHY is currently running.
> > +    Running,
> > +    /// PHY is up, but not currently plugged in.
> > +    NoLink,
> > +    /// PHY is performing a cable test.
> > +    CableTest,
> > +}
> > +
> > +/// Represents duplex mode.
> > +pub enum DuplexMode {
> > +    /// Full-duplex mode
> > +    Half,
> > +    /// Half-duplex mode
> > +    Full,
> > +    /// Unknown
> > +    Unknown,
> > +}
>
> How are these enums going to be kept in sync with the C code?  This
> doesn't seem like a good idea and will quickly cause very strange bugs
> that will be impossible to debug :(

Andrew brought this up earlier [1], we are still working on the best
way to handle interop between C and Rust enums. Having this enum is
verbose but it isn't terrible - mapping C's phy_state -> rust's
DeviceState happens in the `match` block you point out below. `match`
checks for exhaustiveness, so adding a variant in C would cause a
compile error in rust.

I think the bigger hole in the logic is that we don't have a way to
check for invalid values that aren't a variant in the C enum, unlikely
bug but should be checked. We are working on a way to do this but
don't have it yet.

> > +
> > +/// Wraps the kernel's `struct phy_device`.
>
> This is going to get very tricky as you are "inheriting" a "struct
> device" from the driver core which has lifespan rules of its own.  How
> are you ensuring that those are correct?
>
> > +///
> > +/// # Invariants
> > +///
> > +/// `self.0` is always in a valid state.
> > +#[repr(transparent)]
> > +pub struct Device(Opaque<bindings::phy_device>);
> > +
> > +impl Device {
> > +    /// Creates a new [`Device`] instance from a raw pointer.
>
> meta-comment, how is the proliferation of "Device" implementations all
> across the kernel going to be able to be kept apart when searching the
> code?  This feels like a tough namespace issue over time or am I just
> not used to how rust does this?

The complete type name is `net::phy::Device`, typically these don't
get names like `PhyDevice` since its full name already includes `phy`.
A module author _could_ import `Device` and use it directly:

    use net::phy::Device
    fn foo() -> Device { /* ... */ }

But when names can be ambiguous like here, there is somewhat of a code
style preference to import the module instead and prefix the type.
Which is more clear when reading and easier to search like you
mentioned

    use net::phy
    fn foo() -> phy::Device { /* ... */ }

e.g. the sample code uses `phy::Driver` instead of just `Driver`

> > +
> > +    /// Gets the id of the PHY.
> > +    pub fn id(&mut self) -> u32 {
> > +        let phydev =3D self.0.get();
> > +        // SAFETY: `phydev` is pointing to a valid object by the type =
invariant of `Self`.
> > +        unsafe { (*phydev).phy_id }
> > +    }
> > +
> > +    /// Gets the state of the PHY.
> > +    pub fn state(&mut self) -> DeviceState {
> > +        let phydev =3D self.0.get();
> > +        // SAFETY: `phydev` is pointing to a valid object by the type =
invariant of `Self`.
> > +        let state =3D unsafe { (*phydev).state };
> > +        match state {
> > +            bindings::phy_state::PHY_DOWN =3D> DeviceState::Down,
> > +            bindings::phy_state::PHY_READY =3D> DeviceState::Ready,
> > +            bindings::phy_state::PHY_HALTED =3D> DeviceState::Halted,
> > +            bindings::phy_state::PHY_ERROR =3D> DeviceState::Error,
> > +            bindings::phy_state::PHY_UP =3D> DeviceState::Up,
> > +            bindings::phy_state::PHY_RUNNING =3D> DeviceState::Running=
,
> > +            bindings::phy_state::PHY_NOLINK =3D> DeviceState::NoLink,
> > +            bindings::phy_state::PHY_CABLETEST =3D> DeviceState::Cable=
Test,
>
> Again, this feels like a maintance nightmare.
>
> thanks,
>
> greg k-h

Mentioned above but `match state` makes sure that we check for every
possible `phy_state`, so changing a name or adding/removing a variant
in C would cause compilation to fail until this gets updated. I think
this reasonably covers the failure modes.

- Trevor

[1]: starting around here
https://lore.kernel.org/rust-for-linux/8a7e010e-b99a-4331-b7c4-e1c9b7782e94=
@lunn.ch/
