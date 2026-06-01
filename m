Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACF385D87
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 08:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780300830; cv=pass; b=b78h0NT2H5dgr/ueRlqXx4dOTL3Hr9POYoOStjOvhX9G3KVb7rW1eOvizUmeWZIejDPLShQ5pR/8BHWtlXfGiD++w/CVXDrLheRoaj4xNlKv646CQu8rk68GWtQ4A07FdH5kurl905HeY3ku+L1MDWHVaquGcqoBQIgh9NAgpsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780300830; c=relaxed/simple;
	bh=+WGimFxSBi9AwwmJKWgclnkERaomHNOiuwdezUX+TbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZgRdLtU9OLPr9JPqIKXs5u81LH5/Te3VMQB4txIKpO3fKmO6YBPeYurubUBAfO4eMtbeVq2NGHoajY1Mq9yT4K4i6+P56x1my0Ix+hau5FoNpGe5uPDH3hzbRoFNLqmHBG3Bz5YN7sDeC4tZlRVyx4/Y7siWyDVfejf2eLxmpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSn8KRvn; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSn8KRvn"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39666aac20cso15941651fa.1
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 01:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780300827; cv=none;
        d=google.com; s=arc-20240605;
        b=gCrG+zArND2XJEZa723/fU0q7ezHu7AqDpaTHm7KXQtDHciN98+gDOmIc+BnCtLs7w
         L8Y+fm+CkwER6kre44bbv4xXa62ZBtuUve5+NYcHkmBC1KpaX76IoRtZ81XFIAVv0b3B
         SqPUe5QlW541pavBUfvL3vhh6EZthfXD/bUB4uiC5ptoYX0JyDuQZE4le/EKmtjctvZ2
         6k2vKa11LPXYlGzkOwxY1EevAe7MrmPwuZLbydgkRzptfeHD8NX0Nrou8/klKWyGHu+y
         LjTjT2kk5/X/Zzqv8s30ycaWKgUFJqB/CmwJI2TWOeUlAl5/czOgltKtc35SR4nQY9k1
         20xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L3qSVCHjuApLVKFSv4QmeQi5TnmD6gcVzjmpr1yaRjc=;
        fh=UpmRF7YYYO3XNhkz/jovZ9A5LaDRVWR5vRLluxi0Owc=;
        b=U/SLutwnw5Gr0bbqPbHb2pxUT8P8mD/w/GmiouZPx61eI8DPlrDwwTUMZiie2qjGnh
         RDxfGMyW/SwA7c6KbEsFAESims7SNkLzJXvvvD+kVicJZhDHG0NSCsVezCvECi6YNkFn
         DftG+Jk0yuJorOhiWHfxJgQahmntljjrdl0YX/RC25MSWS5LCMGIJtyCqxogskpmLdRf
         ROq8/59cZrz+BTTRXRGBaF/Dd66PdJTB6spkXSLYiZ6pr27oWX49at1aqIIoMY32z59n
         e2ux9t5QWjzCaJU2dH+EhmYYTrBqHGvzFhDjxaWtgwSIjhXZxoVO6PtxZtpiPsxpLxLq
         G9nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780300827; x=1780905627; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L3qSVCHjuApLVKFSv4QmeQi5TnmD6gcVzjmpr1yaRjc=;
        b=pSn8KRvnVABH0kOL2p/EzugLkoqK5HHRTy4wcvAmah08ENhKuOtPlXbqTWY7jSCSoo
         GRe34eNsuen25tsHmWUI5m5NzYRW8U5u+wv3LDsHeIafB3Snyx5wszp89c46W6Xk73G+
         F+hOM+YdocMCKDcl+0VBf07UWvbv4OlIlb9Sw79cfDDALqeRc52qbMnTU37fjnO3AY7j
         YAXm8/Au6wZq3XS/VGoo+gU9rbejYfQqnYHQrybxKggMqhg+GEpskQSToVC5BnfSugOp
         05EXx8+V9gKB5Ynkh4JmR9SUrSJjfOyvbHP3bn7VzMyGDt1bujebpr37FKa6otrFDw7q
         y/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780300827; x=1780905627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3qSVCHjuApLVKFSv4QmeQi5TnmD6gcVzjmpr1yaRjc=;
        b=R0ik309p0m/tTUnml+uZ4DgiXrGqRm8+S02rbB0twjIx86YjVyVy/+kEr2KztfUO2G
         Xw8VahZh4LORd2uy8MCz9zAs6Sd+zlQEPORArmWEyNVedFPMPN3eiE2Ky+HK6unP9UNI
         6ovrx5og4hUXLtg5mksFMDDgX0Wxi46w+9HtHAaohtifXLOAdhUo7b00ZZW+BxsvqBYh
         fpDE1ZK8K9nAhClSRfJC0V7UxyDYieUjPg4mbzXV+DiJqHPg/cunj7tMmgNKUPhA/I6n
         EWzPdah66oIzRoRuPgZcpRLCqrdLZ3iNLiniMcloKwyh2Ep+FE5jQ62Y/XIzQGWscHWV
         WrmA==
X-Forwarded-Encrypted: i=1; AFNElJ+3mvTtnjAFqxO+ebTJ4VelQzn+Jh9ziiwm+akvjybsNivdKJGu61pAi5Xvm5UoFBsnt+G4BHEuNjxzfK46cQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykevSdvvMADnmc4CY+lTrhnNHj8j/u8GjDsU7vjQET8o/zS2jT
	duqjsds9pGmamXsuuKdahCqVnc4lOIoxlnpTggo0QTn3Tfcx6fw5Hdagi6Hl1Jl2TytQIU9YNF0
	gZ2975aZbLjUuH8Prg+K7ckcwUuZy6hU=
X-Gm-Gg: Acq92OE7ao9VJRxD1jYU4RtaMErEdBMoqyPWMjAAGW/4RNchuuPq87IW1qh8igTSndM
	7ldE7QJMH5IG4BMRRMQoX9uNDdOB5Vjhp0T2JfG/5hAqSAAgfUx7cnesqVEwjWZ/PztZ6U4FqBf
	U2LCLQfOQktQU6RwN+SKIwkoerAAif1T44bNL7TEU+O1apinpV5G7NT9+c+V6HkLTb8JXWZHgoZ
	zYdiJoc6Few/HJ6xntCBSwpW9y2vDTQwfdLc4AZD6m10AOGP6nbROIX0gSPBAlWKkzQ0GZkfmqr
	9IYJ4wNVHunWvVncNoY8AKjaPH+DN3I/aI1iW2pncWOEVPetOTeG
X-Received: by 2002:a2e:9a11:0:b0:396:746d:a985 with SMTP id
 38308e7fff4ca-396746dadf6mr21472801fa.27.1780300827144; Mon, 01 Jun 2026
 01:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524132824.54918-1-muchamadcoirulanwar@gmail.com>
 <20260524132824.54918-5-muchamadcoirulanwar@gmail.com> <20260528170910.3b513fa7@jic23-huawei>
In-Reply-To: <20260528170910.3b513fa7@jic23-huawei>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Mon, 1 Jun 2026 15:00:14 +0700
X-Gm-Features: AVHnY4Lqs61T-L2Ft5o5bJlygKWygPckuU3Z7eLGHet-bAULTebr4WYQZ2b8W8A
Message-ID: <CAO26r3Tr+qOe_OZBz+hZ0eihVqsGuebuWfmM86PhLPd1MaW25Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/4] iio: position: as5600: add Kconfig and
 Makefile entries
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, Brandon Saint-John <branstj@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 May 2026 17:09:00 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Combine with the driver patch.  Separate patches for build files
> provide no value.

Done. v4 will be a 3-patch series with Kconfig and Makefile included in
the driver patch.

Thanks,
Coirul
