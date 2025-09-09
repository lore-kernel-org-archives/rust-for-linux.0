Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20831B117
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412998; cv=none; b=iuyeHyb9OMujXbaJIIKRT2Ex+/9ie4uUi2QGahN2UXNhirTfjNRoRTqFAmqpqMV24AKKRGueFn0fHJI5wEIIDtMitmHZWlfD6VmwLgJsxzWTAXoxLvK8ij+Gt8iKrM1a9RF/TjlOibyZRnX3S6Pz+kL/LL052WUCreBU3ccl8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412998; c=relaxed/simple;
	bh=BA//Cphq5edMK4Qw1gaH2KdEhbSdge9EaLUpTsUxTOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcHuHFgAkaBvy/TtoOYyOheeI4RsNehFZYQRqDNuw10aRXBEIdS1DN9kKQCjXuiMxsoAKVz8H3REMMaxwhW+Ib1HyeHbZsZinW9+7cY56Ul/LMn7hidi1a3xulH3LDuTEEyUNMdCW9N7ihbbrHbZwSMXHAdWBI7yij60FlQ71SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5peua5g; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5peua5g"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24cb267c50eso8292735ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 03:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757412996; x=1758017796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRA1tNnGH/MfGCb7e8SaVap6oHhoVBPZzEtWR1E3eD8=;
        b=e5peua5g3ILU+0wnqDy0NkdG0g4fpvIirUcW+Mi/AT7KqJ0ljBl31smdRf6hP1kMxB
         XU288g7MORHsmEgFF8VrZzG/T1zJl51RN/4XNwWs2rBQ1oXYg60cDydNho59BRlvSKc1
         RBXiap7wrbaNYsGZRKNwY4BITHd0gER3UnRegmornzWep2g3lG+erfuPhaJEKO/dAPFr
         VO4yyq2UlSFrtggFL1caL6ltc4Y0WISyW5meP/axngdKl8QQDPbCqSywczD2h9sfTnbY
         b4XvmWEG0XBOjRD//cJB3K//qWhKKhrTmK1kne26VzBZISMddZiLX3kk2QlkOuUcfVSd
         kP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412996; x=1758017796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sRA1tNnGH/MfGCb7e8SaVap6oHhoVBPZzEtWR1E3eD8=;
        b=N91rUEkPaCqDGDrleREYOC9p+pIKneILDkxe/e32d3+qSTKXyt5u01bSoqAU2SnzKL
         GjafUllJRNSZ3EIYeQzyHk/H2byZ1E7O+uPqHI2UKNauXsgaKvJ0O2QzHZclHVA5v72j
         3ZHrl1ATAkmiXtfVW1Nc803VAIv9Qz+AB2pbjneS/8uE08X5YCNmbpKdjF5ZqSNw63OT
         YhIUT0hXGEIJKIJtqLsKY2gxbF33iBB9KQSvxO/DLQBHxJRjtbVpW6heqIaJBGkTvB4d
         +AN8tDf8shABpDsYG1uVDUJ/tnzm6W3jeQa1CxiESgCUxLXDG7G33/3Us3Oc7eeLj/De
         kcFw==
X-Forwarded-Encrypted: i=1; AJvYcCWPW+HV0V9mz5b/BcycMQWtGf4DPWHNbWSIBaUnuMp/bLIspphgRZVsyJ1PW1VzKwFPmGGhL8AsaVSfYd9/XA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAl68CZN45iFv80RQKM5iSAIWzqS05lxy/AuctUDzMVP5TRdIo
	wb5+b3xtZetM1F7BwsmcUk60IOhV0hi0jMAXjX40dfhc2wjH+F4DevS+6HZenEM4kfvJMF3t3V9
	nePpzSFPYkzjfYCBfo86BI0VXylvUyjE=
X-Gm-Gg: ASbGncsn2zdaBYXfyxZgSRag7nlblsCdAchwFM8erVoFjia7dzbbmDuu/PAHbuQGaFS
	M1opfHBo/mCU4wSrMsOdktqDahht0vHuASziSxC+wKC25ZuiKFkqo/FgoTNbmVEW2z+nz68EYAa
	dcyQ0dV6s3NDjwL1EQZoiMtFINvYIFvUiGV3VjhXnwMRj6gUDwhPqOY9y1SLgLzUqX4hVt+/TRI
	YFVh7/AoAVDpfvnJRo6OVQZ1GbWNmaxYqO/hY75HEhfg3GrGxHRiQ/o2TZcuZ/Y+sTfaaj+NLjF
	xJa6KVzfUETPmRKkdw1NvbZXgw==
X-Google-Smtp-Source: AGHT+IFRVKo/Gtkg+6TprWyzPoJr3m/eSYj6SZpUwtqQlLRttkeYnxvnIbsHYeRNu819giRbB97IRmdiE0doJRE7eVM=
X-Received: by 2002:a17:902:e845:b0:24e:a074:fbbe with SMTP id
 d9443c01a7336-251703939dbmr75623775ad.3.1757412995866; Tue, 09 Sep 2025
 03:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909092707.3127-1-yangtiezhu@loongson.cn> <20250909092707.3127-3-yangtiezhu@loongson.cn>
In-Reply-To: <20250909092707.3127-3-yangtiezhu@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 12:16:22 +0200
X-Gm-Features: AS18NWBru0Kq2XMwTpEiOoCDlYbqPUJ3s50syOJN4CqxsvVJPRxFAC9ia-wum2c
Message-ID: <CANiq72n7OSCUzycAQXFybx6BSVnj3MWAXvZj7U=AWf_UQwmO+g@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: Handle jump tables option for RUST
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Matthew Maurer <mmaurer@google.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	WANG Rui <wangrui@loongson.cn>, rust-for-linux@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 11:27=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> +config RUSTC_HAS_ANNOTATE_TABLEJUMP
> +       depends on RUST
> +       def_bool $(rustc-option,-Cllvm-args=3D--loongarch-annotate-tablej=
ump)

I am not sure if this needs the `depends on` -- from a quick test, it
seems to run regardless of it (and your `ifdef` below doesn't care
either). Cc'ing Matthew in case he remembers why the docs mention that
the Kconfig one should be guarded by `RUST_IS_AVAILABLE`.

In any case, it shouldn't hurt and it is only on the LoongArch Makefile.

If you will be taking this through the LoongArch tree:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks again for fixing this!

Cheers,
Miguel
