Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689D047A0DD
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 17:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789381; cv=pass; b=ku/R+CSXqNmib/1Fo9JCt9gSb3F1og5Z7LR6fKgYXT0zlE5WKfC+sB74xZnjvG1CiKS6glS0qAT+Npjphuay0EJqgKfqgRycaSn2CnJFHU6noBNI3qgSSlSVywwkdsP2Sa881UVRJuk0eeqhuZCCjv7XDRMUttEOsVoD6M2VS4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789381; c=relaxed/simple;
	bh=nwRqkBWGPhWkh9sR2L97RRE1/4KrKqVf//okmnfQ8gQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRMOipJ6Ca4aq8g3E0ujAAJBb5tvWlh2kb7vi+lC2BHKa3r4gXpBdxYxngak68IDNZxlDos0bCcSINvi7a1UqwHDTuH/fpSyoL9QBFyFC0lPx9OoMLq/gRdD8SsKQmPZuaAVXN2BPgz9L1lyeqizNOo4hWYTLMq9vur+EqAPnhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwNcCl2p; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwNcCl2p"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba415d41a6so68256e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 10:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790789377; cv=none;
        d=google.com; s=arc-20260327;
        b=cDPri+Ujm9sUPwIgETaP7Nvc/oiDV2BTb0GLElOSTE5bW10KuJv7h1I4XVMrCHs1tD
         Ry2XAGLbO3EJeUdzS5Dtot8iLcFDVC4oXzFEuDwX3wgAgUR8Bki5iWhQ14QRaUiJ0RGX
         jUbwQnC3sTjnkFRapT0Tu84pY/MsV+VzASSJUR045AYg6/4d3Vos2e3cRonmXAHQLGui
         pghSFWDxnDI3tNTs8SzRjwfzoERBNVYy0Cl7hQBIojWkU90G14Ci/I4KQv8E6UfBBnge
         jgaPpXPzW1wm7yWQoi8rGc9F8ZhvG4G+DKvHRn4jVPiKqZ8JRkqXOUWyl09WhgBMnHiR
         aKGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nwRqkBWGPhWkh9sR2L97RRE1/4KrKqVf//okmnfQ8gQ=;
        fh=uBF0YJ298GvRgc7el2kElv5VT720nHojSeUkTyy3jsU=;
        b=ZePm9ri/PE/Fmt2RDfh+stzY4rYV3EwOBIvec5HglcxzntUvYKmPOJTXuBaIwJkQa3
         pFyixfHhDUmnxlVCmm8XlshZlh4DL1guh8/zTwuO6kr+RDTkD0Rb6NOzY9aXaf+l9u3i
         HTTyg4+UH8JWHu/GsQWmFzva7zyC9OUeFhnTVU3hNCv+cPbvSbilnf1VLn+Ln6IAJO3m
         ZT05e+7JNJURxOJylhl/ZnxUBNxWse3z6Iuuh4fk27KjxJiNO2avH2mrD6zit5lVlhS4
         20nWGcLrwhf0GteYsB58P3Up7LU1NLWP8rHTAkp0P4zsLGOz/bk2AtlDPaRuF3BITx54
         y97w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790789377; x=1791394177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nwRqkBWGPhWkh9sR2L97RRE1/4KrKqVf//okmnfQ8gQ=;
        b=kwNcCl2pWWE/uXx3vAu1NP1AHobhUSSGWi7JHeV2s9xnMOLHbQnr9O621SD7YE0fFq
         U5DzVVIaNtVKeepX/9Wgq1flBGLdRALOV0goFmpmxL+MygA3K6gOpMB+ZsrBXfZV2rDH
         94mLmEqO2IkRjdEMQ1VWx5nf713YZ03Q0SrJsiF6F7v/v8YsriVDktQ/e5pPs1IIYqx6
         jJ9IojWYJ+wHvFNgF2401c3AiYkwqcGi8Kku+gn3H+4q2uFdPpWXwqP7Cx+OicBW2VEe
         Ls6IFGRIUjHWK6b7Jv0VekQm419WJCTojrdif3rZYIrO0taSEww9xF6Bi+dX+zE5AdPq
         aRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789377; x=1791394177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwRqkBWGPhWkh9sR2L97RRE1/4KrKqVf//okmnfQ8gQ=;
        b=eqOW1NTUABUmOU1gfuQldHDXHn/gvmbduDKMQ9BGNS7blchm+FSpV/KA1uc45quO5H
         +9V3ehWCJ3LPP7JzdyN2vla/8yCQ7JGcaFioeLZdBgVPGr0Cozl/N8FMHm5zsak6Z7Kx
         vO/rxN7W0mWYU4EuWpvR4rskNv22JmTAzujHpwuwi7jBZlI7lHiOHqYMKoRIrbZUwKyJ
         W/Q2UpN0l5qLT2ctLuU+XBW6J4zjg4bJoiVcln9nz08Iq7/PE/gImOLlvOV5GzJqtLYu
         HEzHep3vcsP5MKxJuBK9GjDhKUH+wvJ6RYrBXdiczC7lIfFrPGWBe3BPqKYL6MeKK2rU
         G8sw==
X-Forwarded-Encrypted: i=1; AKwUvByuTZCc74QMrN+gCJgDyCblMo2FPBb9nrwgs3WaC62ZVFhhswRAXoUFS4H3/+6GJ0UCNnwMn8Sluj/z4W0k2g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKeOPRG2DpfjfAetU75qVNPjnepJ9xikr/C7u6LMgTUUAP4ktiZ
	mj2ibRN6EgbteSTquLnOspcWRBEmqG56MDXAr1/lexlxD7TasizMcCYOHi6oEsH1XPv0nRMea/n
	Mq/Us8gfKwvetHbHaU86ZlUtKEKDz7L0=
X-Gm-Gg: AYBFou3rYdVSnCgogtRrrpwu51MCGwXG5EWHKj530kLvMRn/VgZVzjGM1WkSZUc1vEp
	o4SpFoIgphCGFkeXXCQYWYSG/W1uWtDvhxYE8F64Cn38UvdpTRfSmEqUQh3FPitcJ3reTISCkI8
	Au15ihcNkY0/T2GF87kfO3R0yU1LuXaGbJ3ADauOiKAX8D60461GKNgyLgSXyoVSeTQ/9svGBcA
	q7ZQWSLgPeNwuH2ZRen+iepop3oBoW2Ac2Y4HzYGZdYI7QCJWCL8bdohETWmTcbO6ejNvulByT4
	SQk9360HBdgjq2nZmkmmjJdn2UNXZTc4LdS9IcN1iy92MlXla1uFoagQ5ua/5sUDqOUWq5XXJwG
	oi8ZJVHnBoNYsNz+rENAbGOHAdgOG2ZIAX3rqZ2TwZ6F0VjRuc69L1bFdBlXqTUDe1Y2S8Gtlxx
	FDIlxB2iOtE/XstZz75nYyAzhVKQf2D1zs2AYm87sCmE+NRh1cTCY=
X-Received: by 2002:a05:6512:3041:b0:5b8:f276:ad76 with SMTP id
 2adb3069b0e04-5ba402c10a5mr849913e87.2.1790789377054; Wed, 30 Sep 2026
 10:29:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921115708.4009754-1-gary@kernel.org> <CANiq72nR-QzR3zOiV=RL4je4U8m_hCsPhOD3SxAcjc+4VCrMsw@mail.gmail.com>
 <DLQWWUKZ61KN.1X8VCC2YLPD53@garyguo.net> <CANiq72mOC_-6hzd=dG3YJoaLi=fYCZ620CaSXZv1Oo4ja2v5gQ@mail.gmail.com>
In-Reply-To: <CANiq72mOC_-6hzd=dG3YJoaLi=fYCZ620CaSXZv1Oo4ja2v5gQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 19:29:22 +0200
X-Gm-Features: AclHuK_Xq2p8rBQSUUCMyP69x91mRVAfhyvtd21Tz9BX7lsLm5p0ul0jSuGOdbQ
Message-ID: <CANiq72kCPcw-p1auuqvMJgHLq-hto11zgmY2jELBTH=mpZVr=Q@mail.gmail.com>
Subject: Re: [PATCH] rust: proc-macro2: enable `proc_macro_span` feature
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 2:21=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Ok, in that case (plus what you mention above and the examples --
> thanks for those, by the way), I think it is fine either way.

Of course, please feel free to add:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
