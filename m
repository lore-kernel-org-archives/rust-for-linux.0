Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0BE6ABF
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 13:40:06 +0000 (UTC)
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14C3583
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1695562803; x=1695822003;
	bh=8gOrncw4yOYys20B8HsqQF2w3AdyVO/43SMkoPBXEHs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WxTFU/BHHJbL/rI2kowRO/7Ey1y1da3z0cwd0QLrUXwVfQxczBsvxwcq5bxsa/uqq
	 S4xdm7YyD07njKssE1K2nI5DVu9w7auUqwioU1KODGW5+hYC7S/TeaXP9cVpMtEVym
	 azss4eWof8NnBRbPjYjkhmbVJKnNI5W9Fw08lYo9rhVedS889eAR5yCPShVUzspxAz
	 3IUbwV/jMzsjLmK7TSfZqfR29aGtjzSTG1IXgSu8vD86T/UNScXUKEWy4C0cNuHgPM
	 lYPKthgQFlXHaS46GtCeRJLwqdh1FpdnQvUCIHErhvUgA5z1n2YZLzfrJdLYcHgBWW
	 szU/TQyyALpaA==
Date: Sun, 24 Sep 2023 13:39:55 +0000
To: Wedson Almeida Filho <wedsonaf@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
Message-ID: <652520d9-c409-6bb4-821b-5bb8bf99bc0d@proton.me>
In-Reply-To: <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com> <20230924064902.1339662-2-fujita.tomonori@gmail.com> <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
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
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 24.09.23 14:56, Wedson Almeida Filho wrote:
> On Sun, 24 Sept 2023 at 03:49, FUJITA Tomonori
>> +        let phydev =3D Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constru=
ctor, so it's valid.
>> +        unsafe {
>> +            (*phydev).speed =3D speed;
>> +        }
>> +    }
>> +
>> +    /// Sets duplex mode.
>> +    pub fn set_duplex(&mut self, mode: DuplexMode) {
>> +        let phydev =3D Opaque::get(&self.0);
>> +        // SAFETY: This object is initialized by the `from_raw` constru=
ctor, so it's valid.
>> +        unsafe {
>> +            match mode {
>> +                DuplexMode::Full =3D> (*phydev).duplex =3D bindings::DU=
PLEX_FULL as i32,
>> +                DuplexMode::Half =3D> (*phydev).duplex =3D bindings::DU=
PLEX_HALF as i32,
>> +                DuplexMode::Unknown =3D> (*phydev).duplex =3D bindings:=
:DUPLEX_UNKNOWN as i32,
>> +            }
>> +        }
>=20
> To avoid repeating `(*phydev).duplex =3D` and to reduce the amount of
> code inside the unsafe block, I suggest you do something like this
> here:
>=20
> let v =3D match mode {
>      DuplexMode::Full =3D> bindings::DUPLEX_FULL,
>      DuplexMode::Half =3D> bindings::DUPLEX_HALF,
>      DuplexMode::Unknown =3D> bindings::DUPLEX_UNKNOWN,
> };
>=20
> // SAFETY: This object is initialized by the `from_raw` constructor,
> so it's valid.
> unsafe { (*phydev).duplex =3D v};
>=20
>=20
> In fact, for this enum, you wan to use #[repr(i32)] and assign values
> from `bindings` so that you can avoid the match as convert using just
> `mode as i32`. See for example:
>=20
> https://github.com/wedsonaf/linux/blob/rtarfs/rust/kernel/fs.rs#L71
>=20

I do not like `as`-style casts, they are error prone and no warning/error
is generated if they are used incorrectly. They also make review harder,
because I now have to look if the enum indeed has that correct repr.
I think we should talk about this in one of our meetings.

>> +            phy_id: <T>::PHY_ID,
>> +            phy_id_mask: <T>::PHY_ID_MASK,
>> +            soft_reset: if <T>::HAS_SOFT_RESET {
>> +                Some(Self::soft_reset_callback)
>> +            } else {
>> +                None
>> +            },
>> +            get_features: if <T>::HAS_GET_FEATURES {
>> +                Some(Self::get_features_callback)
>> +            } else {
>> +                None
>> +            },
>> +            match_phy_device: if <T>::HAS_MATCH_PHY_DEVICE {
>> +                Some(Self::match_phy_device_callback)
>> +            } else {
>> +                None
>> +            },
>> +            suspend: if <T>::HAS_SUSPEND {
>> +                Some(Self::suspend_callback)
>> +            } else {
>> +                None
>> +            },
>> +            resume: if <T>::HAS_RESUME {
>> +                Some(Self::resume_callback)
>> +            } else {
>> +                None
>> +            },
>> +            config_aneg: if <T>::HAS_CONFIG_ANEG {
>> +                Some(Self::config_aneg_callback)
>> +            } else {
>> +                None
>> +            },
>> +            read_status: if <T>::HAS_READ_STATUS {
>> +                Some(Self::read_status_callback)
>> +            } else {
>> +                None
>> +            },
>> +            read_mmd: if <T>::HAS_READ_MMD {
>> +                Some(Self::read_mmd_callback)
>> +            } else {
>> +                None
>> +            },
>> +            write_mmd: if <T>::HAS_WRITE_MMD {
>> +                Some(Self::write_mmd_callback)
>> +            } else {
>> +                None
>> +            },
>> +            link_change_notify: if <T>::HAS_LINK_CHANGE_NOTIFY {
>> +                Some(Self::link_change_notify_callback)
>> +            } else {
>> +                None
>> +            },
>> +            // SAFETY: The rest is zeroed out to initialize `struct phy=
_driver`,
>> +            // sets `Option<&F>` to be `None`.
>> +            ..unsafe { core::mem::MaybeUninit::<bindings::phy_driver>::=
zeroed().assume_init() }
>=20
> I think you could just use bindings::phy_driver::default() here.

That is not possible, since it is not a const function.


