Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B517DA6C
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 04:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750652565; cv=none; b=esVkgqBt3LMRKL4e36mlMyLV43C1RXyrtUp3gny0tQTdj1Rx+dhhGojtOKwXCAWzHjL/n4+ZbMPGu+sElEg9HQgjzutlrsQhPUSgT5bRTvR/Q7uUh+JO+u5XAgEfgGDIiRx0f7JymkT4pUrr7oe+qjBDqvU3Ix3jf5mdy97sWhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750652565; c=relaxed/simple;
	bh=5st921uDKTkKgU9TnR9YHhTWnF9x4IKBuHUsPF/rAnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fta3mVI7WydJnfbnls7Fy8O2XXNSZcbOo3Zt6WLkBLRz92FxAYsP9P2k4Pm7eHtKIyCHktBuyWhv4ifFA5H+HsIjV2rVYVy0G8+KChANmzAvE06CtjOrqRQ6lJXxIjtmkEukmZLUTN4SN19nS27ZWrricXfVR9f836QiLRlmDgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNIz7TiT; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNIz7TiT"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73972a54919so2846421b3a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Jun 2025 21:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750652562; x=1751257362; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5le86o5MqelUxj2e52/BUzqyGfWPs3z+KMJ1+yNcPzE=;
        b=RNIz7TiTIAXBb2+QIkWrigkzTdXFQwbQUtb553PGcs75/uylo91RYCbTX2F+NzkbjI
         KwPKJ0u0HOB/JAfsNwq6O3Zi0E+f4onqRi5IBCEe4z+AOzCg/JYs5QE4DLDPGnVF0xGe
         TCOWdwtnlfCmN9lnuwjtWc7gPIfZyTW3pIlp/82VALG1ImZK7ixKWzKqy/RdAMWQZkfb
         cqEyKZPGkbITuTCDHulW2iUD+yD6ifhqwIk50bsz8nggK48IAg6O0JJVP2XZA619z22f
         OvOwrSnLHU2OlYS3XVAKADami5u55iUC7K1S2S/t0KXE1E6qMVELi3YCKqs5mRzNrY41
         8Xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750652562; x=1751257362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5le86o5MqelUxj2e52/BUzqyGfWPs3z+KMJ1+yNcPzE=;
        b=whFxsd8TjcDTpz0CNgLji6UOqtl4z8bzroSqd+QD+2Eluf5O9VFCP86VubjuKj2MkI
         Qqn6A2AAfUvuZxCTStzB/aXjG4R2iO4l6SseVzJJP8P1ch6Ha0OxNtZErEqrTwZ9qf2d
         sFxoZ1AhQ0yESWFydGr/JZa8DHm48JOgrCTzwYPmy6r55nHEZUxZTu5nMpTQ395rcIfH
         wgsF6uxRIJZRX+Do9mkoURpR8FbxhPFwz24+XnJH/XMI3NOf3A/G51covdwTnfABR5Ww
         4KVvC/ImI2me34D4iMDOLsIHYxDGgXND8HOP76inNDGN1zzPBkpcuHgYL/f2qnIhgH6J
         cgVw==
X-Forwarded-Encrypted: i=1; AJvYcCXV+Gnveh5V8fX/5eoEaX0Yhvq7YfCjUYRImWaDEs0mJKI2pJbvLJamu2zstjjzc1HdiG19D1jlmEv+uMUvIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGEwi4JlqkCIBPle12+9vBnPAU+ky6p6BZaH/6JMfBWZJTIyB6
	Hafjd0N+SjvrOuWMwD1YXaxnP4NP/kE3MuSxk5N24SJn1VZwFs/9npKzTIXW21q1Mg8=
X-Gm-Gg: ASbGncsUozhD4qfwpERGZnKZI7MBMiuv4Gc585g6bFfqdifyOmv25w8XQ9xjYC6exIX
	3UiFKOGX0ZIPRL0vflQS2nMNpLnA3ztNIW5zPvcYkN9rMRxVqA5ZNGn/zu/jJzd5EiPO77MhmZE
	8Q7ugXdzT22MAGUXR5XnRdXEEQ7VQ7x/tOOXNI10i4YLKIhGoj5BFB3zJOt3TQAAvOT9EV2K+1j
	tAoWp7YtaJoBBziWCDuyHRs9OibtxgTcuxcb8Vs5j4gHasr2O1sAjnonQX7/KoZ3IGcOBVPDnYr
	+BAkCVGmeO2hVWtFd73ccmZQevpNHGExYlxW5/GQqh56aeaWq1fqJpPlGdI2/HVvSw1I2C/3Vg=
	=
X-Google-Smtp-Source: AGHT+IE5TuInEJuZ3oFFcgdcOzCV6/0HecXdCRlo90x7islTcM4Alv43ENFRCRPNZUw0wjGIr3K+EQ==
X-Received: by 2002:a05:6a20:729d:b0:21d:375a:ee33 with SMTP id adf61e73a8af0-22026e8226amr18176424637.9.1750652562097;
        Sun, 22 Jun 2025 21:22:42 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6743basm7412269b3a.142.2025.06.22.21.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 21:22:41 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:52:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: vireshk@kernel.org, nm@ti.com, sboyd@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	linux-pm@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: opp: use c_* types via kernel prelude
Message-ID: <20250623042239.4sea6d6lmamfrc4w@vireshk-i7>
References: <20250620095920.20765-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620095920.20765-1-abhinav.ogl@gmail.com>

On 20-06-25, 15:29, Abhinav Ananthu wrote:
> Update OPP FFI callback signatures to use `c_int` from the `kernel::prelude`,
> instead of accessing it via `kernel::ffi::c_int`.
> 
> Although these types are defined in a crate named `ffi`, they are re-exported
> via the `kernel::prelude` and should be used from there. This aligns with the
> Rust-for-Linux coding guidelines and ensures ABI correctness when interfacing
> with C code.
> 
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  rust/kernel/opp.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied. Thanks.

-- 
viresh
