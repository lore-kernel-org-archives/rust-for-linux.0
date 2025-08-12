Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EEF197A76
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755034647; cv=none; b=nmr3iackHU/EXS7emPiytopJgK1q6NaYbN65Wan98RKUQ5tQdJigaKfQFl10duK/Xn6O1fre1gBZ17qklgn2Sa1UxcDOugf+m9HMXMABmkMN1LG+nsaFoKJcYtncCSaEFo7IFVRX5pl3DaHDF8GX8jrxv4k1orlrml058adoPqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755034647; c=relaxed/simple;
	bh=adMVe/y/t8Ofx+CdsFasunvedtyc7x5PV/ZRoeIoYHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hixKtLyuVoslzNMxjaVu5VIL/rIchrA503wyAo1S/UXGMjqnbxgiFw4R3xfsi+Ju5mcYnj0iUPRuSyYBR6W6wF7GLiN1CKPsIrX7VW+2H+GdjNuvRzE1ETMOXacwC80YcwHhmG0O3OXwehKLNYW2gNZese9wtgHKg3dgZsdwAVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TeoeTo40; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TeoeTo40"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2420c9e3445so10752325ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Aug 2025 14:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755034645; x=1755639445; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adMVe/y/t8Ofx+CdsFasunvedtyc7x5PV/ZRoeIoYHQ=;
        b=TeoeTo40znLUw6TrYxfw9m8CED/YmQGRQM6noQEdnaFT7g8mrb27fWnHQe24qNk8sW
         THJ6zZUfkFUYVhVcwr3uxlVta/rcTkYJQJT1SShR8TAG0DbvKSXo/eahKEr1gd83o+AT
         KF2Kv5mZaBruqFfsaTo+rwm8ioTMQakR0cXA/ibdOz7HZk987dR1sywQCePavmJcI/Qg
         ZszFEcZX4yrioKOCXy9tGf3A31J2Xtv2zu1Nxz1kGn06vJn6JaHAcCQLYSz99Rbp4Dy2
         yEDBSvFyErh03ygU9nK4vN3YpYLzZGDOvPSq85usVDTj+D8TOROejJaEbUgSNECkjHvf
         wSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755034645; x=1755639445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adMVe/y/t8Ofx+CdsFasunvedtyc7x5PV/ZRoeIoYHQ=;
        b=MkeWc7QEJ3GmVZ3NFiKqPLutZNhyYk2NBbmJu7y++cN3tHq9Elq7pzp2Guo+2KYIw5
         76/CkVD+iXCmmI/7f5uHuc8C8RMoJhNk6O/kawVMeZRBRCjSNkg2Up38gVbXEipSg+OG
         WCSBi6vUP4BP1MjQoVYgc+mX0SfAlp1vnRRBCWjGf9jpdYvYHarsXizWlDrQXW0f5hF/
         PhfxEqh1NIjnWvN3vKCimtyvqNFqDm7ERkjB+l8cXkLnxLHnBVlu1G5UYJaNdJA/pUgU
         lifzqZXA5yBLmJcNoPMr3WyQP78H+T5Zoexs9oHXkp3dV54q5wfNjbKhQ8BUwXPE5H7a
         uphQ==
X-Gm-Message-State: AOJu0Yz9QN4cZ+lwkpPFG84uTHkQrZC3EVIfWtim7BCkw1daxFzrHOlN
	Ab5SsAHicsxK8dHlvwZF/Yioptl2RGP+X1jDhIfE9BxBCevRvheZSwbjVR6rG+grj3Vatv/7tru
	qvEUeoUioez3XHAT5Amh77GG0IIoeupvcbjku3LOdvg==
X-Gm-Gg: ASbGncsPBwmWZ1V+4/j0ey9V3aTMFCvTh76/2Sn4tFwcAoFKvAhMMDbOZhuKnrWW0Xt
	Lg2fKN0Lap+hIPJVcdAqttZrlcV3ctIKDRQiEv6xSscnPCubrKtDcI88KqlCuri/fP6cbLmdauf
	u48CX+BHGCzhZzC/7xHZPkYsACLzweNobmd9A526ImsxnTAnsaXRW9q8R9BE3ekm+JzSTEcH61h
	ceRDIvy7JgWrYKRczY=
X-Google-Smtp-Source: AGHT+IFpml5M+tYcECxiNJbIL1PKXYWUSuKCBcUY89pWocBkZJ9ZIP+uzFN7spKn4sNTWVswjwiM4bLSUBWWtyY3A3Q=
X-Received: by 2002:a17:902:ec8d:b0:240:5c13:979a with SMTP id
 d9443c01a7336-2430d22a83dmr4677175ad.9.1755034645346; Tue, 12 Aug 2025
 14:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMjM9+aqeh4iEyfAKidYig_5zEV-CMZuJpmtzhqjKHiVTiBpYA@mail.gmail.com>
In-Reply-To: <CAMjM9+aqeh4iEyfAKidYig_5zEV-CMZuJpmtzhqjKHiVTiBpYA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 12 Aug 2025 23:37:13 +0200
X-Gm-Features: Ac12FXytlUzd5tMQk-l_Rc5vciw2lX9Ao7EUIaRPz8zi6Eqjl3ikB1BS_Kb8izM
Message-ID: <CANiq72kF-CmmJ5=ZTtXf9rq01y6touQcAd2J6L0fR14UW5+yTw@mail.gmail.com>
Subject: Re: [PATCH] rust: lib: add if_cfg! macro for conditional compilation
To: Areej <areejhamid8560@gmail.com>
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org, lyude@redhat.com, 
	lossin@kernel.org, tmgross@umich.edu, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:17=E2=80=AFPM Areej <areejhamid8560@gmail.com> w=
rote:
>
> From ca720a9f7b977a6360f47b0037a9f8784dee192d Mon Sep 17 00:00:00 2001
> From: Areej <areejhamid8560@gmail.com>
> Date: Tue, 12 Aug 2025 23:34:20 +0500
> Subject: [PATCH] rust: lib: add if_cfg! macro for conditional compilation

This seems to still be part of the email body -- worse, it is a
multipart one with HTML too, which means it didn't arrive to the
mailing list.

I would suggest trying `git send-email` (it comes with Git).

Also, please Cc all the relevant members/people -- you can use
`scripts/get_maintainer.pl` to get a list for a given patch (or file).

> Signed-off-by: Areej <areejhamid8560@gmail.com>

The kernel requires using a "known identity" (typically meaning the
full/real name) -- please see
https://docs.kernel.org/process/submitting-patches.html#developer-s-certifi=
cate-of-origin-1-1

> Use this macro to refactor CONFIG_64BIT conditionals by replacing
> repetitive #[cfg] blocks with cleaner inline expressions.

This could, in principle, be split into a second patch, so that you
can Cc the timekeeping maintainers ("DELAY, SLEEP, TIMEKEEPING, TIMERS
[RUST]") and use a suitable title prefix (e.g. "rust: time: ...") etc.

> +/// let x =3D if_cfg!(if feature =3D "foo" {

We don't use `feature =3D` in the kernel (apart from places like
pin-init which are vendored), so it would be best to show an example
with a `CONFIG_*` instead.

> +/// // `x` will be 10 if the feature "foo" is enabled, otherwise 20.
> +/// assert!(x =3D=3D 10 || x =3D=3D 20);

I guess we could have two `static_assert!`s, one per `cfg`, but I
guess this may be simpler/easier to read.

Thanks!

Cheers,
Miguel
