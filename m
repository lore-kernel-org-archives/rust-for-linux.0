Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFEC1D5174
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 20:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755894994; cv=none; b=Yfs3O7xCNHHng/TlxyV37Gnj6CBCtY7+iy4j3v84cJRqwQVLE5V7iI2daD96oh3V7YOEzU7QK89TGwSev0e8cC9Earhjn1QPhor6DB8E6SohCLZCo4EYCPkBXH8m+OjtuUEWrMfJwnqkHyiEH8KwTc27HPqJpqUmgt9FZu2OjOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755894994; c=relaxed/simple;
	bh=h0ZVMZe1qO46b0+FRFlstU+V/qioRFVqZx3CIYXUOPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=hnxlPt1nFUDBrLZaCreSAqauZz4ob71UXb3C0REWnxFZOPOtJ99Z/yTUf8QR+CLhkSaYggkAW0ZOADSAJINPNjFDd2zX1LHGIeLdN8taa0TnVLTC+6lrUeTVEvdH29xMm7rZckWDupMlt1BFThDM9cCLbmGUiQ36PMOp9OKViYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=OfWO4JVW; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="OfWO4JVW"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-321cfa7ad29so2752459a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 13:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1755894991; x=1756499791; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvHw748wFarUnnLh1kaFyb8NXkrU7YbIjRL/JuKz/Uc=;
        b=OfWO4JVW4zugkqL5Ov7dunLjbCl4tRty+l7xervziv7M0wNKtyCmkn7X2RT7ew7m2S
         edj9DD7RzevVB1Q60Ym/JafepMpJgyhV2x2zZtOnGh4SHvdacKHJc0MW7XPsNVVHpNLt
         CD8s0E3nS1w+IzD8vxS+au/uB1Mk/Ppo0rtky3syr1cASJeUjCfYikrmg6P461F8AhVE
         s4zrW2U6+c4RJCw/y/A+toPN6t+4lsQb++TNbxy+GUmhpK3SWyVsjB8Z664qkYQXGxxS
         qMu8uu8LA/guPO9o+wlu8aOJjb9ySuoaegKZhxG7ZaUcEvIZHFbClvdgHF+HWW0UNoRq
         sYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755894991; x=1756499791;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AvHw748wFarUnnLh1kaFyb8NXkrU7YbIjRL/JuKz/Uc=;
        b=poVHDQ7+/Z0CEvddsEg16E0BKF0jpbM06Lk/SlsNZeDA57Y4U3A1A4gYrDdZpQ4zg1
         4PjQFambfvZqvtZZrV9fBskRWiBE/QLy0QQmjXIo1RTEas7OGaz9+HXkkdcVgE3zM9YJ
         H2Ja8kdsKxxIC3gv3UXZjJAjowGotuMKIoM0NexDYqt0DPY23VMsg09js7a74nz4EXh2
         9Gjg7VcHdfMzgTX4phvA0jOi/Laws8vkJP15AwmYzO3mPr/EYopA6zMJsBoyURHM6cPS
         cKbTSBL4dW6Ap4sknZOnBFoROFZcWMxsOl95sfOgkDvtLa3JJgEnU4v2zMhZjtWvHNtd
         mDEg==
X-Forwarded-Encrypted: i=1; AJvYcCUcvKKmVY9KR1tXs81YhwZYUtBFpe1ULgFufLEGoxkAAhzqO4ohDWYcDss3Uieucok/LjbbF9wcpnDIsFHGLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZ1Sei6B+hVS+msUXUdVgvJxOVGyKrMrY63b89JIQiSvC2nhI
	SNKIQ/GHR4m7p+CSJ5EyjKlDy8WWP/G3Wiuxt1PVAgvLw82z1+rBQMEf2XxdVnxOEB8xWCG96ip
	tCTbONkKmBt7dFyVj/QHM5CjyeaVw6ksojb5Cpd9U
X-Gm-Gg: ASbGncsnxB1Cx0x8ihyOp2200cgHtpW2N+lHsz9GvbggLMAjfkHuQahSn8ZobgZRnzy
	8iF8AnRAjhHZ0+W48E22EHUH+e4zbnGMbidsVw6JyDwH/WG7orPeK9jfUaE3IheT03jAOK+YnWp
	EhkEMlXvcg9c23Uf4fOfHASgfnGQtA0LZdd7+OJjheNdwerbST2XlG7D30aQXFlnTUoo6UrfpGC
	0euGGc=
X-Google-Smtp-Source: AGHT+IEqdBTzIkxBsonzdubPzHUzLXF7csUGeyV5HR0TeNq0f3fCP8vPVePD1TR5jsfM5sbVh7ZV9EIwuLcedE43JGo=
X-Received: by 2002:a17:90b:384c:b0:31f:14b:f397 with SMTP id
 98e67ed59e1d1-3251d474294mr5612988a91.1.1755894991286; Fri, 22 Aug 2025
 13:36:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819195841.238246-2-paul@paul-moore.com>
In-Reply-To: <20250819195841.238246-2-paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 22 Aug 2025 16:36:20 -0400
X-Gm-Features: Ac12FXzuEipZKRQOHBk7GlYyH24kilSe3Hwh09kdTIJPq6O-im9uQzHLj3FUMKM
Message-ID: <CAHC9VhTv0gwaY7CRRzLi68DdqrEXiMSOpAUo5yx1XXad81OwrQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add the associated Rust helper to the
 CREDENTIALS section
To: linux-security-module@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 3:58=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Merged into lsm/dev.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index d61f7246e5bf..0ee0098f2df8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6484,6 +6484,7 @@ S:        Supported
>  T:     git https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/lsm.g=
it
>  F:     include/linux/cred.h
>  F:     kernel/cred.c
> +F:     rust/kernel/cred.rs
>  F:     Documentation/security/credentials.rst
>
>  INTEL CRPS COMMON REDUNDANT PSU DRIVER
> --
> 2.50.1

--=20
paul-moore.com
