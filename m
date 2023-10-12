Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E34D33D2
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 04:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="TKEX/2m2"
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9845B7
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 21:20:36 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5a7af20c488so6870607b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 21:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1697084436; x=1697689236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aW9CQmMBpZIQNvsSFJQ+X0TJw1tCkzMoWdPiwLa/dfo=;
        b=TKEX/2m2JRDLNakHnEC3mHi8KyhAjNptVHJ1fHj6UtYaex5T0TW5I87+qJtNeAHBzh
         7rTj58yCKUTrGunvG1xDhTPT3Tx3/J9kXga+rkEZ11i93zIhvIdiShSn6KxLbrtsw+dl
         c3sGAbqwql/P3xnYQTemBPgPOu7JPztCRSPyiWamyp6Z4jVm3tMCUIhrK1o79kzBakuX
         OaugXa6htfAJVpAxnVNBeiP2YmUB8op0ZWcWib07n66RBLCpevLFt2+e0lqnzqhC9yDe
         cZVQQ9/eJ3C6AoU+dYOP5fWNCEpeWoOxoPTVcUldrIcbnZ9VSuai1+vrrQ61vGANmLkV
         eslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697084436; x=1697689236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aW9CQmMBpZIQNvsSFJQ+X0TJw1tCkzMoWdPiwLa/dfo=;
        b=rBmW0j0cO4FKlRWtHcdUMXFEq0W9oYQdA0W+noEkBwIbbOOoVyFRCWTgrej4p/Bq4s
         ITJrp44hYUTdgeTOjkgP+saudLABAx/lUnvSHd85PLINY0LvLCuUhCaC/0PckYLgjeLv
         qAwndO/UbC6vlItWL1NM0R4pgb1S1XwM8yWei3Qk4c1brRpZza8E35hJ+mRbBlmb7/Vw
         vaZuLAwK008v1sEmHd4VVGCZMhvoQxItB8cx9Dz1JQUT2dA3OLIIEIvnxYgHoCrGKgw+
         1ZyzaV819AZ9hVPyysa8NmDa38ZdpRhzPuKtDzrzNXcfuUOiRhZrM372BkY+Hv69RAwO
         BwiA==
X-Gm-Message-State: AOJu0Ywr9Urs88iqTKjm/Ov8a/Qq1W+EaNwWQ8xiW6WLnQVrAmSJqY9b
	p90MlmKSyRUQwJHPEs3fNpNtaXwxSs3jmneXW93zgEnra3d+gjucOU1+4A==
X-Google-Smtp-Source: AGHT+IExXHnZQvLLfZfsfNUWPN12oHT3lbxAD6G8U1zsbHcSu3Xj1FmDWQb4OaEKTr489y3vBQ+dFuOJnWsCONYtAE0=
X-Received: by 2002:a0d:cb49:0:b0:5a7:c97e:39e3 with SMTP id
 n70-20020a0dcb49000000b005a7c97e39e3mr6125607ywd.15.1697084436013; Wed, 11
 Oct 2023 21:20:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALNs47uCJsTsPVPcL5-iYvzCgrJhPnEXgQ5Di-SEh5WD9vF1qQ@mail.gmail.com>
 <20231012.085715.1926246245884454683.fujita.tomonori@gmail.com>
 <CALNs47s_wjytz3sw6uXA-27NnZkN1z+WYztfQ2Hnw0qVqEWwDw@mail.gmail.com> <20231012.121656.1502998233251919494.fujita.tomonori@gmail.com>
In-Reply-To: <20231012.121656.1502998233251919494.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 12 Oct 2023 00:20:24 -0400
Message-ID: <CALNs47sT2mhP+q7ESEMwuJpQaOS8++xortWLv-Q95Xxr4YXg0Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com, 
	rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 11, 2023 at 11:17=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
> >> 3. multiple phy drivers has one id in device_table.
> >>
> >> How these approach can handle the case?
> >>
> >> Also note that there is a driver doesn't define PHY_ID, uses
> >> match_phy_device() instead.
> >
> > In this case you would just need to put the same `DeviceId` in the
> > array for both drivers, perhaps as a const. I think this proposal
>
> I'm not sure modpost can handle it.
>
> I guess that you would have two exact same lines in modules.alias,
> which might works but I don't think that it's not designed to handle
> such.
>
> Or the macro needs to find the same id and keep only one.

Good point, scratch that. What about this logic:

1. Leave `Driver` as you have it, one `DeviceId` with a null default
2. Use the macro to create a `const fn` to build the mdio_device_table
so you can add logic (like in the playground I linked)
3. Make this function skip anything that doesn't specify a `DeviceId`,
i.e. if the `DeviceID` is null don't add it to the table
4. Any devices that don't specify a `DeviceId` must specify
`match_phy_device` (I think, since it will never get matched
otherwise?). This could be verified in `create_phy_driver`
4. In the macro, allow specifying extra `DeviceId`s that aren't
specific to any phy.

Something complex like the icplus driver [1] is probably a good test
to see how any of these work out. I think that would look something
like:

    const IP175C_PHY_ID: u32 =3D 0x02430d80;
    const IP1001_PHY_ID: u32 =3D 0x02430d90;
    const IP101A_PHY_ID: u32 =3D 0x02430c54;

    impl Driver for Ip175c {
        const PHY_DEVICE_ID: phy::DeviceId =3D
phy::DeviceId::match_model(IP175C_PHY_ID);
        // ...
    }

    impl Driver for Ip1001 {
        const PHY_DEVICE_ID: phy::DeviceId =3D
phy::DeviceId::match_model(IP1001_PHY_ID);
        // ...
    }

    impl Driver for Ip101a {
        // no override of PHY_DEVICE_ID
        fn match_phy_device(_dev: &mut Device) -> bool { /* ... */ }
        // ...
    }

    impl Driver for Ip101g {
        // no override of PHY_DEVICE_ID
        fn match_phy_device(_dev: &mut Device) -> bool { /* ... */ }
        // ...
    }

    kernel::module_phy_driver! {
        // the first two drivers provide match_model for IP175C_PHY_ID
and IP1001_PHY_ID
        drivers: [Ip175, Ip1001, Ip101a, Ip101g],
        // this provides the extra match_exact
        // this field is optional, most drivers won't need it
        additional_matches: [phy::DeviceId::match_exact(IP101A_PHY_ID)],
        name: "...",
        author: "...",
        description: "ICPlus IP175C/IP101A/IP101G/IC1001 PHY drivers",
        license: "...",
    }

Nice because the easy default behavior is to add PHY_DEVICE_ID to the
table if it is specified. But you get the flexibility to not provide
it, or add extra entries that aren't specific to a device. Any
thoughts?

If this works, maybe PHY_DEVICE_ID should be Option<DeviceId> to make
it more clear that you don't have to specify anything?

---

I know you have the `DeviceId` functions called `new_with_exact_mask`
and similar. Maybe rename them to `match_exact`, `match_vendor`,
`match_model` so they are easier to discover based on the C macros?
Also more terse.

[1]: https://elixir.bootlin.com/linux/v6.6-rc5/source/drivers/net/phy/icplu=
s.c
