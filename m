Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1111705
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 09:11:36 +0000 (UTC)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A11A11F
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 02:11:33 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-59f6767a15dso6312007b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Sep 2023 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1695978692; x=1696583492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7ORN3g4Q2/ZOqJV2bkuzGrLqmyEeNmUyCkc5DXN5L0=;
        b=K9qrzaQ2ZI2aWGcGHbT+7nH6/ikBkOyZvt5yCCwYmIk/pge89/Z2Bfp1BlGgk+V0NB
         8LPeCvIOI/lS9dJgE968qoc69Uc89cu9SO++owM9uQ5MQ75I7Jhs7zHuRjX4FkL96Yut
         YQNMCx1hHhwEbqkG09XvUQNFB0A6GrEBvMzJfvz8YDJ2Hmca+a1apVUjz2h1enBhvKRs
         zmpzANFbBZva3YkF8QRrMRftvuK0MpyecsNL78jvUGRf92kP3f63thB+nwic7vMf7qd3
         bBIAwG0yPwb47dg/Ls0so1BqhVoHsHlsmlscxkdltwdXxlw+XogsO3OxLnSmLRDzN9+R
         1Rww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695978692; x=1696583492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7ORN3g4Q2/ZOqJV2bkuzGrLqmyEeNmUyCkc5DXN5L0=;
        b=Fj8zf+1m7o7d1D58MotyG6mJRdmuTIIzHzTdbLwtCf6+cLLMGGUAtJlfWVZN1PKEG5
         7vmGCHJKvvW6OAUyCHq6iFSyzhloYXJ3Nrna0VoxQ005IrYX9AVf0jfhX61CvaKrq9b9
         cgy/HEGX9ScnxL5yWnAXe6Sa7BWFvOC3e87eLc65mYhXl438gENEpKEPWcuL4KXtp/d4
         JDgqgt9tLj5gmquCLDo7cvT/w1+4IVw2OosR1Rn8eMq4Ss5sPNACJYV6FaqYHbtRp1Ga
         HbNZP5yqAlKZVZpcq1JH5oucw8A85zmxmzxOXNmV4VYVtBVFEFruyKYDtN1TnOIps43I
         yJ5A==
X-Gm-Message-State: AOJu0YykYrAeKNh8rhxIDKkbaWTgwN/X8rkI2eF9oIx6BtRfR8itTm7W
	5AgIy5mzukJOvwWi0ey+rAL5pROvbB/ExJvRRrvGEw==
X-Google-Smtp-Source: AGHT+IEb6LfLlzOvXlPXLuQ4CWXIUdiTwXIq8pUE0Dh+S+2k45xERYccoQw4XINC2ZOslEXZFkcRargjhRzbDXiZCZk=
X-Received: by 2002:a0d:ca49:0:b0:59f:6404:89b5 with SMTP id
 m70-20020a0dca49000000b0059f640489b5mr3779621ywd.9.1695978692215; Fri, 29 Sep
 2023 02:11:32 -0700 (PDT)
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
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 29 Sep 2023 05:11:21 -0400
Message-ID: <CALNs47td-3UM-E59R35GAjaHMPT8c-H7Qy=PZ+-wgsXpw5EJAA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 29, 2023 at 4:39=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
> [...]
> >> +    /// Gets the state of the PHY.
> >> +    pub fn state(&mut self) -> DeviceState {
> >> +        let phydev =3D self.0.get();
> >> +        // SAFETY: `phydev` is pointing to a valid object by the type=
 invariant of `Self`.
> >> +        let state =3D unsafe { (*phydev).state };
> >> +        match state {
> >> +            bindings::phy_state::PHY_DOWN =3D> DeviceState::Down,
> >> +            bindings::phy_state::PHY_READY =3D> DeviceState::Ready,
> >> +            bindings::phy_state::PHY_HALTED =3D> DeviceState::Halted,
> >> +            bindings::phy_state::PHY_ERROR =3D> DeviceState::Error,
> >> +            bindings::phy_state::PHY_UP =3D> DeviceState::Up,
> >> +            bindings::phy_state::PHY_RUNNING =3D> DeviceState::Runnin=
g,
> >> +            bindings::phy_state::PHY_NOLINK =3D> DeviceState::NoLink,
> >> +            bindings::phy_state::PHY_CABLETEST =3D> DeviceState::Cabl=
eTest,
> >
> > Again, this feels like a maintance nightmare.
>
> As I wrote above, it's guaranteed that C and Rust code never
> diverge. However, as you said, suley it's troublesome to maintain this.
>
> We could directly use enum generated from C's enum at compile
> time. Then we can remove this conversion. The names are not pretty
> from Rust's view though.
>
> Any concerns from Rust side?
> [...]
>
>  /// Corresponds to the kernel's `enum phy_state`.
> -#[derive(PartialEq)]
> -pub enum DeviceState {
> -    /// PHY device and driver are not ready for anything.
> -    Down,
> -    /// PHY is ready to send and receive packets.
> -    Ready,
> -    /// PHY is up, but no polling or interrupts are done.
> -    Halted,
> -    /// PHY is up, but is in an error state.
> -    Error,
> -    /// PHY and attached device are ready to do work.
> -    Up,
> -    /// PHY is currently running.
> -    Running,
> -    /// PHY is up, but not currently plugged in.
> -    NoLink,
> -    /// PHY is performing a cable test.
> -    CableTest,
> -}
> +///
> +///  PHY device and driver are not ready for anything.
> +///  PHY_DOWN
> +///  PHY is ready to send and receive packets.
> +///  PHY_READY
> +///  PHY is up, but no polling or interrupts are done.
> +///  PHY_HALTED
> +///  PHY is up, but is in an error state.
> +///  PHY_ERROR
> +///  PHY and attached device are ready to do work.
> +///  PHY_UP
> +///  PHY is currently running.
> +///  PHY_RUNNING
> +///  PHY is up, but not currently plugged in.
> +///  PHY_NOLINK
> +///  PHY is performing a cable test.
> +///  PHY_CABLETEST
> +pub use bindings::phy_state as DeviceState;

I think there are three reasons we may prefer to recreate an enum from
C in Rust:

1. Size, C enums are typically an int but rust enums are u8 until they
   need to be bigger
2. Name consistency, rust is almost always CamelCase for enum variant
   names but the ones from bindings don't
3. Docs, if the enum is user-facing then there are benefits to documenting
   the variants rather than the entire enum (cleaner doc output, ide hints)

None of those are super strong on their own but together seems like
good enough reason to leave it as you have it. I think the most
important thing is making sure it is maintainable, incompatible
changes on the C side should fail rust compilation - which is the goal
of this conversation.
