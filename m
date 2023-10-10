Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4388B315A0
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 22:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="noAYJ4jZ"
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E49818A
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 15:50:13 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5a7af52ee31so23714017b3.2
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Oct 2023 15:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696978212; x=1697583012; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q+xoU2zjiI28Cn8KCmgswA380pCSkc7tiC1SRss/wo=;
        b=noAYJ4jZxPFLd29cajRsRZVOfVpJ+4UaeFI4hU2cJQv0E4BnBFAJJj3VfQ6XUcq/Wc
         SHg7Gxl9wEOahpofovbfzl/ub6HKGekTAPDupERmNYhlWLii8lsLYYIQnC17+5ZUIjCV
         NOVkF9q6ff7gDSs16cKX+ajkn1xx1Ncb76H7mJ5JGtU+bVlsPdmk4x5q5FkCj1O6icCV
         f5dGR0XMymPzY3P/VI6Ev4ukjm69Z7PgM5tjES4B6/Nc7MT3am/PW+CY6Nvth9MdUxnq
         zdFwnDafcfo11dNiyKp+BAeVsdmRh7fDVGE4j/rr27kAlw5ynMmG3bs1+EyL47Xg08RR
         PQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978212; x=1697583012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7q+xoU2zjiI28Cn8KCmgswA380pCSkc7tiC1SRss/wo=;
        b=OtlPY5PSgGlFEReCJuMuH70pQQaeG0pyuVL5DJwkKsDZfM/E7ByHq8mR083b0W4UsZ
         GGrqMXK1dRlg2Pu15qibvXXaM5HHwRKTAIOGcwvynnNLTXCy8M/VjY+3AccNLHwXzA+I
         KzWnmi/uR+aGomXVkYdJb9KLOpIttGg3tGEN6VKFky5KVDU7+O9t74zxW13I+ozogsef
         0YDHY24OFjl13EubFe0trpYDtStxZDJlWWbjSxitLm2RAGOUqSXJ6myI6KyN7wdV7uka
         xLIHAC/Yva+elZ+TupcmH5EDlDPDxxUVd/7K2lntrXBKUL8IXjuqiCstQEWBBCcaloR5
         xh9w==
X-Gm-Message-State: AOJu0YwQddpcd030l7gXx6sJHpjnerAaYGXLMmHAmbhr3r7qxIh6emvK
	NeU7sMRxApCXpXA9+YkRdPRV/7yVy7dJERZyZoXMBQ==
X-Google-Smtp-Source: AGHT+IF8Vl3ERd2DqroBIZvASPlByNMgK2LNynBIwDzZzhjw5DO/su+BRqyj3LDX3dUggQ1uJ86U0YE6zw5WPINCUKM=
X-Received: by 2002:a25:7494:0:b0:d9a:4691:405c with SMTP id
 p142-20020a257494000000b00d9a4691405cmr3994341ybc.31.1696978212266; Tue, 10
 Oct 2023 15:50:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230928225518.2197768-1-fujita.tomonori@gmail.com>
 <20230928225518.2197768-2-fujita.tomonori@gmail.com> <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
In-Reply-To: <CANeycqoBEWBJfvmto4uCNpnTHa8U4Y8D8_tHOtvxZrNgL-Ro_g@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 10 Oct 2023 18:50:01 -0400
Message-ID: <CALNs47svn98i7O5Gfm6nXo_N0VFod+1LVj0oe2j_q46yGAiZHw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY drivers
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org, 
	andrew@lunn.ch, miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Linking in some context, discussion is somewhat fragmented across this
patch series. This is an old set anyway, the latest is at
https://lore.kernel.org/rust-for-linux/ZSQXqX2%2Flhf5ICZP@gpd/T/#t -
but I don't think anything reviewed has changed.

On Tue, Oct 10, 2023 at 3:19=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
> > +    /// Returns true if the link is up.
> > +    pub fn get_link(&mut self) -> bool {
> > +        const LINK_IS_UP: u32 =3D 1;
>
> Where is this coming from?
>
> > +        let phydev =3D self.0.get();
> > +        // SAFETY: `phydev` is pointing to a valid object by the type =
invariant of `Self`.
> > +        unsafe { (*phydev).link() =3D=3D LINK_IS_UP }
>
> Wouldn't it be more future-proof to do (*phydev).link() !=3D 0? That's
> what the C side does.

I suggested it as more clear hint about the magic value, logic could
potentially be flipped though

https://lore.kernel.org/rust-for-linux/CALNs47vyW+A5uwCQ-ug03373xj+QMehx=3D=
1pXZ8ViS2jZ8KhfxQ@mail.gmail.com/

> > +    /// Sets the speed of the PHY.
> > +    pub fn set_speed(&mut self, speed: u32) {
> > +        let phydev =3D self.0.get();
> > +        // SAFETY: `phydev` is pointing to a valid object by the type =
invariant of `Self`.
> > +        unsafe { (*phydev).speed =3D speed as i32 };
> > +    }
>
> Should we perhaps saturate `speed` to `i32::MAX` so that it doesn't
> become negative?

https://lore.kernel.org/rust-for-linux/96800001-5d19-4b48-b43e-0cfbeccb48c1=
@lunn.ch/

I agree that saturating probably isn't a bad idea here, but the C side
does validate it

> > +/// ```ignore
> > +///
> > +/// use kernel::net::phy::{self, DeviceId, Driver};
> > +/// use kernel::prelude::*;
> > +///
> > +/// kernel::module_phy_driver! {
> > +///     drivers: [PhyAX88772A, PhyAX88772C, PhyAX88796B],
> > +///     device_table: [
> > +///         DeviceId::new_with_driver::<PhyAX88772A>(),
> > +///         DeviceId::new_with_driver::<PhyAX88772C>(),
> > +///         DeviceId::new_with_driver::<PhyAX88796B>()
> > +///     ],
>
> I don't like the fact that we need to repeat names in `driver` and
> `device_table`. A single list should suffice, no?

I agree, but there needs to be a way to use a driver more than once
with different IDs. See
https://lore.kernel.org/rust-for-linux/CALNs47vyW+A5uwCQ-ug03373xj+QMehx=3D=
1pXZ8ViS2jZ8KhfxQ@mail.gmail.com/
and the followup, maybe you have a better suggestion
