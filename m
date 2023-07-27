Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20E119C
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Jul 2023 00:02:25 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6FEC1B9
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Jul 2023 17:02:23 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso3649545e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Jul 2023 17:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1690416142; x=1691020942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sY3QJeaMISaIKdDxKtJKohJ2GJoWkJJcs9mJ7frhIvA=;
        b=JMeYciZ6extbWy42C5yfWoIXWWCjILjf+vkioU3vFAhPr3DXf5HAt8QftPHoxB9O8e
         rM7uQXiGVx/Tl7WL29bpf3iyd1apIRCrbcfoXONu/DnbRkY9L8QYnxl6eK2oADbVEBmQ
         071Ebtfv3y7ucNEMI8yKpXwMvapTrFBTWmmto1Atz0SWlrzFdueDMJyHzjCFUqu+gYzb
         s+ADi7TBqxb830QY+YhLKTIbTAwv0O3lsy9bG8h2IppqoeQ/2/23RuZO1rplTAfPCKdL
         1kznMyoVGksodV9iTmWhsXZp/8SSXt+Vku0f7/KCkQO46qwONmSCLpav5StP6gxBYelG
         9ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690416142; x=1691020942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sY3QJeaMISaIKdDxKtJKohJ2GJoWkJJcs9mJ7frhIvA=;
        b=REb3WVBQsaXkLHaTcLyTwA7DI7nSyWeoykF0MJ9OT3R3KK/11ZZRRf19Mn1ta34hdq
         rUnVQfne7gkikUmukjh13Zh91qRIrRBQwDPSdHZmIcdF2U5YwAQ2mom+i/rF3ba5Zsnt
         pzl+C+d9gPK0q/bbQMHNGAIm/HPFTmkfbURrlnQEn/stsSCCQZcD1RxpECcOxz+YkHjA
         DweXdbHiEB/d6NSoJ7b61B4xTyunQ0av+Pi5/gBHYxGT+x0QYJ916VNwYzUI0ki7nnni
         m7N3uYRIb8ivrOtSSSe23OtmMQyiG3ozyg/cVgOuuR0PZtbi+UVccPdYg8w/HUngPPhU
         8i0g==
X-Gm-Message-State: ABy/qLZlYaBkgVRgnoMKziSQO2rdxqdKZGQI8fk6WpY7NiX46rAY4jIU
	cgClZechTixY2nbZprmmIRDqk7vfN1zIzLHTdvH0SA==
X-Google-Smtp-Source: APBJJlHXG8MNDeIKShy9xDvHXtfx9gRvwJvCEX2mLcwSYS3qbHbn1nBhhAONPEPTijBgStQmhz/+PlyPRAUGpob8HfU=
X-Received: by 2002:a05:6000:1146:b0:314:2d71:1f7a with SMTP id
 d6-20020a056000114600b003142d711f7amr408985wrx.32.1690416142177; Wed, 26 Jul
 2023 17:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230726164535.230515-1-amiculas@cisco.com> <20230726164535.230515-11-amiculas@cisco.com>
 <CALNs47ss3kV3mTx4ksYTWaHWdRG48=97DTi3OEnPom2nFcYhHw@mail.gmail.com> <CANeycqqTdL9vr=JF+Fij5EY0TW_+_FY1p2qGdvGhYcyH9=9J9w@mail.gmail.com>
In-Reply-To: <CANeycqqTdL9vr=JF+Fij5EY0TW_+_FY1p2qGdvGhYcyH9=9J9w@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 26 Jul 2023 20:02:10 -0400
Message-ID: <CALNs47s=eXJ-=s7WiVSBoqgcKSqkuZemm_Lx_Ts7yoaOp_e13A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/10] rust: puzzlefs: add oci_root_dir and
 image_manifest filesystem parameters
To: Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Ariel Miculas <amiculas@cisco.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	tycho@tycho.pizza, brauner@kernel.org, viro@zeniv.linux.org.uk, 
	ojeda@kernel.org, alex.gaynor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Wed, Jul 26, 2023 at 7:48=E2=80=AFPM Wedson Almeida Filho <wedsonaf@gmai=
l.com> wrote:
>
> On Wed, 26 Jul 2023 at 18:08, Trevor Gross <tmgross@umich.edu> wrote:
> >
> [...]
> > The guard syntax (available since 1.65) can make these kinds of match s=
tatements
> > cleaner:
>
> This is unstable though.
>
> We try to stay away from unstable features unless we really need them,
> which I feel is not the case here.
>

Let/else has been stable since 1.65 and is in pretty heavy use, the
kernel is on 1.68.2 correct? Could you be thinking of let chains
(multiple matches joined with `&&`/`||`)?

>     let Some(oci_root_dir) =3D data.oci_root_dir else {
>         pr_err!("missing oci_root_dir parameter!\n");
>         return Err(ENOTSUPP);
>     }
> [...]
