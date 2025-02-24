Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55107242912
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387378; cv=none; b=S/bvxaKbkWDrym72nNJdTtv2x4kzKqUoQ4Ntzm4OVyly3AcTBrwTkfvhCvpqTzIzepvv1VK1haZDqk+ArayUYo2qzBDCIyTvncMaBaGXgMtfCMBLY4kTUijRplI9+iotND/h1gvOiD1CN8LK6PaHdNlGfOYlEGyvAJD6URJ2a10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387378; c=relaxed/simple;
	bh=06AblsnnP+1xAekOfi7Ql/W2vrMIvov4zF/dPunqSk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H1j6HvS3kEbWwVaMj9v+77y1UOXLoNGzq5rXPYagDTzqGeC2bWl5Eu/MSg8epAB1EvR1FqWkeJVZNnh2SpP+FM81gCheMsEyBvSnd9zuYOyibJQljbvRNZu9253uzGWWOCoqKqqXcflm80N53gBT3Ow2/KMefjX6rD8GaMyaD14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fl4GN5s1; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fl4GN5s1"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fcb6c42c47so6340652a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 24 Feb 2025 00:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740387376; x=1740992176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TaBv8v02Nb3a5UGjEfTd42AEkkKkLNKGhI6ZakaIigA=;
        b=Fl4GN5s1yDCpk7u6QvDORnFrj1KzI1f4ncIRJ4sP9Gv4vhbkuTHZQU8mNzT2YqUnyf
         mWuALNw2DfeDR71uhv8k9dh/6Hy5sHadU0mYF4XiAgEmzigEnoq7s1lAEiC/UgMJ7+2O
         WoGRrnKi+FcmqT6xc0k7IXCXgi8MMWtpq11rPV6AO4LY+Iz1BN01Ej/y9Lf5zxufLAvX
         t9gdPIe6MZRusdGlA4JehdGXQX5vic+hY2uVY/xCAE7FvhQUr6yzLXPp1p0nkHJdhPZF
         vEIqAgTvhovNVnCaR5o2qGHoIp+RGX6JkQR0tdo/mPqyNY1c6JNDpjcJx0pcLLohv9/6
         tpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740387376; x=1740992176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaBv8v02Nb3a5UGjEfTd42AEkkKkLNKGhI6ZakaIigA=;
        b=n6g68UQtVaCGiteD63lhX4s0Xku4z9Pwo2MtsTGMF3RrHK0egGDuE2LYtdpXj72VN8
         nSvwDkCr/xPxPOBdlF+vjQXAToKQNSgNyGrBQLTylqlvNp6WglIsSn963Jsz7/Tpm8qj
         /E655U6pp2TRwi9bF8+otDzHvCJXdx9euKMqSxfw9aQAlXWQMJa2SXqvNEroZPg+w+fA
         QbVyPYgYt3rNAeDxRCXpU3fkUDw5IxJaRzQOE/3CNtFOif9/Luxhwf8GeAoeaDrdLOTz
         rHxpVy90sjhbIoUjNGpPpaPaG2jBIe7oKk5E0XyBAU0Re7A+YRvkr4pWK32MI+oMe6At
         j9LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFOOorUAJS18B8xwuICWoXGrGDFLDTS6y5uZPB9v3Qr+vJOi/q8MY9lsFpAK9dHfx1+GWZtFgloBL75ggn6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjsbbT/0IgE66HuSl0jYAttpnPYzaM/xQXqigr4JoR6gtfZGrj
	MZSgAj29Rv8g0wFd+s3Xo6xiJnL3Jf7MIo1+DP1LMlrUTXAhoKdE5ioAyg4/N5w=
X-Gm-Gg: ASbGnctNRuGeUIKeDOL4fFIlvYidw62WYzoJigBcXN+Y1k8D9fIG48KDnvGmseS9feh
	srpBtiuskPWG7gTGyYisbIe/dIIKNdF1+sip6EINhVg2EElAn8CxLq1Thlme9sjL7xsWU/s7yo4
	JvaXp3QHOQGt0G+1Q0Z6YR6qW73EbLZGQnOJ75l4dYy8+b+wbDqa/NK0qgH6Ivbg1ywGCp9C1ch
	mj9mIDlgVNwASD3ibqIu8ZkUPviI+aduS4/mdI5A4+ZOQaQDcVyR3puZBBCzDbuqZmVNiUDSyAx
	1jUWRAA5YuYCJ2l6h4CXdY/x5Qc=
X-Google-Smtp-Source: AGHT+IGY+3wZyrH4ts9kooPUWiPLq9Tpuvj09t7MxZdfeBddQhQdu28WeUptIuYXx4KhcW9eZJ1mmA==
X-Received: by 2002:a17:90b:2246:b0:2ee:693e:ed7a with SMTP id 98e67ed59e1d1-2fce7b3e4cdmr21262746a91.35.1740387376617;
        Mon, 24 Feb 2025 00:56:16 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb0499c2sm6028625a91.12.2025.02.24.00.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 00:56:15 -0800 (PST)
Date: Mon, 24 Feb 2025 14:26:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: Add cpumask helpers
Message-ID: <20250224085613.ksburgsarl35tvnh@vireshk-i7>
References: <20250221205649.141305-1-yury.norov@gmail.com>
 <20250221205649.141305-2-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221205649.141305-2-yury.norov@gmail.com>

Hi Yury,

On 21-02-25, 15:56, Yury Norov wrote:
> Question: zalloc_cpumask_war() is a convenient wrapper around
> alloc_cpumask_var_node(). Maybe rust can use the latter directly as it's
> a true outlined function? There's more flexibility, if you need it, but
> also a higher risk that the API will change: ~40 users vs 180 for zalloc
> thing. Up to you guys. I can send v2 if needed.

I looked at the APIs again and here is what I feel:

- I am not sure if the Rust code will have any users of the *_node()
  APIs in the near future. i.e. There is no need for the Rust code to
  implement Cpumask::new_node() version for now.

- I have missed implementing the uninitialized version earlier,
  alloc_cpumask_var(), which I think should be implemented right away.
  Bindings for alloc_cpumask_var() are required to be added for this
  though.

- One advantage of using zalloc_cpumask_var() instead of
  alloc_cpumask_var() is that we don't need to open code it in the
  Rust code, specifically for the !CONFIG_CPUMASK_OFFSTACK case where
  we need to call cpumask_clear() separately.

- The Rust side can have following abstractions for now:

  pub fn new() -> Result<Self>;
  pub fn new_zeroed() -> Result<Self>;

-- 
viresh
