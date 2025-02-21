Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3791B1FBC99
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Feb 2025 06:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740119712; cv=none; b=jL0oG4LtaPO9Y3h9WtGjtv23kps2JBgXU85OuImKjsuPx9YhgL6keNGK6h8mzeKOv4cgOTBnKrH39ze2ojLMPwdy8ETKpjhp5+TTDQdkNGOOTFuifkpgmXqenRHRtK/V1b1Vzk2MIJ8O0fTlcuaHI+BlR9Ns/9kVFZLSDxWVSyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740119712; c=relaxed/simple;
	bh=oc+EtHShi6bbNj9AJnLiY/NJj0NfEanMXEUTL2lUbmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hto5nPTIFUGQFFM49SgKudoRpKMYxVhquHuG+79R1+Cgox1bLtaX5NwSDA/d4huUmDzQHiVlsXnFm73RE0T3mO0I8AXnj4KcKyx4pJXMuc+z4jaXkrbQlm2jBDNFUL9BKJTDf+XYzS9NtGR9v40+HLnRqVXx4ek+jrzsULl0uzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=idZAGIMr; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="idZAGIMr"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-221206dbd7eso34319605ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Feb 2025 22:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740119710; x=1740724510; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+iMivRKCEBsggc2rtGQq+coCu/bncplKGZAc6W2LxM=;
        b=idZAGIMr16AeU38mVAUPU1g9TanDgO5TeB7Pv4IqYTw6Sv/Iwz2dQT/nXj9EGQXEaV
         3SqdmwZz4Lo5Fda8PcJkT90hKaHznB3dEZUQbtNRl/i4L8HpxRNc1mHxDMRhtdo0A3Sm
         aFKT0MYtKtWXHTEAYH2eTMTxQaKq/L6wHJyRLYC3ZlTQCYWGU9y624JZ1/pK2N5bCvwC
         Bq1Ufa91CFoaCfQni5AvDauaED9YveH0TFTIhPoqnaDRWaBJ2KDzHPSlh7eObMngmwsW
         WR4+Qc6lO3Q8mD8nmz0VeZojSJTQIDoQ31SkZ19lGBT+mGbVN9D9WSwbJL2vD3M3lHqg
         t8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740119710; x=1740724510;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+iMivRKCEBsggc2rtGQq+coCu/bncplKGZAc6W2LxM=;
        b=G3aY5/cGl65dl5Ufndl+Rl3Id8El16u5ZUNhXdeRpzrDHbcOtdM8aCb9FrmPFoHwLw
         8u4b6yitv7QJQ4JgiSNGqqOhGYrgnA/vGP4gSX6j+62SPy2jtS4nqF+I+5GPbbNCq/ve
         j0qGrklFMK/uWG8kJNeWuEBxrnx/XeeLvUnDtqLn1ab4svq4zKfvL+1OBJA8BgPiScRP
         C3hC013E8M/5OZzt9a87ieZQc6/4YxYsSTYPidMmPnkumo+I28XX8xBUu8snoW1sGZt6
         SBIB+noCkj+UpDouU3YMCFThKh4cup4noliMBiGXfGZW7vIUSKnmTYspMR3suRMvuT+j
         Ib6g==
X-Forwarded-Encrypted: i=1; AJvYcCUkXCkJJDslOzHEJCGasYexrYcjmQeEHXQU3ipE1lSCNAh8Pfe+f+iOCT0ttasKSOsJeiIzQn6VEdpHfKFjBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmwcf0NF+qsztqc7izV5oCuln8MqpAhJPWl10TneR7PkXLMPdh
	nTVDcd7zoENjZETESkCjKIhvMdqzgYLg+mALP1ju9HZzrgJybEsWCBapxaNY0lE=
X-Gm-Gg: ASbGncvUIhGtYQjWlsswUBnAzNJ+0DDfiuJayayFpK7aScnPHUwx1zmt8Jg7+JRrqo5
	jnydTojKyUb4+2JraucUXR16HYAdK3C/YtMa9ovTng9VrPDUpLiZCIT52LKj8qC/hEvl1bmI7lw
	SQGqgSjci/Z3m3/RVjKNL54kxyeTaeH3MGoDbBGxSyqGRaV49ojH1//Kezbmirj64zdolKOT3Fz
	sIT5MhBSRL73oxBxybrsTLZFRkmy7qAtxgVWvCgFsdaCFbu02PUhWJklBrErOZlg+ch9U6ZBnIR
	lKXvTbCJJguGBzsHiB6Ufl/nPGLR
X-Google-Smtp-Source: AGHT+IEjF2u2RW/3YdAr0lHzjtV+TNOOgg3zCjt+GF/uyeQexQA0ARkffz5BS1YIj4YSEzPUqYDV+w==
X-Received: by 2002:a05:6a00:2e08:b0:730:76a1:3935 with SMTP id d2e1a72fcca58-73426ca8308mr2801175b3a.6.1740119710461;
        Thu, 20 Feb 2025 22:35:10 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e324sm14929891b3a.88.2025.02.20.22.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 22:35:09 -0800 (PST)
Date: Fri, 21 Feb 2025 12:05:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V8 06/14] rust: Add bare minimal bindings for clk
 framework
Message-ID: <20250221063507.3vffn55hkmcn6x35@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <c68081e18d939aefc7f6dac798df6b72e81bba4b.1738832118.git.viresh.kumar@linaro.org>
 <EC290802-2C5E-4ACA-A530-E776654C7E94@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <EC290802-2C5E-4ACA-A530-E776654C7E94@collabora.com>

On 17-02-25, 09:19, Daniel Almeida wrote:
> Hi Viresh
> 
> > On 6 Feb 2025, at 06:28, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > 
> > This adds very basic bindings for the clk framework, implements only
> > clk_get() and clk_put(). These are the bare minimum bindings required
> > for many users and are simple enough to add in the first attempt.
> 
> I am missing clk_prepare_enable/clk_disable_unprepare.
> 
> Otherwise I see no way of enabling and disabling clks. IMHO I would also
> consider these as “bare minimum”.

I have posted the clk bindings separately now:

https://lore.kernel.org/all/cover.1740118863.git.viresh.kumar@linaro.org/

-- 
viresh
