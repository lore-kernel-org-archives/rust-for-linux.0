Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59F32EAB65
	for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 15:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761233012; cv=none; b=rIaTnMGjPAQppPwKfsErS9vFrGlDFRjlkLEqAwzkBlY8hw7CN+O/6FDAdyjbN1q4W+9DBjGDi7FbJerpRpYm3n8LYrSMHFmBRjOXNcBmdBYohF/ckWqhPOZIgEob7lB4WCvGEqliElE7K9WgB6ZZ2y0Vqv9TTw9ebW6zTtnc/48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761233012; c=relaxed/simple;
	bh=YCILTNSbyosfdViBsQ3Dn1szo1k9Lccn/kFvybxH4n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HycWZoTyPIu6OGE/vNMlwvSCfeTLYcllRsA4zp1SFHBOU/+aLuc+zcHUOpIfCefsW6qjqE3xSWwUBifzS8ezIgrcl9tfjWzxCZZ+YZ9ymqFMY2D7r4iimzMTD8kg0oFrXfx+LdiFHj2t8FYQ0lKLy0FP+XYSPZstxLD6pwJhLDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=addQnBq6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="addQnBq6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27c369f898fso14588865ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 23 Oct 2025 08:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761233010; x=1761837810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Jd/YojK3x6BAqKg2xzVCUWKgrECDyhwMyyAZSD/iCQ=;
        b=addQnBq6u4m1d4YQyx87rwEkhOeQuRPuWrOJza7CHZUj//K8wYOqPMvyXt7HAfXZkO
         1FBRuqGjEoPPXLI5On83j67UXnVVNEwJoQ/AUSeFtvzwl43ecYB8knAQaJk6yCc8nDOV
         4JcKUdPjO4+yMiWwavK73utMmIYqmVf9BVy9jIh2XB4S0LhYo4kWAsyZ+73aONbLKSXN
         ZbkgLRaxKPV6+OItxljaOfJ7jvzNis4HhG/BiCPjXN7+oGpw2OS8TM2KOMylcgMsOwv+
         xwXAfIA2xU/KN6u0Md2CFTNcquJX0TgRfrDljfzf6Gn+kX70GaD3VQDDoZCXj+H7o5E8
         EZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761233010; x=1761837810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Jd/YojK3x6BAqKg2xzVCUWKgrECDyhwMyyAZSD/iCQ=;
        b=bcZjncUFvACikz7yWR6SJnCQAdQ4WR6akHMBbro6dcd6A7JcN4H5N40vLQF1NHM+2u
         dGm86u2EcbfLQgMgHGQKL4YehisZr9SHmhGMRtLUCWH8yedvdk8V4SFV3mZBklqZ2wEj
         MTGlBf5ekOXk81unYLtFXvBxqPztl3/GXan3FM/HWr/TOXjovMflaEVVjWCdt04LVcHB
         lBhES+GJQRhfdlQR5lOJkcPvcbLg2jrETsE8gOI2Qyillpsxh5CbSL7tCuPrPLw89dXg
         5KSAi05xeL9ADX8oyUuNmP/HGnO+9HYmJppC15CUjTqla1CeSHvuZZY1dGSFKorEtR1v
         jjyA==
X-Forwarded-Encrypted: i=1; AJvYcCW+xpBogonOZYyLR8RqrJ+XwTh18arHEv8y+USUCt8jTYu+p/S0rQWzZDKm728rL/00757AE6DOdZbjGo4WuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEM/uCh1naMNlpJBaRfqw14lLCerpnPTJkXXM1Y/OoG2F3MJmg
	CkLpOBOvN3bKpLCyKELIc65CS5SFWw3hPP8gWSl5cWkyu43Co57K4YO7o5FILKmpm9s=
X-Gm-Gg: ASbGncvHMAexrhap1t8VMuWX7v1qKsfkMyGDJC9pDCMU5tJmX61A6vGA/EU12SKm9an
	wVQDcioa8ogNgjHjAcrZo2CvyglTey5eP/DMrqLIwzOykJHQB/v+FB8MnvuSmWK+rMFy4ex7W10
	b0n0Bh0JD1YUcH7XOe5C2dYmoAztxQgT+F/zZep9mxj9tm2kcKlEbYvby3VYsdE8yZiDdCSg702
	LB1fVVELtrLkLUE1a9rIISFx5Z6A3Daafo3uUFpFIHVYa/+o4amPT88VSBOPpibYiqop3xID8ej
	rcOqcr8Pr3Dbzve8xeBfXMNSrbO8tqzYVonv1Y5StTRGYKPk0yTdJyftqh+qKUIZfrLiYIDd3wU
	o4RwfDj6ydZiJfHIbi7BY0qFFQTuaehxX/Rm7DDhscsejQp+j6855MfmjYGPxlFL5KADmF+Qfuv
	DK4w==
X-Google-Smtp-Source: AGHT+IHq3h6LfhWY2rBpFaDKhPiyqhG73CHPD/V2qNHnHKDNAg0rCU4Vtju+XrMqjCggiDc/6zvHtw==
X-Received: by 2002:a17:902:ecc8:b0:290:c516:8c53 with SMTP id d9443c01a7336-290caf831d8mr319027295ad.40.1761233009992;
        Thu, 23 Oct 2025 08:23:29 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f5de1sm27115915ad.87.2025.10.23.08.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 08:23:29 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:53:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: opp: simplify callers of `to_c_str_array`
Message-ID: <gjlcd7nrmipdpim4dr2kfrk5mleo2yt2btwbhxdflzfcpckjjl@fieqlaavqja2>
References: <20251023-opp-simpler-code-v2-1-44230ed00fd8@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-opp-simpler-code-v2-1-44230ed00fd8@kernel.org>

On 23-10-25, 09:59, Tamir Duberstein wrote:
> Use `Option` combinators to make this a bit less noisy.
> 
> Wrap the `dev_pm_opp_set_config` operation in a closure and use type
> ascription to leverage the compiler to check for use after free.
> 
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
> Note: this diff is much smaller with whitespace suppressed (`-w`).
> 
> An alternative approach to compiler checking for UAF that doesn't change
> indentation is to add `drop((self, clk_names, regulator_names))` after
> `let ret = ...;` but that felt more prone to becoming out of date if
> more owned data needed to be added to the function scope.
> ---
> Changes in v2:
> - Avoid use after free; add compiler checking. (Thanks Viresh!)
> - Link to v1: https://patch.msgid.link/20251020-opp-simpler-code-v1-1-04f7f447712f@kernel.org
> ---
>  rust/kernel/opp.rs | 112 +++++++++++++++++++++++++++--------------------------
>  1 file changed, 58 insertions(+), 54 deletions(-)

Thanks, tested this and it works.

Lets see if someone has any more inputs, otherwise I can apply it.

-- 
viresh
