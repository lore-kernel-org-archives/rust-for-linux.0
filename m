Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F7A33BBA7
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 14:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114693; cv=pass; b=b2XNWO5h5XVpJ+dRJdI3tgQFIwujau0lKSiuFE/1gwHfJXxmnU8LbzxvOgow/aES+SplxtAa0HQuF9oIgxRHkmOA7PUoiIgE3jwmRdw3KGoto1sOE9nNm9cTQyn2ll//vS9kAYFU3LZfKfYucP7Q+NsHC9Pk/hXoYvR0uPwVL2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114693; c=relaxed/simple;
	bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfaX3zFs426hcqt8NfgbmdSXi4WcIrODNNJy6RLMe9tyNfK1sXcWsoERuDmT+4wvK1zUBgHqRUyvhPF97QZkSFGOIEgdDdLsR2sGsG3H9MaAcdJvuiFuZ6WSB2Jsunf7rt10h9Go8bF+2NAaJtnbZCw+qCC/udVfr0gRQh/YfRU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfxpbqhD; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfxpbqhD"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1277863a912so70529c88.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Feb 2026 06:04:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772114688; cv=none;
        d=google.com; s=arc-20240605;
        b=I3uMYyL8f6W9ZDhoVJ2bevwapqQc4TMXWHfd4cviCNTbOV9pH/lI8RxETb7Tf+9fnN
         6joeA1FTGac+VwnMqJmARC+dT3GZrsaMPHLhwDN0TsIvFiL7DlLuWwmh95GHtV6MxQSR
         CtJIV6Hjft+s0V8wNZ5Zd1/NB1NB0yJinq5byhJfEembISZ4rudolFWEeXybZjpMX+qt
         kGKo9BBOzqhrcs8EDRfoM7uvKncWxR9CHYPWIeX3YfYNsac2n8i0ao8SY+fR+vqpaSa5
         QL95VX8llp3x7RdSiDMzidgy8v5yRetRfZ/av+FKLD+P2gPgUM/G8JgcyQmrVKvRiMpA
         h37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
        fh=7sEQ9qQalEI0w19NIEz+QszDnqe/rr84X9v61jnUg5Y=;
        b=Vr+x+oAE4XquMYmfezXp+1YubtQIvSyo4iqyWFEFc6E1CY3VTbJIle7iY0pbO96o+x
         CFTxpqkbz9iSvF5Rpbv/zsHb++wmhLJJGsPkE6Mp5U/0fjWHyzhscKzCc+gdNDsJ0Y4i
         8UlCILxBu71PWKCEIf0V5/hs7QugqXU7lSnOwNuO0AfMVCVyrefzkD0781j2aKC0uhPQ
         5jTmFJviZjbBqu7Hy1sqQkG0qIjNJ2VTavBLYJwZS3Zx356C8kJXXDh/M6Q4H/rVudPx
         zAepFSp6e9YmhVD1/jFZYQRtagTODvsPJRyg8gNtyH6HORV0BoabASyt9nm8vNqmPxIA
         y1pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772114688; x=1772719488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
        b=SfxpbqhDfL1yUdZ8z0ccd65ICXtdF0Y4xi6qySNpK7kaaAkzdJvBcM2B0DXlqXVow9
         6IYfgAYhxvHTNBF6KkBrWX17hGp7n3A2UnBwGq4G5dJEk/IS9gfoEL15PfXR/QghRZ1l
         UDv9ciQrCqYBUK3OaaXRFLvBW6n9ds3LIydh5krJ0UFz6GQJ8Wwh6tRA0Rr9gJqo10rh
         qiShTJSSeKRLLTvprxeXZ/aFBj+11IWfTdCeTNOk8ogjry73DFe02iQXTzdvtInfoAMY
         MMldj3POm5cJD/DqAzmuZ/sogq+pEknKq38iEV4iLXZ68Qij2JH7/CF2oI2Ma4OwyxD5
         PGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772114688; x=1772719488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1wvUnTzFU0djvbBSDUF+jiedZLVLMDrkBPDbAvBdvOw=;
        b=VjzKX2sTMqLq4XGd3iGyaQrEmdUKSwDQcTfkykLaXGeZLNFabjkivL+zVAtVCqpdcF
         CmP9j3alpSldOdgjHwx+artKjp7bQ+yFD6ViP8tuuoGl4rSiwcAZjJYkN57V8KX59dsD
         3MqkfUR9n1OuFRRrH21M3GCxypJkHmPvBlpdl9lK08etCzTg7snRZ7/K1gar5OWlQ4S6
         ALtqW88EukFz62Qj/EZCInkMKhvGwEmOkunUuZywjfGBrOXDdI7UKriGCMsnrJsHcgA9
         nQDORWps+PIGZqg4geKccuW1jnDbnPYNonc8EddGShDb3+fgANFjMJC7zreuKyxNQ87n
         JjtA==
X-Forwarded-Encrypted: i=1; AJvYcCXg/+aJ69P+upycFzz8uAT1YIcLldwMNHjzRLxfYx4u8yddW+/VOeemc3FoStbOFK/42trN66pOrranW04qqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBd+A6kHkxLIiKDHjMzXLzHGcA3q03o1+VDqvDuk8nrUt5fJt
	Vj9p3eHJucnnQc6UY0Fhe137eTuQKFGIgsD4fpbKfwbYg89a7tylIo+P+2+4YnXrjEqY7IdAGbA
	zvrgA1N+a6XX4W43OB2/sLMdPUJllP64=
X-Gm-Gg: ATEYQzw3dxiSUWupsuf0FJl7UgvDcMqHhS08XGApfDvcznb9jvrx5l0UeBi5cOu1+6P
	Nl2RjXoxKqI3pS7nDevNplhWP+ghlvDVqjSE0yMPxQgJpaC4OdmmsYtZQlorowucawwucMGArVr
	9vH7WHnsRLVmbIib4lTLkfCh+j32LRnKVRAT0zZAQCgTlykHqYuRfAZeebMz1rKwxZ+6Xmr/KRZ
	NY+xej+0HxzuCkCZk7zJBV4kL+mfn1tuBd+HXl40YV2hExgj7rnA6jSXl9F03sNdEizsVv6fOTO
	NOe2GBYrKE8m4aC6a94C9OF9HAfY2QJF0/vLPriWduAntWczAU9KnzIwBtzoFLH00EpmGgYdFeS
	l7peS7IZ+AD65slI1w84e2I93RA2MMmoYnP2FY2U=
X-Received: by 2002:a05:7300:bf18:b0:2bd:bc33:ca32 with SMTP id
 5a478bee46e88-2bdbc33cb83mr1132309eec.4.1772114687621; Thu, 26 Feb 2026
 06:04:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com> <20260226-cmdq-continuation-v3-3-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-3-572ab9916766@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Feb 2026 15:04:34 +0100
X-Gm-Features: AaiRm50bYcwJMHTCfOonMLoQxEz1NrF-ZMytkNesE2f6ML6hsIR6ETTN8geqQBY
Message-ID: <CANiq72mb=t4C-hTn0BdzLmvCu315tZLHPN_g_wvs0P-qgO_RBw@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] rust: add EMSGSIZE error code
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Zhi Wang <zhiw@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 12:46=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.c=
om> wrote:
>
> Add the EMSGSIZE error code, which indicates that a message is too
> long.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

I checked that it is placed in the right spot in the list :)

Thanks!

Cheers,
Miguel
