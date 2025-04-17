Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA472A94A
	for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 04:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744864874; cv=none; b=plwf5COvffABztzVaEIZJALmyf8REB+twSkP/IOnLUB2XcVArLDixwFEigj3p3fGvOznGHVHKDmojWKLYKN3oWKcdtnj3k1mh6h4o8Bx0SdoJ5woemosOdOvWaAPcGquU1B+aXESr0HCiZAaR3EU+JlppF+hic8tzPi8vVTbjx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744864874; c=relaxed/simple;
	bh=SPeJW8O/RdyKgGzZdcpOtGY1BN9HvfKy7ydyqtr/PlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRcbV8UBclPGDr+toIeq3O7WjrBpt1AruaYH97dcRM3AncK0Kt4r3roaRwvbCD9Z237mL8PntXm7nDXTfQh7pxl5usG4NIRr2Sr1Pa+t3SetZiJpNz/rcIFSKP9GHX+h/FmSfxbFarXZUPvji2Zv/SS8oV3ZaFrj+CoxCyj3KQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wc9NaWYy; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wc9NaWYy"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so275986a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 21:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744864872; x=1745469672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=StTtcZEL8yuxE8J2mkGpzTNue0dDQ/MJGGswTzHY9b8=;
        b=Wc9NaWYydXVPhnfu4GiffbN/Qhn7zlGN4oeKKFZ3Wgm/Ep0W5+Nnsobc7nTwUZC4y+
         nsM6WpK1u7kP37SHWpZhje2qBLaq/kXOGctU692HUeA6efi3r7pKA4Eh5x9yZ796GVQH
         eD294EUGl4F/zSqzhntB/oqG6sbL6i9cb3MGFQ6b9zHYFHhRuMoEz0FIAib1gOlyIqKo
         1qBi6apBOA+UEZEMzq+14uzW6dhk0TIQd/gYTJe4YSE5cpSArKByQ63/CJpdoimnLtED
         5aHFFIj5JlxYRrsQBKPDAstYVR4/SZ5G+0J8cwo2pVIEppc0hZ4eA2DRHkhThWrrVm1L
         G5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744864872; x=1745469672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StTtcZEL8yuxE8J2mkGpzTNue0dDQ/MJGGswTzHY9b8=;
        b=ULWbY/Ixr+S4FhzqjCLDwcIpcHIB32/ZfMbrBCV1CaghabuBKYMFZcQXYxYz0DNjQo
         oUFHqRfXGHPvVBVPEiLHLJt0eqamy7cIIoZUhlykzeTdzEkSdLCXDZeclGWMHtWet9ki
         vhXcSLHbPOFOOL0Oi9l60mQiUrjaizVtTuP7cy9rxj7Xf+G+cnRwUu8zZBxxv3dSrlA7
         Nfrj8msUSOvs4FxjgC9rlU8lMn6di9ybCn3/Xu3mG2eDhtV85HM8pz1RRchw5RwMzU6J
         3sWia1m08GbO9ZwsfhOuNHT3tUVelyecfcjY9Pj++PDX7U2vVrVzMsCVIpwNtXWrcdpx
         EQuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUARtBaO03AL/QGf8M/cJxRM+0BnLg0989ylHgn6nHaoCZPYOpuxtQIyitgNkQep+Fjy5iF9S1HaQrSQfdG+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOds6gOQFynO4crt4y0Ses0bouLdpUcND55bBPaCc4HchZcwYA
	enuA5SVBnLolFNJNP66P8GlcOOALsJ9tib+JirrjE6bixbLXzMDhvKAFTsi1X7I=
X-Gm-Gg: ASbGncukz63figvnCDSSERrl7LXnTSih/aOy20AKNEi2HnVlMzM/qjf2e3eoCJMuY9u
	bYGjc2PPJdgL7ivY3e1qpjoo3DkQb8Zp0v8vKGfO/cPqZ1tVL24T1P6L+E8NTolfRDM6JlBwJN0
	tfRl6w56iuLK0teBg7zw6c094lEV4aHakpHWby5E+Fk9Eh/0yQPnjQavhifBsb4MJA5XFHWcR99
	i+c8tuDOEcn3nCRjcvrYiOM1Ltd2ZfGbMBY/WVgzSVbrk6EbPbhudiC7ZXRPGK9BiCW7GgU9Rzj
	14le2dZrqHkAaWdx6cDLbc2TVJNchJUlYk9pVvi7bQ==
X-Google-Smtp-Source: AGHT+IHSwNZXRlBErUquc9s/KXGJ/tJ0ZSJY//U3+xrEDFrzroEcRYfbd88YerCo8sKgIpeIi1M9yQ==
X-Received: by 2002:a17:90b:5864:b0:2fe:b470:dde4 with SMTP id 98e67ed59e1d1-30863f198c7mr8175815a91.12.1744864872142;
        Wed, 16 Apr 2025 21:41:12 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cb765sm2573852a91.43.2025.04.16.21.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 21:41:11 -0700 (PDT)
Date: Thu, 17 Apr 2025 10:11:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH] docs: rust: explain that `///` vs. `//` applies to
 private items too
Message-ID: <20250417044109.3enslespfaifjw7o@vireshk-i7>
References: <20250416112454.2503872-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416112454.2503872-1-ojeda@kernel.org>

On 16-04-25, 13:24, Miguel Ojeda wrote:
> Sometimes kernel developers use `//` for documenting private items,
> since those do not get rendered at the moment.
> 
> That is reasonable, but the intention behind `///` (and `//!`) vs. `//`
> is to convey the distinction between documentation and other kinds of
> comments, such as implementation details or TODOs.
> 
> It also increases consistency with the public items and thus e.g. allows
> to change visibility of an item with less changed involved.

                                            changes ?

> It is not just useful for human readers, but also tooling. For instance,
> we may want to eventually generate documentation for private items
> (perhaps as a toggle in the HTML UI). On top of that, `rustdoc` lints
> as usual for those, too, so we may want to do it even if we do not use
> the result.
> 
> Thus document this explicitly.

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
