Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9D91C84CE
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741002250; cv=none; b=YERTe57MwP00FrZdFDKHKf58WnpeeBvIrrNFZs7BlKaqReAPcw1BIMjUmCfeeQTVdOGOwyA9gF1zVN7Z6CEfraLUIEjGPSrbmwFK+4MTrKKLHrhW0jhGdEgqbJpIjymqG6tAlaPwz5EVzRvxpRGUMU+nQEbeGSFFs2KTa5Bk/zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741002250; c=relaxed/simple;
	bh=luQaXlapm+5N3MbCSgVBhzGQTHPZ+V+taACIos9pA2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xky6AKpSTYdoO0hLHxtUmjM/tLF5OLuXX+rtjtxh4GXgedAJC/PU6HxkobHp9Wd2ux8b2pwGGjScWtBTdzsexfpsvbR5xwkFhyNSt7eNomNAyJNYI48jtU4cufeRTgse4seDacW3vsi+zomItjfjgFnyk7Eg6YBngV2fnA3mI9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eay5GK+5; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eay5GK+5"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223a7065ff8so25390955ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 03:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741002248; x=1741607048; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/iVipZdD4W/u6xESxWCd4AYGgSc83dG/Ajr1AHkUSjs=;
        b=eay5GK+5IUg2nQIEuL+HcdQXt6aY/71W1U7bdgeTTbeWlfeOvmrbJ69qEkHxL/V2S2
         GOleLwYYUi40hcbZQ+Hk0bhdgJhrOhMStUUlC//QByBxlvAWK0KEJZPKd5oAixkFryfy
         yek/Iyfe+vlMxJsPZBWVCNWDIInLhYTyx1XKF9HUPWKDnlLoFLbaCM7vzcXgldneFKSQ
         kNNVEqBZdxOsG9Gk/dKC5P9W6uesN59f4qZ6P3aDGJ7P8XlmkMvg5/+7bfZ0qYseXWra
         PCL9yXbel5L7q7qOApt5I3GLZD0KPBWneMTrq4rqRbZaS2uv3XpJTgLZlLwDXJ0ZvWbE
         sVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741002248; x=1741607048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/iVipZdD4W/u6xESxWCd4AYGgSc83dG/Ajr1AHkUSjs=;
        b=qASmolaG/4d7qBrvZjC6yuMGjnFBOHfCaQOkfUq6PBd2gXE4mWvMkvcoeZSTw8YwaR
         P+q3MmEvA4j9EWRxB9pXDDwiPNYFnK3EMXyhYqWNPFTgV5fbwzOtPBzkn7VRJUD8Wi4O
         x3sWjRTq7bAa1fYcoMw9L2C9cXsby2QQ6nHB7pw8cfAQRVd9JdI+lShSTNH8xU7RW67B
         elyTZnYUUSMywpaXCsREs6vRhlcy3JyCaz6fM5e7fAP0tObvEgT3GMV0Qeayo/eQvi/d
         yiJTGuT05EuNyqZnT5aCcardreyyHUzdYqAGmm3i9a8a4H5Mflk2nJyIplh5fPUSY4IA
         bZGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9Z+zvF2Vk5h1BvRaRq71cZeKhuSQeLGAHwJ29qw1IEFsqtQzRLCpoMBIX0RB2GsM1QHiTPbkRLe7GKbD8hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEkmWpZcWseMX/WAmgY0Ilhb+o68orAJx2vZN9DshDCKsUTGvK
	vRKiabXTSOp48JAA9F9MWSrFsJEErYFROkopcJBfNFldrZfPWXkSmEKm0fVSjj8=
X-Gm-Gg: ASbGncsC6GDs5rrnnNEodfPmr+iBsN/YXRI2jm0nnlOBp4atKYaZaeZ2bn6KG4wpIkV
	oPg+0ZzyPYkaPkYIfHIBfI6uDiVq6N4FPLCTziNwSzXQ82kmZmLmIMmogon9k/LBmN0VxtRFdwp
	OWHmQPUNXQOZqsBOd/h2ntRF2EuoErUt8D6z6To4bC5Ydzh20HwFv6U57+FGmq7wN2c4Os9g/CO
	T6SwPvcHJzy89ZWGX+8S1IhmdTeb6+xkiRq0mkA/RqtpHhNm801/EXd7qIaSqB5nsy2YGpqDTCk
	vWR9uZbEeERXZZ+haAs1NxUC5H13ZPbRP40FPNuARyhhWQ==
X-Google-Smtp-Source: AGHT+IHK6Lers8i6supYJLggNOwZjS+MBopT5CAeMJGX3443/hyOyrprvywUIlovcrK7G39ADGHiQA==
X-Received: by 2002:a17:903:1d0:b0:220:bd61:a337 with SMTP id d9443c01a7336-223690ddef3mr188436085ad.23.1741002248534;
        Mon, 03 Mar 2025 03:44:08 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235050d7ccsm75787615ad.202.2025.03.03.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 03:44:08 -0800 (PST)
Date: Mon, 3 Mar 2025 17:14:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH V3 2/2] rust: Add initial clk abstractions
Message-ID: <20250303114406.xbfzhw7nvxdildb2@vireshk-i7>
References: <cover.1740995194.git.viresh.kumar@linaro.org>
 <023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org>
 <CANiq72kdWzFOZ39EoFNxEAbk4KYgzLi1OAEc1zn8BM07VpXy3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kdWzFOZ39EoFNxEAbk4KYgzLi1OAEc1zn8BM07VpXy3g@mail.gmail.com>

On 03-03-25, 11:16, Miguel Ojeda wrote:
> On Mon, Mar 3, 2025 at 11:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > +/// Frequency unit.
> > +pub type Hertz = crate::ffi::c_ulong;
> 
> Do we want this to be an alias or would it make sense to take the
> chance to make this a newtype?

Actually Daneil did suggest to make this "Struct Hertz(c_ulong)", but then I
looked at rust/kernel/time.rs:

pub type Jiffies = crate::ffi::c_ulong;

And I thought this is probably what everyone would have agreed to and did it
this way.

> > +    /// Clock enable.
> 
> Should these be e.g. "Enable the clock." or similar?
> 
> Moreover, I see quite a lot of documentation about some of these
> functions in the C side. I think we should not regress on that. Should
> we link to the C docs, too?

Something like this (from print.rs) ?

/// [`pr_debug`]: https://docs.kernel.org/core-api/printk-basics.html#c.pr_debug

> > +pub mod clk;
> 
> Just to double check, do we need any `cfg`? I see some functions exist
> even without e.g. `CONFIG_COMMON_CLK`, but I wanted to ask if you
> tried to build it without it enabled.

Yes, I was using this under `cfg` earlier, but removed that recently after
testing this without CONFIG_HAVE_CLK. clk.h provides wrappers for cases where
the config option isn't available.

-- 
viresh
