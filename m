Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDB01C7610
	for <rust-for-linux@vger.kernel.org>; Fri,  1 Nov 2024 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730480216; cv=none; b=b9amLGPYasMxeqikJbzJ6h1MmNMGHKcZQ70EkJh2ryBwzxpRPwKG5rqpsVeSYntzrI+50HTEVFeogs861JmwX2PMjzMjIgySupTerXxBqVEjNS811j3NU+yylGpyCtbVn0XWQxRPMmoQIA8/KdOYfLPh0WwI9CTA/K13zRDbwbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730480216; c=relaxed/simple;
	bh=i8O+uZUxJvitzxO+GEB6MrzAKW3i24r0zpb4JuO31xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqP/lib98PmN5x8fOor3uNBB2FzoWcsnw96Kn8KZW5txInJKw9Cy8Rf7zvt49EY2KUB5vqTi8+7CDY7ep8QD5Q1GTTAFcqeqdlU6XvLxswbUTdUw6pqpMc5u3P0kTt9axr1EcwtGw+0UboqhCjaFzk0/ZL9qRa6oZnZU2/gKXvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=EpviSNub; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="EpviSNub"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e9ba45d67fso21798927b3.1
        for <rust-for-linux@vger.kernel.org>; Fri, 01 Nov 2024 09:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1730480213; x=1731085013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rxE7WaVgo5r0HZcP1X6U835BE06QJIdzvrF7o7xI5VI=;
        b=EpviSNubGNAacQ1ss6AYuqTu84mCCgR2VEJE7cJsJ5UcYmZAQfAjuBKoZJEN3r4I9r
         sPxsc2HO6UnhwNtgK4On3rKPVtUH0lRN3lkYynYq9ZuuNpG2Ei7ubTVtdt9j1RpfGtgr
         sBbxHftqiztPU7vVFex+Rg8t7vuGNZ8aJJKuvLCDsBtMZddInHklArxkag9bqoON+UVP
         VsdWi2S+6n4ZQh+DeMUW7bxfti8vNuGnrb2wmmm+vOeeIi6ErzYeYFSp8TY/SDtArhiv
         28KN+L0/886ZEplR5baj+YOa0kvrrjhIQRXEJ2m1dvtxRpoXTPq3E1plP4lvTSitSsX9
         YoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730480213; x=1731085013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxE7WaVgo5r0HZcP1X6U835BE06QJIdzvrF7o7xI5VI=;
        b=XBxFdgAsU4GiY6Iz2pFIPl/zg2Z9JtghueX5zY0blzJac9E61jDkJtWYnNYaWJlmDY
         xzj2zqMVyzx2grx0TWZ3PG7s5MPI3zNzcw9YIUJmfDS2Cf8cgLaE96A+QAQDjeHB1fEL
         9Ka8Fa9mEekKDYKmoWcYsmgu1aFkrmKrOlFQ5ZCH9CaUsUjStdjqJFjd6luvrC9TeZWz
         V4ZX34iWhkhrNu/2D1VDCF8VbopD8nJW6YyqOP0X83+IhL8QGr0I45DpNOt7iwyENhtU
         gQxNTybtjAmjxNZY+RiSWCnprAdw31O/+SQyCOXtRZShX0m0O6FnhnAUgMnHSgeRlbwe
         J2jg==
X-Forwarded-Encrypted: i=1; AJvYcCVx2nEnbSVPJqYyeX1gnl0vG+9tilmozVoMB6/rzznGmn/Y4kQ6cCNl2iz9DU49kEPXS8LSD3WhHiXF2vFCJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzanpoaqtxMQkmsoNCePbCRS3Nt6e7pibMqyREP5tsQR6IR0ssJ
	VOH2c5uEUiY5W8/hQTJfxfn0iOvvklFEHhXK/8TwOSGvPO+ZbiU9GN4q7KBUj3/rS9hyO2yF6Gg
	VS+FTejhoyBASUDJrmUOy5wNTEKYtqocJ3hP5
X-Google-Smtp-Source: AGHT+IFrUTWzgyjlHFLv35YIhawUguqiFZlN8JkVX36bMb7nh64mC/bvCf2Gq6Oq2P3WorBR5lRH5khSJFZMf6kJNg8=
X-Received: by 2002:a05:690c:1e:b0:6e7:e76e:5852 with SMTP id
 00721157ae682-6ea3b96aaa6mr155834947b3.32.1730480213140; Fri, 01 Nov 2024
 09:56:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
 <20241101095620.2526421-1-aliceryhl@google.com>
In-Reply-To: <20241101095620.2526421-1-aliceryhl@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 Nov 2024 12:56:42 -0400
Message-ID: <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
Subject: Re: [PATCH] rust: lsm: replace context+len with lsm_context
To: Alice Ryhl <aliceryhl@google.com>
Cc: naresh.kamboju@linaro.org, casey@schaufler-ca.com, 
	anders.roxell@linaro.org, arnd@arndb.de, brauner@kernel.org, 
	dan.carpenter@linaro.org, kees@kernel.org, linux-kernel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, ojeda@kernel.org, regressions@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	lkft@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 5:56=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> This brings the Rust SecurityCtx abstraction [1] up to date with the new
> API where context+len is replaced with an lsm_context [2] struct.
>
> Link: https://lore.kernel.org/r/20240915-alice-file-v10-5-88484f7a3dcf@go=
ogle.com [1]
> Link: https://lore.kernel.org/r/20241023212158.18718-3-casey@schaufler-ca=
.com [2]
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Closes: https://lore.kernel.org/r/CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEz=
JazDsdk9o5zw@mail.gmail.com
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/security.c |  8 ++++----
>  rust/kernel/security.rs | 38 +++++++++++++++++---------------------
>  2 files changed, 21 insertions(+), 25 deletions(-)

Thanks Alice.  Would you like me to pull this in via the LSM tree with
the associated LSM changes, or would you prefer to do this some other
way?

I'm going to merge this into lsm/dev for now so that we fix the issue
in linux-next, but I'm happy to drop it or do something else, let me
know.

--=20
paul-moore.com
