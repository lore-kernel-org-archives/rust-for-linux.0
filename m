Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A82534751F
	for <rust-for-linux@vger.kernel.org>; Sun,  5 Jul 2026 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783253581; cv=pass; b=RdBkkvyfv0e3daN5dmuhUySakBjxdS0IPZVuKnRKbFpDAxT7IHsIaET4FFGAUERGiuKH3h0TsLENMOHrKbPB2PONiRwoQ6IsJJy6hOyHflpKBWyftNSHzF2rlIR5SXeV4VAslNeA598/+wF1EFXGm74bgxTQWnafsADqgnev5bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783253581; c=relaxed/simple;
	bh=5ISwFpI0UbPRq9FTX8wSAZ5/fVWcYX66lDYusFmfZZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=pYMPBTFSXqRCbMBEgTt/FbD6Ogb1Oncw26xaZAq/2Y9U5OG0Lebrux8jbAV0FH7ZWV3/fF6GiKgvUz4CfnWStlQEG1gmPVToFrVrehgvvEZ1pSQ3eTLxAJML+frFv603QibhpwhCyTIpwZB0ziqXHQpYo+Y+fi03XA5XHaGxxt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EiS8dlOM; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EiS8dlOM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ca7605ce4bso3995675ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 05 Jul 2026 05:13:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783253579; cv=none;
        d=google.com; s=arc-20260327;
        b=Uk6dLjbFkuz+srbvbArXx4eQporGG+vvF8070xyUqHmtbKvNxN0+A5vyo/RZhGh+9D
         QXqF5tNJS6sdj6E0N3KkJY8NsTxtbNxcG27gfJBHNLZx1yQbb7NxE2b/vylzHCoORyEv
         8d1Q+uYDTcL3T7/wRlsTwSCpFh9ucPiDhVk/FM5H2JH/xlB/TSSnuG1120BuqLbKtD07
         2ZMa3QncF/w2meflXHPXsGTLIqwpjK/VQ4a2320uly/JdWLZXyzY51iN3tMtvnzaqg9G
         40YcsxSZkwLmpZuHmc4w1xP2vMg4L5QPUiZJYoYM3jHNQJRJSLACYz9MJgxudcWH4LMg
         lzsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        fh=qEp2f7r6QDetR7LWGHezEYOt9ZdhOoXWIj1hAV78Ho0=;
        b=hYg8gwbS8HHI/U7+ZNESqolrAYB5ckzLS2vRmVI/z4CoLCW5CEVDwrv2JRFc1pYP0c
         znqhE0jP4QXDD3vgUzj8c+18PdHXCwFF0GF2jVCsG9mK8gEFgDJ33UXkF3H8ONSb+t9Q
         mD/pKGvxxND6tOoh+3daZrRgc8bQTJlcgMDtDkktuMQWnfb9e7BenLjaVUYHA2ltDvWZ
         UXcyPVxd6S6SBWYrtlvY/Vh0dHMTYBziKhoEtaz9g3CzEGruZ0B5N7dA4cuz1xwsO4Fw
         XfvSRtvjJUbMA/obaKpuCHccNvUSjlQLGjxJ9ojCEgXId0uT3dULCekRn4xb/hw5iN1g
         7AMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783253579; x=1783858379; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        b=EiS8dlOM4eyK6m1HpW3B/2Lk4Ke8vaKmQ1grSKFAJWT3nDgHQp9PHG6jDFJWFMvvPG
         oCku+2dl+HfLBkdKZgSuHLUA7YZqNbbMrZm2TVKZv4KZ45li1mzTsRsicFKWdCN+v+zi
         IdwL4gSU3xdcrd7mNZoZYzHVr3F5FCVUfsFcww01QxO2XIg11BR+z3vKVvWkHs0gbj5I
         2DZJKv0/WQyEQ8Ha6Xu82TGTSYANNStIKhMU5St9tH4npH0B5hAWmCb/g9/YoriaRJzj
         b431tZuxGVTTDaog+QabLoyvZpxKg8nku7BLjtK1/CPlyoToF4FA0vaITOaO05iHBIt5
         lnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783253579; x=1783858379;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U0wpLikbkQ+TMe9JGtyw25kNkY3ZEdsCI94B3LxA6AA=;
        b=VikQEnTj0GqzrXgISHlPhGLP9oastuOmrm9qdCSnx0CkURJWvNpqbxp635oOA7igrv
         OZQ/BpBytPJEQj44d98Q1LPfNP3kjumbO/tOhC/jnj9Cs1jLPJneMpIQbscUt/1XVWiA
         QuRyrvjlsWUHSonF6oldOGy6aBUNJQcPf5a7W0QGh9tGp/TuBC95H9+0Pwic1I4Ecny4
         FurnAd6Fs5GOYpuqCX36YvMO9FDewo0Xgfi70WGbOr71VSVHf1FmQYOXKchHViou1/Lm
         86deS1z6HIbCd3qu3JqWWNAztXiy8zUim3CXxYPBqm0cmYYhsOOYGEAKjYjDvXBgWmCN
         yqaA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7BbzcHyXhGP/iKZ3QmrJF05miw15obHHM/xKvseJm609y2ETPhXKy2G2+UL4c6wCirMh8f43EfQ4NqKvbLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUIMymaPhLnPDMrW5aMkz9qP7P5F2x0owUcez1IcJAibgPLrjf
	oILoNdOvTUTR8z6ltnT1iIgAPErzdHZVCxJZAZzkSNIGNq7OTPFHRwe1jZvqDvm9JqTxus8zcoM
	jvL/RR9WjE/SATDXp8g1LZXZqWzJneDI=
X-Gm-Gg: AfdE7cnFiBvdc/EXnq2ydsDKznkwdDWg5+FVh1nE/Ws8/dasG/10SIGQnaYVNkrXg8w
	jc3c0wX8FPXD5keREvABWaJrmw5+7LMnG3cYYncA3f+pgJTsc+CRQ92a6d6WSVuVpCZ0LfxBGC5
	dBpx/IrIFwiYHGCrMgHtut52GtRSECWkLvBePeNClFo/OCIpf9JfFj3W3SJAbKgBYZo4PUAp5wP
	SDHLcH0qlyvHyREXy7oDbrL7SCrwxEPUchfy23TKSJcAS9n4B0tjN3zezImcZV2L2HNDh0LnlDD
	H3PXHG7eiJ7+Gpx59cwYhGaCfJvDSmLqx3byaWawELY42oiMtHJjTxh34cLdTMZrjpaDNdHyJKi
	9kJXb0QHuQlBZ
X-Received: by 2002:a17:90b:268f:b0:381:28e0:6248 with SMTP id
 98e67ed59e1d1-382802beaa9mr4128789a91.1.1783253579563; Sun, 05 Jul 2026
 05:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
 <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com> <CANiq72=SQK7pd-fj+4MOb=E6=R-DHCcLcuCvN=us2E5o7Rcy2A@mail.gmail.com>
 <akmtA7EbVBdhRAOq@gurudas.dev>
In-Reply-To: <akmtA7EbVBdhRAOq@gurudas.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 14:12:47 +0200
X-Gm-Features: AVVi8Cfl7DMeNQYuJP9tYThrU-TabLAul_khYoWVx5WCyAQG55ujZm7jKpKar4U
Message-ID: <CANiq72nESZyX95XSKC3zaog=XSQF09bYJmre0mUbtQ42-Ly6tA@mail.gmail.com>
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 3:02=E2=80=AFAM Guru Das Srinagesh <linux@gurudas.de=
v> wrote:
>
> But unfortunately, since `imports_layout` is an unstable option currently=
 [1], it
> cannot be used straightaway.

Yeah, we are trying to get that one stabilized -- upstream `rustfmt`
is aware and working on it. More context at:

  https://github.com/rust-lang/rustfmt/issues/6829
  https://github.com/Rust-for-Linux/linux/issues/398

> However, .rustfmt.toml already has a section of commented-out unstable op=
tions kept
> as a reference for when they stabilize. Would it make sense to add `#impo=
rts_layout =3D
> "Vertical"` there? If so, I can include it in v2.

That may be a bit confusing, because we still need to add the `//`
comments. And if you add them, then `rustfmt` will format properly,
i.e. you don't need the unstable option.

Put another way: the intended workflow is to add the `//` and then to
run `make ... rustfmt`.

I hope that clarifies!

Cheers,
Miguel
