Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975AE2F49FD
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 04:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783571509; cv=pass; b=GAFZsGjy8e9ecp0uHl/uO6hVnxlXscrSJIgAX10Z4RWZ2lDG3Kq0l9MstI70aZxShmS+ODE7HMzZxv7LXKtGbvViLT/RM2nEbM44AYG4l/DHX6WyU3hwwEYEpP03fBzrzrfKy4QJ8vpaKdEkhhshuMPIcBCUrqciCgVr56PlXRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783571509; c=relaxed/simple;
	bh=AvguVC5ElsFKrLiOmDna/dkCPOkM1bTUcTiPIw+P/Lw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UpazE6FnR+hu3B8trTPMyD0CYDNRfJO3W76asj8lhcJpyW+MHVixM8MauBt0B/Uu70t/XxNAJ/ZUGOPGwzKm7qyV7QK1vlFYzD2FEQVkWZGaJ96qolW4wCodfjgi1uNT5xgRT5CyZvG05canory8abpc7Z0TAXJdNotWIOPzCjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rE2phlVW; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rE2phlVW"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81e6f0b4610so1835447b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 21:31:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783571507; cv=none;
        d=google.com; s=arc-20260327;
        b=Tg6maCOPh1SBCSBf9vyuEVjeEsR6W6bRSinFSFGJ7s7uJCz3Ir1H4tlBhPbrZOos2I
         /82XOBG04CQvFV3oGeFx1TRpv1Muw+QeWTt+SyaWzjnTReZFqYGxUsLv7AQgV2Ou1m1V
         sH+7Gw5VmbcPmDuRAjn4zHbAt61H/22NetG1++t3Kdivl2ah/s9mjsrFilRixc3V5nvX
         FQ81GboFskYPrFwlAP/JZEqO3fHnnI3xPdREwO0n9KZr5QFRSGNVdYMGypm1dPC13HD8
         rbL8TtDYDWxH9GT5ghI2F1P0c3mRc3klTJ85LxyQigxCCVqoZWPNvkqRfTsiTDpH6SCA
         2QzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=auIZfaOXEtlH8qbaTdplRzk6SYfXJKBB6E9yX6kDwoU=;
        fh=1HWrqtI1c+mSACOyRNvHUw0azrmCA4slIKf8bARQD/I=;
        b=hyO/i5Vh74knhzjBiDjQ8cgjgyTUdYbSDUvXef1MUtjf8AHUNkjVo1bpbjFqqRRjDh
         m4vjZvR5WYuzUAdoiN8qzCDE2QuOWNWNEskS3JCivdl6lf2DwbsuoF8Qe3Rxm68oPQfp
         GlIl1A6ncyzrt8sbV/YT7skuFV33AC4zPgjwr0u6USDIHMTWR4qcHNr0gZECdIS1Qkhw
         8ZFV75i67vv9GqGs+wYYCv3BgLInsRdGxHZDzKupk9gSeFbi4Y2BCtGu/2o1Q2CuZaqn
         Hz2wgKQXTucNlXZ/534PgsKnFkn7oicb6M4hT2ThnjJr0go3jCIz2OWlySjSyWMYiF5v
         lXzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783571507; x=1784176307; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auIZfaOXEtlH8qbaTdplRzk6SYfXJKBB6E9yX6kDwoU=;
        b=rE2phlVWeUqLzJ75Qs/vMfTIVv90+8t1VsfAeRTxdTX/yf2h0RFv06Us7jLE/JasJE
         JXjaOvbmSBzMdh8tqh660PDULc+LVsDX8aE7M9vmoiRyxEvQVYIZ8uxunI8KdHaNzhUD
         0SPUnIkaE1YXmLVSR++pWq+WxZPzOeQ6Dp13brG9Zt+y968eG5PFZ/gy8qnYJ5cGZS+Z
         pxPVVkJ2++qJbxU9RGnRPofnYDX2ZTd0+d8DfO3RqkaRIAROMA2G+Y97vUt3taZ64OzU
         HCQrjqpT4hIpRv9iXGbV21fQoaflf2dCRSY4+bAWYqmMr+98u0w83Pfc4MamB3vWKuPc
         Io6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783571507; x=1784176307;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=auIZfaOXEtlH8qbaTdplRzk6SYfXJKBB6E9yX6kDwoU=;
        b=ofwd83w6omMGwo3EBUEslAJLJLbbhMuu2uQdsM3QsdYlCbY1YARxR7cWhaoW04N8L4
         dsRBWMilIsdJqYG+04RIteI2efOdNm9uTGPCb7rALqVph+24rlD9J54lBwviGIWOCBBl
         6meXxq5KqEHnvkbA8A5bvhP3HkmoyW6xP1puvlUJGinKgOcd5vVSeHvbY22+2sb8ysQs
         z4xpGlUq0284pVto7y6WVcT15QOvoMsjVAoTzs63Czj8xhur1zbO2LksVYLbTDdG7H8q
         v/eB1VK2FOrZhs9cJw4+tvzCCEvM46aU22TOb+5BCAmECEOxSmjD5d696XwZGNssnVbb
         4Egw==
X-Forwarded-Encrypted: i=1; AHgh+RolnYvAQfbGY4fDKR55ZF/wyRpdI1ExVYrtPbKW36eW+lsYFtDNVNjQm0WQVz9TXoaZtpj60uGZd20PF4tZRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCgFy5J20n1duPSyfSKGMH0wvDqNfNrwlxNX9mML2BLZXSibif
	72ZFnabEYRzFsqDeLSVhfm2rXZ9VJdYfdRn5hrVC7PN12sZ8qxF4xazGZY37MBt0g/I8BR7XYwq
	mCYvyqnu5kn+wFfLdmOP9YzU1jZA3/xJk6RU3P3U=
X-Gm-Gg: AfdE7ckUR15tfZEmFfwoknaFlY4j/4EJ/MFDqsfZPnrtPKY09PciGQ7Nr8RtE2RULov
	opim1JAKsN7+9NGRmnjNbUgW0Rh/bKTK0h0T2gDTejVeJEiMkdMcZIqqpo63p50gMA40Mm0QG4C
	7cHofW5efRuh2kHWqG+54t/J9wIBBY1VKRsN8+F3axqCKlUePOI3is5+m6EoTO3vK3CSoxvc2gT
	qp/LLkf1MuPlVdI4JDh9sT/UjFQV55Z2B5PdWjib73XejS7TSbL5zKHYLBi8EzM7hwWzPREMkLE
	CB5wtUToDZoVave4qoYK1z8JHk3TNbHkpKd3ojK9/IsF0dr2x4cEqrJnyg==
X-Received: by 2002:a05:690c:3747:b0:806:b6ab:a410 with SMTP id
 00721157ae682-81dbbbc3e84mr46430647b3.0.1783571507606; Wed, 08 Jul 2026
 21:31:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706053413.154135-1-apopple@nvidia.com> <20260706053413.154135-4-apopple@nvidia.com>
 <59948bff927bd4ad3af5fbe68d5d5e7565c5f729.camel@nvidia.com>
 <DJRP5QO5JKVT.Y7LCZARVCWJ8@kernel.org> <ak7lU9X4pTwx5NDB@nvdebian.thelocal> <6fe208cc-f095-4d92-b34c-ad227d2710a4@nvidia.com>
In-Reply-To: <6fe208cc-f095-4d92-b34c-ad227d2710a4@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 9 Jul 2026 14:31:35 +1000
X-Gm-Features: AVVi8Ce52HUzDIAE6RQvUKGgLY8vfZ1_RiXa4OKoXWiwiGWM8AqznZHsuXPRA0w
Message-ID: <CAPM=9tzdBWOhPpO_JffaWvkuz7SejfZL=XAbwxrt0gt3xaDKGA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm: nova: Add GETPARAM parameter to read the GPU chipset
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>, 
	"nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "gary@garyguo.net" <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, "lossin@kernel.org" <lossin@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Jul 2026 at 10:49, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 7/8/26 5:16 PM, Alistair Popple wrote:
> > On 2026-07-07 at 04:24 +1000, Danilo Krummrich <dakr@kernel.org> wrote...
> >> On Mon Jul 6, 2026 at 7:35 PM CEST, Timur Tabi wrote:
> >>> On Mon, 2026-07-06 at 15:34 +1000, Alistair Popple wrote:
> >>>> @@ -38,6 +38,7 @@ pub(crate) fn get_param(
> >>>>
> >>>>          let value = match getparam.param as u32 {
> >>>>              uapi::NOVA_GETPARAM_VRAM_BAR_SIZE => pdev.resource_len(1)?,
> >>>> +            uapi::NOVA_GETPARAM_GPU_CHIPSET => reg_data.api.chipset() as u64,
> >>>
> >>> Can we assign these IOCtl values to match Nouveau as much as possible?  I think it would make
> >>> everyone's life easier if we could use the same user-space tools/libraries for Nova that we do for
> >>> Nouveau.
> >
> > I debated this, for the same reasons. However I came to the conclusion that it
> > wouldn't make a big difference - Nouveau only has a handful of GETPARAMs and
> > we already know we're going to need a lot more for Nova given the increased
> > scope of features it needs to support. The rest of the API also needs to be
> > sufficiently different so I didn't see any real practical advantage to keeping a
> > couple of parameters the same as tools will need updating anyway.
>
> Unless all, or nearly all of the ioctl values would be the same,
> there is absolutely no value in trying to make a small subset
> match.
>
> Let's not get distracted by this. Nouveau is sunsetted and we need
> to focus on building out Nova--without artificial constraints that
> don't add real value.
>

Yes it won't be possible to keep much aligned with nouveau's api, so
let's no bother, nvk already has an abstraction in place that we can
fill in at least.

Dave.
