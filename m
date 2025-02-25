Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4B9260A53
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740475479; cv=none; b=L1+56KzcQlUxeYGTIwiOkrgXANSdC+IF0+z4NwuBVc26lVj11/bVBlnE3W3Ttwl7mNMbinNvb4x1LzqD7rhHkNdadqqrfKrjTAkX+MbktNqmQ0lPaDmmrnq9ZeGdTmdfFlrDYH0fjXmalenMf+DtLuv7bELkZTrx/6UMu53SyLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740475479; c=relaxed/simple;
	bh=ZxiIxSccYcexTMgoVMyRSTYmi6kCr66px7UtyhRM/0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bteLksHG3CCwHVPpOYRcZrmXj/iqcn6E/IQ9nLpXMLD7JvkePhZmFF1XZK28wb7EGHrrEsiTBt0bbKBNQ4ruVJnFsHOdSM9+kmJrbkWPdtIGjGXJMAYmr4DXl0I0DaLCTwTEyeWF6lHESfq3qWFxJaGm6Y51BOKrxS6Umy9SQMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y5XcvCDH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y5XcvCDH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so50643255e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 01:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740475475; x=1741080275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxiIxSccYcexTMgoVMyRSTYmi6kCr66px7UtyhRM/0E=;
        b=Y5XcvCDHhUN6wP/Or88y8pLdm+Ovk5Pw6CLGC1Qyd39u77j01hU/lacZJUHL71kkw2
         K7LIrXkoe7uIIZ2JhvwvqJNs66BpNGL2RD2u29VgBibJPsY/+FuIsK1k7wmwMZE2zKFQ
         HYyUkEt9Ms81hATP57YpXRw8NS3lTYur9ZlAVCIWN72eJP4yh1R3C1g5x6PuntPWEq0H
         7EgCDy5ofNCDp3eKUdJ1hQoCaEFCe7oA1aQm2DrbRtmZ6jl7auAMhmbZMwRpEmbmL1ab
         Z0+9Muxvj9ryygzGNltP7gaCgPxrjDBcsmvgplBBtakUZNvsb21+sqoovw7zE0+gcmXU
         72nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740475475; x=1741080275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZxiIxSccYcexTMgoVMyRSTYmi6kCr66px7UtyhRM/0E=;
        b=qq/yzjS81mSfE/DpP5ssfuMEVWCLRp4bQ3YijNeM4Z7Jtcwj7rSDW0x3RIucpyYvxs
         DDZKox2QvNShJLboPZxQOL1RFGE+ItYBl95reVbL2LmYUH2pRcuAXJssWwtpp88ZcTmQ
         qG3a+n3tyTUbU3T3Z4SXElkftfGo4SJzmiPWJyvU9xshmlAuM7Cnke/NW5sPtMVIWBlk
         3zClh3nRMMUh+F22dA0Ik/yUhVmMJ/aUW4BRClpvsFfpEDP45LDBqGwAjep91ZSYlDor
         m+YD6+xbqBj6KUDnQDd+lpcTO4/Xe4vCWjm1VZSMorBmgGOgei7YNkeZl/ZvG9vrD0Yh
         q7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU5jUVWt3TDYjqVA1mvjag5uqtah26scnmXiyYmj4wXghlqgBslgQWzHm6LfS6Rtddal3tMN068f5YldMLeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYijCuLy18EupEdSAF7HXZHD2dGjdKqJzNaY0IiPJ096k0IFUl
	aDCy94Nkk1XX7r6cdAdRcoywaxL6YV9zix+ed516OnI5I7/pZJDyqxE6rajwGaVhxWc+lRoqPlq
	e9w8JH6dGuXPHr/EeYHfBVdsNn4nao7XeetFy
X-Gm-Gg: ASbGnct+VpeU5arrIlj7DVqC5BRtORjpxob61cPtWGB5K8aJsA6NItxRxgO+cgXrMk0
	GCv9zDXNjI/sqfpB+yzdw/+Bzf0uuq2X9WgK3vWJYtcsNV2udNBIelr8M8wl1a9L4ogk1XjKrqD
	xbiUrEUZYiUo+vxChyWXpXBz74qFXaF7M0jlavMQ==
X-Google-Smtp-Source: AGHT+IGQHSzoQSkPlTwNA0fxypnA/os2iIyhXnWMnuOEfnVFkcbcWJzo4J+RgQk5Yx7RRkNXXrVU9KuiyHJ1mGA4DK4=
X-Received: by 2002:a05:6000:1844:b0:386:3835:9fec with SMTP id
 ffacd0b85a97d-38f70826ea0mr15050496f8f.44.1740475475410; Tue, 25 Feb 2025
 01:24:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250224233938.3158-1-yury.norov@gmail.com> <20250224233938.3158-2-yury.norov@gmail.com>
In-Reply-To: <20250224233938.3158-2-yury.norov@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Feb 2025 10:24:23 +0100
X-Gm-Features: AQ5f1Jommy2ub_3vQwqnVtD39tTTKNsZezOyKXgy7B1RbabnHE7_Zcs3Cv7hZ9A
Message-ID: <CAH5fLggk9tus1KmEw-Ox0buFLLhN0VajKCXYdxiFncjnbLGatg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: Add cpumask helpers
To: Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Danilo Krummrich <dakr@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Erik Schilling <erik.schilling@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, linux-pm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 12:39=E2=80=AFAM Yury Norov <yury.norov@gmail.com> =
wrote:
>
> From: Viresh Kumar <viresh.kumar@linaro.org>
>
> In order to prepare for adding Rust abstractions for cpumask, add
> the required helpers for inline cpumask functions that cannot be
> called by rust code directly.
>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
