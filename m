Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034302D1303
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 05:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765775220; cv=none; b=G5j5tpUpAn312b3rYnTQF9i1EeiVosyEIowublUwV+TogGRJFMbXY0fU4asIHF29QW9HuUuwmW0Q0Bh/HYpwXSCfFPZNog/Jwjz9xTZ2M1sK7zVHl4J7k5ihC1a7V03hc1UL6/CfF3oYSpFDSmEBOrBX7F4un+NNzYd6W4dux/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765775220; c=relaxed/simple;
	bh=P1UlgDaSJmzuIGslfcG68oC/62YkhLSGmHGTzg2/0V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNA5eUfLP9yNWeG2kcR35G4BQJZi6r8OEXZRVA4b5ePk+W3VX8qs+b4LUT7OL1LpkeBy/sio/6eiRKWRAkqTJALWik31K+zk0PnvBUMCA+eBF4uN0sdWLhoAyiTolVbkrhdpXWX7RgoV2nxQUGTZw4Vc62nIr8zjg4k01LMl8Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzMZ/jBO; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzMZ/jBO"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-29efd139227so36967735ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Dec 2025 21:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765775218; x=1766380018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QD5AfpltJqpI2l+MydX1CftV7t4suDe5EgTpBUwzKkA=;
        b=nzMZ/jBOtO8WpZnVNPqrlk3XwOKoPQhqAqSKqHWbVuGfeu13Qfe5Xa9it7be5kUYEe
         Kq6eabc1zK3ZUatwT6UgTndw4rVQJkfTMrGvrlXzQYtJ4L+XsHiXHAqWPmuhkMSIHxfa
         8SjRxEWDFvx3QRo7+SnH3fUi89d3xvLTRWNYAfvXRkVqUlznSrNx8bvTnXJfH2JHbvlw
         7eMZ1eUXa8aLqqukF8pwleyoVweJ3TjhbjBQ5XkVCZ3ieUDSCADPkmksrbs24pvdCsb5
         nSpAhfj5ZUsegEDL90p311VAZY6McV/Vs9zeeWoizUp0797Rvzj6C7aFxP2paatMsLJE
         IBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765775218; x=1766380018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QD5AfpltJqpI2l+MydX1CftV7t4suDe5EgTpBUwzKkA=;
        b=iw66/Qrf50p6ZIWRH0iaalz8CJHY4WZwf0bbABBwhpTy9V0x7eLTCDt8ZVbUCneEH8
         3xQcVzLWIl6kipMcoWmI2KYm6ITT5w+DRY0brwZfNb/pORTQO6rECkaiCCM0BMx8Mw+P
         T4NsaUkhkIx+6HWlOg7RQBnn41VOcWFj770LVLDGThfSFEFKnQ0cwqKk1SmsVfBLpZR3
         QhM9baWyGKKBmLnkvvVZIywvgjGG5zkPj7oRL8HgAuYjVDu3G8aTxE05a4yriO/cqXdw
         rkkaHpmKk2nZ/X7/hgpUNpyvo2I9gXJEYcMmt14pYNDdSC+vJVRvfW5QcqZJl27FcIVI
         P6zA==
X-Forwarded-Encrypted: i=1; AJvYcCV37ttQ6WBKjC3v1ZIVau/LkdUzVOkd3Xz1b6lkQDr2G0031lZ9KKO00J54hzio5DYmklvcrFLrKrm7yLmqrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxet2Ck5zNT+4Scfo4vRgYz1q/JQWFEQoe33BDyxxZfgHqCscwx
	rczPz8DXcC9xlOl/FGdxa1bojd2GcfFLjrHxo1HMzEPFMzgWVsiou+pr6RX+JuqrgUM=
X-Gm-Gg: AY/fxX6HoHY0SFlzwf96MjA5D8bweyn/Btnh7lgXIv25roj9YYXrCD3taaO/tct3VdX
	bE3Hf5efu9ZEs5unNW2o5rvTiT8S9yWzfulyD+RjbxOvm1rHHA0ICCsjaCCkAOHDYY9atmfRuB/
	MOmXGHDXhi0q/wAMPg08khXdneA0GeNmG4i6GTY7L5LkK5T+hUE1IbZpUOJQRKFhAsC7hhLIF+3
	O1zDFc7DsjpwjR1DKtMVvrSlW0ckgMQsNarzH/8aKGlGSRLqKSsi68lXl/oHfaM4AeDGxCLb9E/
	+xSeCJzvGKHR+5EeJwv94Z7BNP5QyT70f3/7qYksxHZFKYp7WTicxTjaMZk+XelTgCi6hFjs6bd
	5IjR6LegBhsCky18pvX8MkAjhawURlR43vrW+n1RJ5fuL7OZbSjLtu+dt1I4UV5EqY45jpO/dmE
	LQ6+vMS3QQzcOL1lerIkc8Kw==
X-Google-Smtp-Source: AGHT+IFiq4XBKISuRbg/g/qlo5IAeZxOSRMhCIgvYlrlLa7gHi+mGGd/EpBdbdy1lZD8FGtEp1HENg==
X-Received: by 2002:a17:902:ec91:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a0d5b0e0aemr31538545ad.61.1765775218143;
        Sun, 14 Dec 2025 21:06:58 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016ba9sm119380125ad.52.2025.12.14.21.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 21:06:57 -0800 (PST)
Date: Mon, 15 Dec 2025 10:36:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v3 3/7] rust: cpufreq: always inline functions using
 build_assert with arguments
Message-ID: <fmdoyqoyksspygcjg3wbqxtqqntunk2wfny6vvt3iq6wddwuzr@a4kfi2hcc5x2>
References: <20251208-io-build-assert-v3-0-98aded02c1ea@nvidia.com>
 <20251208-io-build-assert-v3-3-98aded02c1ea@nvidia.com>
 <20251208135521.5d1dd7f6.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208135521.5d1dd7f6.gary@garyguo.net>

On Mon, 08 Dec 2025 11:47:01 +0900
Alexandre Courbot <acourbot@nvidia.com> wrote:

> `build_assert` relies on the compiler to optimize out its error path.
> Functions using it with its arguments must thus always be inlined,
> otherwise the error path of `build_assert` might not be optimized out,
> triggering a build error.
> 
> Cc: stable@vger.kernel.org
> Fixes: c6af9a1191d0 ("rust: cpufreq: Extend abstractions for driver registration")
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/cpufreq.rs | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index f968fbd22890..0879a79485f8 100644
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
> 
 
> This change is not needed as this is a private function only used in
> const-eval only.
> 
> I wonder if I should add another macro to assert that the function is
> only used in const eval instead? Do you think it might be useful to have
> something like:
> 
> 	#[const_only]
> 	const fn foo() {}
> 
> or
> 
> 	const fn foo() {
> 	    const_only!();
> 	}
> 
> ? If so, I can send a patch that adds this feature. 
> 
> Implementation-wise, this will behave similar to build_error, where a
> function is going to be added that is never-linked but has a body for
> const eval.

I already applied this from V2, should I drop this change ?

-- 
viresh
