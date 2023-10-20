Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEF51D529
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="tdWjCYqb"
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532A4D6A
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 10:42:04 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-d9ac3b4f42cso1935399276.0
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Oct 2023 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1697823723; x=1698428523; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=eFO3WxhoSDwvEcTSlIa/b9H0IgcXK0MUsf+q6YIIp9A=;
        b=tdWjCYqbbWB9spa5KlD4e0Tgs4lVoelyPkyBsEFHG6B6yWxXEV7aZ704/tnIrkZLi5
         I4wpTvuQ9c0qlO4oBvJ1mLUt1nVd57PC8J8noU7KMqJAab97T+GtxSf6JTNlj6z++ElF
         97DiFyNPNataKSdvQBG+mV+1JNxXR9UdMsLK7rUEtJo7DbAQ6Woj+f1hRrcOn3BBs6nz
         xhTFWHIGRjOnL3l9XPCsSHfFKXbEX1W1T5qzoMRhC0wUSvckIEknqaGF5kiVuWzYB2Ad
         mR/xszVKlBrGfdtc3d/myVfOL8HjmODLDNb2EKpzJTud1tc8MG8UWP31FKIi1oe+VFp1
         LFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697823723; x=1698428523;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFO3WxhoSDwvEcTSlIa/b9H0IgcXK0MUsf+q6YIIp9A=;
        b=hjzMrP5RviYcsGmFmS880w2kp9vwW2IGzH96Gqfk9wuzpRyYK65/6DbywzaCCRqifF
         vP3OUY68FBlNm5XIBcI3/noVcL4NwjSKRNMXdLqF51Qw9PggGmmOu2ZQeI5wDEHhtHRC
         ro9iZa9G+st0z2UmoGjG5zvxkxYTvxWjerVfK/4I5Fbq0JlvgX4es+lHU9RlBbNjYS3X
         CY5jDF8OK/JnF5j41AQGfhA86ujjMb1SwdwZQ6VdmpLU1l/XK0ro4cvXGlNOhfHkFuq6
         adZQA5UMDQQOFWGXVXJ19ag0+l4s97UxCzUluqyLEwPsduc/1LlrcVDblOOjDjyZTQdj
         kx9g==
X-Gm-Message-State: AOJu0YzcJvRHJdukHHoD+MNcHd7LPialXWb46BNR8tFg6OO2OYAoEXxi
	oufmRq9JwzKqKmE6mfjd+GyE3IuubdZevEqzCK4=
X-Google-Smtp-Source: AGHT+IExBI+MgyKdvO5f26M3zft7xsCoQac77C6ROsUpDbAaFnOgwhT3X1+PuJ5IpKlGVJGNBJJDCw==
X-Received: by 2002:a25:b4e:0:b0:d9a:5f53:1732 with SMTP id 75-20020a250b4e000000b00d9a5f531732mr2099871ybl.18.1697823723378;
        Fri, 20 Oct 2023 10:42:03 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id e136-20020a25698e000000b00d9ab46073f1sm702482ybc.52.2023.10.20.10.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 10:42:02 -0700 (PDT)
References: <20231017113014.3492773-1-fujita.tomonori@gmail.com>
 <20231017113014.3492773-2-fujita.tomonori@gmail.com>
User-agent: mu4e 1.10.7; emacs 28.2.50
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch,
 miguel.ojeda.sandonis@gmail.com, tmgross@umich.edu, boqun.feng@gmail.com,
 wedsonaf@gmail.com, benno.lossin@proton.me, greg@kroah.com
Subject: Re: [PATCH net-next v5 1/5] rust: core abstractions for network PHY
 drivers
Date: Fri, 20 Oct 2023 19:26:50 +0200
In-reply-to: <20231017113014.3492773-2-fujita.tomonori@gmail.com>
Message-ID: <87sf65gpi0.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi,

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:

<cut>

> +
> +    /// Returns true if the link is up.
> +    pub fn get_link(&self) -> bool {
> +        const LINK_IS_UP: u32 = 1;
> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> +        let phydev = unsafe { *self.0.get() };
> +        phydev.link() == LINK_IS_UP
> +    }

I would prefer `is_link_up` or `link_is_up`.

> +
> +    /// Returns true if auto-negotiation is enabled.
> +    pub fn is_autoneg_enabled(&self) -> bool {
> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> +        let phydev = unsafe { *self.0.get() };
> +        phydev.autoneg() == bindings::AUTONEG_ENABLE
> +    }
> +
> +    /// Returns true if auto-negotiation is completed.
> +    pub fn is_autoneg_completed(&self) -> bool {
> +        const AUTONEG_COMPLETED: u32 = 1;
> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> +        let phydev = unsafe { *self.0.get() };
> +        phydev.autoneg_complete() == AUTONEG_COMPLETED
> +    }
> +
> +    /// Sets the speed of the PHY.
> +    pub fn set_speed(&mut self, speed: u32) {
> +        let phydev = self.0.get();
> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
> +        unsafe { (*phydev).speed = speed as i32 };
> +    }

If this function is called with `u32::MAX` `(*phydev).speed` will become -1. Is that OK?

<cut>

> +
> +/// An instance of a PHY driver.
> +///
> +/// Wraps the kernel's `struct phy_driver`.
> +///
> +/// # Invariants
> +///
> +/// `self.0` is always in a valid state.
> +#[repr(transparent)]
> +pub struct DriverType(Opaque<bindings::phy_driver>);

I don't like the name `DriverType`. How about `DriverDesciptor` or
something like that?

<cut>

> +
> +/// Corresponds to functions in `struct phy_driver`.
> +///
> +/// This is used to register a PHY driver.
> +#[vtable]
> +pub trait Driver {
> +    /// Defines certain other features this PHY supports.
> +    /// It is a combination of the flags in the [`flags`] module.
> +    const FLAGS: u32 = 0;
> +
> +    /// The friendly name of this PHY type.
> +    const NAME: &'static CStr;
> +
> +    /// This driver only works for PHYs with IDs which match this field.
> +    /// The default id and mask are zero.
> +    const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_custom_mask(0, 0);
> +
> +    /// Issues a PHY software reset.
> +    fn soft_reset(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Probes the hardware to determine what abilities it has.
> +    fn get_features(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Returns true if this is a suitable driver for the given phydev.
> +    /// If not implemented, matching is based on [`Driver::PHY_DEVICE_ID`].
> +    fn match_phy_device(_dev: &Device) -> bool {
> +        false
> +    }
> +
> +    /// Configures the advertisement and resets auto-negotiation
> +    /// if auto-negotiation is enabled.
> +    fn config_aneg(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Determines the negotiated speed and duplex.
> +    fn read_status(_dev: &mut Device) -> Result<u16> {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Suspends the hardware, saving state if needed.
> +    fn suspend(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Resumes the hardware, restoring state if needed.
> +    fn resume(_dev: &mut Device) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Overrides the default MMD read function for reading a MMD register.
> +    fn read_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16) -> Result<u16> {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Overrides the default MMD write function for writing a MMD register.
> +    fn write_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
> +        Err(code::ENOTSUPP)
> +    }
> +
> +    /// Callback for notification of link change.
> +    fn link_change_notify(_dev: &mut Device) {}

It is probably an error if these functions are called, and so BUG() would be
appropriate? See the discussion in [1].

[1] https://lore.kernel.org/rust-for-linux/20231019171540.259173-1-benno.lossin@proton.me/

<cut>

> +
> +    // macro use only
> +    #[doc(hidden)]
> +    pub const fn mdio_device_id(&self) -> bindings::mdio_device_id {
> +        bindings::mdio_device_id {
> +            phy_id: self.id,
> +            phy_id_mask: self.mask.as_int(),
> +        }
> +    }

Would it make sense to move this function to the macro patch?

Best regards,
Andreas
