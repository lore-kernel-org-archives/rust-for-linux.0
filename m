Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3650817E472
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Sep 2024 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847147; cv=none; b=FnNItA7mgm4bYtQHaWd2y9GoSW3vXp8rpEF7ToARRJ3JFHbVPHTTmkb1mS/gvNPlpDtTiZxBA20xQ32Ym7gL5giqT+1dYSUABz/pkgPqg31upfwtd4dYPPKtqd2FrIxZy1tb8hUQbFYer72qrFAL9dvkU2mWhFAMdQQmyGTjkoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847147; c=relaxed/simple;
	bh=1J1hqLm9xA+OQQZDj0jnEio4g2PcMhOq1NOUGddQ79g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CA/FKaXMfSuLV6Cmbp+TGMLfOwH8cOXzDuqK3VPxsDxbXixTB9n6ZdQPXAmpZe/PDoXIKzvRpCe3754MgvuMpFEN7RjfXMA3niYpup6CNsQ0kla7MJXaVU7bdiLgJ8Pv8RR+8YKmllqXVlTU2qSZU9E+l32wBCq1pePqHenbOyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=ChTG6X4Z; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="ChTG6X4Z"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6dbb24ee34dso19229557b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Sep 2024 08:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1726847144; x=1727451944; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ze9k/H9h8tpqWFV2vebOD7wrjLmr2B/OxxtbbLC4Qc0=;
        b=ChTG6X4ZIN24X6pHzVlQQtzjl93AymOCODFyYEVXYY13nMbJ0rtKcvRWlmGb5jj24/
         z1okd55Kd5425Sw0GaWNsinu9bEU9CyKyyOskXr2CDP5KPfE1J50PI3Owd2pmi56aCTE
         4g6LYIDvYMEV0fuJSFAqYpJPO0pEwUYPuI9/Ype73bMGOx3XCMujpfweWxMxxVGnHUyp
         5cXBFsn5WuA0L1Y9lAo858b0xndDSh460HJrFCcYGt6sfXwvAKTcjHI2sWPUlCmmMmGf
         0cQYmkaVRA37SSAgA9XmlOAkijk5MWSduVCTpmCjAS7MI7jBq6ugYrJ1dFrT5RdUj2nk
         Vj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726847144; x=1727451944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ze9k/H9h8tpqWFV2vebOD7wrjLmr2B/OxxtbbLC4Qc0=;
        b=H7SDNJCnLxHUZrQZ29gKbRSE+1omMfmrpa9Lnt2w2JjFMkHRA+GrGKS0C4wXeJSO06
         VdJGjlje+h5qjkrOBq601/KFs+pJ+uaMqCGELF/0Fob4GZ0ehlS1CSW0wIx3n5sWi6d+
         DcWCWbdM3MFIeWNrI1cna2LCyw1/TCtN7g1igvo87GnkBp+60ckvNSCE+LruC6+XKvkE
         WbDANfhBH54uS4+g67LBTvKgZfyqihByDZ1UdwOUQN6oaFC9JzjhGSEdsVOfbHVYfC/S
         FmPeZpCHhFY7rMlR2q36Q0ZuMhgtdC2mfGDG0ES0iDQ9+cDI+8rE2/wSYCaFtoj02PEP
         XWpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzlVPR5goFmHhF/2iGkx05XJnn28f3WYT8cQUUs/9Z8EVMG2F5yE79Jc5D2CqqQ84nRdxF8tlUVFGDPVpfUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSwwGS8fpK5TBubcvpOWJYtoUIVquwUPYwb76le0QsI9xtKx0o
	3FJWu/oBeX47hMcRFr+9LVR6w5sMjv52uIHikFnao5Y8AWwvtl+9QdKQetLfjksUL8j7Bu2tyuN
	VhaQ1RDXmTOG+w2587mObWtJNhZZiF3/NYXMsyA==
X-Google-Smtp-Source: AGHT+IHj2uOTgTw3Vtf0yRDLdSBn1U6D+q4fLLlnQlqc1Yc+uEtLEz4TtmwbE74OhR1TFSWZR9n5x0WZdcCI/rEmFgE=
X-Received: by 2002:a05:690c:47ca:b0:6e0:44a:257c with SMTP id
 00721157ae682-6e0044a2773mr4505677b3.8.1726847144157; Fri, 20 Sep 2024
 08:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240919043707.206400-1-fujita.tomonori@gmail.com>
 <CAH5fLgiJyvSztvCDz8KZ4kF0--a0mqi7M4WowB==CCs2FmVk8A@mail.gmail.com> <20240920.135339.42277957091918023.fujita.tomonori@gmail.com>
In-Reply-To: <20240920.135339.42277957091918023.fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Fri, 20 Sep 2024 17:45:32 +0200
Message-ID: <CALNs47us3fuD_Aa3vtK4F0Bz_RK9qyf5mvPoOccJGv+J4t=QjA@mail.gmail.com>
Subject: Re: [PATCH net] net: phy: qt2025: Fix warning: unused import DeviceId
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, andrew@lunn.ch, lkp@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2024 at 3:54=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Hi,
>
> On Thu, 19 Sep 2024 08:17:42 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > It may be nice to change the macro to always use the expression so
> > that this warning doesn't happen again.
>
> Like the C code does, a valuable is defined only when the driver is
> built as module because the valuable is used to create the information
> for module loading. So the macro adds `#[cfg(MODULE)]` like the
> following:
>
> #[cfg(MODULE)]
> #[no_mangle]
> static __mod_mdio__phydev_device_table: [::kernel::bindings::mdio_device_=
id; 2] =3D [
>     ::kernel::bindings::mdio_device_id {
>         phy_id: 0x00000001,
>         phy_id_mask: 0xffffffff,
>     },
>     ::kernel::bindings::mdio_device_id {
>         phy_id: 0,
>         phy_id_mask: 0,
>     },
> ];
>
> We can remove `#[cfg(MODULE)]` however an unused valuable to added to
> the kernel image when the driver is compiled as built-in. Seems that
> with `#[no_mangle]`, the compiler doesn't give a warning about unused
> valuable though.
>
> Is there a nice way to handle such case?

Maybe just something like the following?

    #[cfg(not(MODULE))]
    const _: [::kernel::bindings::mdio_device_id; 2] =3D [ /* .. */ ];

- Trevor
