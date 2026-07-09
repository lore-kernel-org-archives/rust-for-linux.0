Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6753B42ED
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623912; cv=pass; b=bVlvsWptT823eoUa2Dg0ecyTxIwW0ChOnshpYGrg6ycTdYfeAP/1yDO1whWLBe5K3SG+p7ezexQVmFMBvBtU2QQFLGevQMCHc9uoZrwvZ3FNes/a6SsYKqblRnjLL5k7AXAHSWg+jiz6xJO7kY6YryFtsbyREYSlEbOEX6KFjoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623912; c=relaxed/simple;
	bh=HNhSqHrQHIbTEVu6bWLeszyYUIIxqj9fqyC2oMDPU1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICpqgwrm+m4VYOtJgmFGhelf6PVUQ9MoSKkSq53I/rxMrTznbC51nDbZgerOgzan6xvWNryPIrt8YDCVZmHUVROAfTTSfMOxctxSGuoz58T64DzG8TRMWEOCXIcimC+mVjlfs2v1RM9UuH5tHFAsQxeafvAZCsajyM2eQ1m2hrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqDMGfYc; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqDMGfYc"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381d656c36eso45264a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jul 2026 12:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783623911; cv=none;
        d=google.com; s=arc-20260327;
        b=KBm4JuyKY3xniG2kPZsTu1isfI20wPKVFxkUnGXxn8OzqpLNA+PpbCqUa+Iqr3wqG7
         ofKPcvAwjLEMXCneNF2Wk94qW+8NKDQRk27M7cOCs59Dg7i/2Uw52jj0sm3ur9042aGC
         dWYJj+7qRlr3ePoqEirXbxuNH1owb8+/4gtscozCaAX1Ahlr0C0SdF5s3tjtEOtDKroc
         huXhHuNJDhxx/sW0P7qwYIbl2WZV2LrPdte8T43pRD+AlyJ7Kh4Wyqvjv1zb49Ui5iqi
         UqZM5gWER3wb477XcrP4jX+jGCNtG36A0Cl5acgyF56xmc7nE63V0h52e6kwy17sUttV
         C8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HNhSqHrQHIbTEVu6bWLeszyYUIIxqj9fqyC2oMDPU1k=;
        fh=S3nx+TyI9ra0s4L6vIMIAopo1v7tlSoK4wWL6V116JE=;
        b=dq3xYiF+lo+CJ8Fd85j34w9vDKz3NzoLofRvq2BKjJxH2FhWmsa1p4ivnJovNlohEY
         3UVaqcb/dKzQh8jPHYtwe8tUePeN26cd+cqfP9Cd3x3IgeuzI89gytjuSJukcjmtD65+
         4zUM+Vd3H6XMDe/91l3sJ6oTwme+yHG1olQEaP5CX+4B16/f+60Snk0fp+iDXwIMEREp
         nOnuR1rJtwCxg5GzrB6R09Oidje2xp6sbgQTv3WyBHP4iAnPk+GbRg6TOQrmy9QeJ6FI
         eBKnI8aUOK0J2TDlSxwGhd68xS32IjL4i8k8BLsaBHfcjtabv2hNiyMohtI7AEiAUeOF
         lF3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783623911; x=1784228711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HNhSqHrQHIbTEVu6bWLeszyYUIIxqj9fqyC2oMDPU1k=;
        b=QqDMGfYcV6o+n4aMQ4Dcs6hgzFnCjfkPBiuaV42mxvjL9JWeDjcYXB0IXky2E0MDf2
         lr0fRlD0BhueGIDwnrIxMqDn1ZAExGIVHyu9E7oBkA45Bq/o5+28HoBNauM+ZE+sV7wG
         5HScJmSIhCi+PDCbvUPV0/c1u8YU/B8IxBmgB660ogxsXhuIDpLFCiU5pGv5LOdpqryP
         XmV24p7fnl0QdXm8lsFjusdECfU82J78brXeTbCLAhdCooZ0RvcFHlioRJss677LaGIH
         nZ4bjO9CxjeXAQeCCger7OrWqS/D71YZ1dvV0zed8UoebiOdBFJnTh3DkJLJ6KCZIcTy
         oegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783623911; x=1784228711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNhSqHrQHIbTEVu6bWLeszyYUIIxqj9fqyC2oMDPU1k=;
        b=UTTQoXJZIlv2Bkb9xNf1NsBUK3/TirUR/557WcumOGGrmSok2EnabncBzBM1F2i77U
         f2YF6Tyu1d111XtsvMe4rzEZVAhf316zwDAeqdm+E1yYyL9xd4jX6OzI5ZCJ6GR84T0g
         Ox9T3Tp5MU/Vdv0ZxrZK6lz1JClYvDG2KJeP/ipmjgA/0WPyL1HNSfPOd+HTnvgL8vv0
         l7vUUPyeXhjluXxje1JRcxAHjRz/UHlXrPalgLjfCfQ+RufGmJT3dEni8bBTb1HJ56Ay
         9mAPTMWbXrrYPUvDPb/4EhzXBiwjYrMYryKhhOkVykCSdRi9IYFcQ6dBTTWUkDmTlI2Y
         dNYg==
X-Forwarded-Encrypted: i=1; AHgh+RpzYqHKZes51Wz8E20oAmxM9dNM8JnTiK2er1ode17KR04btlP7pUAsUz0BN9jiYTDqLQMMLyhlWjthzQaKxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqlW8fL+NR6h/Zz3G2Jb6V98Ly7pVpUxBKdj+2Sw070z8GZwal
	3cSsJVrJIIZNUxvXl88gEiacfYN/E6ZOM0/dqE/CST9kO/bGSkP5dz6+jSgl1F8LePJ8lCENQ7r
	YZt2jPecxQ2ZEXMdGohFFl4WDrf7LESU=
X-Gm-Gg: AfdE7clpzp8a6mgybXCNkJAIlshpotg2WpM9SuC7gPAcK28mWx4k/f0Kb3plzds0/9D
	PtkVSpkZ6cYKBNVdCLQOVRHkAyOM9EyH80UF6SidtC7sw7ndsMCHEDXHq0rZucpWOuud6F5khiE
	ySBzcWHtXCHEKZL0Sng2y4ljX9v2rJcWUQp4hNaPOu0jlNtQAtZQ0rqPzeCKzEzfhBfUshbGHD1
	Jzvjdi28nxi9+C7IqORLkO3xQuW2+T5A3rSsTUNhqe87I5ai7FZSi4QyXWZ/lSRIaSZFQS4op93
	kOIx2vsENrdC7AbhedIrG7bdqZHQpf7zGvD9PtVo6IiV47ZcqB/v4b3FE8MwepgsTHX9uP43tk7
	42ZUwwdeNXROc4egF5kZzKk4=
X-Received: by 2002:a17:90b:58c6:b0:36d:b30b:14ed with SMTP id
 98e67ed59e1d1-38a1f1de22amr4261994a91.2.1783623910451; Thu, 09 Jul 2026
 12:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <akKBVsFBro_4QM74@casper.infradead.org> <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org> <CANiq72nQ=BmM0GRVrcmXHfE6VqD2hsssxqJEE40TirDiy82+wA@mail.gmail.com>
 <1F884E12-63DA-4A65-A811-C2D40FD9B5F7@zytor.com> <CANiq72m+YTQ7NG4m8h7ho+GCkx_1Gdk6WuAeZ+KAORiETytWig@mail.gmail.com>
 <AF2564E2-7537-432F-B6A2-4CCE8F746BBC@zytor.com>
In-Reply-To: <AF2564E2-7537-432F-B6A2-4CCE8F746BBC@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 21:04:56 +0200
X-Gm-Features: AUfX_mxlayaag3-kx4SR0EgjgdrsJvDbEWYl_EdK7BAhqdu5ATkc3V5L2mm4aHo
Message-ID: <CANiq72n56wPBgRfSr0nrDj4XGF8_rnGm=axsvNvhOG1=1_NuSw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Implementing malloc
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Matthew Wilcox <willy@infradead.org>, Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 8:50=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> All of the above. It has been a concern of mine for a very long time.
>
> It's a really big asymmetry versus the C side, and at some point someone =
is going to want to implement a core subsystem in Rust.
>
> "Two Debian stable" is a blink of an eye in comparison with the stability=
 criteria that people are demanding for gcc/binutils.

I still don't understand what is the concern you are referring to.

If you have a concern, then it is because you think of a negative
situation in the future, no? So what is that situation? i.e. what is
the issue?

And, yes, quite a few people have asked about implementing a core
subsystem in Rust over the years. If it cannot be an optional
subsystem, then one will need to wait, or convince everyone else to
change the kernel policies, or convince major distributions to
backport the toolchain, or similar.

It is what it is -- after all, the point of the exercise was to take
advantage of the features from a new technology. But I don't see what
the concern is.

In any case, that discussion seems orthogonal to the allocators one.

Cheers,
Miguel
