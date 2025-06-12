Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FA7847B
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 01:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749692273; cv=none; b=rki0QAq3fzkCrYASvS/GVEl0KcBm4kzT95uQhekL/bUjrr8hPHAvihLby/bPh+3ymZG9S15NAuOBBKs0XexluvnzojHxEByAuj7lSaPz6ut1tyhiq8ZQ47GYCS/cZ822I0QKqwQuGIJpH5/mIOj5kdUH8gKE/54ALMU40xPjzZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749692273; c=relaxed/simple;
	bh=EmgxiCslSolMNCzBUoL4OQg87GsLep/G3Phn9Wkt9NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmAyJH5+Kkpx+ISqg4IIVph7FWN7q+Qn1BzTHSVFhIYh6j/aKsXmu9w0bTe8b8clp+/029JESfXvvUhuU781mU/jvmDSOmYQGmcCgmTY1kKRHChrgqjDt/5mV5qHQwyHe7rChK06kT4TAgaTU0K3Qg4bK+B2HcnRQcSOuR1jT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oJAampAh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oJAampAh"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-742c27df0daso392025b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 18:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749692271; x=1750297071; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=acl3HM/gy65MT7QW59o4rGkPJzPE8ycfLTpRSNc4cWU=;
        b=oJAampAhEhpA5cLdKflyLUxnNCqwBAg8wUsGafqBw8d+YGc1yhVYqM6FyrLl7bLTOJ
         VyEQEtnZaDYwsuGtYqegu9ln278lZUhJqeTE+jNhjouFSKht7RcxtaTEZo3v084MtRi9
         SNp/ujiepiAhJ1QFsCgtPUPJcSo+eZdKDDqp41b0UNkWAtB4Wt5zgVItMYWeSkbFlYH1
         aovtexlvaeiMQ8sz3XZYMWcOZyTdwtz/rJovSBEYIX5W19VeOcZgd1Z1/6wC3WAi7ZMt
         jDAaTRek7jOC+HVs84xyqHHHqdWFU01t9o8kIXvpMsqdrq2dHKlZm9sxtf9uxahvx5tn
         kxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749692271; x=1750297071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acl3HM/gy65MT7QW59o4rGkPJzPE8ycfLTpRSNc4cWU=;
        b=E3Z3GBsco0GarZT6Mf+5VAHJ3CgY0/QyfjN+r+sXHQc2aYGlQcUB51umdCiFc/64TR
         nZpYePfp9hNhmczmS9Mg1/30QcmMgNcc62/qiHCXuI9mTWuTyZv4xoFrvzEujZ9qECWB
         7PjGliw6a4t/1q/477QKi3N9pfbuNrLMjZF6MOQdBgpBjiLT0O67XMMBt0JKE+gXFrRf
         1mmYjmNKOtI9Mqt3sSH5JKJ/PgWezdtZ/lxGBFf1oFTb1VCFKJZDqfusskhK4DgMtVTK
         w6ZoDHaZnr4XhRDoFQ9G20EjT6C2fA4F53N+NNI2YZz3Zvi3Qhfa/42ax5K/Bb54Escc
         NDVw==
X-Forwarded-Encrypted: i=1; AJvYcCUspF3HOEDY2nMVLXtsFPi78VjZwuA511WIv2bnDCUWzG4Rzjs4NyC2ejkWkYLdi++jrQLvAUUbRqwFE+MUEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu/J8JqGf1CCSefULQwDBrTmXHhwrJmvrgSt0d6v2EnFf6aluF
	ORGX0Lk7ieZPSme90X6zmm7mmngeUzBaNPPhPaJUwJQRMbq/Q5YHsoDKWgqtg7jQ0CY=
X-Gm-Gg: ASbGncuo9yFJJuJDw9jOzWvnaC/Amjx49xrxM5wfOx8cpZhinuwde1dXXBUadbSZudS
	0DVvQgi5+ZvExbnguD3rLWBJoGbfZTj2yM5Vs70BvUxdWArmNVl4jXM2aZ2zsWsheSMeO19sBcJ
	2BrRt0uc0TcXww+N2gUhfo7SobJ5QAoU/7gRSSyDUP7jCoAnW7O8KwjjuGM+kStZ3UFe/jez4rc
	OExTSaKUgEXtCnijsCo0biAoRqSs9qGEpDtzMUkoiCfVMCV1iFBcyfIRFxWqbxqOBClewMhQbCw
	YH1Y0SnNarKucrP02NHF+xWE1gthe7VhJMCMapRY75N0CTULvFFVic0NhTKAGgg=
X-Google-Smtp-Source: AGHT+IGQb69oSvUbCWxUQ9pS4E1eHVQjsTTq/cBES45AIlrmrVW+OEfUjBX2qBwDqZa2fbH9zp5fXA==
X-Received: by 2002:a05:6300:6b0d:b0:21f:97f3:d4c2 with SMTP id adf61e73a8af0-21f97f3d6f9mr1549747637.16.1749692271459;
        Wed, 11 Jun 2025 18:37:51 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fd611e4dbsm261228a12.12.2025.06.11.18.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 18:37:50 -0700 (PDT)
Date: Thu, 12 Jun 2025 07:07:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Convert `/// SAFETY` lines to `# Safety`
 sections
Message-ID: <20250612013746.psicbrobklub6xvy@vireshk-i7>
References: <4823a58093c6dfa20df62b5c18da613621b9716e.1749554599.git.viresh.kumar@linaro.org>
 <CANiq72mP7tGzZM_f2gRSVcBw5a5Y7vMM3eOSvuAOK=yJeEmFBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mP7tGzZM_f2gRSVcBw5a5Y7vMM3eOSvuAOK=yJeEmFBg@mail.gmail.com>

On 11-06-25, 13:46, Miguel Ojeda wrote:
> On Tue, Jun 10, 2025 at 1:23 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Replace `/// SAFETY` comments in doc comments with proper `# Safety`
> > sections, as per rustdoc conventions.
> >
> > Also mark the C FFI callbacks as `unsafe` to correctly reflect their
> > safety requirements.
> 
> +1 I guess the Clippy lint triggered when writing the section, right?

Yes.

-- 
viresh
