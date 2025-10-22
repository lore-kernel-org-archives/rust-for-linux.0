Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786DE78F4A
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761125612; cv=none; b=jM53ErBhuaASVi3UbbNQy1e/VPmLcUK453KvS55Fpg17qL5IZ6Bi4BHgYgvtxAgPjEK/YalNgSEzDo68AgPiDDNkG4tEEfsDOEjOX8CcEZZ4zhBeWvyBAUnHbaRPOVJmTfIud7fdpWnJK+/GQgRqrm5ragboVbbKCYfjP6cVIv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761125612; c=relaxed/simple;
	bh=bORZD0ftv7lafNnlIcD9A5BgmKTBJMkDSOwHEr6W5TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfJY2TPwg7gtcmOZ12EOebMhI/98JXido1amhexl/80CGgAJiQTlC0CpH0/4tWJgk+yHqcmPiTwms9xHUvuqaCIsMZwxpQZHfPzVFnmlpC4qj1j0SsNQYi2J5e1lBufUg93p7/+IKeu9y+BOorpi4S/NbMkSZHl+LuNgfRLSbWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J45qznwe; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J45qznwe"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6a225b7e9eso4735193a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 02:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761125610; x=1761730410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bZO3gd3aaKtlSHxfTafUpJfSGcnBTUPfcxPRHPTW+vk=;
        b=J45qznwePGQb3za57aey8i0LRLc8xsfRXgWsBiyIB6dnYdgEJJaBUA+ya8/BZW7j8K
         mNSETv8mnpBNyBNM/ImjFozXv5aYZL9hX0S3+0inWDw0VnHquhBV5wE7GkUrrboYUvNy
         WAZ6JdDsaU7Kn/yQuBQx17u2kCvPdNxZj5n+yN7xyS0b3Tdj3JaeE/vAyIH68oZ02rUi
         YkXU1S159J7Z6R11h1paEXdpIkz+iLmjk3ooNkd3gotvEfOSTsOAPnm+kgk9LA8BWZBQ
         sMvxdA+jj5yGJ5xPHFgbX/xxbXLoIxCkRTQsBxzkzDqd8g0R1Rf+aKOAbjZX8sI67UoL
         Wh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761125610; x=1761730410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZO3gd3aaKtlSHxfTafUpJfSGcnBTUPfcxPRHPTW+vk=;
        b=GTUL8lIqlFvnDGwLSLRvjK2WxTrqurfht8aj5qqUJeKzC/w/6i9DcO6bSDXWpiWWaF
         0gzVwoonPu2D8bjstORNsEgXKOdh+P4vyind+4NRHcA30+OjcjY4xzAYQzW+I7/7Fy0z
         yEnvsPJjhz04YYWGCTUCv4k7ehRxcjTS0tOQbVGJbBwZkeM6G3RLHhYlj7nS5ZaixjvR
         DKTzQUtwxSqSnc1sZ58sPWA4kNfSs6AtvbFqgtEIgpke72Rjftar5mW+U8Ya+1GPAK9+
         2HKmSrPJTL+NhEW4Am3/u3hksdaHTnhy+2YjUdvU8QamlPGpCdeiZl7zGsq8I98nShU0
         Dy6A==
X-Forwarded-Encrypted: i=1; AJvYcCV3Vavt/sZmw+yd+f8c952hsqpDrehjrOi5zX50Oc+ESYZkSNW84KxEzyUxzdpwMCvCX7bg9wAGZRWdu22pkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrakrGEXRsyfpgn/P06nDkaLO6LDJiCCPjyXy5KH2o8T+XdTRJ
	Fhzhlev8lpmB/glQ8aLijHyTwYkowwyoFLawpU0b7OTeMeXJ1UWHxYo0/D3maKWmeM0J/NatKxo
	DpmUq
X-Gm-Gg: ASbGncvQwcYWXGhxqS+6hqsmsyy/mTv9gEP4lf4x2LmmOVHNibTTe2vQw5+/pA+3JBO
	N1+81TtbL1uGx2DLjDg+oJaLAfs00im3+rHCgqsXeAccY8BZYboSt9tf7PszUJoPPL1sH7UvxW1
	vXY5IzxKjPAcBzHbth975pYrA70aJNhRVdnF8Wr/s75Qww9Lp+zmNtaN9fC2Xwt1K6aUNI1CPiA
	iQe1x11DQXQ/Ox014pV9TtRc1pGSoB0Yn9qJl0yZ/RKtzfU5u8wqJ+l3d1pabESUkz5nVCrIxZp
	skbAWxt0CT4yIARfKW69klaLq4I4qkulW1fZ7fZbkLWm1XRSm4KlOyVRDqTnW0CJbJaKQSW3jLC
	37Chx44Nq1si1TRedM2hs30r6I0nJZkplG0+GvJHdptpxvE1CNTzBF9gK6fWYZqunOJGwpYt46S
	050pMye2gS9I8R
X-Google-Smtp-Source: AGHT+IG0h0QLiAXdO5f90+3enocmFMBYwXQQom51lDBPViwF3k673sJ3nLkZON4IZuqLIkcwKdYDtg==
X-Received: by 2002:a17:902:d584:b0:275:f156:965c with SMTP id d9443c01a7336-290cb65b61dmr234660325ad.52.1761125609766;
        Wed, 22 Oct 2025 02:33:29 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd5d76sm133879585ad.39.2025.10.22.02.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:33:29 -0700 (PDT)
Date: Wed, 22 Oct 2025 15:03:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: clk: implement Send and Sync
Message-ID: <jnpqitx2yup2cvt7ey4b3fgzsi62i2pkasjxgx6xfi2r45hhhn@qqle4nvlcbu2>
References: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
 <20251020-clk-send-sync-v2-1-44ab533ae084@google.com>
 <ghaqgzgnk6mkv6tm4inm2e24jyidsk7qhbff6zwc46kefojw5p@3jvwnn3q4bxw>
 <aPiTm7Pb9WguOd9j@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPiTm7Pb9WguOd9j@google.com>

On 22-10-25, 08:19, Alice Ryhl wrote:
> I'm guessing this means you want me to take it through drm-rust? See
> what I put in the cover letter about choice of tree.

I was expecting Stephen to pick it up directly.

-- 
viresh
