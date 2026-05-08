Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE16285CAE
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 23:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281353; cv=pass; b=J215XGwX9qUUqkG3L16YHl8NyBKOTOJSHb/lSLAU+a9Dm24iShGsXpvM2FmQeUfDwE2kQfX7z1QyhiT0wiYSshQMWp5efoIoDOKEoz3Z2v+sojO80LUMRJlgnFwWgt9NrHbBsSWAFHpuu2FDk8TY4e/r76mI7wfaF+C4fiKPFvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281353; c=relaxed/simple;
	bh=4nUhnOhk+d2RGyeRYsaBebC0iDvCIPLCr6p5a9IkJac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aC8z5F58hMK95Ukfs9RgW1PAsJujNcn46zM9C/LBAJOp4Xsmj59onImHE6EYc61a2iTwE7OdhgZY2A1llcidCtC8cLM+jt3yQylY2qAjq/ge2x1IlD56zbvvqYhCIXPMk4jVpbi6bvS/bl2eGBztHnXntKr5oCwpg3BpQku1Vc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gecmmQiS; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gecmmQiS"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6949831a7bcso1378148eaf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 08 May 2026 16:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778281351; cv=none;
        d=google.com; s=arc-20240605;
        b=E2017SnreKChxoUb4GnzB3GHFo5+9OHV1EaeRD4YUq2nOPhMoU03vCJtRKaLppeQ2L
         xcTcLC7fmJ0Tg4zXp7000NSlMLMRnOxQS7/E0YExngMashMgIh5DWla+81i0NIlHUREL
         8hmfzzKr9uAmqLkBs5+ktkZZWn8dxORBAvxQxEWI1zApM8OID+H09g65/nqvI+o5pzei
         TBEBttekx1TF6wG1f5mRmHsQDG62fpMmTEaxOW+lJv6P7RbjJXioj8zYQohyp6nHLGki
         L0gXjCEWyZ4j2blbpDsGkqPcVUGR79zyg+C8V14oSICtE1ySFWW2tSSnSlyzsB9o3KPB
         D84Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ATerCY+QonXWvqCdlQaynR9gpKqqkwZNoiCxVl0DE88=;
        fh=WFrVS9mKbMoIe3BLi5GbFIE8Vevks7VENjO84k1fP+c=;
        b=JFnsojIRs4p0J2CcF6AMfoIEvJsPJI3a10+5lm5r3lPicjy/s8SvxqtPTFXgU2R/ff
         YV1jFmCPM7GgIa5FPIdSh8n5zG+FE5ZbKeVVvvGyg3dpFz9ml1X8f4KmXcu05jhB8poM
         rkw0ruvKGKWgpxKGixIf0bYaTB8P7+UfyK/uSDUGdUWvRRiGXnXViTRCsVH3JxVkWOWf
         e6bMnqk2aUbCNdtEwgTuhY83sVGF0phHcYCYcalNWxaZ7qGpb7SKZB8hLtP//eWG7G8q
         yEr3512hMPwUzP1Kpv5d5LA9v7j9c56GmgdLVO3BkkHlRqG513i+I8eKgjLLHQSyMGyE
         TEJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778281351; x=1778886151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATerCY+QonXWvqCdlQaynR9gpKqqkwZNoiCxVl0DE88=;
        b=gecmmQiSpE8YhsIcz1ZQapYTNBzjxBOpWtSSoGNogdG+mL8lCMgtGOXkaM6vJ0+WhK
         zw5sE/RsevbdNl/JDN0IKJYWk0cTqyhDFEIWVmOz0XT4X288QPmqEJWWKviCmYb3/Pr7
         q2PdfHfdCDu17Cy6gcEpAgjeC1abKpCzvSpKO+1v/Y+lE/SB6cOFApLqyQrL1RKUruV3
         D1jdZE9WQsHjGmCZm8j3q7lZTaDdSGBWK6Am/HH2UGYYBiRdduIAZi/eVWewgN6dWKED
         h8ZSWHL43ZgNO1TEk+6VW73JOlEHSNc2EEbpIPHyik7H7LcnuIWk9U4AX9zNLqjXeKYC
         /PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778281351; x=1778886151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ATerCY+QonXWvqCdlQaynR9gpKqqkwZNoiCxVl0DE88=;
        b=oCxXo24bvlFqfMjTTL3maqJOdXaSGFyAPeTLQphvRx6Jlgq3NN1fgejb8fGTWjew9L
         gAC8nHS0Hym+AmiinK/84vI7otEJECdnXa3ZL3iACPSLfxruCqjLO01px7jiXhnYcIJw
         62xrFcPuMab+JRUy38uDLD+bLvLNBcFMFTFJYKmi7WumPONKRJDCLNGViMN2FYNPi1p9
         bwA+eHt7AYsSu/Xya6HtnLyi29o92nyQXSkXoF8BjP1NFTmxCP7qqFlj+FunvzGuzMpp
         17SId6jlJOVMLLVVFFwowRee7CLIg/GqgvJMDniuEBiQACRv/ixjOVt3ImxPt9zEJAnC
         VslQ==
X-Forwarded-Encrypted: i=1; AFNElJ9gBvqX9fE7YUexop/w9XJUdIjQV8l1Xx+1G04j/I7d6aOUVac/WwcKkgwYpyApvozLNrromZvIjAz67Ec9CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUbbpiJ/aXd3A3f5R+sTLbgswJz2Us65bLZAiqqKODmXL3uxu
	d2hceVOgSj3yFvfIVG3mrd5MBq4DkRXWC52C7zcaxL+MIacstQsTqeU2AL9/dtUIANIatyZ9eQx
	BUJvV3J1nQHBR/bltIzuRSi8IXAAnZhY=
X-Gm-Gg: AeBDiesNO1aVIY2Zxz12oItlkRh0uKUgm54xL0LHd+3qinhTvMPPdnXL+NWJgrYU7D2
	62PMocEAFF3LQidqs9YjouoA0ocibkpIpAiflEV/nWty8TlQPyfwwcWDsNrUjdd3Qhr3S1ZQ/QG
	ugFviRD5Z3O7ZOTsQrLsC4KZDh+5+GyxwCTCGntWluLagkQdghC/gGySlL9Xu1YZX8mBnN1TVnN
	UFO8hPmClDtTJs3lpCPgbQi9GqVVtejJlIFzP+Z3x8bI/wgz5eGBOhV6+Ye7do9/aDahKkM+vW1
	lf/6pAg=
X-Received: by 2002:a05:6820:2016:b0:67d:ea53:b9c8 with SMTP id
 006d021491bc7-69b25b76649mr2543437eaf.18.1778281351129; Fri, 08 May 2026
 16:02:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-ra-fix-primitive-v7-0-cb8e3791f2b5@gmail.com>
 <20260507-ra-fix-primitive-v7-2-cb8e3791f2b5@gmail.com> <CAJ-ks9=KQc5Gxit5eGOcceFqx8x3dXU4tHSihpxF5xi5Lm=C4Q@mail.gmail.com>
In-Reply-To: <CAJ-ks9=KQc5Gxit5eGOcceFqx8x3dXU4tHSihpxF5xi5Lm=C4Q@mail.gmail.com>
From: Jesung Yang <y.j3ms.n@gmail.com>
Date: Sat, 9 May 2026 08:02:19 +0900
X-Gm-Features: AVHnY4I4DWYNBJCRzyaTsp4yaXHctTXVW7IXoRj2XRPA51YOOXHbZ9EZ0eSBlLg
Message-ID: <CA+tqQ4KSraOw5phERRV1Z90_GEYLmEW21U0qhpfzUVF5HGGDSw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] scripts: generate_rust_analyzer.py: fix IDE
 support for primitive types
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 1:20=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
> On Thu, May 7, 2026 at 10:47=E2=80=AFAM Jesung Yang via B4 Relay
> <devnull+y.j3ms.n.gmail.com@kernel.org> wrote:
> >
> > @@ -415,6 +451,21 @@ class RaVersionInfo(enum.Enum):
> >          date(2024, 12, 23),
> >          (0, 3, 2228),
> >          (1, 85, 0),
> > +        RaVersionCtx(
> > +            use_crate_attrs=3DFalse,
> > +            manual_sysroot_crates=3DTrue,
> > +        ),
> > +    )
> > +    # v0.3.2727, released on 2025-12-22;
> > +    # v0.3.2743 is shipped with the rustup 1.94.0 toolchain.
> > +    SUPPROTS_CRATE_ATTRS =3D (
>
> Typo here. I can fix that on apply.

Thanks. I should refine my workflow so I don't repeat these trivial
mistakes ^_^;

Best regards,
Jesung
