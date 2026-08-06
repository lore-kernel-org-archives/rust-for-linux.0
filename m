Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40EE364059
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 17:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036214; cv=pass; b=VkU+woXQLFA6zlNXC9lJm7jvMAvBIfOrGlrb1CrvPaUH14ZihngkIgKK96jbl8YRM7CYuYEp5g4EOgbTZTQL1gzwIHAmEBJXfxy9pobDcyayLxI4chLQ1SXT173qkvQiFuqxW4Ak06oDGnq2zV5zvKlG1aNiGi6gk0rOoqrjzPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036214; c=relaxed/simple;
	bh=WmYDDf5PXgDdaw0Es/oXBNkSiuSnfeH0RNgIUwTXNxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGzTN3h+Z9OlhQhMbFamh0iTgtt69FNfCkT1Er01kY0NiFfW9ZQ8QeYwheAdK780w0YR81vc5rRBJ3GQhXWfDjt2TPHo6sFkqZc5BBGw8ddDoNlxCKERKYGdztu8MhDPau+oUyQOHeaIjd6SLWXoAVJGQH3MjciPGPhQb8Ctlyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXLmIxis; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXLmIxis"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ceeee8c46bso5585905ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Aug 2026 10:10:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786036213; cv=none;
        d=google.com; s=arc-20260327;
        b=XGSwqwTVDhxKnf6/uf35QNALD8yFBN0RZO0d84Ci4BXHAmKZL4utX/rK5WnOYWkWTg
         O1nOZUIjT/12rG+NNehZ4H8iOXfIv1GTFbdaAl3084b2UfUGJxCfv70Eaj9YKu1mDXOm
         VcPqVzzHUqzOcqD7WG6lj4Pt6M4yjBcd/vgbEXVVx2C2MPVi7zjWgiRUslSuYj0ghC9g
         038dgqydDEtA0vPYII0XOFC9r/azBIN9ZuPaeh/llMIul2EZvY6Mw2loSqWauIiQzXEV
         AiB2ArL0mE8BORqmKjCtqHNiKzJX/DNLof7I3loqx0MSM2E9S/KyP0MZiLiQ7Nt6Pjk2
         co+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WmYDDf5PXgDdaw0Es/oXBNkSiuSnfeH0RNgIUwTXNxQ=;
        fh=8x2RA3DnTjPW1zYtSJ4hNXySDbt+r2MHTjLPXi7AI04=;
        b=HiCC7hFQfadV6WAtSh/NwF2pZSLOI++wu82+oX0XoyzUtBCSd0bsPmC5sOX6fDc6n1
         +Ocj+DEkG/oy6hvA7XKKsHRKTQWqpFGx8sAVnGyIq7T5IjfCSpClqubmcicw4ih2jzgn
         U9ezhjSmmDie+ZyaGck2vQOLZzXppclmzokSwFNWfC9W1ypl2VSSWx5q6OkFVh3G4aQ4
         dG9faNgyM0hV/NXWveu2+pwwo+4nyrA+xeiHzbR84JgiGbbOoNB9WzyuYrB8+bKZHZ7N
         U4y13CJGt4ijFhyyLnrJR523ULgwGda1flsHPU3fomCxA5BXtODckxsBv0ABn8zoUEhj
         +GCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786036213; x=1786641013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmYDDf5PXgDdaw0Es/oXBNkSiuSnfeH0RNgIUwTXNxQ=;
        b=BXLmIxisPoP19+yU4jJVXsuRhRdT9d2ZWUtWcW2dFPT99V0UxFyQBY17qHhsmBp7iB
         pby2DufDW087k3KU0ktjDd0uz4WYlfFvCjvItQzeVyZAkV1SsavSVHwAiBsN69P+/K+P
         Fz9/vCCy37V4aiKynaNCZpLviNq2jdHp3HMLE3KLTIT0P+tHV5AELASMTzpl2lYqWZPb
         3ITetb8Cat54HFwL7h3xUUrd1hEmbJXBwTY3MzxqkCvtMlllxGwOzJQbnvRPzaViMhVi
         1rX2G+7D5eCQiU6+4XWUUtM9fQsS4crgQx9Qo1DEVCSm/A0kiCebyLDVAyE1N8vgmwpT
         DK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786036213; x=1786641013;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmYDDf5PXgDdaw0Es/oXBNkSiuSnfeH0RNgIUwTXNxQ=;
        b=XZghr4P3QcX+I/35ypox9KV+yURo85iiCBSup0dbuAOGHOb9zZO8cHG5TPksxEvqXL
         s7nuh1xtaIs+RQas4wuWCUokkjHwh3JZPupRhYv6GrQrFkws7EYvwrZMqHBDjRZz6CFh
         o0oAQX1eEJWHV24TyeZgqfIQ2pYM4M+hImhBRXCwEfYRdInijlsfpPNf3rTUlb4x+fE2
         DZehU9hhI3KCNlUV2KOkuznSOUK9/mYiTBUdlerwcku5npN0p9Wz7QoA7BzUyPqWCrRg
         SZfOHrdtQfFfxDmlnQmHxc/1Fg26K4EpyH7DRZh+JDJGnaw95QesXsYNAc2snwopDIg+
         tXJA==
X-Forwarded-Encrypted: i=1; AHgh+RqDyPAl4wO8l6BDDtzEgjtUvByuXvO60vJB8wVnWRsVJlf+yOlsG6Dg1KK2jtRIXDKp0qn1+GQ6CwnrYbiBVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCfx2jKE4bVhoHUmfFX1G9T2fTudgLR5G7EWRrI5PSH66swg2N
	ZGT+w7KdlAZPOSkSw7HVOnXBQQtxH/p4Lu18nVeEHggPR3SqJODCsRBbJUeVYRYjpqn2zcTCPPR
	x5d7Sza+CBVeZFtDVF4hPzYO50UlYhGs=
X-Gm-Gg: AR+sD11HbOY/kA8So652h2WYCMPPSWbPcz9KfLLd6aitn+qOmyz1TJeHL05p55oiqkN
	VWRktNZaXFGVNlQe9PaYuSilbHY1u6jMStNDVqGdVN8bJChUMUhfLQjUVReHI61YEWxiuMdl6Jv
	kl87zj+ICTBALGYOr08yr1ykcEu0adw+v0ckUkrZ8vLG56DP87i0E+ERT5K8HbqyTbhjq0WxOJA
	jmWL+NY5OvS4mWTox9nBjeB5/9IYnnVOnAcI34z/Y4aZde/KMZA1Hc/vOW1J2DXGQskRm1osZfE
	otcvpu3MFW/eXUzq7GIX29r1Hj7D66lFKC2B3uCYpcBPQAzBPEwRc9E14L5bBu/05ZH9ktwNx6p
	QFSL1l8/UB1Ezhz3w7pDiTIaScDXxEz/E+6mqodAycuEx+vopYkqO6tU9Bw3T0X7jxWCwod8=
X-Received: by 2002:a17:903:2f8f:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d0ca73a210mr127500655ad.1.1786036212982; Thu, 06 Aug 2026
 10:10:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805190012.2934907-1-gary@kernel.org> <20260806170101.67544-1-ojeda@kernel.org>
 <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk>
In-Reply-To: <ace18b0e-bda1-417b-adb2-2ba7c36f1c1c@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Aug 2026 19:09:58 +0200
X-Gm-Features: AUfX_mwe1rnF833eEgHGNDZvGNIkd1MYZv-whPnyM-yMmGdCmoEqYy_1vGmTd1U
Message-ID: <CANiq72k9hzdU8QF32HEdvpaz9K7JxE2vxfyRFVjaePciyzgnTg@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.3-rc1
To: Mark Brown <broonie@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, gary@kernel.org, linux-next@vger.kernel.org, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	rust-for-linux@vger.kernel.org, tamird@kernel.org, tmgross@umich.edu, 
	work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 7:05=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> The merge commit for what?

I think you merge driver-core-next after the rust-next/pin-init ones,
so I assume in the driver-core-next one, right?

Cheers,
Miguel
