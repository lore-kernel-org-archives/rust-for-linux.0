Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869033E3D90
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744698; cv=pass; b=SiPQy8pNaQBdj3b9ivPhZeABLW4xgY/2Ofxj07S+PAQUjKY4YXi+ptWCOs4nHzqEqS8YU3gR6whd05ZaqohECyFoqXd6JgarUq7FLjHkwjn0OhOQFhuNjEiWnnictXER015k16/pV2FXqRNzGpVaKaGsgVttplhGjRcLXy4XZVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744698; c=relaxed/simple;
	bh=LL0VllKpGJK6Oj0wB6PKLca4PbGct5FNs2evBSBuSYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSr6jkLwvefbeHvG49Iu2ko2X+Qkk7l6TDrm6H5tjq4BvaMLgHPLWVH4/NIgxhurSz/3hglxBuc1cfaHSGr+G5bxt5rIz3jPJ+cHA1l/5z691lm31tdMA/tJOcbiXcQjXZZp2p8IGNbcAZsahh3OuC2WCxjxBZUhzbaPugW5XbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MvCMQJ7R; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MvCMQJ7R"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d03fcd26a6so942655ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 04:44:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787744697; cv=none;
        d=google.com; s=arc-20260327;
        b=ZrDUJzckC3RToEsThg8m2MEgzdymEWIAG/SdxmYupALliSIndSmlP/ukFcVHhN3ouo
         QZDoAMYagr4sehvVviMxKFsgLyuIqagjoQbmJgofkztSWeT2ovq6s05UA9i+gdITcPX+
         vkmEtRcx5MdUR3snpWZyItQH3D+O3YTUCD1CUNJKVh3RKP8HgmR2jKugoM3e+0CbZ40Z
         f+WpiC26S8JHCyojPxt5l+AYlYyXJArgGa2Luy6339JVZcZ0cMTnsf6hV9KndnlmI3HK
         /kIhBj8ihZsWOrx8Aoic/HlSx0MPlWhbERkHfcuBgAsCvuIbf3WrW1SegnnuTCpHJSR2
         lblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LL0VllKpGJK6Oj0wB6PKLca4PbGct5FNs2evBSBuSYs=;
        fh=i8StZ7CkQz2sieKnhWf7H1IvEnWil+unyC4s3cMCgrQ=;
        b=M4c9DEGs/a3NANGRSIpMjF7q1l/pC7vyFeetL8jqRaA+RqdQ0vbiXbGQ9/fIGlJ8Vp
         BgJqM5tWc51Yf1WLtdCYuAB2ANCsoKrf9FmVsjSvTymn66opVCK/2LhzWU7pVs1GPz82
         IUch2oDdTRvZzxqt34rL7WnNIsUxTKSfHbLY1daGKmzZtFkUrjuK7A8qghRfspq/2LzT
         jBxVeLz4zxnFBTJznydFay9pf+UNZ8ZX8Y4+p6DvEteKYnTpqLNapYMgP0UCcB9Fqbbi
         TJMlpuQD/koay0Zc6YpHkzMWAYr++nnimC9/VdapnLRuawdGmG9F+Qj+Jthdn+e9uIuR
         12wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787744697; x=1788349497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LL0VllKpGJK6Oj0wB6PKLca4PbGct5FNs2evBSBuSYs=;
        b=MvCMQJ7RZoJ36ZvVoy+KhMnUcwP5b6u5NS20J6Li7LMzRsM4AKV3+ZXEdnD+IDzgbw
         ZtK0q2K0jwsTVe3lMO818TUhxCFU11+6bdZABT1U2qEO4MAl40NbEsWllagrH7PFSRG9
         8Jz/6EwkqOcmcazGkjT+f4yX+lEA+eH4vH22nmipeEcRP+4nqFpTL8Z1OeihSdIXa37D
         rNYsK8hx2ewbuOdiuPKhsZPvm+ArU+tSKM480wK//OYGgq17IOrJmJFHvQBHfV3R5ERf
         6PXcoi/Yun3s1k5KFSC9vsAL7+QctJZz0wHeWLbg9eefD62o4Wl6+IyWqJRhx0iAUMyQ
         BRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744697; x=1788349497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LL0VllKpGJK6Oj0wB6PKLca4PbGct5FNs2evBSBuSYs=;
        b=XXN9AFKxr2y9DWQyYzqwId4BJ8z1jN5cp6L4+ZBcNaIfqvwdV0lhSLCIb3LTx1CJxe
         UKCq9fRm666ulV8OuwahAKONC2/dKAqE8pnHQ2WNFjzUtBTUUvMErZOHNyNl2kmbPoPw
         Q7FdP9T85CPyUfjr8dPyEnDp14KuEBMrsWN6Kxy7HhKzXPT7ZD/OJwhut756SCaQharH
         XVXurlF3ntODXb9xp7cbQ+SiAsC7WoIV5V20sZyUmjuvW3STEiQjAl085JPhZd6VXfC7
         glDJmbkK6a0onqBbbxApYmIrZL6Fa20ca/vyOkTxvROYwI1wKSt6aUp52sori+juHVl9
         DiQw==
X-Forwarded-Encrypted: i=1; AHgh+RrEoZA2fhwVwlA6XoBNpmTRNS55PIdRzi2r8ITjHQmB2bx+hdDL0G8Y6vAZR5CWseJ//cj3VHC3iHDWbMHsHQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nGUG87XSwCEkjqLlIZNFJGfq+JFT5/6PpePIdcpIii4EGcaOhq
	XlZsVB6WwRezMxM5+cPDvH/ejV2OSvbGqmBEw473EDLWx5fitJ21HhQwQJq5KvLg0S5zinGhUYp
	VU40fh7t9CeG8ZNZceshxYyrVdEqDx+g=
X-Gm-Gg: AR+sD10i3thVgoDshVeHqrx92q6UER02OQSXucepmxfSvXcs1UKCP8c6NYBUTQGjog3
	cADhRHvD4mcM0RNpLIh207p3TANEwxh6YNQbktObiHtKwGBib5wrWpxg18KF7FTO0HkjFlhEqXT
	Lokuk1BCWAX9fAOBW7RaIwLw6CggSECELy6KVFLoX7gf4HJ1thm2yfP6TNfHdc2USTOMH4jhnNP
	cpJB1T3wA2wpu31bSNEd31wi5Amc4CB95cYtpXV7T0i4U6mzGAe1UbkzO4FR85/za2k6LkuTdDh
	/uNLLXDnQ45RZ2IJEYGqUQWBrb3qMgjfedn236kDOgy+ePbMggTqeYr6DVS4BGZqlZoEPpkpquz
	fDQNtsKewzprsVZYuQLQEXhnVzAp3AI+egiC4iyeG4QagxryRdnz2Bh2w7mQX
X-Received: by 2002:a17:903:3b84:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d707b73febmr51355925ad.4.1787744696684; Wed, 26 Aug 2026
 04:44:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818084633.1673214-1-zhiw@nvidia.com> <20260818084633.1673214-2-zhiw@nvidia.com>
 <DKYU6ELNN060.154BHE2QG442C@nvidia.com> <DKYUBX3TU66J.1P5UZ908CCKBX@kernel.org>
In-Reply-To: <DKYUBX3TU66J.1P5UZ908CCKBX@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 13:44:42 +0200
X-Gm-Features: AcwNN1ViXIyYBwk3UCoSH1F24R1mvItcAAdRfKXUoySGlw38Kl_je3lenZCJsk0
Message-ID: <CANiq72m3pGr+sywbZ=woVnpbHW616VN2sG+RKYZWbWHAehRvvA@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] rust: pci: add extended capability and SR-IOV support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, aliceryhl@google.com, 
	bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	markus.probst@posteo.de, cjia@nvidia.com, smitra@nvidia.com, 
	ankita@nvidia.com, aniketa@nvidia.com, kwankhede@nvidia.com, 
	targupta@nvidia.com, kjaju@nvidia.com, alkumar@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, work@onurozkan.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 1:32=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> So either this should just be a regular as-cast, or we have a signed tag =
to
> share with other trees for [1] early in the cycle. Since -rc1 isn't even =
out
> yet, I'd prefer the latter.

We can also just keep the "old" interface and remove it later.

Cheers,
Miguel
