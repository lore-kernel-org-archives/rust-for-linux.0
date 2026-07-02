Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0363D47D4
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978908; cv=pass; b=L6uO2Mfwiw59j2+QPFkEzME9NlIQMO/aU2rhAAr5F615HlJgoFW8lQJSBvgG/HcXrgl3mlE2m1u8JojRCfpUaIqX4l4if49bnypm6m3Vnv8q86qirtpO/4j7C6L1huObtImQIFoilKeEcs1HiITwotLcuUW833nr7TwhiKBUwUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978908; c=relaxed/simple;
	bh=3wHUzHYNxBHACocz+MHx2rhMLTU+c4Oe46o/2eS2jTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umHWXPPDkAm+R6ra6LMeTxCmOhiKAoB06fWopBJmstKcizBpheTq/7Juqi2TF48vK1iyuehISgCRszvcimmqBmNS48zG07cVczu0iZueJhzI9iu0gSC53enx63mhWaLZW3fMCtNYVsQf1hH6qfwhH08lpvFeLjnNB9RAVPys/rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faMaTW29; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faMaTW29"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37f9e2642deso171358a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 00:55:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782978902; cv=none;
        d=google.com; s=arc-20260327;
        b=N7Lo0Fjgh6znJnr/lD6DBiG1EBh38SuRGU5iHpUMo+ebqVPqe/tbYWqm1XlhaGVjn/
         tTH/ijryfdwzD6d6yZLW/lFV4UGt4qlQYK7Iek2YtrB28pTg91pOhjRQ+ZyGaS6NpShO
         LWsI+n2q5WDIaQkAkukym1C2/qsGEk6rUDZNpuo/HwU9cMxkWYo2fuwZ529Grk0eyA98
         r+tKd0HJ7M2f8l8j/Jvi4MIsJ1nCq1NlWkuwPTn1x6ef5aT5URZ0J1884qsECNKwMUoe
         o78adv8GL4R30qfQn6iKZgNHuQeUgHl18m1muxXwRe9PA9ZXj/NqGXLloPnilJDiVIRT
         udDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3wHUzHYNxBHACocz+MHx2rhMLTU+c4Oe46o/2eS2jTY=;
        fh=LsLlgv11vzZBl9CA5hkak95BHvtM2n+F/yuS82HVOJc=;
        b=LERmRRrsmBXRJjbIwMT5WQxLtZMhg0WxhNgUSlyb4HKD/74qsCBKCKRI0muw1K0f88
         2+sHHNTqLYoV/GXnrWysKezgHTFmpP3Ugp+I3Ea2DCdN/RIGohNCucGGnRahfI0f6JP6
         mjyc8gUxpvqxA/r9HDkxDgLrAO7i7jAnlNe7fyvYcZnxp43t7dgO0354sCAoSxTPE+sp
         T5rsFLCgXVEb76g859HnHsr6TJs/S5xJQ9M+48RXht4GeIdpKwkh1j9zdqCFui90iJdU
         8nT+FLRL+TrrS8o1wCwBj+WhthD+HSOjxFwVkYzUdT8l+MChyDdUlcthWZO3RXca0c92
         YQZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782978902; x=1783583702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3wHUzHYNxBHACocz+MHx2rhMLTU+c4Oe46o/2eS2jTY=;
        b=faMaTW29uxkA0+obDwkUXRPV4eEyfm6mQQfpsB7Di4ZrK0DBTQTblXeq83qfFV8vE3
         kAvs3s01vA7nt/TfTlrf9MOa5NQa3SbCLA/c6A38Y0/eHdptjfzJ8rdY7D1zvFTMNiQJ
         0BTYbRGkR/xkKOCZbEXJ5W9pHOlXaA/KLgO2HpkLh2guyYV7B59cEOOAt6L16Paou5Jh
         j2iLJRlB20GgYCJjdu92l/Kd38Zd5qlqebNVnc0iO0vA000QpLK72Va9//5/u2NVm9zE
         hq7uzcMPilE309aevkzhf0NmV7sLYzRJS9/prs+K3J2wBMTKQ92FbBuhRBJ4bna0gaiF
         z+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782978902; x=1783583702;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3wHUzHYNxBHACocz+MHx2rhMLTU+c4Oe46o/2eS2jTY=;
        b=ITxBiDEKTyzPSN/D7NolYY/ux7DHRMkoaLwW1UMlHWpMu67OaUeiSXi5PA9dfdkDxu
         aOXk/rOCHe76fTNt1m5oldtCz7AssC1pntfYiPTtRAAIVHiM0uSlRtl/jsynMqX0uHBj
         7JnfxE5S4N/y+998RQagwsYdzlH706ZQ6pAgGvQhYT2KEgcU+lyW3UGw9lnqH1K1ojvb
         2vOJEsezv+Dxv2bTN8cPOuo727NFDVFNQkT61CzEFiarTt9QxsObR6eZNnSFmaZocEXX
         nH0Qi79a+sArzwuiT3hdV0/t25K6/Q0X2QcZapEaYA+H3ZMp1DofLjY8GdZoeA9Acv2x
         1F6g==
X-Forwarded-Encrypted: i=1; AHgh+RrNO9RSNsUe1B17+vQBqnFNkyE6KzwmrW217emsq6FafH19NWEaYJKTjldeiazLpr5Islp/xOfCrMbuVmFi0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2T/nu6hds/wNeZuWZSgmaJqEFaWfn4abpYF5eN4i+WpGw+Cd3
	5eySe6RXVhvO3iDCBH0CuzzTXJ+TSpzbZq/ZmQ2LDIyCfpf7Q0GIVJD80XfSS8X2PIXnw4dIhJh
	JzuMnMZJNG2wjeFQzk50q1lC+r+PHDdw=
X-Gm-Gg: AfdE7cmLG9yG1YehDIl5F2/H+Wb7/JU4d346+PD6n4Q6QcwtSLtDTjuv4BuRS2PVm5a
	/fxRjE9I29Cz0T+HLm0omqkb2qedc5PkxP9dFaWvanCcXNEkQ6gD/y64G8ywd/A1bd1hSBftQ17
	99JMfvS/lQBpt3vMfAdObCQFazi/T0jLsZqKBtht/ur+08RA7TOZmzpTZGUm0b3KmB/ieKYrJ0x
	BzdFZgM3bmryNIY+yFsor0qdm3Sm/VL9jcvbEs7YWB7qCBRWCzjrWnWVk4ZiEINv9N1S4LV/7Db
	rGEP7WRcHqrdFf80hsIvraoDF15jwA1/mqvx521hqYE55jRkjC4C62x6GAOaAlPn/bsCE6tF8O3
	L/ovShC5MYJfOXGELuQidJc4=
X-Received: by 2002:a17:90b:164a:b0:37f:e7e7:ac3 with SMTP id
 98e67ed59e1d1-380aa213029mr3471079a91.3.1782978901663; Thu, 02 Jul 2026
 00:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-nova-rust-analyzer-v1-1-5209f486f10d@nvidia.com>
 <20260701123703.152958-1-work@onurozkan.dev> <DJNON0M9N1LM.SSDDO8N9AM2B@nvidia.com>
In-Reply-To: <DJNON0M9N1LM.SSDDO8N9AM2B@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Jul 2026 09:54:49 +0200
X-Gm-Features: AVVi8Cc-jeKWuhlps3fpukVFGOkqyU8Zzqr229Z3ERQ1vr56XgIj4S5V-0WLn90
Message-ID: <CANiq72=NSt8bKamtL8BpkwBAMRs9cnbXj5XvT7yB11ZY0wWdbQ@mail.gmail.com>
Subject: Re: [PATCH] gpu: nova: fix rust-analyzer generation
To: Alexandre Courbot <acourbot@nvidia.com>, Jesung Yang <y.j3ms.n@gmail.com>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 3:09=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Ideally yes - I expect that this is something the improved build system
> will handle correctly. The current Nova build rules are a temporary
> workaround, so I wanted to keep this "fix" as small as possible as it
> will also be reverted eventually.

Yeah, the current approach is just a workaround for the missing
information, and we will be able to just do it "properly" instead.

This is fine for now (and it is not the first "magic comment" in Linux anyw=
ay).

Cc'ing Jesung too.

Thanks!

Cheers,
Miguel
