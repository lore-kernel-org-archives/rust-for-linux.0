Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6CC32D0CF
	for <rust-for-linux@vger.kernel.org>; Sun,  7 Jun 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780831838; cv=pass; b=gxZo0tpvjx9E3H4Aqd1aWYbG5Im5AK+Ln+wJw2dYDp6xQLB6L7RlUfzz0tojWTa2yPl09aF3V2XZaIFccIvxvTWLDKwhw6u2G4HEZlpg9dIDbfn7vROo1MOUkBdukZ6zb91TreXkyZV0c4yY8Nv4fo8YRdCOOYr+2e4zctNLOF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780831838; c=relaxed/simple;
	bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5OmggISCgMwxt2ovy32m44IbN4GWKrps/ykwKRHS6JAQjn9Ka5rWx/ldaEjKIwKE99xf2ckT+gw2pvMC+M4Gx4an9mNN6erDlD20Y8/CHgt1J5buYeQhAzxiQ30qRaYtDbKytrh1ygPAHG54UNaDQOmGL8Fv9LQDJHekMlMa3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4jAzcDJ; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4jAzcDJ"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30741f821cfso364160eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 07 Jun 2026 04:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780831836; cv=none;
        d=google.com; s=arc-20240605;
        b=JRXXg5vwCK7FcPS2Dn/cnqxzXegRk2RcUIYlhyOl+dML/nEvoD9P7axkjXCPgnAX6f
         M+4e9yrAs/7OE5Ywcb44K9Ef+0S7l7t6NAzMTdMfCp3hc+3bLQ7Q/vV3XMeGz+2JixMT
         mFRGbXR0MRJ5WtehlHP8STLXBds2xGo9oT0EH2ghQ1Zzw+C2LZxhgrmqqpcsBhhMvw1M
         BiOEjbyBCBowtu6v5tCykkde/ELNgIoSmPzbAPlQK+UFUjEZlUvZCH1t2UOO8mF079hY
         paMFpkU0eom1/2kx9EK2WnOZbmRTmjolQufwEkbu1vxi/kYw/kHoP+M/dXRHQe2UFl+b
         QSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        fh=1oZvYjJJFajs4Pko2HKF925ifTbBrV1v+pfL4A51UUQ=;
        b=BCRg9mlqyK08xFwzJ5YbFkg2KQmKMU7YhWsCU1PbEW6AfoQwINdPjcKdPgo+I+kvou
         RNOl0QEAk2vxtzav9lql5HWa5D+FVweG5H155Lxo1fJ3brGlyRLoaOPYw8MnnPYuURnE
         bYQjX2EXKaxfR6DEdN9unjqbIIoj81HylsX8DjcWnlwX9s65Dxp38Bnhqfg12bBEu539
         JDeCYnYRtVyNHlkc80i3TzHzPJXfFCQu1eNVP05JDmO80KPrHt+yjjL3m1L04C0u1gRe
         6IhFm/WLL5RsDEODHT6rwlkHsr4uveR/IzSVZe/mK/6DK4uP1Jo/fqfBPQw086/rSLej
         aHPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780831836; x=1781436636; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        b=j4jAzcDJhPeaPxXuOLnlLRSCO8GEcQ4wJpRFQnifY6tk+3aKHD396CzU1fnNkDXumU
         dqhHmQHdfUO4i3O9A/5Bg8Dls9NnFQFM49l4ttYS2ru2vvoDATahtjGnXtIpXYGYjdwm
         JmeXQh8iKsRoktA5mhfEr03jxk849oZC0khw3plVfxRfU3G1faykqsGEYGNG2TVkGS3K
         UxoNFG3KEUPeiwq9d1eTITy402AAK/V+jAQQ4P6jQCway01rGOwWYdx4gtbIOCPeOerR
         UFSKYr9r+yIwHQ0EumY0v5T8ofKqpYQI2l1TP7xzL8bwd+xr3ANHNw8r0dygp13Karft
         KfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780831836; x=1781436636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MRySgiTWfJabjMicfD7hcpZ6ySYoQUNxJP9qu6eB8rg=;
        b=VkC+noSn6yg8EMUBp2k7EvsCyr9RKRsg68//21GFVWu12MSaOLo0gDvgZfmKeI7w3a
         wdUz6Fc9dE8XRg/skjmV77A0DV5wSmiPv35E/i1Vc/V/3fXlfMq2mLmffpW0ete+T7eA
         WLmg0ekW3bUPZIhXxK9Q55SFjhF5cxOQ/fYJJWXrGbNJnkEbZAQriHSlt6Npy1zZRWoB
         u6NEawvFFAUMCYAxsv4cRqyXJDxibJvyISNAqPxcOboQivz+Rhd4GcabfkIYPR/3XmAU
         h2Z/YwLdWBN803dVzO1BLsXdKP/oNKdNEU39XQQIXI2XYZiKjSNcXZ9qfvgEmqN7iekq
         RBpw==
X-Forwarded-Encrypted: i=1; AFNElJ/nfGHGWOjiRat6UZUvzBJIU4pNR1avWFlAqdfTM2sVLzP5lgteUbHNiV49ALFsEMWzsC1gAqvLiQmTq83DEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw80krWpRqWrL6O9uTqXpV64u+zhlmn9zb9W2K9OUYSnS8NDxTP
	GX37MTmW0bxk6EI/9TYY0wO0K+crLEbqM1hpkA6mKqX0RokUsCkNQCTYtYQl2ec9Sl6PSRdoouK
	u7n/zyLFse7uCttiVlGMAeAS4pa2s93Y=
X-Gm-Gg: Acq92OG/MB9GVQfAylmk6HoVmJBBqzhz+N5vz68jyN0QuJONeO5yR+6wXm6KdmVqEd8
	Gu2X94CpTCWcno23oC6L/fjgX/2S67J1UTxwCR0CoSRKauG55nKuJRpg8trA6Q7SAfOSneOGK5x
	OHzcBu9Q+lhjct7Y6Wx4oTZib6pBO0Appzv+eF4UxctvLjK7ilkS6Q/kU1/Pg8RCKBKZjuJ80xP
	+fdXxK3hCCfOdl6taJeiOGTwRczppabxVf3dyJ3cz2a/PoZB9Js0CJxDUy3ekKBxVTm6gJwIfG8
	g6YNk97D+5zxDe2rI1v8BI+oyyI8NT4GjyQnlRAPaP6tGM2frtMSC07yZZ4f5ReYMYX9UYgg/QN
	PsI4S1P1b2ncqqWXuBukd8Ko7Bgv/geNBMA==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr2921241eec.2.1780831835929; Sun, 07 Jun 2026
 04:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604192740.659240-1-lyude@redhat.com> <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
In-Reply-To: <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Jun 2026 13:30:23 +0200
X-Gm-Features: AVVi8CdeC5gDKTC7duruJvRpgjli4FYxW2S1H8-VJsB3l-jVir5nc-87EthTwdQ
Message-ID: <CANiq72==HqQnNdemJOrDwP6dCzz1KBs977MmgjLbssDstAG-Sg@mail.gmail.com>
Subject: Re: [PATCH v18 0/4] Rust bindings for gem shmem
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 4:08=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> This is fixed by [1]. Maybe we should merge that one patch separately
> and before the rest? I seem to be seeing these long symbol problems more
> often recently.
>
> [1] https://lore.kernel.org/all/20260605-nova-exports-v4-1-e948c287407c@n=
vidia.com/

I can take that one via `rust-next` unless someone shouts -- Ack's apprecia=
ted.

Cheers,
Miguel
