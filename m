Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794572672;
	b=H+MLTA85xGjOiz7ua/v1/UDgykLYWPPleSimM4NjVp6YaY4P9BrnvrHYdjPNmPrl2f8E
	 WCwrgkAMmrOh780kZ3br7On7Ug9jNc67RcQMPvwF0e0smSSIEw4rv/SP9E8VErgG7xeZT
	 Z/ivIyVU4G804+sOqqnKGuWWLimjE5TCRuZoO+nIooVfHkt4VOqQwfVfVI9bNW4TEGGiL
	 O8Ksaiguy8YII2AMVUZKtOwdkh2kp95NCuc1E66UBtNrmyHwBsXyX0X0wHRbYc2c9U416
	 SujzOXi21ZNLZYSjWNTzxnVZxY4ZgpGiVnWHS1S/+rnyt01kZOOh7wOYZFBLpdWqD4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
	b=qBMH9DVzrK86ic8SgvUwBvCbkFmkNT/UNMzNNezsIbo5eCOpp6Kh/d6TGVrhoYy5bfMD
	 9bZA3pq8E6tVi0yj4fplkc3fKYpePer6K96FINJcnE0h9IyrmkhrPcTUHYlOrJlw25Yde
	 6WdLaOi1WKdGB6lBcnoUouElcrRjeS0kNK+/mhAWxEgyBd8G0VrdFoIVHdum8kqFqLtbj
	 nwOEDJD+cFkUz7iQBbYC9QXHc/6Z2v/h9DdDKrZgQqM39jHeMR0tNs7P724yTmQajJ1oW
	 fUQdXKaxInsEJmjIR9vJUzs2orzCBjboyMEdu96revkOzmzPmh2cuB+Z36zoxpkiseQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ElxbnzGO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DEF60A383C
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 12:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11DEF60A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ElxbnzGO
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so994129a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 04:24:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794572671; cv=none;
        d=google.com; s=arc-20260327;
        b=HMOeSCLyKVIPB0+Y6h9hDzXV0TJkUJr5dR3teZVulPR2+e9IVA5Nc+OJSkeXdDljzn
         zHUyz5i6e0Q2x63Kk0XVWL6WE8X0WlH1xOem3XPAJNejvLdx9gG78Ier+OBMFwQIqI0S
         cmoUeG1l5rQT5XpROrIjqx64y26VrU25nD7KzkgGGnFiPqq9jPnnDare8ONdOGnFcp57
         eG7w7xGGEJ4F92juUjNZAoPZFzuOAy3tq7x7vrlGIqhDYuZ0fwD1fVtczsRjNPGoN2c3
         XQNyciNCXDE8ouB5d8ODZXt99Ht05XNL3wnUu/QC4+GfxjFR/rovHbfst3TKenKazai6
         IV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        fh=7pUA/lh604+4SrydHsVv0fM2yKVhLQbYGpVINzqJcww=;
        b=T6jeMLNZtd4ux8cT9d/0LfozWrckRjsy/z4Xvo3ma4afewMS+yfV2TMzwJYCODWHBP
         xxojksWw6Eoz+tWvjw49mwZXZwQWyTIzoltZ1N9cmNoVZIblX0pBK+vdP+9+Qv/gURFN
         9ZI8PwNkgLV/MA72+5J3Z4vddyg0Ubgq11muVb/obDSSl+v+FXZ3D0GiLpkIIrXKop6q
         HESZ7UaqJZYMFWaLEAAcLKdGxVp3tQutV87RrFK2PNSPduB63w9R83AcYb2bF0POfc2s
         rLjECCAdpozxUVIy46y500IXGZ83eBMfiGkzRdixlnpYQEEv8UptRwja1106DIMAMEs1
         NDAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1794572671; x=1795177471; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        b=ElxbnzGOtU2NKf/45LZpX7xm8kXYQeP2jtOeAvXd3OMW40BOKvbtDNsnysfUxalwMF
         waPnHr/TALZINvPWVswP3Ji//vhwoWyVwCWIKMCC/If/I5KXsONr0CJZLB2FmyVMrj+N
         Hw/nhZRHaf0OZLOtkPyRKepw0DCN66HCm/qVrZI2FStIHGeYhyullHi5/Ix0rJezkRpj
         6ebi328c3+wkdpvYSf08rAP6s4ldkRdH7jYJYJe0rJEhD0toAfhtqZhJ9EEzM+QtOW5o
         2IKe60eQWf2TkVfdRdmKu7ZZYghHQ+hrdOtkhyVoBfLEPiCyJTR2tnUfoJQF3c4GaQ0s
         9Qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572671; x=1795177471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dDT+wka3iDhLnyTTI61/KdTvaTRDfkuzBYOliEPIK7Y=;
        b=CrsX+z/SMHlWFdZ0Aj+Dd8YWsfUHfEsWN4eijhQz5/7UalztcX55w5K1CfnaM5+DeM
         eSFMkwxLOKUBRTSgU0YeGnz2HoxpHqTjJyrWBJNMyDGHBiPzbm2M/yCMJ3DMR0fPfGgr
         2YBX9bPDep3LqmTsdv3Y1+1yilFj32KuWQXis1KsG6H8RS8OVEoJ8vO/4geHg+FXNEpi
         Q78LyeICoXtAc39xFiKnEar7+ntHZEV0puajK/AWU5DzZBmF4aDV1oHm5Skcos54W9bY
         8ZIuOZyLSllo/DyZhjWjGfFRWiU9rdYZ4ldnrRQ3SaI8UC87dMK2Tw9mx8uYAZcCcRVP
         idnQ==
X-Forwarded-Encrypted: i=1; AL+hErHis+lb6iHAEKBFhRDV8AK++ag8zDoSgLCh31n0aCbH4XsAgyOuaoKMg0rVQSD0vuo2oLjQDBPPJhwql6hqBw==@vger.kernel.org
X-Gm-Message-State: APuU4Z84SZLYnZuFEft2A5l3LGhlNbTlV+50/fkw/duE7r2yr9xr1b0z
	sfmrbfzTWggCmF6fQ8jTd+8hUGbTlrdTyKbd7keqgQiVYW+23bV6WQVinKhsbhZk8SfufR4KdIn
	GSY6l9WV9BLtZB/wWDMBgtk3Qx/RQANAa29STGmSQ4A==
X-Gm-Gg: AYBFou1jPXOlAPSsLXqL8baqYrOfHIoUFfb4UHVkGuAGvDosDqZBaTP0NTuSAmtK8m0
	0sUdcRl9M7FnV63i2JnSJxTC2/9RSl+yrOI2zRbrsnQTpCWl5ngZVGPd1uUg2+YrJvVBByLZm+a
	Pmd53g090ZEzN8CPneQUCCX/n5QWzZMEWSlL1SD3RcHUHyAupjAH2NkJwPI9rpTZ3jlpssUmxV4
	vYfclhS2nsGyRntgU2JAl4JSfPfIbXMssfa3rl8vH2qGEx2oHRUyBMoxvbrIz5z7QcFrM0dMkHa
	rW3mE0F7SXP0depN9PX7nL2wbvacaRzZwA9XPpGmTKZHcwZ49rIhRD/ClIa4ylX36pZDwugriep
	qaBPnUvoluANLG7YPdooURNa1ndC0eFoVm/f8BWIfAW5VCmwOuVeL/IuERe0NiL9WGlELWTKA5w
	D9ZE5sxJmXmb25NrWW
X-Received: by 2002:a05:7022:f4c:b0:1b2:6cba:7f48 with SMTP id
 a92af1059eb24-1b50315622fmr2098905c88.31.1794572671002; Fri, 13 Nov 2026
 04:24:31 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
 <20261109120902.125242-3-cunyuan.liu@cixtech.com> <avLsAlL048MtIX4x@e142607> <avRm82TLBe6I6LAD@cix>
In-Reply-To: <avRm82TLBe6I6LAD@cix>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 13 Nov 2026 12:24:18 +0000
X-Gm-Features: AclHuK-6TzVh3nCVDRnwGMEM8YGOPOqHwZQu1e6cxT9cH1x835RSR9V7MLMVi7Y
Message-ID: <CAPj87rOi0+T7E7Kge4z-8L9FuCSTt6dCqT+9+YtF3wDkd4vRVg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/panthor: Add initial support for CIX Sky1
To: Cunyuan Liu <cunyuan.liu@cixtech.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, boris.brezillon@collabora.com, 
	steven.price@arm.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gary.yang@cixtech.com, fugang.duan@cixtech.com, 
	daniel.almeida@collabora.com, aliceryhl@google.com, p.zabel@pengutronix.de, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
	robin.wang@cixtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Cunyuan,

On Wed, 11 Nov 2026 at 13:16, Cunyuan Liu <cunyuan.liu@cixtech.com> wrote:
> On 2026-11-10 10:03:46 +0000, Liviu Dudau wrote:
> > > +static const struct panthor_sysc_config sysc_config_cix_sky1 = {
> > > +     /* Sky1 needs these SYSC_ALLOC policies for correct display of GPU output. */
> > > +     .alloc = {
> > > +             0x00230000, 0x00000023, 0x00000000, 0x00000000,
> > > +             0x00523222, 0x00523200, 0x00000022, 0x00000032,
> > > +     },
> > > +};
> >
> > These should not be in the driver but in the device tree bindings. If you extract
> > the system cache code into a separate patch we can have a proper discussion there.
>
> I will move the eight SYSC_ALLOC values into a DT property, such as
> arm,sysc-alloc, and submit the system-cache support as a separate patch.

Whilst doing this, please break the properties out. At the moment,
it's written as 32-bit groups of 4 source+RW pairs. I would much
prefer to have groups of [<sourceR, sourceW>, <sourceR, sourceW>, ...]
than just the raw register values to be dumped into SYSC_ALLOC*.

FWIW, I agree with everything else Liviu said. I don't have a strong
opinion on skipping out devfreq if OPPs are not present vs. exposing a
single fixed OPP from the clock provider, but the former does seem
better for me.

Cheers,
Daniel
