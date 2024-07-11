Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3915AAD3
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jul 2024 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720704100; cv=none; b=u9uDgAXJy85BMgWqHMqWx5EWH/iu5h1d13BKsq9ZjB2nTOGIrZVo0Sz18Pv/wIABc/qYO3Cbo2+ZGFmhtpFsMXp8zzEPvcs9ClOBsCQXdGNb1AVas9fMb5c+VY1DGSDCPV4MXDPSnRqLCZG+jAHCfn9yM2Y3OEgxoOd23e+a/jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720704100; c=relaxed/simple;
	bh=VYLgOma5y8PGAWFHyBdGWQN79zC9qxnCcbCxqBZcPk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=EtJ9a6M8EVMxHUjeow6LW/i50FP7MnVJy5wBXxYcOgwo6fd0cv5IibMC/JzBeuv+1WPfkziGHajvqa/B6gYH0Ybko627ff1/QFWHis3M3w5Uuq+EJ33cRdppkCTJu7/nTRmsuZRGdFoqTbZRKUYEZBKbrUNGD8OBlIBfa1Hz7m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YSbkPRmx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YSbkPRmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720704097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zmUeUS0CwEYzMpyG+EAkwpAaVPHtFJlIjIkDM+HjJfM=;
	b=YSbkPRmx8g6FxdQwqspCEsZAHApOHGyAuMNMrWDIRZUL1hFCK1yb1H2R+xChurm8dDeO59
	RscgGUua2I9o8bDRZTrSPNMRl2NNCS9TrPoX5VL8SuhAcFy+IfG9Lg6Dbni2y4N0uSfHQ8
	9D7tMtmnXe5JymYlU5rQZCUUDlo+jOU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-Vv9BCcfvM0ieh8D5IFmEgw-1; Thu, 11 Jul 2024 09:21:36 -0400
X-MC-Unique: Vv9BCcfvM0ieh8D5IFmEgw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e981abb3fso920080e87.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jul 2024 06:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720704094; x=1721308894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmUeUS0CwEYzMpyG+EAkwpAaVPHtFJlIjIkDM+HjJfM=;
        b=asHf8xQPAYbqewloCAjrladnXsIYfIeyxO4Fh2OSx9XWWHysn4HLywmVPsuNw67aNT
         gGZjf1JwiinZwKnySzvBlUYO8ufZhskJIBqbwUu3T41EvlTGLXy0PvrmFfr0UK+SKJf6
         KPdKME4TXXrWiQC14OqqegF5rvxntTGSnalEti2/C3t4b+gdGGRg/exnDFiqwa6q9Q6W
         h6PJZVfhHmhhoTXGnbE0YilR40/a8SbZ45XYURghEd/m8xETbPi4XK24ffOnUMaGlv8H
         6H4zf5hYSkKCSpfQF+XxGd7ejSkP+M9iUyyf9j1dX0j5XZ7lmVsfwO5jpyDuPF+ooNQw
         W0ow==
X-Forwarded-Encrypted: i=1; AJvYcCXG2TgpdzYED9O/PKEqT3AW+WEiS5r0XA0MMFzYSIPF2J+NL9iIU1doYuCaMfiXVq4Xrw/Szxh3fkiZ/Pn+xb/o+wmRc1/cO0vOdRH7LWU=
X-Gm-Message-State: AOJu0YxcbedZRqP1dOstRsLcTdard59T5NLmqxiJbARcS3zMVKdZutXz
	My6psUoHUen/VGYzEsNlE7v6uld9cLOh7rPv3ZVNjblCG5NWAJL3smZOO2TXtU7ATGaGJrVpEUa
	sj0JHgJH+GQL12nyK06bRBMxu2hFId+2ewe6rb71U+GQFH6HBRczk48JAnSS5sOgs
X-Received: by 2002:a19:9115:0:b0:52e:a008:8f39 with SMTP id 2adb3069b0e04-52eb99da276mr5053496e87.59.1720704094455;
        Thu, 11 Jul 2024 06:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXl2vrieslEnxAuEQKkk8r/dk2OkCSXwZDfxPoM84kIOhCQcDDZWiSUfNvEJB+eEU0g/Gn3A==
X-Received: by 2002:a19:9115:0:b0:52e:a008:8f39 with SMTP id 2adb3069b0e04-52eb99da276mr5053464e87.59.1720704094060;
        Thu, 11 Jul 2024 06:21:34 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279ab2e382sm21099325e9.6.2024.07.11.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 06:21:33 -0700 (PDT)
Date: Thu, 11 Jul 2024 15:21:31 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 8/8] cpufreq: Add Rust based cpufreq-dt driver
Message-ID: <Zo_cW57i_GMlmYV-@pollux>
References: <cover.1720680252.git.viresh.kumar@linaro.org>
 <b1601c1dbdf68a4b812fcfaf73f3b5dea67f2025.1720680252.git.viresh.kumar@linaro.org>
 <Zo-3QIPbhBsv8EjB@pollux>
 <20240711130802.vk7af6zd4um3b2cm@vireshk-i7>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240711130802.vk7af6zd4um3b2cm@vireshk-i7>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 11, 2024 at 06:38:02PM +0530, Viresh Kumar wrote:
> On 11-07-24, 12:43, Danilo Krummrich wrote:
> > Please just call this function `cpufreq::Registration::new`.
> > 
> > The existance of a `cpufreq::Registration` means that it's registered. Once it
> > is dropped, it's unregistered. It's the whole point of a `Registration` type
> > to bind the period of a driver being registered to the lifetime of a
> > `Registration` instance.
> > 
> > Having `Registration::register` implies a bit, that we could ever have an
> > unregistered `Registration`, which can never happen.
> > 
> > Besides that, it'd be nice to follow the same naming scheme everywhere.
> 
> Sure, ::new() looks fine.
> 
> > > +            c_str!("cpufreq-dt"),
> > > +            (),
> > > +            cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV,
> > > +            true,
> > > +        )?;
> > > +
> > > +        Devres::new_foreign_owned(dev.as_ref(), drv, GFP_KERNEL)?;
> > 
> > This should be called by `cpufreq::Registration` directly, otherwise it's every
> > driver's responsibility to take care of the registration lifetime.
> 
> Some details were shared in another thread [1] earlier and I understand that
> they are not very clear otherwise.
> 
> The problem is that it is not guaranteed that a struct device will be available
> to the cpufreq core all the time, to which a platform driver (or other bus) can
> be bound. And so this has to be taken care of by the individual drivers only.

I guess you are referring to the case where you want to register a CPUfreq
driver directly from `Module::init`. I see two possible options for that, with
one of them being the preference.

(1) You simply provide an additional `Registration::new_foreign_owed` function.

(2) You require drivers to always implement a "dummy" struct platform_device,
there is platform_device_register_simple() for that purpose.

I think (2) is the preferred option.

> 
> -- 
> viresh
> 
> [1] https://lore.kernel.org/all/20240620100556.xsehtd7ii25rtn7k@vireshk-i7/
> 

