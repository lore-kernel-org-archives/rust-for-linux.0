Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3B44D695
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 12:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514259; cv=pass; b=Lzj2XgGHyGD+7PaHwwyekmgEyP1qoD3jnfIY1WRwECBcNjcEGc3EOa5A0MTJeyINlCI/yhU87zUOJTeXmNu5j3xBJJG6BMo1qPz/gxNI14RW5/xN+EH8AtMmOKIL05+6addHPh3HkPw0lNJ2hxck48XfY8an1XLQEwkj+ZyvuFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514259; c=relaxed/simple;
	bh=RKB8o6GjrdgfJGNQpTr30hRzT5pRDKe/NXhxMY4NO4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FvA+wz3UkjnJv2L3EHevu1YsGOo1sVGhNAzi1cdfjyQr+jGxVotb1gU2sQaMocOg12eS/zDSvbTO6irJhuizwhFjSVN1Qm5u97XQivj6Y1cGQRjQuso2/wVh0i3Ljp/XCG7PdGeiw8cxtBvXqa3IMK4+bUZ/VaQVJczBTOv6PVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGJnPkz7; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGJnPkz7"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c7050a48fso5052191fa.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 05:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783514254; cv=none;
        d=google.com; s=arc-20260327;
        b=aihZ+t3N/9GYMmiLhjKEgPhw610me0pKkTIft3RkgUgFQaFX5eyZ+F9hIW0afHykmT
         4aWt4cpPFwX1VunEGRlYyimXgYZJL/wcL+dfV0lZ7/xoGTP6y3SLLPLkOV3hNS5zLbOu
         lVH9LBEmefU5ZOHIVnRkCcTrOuas+bWVgc4RdE7Do64Myo1pLbsMcUgmfGbhQRMEhpp6
         TloDg3jGZ5vHQdbKIFmxhllNNjV+a3ebKINPIm88oCeKY2iZFtMIJGK/Jd3RkA3cCpPo
         MJJLJqFs2+a9YqulaAHitUO/13zQOQLxKs9+zOWUFvrMYH/2mB6UGCATEd2PSM41gdHN
         qTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RKB8o6GjrdgfJGNQpTr30hRzT5pRDKe/NXhxMY4NO4U=;
        fh=Sk8LfNeRZ3OLiHsNLvS7WeRyWbJ+hJHUV0RRV8POf2M=;
        b=shV/qmy0oTHfd83F/aY0ddFwpJi6BrA7xR674Cznk0drho1o/nqNjrhRs3MPZyYi1e
         vWqeOpgzfzn2MVYl2IRLpjdIlRqEF6J0Ic52bDkMZZrnlEzgDX/hBpqPRlco+fL37D2x
         PVZ1YN2kO88D5HexbHODqc6M2ExghCYwUHfziONF/mrcIm4q/4PBBZJQE1wghfFOanAO
         KeZO7eMnRrPqUvM1rMgg+gzP2FGblJocF3gOcQEZceBGv9TOY8ipeezOSZ8zYPGLTTwF
         AiGT4hqCwp9GJ4YHZeqH/J6CsvoVy6e1tDdcG4kYb1+qkzgx/ZgYRvB82Sza8WUcEbzv
         OSCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783514254; x=1784119054; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKB8o6GjrdgfJGNQpTr30hRzT5pRDKe/NXhxMY4NO4U=;
        b=VGJnPkz7jry3sSBBc6ToDVQ4zShuMfMwOl6gfwbDZnZsRqNUlKvsLeIanUzlfwyFe/
         Pt5ol2TcUDCVjcrUZgoi6nFhT7fVJS/fJjnQZtLtjeJ8LcNVubk2rzPPnJMfppXJ/luq
         SqJxTIItrInFXthF/wqGOqAYZSdkifwXAWjR8YZaip7mbV+IbfaPrpuDQGpkeIapq9Xi
         aUayVXslJtE5+b9f5bbVXG3FFvFd6B3hQkiYNy/MwIolrXty0sRaJnmGUkbUpS9CLmkW
         BGjgTVmVzC5sHqlxl182jB/8L2NdVMcYzuExLG8ChLjfWgzrjhlOU8pEJ6t6Uccn1bQt
         sYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514254; x=1784119054;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RKB8o6GjrdgfJGNQpTr30hRzT5pRDKe/NXhxMY4NO4U=;
        b=r1Y5sCTA/WJ3yQJxobMd03K0EhdiH55p1ydbWp5h7G7BYkOBU9Q19cuHVRTBqJhfab
         PZjqeAsXrNkwctXjvalaa0Bt28pDU6N9hiWr43h66sP0Si2LShejP10Fh3Ts5N+qzNMD
         IfLQDuHDpC9ZTZzXJ5S12CC84jDUu/XFhRPwmWTTEASKX8ZgVLZhPlJk/LP8oEEDkn0C
         NIzoqZvhOJ2gQ6XRmCIGKACtNW7H7kisCjrDcKNXGatR4pvqxJHsW1RgVOvqJttLqHjM
         lKN+tAvWFod8Es3pFJlTPKfyKto4pvtQoqFBVLZu1d/e5UWg6vtMI8YfstOTPK0+lDMW
         6/Bw==
X-Forwarded-Encrypted: i=1; AHgh+RowXPMbef3PmV4PRErciDq/cvfpyqZ4KYNYboMSsF2CVJMwLNUXvUveAWzIAA74TWf0t9DAv/Y+uNGPkQVNRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yypmc4ND7tSISVsKF2o38WRkt9VyzoRRz0n8WB9C4YwTY/wcklQ
	3Tz22PaP8DfjWgYmp8+Prfr4PFm934r+9Dc4VhQqM1nCFukVKQX4zqDBaVCXFZ46UYh+U7g6QUx
	MylpJuov+x4JE1+5MLMcGcFvDcBU1K0I=
X-Gm-Gg: AfdE7cl8EX1hlzAyayz1chus9CG9JcNh4sa8y7V6X7FTjlOYOubiMVxFeJ3rkoWgZio
	0hhOwuSI6gABFYwYHRANnDVfS8OAemM/slvvYYX8D9OBUiDjjODqUAEKjIhud5ElmWEBwi0mZym
	7z5ZdXggSgi4egHrdOt/mlHsV0hj+WBJbEbbw/CJq80y2Cs8l9CDtMglwhx4hagDM2bUhKa20wn
	3VEGnhypUUIc/orN9qVCCanS0QRznUKre2ggS0xRdCn0UCRHldhnVVJ05BZY1ePsI8YFh+EyBO2
	wKL1TRNsXwtefmGfhEbN5eTCgIK3mw4V0LCcYwM2vQ==
X-Received: by 2002:a2e:bc11:0:b0:39b:2df2:901c with SMTP id
 38308e7fff4ca-39c79870073mr5222991fa.16.1783514254053; Wed, 08 Jul 2026
 05:37:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707151542.91997-1-muchamadcoirulanwar@gmail.com> <CANiq72kQ0=MqAhrSSk3m5RNVrO+4Cv18xv1noTE1Y8TsPeRhDA@mail.gmail.com>
In-Reply-To: <CANiq72kQ0=MqAhrSSk3m5RNVrO+4Cv18xv1noTE1Y8TsPeRhDA@mail.gmail.com>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Wed, 8 Jul 2026 19:37:22 +0700
X-Gm-Features: AVVi8Cc2__SbyiWeUKOd2eZf6DwFxVexg1Yun7S0NV1eIyHrGLZ-6Z4DPn_Uk_s
Message-ID: <CAO26r3S=0UBOwSetC3cqqCZqwsoj=F3ff_o0_2YknG11+g_z=w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 0/3] iio: position: add Rust driver for ams AS5600
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com, ojeda@kernel.org, 
	dakr@kernel.org, igor.korotin@linux.dev, branstj@gmail.com, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> On Tue, Jul 7, 2026 at 5:17 PM Muchamad Coirul Anwar
> <muchamadcoirulanwar@gmail.com> wrote:
> >
> > This is v4 of the Rust driver for the ams AS5600 12-bit magnetic rotary
> > position sensor. v3 hardened the IIO abstraction layer and introduced
> > kernel synchronisation primitives. This revision simplifies the driver
> > substantially based on review feedback, removes components that were
> > over-engineered for a single-bus 12-bit sensor, and validates the result
> > with comprehensive hardware testing.
>
> Please Cc rust-for-linux as well for patch series that contain Rust -- thanks!
>
> Cheers,
> Miguel

Thanks Miguel, I missed it.

Coirul
