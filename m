Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E27310785
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770223148; cv=pass; b=LkQQhnqSPYitARkZq+fB97LS8DR/9LURPOHK+6LcSAbLFXvbjD8R0LU9ElwOjSqZayuhNMJ8tdwif1lV10wDQjjL+XqX3JjY8EAJDuptUkkMOxUdICkhpOIkqq7Dz1EvmKj3Mpn4RJyqeepww6TdCq8yJzsiVqnYXLaJc9taFAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770223148; c=relaxed/simple;
	bh=pQfKx/zZMb/5GQiL5/rdCk26CG+Eyom1R6Rljvs2ix8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwz4FnL6IDWPtw6AbEuQP/aYmojArsHJMfNPgjUq6Ch9RwEVBj3PEM6PV81U0fUORwyq0imVxP/10z2ECJQmN3WvntkTmOz13kJ9ZujZIzgelM6vcRTcFfkJ4zzDVdA7s1E0ustGS3uFwMDf+BKVBMZ/NbmDf543AwUmA+yjbik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R79zRngP; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R79zRngP"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-435a517be33so43765f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 08:39:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770223146; cv=none;
        d=google.com; s=arc-20240605;
        b=ZdmEEaG3jMxcb4PC9N3pp/mE7C0Ocqa4+EKdGOxhPclFTDoK1hKnta8Y10zEUraYwa
         4ZT8E4rCNL6KFVRtyWkB70WvQBHpXQHUToLOUcqGI9ixPB30+kvLcMDZYRABiJNqoy7z
         N36z7XIHBfSIfH6hObm1kX7hMsNpKJCXD5Cwn0CM51BqLTQNBjEcbQ+VoVsXimlWqnr3
         UwDfhpC6Ck1OZ+wXbynKvqlcxB/7vr6ags+86tBbpaWTKBxwaa/75SeIIAjjvVrDDCBF
         P4TtlvRAeyyeadnAtYLeqhiBvEKV7JLIfVlT9PmmBslkywfmT/hdhBhSRw9S0FqD5Fcl
         xMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pQfKx/zZMb/5GQiL5/rdCk26CG+Eyom1R6Rljvs2ix8=;
        fh=VXGSl30iz4SdUf61cvQ0mLkWvjIzrzksYNJRv0axD8Y=;
        b=eAYeyKETPNc5wAoKDgHgf5pvTC2HqN9NaV1p8+kuYHfIupPsxGSYyzihmckiDrH5ll
         bhT1JbOzLcTN5vr1QTqFnnShfiMcHtL2GkRQSkLBl3+cPBSU0fFpaxU5EgrHbUzUQDmA
         WUF67Fsk3YNw+A4OKtrHKVJs94QJMB4auoZliyZAwrX4lcdx9vS6WXvQKqAJ7e2T08l8
         vmUMgjtrTOHZyDRONQV/HS9TjrBkgh1h8GW9OXxgsMkdbqAUL1g5GNP3QHIG/ceH+h3E
         0FJXEq6XsT2sNnLZiZEPZ7tfB+z9AzE2BA7tgtPxL+q0h/+2FbHX/LdYiNCoUas0vfMe
         +ZRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770223146; x=1770827946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQfKx/zZMb/5GQiL5/rdCk26CG+Eyom1R6Rljvs2ix8=;
        b=R79zRngP/iN6pir+oLTkmTruLADdHs3DIFOnUv7IswZJzQxMnNwpxQslmdbwFc31o3
         6S6ABzrHzGj+aBOS+lsqQik4qJr9CZbkr4uKX6OD/Q0Meowl278JhW0QEB1Cpuo4TREE
         DI3aW5+dzqxXxxf96XEPinfjNn7mTCCsReV+So92g20fxMdgrhi7yWJepfj4FHAqqUbH
         lFiNbSMBZH+Efe5zicAE7PiPLzM9xziVATGpSmcv/fjEgiIpTP/jL5WOsiDylvHQ46jo
         LDuelY/djUVH59u/Mb1pATpZa/OPmEVeC8l5+vOAYukqaMIVqhoeQ6vhSgG4dPKrp/8k
         pz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770223146; x=1770827946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pQfKx/zZMb/5GQiL5/rdCk26CG+Eyom1R6Rljvs2ix8=;
        b=iBWEUef2zj5Cg3h8b9cZxwStpJ3VKzc11WEj4qm6TGKpRQOqi9hfD7J3QmxI48FkZP
         kYkGXBVndicF6T/wM5HXKyahfwZ/mE3BOLRR2Aq4xUwDOy6/GvaCftFTg7wZ+umE6L/z
         Qet1aWJTX5pCszat5GKo3A5ypRtP1rJjpk92spq86fc4oeM6wTFZT1OQRmkUZT5ssAl9
         8+ibF7Zb2hzFDqm58q6EPekbn/EZ4bbZrV6MHsgjA76lYURCNNfy9XThPJ8jFL+3HVo0
         cKpGQeTzW4vh+OofRV546LxqwJwVLm26HQhcCx8O2t3DmzyqqakbXbAeZ3vwny2bF0ct
         cOqA==
X-Forwarded-Encrypted: i=1; AJvYcCUGjPdkfOtQt1sI9Q++KjxeNaDEnUMfWwWLGQPIzdxReVnF1uW+GJkp9SqNVhkTvFiymSemaLL3xPpUxuFP+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXHgYe5RpYtQOlZYtNRumqKHBeHjkBUTaMhDO6fNnZgaaBiWIE
	BDVLJpfShiIKw81jsrejqy82GFv4JiTXl3iCmrQqOn1pZLwse4/UCRrOUCq894iey0wjxS/zU6o
	zkvLIwd8NjUBDkOC1ak/sUAapF1LiuGlJXNHWcu1FshcNke7EsE/3/LDb
X-Gm-Gg: AZuq6aLH2Bm6LpeBH2pAGA/rgIW5V++I2tCx1d66aCJcvrs0zMWoxPeel/9GRj3wTpt
	3BOWCMWD/B54UQMjzzANvmuCrgS8lEju1XWPCem8r9FyOwXwMgFtCk+1CRtJTh4C9cGK1gJDN/4
	jRXLRNgF2ZihsZfah1DfT6hVQdyecIDgVlaEkZHcl+GU9L1FSpNK/RGlyKS4Vp5BoZ3AuZfBp61
	aPXkZZSmIYi+PXmHVqNfrvJrBByZHfQ16qxxtFJ1uknSWotrWWeWder/FdewET1FbAHEBA8TeGR
	q2jVKikukxgaDc8lYErALVJPMg==
X-Received: by 2002:a05:6000:250e:b0:429:b751:7935 with SMTP id
 ffacd0b85a97d-4361806302cmr5078621f8f.56.1770223145871; Wed, 04 Feb 2026
 08:39:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204155037.325482-1-marco.crivellari@suse.com>
 <20260204155037.325482-2-marco.crivellari@suse.com> <aYNxkG3gCspeeW9_@google.com>
 <CAAofZF5GZ9UBLNH_+NRSyXW1114d++TfEc3EuBiCpPkdwK1pUw@mail.gmail.com>
In-Reply-To: <CAAofZF5GZ9UBLNH_+NRSyXW1114d++TfEc3EuBiCpPkdwK1pUw@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 4 Feb 2026 17:38:54 +0100
X-Gm-Features: AZwV_Qi_j4XbbfYL6mzBs61MD9PKdztNwxp6ft8mZwmCZgIsGXGTfutStOMDMNI
Message-ID: <CAH5fLgjwz_WmkWDJrZ1d_HZ228-whdgQkMb4WnmKu+g3ktEskw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: add system_default() around the new system_dfl_wq
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 5:29=E2=80=AFPM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> On Wed, Feb 4, 2026 at 5:19=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
> > [...]
> > I don't think we should use different naming than C.
>
> mmmh I think I misunderstood you here then:
>
> https://lore.kernel.org/all/aYMk5skDB0Rk7vWS@google.com/
>
> What do you meant?
>
> Thank you!

I think the ideal would be to rename it to default in C too. :)

Alice
