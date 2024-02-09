Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0B314AAA
	for <rust-for-linux@vger.kernel.org>; Fri,  9 Feb 2024 21:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707514913; cv=none; b=SENRxa8xW1OJPtWz6wctRIEEGeWGvthj5vd53RbgxO4pxJDDaIhFCPPijdQBm7Njf1q6lBz1HyWgGb1oIKaIj+2wqN5M/mgh+x02wNCfLkHoTRkgOYAYBlpCpzosQP0NBUTs9W+r3Gmnl1tnjDhk326p9INAzohkovhlqIMHeso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707514913; c=relaxed/simple;
	bh=V78Eh6NxvyEmMKBeKR5uZWsKtd+HhCO6qX5q2BSIHMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nyXqAxyvqifDUWq5AdqY4EXavqs3wrmQrMbTI59z9cwd9IOR22/8sUK6mi8iNjd9ntiaqxXS3TP1L8YLNPqGdj6KtKdWJ2GJvQIJcbUdpA+0wN6dzPUmpAszspglm1sMt80NfRxg1lOkRv3yqcdzJ85gDFx2MWhrps04mcd9Uhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCKSrI6m; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCKSrI6m"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so2174709276.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Feb 2024 13:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707514910; x=1708119710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V78Eh6NxvyEmMKBeKR5uZWsKtd+HhCO6qX5q2BSIHMA=;
        b=CCKSrI6mOcJ7csShbRgmA3AAwp/ujXEtD9h3s6Ha3Xn1i3YpGy5raWoLQ4xdmaYnYu
         yT0fMLHR5z5kjT+pc4HwsEYcCmcOhPaaR9SNMUgjk8qm8NWBdJdz6vE4P4Lu5Ou0y1Cn
         h2LdMKPBXPY0j47cBQsaGmLf6ZWu2cHoNfPbp/6+OHK44bSfoIexRBngZmP2+QEniIby
         6HbqKLeUHtFfawmTO437A4KdXp7Vx10q32/mM7ISvMg4w25K9R16gPn+Toz1bBRAehhC
         3PvHkuS38zlb60kdx968HgMz2py/NPpK88RcdPM8E85M5OpvKk4HnDtJFtZNB4UDxnj0
         vqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707514910; x=1708119710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V78Eh6NxvyEmMKBeKR5uZWsKtd+HhCO6qX5q2BSIHMA=;
        b=AUIZPMtTuDsRw5m186IxC5cfRajRQgvwLQ15DQYAV/FhHLwiMinfXP0fn+wcmOnHgT
         xrJtdMEUJQ3XeMEEqpu5EZ0iW6LbgVdnxY9E7cP49sTFEf5JpTUmsMk6/yfJctJ2HPqu
         wEh+ccA6dhZnCaOl84Yt5BYRXZGwujC30EIhHC9wCPcjjSNoaSXHjUCaoHu1Ar/L2CIE
         NTYuLgdjCS6V1tlXqxIrs0lSHiinZTnKcq4o7BPrzanhFN0nGEE/KJVeCLQZmhodMNxV
         kcUA4oKmyFEZt5EknjhDp6Ecj6mDZVo5BnYlNdrWqzvHDBjC4GG6VVBIrS+m2dYOH/XV
         HTcg==
X-Forwarded-Encrypted: i=1; AJvYcCVXb/9TjnPgUy9BpdUrZhAzcHoDvY0BA0aCvzkw6b+JalmZx9cCs7J83pD/n9SaBT0yVvaVqJ+vz53ffLrPTmBsl/tUqH0p/TQKxiafBnI=
X-Gm-Message-State: AOJu0Yxp9hc4zlGmM4J+44W7QuAf6u5viDxJai0lm0jMppVN40jkFnqI
	Xn7LFKew7OZUaXzJUSZ0/geVn741RyrbcbmAGYA1Zc8i2Tqsi8Q9dnxdXXvUr0wPtNcJdMC1ym6
	glB/agGcxIS4eQ64C7bhp/GueKfkikg5/Q1qM4Q==
X-Google-Smtp-Source: AGHT+IGSwq9GdG/BVRhzC7Iupyni8U9NO3hjB/nhrbFG5D7k/GpcOVOAZLYNQkFAwh0WjfTWRRMpwSq7JltCTlbwda4=
X-Received: by 2002:a25:938d:0:b0:dc7:56d6:81dd with SMTP id
 a13-20020a25938d000000b00dc756d681ddmr2031156ybm.1.1707514910590; Fri, 09 Feb
 2024 13:41:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com> <170750002897.1210949.14507303616035197246.b4-ty@arm.com>
In-Reply-To: <170750002897.1210949.14507303616035197246.b4-ty@arm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 9 Feb 2024 22:41:39 +0100
Message-ID: <CANiq72=VOHDUkJTaDgwM_2rk4UrNa3MCnvn2OLPu9SSs7CPJmg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Rust enablement for AArch64
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, steve.capper@arm.com, Asahi Lina <lina@asahilina.net>, 
	boqun.feng@gmail.com, andrew@lunn.ch, Masahiro Yamada <masahiroy@kernel.org>, 
	WANG Rui <wangrui@loongson.cn>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 6:38=E2=80=AFPM Catalin Marinas <catalin.marinas@arm=
.com> wrote:
>
> Applied to arm64 (for-next/rust-for-arm64), thanks!
>
> I also folded Rui's loongarch fix into the first patch to avoid breaking
> this arch:
>
> https://github.com/heiher/linux/commit/c504d83a6edd963e2ba58ec538e3f06da7=
8b187e.patch

Thanks Catalin!

I tested your branch `for-next/core` at f735966ee23c with arm64 and
x86_64 (and built-test loongarch64).

Cheers,
Miguel
