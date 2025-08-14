Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EEF2FF65F
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 04:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755144800; cv=none; b=l0EesKt3Tg6PX2+NFY3BzwEZIIKEIUq+bS3KnX7FvjF5IZmvzgzfdWTxH2dru9NzVhqlyfkZxb2RoWR16VxA8n/+vm/qeeddCYRXhyi0Xf+yruZbDJudez+cBLxpEpb78Dk1EfC/mUieTSAYYv/C1X3InMePypRefni1J0IW6Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755144800; c=relaxed/simple;
	bh=VGzEBobUnqTenM6o2yCYtZykv7kCalxd6Xw2oMoXnPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZrkJNLUn6f+Qveeh70gStjyvvT/Z820RLI2XgNz6q1OGjfkLk8Rg/jnyysd55pMUBQm9X4YFcW6yof8mVa5D7HDdIeVhi4U51wh3gbC0vNAAL9EXo6HxvgUkBNMdlyghdYRHOjQNqilOJZ6e2nrIxlnoH5s3C3RUu/fYAfmE68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=udFrMsi+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="udFrMsi+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2eb3726cso345410b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 21:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755144798; x=1755749598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzto4+R4SEpsXQvu35Am9g0bxExsmpRAPRKsrODRUCM=;
        b=udFrMsi+sWQWpPTCVJQnbUBDRJ7SgIrcbPOqxQTZwc31tnNq/0cYHIgzzPz/HjOMvK
         X6PE4Pj2ZdzANvP7pGRY+qxMaON5pgLsQJ6jo61lC8Ek4Z+68EAthLi+GCO8yCRRKJ/f
         W00JfWphXoqqp7xKPlUP6VWgjOYSb+ipTlgRRhx8rDh8Q5oLj6gtRK7qNc72yInOWrHo
         3ejEftkLGa/mcsilQpy3KpDyCseiPlwQmofsFm60sva6GIUvoPe1meTgmkfYsMz+0991
         kzkT3cuhtvhuziJD+sJb1DE9hGIsjv7YiF14xclSSSedkK5uZT5ZxG2ElmVdhepYWFL7
         wubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755144798; x=1755749598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzto4+R4SEpsXQvu35Am9g0bxExsmpRAPRKsrODRUCM=;
        b=cwYhsIxLZoH8dElIKZZp8LIXJByNnCg2NH+3zbP7RYxXRGE/bPGPrLWBne6RqguSyN
         RIlFKw+rS0V7XUM+pWVQ0VBV2nuEOWee4thvSS8S2RnEkyhooMmevHLr/A2qy9rzplyP
         k4uOD2QVzgiOGdyc+AQNEkGOCSGFX89w+3UfUEC2KfgSyrWtA6T9A0kSfrbjDBprp8n+
         ecvIMCRixVREVfCX+lhWMAfkspVxL9kF8LOarn2hqdGGcCHwH+KJpeUDzK5hQ+Jzt1jC
         wD5uvBM5pbdq7bbJtCMoh8H23OFcbKfeMrKk5vsgDhJZ5XvH+RkNYxzidsIOvWqFAHyU
         suxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYzsILrMyekuQcccqQiu4m0j9gvQuU2h6oCzEbROJeER5yFZ4lH8DzCgbk/JmOEt74lmJzJ95wAfTfiKfKtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKlqroQg6nPo2S65nnTWYHwKgg6eP+OsFAJpxMgrBxQuFHoBe3
	YaBiMGSrt82zWWxyMihxdx/CYmxc6D1lFVbxbBMM4PZMbfPdyZKOrvZfwd8WodSxKcM=
X-Gm-Gg: ASbGncuUwP1hQq/zN2GLpijtcFtgRmRutfsIbw0SVn7SyZFYXUerm3W6T/VhuAI1lVu
	MYW9TDHd6WH+C9fc0+BHZuRPXD6rfvUmMaMUoOHNABKBPjurk4kqF97LJ2XQumtz2NWkxyLUSjQ
	gnGYkpywA+Xfc7DNBad5S/vrTTxh436fnNzooBS8Yafu2B3j3/ZApp+auJ8W+qYEG3ZB9FE1YfE
	PKsWgshyaBZw0wz5WYSb7VuFfDUYy00QoI1ZAvvWzRawozSZv6JM0v12TX1Xb8dlpt5qWi4HjAq
	YAT6ZnBIbKkbJQ+Vi6IfeopV/1RWEO/d8bm/v2c5ZMmfiGY0NO35hCLN/xzMKClEoDvskSDT86/
	BgKrZJPU94KEO13cROs40B4Pm
X-Google-Smtp-Source: AGHT+IHuZAqDG+bKwN4mmEbOegBcVFPvD6aKGH7LaHe89lphIokLJFFNQE++EiGJ4ANYP7KMAZ7a4Q==
X-Received: by 2002:a05:6a00:9a7:b0:76b:e936:607 with SMTP id d2e1a72fcca58-76e2f9310f7mr2697735b3a.0.1755144798295;
        Wed, 13 Aug 2025 21:13:18 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce6f474sm32881328b3a.4.2025.08.13.21.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:13:17 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:43:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: cpumask: rename CpumaskVar::as[_mut]_ref to
 from_raw[_mut]
Message-ID: <20250814041315.ywuxwp627jiphiqf@vireshk-i7>
References: <20250813-cpumask-asref-v1-1-1242aa8e0cfc@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-cpumask-asref-v1-1-1242aa8e0cfc@google.com>

On 13-08-25, 07:54, Alice Ryhl wrote:
> The prefix as_* shouldn't be used for constructors. For further
> motivation, see commit 2f5606afa4c2 ("device: rust: rename
> Device::as_ref() to Device::from_raw()").
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/cpufreq.rs | 2 +-
>  rust/kernel/cpumask.rs | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh
