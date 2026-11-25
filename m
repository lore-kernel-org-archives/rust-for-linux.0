Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795573964;
	b=VpsIpWKrkxeImt7rj4DV1CCjUwPI4viCN5YLcSLsj7y4ZhlpnhCmGgNYWvEMTl/kncbc
	 17gsmWreKrExP8OR/WGrlFfHo94dX5ux8Ny//LDCDsd38PlvrgjBSb+xHLoT0bhRqO0lF
	 1vp+jtOUG+AE9tLNYjKOnKlhTAX9H/oaVddM4vBD3U2uQxlKm1H/C/mww9NxH8ECFrHOy
	 Au1gbl/8GErMhjAtZDyaduhRtdqDzmIu7u+79Tmap2wOxXY047N+2ktOxKKDsKsCDv1JW
	 EgY319KpWB1fl9XFt/AOo8Qixfbby1d2G2ozM+bDzjyqjjSdZDFd5XcP/arWc8k/hpg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
	b=O98cXW4qajYhnjBx1SNsQb0YPzZnGPSXUGcWpudhRvTxWtc9CubIbjiQyCpBXpRQD/c4
	 UA5aFSOWN5l+tn5q63b8wYla7QJuMgdFXucacMXw4dSGOi2ZW/3oERPR0Q3YCYEidEeRY
	 1L87MuRE4EkmrTMMbZiqWtaj+nm6RrDT6CmFrA6m7R3EoAJRyxEC15I+N9iPcPUqr9zf8
	 HxtoaQ5vy1bZzn2N0VNnC7DQWnpdFtFJDENBdyIEAnBL0Tm42GzZeAoOEGLjx3gqFzNDC
	 L70B4kcrP9lnrwWfsTTJNqClDlocPVymKdrcthupdNBp6werxC8pqP+wMvnOcSxrebA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JGnkFeho;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE20606A323
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 02:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CE20606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JGnkFeho
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae85add4ceso36240401fa.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 18:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795573963; cv=none;
        d=google.com; s=arc-20260327;
        b=nwkOHY5CFXWbjIcEMsuKTuGaK0o3S86iHHSjgaMtWP08v1AB41jbBReJWrkWFUUQG5
         NtXA2DkoJYHzTeN5P3+uHZEE7EQ+hgg34uueRMchRWSwdUWFzrbjt3qD6m05KMdpecix
         UM8RjMqrYtOISkuAfbBjzR38EkYDLVBn2a6JUsv+gj+YTtR0dJlJfl0n2bpoDzMw4iqI
         wPJOyiyA1lc0lIL3a9mb8lERgRAq/NfAlu0whAj+zl5ZTkQLzZ3tklM/q+eX9kHHnhdk
         HQ7ibz3ktSKJHiNrfYma+yeipsaASEBfIOoM6BjaHyjnv/cG5DzFFCbS3RjulsQyJqKM
         Wpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
        fh=Nw94RBntJKh/YFfPVeWzDUyKWudZ5hM56XY8KEN4fNE=;
        b=EEGZ1V0PNkpAbfHFqZTXHzaPS8zlNw5yLbJ0krWkzHVhneCWjAdK3cq7lZrOtOkO8I
         AC6dclKdcB0r91j9sIvDjYl63eR8Ti5UKNbL8/WfzZ+fBw/xJAiGc3zKWWfU5FF5gviE
         b4BQTHHZ9jKI8i8AGx0I5hvdkH3wgnpId03Ny0Azy4visjATkQ/CFWOdEJ/5V3OemLk7
         +MJuPWSi3HFQI4RrxVPkS5vvzgNPRuLb9wrUy6T6bZz/TMUZ+W/i7WqRF6s/n/DIigmp
         yEgsq8Z9WxRpB+sRl3gVnPl7l//ljpFTKub9h9TL859NKqH1mQzibvbEgRRIpIGG8hVl
         gI6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573963; x=1796178763; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
        b=JGnkFeho8NHko3O6xmJmlLpcKz9rm42Ze7zDq5eCUuPWhWk2DOetuwlfUCK/zrNhC9
         TySDjoqzKiD+nr+xj8/hVKIYHrk4RyLvfhaO7iuHEFVN2fKNqz2OhzBu9EkSWerrPTuV
         d/eSBJl+nY1/y9CGxu2xM9b7JYmQzUEWNBSSsJnaPL38DxjT0lyd93+RuyPGHSOBpOY8
         ZJXUfkXr61HXdHPJ3FKISio150uY+TrdPChotPmKCcie4Mv65YZIbBqYcyY2WY9z/YWA
         hRd7dXIMSuhXsVYmuTFOpKeFZJaEQSpGwA7sdfNBudqK80lfpDmagKfurFLDqLPdbK8X
         lDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573963; x=1796178763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZON3wd5LTh6DpO3AOL2NcXrQXtyEk2i6wBI9GQETg9A=;
        b=WsS+12+5NyzTGuNJh7jvtbJ1OKl3efsxK070cg3iUHlfLZHUDj8Cope0cvqk1BcT1r
         q0Czhwh/1dN4SSSR5Wlr8sm/Krkaup0j4z57ILRJbAYc0jY4wLHqDSDUKpXnVsXUEJBc
         09MpPYZ3LrepM+8eJgV5mHAoaKGgILd1P8o3Qe7SJ/6YR+f6CqDSQNcFzpkqMCD1O7tT
         qQGt3BEe3Xl67xWrn2wpTmh1bjY+F4kuYablQR2rJHmG5Od4GwES0ktsblZOvMlpX8az
         8EioC5bp3yoK886HhP0UxT9cWlQcN6oxB2q2r0qbp7q8W1bIBdumC7V/tNUqYV/j9PN5
         Wnjw==
X-Forwarded-Encrypted: i=1; AL+hErGsE8e45dxTfdPTCHz0XRwFUjFECk62RHoFEIrxD4/0jFO5ewF1INNEXNgZKrMN/zSePXU4WBM+r1l/Fh5f0Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8AYp5Yf/lt5IlPqJ3XAn1k1WbyQ4DSZ1WYGy2sWV5YWM7+Yivy
	1CxK0AQixnHFsJ5riFPekBCdpAQ3+3ajw0d8dKVKkMHqTr/gEJGxGpQnVCytGDJsLhBAiXcz/9M
	58sl1RN7sSEOcebomB0zP2v2JX/yUq38=
X-Gm-Gg: AZFdTZdc6Ft81KuSn5PFcrOhI/DgmDQ9BPzx/zg78Onwg8GRamBFm967FUJa+Z7Fqjq
	66d+cSQvuS4hhMvyfJP33vvbHT7qtkSPCggGI+FGHUJQr7kmTT/UGmZuXrhlEw1dIukCKx85SkO
	RCY9Gv/JohYYQMtnyH7Eo2xpU3jkPa34bnwT8syt8bVz7DzTd/DsB5rm8DFOlOJdwJ8I+NbGcbp
	/8Aa8KVgKjjy5mM7XHV+z+1VB5O9wA2Pfo0Wg/b7a4pVsflYP9XfJXASZAl9hUPHNBS+LwffChw
	b8KTkDUCCon/Z/TLcItZhcvuF7EuKlo6X4aNotXJrgtgA5Sgri/sYvGnUsAOpo48JMztf6CZaG9
	B655ooqM+uUnhVK3dcaomLJa7J6BemRh59eyW
X-Received: by 2002:a2e:a98b:0:b0:3ad:f236:a652 with SMTP id
 38308e7fff4ca-3ae7fa6ce1cmr44004651fa.25.1795573962416; Tue, 24 Nov 2026
 18:32:42 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
 <20261109155743.83740-3-muchamadcoirulanwar@gmail.com> <947615fd284c416891ac6de5d16cdd00ec5267ab.camel@posteo.de>
In-Reply-To: <947615fd284c416891ac6de5d16cdd00ec5267ab.camel@posteo.de>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 25 Nov 2026 09:32:30 +0700
X-Gm-Features: Aa3M54rr1ufHp2-DDunLUXvNfYN2DvOkdEG5zZTIMyDI3WVeYzjwx6EaEbPlUvU
Message-ID: <CAO26r3QL4R_h4DGWE9CpYE_=6PW5LXo_qy+xKgxZndSUcpbGwQ@mail.gmail.com>
Subject: Re: [RFC PATCH v7 2/4] i2c: rust: implement SMBus access via IoBackend
To: Markus Probst <markus.probst@posteo.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Mark Brown <broonie@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Shuai Liu <847807867@qq.com>, linux-iio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Nov 2026 at 20:34, Markus Probst <markus.probst@posteo.de> wrote:
> Hi,
>
> please add me to CC.
>
> Could you make `I2cClient<device::Bound>` Sync in this patch?
>
> `I2cClient<device::Normal>` already implements Sync. Functions exposed
> only for `I2cClient<device::Bound>` should be thread safe.
>
> I will need this patch (including the change mentioned above) for a
> future driver.

Hi Markus,

I added `Sync` for `I2cClient<device::Bound>`.
Thanks for pointing this out. I'll Cc you on v8.

Thanks,
Coirul

> Thanks
> - Markus Probst
>
