Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD68732F764
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 09:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779699; cv=pass; b=mOU4BLAIrgwpx1uJ2aY5v9VshRZ7nAlJU97WuvB/4Rqskj4eq+vOAFjg79m38lojWS8HsQtTWK6Fzs6ydnCUUKbd5eG1vz/6wjEVW24EF62LrrQQmMHUe7OJ06EZvnbKTbVrTgrn/lkrXa3hf6U2lDAZwPSc1lBYTrWldq21s2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779699; c=relaxed/simple;
	bh=24mAvrVLOVnE/lLbHVj5zo8cPF9XquEPIt/zXUAz6ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3o/AEelO3/VJjYTdz4VeawR2KuRPe/0nTjnvUcwF4akcM1/Pe/SNqZiNGjfcY6MS6GKyWCgrQ4PyeJi9wgd0jKyn3ZUjkn1gBIpQhVK0r03WFuFtG2KNk5o2/kFZrba3XbjSNPfzK5vgT3Poucz1b5oxhJd0ztoZcjt1tTLBk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwi5OsL9; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwi5OsL9"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-11f42eaff60so118062c88.3
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 01:54:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767779697; cv=none;
        d=google.com; s=arc-20240605;
        b=PwBFvNPDenP8wXVUgSYr3O9Q1/WR6NFIKRVEVmkgMSGkkHRUus+HVY9noo5xFFKf8x
         r8Co7HviWrt0sPunH2yOOG5Y5iHo6DPaHFwHzdq3BulTIOHylsUHmeNOf8RP1IEmzKLA
         Hu2Z569DiKFSgRK8BlInkdtX0pk1ujs2o+/FCiHHOP5c8zL+ZHWSv6aedShWURKpTKM+
         AMtjT0hlKSyXf2ZxKZgO1swQzHBHm2CXTlrl5oOdUdt6WcnN9ij9M6Vtty5r/S2F0OEm
         ul62ilo5OS4DzwhV7OgC/Wo5kFKFT6VGL4LQ8WYUwO3fwPLDOwF8R6mJJQ7JuyIqokPK
         MWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DNklWQLKHqeVwnmD3yegr1azyeDrefunLPFH+C/SJKs=;
        fh=ZWUAnvPOuhFLP9SE+bQWF3ZYGqHcasaQIEhw6VXzHOw=;
        b=DtQTzf2t2HklgQ0rz7oxj9w2fYhWM6RburEp/0cHYi0YW+hkkAPPiRxi4+i3kl2y8B
         cvTyp0PPrplednzt40P9s+JcwtkbEl3SnjKPa4dIiMTd9Hrm17RoTgBeUbzBCEa/wMtn
         Z1kf3iD/aHhE9K3QW/jo2WSfJCK4XYHKucpgagFMg4sYfbuIRIChuFs5lWzW+fgDr+7c
         AzHnHVO9JZG4z3Squlhu+jJ8o+N3O4ixix2tl/R8BPuILZZFQigBf8pJQP2Yv/zYwvg5
         0P8CIINIfGQd8LuHveX8OFwUsH9bJ3CDkPNYovljYV3zEMe8O6c1ExNPgcv23GzaxvRK
         O5ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767779697; x=1768384497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNklWQLKHqeVwnmD3yegr1azyeDrefunLPFH+C/SJKs=;
        b=iwi5OsL9++p04BNRLBF0w4VtReyqOjC6ujZFkfICnjw9rpbORH47TmBi6i/OOs6QGG
         NZJjs4dhRW6EcMxivMjKGMaQCUWE81Ies4Sr8YQiwdI+igcYSJgTDCcGKv3qk++jPMX3
         Qz5KTMjgKau79zBYkJoct0DlXwuCoV8aDhvPeT8eUo/urUrU29/+GR6ZT/b4A/GHjDiw
         egsfUjLZvorYt+N2C71QvHDigqJRXLWauk6mfrIGOGty1FpgXrrqk8a5bPiaojP7H3E1
         D3ogJWYI/Bow2jXCUTeZJzRI9Uro+ByZ/dMdsqcNKbnLty29e0sbpoVNsiOkd974i4VC
         xuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767779697; x=1768384497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DNklWQLKHqeVwnmD3yegr1azyeDrefunLPFH+C/SJKs=;
        b=FlOsKKSCiw9sgBq7Bi5mG6NTTcLx7GR5TTWxE1jSFSwODm+MwlFpzxPxuOfPGEsRYY
         LE63Nh86xP+qMxWCtlC6EpGYy3qk4YPccSFXNn6qTD/wtFF0k4hGO/hjfsWBWzGnnE8U
         nVbcBd8qUS+GdYHJR0Wpwix5HllMvtgiHJQ0+0pg0IHMTODvpNtQNBKsTMmCik0kYRBs
         XmuHrWfrFItodCOMquwPgPMU0jMjyIHI02t90k3VO22Bq8E4HQUQy/n7nBY77tH+L14c
         KfquNWmUVLJ0P5Jc4KuETqusydUnPDafYuNZApGf1LfIR6MC7XGM4ehc9+eSJVHm4nud
         vKkA==
X-Forwarded-Encrypted: i=1; AJvYcCUn8ev7sRuCMaf+DbMPr4c1bJ/UQLojG7ejbPGjVz1OjHflZax07Mw8IMSvgDQA9WyXlqPSFHZzFUIf08go3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmHRQV8eEShKWav11Swepr2Bdkn00LwqNxzMCPvjOcqCQuoRv5
	xqmFLh3NbowzVR31MnFuxrqiNbNyZxPdGSEP1xhyeFW5gR2L8jxHIIlwxymA2e6kyHtwLEV1h4X
	IG3KESkbYW5AevOZhDV6Zb3AkZKSQUPI=
X-Gm-Gg: AY/fxX5n0wFHwcWvAe/LqZHXJ+GOhNrE4HzjVH7XxNuQ8S0v7NcfLou+RwcVvGjVfBm
	XHE9jphdvTKmsPYLSAbIvtsX8Ywe6LzJmthgCx/iljPCa9ACqglrlgHCyMMkNVLklxv2v57h9Jv
	IbtiFH0iwTJ8JjSno8c7naDQfE5ZN8gSxK9CcoL6xCEGRMkJAPMr5rQDoK2h9OMOsO1v+287qVl
	sNXV413EIgFtugNedCAF/tjt2xaRMCpfCv4rJi7GhGr5kG19YccV3K06zSr8tIBHMiboyLRIauq
	culbfA5KQF7lcCqsVc1pmle5yqqujZ2WxVMMFs7y2IqncMMA0brntiIb1hH5wUyIrUgLTJyAGqs
	5OWcs2CXPAIMN
X-Google-Smtp-Source: AGHT+IF5N2JUpZMAL1fgRNYkRMlX0ZF+78/QhURcqpaoR7nEkqwoFeTWb6LmCpUwN1z4htFRw5HER275U6Q8qn90kVk=
X-Received: by 2002:a05:7300:e9c5:20b0:2a4:3593:5fc6 with SMTP id
 5a478bee46e88-2b17d06e857mr554439eec.0.1767779696945; Wed, 07 Jan 2026
 01:54:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107012414.2429246-1-ttabi@nvidia.com> <20260107012414.2429246-2-ttabi@nvidia.com>
 <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
In-Reply-To: <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 10:54:42 +0100
X-Gm-Features: AQt7F2oZa3tSv9MfFx5UzX1viyKPlo0JCaXiO7s089pgCaG2N6Ounr_tUezFe2Q
Message-ID: <CANiq72mKUxGh8cdZW0fXPCg20zoL19HY0GxRSDSYCj68Mp04vw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several print strings
To: John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 3:10=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> So there is not yet a clear convention visible in the code.
>
> Miguel, Alice, Gary et al, is there actually a preference already?

They are supposed to have the `\n`.

For a bit of context: when we discussed the printing a long time ago,
I originally had:

    info!("foo");

instead of:

    pr_info!("foo\n");

i.e. both the prefix and the newline were assumed, but we were asked
to keep it close to the C side, which is fair.

Cheers,
Miguel
