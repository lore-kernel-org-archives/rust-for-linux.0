Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7197FD
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Mar 2025 04:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741236495; cv=none; b=eNr0k++9BMZs9ERZfveFk1cedOv9YL+Umz8CRRgyEYAOZg1jymQ51+JKI6CVsCElCE20V+Cz1UoFfzw0rr4pr2Gtz39ZajbONUHaB98elOscO2ddTyHs5QhAcIiSWR3KPQX6RLclMlpJsGTUq3IVg7PfywgQdpfJINKso2qBNd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741236495; c=relaxed/simple;
	bh=SkKfQC6CZcQpKn3fA8/UGW3rZ+8PsyS1MkVPLxlRNEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PNNBrNPuC4Tg/RTpOQf1n5XJwjcBT4RYAeyCg24WnsXBP3eWDlMz/n7vimsg7eoi6z7Dg4HTVBCNRHyCAt9thLN0kASqcQfOm8M54xssNki/VOER7Ogzez6D7x9Paq5K8wUCeJIpKb3TuJUPz7nxx7r7j+EKE3Rlqy5h1Da35fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bMpHgUwP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bMpHgUwP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240b4de12bso4630825ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 20:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741236493; x=1741841293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVhCeF3zfzn4fOX1E4nH6Dq1VG6iFwnhwgnMjYfbfh4=;
        b=bMpHgUwPQQ3kBe0bHMxiBD4El/qNbW0D6ULjA0jjV1iyWPU4110SJdFhZHRVXDOfr7
         lVh88ROeGXrddGokIVlm2rKDWy9k6hol2v0nxuK2JoIWt4RkcUdzQsMy3CJd89u0C7RG
         r+Y4Y2/yWLmf14owCWZ2Lz1IRb8OpcmPn1YkDNLCRtUcAZJx109N7GKTp81pG75T2FcF
         j3hp9vWinhGqu5I5Xq7i3FwJh5QcBpRzUUUILSXCJKpToBUyoNwqhpH2y9Ewta5yot8R
         OealpzSFnOxNuw7b2410LcPSPcqvUEWn//NAphrv8lzirFTzgLM+kAeBt1sUe2OHRCly
         Q5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741236493; x=1741841293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVhCeF3zfzn4fOX1E4nH6Dq1VG6iFwnhwgnMjYfbfh4=;
        b=UXcG4bT/leTHWT8ddiDC8NofM7YctUg/aWUo3FG3Eonoab9+FT9acfgd+mzurL1o/Q
         I0DSWK2UxmxpC+G7I6Slu3K6OpMLbmCphed5MWor45ZlSYn5VFprUG3DygBSYxAmpXF1
         QOTVg0E8l89NgoXkVKWakvO8QLhGtsa7wjGOPLm3ZKcT4Cs2Qc3d65a0o5ap8dl44sGX
         WTfMp6cGQg/MIdSlHKmaWfxXjrSDZFc5tgqtzJOiV4r1D33Jv8/8mtLT+YBnh75vSszP
         d6q0Qhw5V5vGiJBiBrc6g0wLojPAIFDHGmfgf7lhQLmyE0Lh+ANV9Y/+v8wdZAF5RuOZ
         xx0w==
X-Forwarded-Encrypted: i=1; AJvYcCUOuSTlLlpGDtFgUg5WLdnsh1dEhVM3SwJvGtsUYp6UrjjTtq7QwxNwpITClYZuM7ZUPO3nvC/p2jvtXWBNMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyS7CrxlYktUzANIrDR89RPhp+xsGcoz+mjR1Fb47BKqcBhRQQX
	ezWnz9ynTm88jum4ZX1svvIb9Xyrplh2eDO2WB+A/HyLm8GSg6rPtEFcMM9/fzg=
X-Gm-Gg: ASbGnctXsGF/ZsraSQ2TmutZCi+jUjlEgjjXoAF8YqIgmqIy6mmS9U3Q9lUOEynEsyr
	O2QLtmoriBasL1Jxt0shQtP0OP+sy8+BRsFUdkm6YHQFqrbdbST0R+vyiMGE0bMSAvjC46pON9Y
	YWB41k4+JwCjiWH9+OrrZdqhZA4hFtNj78i+InxcHy6zZGLjjaBiemJzjYyj25xbpobFLJozQ8h
	osCOI9zsrRJgqekGW0s32jiOLsw7NG4veHeklIJOwacrwwzuzUNJa7TrhPeXufIw7fNe8PfcY5p
	XLw0AYKp5BQRmn8Z0Mbs7fRebqohppVurd1OYXGmArt+Ng==
X-Google-Smtp-Source: AGHT+IF/7SpYm7RhZEOVyZQ0/yR2A6FRsW6wiwdOD3yjpFUdPfld11PpaLDCbSfVpUDCWJ0TInwjUA==
X-Received: by 2002:a05:6a00:4f8d:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-73682d10227mr7674703b3a.21.1741236492786;
        Wed, 05 Mar 2025 20:48:12 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736985191cfsm333947b3a.145.2025.03.05.20.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 20:48:12 -0800 (PST)
Date: Thu, 6 Mar 2025 10:18:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V2 2/2] rust: Add basic bindings for clk APIs
Message-ID: <20250306044810.mqbo74nc6ch4dauw@vireshk-i7>
References: <cover.1740118863.git.viresh.kumar@linaro.org>
 <a0a1ba4e27c3a0d9e38c677611eb88027e463287.1740118863.git.viresh.kumar@linaro.org>
 <Z7iGHiQcqa-_AXli@pollux>
 <4AD8A8F3-EA7E-4FBE-9F0D-58CF7BB09ED5@collabora.com>
 <Z7iSHR0F2QpiNpMZ@pollux>
 <aoprvojsnmkbzmmpgx5wxjqtamnr3jyhyqfcqnwhxulp34gn32@aau57u4cotpe>
 <20250221215931.GA134397-robh@kernel.org>
 <20250224095945.xjcjwkoqlgcsd2np@vireshk-i7>
 <CAL_JsqJFeb66pt37wsTB7esCpRD1tpvqP1bvW=Nw8MmP5LvktQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJFeb66pt37wsTB7esCpRD1tpvqP1bvW=Nw8MmP5LvktQ@mail.gmail.com>

On 05-03-25, 14:09, Rob Herring wrote:
> Either way, but generally I think 2 functions are preferred over 1
> function and flags.
> 
> The harder part here is in C we just return NULL and all subsequent
> functions (e.g. clk_enable()) just return with no error for a NULL
> struct clk. For rust, I think we'd need a dummy Clk returned and then
> handle comparing the passed in reference to the dummy Clk in the rust
> bindings.

I have implemented it differently in V3:

https://lore.kernel.org/all/023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org/

So even for a NULL value returned from clk_get_optional(), Rust users still get
OptionalClk (Deref as Clk) and they keep using it as if a valid Clk is returned
and will keep calling all clk APIs (which will return early for NULL clks).

-- 
viresh
