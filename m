Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574AC637
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 01:19:33 +0000 (UTC)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3991101
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 18:19:30 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-273e3d8b57aso1620509a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 18:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695691170; x=1696295970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsJ1AG+PItAMxYQGXBlLsaQNPUUqgPIQhgj/xs3jUPE=;
        b=l2ENZvLifjBQPX9BmoBcqQFC5Y9Cev7OtOPU9Ek11h+PV71ikxyEXgHFxTpkUSwnZ4
         33PK2t/SIfFomRvPq5lPJMNSbAqv1bI6Z1HwtZNl7AVA+WfkhBH1boU26D2YisNt5e2g
         bwjBvh+sBpQ9BftEw8xXqj7D2lCNlHAs5ZlUBU7y9tsvuJhW+ZjsRCvQjpW5C14dA/jX
         wSI08aD4rNWb623AcC3BM1XIEziE0SzlJImA+Yg0CGXGKtOMXG1v7cEpRinmHIFxz22h
         ofVfIhjATwDSlwJjyKBL10XVuqmPCxomNiVlXBhXb9DtnBSdsiv28gpedDApFPZcYnLE
         n/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695691170; x=1696295970;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fsJ1AG+PItAMxYQGXBlLsaQNPUUqgPIQhgj/xs3jUPE=;
        b=dwZvmD4REbV6RUUwdjCYCxi/an3gawznctBpO6ioaclV5iMLJ1ej0wzSo0l3lbsYOK
         9G51MygyarOXyENC2+WowyHs5UnFe625Nv3r9xOIm/QCSHks/gxQ5mh6bEgj+wY6uc2Q
         UF/iZPQer8yCiyiiyNPKwmyQoes6LJMjee27CFizh4r9jjENejv/wG3neTJ63uW/V0be
         OsF40gxHu/TsOP9kv3OzahA6ZifRNeGi6q4ubhFVyLcoJ7jq/HpXwP/Yr4tw/oEaoiME
         lOsR0NwTfhkTuNiHB+Jb1IUrx6kYPBMMcrPlWegSKGgkSYVKfMuE/42xsz+5MnVh89uJ
         mezQ==
X-Gm-Message-State: AOJu0YySus7iBuBzJ3IAU1nsLmKBRrJhi9usBg0EV8u1StKg6K9vNKFs
	FXAlVJnV4KQBYeUlHbmK1/A=
X-Google-Smtp-Source: AGHT+IGUhlQK6S0wR7xttCmtEql+IAiGd2z0Ql0JAy15bdgKU4AfnAtTtSu+pd5ze0IOFeD4RK9j3A==
X-Received: by 2002:a17:90a:3046:b0:26d:1eff:619f with SMTP id q6-20020a17090a304600b0026d1eff619fmr7219092pjl.2.1695691170044;
        Mon, 25 Sep 2023 18:19:30 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id mg6-20020a17090b370600b0027722832498sm4105283pjb.52.2023.09.25.18.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 18:19:29 -0700 (PDT)
Date: Tue, 26 Sep 2023 10:19:28 +0900 (JST)
Message-Id: <20230926.101928.767176570707357116.fujita.tomonori@gmail.com>
To: wedsonaf@gmail.com
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
	<20230924064902.1339662-2-fujita.tomonori@gmail.com>
	<CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi, thanks for reviewing!

On Sun, 24 Sep 2023 09:56:29 -0300
Wedson Almeida Filho <wedsonaf@gmail.com> wrote:

>> +/// Corresponds to the kernel's `enum phy_state`.
>> +#[derive(PartialEq)]
>> +pub enum DeviceState {
>> +    /// PHY device and driver are not ready for anything.
>> +    Down,
>> +    /// PHY is ready to send and receive packets.
>> +    Ready,
>> +    /// PHY is up, but no polling or interrupts are done.
>> +    Halted,
>> +    /// PHY is up, but is in an error state.
>> +    Error,
>> +    /// PHY and attached device are ready to do work.
>> +    Up,
>> +    /// PHY is currently running.
>> +    Running,
>> +    /// PHY is up, but not currently plugged in.
>> +    NoLink,
>> +    /// PHY is performing a cable test.
>> +    CableTest,
>> +}
>> +
>> +/// Represents duplex mode
> 
> nit: please add a period to the end of sentences. If nothing else, for
> consistency with the rest of the Rust code.

Oops, fixed.


>> +pub enum DuplexMode {
>> +    /// Full-duplex mode
>> +    Half,
>> +    /// Half-duplex mode
>> +    Full,
>> +    /// Unknown
>> +    Unknown,
>> +}
>> +
>> +/// Wraps the kernel's `struct phy_device`.
>> +#[repr(transparent)]
>> +pub struct Device(Opaque<bindings::phy_device>);
>> +
>> +impl Device {
>> +    /// Creates a new [`Device`] instance from a raw pointer.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// For the duration of the lifetime 'a, the pointer must be valid for writing and nobody else
>> +    /// may read or write to the `phy_device` object.
>> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::phy_device) -> &'a mut Self {
> 
> Does this function need to be public? Can it be `pub(crate)`?

Yeah, pub could be dropped. Should I?

> Is the requirement that nobody else may read or write to `phy_device` realistic?

Yes. The Device objects are used only inside the callbacks in
phy_driver. PHY drivers assume exclusive access.

As Andrew pointed out, resume/suspend dosn't hold phy_device's mutex
but still looks like PHY drivers assume exclusive access. After
googling, I leant that they have been trying to fix this locking
issue. I'll update the code accordingly.


>> +        unsafe { &mut *(ptr as *mut Self) }
>> +    }
>> +
>> +    /// Gets the id of the PHY.
>> +    pub fn id(&mut self) -> u32 {
>> +        let phydev = Opaque::get(&self.0);
> 
> I don't think you need this verbose syntax, you could just do:
> 
> let phydev = self.0.get();
> 
> The same apply to all instances below.

Nice, fixed.

>> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>> +        unsafe { (*phydev).phy_id }
>> +    }
>> +
>> +    /// Gets the state of the PHY.
>> +    pub fn state(&mut self) -> DeviceState {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>> +        let state = unsafe { (*phydev).state };
>> +        match state {
>> +            bindings::phy_state::PHY_DOWN => DeviceState::Down,
>> +            bindings::phy_state::PHY_READY => DeviceState::Ready,
>> +            bindings::phy_state::PHY_HALTED => DeviceState::Halted,
>> +            bindings::phy_state::PHY_ERROR => DeviceState::Error,
>> +            bindings::phy_state::PHY_UP => DeviceState::Up,
>> +            bindings::phy_state::PHY_RUNNING => DeviceState::Running,
>> +            bindings::phy_state::PHY_NOLINK => DeviceState::NoLink,
>> +            bindings::phy_state::PHY_CABLETEST => DeviceState::CableTest,
>> +        }
> 
> Wouldn't it make more sense to implement `TryFrom<T>` for
> `DeviceState` (where `T` is the type of `phydev.state`)? This way
> separate the concerns: `TryFrom` does the conversion and `state()`
> fetches it from a PHY.

Not sure. This is one of discussed issues on v1; what can/should we
return when TryFrom fails? If it fails, the phylib state machine is
already broken.


>> +    /// Sets the speed of the PHY.
>> +    pub fn set_speed(&mut self, speed: i32) {
> 
> Are negative speeds meaningful? If not, we should make `speed`
> unsigned. (And convert appropriately when storing in phydev.speed.)

Fixed.


>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>> +        unsafe {
>> +            (*phydev).speed = speed;
>> +        }
>> +    }
>> +
>> +    /// Sets duplex mode.
>> +    pub fn set_duplex(&mut self, mode: DuplexMode) {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>> +        unsafe {
>> +            match mode {
>> +                DuplexMode::Full => (*phydev).duplex = bindings::DUPLEX_FULL as i32,
>> +                DuplexMode::Half => (*phydev).duplex = bindings::DUPLEX_HALF as i32,
>> +                DuplexMode::Unknown => (*phydev).duplex = bindings::DUPLEX_UNKNOWN as i32,
>> +            }
>> +        }
> 
> To avoid repeating `(*phydev).duplex =` and to reduce the amount of
> code inside the unsafe block, I suggest you do something like this
> here:
> 
> let v = match mode {
>     DuplexMode::Full => bindings::DUPLEX_FULL,
>     DuplexMode::Half => bindings::DUPLEX_HALF,
>     DuplexMode::Unknown => bindings::DUPLEX_UNKNOWN,
> };
> 
> // SAFETY: This object is initialized by the `from_raw` constructor,
> so it's valid.
> unsafe { (*phydev).duplex = v};

Done.


> In fact, for this enum, you wan to use #[repr(i32)] and assign values
> from `bindings` so that you can avoid the match as convert using just
> `mode as i32`. See for example:
> 
> https://github.com/wedsonaf/linux/blob/rtarfs/rust/kernel/fs.rs#L71

I slightly prefer match but either works for me. As I wrote in another
mail, I'm not sure if we can handle nicely.


>> +    }
>> +
>> +    /// Reads a given C22 PHY register.
>> +    pub fn read(&mut self, regnum: u16) -> Result<u16> {
>> +        let phydev = Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constructor,
>> +        // so an FFI call with a valid pointer.
>> +        let ret = unsafe {
>> +            bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, regnum as u32)
>> +        };
>> +        if ret < 0 {
>> +            Err(Error::from_errno(ret))
>> +        } else {
>> +            Ok(ret as u16)
>> +        }
>> +    }
> 
> Is there any reason why you can't use `to_result` here?
> 
> I'm thinking something along the lines of:
> 
>     // SAFETY: ...
>     let ret = to_result(unsafe { bindings::mdiobus_read(...) })?;
>     Ok(ret as u16)

Can we? to_result() doens't return a value on success.

pub fn to_result(err: core::ffi::c_int) -> Result {
    if err < 0 {
        Err(Error::from_errno(err))
    } else {
        Ok(())
    }
}

something like to_result_with_value() might be useful, I guess.


> The same applies to similar code below.

Fixed where to_result() can be used.

>> +/// PHY is internal.
>> +pub const PHY_IS_INTERNAL: u32 = bit(0);
>> +/// PHY needs to be reset after the refclk is enabled.
>> +pub const PHY_RST_AFTER_CLK_EN: u32 = bit(1);
>> +/// Polling is used to detect PHY status changes.
>> +pub const PHY_POLL_CABLE_TEST: u32 = bit(2);
>> +/// Don't suspend.
>> +pub const PHY_ALWAYS_CALL_SUSPEND: u32 = bit(3);
> 
> To group these consts together so that it's clear they're related, we
> normally create a module: see for example these file flags:
> https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/file.rs#L25
> 
> /// Flags associated with a [`File`].
> pub mod flags {
>     /// File is opened in append mode.
>     pub const O_APPEND: u32 = bindings::O_APPEND;
> 
>    /...
> }

I see, fixed.


>> +/// An adapter for the registration of a PHY driver.
>> +pub struct Adapter<T: Driver> {
>> +    _p: PhantomData<T>,
>> +}
>> +
>> +impl<T: Driver> Adapter<T> {
>> +    /// Creates a new `Adapter` instance.
>> +    pub const fn new() -> Adapter<T> {
>> +        Self { _p: PhantomData }
>> +    }
>> +
>> +    unsafe extern "C" fn soft_reset_callback(
>> +        phydev: *mut bindings::phy_device,
>> +    ) -> core::ffi::c_int {
>> +        from_result(|| {
>> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
> 
> I'm sure the C the API guarantees that it's valid. But does it
> guarantee that nobody else is reading or writing to phydev? I haven't
> looked at the code but I'd be very surprised if it did.
>
> In any case, this is part of the safety requirements of `from_raw`.
> You need to address this likely unsoundness here and in the functions
> below.

As explained above, seems that that's how PHY drivers are implemented.


>> +    unsafe extern "C" fn read_mmd_callback(
>> +        phydev: *mut bindings::phy_device,
>> +        devnum: i32,
>> +        regnum: u16,
>> +    ) -> i32 {
>> +        from_result(|| {
>> +            // SAFETY: The C API guarantees that `phydev` is valid while this function is running.
>> +            let dev = unsafe { Device::from_raw(phydev) };
>> +            let ret = T::read_mmd(dev, devnum as u8, regnum)?;
> 
> For devnum, I think it makes more sense to use `try_into` to convert
> it to u8 and fail if it doesn't fit. Or have `T::read_mmd` take an
> `i32` as argument.

phylib makes sure that devnum is in a range before this funcation is
called. it needs to be 0..31, not all u8 . We still need to use
try_into() here?


>> +    /// Creates the kernel's `phy_driver` instance.
>> +    ///
>> +    /// This is used by [`module_phy_driver`] macro to create a static array of phy_driver`.
>> +    pub const fn create_phy_driver() -> Opaque<bindings::phy_driver> {
>> +        Opaque::new(bindings::phy_driver {
>> +            name: T::NAME.as_char_ptr() as *mut i8,
>> +            flags: <T>::FLAGS,
> 
> I don't think you need these brackets around `T`, i.e., `T::FLAGS`
> should suffice.
> 
> The same applies to all instances below.

Ah, fixed.


>> +/// Corresponds to functions in `struct phy_driver`.
>> +#[vtable]
> 
> We use this only when the C side offers some default non-trivial
> behaviour for some of the callbacks (in which case it doesn't make
> sense to replicate in Rust). But if the default behaviour is similar
> to our default implementations below (e.g., return `code::ENOTSUPP`),
> then we can simply drop this tag and simplify the code above by
> dropping the `HAS_XXX` checks.
> 
> Do you actually need vtable in PHY?

I might misunderstand vtable.

What PHY bindings want is: there are many callbacks in PHY drivers but
most of PHY drivers implement only some. The callbacks are not
implemented in a driver must be NULL.


>> +pub trait Driver {
>> +    /// Corresponds to `flags` in `struct phy_driver`.
> 
> Please document this properly. It's to ok to explain what it refers
> to, but we should also say what it does and what the accepted  values
> are. (For example, but putting the valid flags in a module -- as I
> suggest above -- and say here that valid values are combinations of
> the value in module `X`).
> 
> Part of the reason we're introducing Rust is to make it simpler (and
> safer) to write kernel code. This includes better documentation and
> not having to go read the C code to understand how things work.
> 
> In other words, if someone is writing a PHY driver in Rust, ideally
> they should be able to just read the Rust documentation and know what
> they need to do.
> 
> I know it's painful to do this (I've done it several times), but
> that's part of the work we need to put in while building these
> abstractions.

Sure, I could copy-and-paste comments in phylib. 


>> +/// Registration structure for a PHY driver.
>> +pub struct Registration {
>> +    module: &'static crate::ThisModule,
>> +    drivers: Option<&'static [Opaque<bindings::phy_driver>]>,
>> +}
>> +
>> +impl Registration {
>> +    /// Creates a new `Registration` instance.
>> +    pub fn new(module: &'static crate::ThisModule) -> Self {
>> +        Registration {
>> +            module,
>> +            drivers: None,
>> +        }
>> +    }
>> +
>> +    /// Registers a PHY driver.
>> +    pub fn register(&mut self, drivers: &'static [Opaque<bindings::phy_driver>]) -> Result {
>> +        if drivers.len() > 0 {
>> +            // SAFETY: Just an FFI call.
> 
> This is not a good-enough justification.
> 
> There's a bunch of pointers passed in. You need to justify why they're
> good now and why they'll remain good. Does `phy_drivers_register`
> require that pointers remain alive just during the call or until
> they're unregistered? If the latter (which I assume to be the case),
> you need to justify how it is that they remain valid. If they need to
> be pinned, how are you guaranteeing that?

Requiring a static array doesn't guarantee that?


>> +            let ret = unsafe {
>> +                bindings::phy_drivers_register(
>> +                    drivers[0].get(),
>> +                    drivers.len() as i32,
>> +                    self.module.0,
>> +                )
>> +            };
>> +            if ret != 0 {
>> +                return Err(Error::from_errno(ret));
>> +            }
>> +            self.drivers = Some(drivers);
>> +            Ok(())
>> +        } else {
>> +            Err(code::EINVAL)
>> +        }
>> +    }
>> +}
>> +
>> +impl Drop for Registration {
>> +    fn drop(&mut self) {
>> +        if let Some(drv) = self.drivers.take() {
>> +            // SAFETY: Just an FFI call.
> 
> Again, this isn't really a good justification.
> 
> At the very least, these must have been previously registered (and not
> unregistered since then).

Will try to improve.


>> +/// Declares a kernel module for PHYs drivers.
>> +///
>> +/// This creates a static array of `struct phy_driver] and registers it.
> 
> Typo: missing backtick.

Oops, fixed.


Thanks,
