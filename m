Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFECC2C11EA
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 04:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760330916; cv=none; b=P9rtF7TinLhHQOEz6wbATjEkLwDYvQEUZa07u1GE0ygRLZsFz5/9bxQl/cy0D9HAJRwZbzd5uLCk0OA+nBG6EBm6cTYHzmQylZkdUBikwgAbUm62dqeJuZErx1RjLowC6+QFA/pq3bCzWUn+pewrD1XyVTOu+FcneFqT9GGKCag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760330916; c=relaxed/simple;
	bh=w5flf0ZTD8FoZKNNJ44xzj8U9JvZaMG7ZVwuxSdM1qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pHb4FS8G/GkENL04xJw8bEQyj/6f+H4OZ63zy18hYNWIbXEt0dqolCkjP0yTYpCR853+cl50d/fPQtwvKfEbwJxRulfKmxUwviBCPpwepyiE2oXIDfKwfyvGCm06+moBL7y27lYKfPLx34UOdTNcIb9NkQpLgY5HVSFeAbLmCA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kvnVzt/I; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kvnVzt/I"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27c369f8986so34598565ad.3
        for <rust-for-linux@vger.kernel.org>; Sun, 12 Oct 2025 21:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760330914; x=1760935714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+N1GbW5T01OcE9SjnTkQCqp4CEF9pzePEjEN9o9hnwo=;
        b=kvnVzt/IQzVhaAdfwsLFLs9LGpMpWsE4RD31U9YuMylfp99NZFbl05PEW8HOdRjD5G
         04POdV7jnKL4cfzELmZOaZ2yL7Awxgjy1/9tJ+yRF3hUgJjnla0hm04TMtmc2NkevqZD
         O5XIt7AEbSKAPqhFqyZlCVb0o/dj79eiw9tyUzJD8zVGvmDGD/rjEOg4pD3YFMUDY3cE
         AR/fnaHHX91LS9dMAhRbaOm8QbGvwCwkhZ6jhecdMUglK4f4n6/QTUIlhChEi/+C9p7F
         p/kmduabe8YZAOShOMajDKRa1ePrD7qWTD0cRmXnufSMFKfck8Kvmxj71KH7YV4EWR8f
         4eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760330914; x=1760935714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N1GbW5T01OcE9SjnTkQCqp4CEF9pzePEjEN9o9hnwo=;
        b=p3jqxCdwV2ipJcMv4g9h9lJbfgJHWT2K0L38oSqUldGI0O6aw5qxNN+DB7nsQrsHK2
         vNTockn1F8wpX+JjxrmbYWyUxSshbGdjFXaO/qHFsK5fPI96LMzmedQgxHDlWsxA1iM4
         26E4tMwnuEDLakH+Z6Qz0Ky4fXp28XZkdygelANdkqO7AR2Z5mw8Tx4Tdi9n+LJ5BpiW
         hH5rK1yDPnz6Z4OTAnf2shxPns8lD9r98mm156wZaqxOCgHd44zcyhkPbxtKnsAhWKbY
         7BL6v89nbbCa6kiyuqEcgjh4XMSUDb+Pfn0H8hrJCQv9x+niT1K6xC+y2yj90Iim9CzS
         M82Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK0TQ8Vz11zjFYFh3AImiehq+Hi7TgLfgmA+uv+VzLFNsHzbUCxVm++pyqW4e9PONM7DTq4C3kGLupwWBrpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIuruOxm4oWbVvZM/EmC0+fveJIz5ZEFXLVkkzc/KhiBeUqyvZ
	Kkgm9k9BG3JPzn368ClG6ylyOqIZYwGdhox966Sakoh2yitDP2ecD8QxapnxyRdFJIg=
X-Gm-Gg: ASbGncua64zU5NCGccAYb7Dol/e7P4VcdnKhcFLnjZf8I9a6KElBiQ78UmuJTxsrX6P
	zVxrXfBBncpvLS9+4jw7C7uH3hDaB2D+4IykK8NAob+SQL+fY6vnzIZegcoMVqnSckfuuIAS9fn
	VC6tZpr7MZRrm1OvO5QgKn42j8Ux3vUO7Xo7fEu7pehFTFVxNFOC4GjmB8lLZISYPewmplbXEGm
	ia6xNiwlKZanQGWJxz+B/bEtiCcGOxcU1gCzKbdiXexOljDtX7SBdpuupDTb3pWOuISlkyNJl+4
	a0iieA8u5FHC69Dzq6/2paRin542hCatisW31zxdLT8xvM0k/Hd4YeQNqdUkDHFobzfLsjKk1Ij
	dte6YgCwNKeeDlXwg571+jV1AnptlXkv/jYmUr791L2be9uiL7IH3fPpz4A==
X-Google-Smtp-Source: AGHT+IEjf3zE4VC422TWXSW/Bnh5dRfTTAIjmK5mj1HsvRN7orBZtaN8hGr9+1lO1J8DEcWKyA4uXg==
X-Received: by 2002:a17:903:4b08:b0:27e:f005:7d0f with SMTP id d9443c01a7336-290273ffc50mr241023805ad.44.1760330913936;
        Sun, 12 Oct 2025 21:48:33 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034cba155sm120234705ad.0.2025.10.12.21.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 21:48:33 -0700 (PDT)
Date: Mon, 13 Oct 2025 10:18:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Subject: Re: [PATCH 3/3] rust: cpufreq: fix formatting
Message-ID: <7equbjyprjv4s4sg46inaiggmmh4l2aatuoqfpgrj5dgvxgqy2@zo5vh7i5ywjj>
References: <20251010174351.948650-1-ojeda@kernel.org>
 <20251010174351.948650-4-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010174351.948650-4-ojeda@kernel.org>

On 10-10-25, 19:43, Miguel Ojeda wrote:
> We do our best to keep the repository `rustfmt`-clean, thus run the tool
> to fix the formatting issue.
> 
> Link: https://docs.kernel.org/rust/coding-guidelines.html#style-formatting
> Link: https://rust-for-linux.com/contributing#submit-checklist-addendum
> Fixes: f97aef092e19 ("cpufreq: Make drivers using CPUFREQ_ETERNAL specify transition latency")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/kernel/cpufreq.rs | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index 21b5b9b8acc1..1a555fcb120a 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -38,8 +38,7 @@
>  const CPUFREQ_NAME_LEN: usize = bindings::CPUFREQ_NAME_LEN as usize;
>  
>  /// Default transition latency value in nanoseconds.
> -pub const DEFAULT_TRANSITION_LATENCY_NS: u32 =
> -        bindings::CPUFREQ_DEFAULT_TRANSITION_LATENCY_NS;
> +pub const DEFAULT_TRANSITION_LATENCY_NS: u32 = bindings::CPUFREQ_DEFAULT_TRANSITION_LATENCY_NS;
>  
>  /// CPU frequency driver flags.
>  pub mod flags {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
