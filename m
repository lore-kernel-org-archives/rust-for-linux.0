Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691424401
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 08:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="m+NGVVtB"
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B0FBD8
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Oct 2023 01:55:05 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a4c073cc06so39006947b3.1
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Oct 2023 01:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1696755304; x=1697360104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sozqiFhfaDdFNsWnFecr44dbKU0rGCrTDUgnGUt9NbU=;
        b=m+NGVVtBHjkYxy6aGQPLMPEucCXJdMXSyVkmnNZDZyNN2AWTJ+W7FqsHjBm/AGelqc
         CI+CzryRIQc/2KXwn99/Dk6P2pqvCbm48CN6DnR+JTmpXM61DEGhLmFoCHc9DAiWAO0f
         LurwS5+I84t9U7Hi6taUnSFf+4SdBTS/ES8NN9BXh7G7Y8AXtKLNRIYEJtbgaOJ9lMPV
         OJ4myF3aNhVTn0eI15Cp3H6EThi0vRPp8K0uP7mmk40XehFI1TPVBxPvn8zXR5uO8ZL2
         aLl/GSyCdLKg4KbjT/2Gah7ThIaHfOFawXzE+mwOceYPRdgQpFpJTOTJzhtQscRl0Wae
         kjHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696755304; x=1697360104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sozqiFhfaDdFNsWnFecr44dbKU0rGCrTDUgnGUt9NbU=;
        b=a+YtumSyvTbRhXHg2A57h4LLS+4iDEWZyrv6+9EG38iiuujBeRvcrH8Q6PRs+XZAtK
         7WnOyrbPzeiidHnanEAX9W0Q7eioiZjPaIfPk0WVW/hDTB/A6sROLkXq4hmy6bSP3JmL
         Vxs6e/zjcMs+VZQYTtgOAdn/obmMn93wtWiXgf+kcUa3wuM/0VtVAMwMTfdOE1qVqYqj
         TMAQjR9uWvHJRmX4xxhci3FRMK5jE21C64bxGtB2PZsyYcCzIR6PlCk1u08xI3mW2gjk
         ExLvzOIIFDGpib7NEnqtgQHaY7WHKgvFakLpnDpAAVHSHFjICommiH6F3p7/r1//oW/3
         UUHw==
X-Gm-Message-State: AOJu0Yx1nKC6Ost/K3LvpmpNZKBNygAE+HbY3f8yGqrDjvq+RblBIzrY
	bagWvwviG3y0RKTZyZnPbiFt7yOEDquxAu2uGQ9q/A==
X-Google-Smtp-Source: AGHT+IEiI4Uc7ilws7pewXKOFOHXrsFlPEdZhIyfTkQSsncmPod3sWk6tYVUHBvPBAkLMC+GIdgCa5YKcThdXYL4knw=
X-Received: by 2002:a81:8402:0:b0:589:e815:8d71 with SMTP id
 u2-20020a818402000000b00589e8158d71mr6602767ywf.11.1696755304577; Sun, 08 Oct
 2023 01:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231007.195857.292080693191739384.fujita.tomonori@gmail.com>
 <20231008.073343.1435734022238977973.fujita.tomonori@gmail.com>
 <CALNs47v3cE-_LiJBTg0_Zkh_cinktHHP3xJ3tL3PAHn5+NBNCA@mail.gmail.com> <20231008.164906.1151622782836568538.fujita.tomonori@gmail.com>
In-Reply-To: <20231008.164906.1151622782836568538.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Sun, 8 Oct 2023 04:54:52 -0400
Message-ID: <CALNs47sh+vAXrZRQR8aK2B_mVoUfiHMzFEF=vxbb-+TbgwGpQw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: core abstractions for network PHY drivers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch, 
	miguel.ojeda.sandonis@gmail.com, greg@kroah.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sun, Oct 8, 2023 at 3:49=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
> I realized that we don't need `name`. The name of struct doesn't
> matter so I use `Module`. I tried to use `name` for the name of
> device_table however the variable name of the table isn't embeded into
> the module binary so it doesn't matter.
>
> FYI, I use paste! but got the following error:
>
> =3D help: message: `"__mod_mdio__\"rust_asix_phy\"_device_table"` is not =
a valid identifier
> =3D note: this error originates in the macro `$crate::module_phy_driver` =
which comes from the expansion of the
>   macro `kernel::module_phy_driver` (in Nightly builds, run with -Z macro=
-backtrace for more info)

Too bad, this seems to be a limitation of our paste macro compared to
the published one. What you have with `Module` seems fine so I think
you don't need it?

I'll submit a patch to fix paste sometime this week, don't wait on it
though of course.
