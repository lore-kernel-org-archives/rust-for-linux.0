Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97850335550
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 06:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765867696; cv=none; b=HmuXHwftT0TqhGFamXXkNZ7c7EJd7i2DxXZdsJJQNVpCw+nGrvi6FlFo6Zu1HkJBFTHv9tzN/+CrTHoCbzh+yWiOM0ng2I6/3gT8pdrzcqTjg4/01NXNaRESVC/zUVwDVLBhyfs6TefxIna65WxZrIRXiZaYH+7BTjRR+HpnDaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765867696; c=relaxed/simple;
	bh=XbjqoHUIU3a1ZFsUT8DFzfG2VSs9bjURyTFJQy2NTwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0lp8hlE/XyNgAptQNU/kLJ5GXW0ryLSzBzATrs44bAE9S4CmY8uKcvG0k+zZseXQn5eEuJM3D1DpSXu6txh8uLKpzg5L0iiQvWv638P/lc46rVs9CajsF/Ojohmp4zayitE31ld6JG8X7XkGZApN7brLVJWm6Cq5wvEzqXuFuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HyVWoQYW; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyVWoQYW"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7f1243792f2so2791551b3a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 22:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765867692; x=1766472492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cXvk5bRi95IWruHOumptdvOPeruXtrXt/fRRdDpxzJ0=;
        b=HyVWoQYWLc4fJR0kjr7X0jLqpMfzVtn23HQWhtcARifFZW68UcR2/Q7JRD5AsX2WNH
         apFi/NFmIaAWPDw/qetF296ImzE4krZ0+oAOIKVMKcWLxZWZJHafi5NV06LQlPU/GOqj
         Pf89QHZRi/ZqTL/QO60c2GAds85laxLqGWgouuX9teJdfZdzn2NSHfBV5oVVSf4+E7nN
         Sipz+Va0480WEjfWKQUyyID55DrhhhvZA43EBIXJDfr6dyaO3ftuXzco5Wb4Q2DbR0m7
         iRuXC9a7ziXJxgY3FvQ40iCNFFSii1m2Hr/opRMMujS6pYskbMuBASXeOs/YSAIrxnNG
         3kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765867692; x=1766472492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXvk5bRi95IWruHOumptdvOPeruXtrXt/fRRdDpxzJ0=;
        b=nIcM9d3N1qkaWRKzg/gN+lGkwsAzBNEYHmYpQ6opURoJn+wq1DXUTM6PN6IOhOtTUE
         vsyx8tZr1ONbpODcYTmJ0/BdkCYaos6+eHxEXewm8viKbhy3P2Z8lMfS9pG8c+yisgF+
         uBqhpGcUSLLUiCh6HAg4G+7kVl1sgCaQ8Fo2bpXPpQ7wPOe0lC+Ke3oxeLoPwCd7rj+N
         MrDFsSeIdKatvtypO8hckeXIGEc5cAryOh5TYi0U+46NWQi/W/Wxs/Z/9jgjmMwOjvJI
         z9gMiPaK/gpY7yq9a8yywsPrXb4Qr2lBTZo2ZrDUysYdLvZMMm3J11NGRyToLc+tsk6c
         p2qw==
X-Forwarded-Encrypted: i=1; AJvYcCWAyo5a/N6tUV0BMuQTPBVPHve6iVzPMKGHky84fLXRFvvCn+2Oswa9TF/A41JyBCvp1QEbhng9QrBW+HdV7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJR5TJSe22TiW895RsxHhpONRh+jhFhs0NAiGtssXsE2UKes7
	MRwSftdw3JAuROihM+9HVP9ZnYOtK4SGJcUknWNQ+PFxaHnpKTWIa5LI3qV8xlYAktw=
X-Gm-Gg: AY/fxX7mbEGPA14ejwBG/9ldC8eOAilWz1H47nZIvuIcdcXZQ/k2vRpoYTlYMcwXTq9
	kj8dfbOz/1H1AJfphMmXtvFQEwn39eyYP5JX4ogVtz5YLBZmvZ5hgK8mhPfjfOJ5SOWnS5p+qu3
	/CyKazlL+CxfQ6kHcTNW3BHNLLaowpVM4zjQdSkmuW49e4EWEw5DzX+mvN0Ut412Vvu9/oqfg55
	Lb/4ZMs1e0mc4zTKKGQFujcb9LI+qHfPUlskWIA/fCsXimS4Q4HVJsvulLK2TRsvVNpDkGPwXAF
	coL4f7z24NrNUsNszW+FOnS2Hq+pE78t2OjVWPs++9YVsPDB6gZ0m8lADAOvyCEc/vm/RsQ+wtR
	gl7ynYLqJIUUPrVFaZ9vJmjumZEn6IM7vI/4xLwuqIlgfmw2Wt+vw5TFWkHyAEV3va+oY08Na1C
	DJrARXNc64AecXVrR/PVS4Tw==
X-Google-Smtp-Source: AGHT+IFzzFaXnJeraUPME9Aylh9mLw15QjjXw7/fzU43Ce7vyfidUr9cW1cN1E1++irSuRY2JI9fsA==
X-Received: by 2002:a05:6a00:400d:b0:7fb:e662:5b9 with SMTP id d2e1a72fcca58-7fbe6620b81mr594505b3a.31.1765867691516;
        Mon, 15 Dec 2025 22:48:11 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c585cde0sm14320732b3a.69.2025.12.15.22.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 22:48:10 -0800 (PST)
Date: Tue, 16 Dec 2025 12:18:08 +0530
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
Message-ID: <xhpapgzctldhwhjdaomu252vqyrljwunc4gis6neuap4x3nppp@rqbrauohopgv>
References: <20251208-io-build-assert-v3-0-98aded02c1ea@nvidia.com>
 <20251208-io-build-assert-v3-3-98aded02c1ea@nvidia.com>
 <20251208135521.5d1dd7f6.gary@garyguo.net>
 <fmdoyqoyksspygcjg3wbqxtqqntunk2wfny6vvt3iq6wddwuzr@a4kfi2hcc5x2>
 <20251215111430.756f8872.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215111430.756f8872.gary@garyguo.net>

On 15-12-25, 11:14, Gary Guo wrote:
> Thinking again about this I think `#[inline(always)]` is fine to keep as
> it can also be used to indicate "this function shall never be codegenned".
> 
> However I do still think the comment is confusing per-se as there is no
> "optimization" for this function at all.
> 
> RE: the patch I am fine either without this patch picked or having this
> patch in and fix the comment later.

Thanks Gary. I will keep the patch then and apply add-ons later.

-- 
viresh
