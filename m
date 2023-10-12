Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF3655
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Oct 2023 03:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="oF1uhh/I"
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FA0A4
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 20:09:15 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d9a518d66a1so600910276.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Oct 2023 20:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1697080155; x=1697684955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqxraEpSTDJh31M15ngooGnPOgYQ3SDDAAgZGlwyHUM=;
        b=oF1uhh/It9B4F5ef/7ECCirCiJqKtX7KJ+FNEsBMlCNcW7QLFfxZfKjQI9xHcnyYov
         G9vAOUR8gRP7MnZLlm+gRyvlicaegPfEg/HralFlWMdnmRjS3w149q93xmllcQQ82qeu
         LPoAznol+oUPOp/fUYRg0PEeBz+we5eoWW7FxD5vekJnGgLV1sZ2SCvdzNF/qdi6KxST
         Z4TzenJOHegsoyErmDCxWuqrotA8ETDsxWM6UrMpqGsKU9rltdYQDyUGBfJQR5p+PNku
         rOvivtT/KLERYpLlWVfTsOPo5wMCW4b0UJ9Ir/NiTEnJfYTm1hT7lWmnYm6Qva9V6Fsn
         mqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697080155; x=1697684955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqxraEpSTDJh31M15ngooGnPOgYQ3SDDAAgZGlwyHUM=;
        b=ikpcO25siC+sZbqe0t4sMFDR6x9KdCNWb77gEysO3hSV3NXgXBvPtmXrjP49jfJODj
         bMUAuW3GcBLzt26n23rRyBt6IsGaMObEacWnNqY00Y7PJpyLjCzr7AVXYfb0bBjwUbuG
         b5ZDGoRgrKIrcvXpbQBhiwKk1YWdwFrCRUOaehsVakl8JlZhbMOrsHqDzMQX7CtTxutF
         ayX6c64dKK4s+lzs30fz5bC9OZyozM/FonyTfl+0Do20zVTR+ypJk7NvqIGvrD3oLFBm
         90UZDhszWjKNgd1h/0gNBGR4T2Hjt/WO4qGETbZAwQZzVpjQk6/KerYWsZ/gN5yKck8m
         HadA==
X-Gm-Message-State: AOJu0Yyxgqq2NsULb3+AV9J6Vz2C2L1nBKwblZgFdIGKxpKdQPeK1DHQ
	pdYoHWwnA992MjHjSbjTw7pqDs8zXVqHgOXyYBwGTskV+c4o7b/5fa+rQA==
X-Google-Smtp-Source: AGHT+IGAPoNukyvuyY0FjYu8se1steSOuAd0hVEapRBhsVQj20+XHDNuTIPM3xqFy9tEqA8V7GsmxWPVEaujUR5M7rc=
X-Received: by 2002:a5b:a86:0:b0:d0a:8973:b1c with SMTP id h6-20020a5b0a86000000b00d0a89730b1cmr19324778ybq.12.1697080155010;
 Wed, 11 Oct 2023 20:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CALNs47svn98i7O5Gfm6nXo_N0VFod+1LVj0oe2j_q46yGAiZHw@mail.gmail.com>
 <CANiq72m4JhSmNjkTKh2AKwc2KJXyKh6taWFJUcjm0s_NCT-skA@mail.gmail.com>
 <CALNs47uCJsTsPVPcL5-iYvzCgrJhPnEXgQ5Di-SEh5WD9vF1qQ@mail.gmail.com> <20231012.085715.1926246245884454683.fujita.tomonori@gmail.com>
In-Reply-To: <20231012.085715.1926246245884454683.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 11 Oct 2023 23:09:03 -0400
Message-ID: <CALNs47s_wjytz3sw6uXA-27NnZkN1z+WYztfQ2Hnw0qVqEWwDw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Cc: miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com, 
	rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Oct 11, 2023 at 7:57=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> On Tue, 10 Oct 2023 19:12:43 -0400
> Trevor Gross <tmgross@umich.edu> wrote:
>
> > On Tue, Oct 10, 2023 at 6:54=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> >>
> >> On Wed, Oct 11, 2023 at 12:50=E2=80=AFAM Trevor Gross <tmgross@umich.e=
du> wrote:
> >> >
> >> > I agree, but there needs to be a way to use a driver more than once
> >> > with different IDs. See
> >> > https://lore.kernel.org/rust-for-linux/CALNs47vyW+A5uwCQ-ug03373xj+Q=
Mehx=3D1pXZ8ViS2jZ8KhfxQ@mail.gmail.com/
> >> > and the followup, maybe you have a better suggestion
> >>
> >> Does it make sense to generate one of those based on the other, unless
> >> both are provided, for instance?
> >
> > That is what I was aiming for with my example `{ phy: PhyAX88772A, id:
> > some_other_device_id }`, it seems to make sense that we default
> > somehow.
> >
> > Or, did you mean something specific like storing >1 device ID in the
> > `Driver` trait? Changing from:
> >
> >     trait Driver{
> >         const PHY_DEVICE_ID: DeviceId =3D DeviceId::new_with_custom_mas=
k(0, 0);
> >     }
> >
> > To:
> >
> >     trait Driver{
> >         const PHY_DEVICE_IDS: &'static [DeviceId] =3D
> >             &[DeviceId::new_with_custom_mask(0, 0)];
> >     }
> >
> > Maybe that would be better because the information is all in one place
> > and the macro doesn't need to gain any more syntax
>
> 3. multiple phy drivers has one id in device_table.
>
> How these approach can handle the case?
>
> Also note that there is a driver doesn't define PHY_ID, uses
> match_phy_device() instead.

In this case you would just need to put the same `DeviceId` in the
array for both drivers, perhaps as a const. I think this proposal
would look roughly like this:
https://play.rust-lang.org/?version=3Dstable&mode=3Ddebug&edition=3D2021&gi=
st=3Dc391891fd49db196c0f3b71fca68ce45

But I am curious what Miguel had in mind. @Alice Ryhl mentioned at the
meeting that there may be some better patterns for this sort of thing
as well.

Context for the new reviewers: our macro gets a list of `impl Driver`s
and needs to create a static array based on drivers' `DeviceId`s.
Usually each `impl Driver` has exactly one `DeviceId` (currently part
of the `Driver` trait) but sometimes there can be >1, which is the
tricky part. The macro in this patch works around this by requesting
both a list of `Driver`s and a list of `DeviceId`s (e.g. [1]), but it
would be nice to not have to duplicate this. I suggested something
where we can specify in the macro when we need >1 mdio id [2], but it
would be best if we could just store all `DeviceId`s in the trait
somehow (see above).

See [3] and its sibling messages for some more context

[1]: https://lore.kernel.org/rust-for-linux/20231009013912.4048593-4-fujita=
.tomonori@gmail.com/
[2]: https://lore.kernel.org/rust-for-linux/CALNs47vyW+A5uwCQ-ug03373xj+QMe=
hx=3D1pXZ8ViS2jZ8KhfxQ@mail.gmail.com/
[3]: https://lore.kernel.org/rust-for-linux/20231011.080639.531402968625485=
566.fujita.tomonori@gmail.com/
