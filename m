Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161726FBD
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="QJvTAWmR"
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B42B9
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 00:11:49 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d81afd5273eso3701911276.3
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Oct 2023 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696749108; x=1697353908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SEOXfJA7vzTv4ptNNIVK7Ccy8v0ranMjIXDfq2q8cM=;
        b=QJvTAWmRMAL84cGrwiVkNfCPYA3D/XTSgEaBx5OE5H4mp55TSrpgYSVURwE/7I9mMX
         07/u7cIowFhW0U6t4CXf55gL3Npq2JR7Re3sXBjD0cya4diYvwLrzPE88C6TEmFiKltf
         wHQMeIBHPul0B1KCDwSl3cst2rq/J1MforB0Ei6I+j+ynzIO/cQeVdcWGmISX/wFuqex
         uTt28TMD+zP/sDcuxjFhiQa4gVK5m/FJN8uhdjxbSf3xdjiE4QeM0npdsmVrrjsdA+aa
         aBfSmeo0h21NVwcnHC6ghSEMnPhmoqnxoyJcDb1cKDhAvhSkj50kODnxvx/VQGs8MhKx
         O1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696749108; x=1697353908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6SEOXfJA7vzTv4ptNNIVK7Ccy8v0ranMjIXDfq2q8cM=;
        b=uJ8zWhlGflT/m1U2g0VfG1uXpagShdY9aahyIytLfgFDMqnrF/w2f1Zj5rFOcOOWSk
         2+CqPGzFwoCvo9bZpl3+CQsc3VKhAUWXjE/uw5WN/mva8aLkvuU5Gxpv3A/Boah2ffQS
         EwnnXXyE8W6eEC1STZbguUCfb11BJZNQJcqo95MWKUkuXTN87ME1QGt7V8Ys4L3lQh7c
         PCQXdbvR5jlizbzswDM96oi7ej4J9ju+5DkAczMosoBtVZCHYw3fw59TcXf1GvlJLD/U
         YYcr1fypp1Dz/TrenJxo9WVxlw0Skwqmt8VRwxQWy6nW1gyc/RbKWnqhql1jk3wnOu/p
         K/rg==
X-Gm-Message-State: AOJu0YwXVOhI04WL3fdJ3kdtQatxG9ctunP0v1qo4UUKc0l/NbngVUS/
	hFhevtNyIHByCfHePkaYicSnGf9j3xlP9nq7tEaNkA==
X-Google-Smtp-Source: AGHT+IHiLam8NYeG4w8zFjLq9SzVce7FiePeqlro3AOd9i6WDLpmhFete+ozBjcwvjpfp2PkYO9N82WSAO3uZ4ueyfY=
X-Received: by 2002:a25:374b:0:b0:d0a:da40:638e with SMTP id
 e72-20020a25374b000000b00d0ada40638emr10999315yba.12.1696749108528; Sun, 08
 Oct 2023 00:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231006094911.3305152-1-fujita.tomonori@gmail.com>
 <20231006094911.3305152-4-fujita.tomonori@gmail.com> <CALNs47syMxiZBUwKLk3vKxzmCbX0FS5A37FjwUzZO9Fn-iPaoA@mail.gmail.com>
 <20231007.210734.448113675800173824.fujita.tomonori@gmail.com>
In-Reply-To: <20231007.210734.448113675800173824.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 8 Oct 2023 03:11:36 -0400
Message-ID: <CALNs47sxuGVXBwhXZa5NgHQ8F0MH2OoUzsgthAURE+OuTtJ1wQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] net: phy: add Rust Asix PHY driver
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	greg@kroah.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Oct 7, 2023 at 8:10=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
> >> +    fn read_status(dev: &mut phy::Device) -> Result<u16> {
> >> +        dev.genphy_update_link()?;
> >> +        if !dev.get_link() {
> >> +            return Ok(0);
> >> +        }
> >
> > Looking at this usage, I think `get_link()` should be renamed to just
> > `link()`. `get_link` makes me think that it is performing an action
> > like calling `genphy_update_link`, just `link()` sounds more like a
> > static accessor.
>
> Andrew suggested to rename link() to get_link(), I think.
>
> Then we discussed again last week:
>
> https://lore.kernel.org/rust-for-linux/20231004.084644.50784533959398755.=
fujita.tomonori@gmail.com/

Thanks for the link, in that case LGTM

>
> >> +        if ret as u32 & uapi::BMCR_SPEED100 !=3D 0 {
> >> +            dev.set_speed(100);
> >> +        } else {
> >> +            dev.set_speed(10);
> >> +        }
> >
> > Speed should probably actually be an enum since it has defined values.
> > Something like
> >
> >     #[non_exhaustive]
> >     enum Speed {
> >         Speed10M,
> >         Speed100M,
> >         Speed1000M,
> >         // 2.5G, 5G, 10G, 25G?
> >     }
> >
> >     impl Speed {
> >         fn as_mb(self) -> u32;
> >     }
> >
>
> ethtool.h says:
>
> /* The forced speed, in units of 1Mb. All values 0 to INT_MAX are legal.
>  * Update drivers/net/phy/phy.c:phy_speed_to_str() and
>  * drivers/net/bonding/bond_3ad.c:__get_link_speed() when adding new valu=
es.
>  */
>
> I don't know there are drivers that set such values.

Andrew replied to this too and an enum wouldn't work. Maybe good to
add uapi/linux/ethtool.h to the bindings and use the SPEED_X defined
there?

> >> +        let duplex =3D if ret as u32 & uapi::BMCR_FULLDPLX !=3D 0 {
> >> +            phy::DuplexMode::Full
> >> +        } else {
> >> +            phy::DuplexMode::Half
> >> +        };
> >
> > BMCR_x and MII_x are generated as `u32` but that's just a bindgen
> > thing. It seems we should reexport them as the correct types so users
> > don't need to cast all over:
> >
> >     pub MII_BMCR: u8 =3D bindings::MII_BMCR as u8;
> >     pub BMCR_RESV: u16 =3D bindings::BMCR_RESV as u16; ...
> >     // (I'd just make a macro for this)
> >
> > But I'm not sure how to handle that since the uapi crate exposes its
> > bindings directly. We're probably going to run into this issue with
> > other uapi items at some point, any thoughts Miguel?
>
> reexporting all the BMCR_ values by hand doesn't sound fun. Can we
> automaticall generate such?

Definitely not by hand, I don't think bindgen allows finer control
over what types are created from `#define` yet. I am not sure what our
policy is on build scripts but the below would work:

    # repeat this with a different prefix (BMCR) and type (u16) as needed
    perl -ne 'print if
s/^#define\s+(BMCR\w+)\s+([0-9xX]+)\s+(?:\/\*(.*)\*\/)?/\/\/\/ \3\npub
const \1: u16 =3D \2;/' include/uapi/linux/mii.h > somefile.rs

That creates outputs

    ///  MSB of Speed (1000)
    pub const BMCR_SPEED1000: u16 =3D 0x0040;
    ///  Collision test
    pub const BMCR_CTST: u16 =3D 0x0080;
    ///  Full duplex
    pub const BMCR_FULLDPLX: u16 =3D 0x0100;

Miguel, any suggestions here?
