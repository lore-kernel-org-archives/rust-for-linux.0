Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086825949C
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 05:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736313613; cv=none; b=ETItC6wEjyBX7ItJJDNaJAUr4xn+8iobiwcd/QsuTP37dDny4fC+Ql1hTFZetIEKpeZXgkjVZTHU+4DQSLUpBgPRIgF6J/ny+3Kogbmje9LK7gX/VzkuvtDATw3BmhlWxMxBoxki7DOvBxAodWov8i2PgniJAGJ3naoEPs0BN8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736313613; c=relaxed/simple;
	bh=MX24MjbCoItqrQFmF1f2gtQanUEyTbfjYrntn8+urY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIh5r5VJWf32f+xjf8Dt7KFkt0hbo8EViZbsX+76vrXsoSGeAJxp+zWsBNQ248Afu901rq81eOfeO12PXl74WjNLIzm1dVwII+NDvyaGVhF9TM+xov/ozrypeHy2/v4AZ+q5haNfRVntBgOx9vfITjj4ME+WlK2okFJPUxEEYOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INRR4TZw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INRR4TZw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-215770613dbso180868445ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jan 2025 21:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736313611; x=1736918411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZY0IuYfAI8sm4RayzU4rIp2zLi3BvvvLxHHyaxWr6Rc=;
        b=INRR4TZwC3uvFb6oBOr8eqM3TXn/8XhwRMkptG+2F2jZcC0XegYzCYnIUry0Ck0K0x
         pfeW4rrNNuj6iKZYwjVcmRFpgENKvKTFF/wAD3D4OUP+jFEgiSygG+F95H2Gxbujt8+L
         5oYauh+nbr+1zUxG8nh18FiTqb7VHMYMAk+5RpSr50z2rWEMOOPFpJJ2iAoj56KUlB0c
         L0U3GB0M9r2vnoq+J9O3k5wZuhzPIh1OM4SLlRWTpTigyV4G0hvRJkwqGfGuINVvyGtV
         RTHHh26JmFRFO338vyXYewPE9HQf2qGg6elD2PtuRJjy/AwuXA98RJCco9PVlMRxNDGp
         yA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736313611; x=1736918411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZY0IuYfAI8sm4RayzU4rIp2zLi3BvvvLxHHyaxWr6Rc=;
        b=RdKjMcpX1RbvXQMNrhdq3syoJ17hB1Jdv5GwejtCT9MUSf9m95sNghfkwjMCaOGOBx
         gG8VyKO2NCwP32w/RK5XeMObEhQd1D+MCeYO2iEFCVfB7Uhwo7Ide5IGl024VjmJZ6dx
         fboRLcHJoiIOo11l45cwkHADMK5m844orZVj7s0PpCqVicVqpJlxPj6uSS2979ByY4ji
         820LyuaqZNc8IQ2mJiMvBidwd3gy0sknZNveEbIO22Z2kts1OfB2LZphJMqZahHPhKC3
         ZTOvd+GsEsFbHN4sP9yr4RR3fKdDDmUD8Ps580u5pjvMwKJH4iJUzaOwzsufzRJcxGay
         QPww==
X-Forwarded-Encrypted: i=1; AJvYcCXWcZbbote8JpG2WJkAAvziSGyJ3WKxq3zKp9BmYemOghWTW+b+XH8Y+Cgd8ebFeOrSNB4OQh6ZNGSE/eZBcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHjGvFMYI4NH9tFC/CUhlgV8ndt9l4Xn35e8fCA+JTnbeSFsYb
	1LJ9lyaJUt7Z9IHNqS2v3iQr6Ihqi08//HslGApuV/OK1IqJyqpMeBgqXJ4qmPk=
X-Gm-Gg: ASbGnctqZ3JK1oWScE5kIU2U7tUzRwbNkDDBVp9yYgjrxVRSGUnLbb+kpSOqIKGW7P8
	JJQH7pZs18rqEPD7plIqtxbRV35JT1jwrtEPgSWyeqfp2teWnrtyGWJx7XsyfDUO3jeQ8Sl0Tce
	4ANzFxB28auZLiuLJP1NXVRrsaHC1sYtlyYSuzmZQbLa7W5EuoVLnODZrzAmAylWWdTPpiyPdG/
	2a82OcWh3eVSQhy6no4RUIo2eAuWvWHcUDn8RAt/JyAhov0rkqm2VYkqlY=
X-Google-Smtp-Source: AGHT+IGTcFz0XedM3xo5tGeGspXIdp7OIR7mhKZqjPRmh+zb3DQX0/hAU4xCNw4BDqGU5kvaDqpI9g==
X-Received: by 2002:a05:6a00:2e1b:b0:729:1b8f:9645 with SMTP id d2e1a72fcca58-72d21feb6damr2309339b3a.24.1736313610984;
        Tue, 07 Jan 2025 21:20:10 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dd1a8sm35560445b3a.106.2025.01.07.21.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 21:20:10 -0800 (PST)
Date: Wed, 8 Jan 2025 10:50:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Viresh Kumar <vireshk@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 00/15] Rust bindings for cpufreq and OPP core + sample
 driver
Message-ID: <20250108052008.izm5ffzgrc45ms4x@vireshk-i7>
References: <cover.1736248242.git.viresh.kumar@linaro.org>
 <Z30UZwgN2nGtiTsK@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z30UZwgN2nGtiTsK@pollux>

On 07-01-25, 12:47, Danilo Krummrich wrote:
> On Tue, Jan 07, 2025 at 04:51:33PM +0530, Viresh Kumar wrote:
> > I would like to get some of this (if not all) merged now into the rust/dev
> 
> You mean rust-dev or staging/dev?

Right.

-- 
viresh
