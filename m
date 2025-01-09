Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A80A1FF617
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 06:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736404570; cv=none; b=FuExObQg24LgB/yOMJU1knto/PXLGD6pg2BbUJke0lr1LU/xS2Dw7YEiUJX2T+/6jMk8iO3UNH5HQSnbDwcXFvimcet9dWXFoksEhy4u05yBCatmEHnCAf3SbNVNc3Udgn+7Xar1SNjmhKb6vdTNJwbs2JAXfzC+CUV4VfAWfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736404570; c=relaxed/simple;
	bh=lMVxnnWkszZgoFiZ0m6NZLBkZHlM67uUzVc4GW4Mr+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkeGGuEgU0MJT4dCMz3zAXoIq1SDdxgFsH6Z14pvLW+V4fqDkSyrX/cK+uoqfgo018i8nu45bG3vW5xCS4Km3aOmiZVGmf2yqPaTY5tsS8eks0W1RSZhE6Qu62nzSlJ6GljtMaWYwZGn7bkcV6won+S6irkNcxB3Gpk1/G/Ytyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=du94z/Cb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="du94z/Cb"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so777426a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 22:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736404568; x=1737009368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vo8ZWmxiVMxPWb/ReRE2+R0SBytPF5o5EMz5YOhXmjc=;
        b=du94z/CbljSOXhBoxb4L6o3gm6Vd+VCTdO91hBbf0IZuL18uhTJD0FavDPCon+UKK5
         v4ZaKgi/6BY5PSZKkv4azvLK4orNmbX1yeEeSDsBE3nrU72+0Pb4qxNIFbpHj38Ak5zp
         VND1eopG8gL2TdeYMoWKk7H17JCZsurDMCPfuWjEXeoce7L/rQMYTjxiRk946WFNfkoL
         NwRxNKQajFZuNo6LQvhbQXs88p5XikLMOLduCDTdssL8fSc60lmvJlmRVu2FhgZpgWGN
         a2CsXbqn74visMfwU756Ez+i8jg/tu3vfy2JKWMBtPSG04SxSpAj19Ua3pRL9K4O6OZh
         TQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736404568; x=1737009368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vo8ZWmxiVMxPWb/ReRE2+R0SBytPF5o5EMz5YOhXmjc=;
        b=V80DiCYQx0FLEkTjl0WiCRaHQPFH1PTcMi4a4V8hCZ/1M/N1n4YT8tOHros8bPbpiz
         mFKddviJIM5b2PjaSm/ZWGTbKHg1g8clMw5gZ/aC1ySf9+naZdKrSghkyEaMqhIE4ChS
         0mBfa0VOhGUehYXsAhBB9gUgZfulBVWOsq9eGNp/jyP5DRbPhW8z2Cv203gEybXjGGad
         Rw9w0BPapULE16T6xKivI2tV0ch5v7cHt+R33KosSevneyTtSvs7x+2g+GqIVIadqSn2
         7TyAbnKaozIl9mZD/fgM6YDMyNlvqh3T6a9rpNBts29K6er4rK2QtOiM8EBwOR5bmeWj
         TANw==
X-Forwarded-Encrypted: i=1; AJvYcCUfUhPupIJ4FFW9Db1jobBY80jWBoqLuP8NV77EwCALH9B39ph+Rmrsq//vy/mOqCEOXDCcUE/KCRUnUZ2csw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkM/GXk2y1gtwJ4oDmwqtfyVYrr8cs97AIiielmXHaHsQ5BpbZ
	w6EOENvbiHCqim9nNiB/JRM/i+kUS4Z+r0ExzzIJQmR08wp0rEVcFMJUUCeRcnE=
X-Gm-Gg: ASbGncufvkvFWFKumaHQArfO9qdcBRw06C89aVHLZ5ZCO69X6e3hiubfRoOL1OgWcV0
	Czk04aWEd++MVnG0ybl9Isz+zxBiYYInpAPzorf+RhcxPKwAuHWpmHSEGr1mzoFN4+BiBgVfKKs
	cnSajEb/sjW6gPK3khFcUTK/qPEV7b4RzHFbpNXytNB/UfuB2r/wP9kZuzqs3m8o+xuHgHANfc2
	DBIfLxaogyd0I7fZocMdN7hrHTFHbkKwDimUwh8E9feowArpiO2Wd3IB9c=
X-Google-Smtp-Source: AGHT+IHDeZ/6AdnQUWhDrag/a2VFncVWjraJpakuoz3QPlCO69KlNtXITMl1QVuA/tTHp7vixFPj9Q==
X-Received: by 2002:a17:90b:2650:b0:2ee:d7d3:3008 with SMTP id 98e67ed59e1d1-2f548f33b37mr10299302a91.12.1736404568653;
        Wed, 08 Jan 2025 22:36:08 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f5593d08a8sm598376a91.9.2025.01.08.22.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 22:36:07 -0800 (PST)
Date: Thu, 9 Jan 2025 12:06:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 04/15] rust: device: Add few helpers
Message-ID: <20250109063605.gmykltd6bnjaspwm@vireshk-i7>
References: <cover.1736248242.git.viresh.kumar@linaro.org>
 <429b7539f787ad360cd28fd1db6dc3d6c1fe289d.1736248242.git.viresh.kumar@linaro.org>
 <2025010734-march-cultivate-bd96@gregkh>
 <20250108110242.dwhdlwnyjloz6dwb@vireshk-i7>
 <2025010835-uncover-pamphlet-de5b@gregkh>
 <Z36A0g9g6qkRZSjh@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z36A0g9g6qkRZSjh@pollux>

On 08-01-25, 14:42, Danilo Krummrich wrote:
> I think that's really what is needed, otherwise it'll never work with the
> guarantees the Rust `Device` abstraction provides.

> The patch below is still not valid I think. It assumes that a CPU device never
> becomes invalid, but that isn't true.
> 
> There's a hotplug path [1] where the device is unregistered.

Right, though the device pointer always points to valid memory as the struct cpu
is never freed. Isn't that enough for a pointer passed over FFI ? All the
from_cpu() method returns is a reference, which will be used for a short period
only (yes it is about the possibility of something going wrong in that period
only and we need to ensure it doesn't break in such corner cases).

FWIW, the cpufreq framework is registered with CPU hotplug layer, and so
whenever a CPU disappears, the cpufreq core will stop using its device pointer
before the CPU is removed. So technically we shouldn't land in a situation where
the CPU is unregistered and cpufreq core is still using the CPU's device
pointer.

-- 
viresh
