Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EB133A00A
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Aug 2025 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216696; cv=none; b=fGGNDIxODV1ENR8Nh0eRci5e2aFNhH9KmjfrXn8/uErzy6kr02Dt0qo1nCXEJHCoK4VlOoZtq50hmbSx04HFDF9bAK4t5bvm7YwqQigD8F0ggGKbIS9kiZtoiL5WJ2rLWK5Q7BrXUgv0yZcKoFVfk74ZDEsf42sMU8DPs4kAWmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216696; c=relaxed/simple;
	bh=F/fAPnfHxUemRrZHN9zWvSIFmtxgD0s1aIaOJ66WCvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMQJxrafY9EkuHLY0OmQySG5pf+4DPL+4SCmdSSRiqJ7EjZEKEYUtxZBQJSQ2xPscqWEQpqrRBH2ocq9dlEFD8nzvP5F7r8kwzBrdWbGo4DvP8sLpU0nKirL3wJM1zQpXJ59dPHCFGTkFgLTZVdVh28sZMOJ+Qv5y8q7xl+kmkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RGCQsClm; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RGCQsClm"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3c79f0a606fso1862861f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Aug 2025 06:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756216693; x=1756821493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/fAPnfHxUemRrZHN9zWvSIFmtxgD0s1aIaOJ66WCvQ=;
        b=RGCQsClmP4mM9OBBB9U3mt19EDLwls+80WqGnM/+Qv7ZiKe1Lq1+k4yIXNvMs8QTIx
         lO2h4hpiUhkIbhihjizj1YJshZTei2xQoysWMtAsJPyXZP0vF5kCXQULc+BLbeFjikeM
         a1YGGJy3kKrMJC5DzzerJEcqMAIY+QXItMkYdla35XfVpt587pbewhj6iasRAFPJt5KP
         353bac/ZRNiwEXaCX3aIUHV0nZgFGHSCZwYM1pXqH7dYNzCGKihNEhAgZHlgSe69Xvm+
         fj9cg+rD6AQFyqX8TWgORZIj40EB0Vq++FoE9FvrQKadbicvs0V9CI8p0QGV1CaIuQIp
         1DCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756216693; x=1756821493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/fAPnfHxUemRrZHN9zWvSIFmtxgD0s1aIaOJ66WCvQ=;
        b=Lg30HEnOsJ2af+tqERnuCxZNHmfYvgTROHwiG87LdM/HZomAANA/6e+fMLnZx6Z7pv
         0wnuRuWSaQmPY9TfHbFyJupsw3g41VQxLKyvjAMZ6dN+d+zG3sIc6gZHKO7J6hSbOlrA
         d1q+8zjD+6esSRurBq7DoYmie39QJJIG1qZbS9Gbq3uHsx+Mb2/9jIXO3e9r9qaEkyHq
         hhuyFt9j5pf8E/ii+mLD4VNbMrBRQvjgoAIfNQfTE2dN5wF8VlpCqzJRWZY1PTZqmvGZ
         xFdEKidrpgo9WJn2fJ0ooIVNecZkfzwGsr4+Ymzs+wDRl5ZwK0ClUR0KI8FO8mgqs79l
         ol0A==
X-Forwarded-Encrypted: i=1; AJvYcCWEPyPCA34YhBnxUpxQ1Mutylnc+/63HJ9UBCBEfZL1ehVn7yRNDmdVgTlRTLgMw5PUNby4WWSncAX8Oe8HnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWH2SXB01YHAq5HOBywSInKNMFBh85CdcLfZbyEMllYMJPNsuu
	v2d2C8E75vjsB4UM7pjXGyOIFqH7+EEi9sfwe7X4eOHXtq79zv36WrqlV6JlGGdi53splCgLiwq
	ebkAAwL9MMkjEZplUXuOFQEA/vUXcxWz2p9fDVEvK
X-Gm-Gg: ASbGncvq/0h0A6MejGp9kNxZ22avgL2QUQ5I6ITM3Y9lL20bdMQmNumIcTaV0EoamL6
	3VHMNEnEi93pOwDgefEvpK9PO4dgSAfgRHLHoM3w/4ntzCluOIA/gNVKEzp8rFaHnyqOxevuJ2/
	Yc2i18MP07ZHM6oG4f4cdLA7CZACjpDAtDwKW4iuDgMkpnkU7gy/yZp7mEq0eTtL2+jT8h9LdZN
	KjFcfRnKZinlBtnIgJyELmr5Vy+FbP22IJUH17IcvAPT4ALovzjxcN5fYD7vs8L+xpeRQPAcBQ=
X-Google-Smtp-Source: AGHT+IHRgvzTO5clOrALiSfYSq6INd4bC5T/yqjf+veSVOxDpuDbA4FBiVt0kYdgDa/qqkni21+SFeOOi9dYSd3GzS8=
X-Received: by 2002:a5d:64ec:0:b0:3a6:d95e:f38c with SMTP id
 ffacd0b85a97d-3c5dd8aa9e5mr11922498f8f.33.1756216693355; Tue, 26 Aug 2025
 06:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813153548.1650533-1-bqe@google.com> <aJ2Y21Yjs3a0CnAo@google.com>
 <aJ4Y_DAZe__0EWEm@yury>
In-Reply-To: <aJ4Y_DAZe__0EWEm@yury>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 26 Aug 2025 15:58:01 +0200
X-Gm-Features: Ac12FXxekRc_zLGFS3Qk-92ThB02sZE2hj5xq7cHAtlXq8wdo0Ut_NCfgzEs07k
Message-ID: <CAH5fLgid9fF2fb06No9zmeQfru_nQicaM_9bb+DWe3zsOwm_cA@mail.gmail.com>
Subject: Re: [PATCH v14 0/5] rust: adds Bitmap API, ID pool and bindings
To: Yury Norov <yury.norov@gmail.com>
Cc: Burak Emir <bqe@google.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Carlos LLama <cmllamas@google.com>, Pekka Ristola <pekkarr@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 14, 2025 at 7:12=E2=80=AFPM Yury Norov <yury.norov@gmail.com> w=
rote:
>
> > Thanks a lot for doing this, Burak! I gave it a spin locally on
> > v6.17-rc1, and it seems to work.
>
> Does this mean Tested-by?

Just to confirm, is the plan that you will pick this up through your tree?

Alice
