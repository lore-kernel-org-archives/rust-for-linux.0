Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CF415D5D9
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726138618; cv=none; b=otitWpQVq0FkLEuX3IY1fViBu3S4YKEYa3olaQZvoanklEBTDpstngpm2AEhymgxt+LHrS6TnLt6ejq2piE2U8cVMSwlBBjdAXNjWIJX8pRIJwRas8HgJ5n/3hCteO39Spejpm76xdIh4PrFNJgPyxHgbEgtykRZqhkU+e94mag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726138618; c=relaxed/simple;
	bh=0zBaW6FoSAGEA5aXcVhQmzrQ0dLCCMuYJiT3vu6f/YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UY3szgDqpSvfTd1JI3x8sGcuIp9DyP6WZqIPvv49Jjav2MQwGjwT4SnjWSwoSuacIbMdmhRrsiZvKGrEcaMqJ9dtR7JiGlbznBqfpwI+201bOtmsF9EbY6LHlGn5Yc857oRf5z9O+Ag/NNm7hXhxuIU0RUHUjNneH+E9vdWFyZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SzIHUMmU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SzIHUMmU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so6731485e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Sep 2024 03:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726138615; x=1726743415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zBaW6FoSAGEA5aXcVhQmzrQ0dLCCMuYJiT3vu6f/YI=;
        b=SzIHUMmU9B46YtrCu6fcT42zLMvXcoY/DqAaN7LrBnNu5+98nLxjaNPH1uavLR6ckd
         KHLOBMC59sFlDQmYW6+XDbepyOBA0jE3IRv1+qpX78E6e6MZEdRSv88wlkt9GcN8mpgk
         PVz+qoDILeUA36mq5JtUtwf8QchhYm/C8fGutFB+L9cyqoxjvVU2KrSh7Q29jM1DAM3G
         7tkLg+gHT/y8+zXPZXueDdNqdOJYXm2EueqIKLnbquPihfvb1clFAM5hdK5YHTdFoFOq
         JJvLkhWbDwQDNYOks3NdZk63Dvleld2jv5DOTovYc5kAGE3NtPJXqYh9veYeB51FUQEq
         ePtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726138615; x=1726743415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zBaW6FoSAGEA5aXcVhQmzrQ0dLCCMuYJiT3vu6f/YI=;
        b=LuthX9FJPIekT5GEfKB7pIDUA2zNxMWgMerkPJIctZaGu0+Y0ZAN4rS5ec0Pu1rDII
         qsbnZ/XrvYoGsdkNFjwmuZ0eqbUgxH94CgQ/3OMmzUAcTLD+kocb/Vt1O7s3C5F1Wpw9
         KgC+h3K7R9qaCfXKNKJmuRG9e1EhRF7VfrmfYmJ5pJuhgo5q+TaKP6kciJr91+y5UioG
         4ks/c1msYZsRj3pJ0nq3wMaoQI++hxxesS5vq4OH1GgE1+0H4QBLBVynmClhshdwVfzA
         8gQkJwyIxOmlZZV3rNJ6HQXaS8y2+XsSCc4y47cTfxb1m4VI+16EQHDwQby+dmp4+e0Z
         gjhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZRibAqquTQH7DwkdpKPhl3ZdXbJaF4nr1ErVLT66iten6dS5ALx5erYPv1WQ9I+GEDNe+8IzOSpXNaEIHCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7QjwLyWfIuXHlSdmOPDiiLiceIOGIMPVJt2u6YYIHiCrMzKuE
	0HFCTfFqitsl+2/6wgB4zYMl7rc4vaGMnGoh6vZxEj2/khjUJ49sP9zGZIQd0hrgpqCdVOdPpgv
	cnV5gZwhTSQ+A2G4/GRBNvSqOSwC1Yr5e2U1+
X-Google-Smtp-Source: AGHT+IF85e2LaHgSssaBIQhk7y4QJ1PfgZyYFIj7atkVMNrN5Jg+9CBt183CyTGgj+TNOdNdfN38bXgAIbtAJRyfGWM=
X-Received: by 2002:adf:f901:0:b0:374:c318:2188 with SMTP id
 ffacd0b85a97d-378c2d51913mr1228312f8f.42.1726138614369; Thu, 12 Sep 2024
 03:56:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DM4PR14MB727613E0669989AF7E12357FE9992@DM4PR14MB7276.namprd14.prod.outlook.com>
In-Reply-To: <DM4PR14MB727613E0669989AF7E12357FE9992@DM4PR14MB7276.namprd14.prod.outlook.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Sep 2024 12:56:41 +0200
Message-ID: <CAH5fLgia5Vbta2xFB8d2T1Lzcqsq=aSocVFcvxD=dVE85Ucbxg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Make functions accessible outside the kernel crate
To: Filipe Xavier <felipe_life@live.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 9, 2024 at 9:59=E2=80=AFPM Filipe Xavier <felipe_life@live.com>=
 wrote:
>
> Change visibility to public of functions in error.rs:
> from_err_ptr, from_result and to_ptr.
> Additionally, remove dead_code annotations.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1105
> Signed-off-by: Filipe Xavier <felipe_life@live.com>

The title of the commit message is very generic. It could be improved
to e.g. "rust: error: make conversion functions public".

Otherwise looks good to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
