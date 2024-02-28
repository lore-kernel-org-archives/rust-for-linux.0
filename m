Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1714F995
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Feb 2024 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709129622; cv=none; b=Cf9fIYLoHoeNcaYKavRTm1wDRmAduN4BNHiUYqoqL+IMNgMO14s4WSewUd4vof11z8W6zZGuZcZ++5ph3ETFQG9CO/zly89Mc5fYZIIsN14bbbKJckwSyT4E9lVGiSd1V/EclXFkoJamE1PxqNagpUrgmHR/M9mn0YSbXX6ihqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709129622; c=relaxed/simple;
	bh=GZSa7w9u4wZYm52OzgA4Rz5PAaON/iHPoxrHsry7+Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyihmwj5pLOrlydIPaV655dUC9tnPrRkV5VvB/Lr0EyGPyknjV+TsTPVap7RyZg+y+PJ25GEhLkVoo5T4QV6x8qw5KqKejzQBySJ4ZEypmjVwziowRIToWW4TeaIRcArItRbnEU8k+kl6B8+Gm9w3gwHqP+iScqr6WlP/kzNuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G9ktYVfR; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G9ktYVfR"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-787d021f08bso283169785a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Feb 2024 06:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709129620; x=1709734420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWdt7JSqxm5A0d9YCvZY0giCug1uc5yEmh3KxJvdV0g=;
        b=G9ktYVfRBg705jupUhFB0ximZlQSyXf8BFbnFkVbwCQAR2drbM6ZeRYkfuxHdm0CYD
         Vo/lO09/PdhE/TbYN5CCDuKYYdpewJ5f/mNeX7L/jwX2zLEYPJbNK/grOmnLUvT/nHae
         n2PtfR4Ju5EG906wEKQYgWVUnimBUchc8CNl149hPmfDNU+eyDGNlbseCPmBeTRTtble
         bZJ3V+JaeoZYJcLtA0XIlSj0Oeq51edFxt5/s9QZNMna+zQ3hvGivMkplwRqIPLvanLH
         JH4IxYbniVvI6epRCbaO252IfEUjK9aMP9uQmvYrFJRxDRa625jgR1GpzsS/bU0zuQ8b
         HcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709129620; x=1709734420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWdt7JSqxm5A0d9YCvZY0giCug1uc5yEmh3KxJvdV0g=;
        b=XN7oBhviz74lCXqRshXhS4OoDGY8viBhWyFqFWUeuOBoj5ToQyaGe0nOOGdFGlTe8C
         JcCMt8uNwxQAoue0vdo4/iHdrRMobe1RAEfItYY96c4yJsiEItIUNh3gOy0ccjpBFV/g
         AjQyoOT/mHENW6mG+aVwbZT6Vurv+nhAagamjdZQ9X49wyvG8NDl09nEIqWD4Is3kDXk
         UroYYVnH5lM7a/9MG4iD+QuSsIFP9J2sepYd0GNItlyRHdMpZ0qASY93Ac79z0kZjZED
         X+DpacUA6w7QjxrCk34mXgvVT4NtiuxDAsautpgP8OpMts4EYo4aQ1/RfTtQLkNaQ8JH
         6xCw==
X-Forwarded-Encrypted: i=1; AJvYcCVxKnor6HP7jcSqNHHQxtphvI9wWLCyDNf/FTV05NJ5k+YOgFTLr3t1MFBs/dBGfMD5o0Sv4jSIPlF7eJqlqmt5+ZZ1hT8fMNmKyugV4as=
X-Gm-Message-State: AOJu0YxGUoLmlF2F0+xxl/00rYeyMqVrdJ/eBXYEdKgZOdTZOaczM0e2
	oYR2MAzi2NP8MPGCsBTPndWWDKKKgjC9MhS/N75o3ytkjk5weEfgw7KfjnCMjCoZEkid30vj8qb
	V44+yBx7IiX3vV6MxXx77sV1xOBP3ToFmFa5k
X-Google-Smtp-Source: AGHT+IHhKPlutmi6jJVN+nL3TabbPZEuB5EQJ3Aa8MscJlcMNwjnLMk1ATmsWR2BYwS7KdkjnKd9gSsiJe+EUGQ14CI=
X-Received: by 2002:a0c:e450:0:b0:68f:edeb:91d5 with SMTP id
 d16-20020a0ce450000000b0068fedeb91d5mr4864685qvm.16.1709129619598; Wed, 28
 Feb 2024 06:13:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240227215146.46487-1-daniel.almeida@collabora.com> <20240227215146.46487-2-daniel.almeida@collabora.com>
In-Reply-To: <20240227215146.46487-2-daniel.almeida@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 28 Feb 2024 15:13:28 +0100
Message-ID: <CAH5fLgi_Y0a=XPtgdiA9KcsmMGxn=DjvLMmSq-UF8VQtZVTccg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] v4l2-core: rewrite the VP9 library in Rust
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: wedsonaf@gmail.com, ojeda@kernel.org, mchehab@kernel.org, 
	hverkuil@xs4all.nl, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 10:56=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> +#[no_mangle]
> +pub extern "C" fn v4l2_vp9_seg_feat_enabled_rs(
> +    feature_enabled: &mut u8,
> +    feature: u32,
> +    segid: u32,
> +) -> bool {
> +    let feature_enabled =3D unsafe { core::slice::from_raw_parts_mut(fea=
ture_enabled, 8) };
> +    let mask =3D 1 << feature;
> +    feature_enabled[segid as usize] & mask !=3D 0
> +}

This seems to be the only unsafe block. Impressive!

I recommend taking an `*mut u8` here instead of `&mut u8` if you're
going to use `slice::from_raw_parts_mut`. Or, if cbindgen allows it,
take an `&mut [u8; 8]` instead and eliminate the unsafe block.

Alice
