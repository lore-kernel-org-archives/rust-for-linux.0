Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702141EA7CE
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 06:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764310381; cv=none; b=IZEfgjHxc9bxPSksHbzpRz9mzD1OEa5XwaRnyLnQ+hnir2H3/Wt7Sc+9xcLxC/taqwjUudg8P2UCmP3Wrq/090oMTJq75AuFpKZYFrH6jZHkeFMIFokEIZ5bBR2S9DnbkECWRy/c8wQjmxzqnNJ120FV2Cw7Lh6cJe0vVzsWvio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764310381; c=relaxed/simple;
	bh=FxoHkb7nyJiTSd6nPa8aGTfEfLKBIDOPPFcjWrCubMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XR9o0Ieo6LG/7oqvYHLksTfgwiYxZXukm31RKyta1nJeAKPHUqjJ4DGPiGHn/ppfrrG33pvThHM5wkAoA1giIVKb1ydDUabbdsmdec6Pd/v8ToSnpHtqjbZptHGU3f5z08SwGAQycgkcKAuuURpyVltcSw8md6wipaVO3TTYhn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VxNZqgh/; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VxNZqgh/"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso1711710b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Nov 2025 22:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764310379; x=1764915179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbV5zoayEdyZYtO178MOH1oaskHxTibOVaCNtKxbEA4=;
        b=VxNZqgh/UPPrvqVKO4kJ59/3ndDb4ZZGy8gq0Ly7nZZNzjHszv8SaZiMTr3Xr3CNHv
         LL/zyYBM7iHuKVSyjYDHPp3LrwR+VmK+FaHMt05aJltdEfqdveRQh1RtFRI62p4iES28
         dPwtSX4REmc8nZXBNPNBS8an67tTr4niuy2oTXmBg0vuRHNFjV3H0ZIJOdsLNnendCLc
         oWDavFLFHMwCKDV290x9h2VJClEDt89nfdA8B8E3Omw5Nfg4PM58r96cAuHnl/zv9GPi
         25MVxpvNXkrXstpC95/2t8B7aOcipllJg925SqAv9SwxMk/0RKLsKJtt01r19yYkmQBC
         em0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310379; x=1764915179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbV5zoayEdyZYtO178MOH1oaskHxTibOVaCNtKxbEA4=;
        b=IzoHBxmKMUIhd8Y9iVEcgAMlwWivXWR0KsMzKLj2LkvQYtmR5BXaI0uDXVOD1O2Lsm
         uQtLvmre29TRV7dTlgkxnz//HUMyN3YCXjQeZEcJqykmjh0YnOUKhsInBM7L3DaXPIpu
         3jc88TKEeOkFGOG7y9KYAAOalQxk7jkLaqIxCpguYErlOnWD+rCk3086PBlnchf8VxqU
         lWh3IOoTCfjBTg/T0Vh+9DO3/5ipFzBTP71AELO6K0T1C6Z805HbW/EbpuSFpW80l380
         I5dnC9GJLC9aKNy7nr3scbG4OY6+CPZsIX3h/lUANXG2nCDtRClWEL10sGZlD9HZYpkL
         r+mg==
X-Forwarded-Encrypted: i=1; AJvYcCW4IWnXSZ8lLC5Ubg/BTyGiy8L0nfcfKP2C33Jh9Zi/msK6G3GMM1VojdgFBCegGljLZF3v5qrLRFq8TXHqXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxC0u/Q16P0LaICqs3rjDaFK5Cb208rGRANXUtsKxpeM2CQCP7Y
	oIW0XUzYRYGD0gKfr1Q8EDHcjmyy14e7TVc30aI/dgz3ZLSmt/9fhEpBgN7CjbgB6y8=
X-Gm-Gg: ASbGnctgg4CQD13KjZhmuqRMF5bkp/7SAfg76CuvtzVfB2n02DQV0TyR5eF7OrLkXYd
	5KD9dP6kxQQ0QwvT33cpnaQIDZjrJR5znne97T/EmmxEen92HZJNutDiix+E8yluNTbJ0K86Yqv
	0NV6d9Hge+4dL302F8/m9v7/qnw9IYVPup4SI/F906l2X2CwAXb9y8ZKQ/8fQO1touZgf8/AQon
	z6kQhHzaz4WfJ9Mr0CjpfkGyzyqwYx5GdrJqho7O8ynd2ZvRrwAQu1rbSouFVJHdFyKEurHW2ZV
	IOUgF92KrybkXD2N2+Yjd7UpUlM/fh7Mn0slCoWGIm8KP3lTvZD7VWHePiBsVSTLHjRQyqyWswx
	jsOZgUYqt8rLpCWpvjZdUaRVNRpFoikCWbDqqAfQh4O0rMmItIM39x36BRYWy/OXAFTGG38/EQh
	p8mcJauLJ7u5Q=
X-Google-Smtp-Source: AGHT+IHjsfdXEFTf0OxB36Ajkhz9vTo0v1dVI1d+Dfpaapyciqck5ZyUFHvdETndhTkwemRanymW8w==
X-Received: by 2002:a05:6a00:12e1:b0:7b9:e4af:719a with SMTP id d2e1a72fcca58-7c58c4a7d77mr27303823b3a.1.1764310378688;
        Thu, 27 Nov 2025 22:12:58 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f177566sm3685274b3a.51.2025.11.27.22.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:12:58 -0800 (PST)
Date: Fri, 28 Nov 2025 11:42:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/7] rust: cpufreq: always inline functions using
 build_assert with arguments
Message-ID: <zis5k4oo3kq6dykzm3kav7rlblqvvnk43mrcvlwyxxfgwbpmjt@6r3f5432vr45>
References: <20251128-io-build-assert-v2-0-a9ea9ce7d45d@nvidia.com>
 <20251128-io-build-assert-v2-3-a9ea9ce7d45d@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-io-build-assert-v2-3-a9ea9ce7d45d@nvidia.com>

On 28-11-25, 11:11, Alexandre Courbot wrote:
> `build_assert` relies on the compiler to optimize out its error path.
> Functions using it with its arguments must thus always be inlined,
> otherwise the error path of `build_assert` might not be optimized out,
> triggering a build error.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/cpufreq.rs | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index 1a555fcb120a..df5d9f6f43f3 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1015,6 +1015,8 @@ impl<T: Driver> Registration<T> {
>          ..pin_init::zeroed()
>      };
>  
> +    // Always inline to optimize out error path of `build_assert`.
> +    #[inline(always)]
>      const fn copy_name(name: &'static CStr) -> [c_char; CPUFREQ_NAME_LEN] {
>          let src = name.to_bytes_with_nul();
>          let mut dst = [0; CPUFREQ_NAME_LEN];

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Lemme know if you want me to pick this instead.

-- 
viresh
