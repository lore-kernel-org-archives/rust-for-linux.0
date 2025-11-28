Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18776306498
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764323753; cv=none; b=ZDDN9DYOSZh+6x08hSPg2dbiX5G92DgnUxn9Yh0xyio1SZulg87kDH63oINkun7G3loUUq6BdaSOfQopr5M8cU7FT1CwuLfRU2b0gOETNETekMeGz7FGxGaQ6IdLWasJHBw1rIlM/0ipjHDeJK30AVpyQ1tiIJKcsS1RLE+o81Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764323753; c=relaxed/simple;
	bh=Yh0qa9+7TnDcYJAi5o9Jbm9rjPvdBTg211WI511CX9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/ZBODis9dXE8AwatN5SdjULvBpojCQ3Pth/r0kTst00URCshcG+bRHw2yv0I1+qoEQv/KExJuILLUclU4+TtlKskYQFq0x4I/G5bZuvpqStwkf/zcOETnJSKHJK+uBfgDRRouWoExedmV6isIE+QkvaEb3CjyZ4T0tbEc5UjZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qHkOmX2s; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHkOmX2s"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3437ea05540so1327078a91.0
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Nov 2025 01:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764323750; x=1764928550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1GQvR/dGLaXXvOzopxgqRz4uco6G3zBSS5BQmIwFNkE=;
        b=qHkOmX2s37bw/Mw/FgyClagkl4/zQ8c1rVor706ZWomblTbvFrWelL0DsbqMmv+BJJ
         V7dbK6dz6ygz92L2JLeqbMKE/YLf4NLyOgLP0cWaU7swe9kL97IlpuCLiCqoWdzsN80S
         LvYw35MkMjOCFEEwnULHgA9GsQXdiNXvXEUoYPitkR7AZoPjWOYOqcHvGlJFsqzkx0Da
         Uq0ybqbfNW1wVeaNCzhIffQqBkBDvg6zqbAd1JuJQIEbw36zb7+kZaFQkY3lnayhiXf1
         e2aDPw/W9h6v4sTxu9/7P4yz9gvvQ0DqwAkRM22Q1w19feHQ83HMOnxBsMrp00hf0pXi
         JBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764323750; x=1764928550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GQvR/dGLaXXvOzopxgqRz4uco6G3zBSS5BQmIwFNkE=;
        b=RPIjEz9YUsc9te/ZobyNg9ZM99wqGk0Uu2sVHnq5FylksyxYhSPb+N2vxLPSVExpo+
         y2I2PY3JUPWE8pvJ0yBpXEa2ztqDW9RNYwzQV/zU5bQoI+fDcjGhSZyRFFb64b+xmONE
         niVylD3Xk/FpV9ZWthYPeStHUKjQ5F7qTl7SOMITtn54da9S/yTySPBw1VtzuEK8luwR
         NaobpGdxPywZy8ho6RvRgBn9vfJzwO8OPzofzbouCNYJFh2u3lgOa9QKB7uWhrLfNIrA
         D2BvAyOJpd3b8PioI/qQKIp207BGIP95IGMZTdS1r0StHdh8dMDT1dDvxPzPIcBlYfdR
         r+9g==
X-Forwarded-Encrypted: i=1; AJvYcCWSOKsytaRZYI4utk+4bXpgsPkUn13FbKwb6Gw0Yj4bOvWMq7I/Jxlqi+6iT6S2JFV2JH6LQz0IJ4qZITejtg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr0Nk39HkvZw6+rmbVOwlRrBxBn17fTYah/2vRBmM/XxlWZ0Zp
	s84N9XUFFgpaXOkXneKgezLWh/ardrPjg4L9VXk5FVcNeclDTc3N6c/rLZvvqpSXUac=
X-Gm-Gg: ASbGnctiHVTpYo4P5+UAInfqdtSKdpe+gqZIgrdXcWXdaESlJHWviN4x9eRh0+F/kc4
	aBERld2k+DJjZcNRZpJSQy3ywjs7sk2J6enEESd7HOxQiz/FellvdYI8fnF3mKhpv6u59wxYJ7J
	wA1bK99UKdE/++m89jtiBIXkwZj9zFWxJ5v+IrgYEzsazWH3VxAgxmeOOfnFT9O4oiYluXU8ufy
	gJm+TEktqHywT6vnXhb1JtZ4llYcBpBO0+FjxnsU9Tq07+jU70e/J7DLy3P9hD/c6nJq8+bi0r+
	XHtPvA8qL2ARnB1JeTAhO5vsNmaS8sJM2fvfMbOVPdseEvaZZQpRkNvzS5ZwpAxcJI7S7lfMod6
	SmwJlb3xvYCk+jsMZE7t0WMssKVmv3nSANsB8xyxSiPtl3XSDbaqRTNkInJQx5pwFykU1pebj0K
	1bDvdX9EUIJ8U=
X-Google-Smtp-Source: AGHT+IHVI3H13LgN3uGIrowpvtCCzadADr6HEh7p6FG1497Y5qGScUqwnaT2Tt4XLibuJQzW97Ij8A==
X-Received: by 2002:a17:90b:540b:b0:343:eb40:8e01 with SMTP id 98e67ed59e1d1-34733f4ab79mr29222159a91.27.1764323750109;
        Fri, 28 Nov 2025 01:55:50 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-347600c9180sm4104512a91.13.2025.11.28.01.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 01:55:49 -0800 (PST)
Date: Fri, 28 Nov 2025 15:25:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 3/7] rust: cpufreq: always inline functions using
 build_assert with arguments
Message-ID: <4govqgwq7yd2dbymkw622usjgiebfzulm2wmsnjje5q2vku3kf@3dap2mxn4wxa>
References: <20251128-io-build-assert-v2-0-a9ea9ce7d45d@nvidia.com>
 <20251128-io-build-assert-v2-3-a9ea9ce7d45d@nvidia.com>
 <zis5k4oo3kq6dykzm3kav7rlblqvvnk43mrcvlwyxxfgwbpmjt@6r3f5432vr45>
 <aSlsQmiSCC2ZdfLr@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSlsQmiSCC2ZdfLr@google.com>

On 28-11-25, 09:32, Alice Ryhl wrote:
> On Fri, Nov 28, 2025 at 11:42:55AM +0530, Viresh Kumar wrote:
> > On 28-11-25, 11:11, Alexandre Courbot wrote:
> > > `build_assert` relies on the compiler to optimize out its error path.
> > > Functions using it with its arguments must thus always be inlined,
> > > otherwise the error path of `build_assert` might not be optimized out,
> > > triggering a build error.
> > > 
> > > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> > > ---
> > >  rust/kernel/cpufreq.rs | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> > > index 1a555fcb120a..df5d9f6f43f3 100644
> > > --- a/rust/kernel/cpufreq.rs
> > > +++ b/rust/kernel/cpufreq.rs
> > > @@ -1015,6 +1015,8 @@ impl<T: Driver> Registration<T> {
> > >          ..pin_init::zeroed()
> > >      };
> > >  
> > > +    // Always inline to optimize out error path of `build_assert`.
> > > +    #[inline(always)]
> > >      const fn copy_name(name: &'static CStr) -> [c_char; CPUFREQ_NAME_LEN] {
> > >          let src = name.to_bytes_with_nul();
> > >          let mut dst = [0; CPUFREQ_NAME_LEN];
> > 
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > 
> > Lemme know if you want me to pick this instead.
> 
> There's no reason these can't be picked up independently, so it would be
> fine if you pick up this one.

Applied. Thanks.

-- 
viresh
