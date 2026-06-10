Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC1F38B14B
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781076280; cv=pass; b=REFTXYtk5nXTfBys3Zfx2yqCHTlfg9/INnR1Hn1MizTH2b9VosPk0KxAPNMoz1TSKhYx0iOeQnFn7VDD+PaUBxIYYsorrpU9SoS+JuVbp2IShlCtd2ljc2Yv0ciJ5dAJWKVYGCqStOlaV58SQnEc1zUFKSkkDWw5QPdBmNBMkMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781076280; c=relaxed/simple;
	bh=fLn38wqAksu5b5VkdgXTVrHfVK83zNvbu+my1sAhVQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3KOltCWZh8P85FUMQX882Y3a1TWZ/aQO7QK4Qt50LmR2vZ0HBGcIsMVnjw5M5vfzbknkoK3D1mrj3ls+3z02TaoAMvTZr+GWBLA2Ni6zNdtERtSMaflFqoKrDlpYnhKOfFEPBvyLrg5jkgo28Gf6x7Tf1u2l44eT23uYVyI/F4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4So9/QV; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4So9/QV"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-304d4e57d33so294546eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Jun 2026 00:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781076279; cv=none;
        d=google.com; s=arc-20240605;
        b=HYV5FFagxGex7juBm1Lnn+ffELo3QmXODq+vbGiFJe58S5Tuw4WisRQhAJj1Xwgwob
         ReSZVImlUUwQ9/kGcBKL/zT/J/10GszlNi1sNsf5CIW7iILdgGdKDWSOWg4985MZL53E
         Ml9F4wpcZ9Hn2FMykxK/n631msBOHKu53mdm7Mo59ymby9Nek1BvGUxdJRzWvHwRvLAu
         ujCvQzzknyfDRuCEsmzanrTjmA8d7Lwtz/wsVVARE4+8SDdNuRCSo+Lpdj5UpGuYadiy
         yypx5IOtPB04CgXTGgTzkNf4izCjCRMvov0O5UKcMip82AyRFOh/8HBXzyn1PwQrPRTH
         hq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rf/c/xUvAcS03/zJkFNJkmBhyUqR627XeIXzc8m5gwA=;
        fh=pMyKp5OI6ADTTQNt0uzCtaVoY4WR0C3B1Iv4QWwH/wo=;
        b=JVJT7xmXXLPQ1kjPIXg/y5ws3Iu2uhXcDWIv8MgfgqC0spIXrm6LVR5CCRVjiTPxd/
         F6lj/L14ps8S65KTvwjQWsbtLcSE295AKPDGHW7aDgBPgz42k0PHLgmaqQ94aXrqFHUU
         EFYpjvSCxVkKpi8GEaqc/zZEEnIrH1/winD7lujhK3l/z8vCLnJUHMMLsUdwPxQXHjIT
         v7m95gHGfm4Ze9o49g21M+ax+ukMWZDCWpIti5IGlun2D7T2duFPlIZy2Yd04R/v9jbC
         wvcVRwLVd3zLxXNifkPrnNrLTEe+MhrMVpmHchZd0F/yHIt7GgktHLZFHPpXq9Ao3RBU
         ACjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781076279; x=1781681079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rf/c/xUvAcS03/zJkFNJkmBhyUqR627XeIXzc8m5gwA=;
        b=M4So9/QV2/aVL4R7zPRdRGw5G9bg48QCusCkNDkVPZvL31Qc5spc4R4dIHrvbHrADM
         AQdoRvDOk5BClx6AtSamsI4AutpMilD9b/1RwIeAuJ71WhifaJ8EvzGOiL64GNDXzO7x
         hyHoV3PbriFHvCMyue0Dvh5IIf28S/Ca9EtRDaNSF7COc6Huc/2Ca90L80gYxnZTg7/F
         7DQNqxyUMD5/CAv/WL4XbrDp/CrnhmK1yQpqH9gRyTaNi2DZRdpSbjNsrzs5Du7Euc4j
         BLoYwTRhzH9CpaqkWq+ZvbgKz1BwsmJdSkLQuD4rHwDMsbfmErTMghtNjsjyjG2eXkJb
         lovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781076279; x=1781681079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rf/c/xUvAcS03/zJkFNJkmBhyUqR627XeIXzc8m5gwA=;
        b=dTI00tLhCrBeuQ3Hsd4+FI0uL3UPQPLv6bq/POUZDARbhXzpSCd4k/FeXMLsDKOjhb
         7Bm+9DAoa/67tDOUXY4e2FmU6tY/eEoISo3IqhENyP++Yg6n0X1IlPL5V3a9Ylvh6j7V
         +ywRwT27sHQyMwuFm3wduCuvkZj1gbv9wvc9GTbFkiEOPgfHRk1UoPtuNhwzWA9V/Lx3
         GMVvhzkhyRnrl7hPGdyIgnody2ihE9pwiCoag0DCtBep1Hspo/dJAtF3kH6+NyYCeeet
         iewsqUgyaz68zFv3M7fQGBFxylSTaam4rzvDGO15ZT1dWEcY5KLuXD4sVouhoiRyG1Vo
         2OwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+H3w47Zh/AYCLwqUI68eN/IxKGaxHC0qx68iPbBzpedlI7y5T32oiMgoN04XHUWd4eMYUbaeN2m4WwnljrMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyivxmckoso568n82/5H0NGmaZg6gd82+PgCwo2uThqvHAyy/o
	W6Nq4hrGi1+tDiYB/z4JyhnbhmFYappZBvluFbJHTS/lNBRrp3KbodngipUGpz/ISmpu6oX2iM5
	59FJuuL5YA84lKC5x7ISMHGmSqmowKx8=
X-Gm-Gg: Acq92OGteaxXueGXXQAUxl9aUO3tLZIw6I3WG8OusW6W0KbFtvwTFJ16eK2AvXB1qin
	k41TVBj74Ah36/+D4sHVyg16doN5fCUfVJrfi2bpm7UphLmerxGdhRrquLuyvN/idANoYGPlFAs
	Qf+cCGq/rGP3f16wOLRVZBp3SiaCqbc3qRwlcfP7j/9KD4TCqi5pHx+q0H+23Fy5MoQPPi0fkL3
	W/mUlKG9Z++UMV2PZl0eJa/1rhoDgo81B0k+UrebJHLgjq4+7RvBjQG2UoQhpJMItItmnk7KQwT
	n//9pmLnqbnxbF8Oy0tFrHPWzg5vAOjf9mq+uGz4g86ggsyDYOxscxFftLKR/alW3uQLqueRHaR
	LsQZTD49n7UGwY2TVjMeW/ZL+qUicTIbfoQ==
X-Received: by 2002:a05:7300:3b07:b0:304:9b4b:3b9 with SMTP id
 5a478bee46e88-307d602d73bmr1982949eec.6.1781076278814; Wed, 10 Jun 2026
 00:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-page-additions-v2-0-03f04c8fdbbf@kernel.org> <20260605-page-additions-v2-1-03f04c8fdbbf@kernel.org>
In-Reply-To: <20260605-page-additions-v2-1-03f04c8fdbbf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 10 Jun 2026 09:24:24 +0200
X-Gm-Features: AVVi8CcJk4M5vfxHb4jSqPUTv7a1Q71ZMBg6Wn623JR3CU4FY_KhUqWoN71EW-U
Message-ID: <CANiq72kZQxLEXnz1U7K82TZJWYUF=8f=wC=RtTL26ADfr9RQJw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: page: add `SafePage` for race-free page access
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Boqun Feng <boqun@kernel.org>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2026 at 2:49=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
>      bindings,
> -    error::code::*,
> -    error::Result,
> +    error::{
> +        code::*,
> +        Result, //
> +    },
>      types::{
>          Opaque,
>          Ownable,

>  use core::{
>      marker::PhantomData,
>      mem::ManuallyDrop,
> -    ops::Deref,
> +    ops::{Deref, DerefMut},
>      ptr::{
>          self,
>          NonNull, //

The first hunk fixes the imports, but the second introduces an import
in the wrong style.

I think the first part should be in its own commit, and the second
should be here but with the correct style.

But I just noticed the first part should also have been done as part
of your other patch I applied yesterday, so I just rebased to fix
that:

  dea66841b9f8 ("rust: page: use the "kernel vertical" imports style").

Cheers,
Miguel
