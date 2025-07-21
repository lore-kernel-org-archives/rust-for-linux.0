Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1AE284B3C
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 07:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083442; cv=none; b=kjq8nJ6DX4eTslG5sYPKYyR5LJe/wlC+Ba/5HU5BkSUjOI3hXCNaXSxtslptn8pB7zUqu70YpI9ROk9pDKrCQg33XFLUh95WiRDOyMv2s3SvnXHSkxfnQ8eGIjwfV2GBboePcxGwtbVGfQHWjvzpptCOTaCqfqJik4QmN5uFrvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083442; c=relaxed/simple;
	bh=Kgi56yPbZYI58ok8oxCLNd5/43u9mGkk0C1PxCt4lLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FnVZ3b/77n+H1tSXeOG8y7mj4960RRVkq3NO7sbgyKd5YXkF8P+CDJsQ2pxpn8/6UMdv7i1VhUy9J5ZLEnR2iL3Nhk3knZFKrmH4+q9lv7nNzQQtjnJB8Dwo+sc2H/Cycvww3IvCC/qkxFtyS+KVp4D29lP9uU3diSvFLOEt1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w9BZ1EbZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w9BZ1EbZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-236470b2dceso31127105ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753083440; x=1753688240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AW7C0Fw+OUlttGGnAPG+jvEboZ7WFaopv/dP3AY9iLI=;
        b=w9BZ1EbZHIYy6Uo0SI9IpYdwLxYfrq7y+jNUnSFDO8FyzRcFEnJS1uHbTX18QK63Ge
         Qwd7Stz5tU+TwvxMVg3hlee7R2dmp8BQ0m0SBqfqjKqP3usdwC30r9xVjH+7lZTy+UCJ
         BJdRfSMkz0vXXDZbfuy359xH5Mn9whuJOu+BpmZaWgLzlD1tJt2Ke1A47p8YWdu++tJj
         eS2E7B1kMJn5hy5ZRHiomRfvI9oxNUvcOi2+kwuSUwFkyXru6gvE+DHtQamKJS4zHnH5
         M2DUY0CqnLM/Gt9X529iaK4areMtHrUjINlmJHXCOrfjis0D3bpLjwYSARh6Iwux7qhx
         mmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083440; x=1753688240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AW7C0Fw+OUlttGGnAPG+jvEboZ7WFaopv/dP3AY9iLI=;
        b=peN9PvjBVSxO+jz3VL2jWPQ6ahbN9IqbiZ88/C1sM7S+hNJiXBE/9wDReeVcVR9DE0
         rl3JT+Ee4ZnmQFwYdpBZZzNxKXPtcKwCWtE8m4GB2VX6Zy9NXmBYqHsX+lxZHfUU/jhD
         F5YJr95rsBEXe0XwKYYlKOpHui79KwulO6WptiAv2Wshcpa/bOoOtFfw86mkrF9A8Nmx
         ruYPGitd2SoujtWJdxj4RiBedh1GTB70HxAuC4qu48GkBgpd12LT6QJOLXm6+skPRRiR
         7NiBEAqbjpgsRbiL7A9dEmqVSG6gaNdgFiFjODTSBhSYx/U/LHzy2J6LfguG+/4iIPM1
         WhtA==
X-Forwarded-Encrypted: i=1; AJvYcCUdiN8Tv/jivTmZDtZPq1Q+QG750pof6mnSkGf75az0dxRv6y+b2FQCpgT0kgKolbA5OpndQreU6Oj2TxmVPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCf4yQj00SbofrHU/1rb4fXVeepsR2sqS66S3d/fbJxKVaFn5L
	SgL1Do2Qa7BYEswjqgsU2GvPILS/MzRnKPwE5NeXN2+WbVmiDkP+UTeDvBGu6jfjoNY=
X-Gm-Gg: ASbGncvGzA0J60G5yVwZqsTDziZUsgjN87ERX/RdWKYnWrPdxulBDYUmtmOOgZBlj2F
	1mUwdN7MU9n3FddmC9fJcBYV/PDvyVimOn7SGm4wJM4dl2s1hu3yhbpUUsurAmYW4Vz+1WBwHVI
	xw4M1K/prtYhj7N0LJ7iH775HFl2Hv5QzJWTlkN2S1G62FJQ9gSz+3odNZs8e6PxfHi7oMwG/Tj
	WcWt/mXYmaAe4CwCg5yd3jBf+Uwv0aocnDL5XzJlpBJ2t7h59v+FCEBz2sZve8nX+ibiUY1sxby
	03y+RBqE4isPC58SEik4o0j5bJuKs/sTK4W3bQ18zFfhc4+n7bog6ncvPuXPAUjF+AFOYAzjIqP
	NGDD8jY23kRUPDUOJVwIdPnI=
X-Google-Smtp-Source: AGHT+IFk3DmrxLSOuu1QML7M9aZcW/M1lwjmHi2A/P/8p7kUrsmSSAAA7m474B7f7eHzVA50L8YW7Q==
X-Received: by 2002:a17:903:1a45:b0:234:c2e7:a102 with SMTP id d9443c01a7336-23e2576c1bfmr262018575ad.43.1753083440496;
        Mon, 21 Jul 2025 00:37:20 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60ec88sm52502155ad.65.2025.07.21.00.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:37:19 -0700 (PDT)
Date: Mon, 21 Jul 2025 13:07:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/6] rust: kernel: remove `fmt!`, fix
 clippy::uninlined-format-args
Message-ID: <20250721073717.i6hr4iesfupzvtwf@vireshk-i7>
References: <20250704-core-cstr-prepare-v1-0-a91524037783@gmail.com>
 <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-core-cstr-prepare-v1-1-a91524037783@gmail.com>

On 04-07-25, 16:14, Tamir Duberstein wrote:
> Rather than export a macro that delegates to `core::format_args`, simply
> re-export `core::format_args` as `fmt` from the prelude. This exposes
> clippy warnings which were previously obscured by this macro, such as:
> 
>     warning: variables can be used directly in the `format!` string
>       --> ../drivers/cpufreq/rcpufreq_dt.rs:21:43
>        |
>     21 |     let prop_name = CString::try_from_fmt(fmt!("{}-supply", name)).ok()?;
>        |                                           ^^^^^^^^^^^^^^^^^^^^^^^
>        |
>        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#uninlined_format_args
>        = note: `-W clippy::uninlined-format-args` implied by `-W clippy::all`
>        = help: to override `-W clippy::all` add `#[allow(clippy::uninlined_format_args)]`
>     help: change this to
>        |
>     21 -     let prop_name = CString::try_from_fmt(fmt!("{}-supply", name)).ok()?;
>     21 +     let prop_name = CString::try_from_fmt(fmt!("{name}-supply")).ok()?;
>        |
> 
> Thus fix them in the same commit. This could possibly be fixed in two
> stages, but the diff is small enough (outside of kernel/str.rs) that I
> hope it can taken in a single commit.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs    |  3 +--
>  rust/kernel/opp.rs                |  2 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
