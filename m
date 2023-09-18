Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FA71CFA7
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 16:39:43 +0000 (UTC)
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACF27CDB
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Sep 2023 09:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1695050465; x=1695309665;
	bh=lBBdXNjN3kLSkt3iHJwjWuIlovbekGyrDUwPsAtAMRM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nuknbFqe87LfTlZezyQhNbVOq9py2pSyTwKEVfbzChgFvob6FP7NEK4oW2T8he3kh
	 bPoMOK0Ni6MJQvipnXXTnixQOL6kbjs/iu8L3xVq6gergJxdKbjEGUvMq73D8QJOBt
	 8Ul1xa/IMCr3wzeuV86yowoFYHvQ+G8jWBAhYMaj60eemZGiTmXUSwWNrJhA8ma76W
	 RIZ3x2Gasv7FfR9iorLk6ElThsL7/TXmHAOejiDJyiA05DxzfK/HP3CEF4MT/gyFkM
	 1IzlgaD1mFYtRqiDMAMX1b+d6ECizsdOBhs5q7hUlz2Y7yeksU4UC6kQfzgU/8UzH5
	 FLYGDPi/nA0SA==
Date: Mon, 18 Sep 2023 15:20:53 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY drivers
Message-ID: <dfc87664-24c3-88ac-ec34-2b65e898628d@proton.me>
In-Reply-To: <20230918.220905.1497497848303760774.ubuntu@gmail.com>
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com> <20230913133609.1668758-2-fujita.tomonori@gmail.com> <532b57ad-6d35-f0ee-1433-b9b63a91fdd5@proton.me> <20230918.220905.1497497848303760774.ubuntu@gmail.com>
Feedback-ID: 71780778:user:proton
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 9/18/23 15:09, FUJITA Tomonori wrote:
> Hi,
>=20
> On Mon, 18 Sep 2023 10:22:22 +0000
> Benno Lossin <benno.lossin@proton.me> wrote:
>=20
>>   > +/// PHY is internal.
>>   > +pub const PHY_IS_INTERNAL: u32 =3D 0x00000001;
>>   > +/// PHY needs to be reset after the refclk is enabled.
>>   > +pub const PHY_RST_AFTER_CLK_EN: u32 =3D 0x00000002;
>>   > +/// Polling is used to detect PHY status changes.
>>   > +pub const PHY_POLL_CABLE_TEST: u32 =3D 0x00000004;
>>   > +/// Don't suspend.
>>   > +pub const PHY_ALWAYS_CALL_SUSPEND: u32 =3D 0x00000008;
>>
>> I think we should create a macro for creating flags, it should create a
>> newtype and
>> work similar to an enum declaration. On the newtype it should implement
>> the `Or` trait
>> for allowing `PHY_IS_INTERNAL | PHY_RST_AFTER_CLK_EN`.
>=20
> You are thinking about something like:
> https://crates.io/crates/enumflags2
>=20
> ?

I would prefer https://crates.io/crates/bitflags
because this library does not create a separate type for multiple flags.

I will look into this and see with what I come up.

>=20
>>   > +/// Registration structure for a PHY driver.
>>   > +///
>>   > +/// `Registration` can keep multiple `phy_drivers` object because
>>   > +/// commonly one module implements multiple PHYs drivers.
>>   > +pub struct Registration<const N: usize> {
>>   > +    module: &'static crate::ThisModule,
>>   > +    drivers: [Option<Box<bindings::phy_driver>>; N],
>>
>> Why is this not a vector? You have to allocate in `register` anyways.
>> You could also use `Vec::try_with_capacity(N)` to initialize the vector =
with
>> capacity for N elements.
>=20
> I thought that this is simpler. What are advantages of Vec over this?
>=20

Pushing a new value is a lot simpler, since it only is a single function=20
call and not a loop. You also do not need a generic parameter.

>=20
>>   > +impl<const N: usize> Registration<{ N }> {
>>   > +    /// Creates a new `Registration` instance.
>>   > +    pub fn new(module: &'static crate::ThisModule) -> Self {
>>   > +        const NONE: Option<Box<bindings::phy_driver>> =3D None;
>>   > +        Registration {
>>   > +            module,
>>   > +            drivers: [NONE; N],
>>   > +        }
>>   > +    }
>>   > +
>>   > +    /// Registers a PHY driver.
>>   > +    pub fn register<T: Driver>(&mut self, adapter: &Adapter<T>) ->
>> Result {
>>
>> The way this function is used in the driver makes me think that the
>> `Adapter`
>> type does not have to be public. So I would suggest to change the
>> signature to
>> `pub fn register<T: Driver>(&mut self, name: &'static CStr) -> Result`.
>=20
> Ah, right. I'll in the next round.
>=20
>>
>>   > +        for i in 0..N {
>>   > +            if self.drivers[i].is_none() {
>>   > +                let mut drv =3D Box::try_new(adapter.driver())?;
>>   > +                // SAFETY: Just an FFI call.
>>   > +                let ret =3D unsafe {
>> bindings::phy_driver_register(drv.as_mut(), self.module.0) };
>>
>> This call exposes the driver to the C side and thus it is able to be
>> modified at any time,
>> which means that in Rust it should be put into an `UnsafeCell`, better
>> even in this case it
>> should just be `Opaque`, so the `drivers` fields should be of type
>> `[Option<Box<Opaque<bindings::phy_driver>>>]`.
>=20
> Understood.

Actually, I talked with Gary and what I suggested is actually not=20
sufficient, because `Box` means that we have a unique pointer, even=20
though it contains an Opaque. So what we would suggest would be to use=20
`Box::into_raw` then both store that pointer and give it to=20
`phy_driver_register`.

>=20
>> It would also be a good idea to pin it, since the C side will rely on
>> the pointee not moving
>> and it will prevent accidentally moving it.
>=20
> The above drv is touched by only this file. What possible cases where
> it would be moved?
>=20

If you do what I wrote above, then this is not a problem. The rationale=20
behind this suggestion was to make it impossible to move the value in a=20
future modification of this file.

