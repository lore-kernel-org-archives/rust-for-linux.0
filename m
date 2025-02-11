Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CA51D5CF4
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Feb 2025 04:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739248154; cv=none; b=ChksX574zDfRvnCNu+TQA/ouisenQzY4UpKgigz35UiyjMZ9ZYi0vTtgmQeQD8aDpJZwO/Sqr/AdW/IZPQBWWeuHWnChjJXjKBcfPZ4kVTmrqVq6Q1ZSOXxtubGrW/tCt1qUx1Bprm8sPxYQ7Nvk1Q/fPVzsBzKcNsTinajYuAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739248154; c=relaxed/simple;
	bh=Eh4D03RgjRhUFUGbjnsrtoBwi4K6jy62lBsis7HXjqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1ea9u3yYzVPLtR1Vee374RlZteMj40zGYPaIRlGWl6iyE/BWQz+19kNqxujGUlg/XyoqvXB7nnpajYMDRp2pQDyUofCxFysX0NstheH5MrYAEGShZFN/JUh5Ki8uQjaAmZEr8BAdomdzVzDLHTU4GmuKK5cupU4ptMB28b9/vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mp5crol3; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mp5crol3"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f6d264221so32347105ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Feb 2025 20:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739248151; x=1739852951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R17/qsybBuUiE11sy3rr55GZQNSwgogOHqxcTs41IzQ=;
        b=mp5crol3mvRMFzdn7o2vZKzsUToSZYWKSP8DyMnmPdwg1Lo7pE9DemQtA8iAYxcqyn
         XiY7okiTDAe9pSNJyGD44ioLnD4+UGLTfchrP++AuXYNE68kCg0NvzSrPd9IgWWzL/3n
         dMDyxMNthlbrhrEQU1mtIKLsurxPPtvOIVVegIbP1OPtRWCg7nGCFavOyw82CgKNWPPc
         Gp3rMG5wmkEpJ7+aGayeOY5ENba+agEA9SujVbdZ9S+SAoesn6YdVAlWjxszOH8zG7tK
         qH1tW5V3xbN99F+QvAvfd3POU3cbHAiFpciz9VJkZMWmBtSrxRh0kdhbF/0DTbkXbWae
         O3yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739248151; x=1739852951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R17/qsybBuUiE11sy3rr55GZQNSwgogOHqxcTs41IzQ=;
        b=k9zSp7qXmGnCZfB5XjQw8EYpQKvrHhaLNmtIKin1bLLcaqXli3qQ/2Dc5tl6gOkKhZ
         0S9ANyC1jAZuZrIhjIXv/Vz7vGSyMLybyxet4wuOhk2M5heFtkbGzKGr2ODP+A6VHAfn
         P3HL8Z0PCiWG+74b2JPAwgmjFRPs+jfyXMGdOfFs2vHjiWxuNQaycZm4VK+xacf3/0kF
         wMsU/9fXddv5Aoo6ehuLMC8VjtzIUMu+TE9/7AiQgjUrJNgzZezUnpT3Kp+WFthGWurY
         n69ggVdLN9td2kHv3oAZ9t0BZX1KqulwBlz7g6S3Uf2ogYMM1hP/4kdsqcUlCVK+w73E
         digg==
X-Forwarded-Encrypted: i=1; AJvYcCWosHfJrNGUApUKfRPIL29uxf7sGORUtOlDLMEVdgyBw3A9TwvCxG9+XyxyLAj5HJsNsOv7tw+2nRGqdOLlqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn7MvtIB0itBEay05JuzpgMXWgx5A5NhBR17Yn6ta1qUil0/UT
	5kOCpU/Le3sS8L2JlB0XdbAJbejMZftvvIBI+sqa2XWi6Xz5hdUyFDsWB8IO3/k=
X-Gm-Gg: ASbGncv9/QXeSnHWMkgTHOvJax3fVQuDUn68tFXtvmBPN7PSEprv5FMOBgDs1FWavPm
	wPsURYeHP3H3E0cK3oMiSM21LT2Vd+p3qjmMAETdZpOQI64A/q7vUVOTHNBb1tCxoyGdeGfjNIM
	cIe7K9XACMM1xIVd+gVftrax+A7cvUkDrW+r9S+NQaEProqKvcx6JCueOxiJin7dLWEDDuD0o//
	k1R1z+dECll39IOI1DbyhJkPo7a8fLNyM5s0i675EyItz1+TUH9WT9m7GJXoufrExFlKwy/756P
	K07RjrZPXhteRUSaWA==
X-Google-Smtp-Source: AGHT+IEZcBKkgQvgu0Gja7oPmp7ETDL4kRRxy2BoBNXWnfh9afk9yQuRY7Pd92NDnJpb7opE0F3HeA==
X-Received: by 2002:a17:903:2309:b0:215:a04a:89d5 with SMTP id d9443c01a7336-21f4e1cf038mr280431035ad.2.1739248151630;
        Mon, 10 Feb 2025 20:29:11 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aecfa58sm8630725a12.25.2025.02.10.20.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 20:29:10 -0800 (PST)
Date: Tue, 11 Feb 2025 09:59:08 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 04/14] rust: Add cpumask helpers
Message-ID: <20250211042908.nyftiw7gtxosfjwc@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <db0166341ce824c157d0c58c240b3efc6aec6f6e.1738832118.git.viresh.kumar@linaro.org>
 <Z6qTelPSqpFk439l@thinkpad>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6qTelPSqpFk439l@thinkpad>

On 10-02-25, 19:02, Yury Norov wrote:
> On Thu, Feb 06, 2025 at 02:58:25PM +0530, Viresh Kumar wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ee6709599df5..bfc1bf2ebd77 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4021,6 +4021,7 @@ F:	lib/cpumask_kunit.c
> >  F:	lib/find_bit.c
> >  F:	lib/find_bit_benchmark.c
> >  F:	lib/test_bitmap.c
> > +F:	rust/helpers/cpumask.c
> 
> Sorry what? I never committed to maintain this thing, and will
> definitely not do it for free.
> 
> NAK.

Okay. I will add a separate entry for Rust cpumask stuff.

> > +#ifndef CONFIG_CPUMASK_OFFSTACK
> > +void rust_helper_free_cpumask_var(cpumask_var_t mask)
> > +{
> > +	free_cpumask_var(mask);
> > +}
> > +#endif
> 
> This is most likely wrong because free_cpumask_var() is declared
> unconditionally, and I suspect the rust helper should be as well.

Non-trivial C macros and inlined C functions cannot be used directly
in the Rust code and are used via functions ("helpers") that wrap
those so that they can be called from Rust.

The free_cpumask_var() function is defined as inline only for the
CONFIG_CPUMASK_OFFSTACK=n case and that's where we need this wrapper.
For the other case (CONFIG_CPUMASK_OFFSTACK=y), Rust code can directly
call free_cpumask_var() from the C code and we don't need this helper.

> Please for the next iteration keep me CCed for the whole series. I
> want to make sure you'll not make me a rust maintainer accidentally.

Sure.

-- 
viresh
