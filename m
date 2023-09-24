Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AB8C8CC
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 13:51:47 +0000 (UTC)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0BB10F
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 06:51:45 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-d84c24a810dso5646219276.2
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Sep 2023 06:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695563505; x=1696168305; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DS++Cd89CVlc68dsG2RjC167OAI0fBeUudO60dPElGM=;
        b=a90/n5v/DsvyylbNvHYsjuacSGbKJi4m9oCsn4LuqfhAwbDrgt6PO05rnctUEF0kZa
         o2qHRyXA9IjvVnR6sDQ/2BZPQi92ecdFtqWcYVpKOdo0g9GiArmATXuQwD0+8gKg4+jC
         /Rw8hlRY5YbQf0dANadWTjprcic7SApOYzJwSNBT4+lYHP/+J7VGDURgpC0OPEfFJ/Fw
         t7AkXeBrtsr8s8pyXUrwB8vWELGtNPZxTLvcNDEmK5EscDqUeLotwWP7SJ5qOnpZ5eew
         BcdOPG4eYJUHlKsWWRvBQbjl/yJzDkNFwiCKc3OJuuTV63X6L7CwaCdbM2S4/LutJK8a
         10yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695563505; x=1696168305;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DS++Cd89CVlc68dsG2RjC167OAI0fBeUudO60dPElGM=;
        b=eA72WjVTSar/iTVtH0nELGD+s4O9OTFvXsuMJ8Io/xCKWjHZOfQTJQ3zfnePM9rAc5
         RN43nvcwClnZthTQ7wTWoI9i7PzAK+vZmQfoDuS0UuvR1f3lR/mrncaY8GEiA8t1HHO0
         N36dJPNPUYax3ZOEK8C1nK0QY5F6rW0ZTHkRbExPod/oLo9izaOnNinf9js2Do9Euwhm
         blCXFgj6sEHv11XH6G3VKEs/2NrTQzndAUViLb8tRr7sDnEzfae0sDyn47Ra3s8uKjz1
         d+wLa5VHISr6DCHi5mv6wy0N7AogW+szVM5K9S4MUN1+fUhqDkD4oNPgFwI/HyR1hdxK
         OySg==
X-Gm-Message-State: AOJu0YxTcTSsO8VakGNVYxVgLRY0qG0Jwwe2jdDRpqRFhB+7pT1JtWkT
	/FcYX802qzizwdfaND/+C29jTHhQWwwlI16SV6w=
X-Google-Smtp-Source: AGHT+IF3Btc6C8lhZtb9swPvbIgFpDz/BJLBZcTZHt+1dtv3FJ6nnS9Cgj34j3pVzMpr3ptXCucCSzDNKRjZ+T6x5K4=
X-Received: by 2002:a25:ad66:0:b0:d4c:a288:ef4 with SMTP id
 l38-20020a25ad66000000b00d4ca2880ef4mr3586976ybe.44.1695563505060; Sun, 24
 Sep 2023 06:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
 <20230924064902.1339662-2-fujita.tomonori@gmail.com> <CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
 <652520d9-c409-6bb4-821b-5bb8bf99bc0d@proton.me>
In-Reply-To: <652520d9-c409-6bb4-821b-5bb8bf99bc0d@proton.me>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Sun, 24 Sep 2023 10:51:34 -0300
Message-ID: <CANeycqq+az08SR3ucSyyT_82Bcxy8SZTcP+6OEzSY2+GHMjokA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: Benno Lossin <benno.lossin@proton.me>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	andrew@lunn.ch, tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, 24 Sept 2023 at 10:40, Benno Lossin <benno.lossin@proton.me> wrote:
>
> On 24.09.23 14:56, Wedson Almeida Filho wrote:
> > On Sun, 24 Sept 2023 at 03:49, FUJITA Tomonori
> >> +        let phydev = Opaque::get(&self.0);
> >> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> >> +        unsafe {
> >> +            (*phydev).speed = speed;
> >> +        }
> >> +    }
> >> +
> >> +    /// Sets duplex mode.
> >> +    pub fn set_duplex(&mut self, mode: DuplexMode) {
> >> +        let phydev = Opaque::get(&self.0);
> >> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
> >> +        unsafe {
> >> +            match mode {
> >> +                DuplexMode::Full => (*phydev).duplex = bindings::DUPLEX_FULL as i32,
> >> +                DuplexMode::Half => (*phydev).duplex = bindings::DUPLEX_HALF as i32,
> >> +                DuplexMode::Unknown => (*phydev).duplex = bindings::DUPLEX_UNKNOWN as i32,
> >> +            }
> >> +        }
> >
> > To avoid repeating `(*phydev).duplex =` and to reduce the amount of
> > code inside the unsafe block, I suggest you do something like this
> > here:
> >
> > let v = match mode {
> >      DuplexMode::Full => bindings::DUPLEX_FULL,
> >      DuplexMode::Half => bindings::DUPLEX_HALF,
> >      DuplexMode::Unknown => bindings::DUPLEX_UNKNOWN,
> > };
> >
> > // SAFETY: This object is initialized by the `from_raw` constructor,
> > so it's valid.
> > unsafe { (*phydev).duplex = v};
> >
> >
> > In fact, for this enum, you wan to use #[repr(i32)] and assign values
> > from `bindings` so that you can avoid the match as convert using just
> > `mode as i32`. See for example:
> >
> > https://github.com/wedsonaf/linux/blob/rtarfs/rust/kernel/fs.rs#L71
> >
>
> I do not like `as`-style casts, they are error prone and no warning/error
> is generated if they are used incorrectly. They also make review harder,
> because I now have to look if the enum indeed has that correct repr.
> I think we should talk about this in one of our meetings.

Yes, let's discuss this with the rest of the team in a meeting.

I think the main advantage is that we avoid the big match statement
and additional code that it entails. Perhaps we could have a `TryFrom`
implementation that uses `as` and that's what callers use. Then we
only have to review/verify the `as` usage once when the enum is
defined.

Another option is to keep the big match statement if we can show that
the compiler can optimise it out.

>
> >> +            phy_id: <T>::PHY_ID,
> >> +            phy_id_mask: <T>::PHY_ID_MASK,
> >> +            soft_reset: if <T>::HAS_SOFT_RESET {
> >> +                Some(Self::soft_reset_callback)
> >> +            } else {
> >> +                None
> >> +            },
> >> +            get_features: if <T>::HAS_GET_FEATURES {
> >> +                Some(Self::get_features_callback)
> >> +            } else {
> >> +                None
> >> +            },
> >> +            match_phy_device: if <T>::HAS_MATCH_PHY_DEVICE {
> >> +                Some(Self::match_phy_device_callback)
> >> +            } else {
> >> +                None
> >> +            },
> >> +            suspend: if <T>::HAS_SUSPEND {
> >> +                Some(Self::suspend_callback)
> >> +            } else {
> >> +                None
> >> +            },
> >> +            resume: if <T>::HAS_RESUME {
> >> +                Some(Self::resume_callback)
> >> +            } else {
> >> +                None
> >> +            },
> >> +            config_aneg: if <T>::HAS_CONFIG_ANEG {
> >> +                Some(Self::config_aneg_callback)
> >> +            } else {
> >> +                None
> >> +            },
> >> +            read_status: if <T>::HAS_READ_STATUS {
> >> +                Some(Self::read_status_callback)
> >> +            } else {
> >> +                None
> >> +            },
> >> +            read_mmd: if <T>::HAS_READ_MMD {
> >> +                Some(Self::read_mmd_callback)
> >> +            } else {
> >> +                None
> >> +            },
> >> +            write_mmd: if <T>::HAS_WRITE_MMD {
> >> +                Some(Self::write_mmd_callback)
> >> +            } else {
> >> +                None
> >> +            },
> >> +            link_change_notify: if <T>::HAS_LINK_CHANGE_NOTIFY {
> >> +                Some(Self::link_change_notify_callback)
> >> +            } else {
> >> +                None
> >> +            },
> >> +            // SAFETY: The rest is zeroed out to initialize `struct phy_driver`,
> >> +            // sets `Option<&F>` to be `None`.
> >> +            ..unsafe { core::mem::MaybeUninit::<bindings::phy_driver>::zeroed().assume_init() }
> >
> > I think you could just use bindings::phy_driver::default() here.
>
> That is not possible, since it is not a const function.

Ah, yeah, this is in const context. Nevermind.
