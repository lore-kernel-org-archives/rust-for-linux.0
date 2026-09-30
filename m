Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3C145041A
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 09:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759540; cv=pass; b=LtTJHGWd5YpaYdXie38D5DWN9Io+R5r3D4mQ2bcGCVt6Yji7XOMWM0CBFRLaosukZ6saSpRc8En05nTS6DHk/s/0mR4fkp5OqieKyazYj0Of6MROIQXc7f8rier3gCzT9QZQpRjWjeLaB3ut4HAaHyNJRuDHaHsEt9a7y/5lTPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759540; c=relaxed/simple;
	bh=7p8DMwyq2mZD7oBNmsoZbD5KB/43vQVkjyvaz1CCGNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXiJN70U4UOmVJ21g8DwVGcZm+XMfHw3AgRZ0EbZRvSh8FQnWT+l0Vkxz2HSz8/5GcIFUuYBpvFsJack8YA6dDK8zUimHw5nvEseBzlbywWjW9XXQ+hqpUxbUDGkM4iCdwk2cGbj/bndmYO74MOY9qUOryaOsztO/27x+W0SUFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okARf0Or; arc=pass smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okARf0Or"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-342c08bf64dso339713eec.2
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 02:12:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790759538; cv=none;
        d=google.com; s=arc-20260327;
        b=ME4GY2iNlgXPhrg3rj5ZVNYOmYlUj+vKunee5H/ooi7i/FMLMVm6+oU+JmxSJsZRTY
         1ahdB4Eo7qleAEuTsl9emPn1KWNiJImiUgpsWux25D3c0Uxa+X7il1Hi8hU9YildcqZm
         g1/5UtaQW9KYLMDkffGziyV5DPrJuyNbcqlclpcvBk7QKABUPyYgjMtQiIIR1YsHF1YX
         MyJiiOULDHscJhyLgNgVCXUzTBMB4i3XyYpn9rO1gcSkW5eNSocQH89Wd83St9yjNSWb
         hg9dPglR/JfyULHSac0Dj0Gam/DIMOXmj6xjLuDxoLlOeAcO3/Rx6rByGl6b0YFy9x/m
         92tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yNQ3x0EFDEytueLl/Xid8kyTJCTBY14KPltDPVK8LHU=;
        fh=ZO4bdJ+T+6zsViQT+3Zu7um+othH6RdOFHo8J2ze8UU=;
        b=A8rsS30PF1MOmjV6TiIDHIWnrcHkZJif46fYnxpYxlU4g4o2HzW2YXz+5ehKykBPKa
         zsQJmAOKypr/gkqtJAz1YcPgIY7AnkuMJEEW3vMBwfY0kdPNiN+dpp3FHiRZretNPm0s
         iqi2DsLZ7vRvWONiX0fbpPNt6uhnmgcM3UMm2T5ede2V/p/P1rO3jEkf5tfM+PIIAzPA
         piLjqkQnuscnpSIM13oSG7Z+lhbM8UUOl1W2NprbR6UNSOO7T+DUkent3BcSmhP49GbP
         hwt8J9Z3gcsNxsRzU5SSh8wlNT51vyoUbEcWENGduZj/6+1rWy931pdCoDw5oYxZfQGi
         2O7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790759538; x=1791364338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNQ3x0EFDEytueLl/Xid8kyTJCTBY14KPltDPVK8LHU=;
        b=okARf0Orz6/j/CfHCSQbV6hQ5p8EKQ7XflY/INaAQ3TccGu/6nrLHLZ+iAQt9M/X6f
         /JMbiqbqznPtQlwyzeDf8vCTTFYpU1TZiE8Xn7cOOPQMmDXXnoNyIaHDqzCAx+m54q3z
         8ykAiXIsJvQsYPO2lR/YtaFgJ2rbeQmOiHgvMxaZnckYwc7pXkJCCJ3SnuvLLwLapzmF
         12Gbc0yrEZrYyMNrEuS2r9NHwfbKtZLcSNhvBNFZEbapVqHu6MFpW6jBmsDzj9N+rOec
         8dVUcAAcjm80D7sxQUIWZYGDw5bfkltZ5gEZMEkyYsNr0l1JJ6lbRcEYvzooJyfL3H1l
         nrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790759538; x=1791364338;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNQ3x0EFDEytueLl/Xid8kyTJCTBY14KPltDPVK8LHU=;
        b=AEpbxldiUcpG0jra5iAZH3F7JJaFHQXdevpN1k9fFpxJVK9dhLD1xmEgR7k1wBIby2
         gA/jnmFLRzOvGSbzscoWalB7SrL+mV313nEXxQdTC3yB2mHM9H3fwQWdO9bVfttW6u8W
         JZ5sbOyEKkXDSnXL1HQtK3ntyf2f8/5mffYf+OundHkBEjfRKPoV6e/TOXFW/26g7Qjj
         Rjetyn7twVpDuUU3oCwb+GUzVdIlUW4TslbYROkUGiFewkI6s0vs33L2ekV5JpRSd9CH
         U0iL0XRWlU72pJs7urRe3X6JvVWSUFEMKePGRLg6CTfLGQWcJ94tv/C+iXvtwoEIkPEH
         +Ffg==
X-Forwarded-Encrypted: i=1; AKwUvBx9UjNUPR9atBRPyZ5rd+rrBXbTKAvg7cTlMRRaPosUQQa85AYxN0w1y31SeJfH+r2J2v3FJSMqPNS+ar8cLg==@vger.kernel.org
X-Gm-Message-State: AFq9FYI01bS88gfSmnrxFtPZE2caTB/MQfICWbCUTk3GAgBSMrxI/zIT
	F8p+jp7dwPcc+cjZJCB0j9jGsTaAC2V2Nao4Kv0AhmZD3lv0WCj6/KHZOJ2w63GfkstD4+lKpTm
	FqXl1KC2SB/0uy/Nb1xYUDV7McnK/NKE=
X-Gm-Gg: AYBFou2k1BkTIfl0Iowth9gh0HmMNcuEWgp8i7b5rmcCq74JNH/NdAcxJxCY0bOw+Sl
	I3Rmt3Ty9T6cUVrYvT0wvP7EzQoxhDqWnIqzF4SiK3OBC0QP66Lds5ovtfmhQD/HkSJUVHkwW/V
	cANxrBgH3uZDelAZ4l3Qc3tweAfp2BsNzP12F7UzOO8iuL6NH2k612xptW4QrmVZTSSAJ2kmKN1
	iwA9USi/MUyRmdBKes+rKZY+QE9VN9MB+W1+CiS2ywGNZQerIlEsqEV02BZNWl9Notj3wVFVnT/
	GzhF46O16d1/88P7MKseg3LUNFirkItPdFlpOSvQ3JLg1bXKvrucNvPWXdV/qZ92Jz1gtj/02w9
	X11Biy8oEqNRZ5HoajZCKr1Zp2flt2IAd1hkxQp7TvpVZaGa2YUc3AdNGH7jd2qowKZqop4sS/5
	yR7c74bcZuugxXrfAfHhIgQcwY2reNdwcteW4rPN2wbUxOij7FtI0=
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr2001616eec.1.1790759538076; Wed, 30 Sep 2026
 02:12:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <20260930-chid-v9-4-0d6cca376cff@nvidia.com>
In-Reply-To: <20260930-chid-v9-4-0d6cca376cff@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 11:12:05 +0200
X-Gm-Features: AclHuK9QlKMhXKITkkBnbYFPptADooLzR8_3Lk9f3AVt-2WcqKF5YbgcQH-UReU
Message-ID: <CANiq72nuhGkeDFwyWG91xJTAV_uio5PM_PoYvXLCWF7ebKBLeQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] rust: sizes: implement SizeConstants for Alignment
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:44=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Currently, constructing an alignment is quite verbose [1]:
>
>     Alignment::new::<8>()
>
> It's unfortunate because it disincentivizes using it at interface
> boundaries. Implement `SizeConstants` for `Alignment` so we can write
> e.g. `Alignment::SZ_8` instead.

I don't find the former disincentivizing -- it is how I would expect
to have to write such a call in general. We do have the other size
constants already, and `SZ_` is well-known, so the short form is fine
too here, but I just wanted to mention that I don't think we should be
scared of seeing colons and angle brackets. :)

If this ends up going through bitmap or DRM or similar this cycle:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I can pick this one up this cycle.

Thanks!

Cheers,
Miguel
