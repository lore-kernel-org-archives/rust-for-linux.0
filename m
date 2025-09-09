Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181E334364
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757441199; cv=none; b=Im5/X3TYKgPXotTmFSaBXlwBvgy5035D7zIsMYsNAPd7pWzDF/8Kb7zHiNdzowJiGYr3aSQO5LWivCBuitvLkzDtu2rvOaeE3esbMtyB+Y4qKG7lEbs9KeYPkYOeirOf9UMzPN0uMZ47gs1BVfk8CRQkIcgTWAWZ+Gw4466bRck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757441199; c=relaxed/simple;
	bh=jZ4q7/TmAhAt9Egg4Ce9ImZslltIxN0BNL1jgujUK+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=itGaZ98Cf1jWDskszNdavE/zbVcalXNIYNw+vdZ7NMEKJEfJk6Z/deY9KTZh2xCgvckNHSSqMc7eGYKmM2kXrajuU6u40oslRI1JMJOsh7Bl6EXr0CCIFwrO87G2CtqHtX4DFBTL0Y482aX0TD1S8BCcQCgy+za2re7FBpiBuVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aeqREOwg; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aeqREOwg"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61cfbb21fd1so1631a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757441196; x=1758045996; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zs2bT3Dg9Ff25HRhQXBnWG6WLypX8eEtjPTIvXY4ebI=;
        b=aeqREOwgtqZzVMwht/CmjhUXvcOqESCiykwZa6O/6NtvH4K8D1xxEC7rD2UoXiDlSx
         Ztw3/m6BjtCICe85Aai3y7zBZymhJfVoZw/UYFacxzsrx/9y/+RZS7C9SL9WHw83PLNY
         YuB85yMUbXTGKAaShc+0/B8DnZ3Mdkv2zZfhJ73vrgiXjWRGmC798/v+5YudnkS2yQXA
         t9Y/60lpdxHMhpJPrvEcQwJMAcjhjrnnClX2zlayJBH18EfOIOyMR/XH0zL1ueUo4bO/
         QfSLVQ2245wwr3UqgwXtKBDM4mDWs7ojRYOWYpqUABhiMeNUCY6dUVzakxi4WPTIAQ23
         UJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757441196; x=1758045996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zs2bT3Dg9Ff25HRhQXBnWG6WLypX8eEtjPTIvXY4ebI=;
        b=Rr+85MRm+iheLRw+ObuiBTxipWIzd1BJvxTvJF6lisuBbJwbujEF2kdwH7Y++81ub2
         OXu1VbhUuc05si522GDZgL0m/owGoZdboGKZkMgvCSRxvrJrndRi6lfBaDN4SwV0yRWt
         xOmQWK78BUHguaqrpAregamUsyv+SXrT248zEDQhdOV+IxTfgYsJhUnko3bs5aZjNYBj
         ypm+oiKlT6vH+kEo8nDzPBHqsEDF35/K3fsowKCPOnrsSIEzpO0dNypStHAGMIctBByU
         G4JPBlRzqvxSY+0OnhHcsc42Yy8TCWbpl243iF3DOrutKmXcYGwCGozbqfwEA/WAYmPF
         uMSA==
X-Forwarded-Encrypted: i=1; AJvYcCVjwUIz9PCMNejZUiLTebL9nfnQEzA8RNU3frlCsFLf8F05aShDogO0K1p/2/N2wHK2DOhUnydgI2fKOnfeqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7dHKZovq08TH0Bu+Iy4sdnHLvqAFlujsEzw6VNN6IR0XbrRog
	BldxiI7EEKAUoVqtmwRrcrUkbKeG9T1mSoSMxM6XL3pwltZiQQruBHxRogd86q1o5UubR6Gg/hL
	r2aE3ZeFUEQNI6Lulha0GOom9PtN1KqbcxcxHt4lqo12XCdLFNJkx1B5x8gs=
X-Gm-Gg: ASbGncs5fAYSyP2bAVPp1Ix2cvopTe3x5AVhUSaoH9geRReB0s3Utx/p5hLKJt95+Hv
	Pw4XbCcO61eWOzbXqZOkgLSNzUjkQwJcIo97573EzFm/70HrzntAP8Tt7Yxj+9Yg1SMfexnOLi+
	3VkoIGPQoneKptYcHYtB5TUy1FxM4oBG2ixwGS92Nhv63sDE7hmdqlMkdiQLhaT+jfZV9us6Sfw
	EpOfXSdubC+DYPxqyjv72/op9/bKXNOVphy04AsKqmH
X-Google-Smtp-Source: AGHT+IGeH7jyX9ct4ZAzKinokBQ1+zc2FEaXfp6pE5j81gEVTiuyh5DC4nkYapGmxfFWYMAqNWcHbugCP2vmV3t5O7Q=
X-Received: by 2002:a05:6402:21d4:b0:61c:c08d:359d with SMTP id
 4fb4d7f45d1cf-62d27d84e7amr6983a12.4.1757441196486; Tue, 09 Sep 2025 11:06:36
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909092707.3127-1-yangtiezhu@loongson.cn> <20250909092707.3127-3-yangtiezhu@loongson.cn>
 <CANiq72n7OSCUzycAQXFybx6BSVnj3MWAXvZj7U=AWf_UQwmO+g@mail.gmail.com>
In-Reply-To: <CANiq72n7OSCUzycAQXFybx6BSVnj3MWAXvZj7U=AWf_UQwmO+g@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 9 Sep 2025 11:06:25 -0700
X-Gm-Features: Ac12FXyLkTDu-xW8KQeBG2jwxZmVi08cxdiK25_6D-p0oCXaRRpW6X0CHqv7ho0
Message-ID: <CAGSQo01mQfcU1EiW53be1hcts0c1p-HQAab_HBk6VcVmhq3n2Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] LoongArch: Handle jump tables option for RUST
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, WANG Rui <wangrui@loongson.cn>, rust-for-linux@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 3:16=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Sep 9, 2025 at 11:27=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > +config RUSTC_HAS_ANNOTATE_TABLEJUMP
> > +       depends on RUST
> > +       def_bool $(rustc-option,-Cllvm-args=3D--loongarch-annotate-tabl=
ejump)
>
> I am not sure if this needs the `depends on` -- from a quick test, it
> seems to run regardless of it (and your `ifdef` below doesn't care
> either). Cc'ing Matthew in case he remembers why the docs mention that
> the Kconfig one should be guarded by `RUST_IS_AVAILABLE`.

I think this isn't needed. I added it initially because Kconfig was
dying when `rustc` was not on the path, but I'm not sure how I managed
that, since `success,trap` should guard against that (perhaps I was
doing something wrong in earlier development, fixed it, and didn't
remove the restriction). I have tested `rustc-option` with an
intentionally missing `rustc`, and Kconfig doesn't seem to be taken
down (and it gets a no answer), so the change to the macro means that
doc warning should be removed.

>
> In any case, it shouldn't hurt and it is only on the LoongArch Makefile.
>
> If you will be taking this through the LoongArch tree:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> Thanks again for fixing this!
>
> Cheers,
> Miguel
