Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78073287259
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 10:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952793; cv=pass; b=sM4UihmvSwSpHQg+pbXSrJLzcshIRKhuocoS40GEQpV2BWY9C9VNyFN3K0i0oGs18LCcuvAGyCXauqIdVJxGIjACLoTsXlu5Xm5Uso/gj+TyGOT5mNvvcCguZ+VpnVKHjptqrY0uvp8s86RbhUugQ47l8jSXuFr6FdsixuNsDSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952793; c=relaxed/simple;
	bh=SIuNrjNtezXoobQHSy73sm9R+zsL6ydW7aQLrmMRIiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnqEk9mitsdOBB8tumMghtwkpB/z4sVXaULcVN+9phWs8lQONqkF6liS4h6ff7EhPRgLWGW/HtuteZlWXzS1WFjZPecsp6W9si9ZT0u2G5d3ZhY5DQScCbR9Dw9ioRc3zzZqX4tcXcHoQHmD7YVjST+rtF+LuHb3uAbZUXbdnbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyLE5dyA; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyLE5dyA"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c3d815778eso144259eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 03:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774952792; cv=none;
        d=google.com; s=arc-20240605;
        b=ZkHNVg+TcWlzlUx/YBaVcx2NvzLZPJKL9/oiGv2DeODp3qU6gPLbZvaP9PwDuTyOhd
         EIxM116h/EEtJq6fwCa9GefaJDY/Llib2saVuBZpS/h5qXl6NVCSC8YHoHgBZgaQCAGK
         BeA1e46ow7WyeqpOzIm6xqhchV3SVGtCZX9x5rPWy/VqH3JJx8LPV5UuFzaPaOtg2HAK
         tkmhqG33W33os8U5N/weD5OvDWI6WQdR/m5sxt8h/iz86PCaYATkHytlUDi4m8r//z1B
         E8i1OROCWAXObg5NQqgAhFmk0D0h7Pj8kSSYz4krUPig+KzEiafmaSc6RWy7W1yQySNX
         HFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SIuNrjNtezXoobQHSy73sm9R+zsL6ydW7aQLrmMRIiw=;
        fh=MHLl4lHsfTc1+nWY6Z2voFY82yOCy3TSCjx8iDup6Xo=;
        b=GzC55HVzhLBKDsW4Iz+MD643Zrg9J/GC96pxxgSdlXMldJgoA3vjEdlnmPPe+NYi2a
         Z/EB7lMIpk+hhrmtJr0dB/hKwj9gl/wYUzAYxHcugjMoVd4nn7JVBP1xeOOUOOdKOIIU
         OWZFLpS3rimfP1dBXeM6yc7INIxWcQah4IrwwcFAirgNvVW35P4NXpB2eiSbjD8rtc9p
         089kW17cZMsKb50sFyTy0Ym3GOYifFEUol/f6jYz20IdzVZYbUBDKDvuSFKchs/6xE6Q
         ochCdD6262QYxLX000yqVOOMEQ6XeAFTdUnfXmI+PWKsjnlKWXC/ZgvC7q5dXPdzjd1u
         /IwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774952792; x=1775557592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIuNrjNtezXoobQHSy73sm9R+zsL6ydW7aQLrmMRIiw=;
        b=RyLE5dyAKRPIGBIdfNEiedDs+uhAV3We3JdZvjUgWhHc0+FWrsj3lsQAe0L18nLw6Y
         g6Yv33hASe1/HyPCHwB09UHxsJcigNIDv+2fshgkx+S1vTKgBx3NE0ItiviZVoTJ85K1
         OB0oxkYrxRPnTBADeQ+pp02yLNcK+7DZbPT/MZIM8OzRBaDxndO6HWXHsHeQFPkIJTIa
         VWoUzGfOrR4PuKHXztPHSsgugbf5VUQxk8v+di0KpUBhsngDbvSfgvYCGHNREhdp6T/s
         d4xIHWRyB0NOs0GT18i28kYS4ivlwzik2MOfhwUO2EtG3MV9TNcl93HYUsKVJpTLj+uP
         MKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952792; x=1775557592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIuNrjNtezXoobQHSy73sm9R+zsL6ydW7aQLrmMRIiw=;
        b=eKJkE9ZYYz/4yEqQ2kHMiTGReq+1CuyWF6o3wx6+BWSslwMul4HxWI7E0/r95KC7CP
         oApefnpvrXWJGH0NSYC3QVrYoSsFSB2lr/D5JH1p3xEinq/0Vhu+PlctwFP8lzQmx9O6
         g11YMhSp9AcKV2kKK453yKgm/wNT2Mt9CouYzV3WQaYuVNfD0pICU9o3GIN4WVAp93Zy
         mLh8vmBR/VnPRGmGzrEQlQqb41zD/AU7hxwMk22EHjgLuBHlsID5j7i4JBR2JZddCyqC
         ybV+gPA9mPXrg34jBTWfhDrqFSUtqyAwYlZJtjxliF6lGkZeoyIQz4A0FL1Xw9g89Ywa
         dBwA==
X-Forwarded-Encrypted: i=1; AJvYcCVIKvAnFNsmXle5yKN9xRvTpd6m/Hn1ZkJQZySRx5q7kYm//QJ+xrbQPwYsZdwhfS/DM/HsjxSYgXiPHd9GKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIPNSnPlM/2Tx9P9OFfSNEfMG08HzVeK5n3BaMJPnGcD5X4PPL
	PLL62UBvI0qTnJX8PIfndPZEHl2ZxxoEeYecPC8aRmA4RiLn/1cK/5rerNci6vHDQrbDntneHU/
	f6H9aDR9lJUDq/XeudDFFEhNZ1Z8R1JM=
X-Gm-Gg: ATEYQzwzfKGMiGZmyeT0QvvAKggQ8KyinGBEdQ78KFbYAaSmsyPaoYLkJSxsVvCnogI
	c4r/H7OSUFLJlyWBaD5y10VdlRInWdermCh3UiM7lqbnO18eDxfld/xwWA7SioraXbB2s2CiSNP
	TGouhUiK1VlIc/90XVzEKy+Kjw5JiKVD1LuD+VAtbz3rKZjH0qK7GF0xotS9PruT6MIMhGAyz93
	NXB4/iuKORRNN7e2svCuNNA9UQeRD5mvxhV8ot+X1xZZZtP3CpVDryyWnPlf+MSnGcLyJfWaC2m
	hP7kmBFWwojxKZ8GKkE1fOzkLA1c7fMKppkQvyB+MNHinojsfBXgynlW9R2peN9laaqhHTosN6j
	e1LYD0XdnkMAMTP+odcjWbmQ=
X-Received: by 2002:a05:7301:c016:b0:2c4:acef:291a with SMTP id
 5a478bee46e88-2c4acef2e0dmr1636381eec.4.1774952791540; Tue, 31 Mar 2026
 03:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326013902.588242-1-jhubbard@nvidia.com> <20260326013902.588242-17-jhubbard@nvidia.com>
 <CANiq72mwC9K3mOaTUsfrreJqiE7WumqcwqhXQK=nvhsb=024=A@mail.gmail.com>
 <0c9af1c5-b3f2-442c-9af5-c156926442e2@nvidia.com> <CANiq72kHi5dawEdT4HbAAZvE4gSJ83-ORHEZJ5+qKzJMxN5yNw@mail.gmail.com>
 <DHGLZ78K5VG9.1HVP62JMSVIOY@nvidia.com>
In-Reply-To: <DHGLZ78K5VG9.1HVP62JMSVIOY@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 12:26:17 +0200
X-Gm-Features: AQROBzBr1WLUrHGEu7vBQIJRXJ4w6teKJ0ENr9DjBidReX_weALlMbvV3CPkJcc
Message-ID: <CANiq72kMCzFv_hUesaOJsn87NS45R5tYnneHKRL5caHYRiYisQ@mail.gmail.com>
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 4:23=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> The series won't land this cycle (but is the priority for the next one),
> and this patch is clearly an outlier as it belongs in the kernel crate,
> so it looks like a good candidate for you to pick if you don't mind the
> temporary dead code. Aligning constants up is a common operation that is
> worth making available early IMHO. :)

Sounds good!

Cheers,
Miguel
