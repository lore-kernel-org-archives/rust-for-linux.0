Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA5F19068E
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390352; cv=none; b=F7F/ni21w4l0WEk2XAPAXInyaxG/jvn87ELByY9DtrMJGikqrYjmO4SFFiduk1FjmaQqzaGrRJeoBMisFsrGfP+dHSQCwgQ2Pe0F2QVjJ+AnC7130FV7vxzlQ/rylsVFgjj0uxdsPod8atTsrcGN5QKyRvQJOL5g9z+RpJeAl2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390352; c=relaxed/simple;
	bh=yI9tsEdrCq+JVlU4+kbKkbwWKZIvMC5rRRc9jI/P0aI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAN0wk8U19+LGLRcN3ITJ0pvMoPgR+tReFitJ7AKYodwyKuIgLFF8lu/XtACwAdzYVGh+/vhc4p+zAGdWOwMxmCnYZWrzEIJEDiZEK9QV+IAzucEAY4O9kv0Z6SmqYj1HSn0sk9z9PbK+M3TYH4dPiSUrBifAwolHaydwcZ7rt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I4eU5hQ9; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I4eU5hQ9"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220bfdfb3f4so91963195ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 01:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740390351; x=1740995151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RxGqqeJLsYbeTE+fl2BbkVU3VCr8NgnhEkdjvf5/E4g=;
        b=I4eU5hQ96a3BiKJELv/W5VvP4ql8/+5FakUXyNF9yyQ89OgNA4TTEcOz6VADNhn574
         tDpjrdZzAaMVCfgrBP9w4wgwIMPeUXI7hKCf2185ulMVnIlVG1hn8DpQhB8Bfr5ZSwE2
         TOPk/lCzFyYCF8/o9z0Nh9/MEnOTYXbldgauErMmgw2hvy6iUZGPb9I7A7wDW/rS15mO
         jMirpWR9gpYo9szt5uWmiiKSoG0rGzYBVZkEcUfY0o5uB4OXMTOznDhDnmTztBFpq8ql
         ROGfgqqk76i1XxX5iPGRPP8phk/ljgjWXBEyMYQB20UNiwKJkmkw3F1r8Bmm2pyv7NSV
         hZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740390351; x=1740995151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxGqqeJLsYbeTE+fl2BbkVU3VCr8NgnhEkdjvf5/E4g=;
        b=tfvx9dzcs0Wqivt3wk+eWNK4QM7Tmlaotsq3VqGAU735Ci5/vHBItzZg73DwIXshAr
         Wo9ULputE8fcwTS2DJCbMMOi15LCmEp6lvObbu98ImUt+0GfPXhPL066ci/puxm1Ouxj
         tRYBfqlk3B+lhpxnzQvhGNuYOfYhg8GxE/bnm/bG08ycM3W6odHy7ljqC80GBDxwbjtx
         5dnIMEi9TQfkjMekAWMeuySDNS4NADDFK182O81/miZvmdpUrweWyw7xmNF7+68jemDU
         DjEByGN4K/9mFgABQl6V26vZd/C0ibW1hotCwoeNck5ylKvGodHyIMWxaCZd6Q+7JXCS
         lqKg==
X-Forwarded-Encrypted: i=1; AJvYcCXxQafjdxvrRq50mUibCgQML6oAr1Q+Jg7C9vp3tQV5e+4iZOOpYXuV4fw889qIWTpY5/EJ1ZQGly+Ws2n2rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxE0iYPZLeNUo2aQVGecesuuIGoWqfpVgXqJiN8Wxa0acJWp4e3
	fxBMEfrQ63SEehrcp63V2NIP/4A6mAz9DJD/308D6rIfoQDJhrdWKeCwlk8NGqk=
X-Gm-Gg: ASbGnctd+KrVTg9azwiohvwbWbHl68iogD8P4oaRU5bMz7ottuVoib7Wj1XQiOXsDF+
	+nPoRC17tvMTK/2cjnxU4XWefDvLfNWe4epXwn0sgfF0iQOzjnO9wPiUlduTOWFyQWOVhe4Z4IC
	7uuiNMlqx0K9rizWp6UWpqf7//P7y19iO1nLCS4riF9wDWBbB6wP9bsAw9HKTYENBFX4AAmi13y
	H3oNYNNFTweh9Uroo9fF8yob3jXpofwVbDz2IwGxLfEO5XnLsWVEHIccoLDsm8LsCrFxnOoJeLk
	ZgTkfD3MsxAl6qzzu9AAOBTWV8I=
X-Google-Smtp-Source: AGHT+IFJVi7/YSBChXY4dh8iK5Nu0pMgjUbuxiXxygSfU840h8IClcdVJYvYBB1ghUBATj9XYVnhcA==
X-Received: by 2002:a05:6a00:1956:b0:732:6480:2bed with SMTP id d2e1a72fcca58-73426ce76a4mr21390090b3a.13.1740390350591;
        Mon, 24 Feb 2025 01:45:50 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73287ed12e8sm12957914b3a.180.2025.02.24.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 01:45:49 -0800 (PST)
Date: Mon, 24 Feb 2025 15:15:47 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
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
Message-ID: <20250224094547.dv3apdbpwhesminm@vireshk-i7>
References: <cover.1740118863.git.viresh.kumar@linaro.org>
 <a0a1ba4e27c3a0d9e38c677611eb88027e463287.1740118863.git.viresh.kumar@linaro.org>
 <Z7iGHiQcqa-_AXli@pollux>
 <4AD8A8F3-EA7E-4FBE-9F0D-58CF7BB09ED5@collabora.com>
 <Z7iSHR0F2QpiNpMZ@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7iSHR0F2QpiNpMZ@pollux>

On 21-02-25, 15:47, Danilo Krummrich wrote:
> This was badly phrased, the current implementation does not need to consider it
> indeed. What I meant is that we have to consider it potentially. Especially,
> when adding new functionality later on. For instance, when accessing fields of
> struct clk directly. Maybe this only becomes relevant once we write a clk driver
> itself in Rust, but still.

I don't think we will _ever_ access fields of the struct clk directly.
For the most common use, common clk API, the struct clk is defined in
drivers/clk/clk.c.

> > MaybeNull<T> sounds nice.
> 
> Yeah, it's probably the correct thing to do, to make things obvious.

Still need this ? Any example code that I can refer to implement it or
if someone can help with implementing it ?

-- 
viresh
