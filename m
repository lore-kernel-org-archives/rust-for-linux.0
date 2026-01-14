Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918DA38944F
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768386585; cv=pass; b=CwirfCpXKLRO9eWhv/C09sEHJj2lNXtwr5yYJsRjHoBd9LQBOnly5GpORVKwvOiIp6xnhC8h1+7CPdYOZQPccRb8sAxTU1FMkREiwrbYHgkqRQF3wdjRRpSy3cFtUEAYQK2q8zlY5W+ycUwUAei+rS/8H6k5th4uvmEPOPtga0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768386585; c=relaxed/simple;
	bh=S3k9Lsg0CNiK+/FQxhgkfhJMpRNlGfcTuHfOM7KMUxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xi6KWrDlUSWhazLzSW/7B8IfofJz0UJuhDBq3+eRNQQYL0P6NT6bylYWuDOOm19vh2NH2/gJ/BwYBXm9zLRx8vExa0B3UCwJfLMcpayl72K5EQ4O2V10LTwZeTCv+WTKv2gZGuC4rYCvSjs67b/IzdroQKvlWpj8CklI31MpLbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXboTMgv; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXboTMgv"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2b1161400afso416396eec.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 02:29:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768386583; cv=none;
        d=google.com; s=arc-20240605;
        b=CUtSk9ZrzOPYCmFmlQPQ4S83Zm4PX+2SV5AoBRPpqDtpnMtiwCuoXmm0a281RUnHnU
         /u5KrpG24r9WPQ68g+0BTZD3FWRYeCfmoABNSNYD5rZ+6Gm6IQeYkjP/AJIBXcpx080q
         voWXPcv9XiGktzsYWgAgFySKjbajg7W617KvQlYjg8a2RNWlV53KrXOMW3fgsoVGFs/v
         ZcTjO00hdr6T4x1dBSB1BqOExnIRk1ZHjeG6KXd2j5On4y+VxWnaG3JlTpnLTH/+o4c6
         dqQTvxjlrRoPqYJqe6FAJkMT2sUacoD1sQNgxzO/jOe4g4RGCrNMZyy+Xm4o44f5JZb5
         mOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S3k9Lsg0CNiK+/FQxhgkfhJMpRNlGfcTuHfOM7KMUxc=;
        fh=Hry9wGm81wb0AMUgFLhXBFbCW+8o9DMlVkJV6XvmMWs=;
        b=LkqCXdz2Ze05EqT8iFH4hpmQ2vYhm2bVamUhmkLLtQdwgJVIyZ0rBvIYLG6CfQwd/t
         fy8f1mv7TJ/qqmulGpdWqxSOSuouFXOoeEYIcjkhLLoYfPDeDRRAfCX8G6e+XNmM/BVc
         tt47JmLl3tmqDEquLtU6+j4thqVDkrAvXTDKTM7O7kdWv0IKFIHTw0M3rBvVwOiX9O86
         QRRWoTNQRKowqMBMbc/XFrjz5rLhM9UijhRokWvLZUCd+QhfTqD+CguUdp2ELLUUL73G
         lQv5DRXpbB2PIh7+MlqIIvhevxdEWeqZ9EkKAeC0fkOBgynvYytRuRb0wit32sgmUQso
         +4zA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768386583; x=1768991383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3k9Lsg0CNiK+/FQxhgkfhJMpRNlGfcTuHfOM7KMUxc=;
        b=RXboTMgvv07otKrtDpPiwIY+t3ezmXT004aMe6kw/KJ0xA/d9PHFzceE/AYF4fooJM
         eWe4UKKC8/tOL3NbNqLJjmuVlIJ6O7bpLCcWaM374C6qosSQTjbD38tZD0s8deiXo2ON
         Rmeea6wZZb0dovTjpv7lj0NUipKXG1EgE1Okjz2CkvJKh0CTSr2wWg0bOtFxqpiQC+Zc
         EF03S3VTEbe/cShX2GAKZ3Nvy1CzAua+6PYojfR4ZnCYooWUNfwiJMh+0luYmerpSyUl
         Qczuabok0w+/mdRsiQFcA4xXKLohQIP61nL0Wreo4+2MGjGKBIM2mhq+NamA3rrv1yf1
         NMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768386583; x=1768991383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S3k9Lsg0CNiK+/FQxhgkfhJMpRNlGfcTuHfOM7KMUxc=;
        b=n6mQmaBGRFAqRtRPEgNc2rzkvId+tqA7E2EDw6wjaZKXIhNG/r6xG4qD8BH5O4DglX
         xRNpmLuHlrnP2CCSZ7wEzkloHUowkNjm3L0J7w9fKfwU3utT7qNdzEnFz3E71x1HXc4L
         y0jNz69vpliUMOuNTAk2w2TvvEUGCV/yXFIEpRbZOF12ID9tXMqdG2psfLNSjT79UDqn
         HePWPfh9GhfAIfSSji/4XqjAcjTdR52l3KquGLZMYrHp1FXDMEhmZxJucjgwYtVJLjM2
         uyaYOWzgfb5Wu7IP8LZ2zu8Qvui2vWkX4GFFtH+2xLwgwS34c7wrllOKM5x2FcH4oCJr
         Sozw==
X-Forwarded-Encrypted: i=1; AJvYcCU+8hLP+MsGAaU4Wo40GIMcGELERN+ippSGFh8+o1umxacORBEzBvu3f3cIQ122HPJrz+Tbn/S+H+kcSrJlbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziPccEMkyBd+U73l1ilVpzurhuZAvp1tQ0GJuX4uUuu3bd4P4F
	Umkc+uOm/Cju9lkXZpUhE8ZzmjHBUTxqo/k5ms6aI0AsIlwGw1dUKkUdZ6JXpSz9tUV8tj5T/Sn
	LGJjFddf59MJeGyTso0U9kDCPZ7LnbJQ=
X-Gm-Gg: AY/fxX4kmwReRyWFCXsbCUtZo2cugj/CQLOzGI8ou+PyawQtvu7wFfAe7JzBC/htbLd
	F6CBOJPk1V2hOfrV283R5IysseZ9pc32PqOIK5GzKaXbcKgz1Td9jDGS/1O33HaS/RUy8eCi1Y9
	HB1E4MMrVHZU34aU5pt9bxLMByz9QOM0t4QxSkPiEbXK5MIZmqaNRFvD8B3i9YWzOLP/acp0HuS
	2r6yU4GON/1tg4gNRVu8/UnJ6xYT0v31h6u1yoNjs5XQWTFDAxaRC4wdiNjUSnEKdy8w+4+f50K
	PN/irtj3Uw+dr7F4wOD0k2A8OnKAxQXiO8ZkESvdtZ8mQD1UgcG+r3C1WL8m0VBBJCa/AAXDg8b
	VkMriIbM2E3Rc
X-Received: by 2002:a05:7300:d505:b0:2ae:5b23:1601 with SMTP id
 5a478bee46e88-2b48662c38emr1324866eec.0.1768386582580; Wed, 14 Jan 2026
 02:29:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723-rust-analyzer-pin-init-v1-0-3c6956173c78@kernel.org>
 <20250723-rust-analyzer-pin-init-v1-3-3c6956173c78@kernel.org> <DFO7DMI84JCC.1IAS0JWKKLNTZ@gmail.com>
In-Reply-To: <DFO7DMI84JCC.1IAS0JWKKLNTZ@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Jan 2026 11:29:30 +0100
X-Gm-Features: AZwV_QgjEu12dkUpnimM0x2Hge_BQ4iZSsNw0faAYjgWw4aGG9lIdTpNIQtUNxY
Message-ID: <CANiq72=rs4vu5RMY=hf7Q3MZe34tbq4XyOAMyDy9Nx5D6EhFjw@mail.gmail.com>
Subject: Re: [PATCH 3/3] scripts: generate_rust_analyzer: Add
 pin_init_internal deps
To: Jesung Yang <y.j3ms.n@gmail.com>
Cc: Tamir Duberstein <tamird@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 10:26=E2=80=AFAM Jesung Yang <y.j3ms.n@gmail.com> w=
rote:
>
> The recent `syn` rewrite of pin-init [1] covers this as well. How do we
> usually handle this kind of overlap?
>
> [1] https://lore.kernel.org/rust-for-linux/20260111122554.2662175-4-lossi=
n@kernel.org/

It should be fine, when applying that other series later on we will
get a conflict to be resolved, but that's it.

I wonder, though -- should these be applied as fixes? After all, even
the commit hash is provided there, so we could add a Fixes too. They
could also be backported if needed.

Thanks!

Cheers,
Miguel
