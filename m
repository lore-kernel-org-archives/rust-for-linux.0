Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71870287241
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163998; cv=none; b=Mc/8E6ggz6q5zTJALPZoL+Rm3KqQcRCf2VfCbDrzGsYEo0fWkhn/nSXJZ7F15Kp7faN/2OJCL5ydbbVVVOYg78HonpT51/oAHJQA2tTOHFe3xILKPbO3sQabdjofebKmtN6dnL+DNAH7WWJ94wMhzAIMrCGx8LJqKA69DhY4l7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163998; c=relaxed/simple;
	bh=0gM4P2+1/T/+38ZTBChRF/kXSK6T1iDcWw4qbZja++o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YcZ1bM7KIQ9F4rYO/DXene+Jd903Pu3f2IjU248XSV2TTWYlfcpbuTkztRSprhkDEArRt3FWfjG5Q0MTw9kF/Rxzux7uQ1V9PLuSZSnXfLB6Z8q7npXes875PM3Y5bH5aSLCKllirG1g3XLd9fa4GlxSsJb5BdR/K3rDKhnn09s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YDBscpxD; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YDBscpxD"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e2e88c6a6so711939b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 02:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163997; x=1755768797; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=97uhtudkNMK5UOUbW8xAkf4ktNa2lEEMb/M2K9wPi10=;
        b=YDBscpxDfuxNoFpC8tHnWpRopz5ucs/vCcV50Xyl57Q9Dai7rsAQdobrrda7uxi/cm
         GfLHQZhHtnBDJoqv8sFtrw4wLo0g0LASeXo9KnOXTzfqlWMJT0nGnabtjQVgM9aYTnUc
         n9RNRg1ovKQ1nCU8CIefO9RV2Vf+iq7Q62nHsYGaq+ZaPVO57UDQYMNEjkX/LuhGaeTd
         SQydQ+K6hEGmnwEI4mtqOhOyWphwGgvKGKhYIbtPujOsjrZDDZhjWA0rwEgNlArLWuzI
         pxNiRcMuIlL0/VFrqZUc+jBaKX9HxZbQlOZkYWopFAfB/Gwjyw3zXcnvJHqGS5Anzl2z
         icXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163997; x=1755768797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97uhtudkNMK5UOUbW8xAkf4ktNa2lEEMb/M2K9wPi10=;
        b=sIe5fqZIffEF5UrzJuoq65WpeZu5KtHWe0xoRw/Hg1281CepxsAZ0iTuLjOJCAG4Jz
         hXAmIitFgoUAVEvYGpJVfEa8nmxBT5MGO2GgamTP3//L3k/MGOWE+PGrRU3ypE+7k2AK
         tZ/QRbnehYpOAh3JIyHPH8tbGTfftOkf4euJhtCIS1xyrMQottuKGvTHqskrKNO3O9cr
         LgsFFOxgcAEJ9lIeKTEX1rdUGjToERT3yq3hKxMT5SKKbjZ4itgnYcjFXrQ8QkTCCn+W
         01kDWtue2tqs6a0HqBehbX8o5giXVSN+vrcOJIyQah3XlCPTV2XEfrGm80Aq2O/aDAyD
         XBfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+IpDvzv7GaCLM30VUFoVvnkGtK7pn16lv5UvB5F2IgyqGpFyX7mcoyPPF7zIW3s11JNqbdms4PLH046iqAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrmRGM4bJyt/lmeE6YKY60pUsgt6km/WZo3zxukm85IiBetDDt
	4anIs9QsMfHbMloS8YfmS5DCVe4CM+iR1MvThyJBKZO9biGFJDxrd1Fqzl8E1sKVpbw=
X-Gm-Gg: ASbGncv0Mmzs6i73EcwhTu2M0cFoh+zek5OSSziRSiM8v8ixpt9Em/60SkzsUZJ3598
	wX6v0YmpofUmQGCxBSIokQupG35FHZGzRLB/K2YBZsukaD/lao69JAPsDnAzg+2WVPFA0dj6pRW
	il1C+oZS1FSc1FLDdqu2Ac4J3g735Mk7rbd86g4TQqJdflqOTJhpA+j+7CLvveYbG+fRCoWA+YE
	/tK4ySa5A8C072M7Og887IHLJwM61QMm1aUjn2ZQ/V2aWuT9uTfdJjRxMOSvauOzkjXntfKS2A8
	Ws1oCXjxOMPWxigYqcztOaOza6L6uqkGeFrwzfK8onrwis1vDJEEr1VJqaTP/DjtSM1Ce3tQaQA
	nX5PQZehlPlP98bb4qju7fY5F
X-Google-Smtp-Source: AGHT+IFy/7RDjF0U+OSnhBCxHWxK5dAZ48NiN2cIVg2ZnqQ/azV24PgRQXm1YdY8wqvBXOnUK4P7OA==
X-Received: by 2002:a05:6a00:22d5:b0:76b:995c:4bb1 with SMTP id d2e1a72fcca58-76e2fd434e1mr3525599b3a.15.1755163996646;
        Thu, 14 Aug 2025 02:33:16 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcdd40f63sm34159888b3a.87.2025.08.14.02.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:33:15 -0700 (PDT)
Date: Thu, 14 Aug 2025 15:03:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Benno Lossin <lossin@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 11/11] rust: cpufreq: replace
 `MaybeUninit::zeroed().assume_init()` with `pin_init::zeroed()`
Message-ID: <20250814093313.wossgn7jk35pc4c4@vireshk-i7>
References: <20250814093046.2071971-1-lossin@kernel.org>
 <20250814093046.2071971-12-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814093046.2071971-12-lossin@kernel.org>

On 14-08-25, 11:30, Benno Lossin wrote:
> All types in `bindings` implement `Zeroable` if they can, so use
> `pin_init::zeroed` instead of relying on `unsafe` code.
> 
> If this ends up not compiling in the future, something in bindgen or on
> the C side changed and is most likely incorrect.
> 
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>  rust/kernel/cpufreq.rs | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
