Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822F82676DE
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169275; cv=none; b=uxGz5git6jqjaMZHBwAjmhh/eEURslJo5c6Q/Hc8eWXrvPidi/EOpn5k51R7biN1f0cnS7TYIWVjlM1/J4OsNzmF+GA4WtYgC+M4+4kCDHxZ+3SyNE2hZsp2MMAFa3HHrbkPOp8IdMPTlMD3WyXrYN7sTSpnAngnjwqXcpCqOPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169275; c=relaxed/simple;
	bh=PNbWGAMKm9s3NrC346LUCC25A0/fVZrSTFIV1+54+pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgzVw6qyC4ExDsbejHQzJtqTKwQk6XfI19rW4vFBOt4iw3IGIG1AGcL/XfxTqtzQtIJSBLuzAsHoeWTwZv4nK79kZl4kGFG3nKHbJrbvi8/K56oKBmWg0d+QfLwfWNw6h3S46IZOScfva7eufubieUkUHYFsBDGP36yNhn+YslA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtc55u2V; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtc55u2V"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-736a7e126c7so1609170b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746169272; x=1746774072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIYKB9F3o478Jme8raTXTfUkifL4J9sNzNUm7274ITk=;
        b=mtc55u2VznFCXMNRTV4Zu01W8hFrh2CE2zmsfKK2qj5WoZbR7GchyDKsEeodQCMyXb
         hkU9f591btkRXO0oooukUntSuaxpPXFngZ5iu4KgD7247e0v8JRymyEfn6gMio7FqDL+
         S9ose1UQNILS2DRqQkhoOD0cHOF+pIkQ6n6TOnGd0FGIAh9A/IpFPI1goYs6JW+S5sGJ
         mbYzO4mmFMcD3kQCf7oTnZKfxu5s1wtUC7xZbxxEswRqI9i2mn+ayFGmXvDRSnQqt0BJ
         l9C0XdatadJKLOkrG077ueXz27Cduq0PpEBCYv2Llw/jM/HqK6FeIHhal9BbXx2SLD+3
         kvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746169272; x=1746774072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIYKB9F3o478Jme8raTXTfUkifL4J9sNzNUm7274ITk=;
        b=dwhVjkpNF/5NFfAsyWQNEyMcKWsl7g7C/na0rg2z/A/MEk2TSeU1K0CzktvwpRXJb+
         6QxAivzegqKJL4GlFQQ5MmGklyPpod8iJIHr6vmSEzNIw/Pb1skLoj2KW+eyNpXPojJd
         eoy4oabpb5k0fGzhwD79mkCiYwW7dp+1PP+fVXz0tbhNeB9lk/a8h5G//6kKq/8dSfdG
         kB6GMEVrvKWdtVs2MWtn+82z5oY5WnfhUVVqwaFOtR0hf4ymZ67j/3vXzy0k8x+1WzGh
         jL2uHtIHMlahrFESBlN4trJI/d36XO88HuRvphHfO6SnJA8oAwBVUqsFuoJwtoE/lNxA
         DKhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV03v37BZW3LTv0PiYqd1eTWthssDf8N7kHPKBzzCcpjWgFLYgeH/6P6XLwdzauJ/wnspCBxI3e6JffYrmRMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxC+pgBE8tZbQHw8iDfryz+NbrDp/pLgLiVUCT0UZcypbMYkV
	jFWwymhsHkb+Z32NORK08BZgafNzI+9XWftDrYyszbHvNLHzsSK7JBxQ61hw+Is=
X-Gm-Gg: ASbGnctrdLe0TYUPmp3IaxQIc/8PTsXusraA0X5rEkT6SHwjhmk1Vm0Rq+y8Lfkjoly
	/Mto6yLUeitcUhuC86OzqeC9Y6A7/lF5l85tYasmowEE6EqKPkc/YvFI4eMG2rFyFdVv7oeqjVS
	wffv57YdvTwDbigbcjsYSYHVRn+KBYaMnWrzuoKl2UxKTDtxU92owy/dhmWzIljuC7tomX6xfm3
	NiWp3uizT0OC6CiIEHVaSMrTv18nbzVWHIVhgrcSLa895SPkRQ6KwWPUhHQMNTc/R1gnJN302b/
	Wx/GmIcmJWXpkEYHyHYoz5EWXoiqMAp4nGkSFxYUcQ==
X-Google-Smtp-Source: AGHT+IFSx+VRtOySROI7ANgNGVBaqHJbD9bAJPiju2pU+HGgAlpdoEmLB1WKijWr1JimZfsA5Unkjw==
X-Received: by 2002:a05:6a20:3d90:b0:20a:53e7:4a44 with SMTP id adf61e73a8af0-20cdec4b676mr2533309637.19.1746169271726;
        Fri, 02 May 2025 00:01:11 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c6a59bsm49529a12.67.2025.05.02.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:01:11 -0700 (PDT)
Date: Fri, 2 May 2025 12:31:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V11 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250502070109.inpes2ou3rxx2fxp@vireshk-i7>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1745218975.git.viresh.kumar@linaro.org>

On 21-04-25, 12:52, Viresh Kumar wrote:
> This series introduces initial Rust abstractions for a few subsystems: clk,
> cpumask, cpufreq and Operating Performance Points (OPP).
> 
> The abstractions cover most of the interfaces exposed by cpufreq and OPP
> subsystems. It also includes minimal abstractions for the clk and cpumask
> frameworks, which are required by the cpufreq / OPP abstractions.
> 
> Additionally, a sample `rcpufreq-dt` driver is included. This is a
> duplicate of the existing `cpufreq-dt` driver, which is a
> platform-agnostic, device-tree based cpufreq driver commonly used on ARM
> platforms.

Applied to the cpufreq tree few days back and is now included in
linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/log/?h=cpufreq/arm/linux-next

Will send it for v6.16-rc1 (unless there are any objections).

-- 
viresh
