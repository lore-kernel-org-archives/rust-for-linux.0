Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA203233158
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 07:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319970; cv=none; b=g7WqAABKTnAVb8UNI+fKFAI+gWarB4OVyM71hBp9P6vbU99A0UUe9JyQl46w3AmX6wf1bcemaYk2F5yW9h2NY5xckMRTz/B5/ya3tm0Mwn9eK5VsZolJZ0QHGS6JU1u5e0mBwcnMqFqWHT2FH96PwHkdB7uBXRIiL4NDy3Jhr/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319970; c=relaxed/simple;
	bh=qmTIT7TE5o1AMakCWk3TpcXBKxAE1s7w+sHy2Jg1Ohg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZRFxAWHGUpNruUCQcchyNOUDshOLQo853r27M4uWyOcU9ZQsgvn43ysSRVAu6lRgNPJHIjKEvIbEX9lXwnqs9yHOkiQiWdjL/tQ/kvyw5oLVwpN55Qxvh8UrrIO/ilT0DPHhlBeepYk0ZZl00BBXnR12TYVFByVm7Uvfyb1e2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQbawT8v; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQbawT8v"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748ece799bdso300822b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 00:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750319968; x=1750924768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cInoigfZTtwglkgDR0xmxDXjKijNgKERgzu95Txxg1s=;
        b=JQbawT8vXjHrPpgSDiE1rFd2j3uEEi2DZDhzu88zYO3p+PlrjE6vhHDKVEsEQWUVMJ
         x+d15zGQnG6RnIVCxnTDYczGQygUO7tM2sxWQSCZuZIxbvgJIoIopgUsyv7XF9uHyHOY
         /4xHhVxUQfdMFX2ryT8mLwsh+PIm1Kj7ut68LllZCgzSY9yTF8+x5UC7FDyqM0fD0INi
         h3BaUmQvk1fS6bBdpbdNYEmPQxYbKqkSI0wEh3byA/Iq2Wf0ajZJ8OGptrLMlU8w4/ly
         YYtEQ9fqQs/tjsMuVT7aidnMegCf3Ns6Mt9BwJS9nmzJ5dbPQubeK+96JusCVNMH3tYT
         Ovpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750319968; x=1750924768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cInoigfZTtwglkgDR0xmxDXjKijNgKERgzu95Txxg1s=;
        b=QsGOyEgxXcAh0LZYF/GNlnyJZ2Ao3JgQ7TA28tTAQJPF1I8VD3DAzdLwrZFYUFjZ8C
         wd5yN5U0So0bn2NB3mJRrsDyMp/8kqsE/mL7/zfHrBlLDrz1IaHJSuY043r0nZRXH6sX
         WSVy/c+mtdNWdlQ47nxTnFHGQsNe/P0SGIrYDMMdsBwuRqE9gPAX030CX9nrF/W2hsg1
         TmgmbiKKOpBFvWDvjWbQ0W1DYf3jKeNPq/3WpOaCHPTDWtr6xZco5XiOYdDspmwsWbzD
         8I6sTsR0jLzyyLvFL0SAr6svgq71J4q7St6E23r0lnVIEKt4lscCAXT3u+IxEnYbuIp0
         EFQA==
X-Forwarded-Encrypted: i=1; AJvYcCUQjd7AfujQ3BoqhNFROCA5Mmtufbn+Bj3d2XTqvgLRgo6F8d6yXL8BAIMUwLz+ern3s+E7cIuxkhSglQy+cA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxo+CZpI8l/nM6djNtPD/Cu+hX411p76FbZB89IPvb9gdBwrR4
	ohm+bq5xhxxu9b3hjgaHJu2RH6Dcjunm3idHm/vXMQxs85X1fGHSV0Z6EkPFmJuU5vw=
X-Gm-Gg: ASbGncu3uy+8B756/Zog7PKijYFo6WJjhcoh+umpywji2kC8RvAn7+rZRQgiOqq4seb
	6KIbvK5zVfrp8DqrGnJwCmn40vnvfGJ2Ea/tgCyvodvpz0z0gTZ/kqleTwoDIzzCJB6UTpyy055
	/G5VdCYOFcpMfZTRJznpSOt4dJkwuzXRf43j9tkVhmu7PBOSgBMoLrsQb4e+GwkTxliaqkiPa2r
	kGY4Xn+PXGaM85+sIPnYi3F7mJLkO8GWgeTyeErkeWuyYAKO6gUYjVpaFabJvoRWdRznfFlwCWd
	DQqMdmvcUjXvynJslMeQCvWTuX7Ujy3+d1p0caFCjihBhyMwKTsk6VmZ+3w0Nnk=
X-Google-Smtp-Source: AGHT+IEHfU6bbYUYkS6wqhh+4RphCH4wKMlMEHQgk9iyWb8pXPgDQPEQZzKXARvmNYDg3J/wIX8yOg==
X-Received: by 2002:a05:6a00:3928:b0:742:a111:ee6f with SMTP id d2e1a72fcca58-7489ce3cd70mr22825218b3a.10.1750319968295;
        Thu, 19 Jun 2025 00:59:28 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffecfc5sm12951000b3a.13.2025.06.19.00.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:59:27 -0700 (PDT)
Date: Thu, 19 Jun 2025 13:29:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Abhinav Ananthu <abhinav.ogl@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: cpufreq: Ensure C ABI compatibility in all
 unsafe
Message-ID: <20250619075925.b2s4ngza75kc3dsj@vireshk-i7>
References: <20250613101815.18092-1-abhinav.ogl@gmail.com>
 <20250619065713.hm5ye2uhikaei2xo@vireshk-i7>
 <CANiq72muPYoPGLrb7jYWMqbWgknMuWJSPMdFPRQMFduFsDTs0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72muPYoPGLrb7jYWMqbWgknMuWJSPMdFPRQMFduFsDTs0Q@mail.gmail.com>

On 19-06-25, 09:32, Miguel Ojeda wrote:
> In any case, from now on, one should just refer to them directly as
> `c_*` (please use the `kernel` prelude for that) -- please see:
> 
>     https://docs.kernel.org/rust/coding-guidelines.html#c-ffi-types
> 
> I hope that helps!

Thanks.

-- 
viresh
