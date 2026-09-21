Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0EC48F851
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789996326; cv=none; b=cOg87KJt8/80n7AZpGjV3Pc6GRO/VE8eEgdaX9bCXEuQDm+RdJdqNf6eDJX8NLCg/7YC0DJuUXIM1a7vUpsWLJ5unNsCPV1BuWbGv1YkibCwXEqrAS1+XVG0VOwQyxi+rVCflRQeWQfGZztOmY72iRcUM1Ni7PBFthP7s8w9SDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789996326; c=relaxed/simple;
	bh=KtA6CCgEGQ3a4yGA8b1nCQGctfJ7eca30X6UAxq4SCU=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCDyzzrHx1rJ3JOBl9nkfz8+gzjC6pF0fYJdKI12fSbyftY31WVvCjWRINxXSVmUPPg2AG5zfOkBEbOr2BBIOhtYqkDz/zYGvmAFVFbxvFnMX7qv+VnUKF/O5xz7ICoQ1LOMeU30rKdxytD9WAhWdaQAnbNx5RbToRU12kbn4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IL4AucZ2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL4AucZ2"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so2595697a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Sep 2026 06:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789996324; x=1790601124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5oybhTT8x8wzwm9sXDQfRxO2voeNpjpX34zHsWmu+2w=;
        b=IL4AucZ2W1FKt726U0Llfpi6vvYQljpUQpO24I+AePHBGltZ9X+F6K1SxOW4ivCOaO
         zEwb9U3K0chq6uIXiHcnDXwVfVBlMIsahm9XUvR63MMdXb0x60fxKEa53K48ZHd7TV73
         avUicnGfjk/1fO3n065EeYFap1WuKj6A1bLeSRgh/YpQtjTwfY93v87uzcw6UCfaOUi8
         6caZSI4nfyekafS9N7Jt4oN0Eldd0MXNt46pM56nMw1e/ndeVU9JDQ0JBTOI9buWZgP6
         6YhgwejhXE9oDiNwWYcT23NTV0n6mKwCm5bUrFHt7Rku7NbzNzB/ZWJ3DtH0DGzUJPX0
         P1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789996324; x=1790601124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5oybhTT8x8wzwm9sXDQfRxO2voeNpjpX34zHsWmu+2w=;
        b=n7ykxXe1bMHVKALrA/OMb4gRxz/5z5xrjQ0lv8BidAN4OMLO8jAxvw/ZIPJn6M4/G4
         4naBjhj+BXAAGyWrk5dT9LVbxObvSaWrKmpsIq7FXZyWEYp3K2XZe4Z2iL3xORoCCuz0
         GK69jqOajs2AOZardqS/66fF/f99NPvp/pzdXwKc3fzxc56BfM4HiDewd8sgVY5K2nGL
         K0bjvnd9nHiXb0xtS+YVwMKS3sWUEevxGO0pNsc12gA+Wyu9tAVrMTBVqaObkMceRxLo
         QItU6oJ9hJp8G7D+bexhRTqlwKTgVXc//l+hlnLXNAeYkHGHgt+diU3AUBm4Pzgm4fMb
         AbCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxz2om/jfz3i5ozLiaat24DxWF0b93uLpBt8hudQkAXaR2uIMCVzGInFqcxuFevgW+1tbb+mSuFbt2JLkZzDw==@vger.kernel.org
X-Gm-Message-State: AFuF++luZMuEOxZYBGnAMLMoqhru08ojB2QrgskqNVWYu2KQP67WvgYV
	6Wm9GbU9Rs0ex9BO7xR71zESjEPSgoYvk8zN/XNsMlVkUiWSKrftgZaY
X-Gm-Gg: AYBFou3/L7wCcnSal2kuj1fxf/V3U2YQzLI4tGrbru6wIwZU46LFYUp/PrTHkXyKH0g
	nESk27X0SP39GnUMCH9AWTa9SoHjWJYccBJVVyByg+yGXosVg2J6pDcAw4RvOU2UGatA2OTuhar
	4opPywyHSHtje58w+ynAKH98laCfy1NC5lb2joCHF7VQr7KJFSiUSZVdr3zNB4Nhg1oPNFi1c9X
	LU9AvPGo+kBYL4d1tuvICsHtzTHjD8DbrEk2JzzuqRRaUZB+d5FL52rAlxl74dbjyVXWf8KaEGL
	/z5hlQtTsnJhCtfM0K+jiQDYGJmP23XC4wGOTmajjCBc09wzYEwtse+gWOsQ1TduL3ui1HuFesV
	eac+H+WexOPtfafzLbIL7JZJXUx1cU8zTzpRsgbO//VAEp7S/IA/eC/wEOylbDYvFEGV+e7XU7x
	DkcmUlPzDCzy247CUu0tMdjoO/6aw2jZtE5KrwhPAn6uG37YxjiwhXt3oEMdfY1qp3cFHzU8A7a
	jzQ5HcoT2SgVdXLpl4=
X-Received: by 2002:a17:90a:da90:b0:39e:6a80:b796 with SMTP id 98e67ed59e1d1-39e6a80b849mr10966388a91.38.1789996324410;
        Mon, 21 Sep 2026 06:12:04 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6d83e253sm5812738a91.1.2026.09.21.06.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 06:12:04 -0700 (PDT)
Message-ID: <6ab12d24.a3d4836d.3b68e.d0f8@mx.google.com>
X-Google-Original-Message-ID: <20260921131201.u2sxphwziumenyfh@DESKTOP-1P5QNTF.>
Date: Mon, 21 Sep 2026 22:12:01 +0900
From: Kohei Ito <koheiito.dev@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-gpio@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
 <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
 <6aa662d7.0ca013b1.1575e3.0a60@mx.google.com>
 <DLENO35F39LL.2YNA66D9FCXYH@nvidia.com>
 <CAMRc=McV2YKgbmnknLZTSGoSa_9eCHDiOLzuPPyPHHnj=vRuvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMRc=McV2YKgbmnknLZTSGoSa_9eCHDiOLzuPPyPHHnj=vRuvw@mail.gmail.com>

Hi Bartosz, Alexandre,

Thanks both for the feedback.

On Mon, Sep 14, 2026 at 04:36:48AM -0400, Bartosz Golaszewski wrote:
> On Mon, 14 Sep 2026 03:41:29 +0200, Alexandre Courbot
> <acourbot@nvidia.com> said:
> > On Sun Sep 13, 2026 at 5:46 PM JST, Kohei Ito wrote:
> >> Hi, Bartosz,
> >>
> >> On Thu, Sep 10, 2026 at 12:37:17AM -0700, Bartosz Golaszewski wrote:
> >>> On Sun, 6 Sep 2026 10:45:51 +0200, Kohei Ito <koheiito.dev@gmail.com> said:
> >>> > Add a sample driver to demonstrate the use of the Rust GPIO APIs.
> >>> >
> >>> > Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
> >>> > ---
> >>>
> >>> I don't like samples as they rarely get built or tested. We seem to already
> >>> have kunit support for rust, wouldn't it make more sense to implement a kunit
> >>> module for rust GPIO abstractions? If we don't have provider abstractions, you
> >>> should be able to reuse gpio-sim as the GPIO controller for testing just by
> >>> instantiating simulated GPIO devices.
> >>
> >> Thank you for your suggestion.
> >>
> >> I assume the kunit module you have in mind would be implemented like
> >> `gpiolib-kunit.c`. Based on your comment, I agree that a kunit-based
> >> approach is more appropriate than a sample driver.
> >>
> >> However, as far as I know, we don't yet have Rust abstractions for
> >> platform_device registration and software_node, which are required to
> >> implement a kunit-based module for testing GPIO consumer APIs. Given the
> >> current state of Rust for Linux, I think creating a sample driver is a
> >> more practical approach for now. I would like to consider migrating to a
> >> kunit-based module as future work.
> >
> > The problem is that this sample driver never probes, so in effect it is
> > only ever compile-tested. Without support for the provider API, you need
> > to include a small C fixture providing a GPIO chip for it to be actually
> > runtime-tested.
> >
> > Doing the same using KUnit would involve building the `gpio_chip` using a
> > bunch of unsafe statements working with the C bindings (which would then
> > in turn require `gpio/driver.h` to be added), so I guess we'll want to
> > wait until we have a proper Rust provider API to go that direction.
> >
> 
> No, I was thinking about the gpio-sim module which is implemented as a platform
> driver which you can describe with a software node and then register to create
> a simulated GPIO provider against which the consumer APIs in rust could be
> tested.
> 
> To that end, we'd need to just register a platform device from rust and AFAICT,
> there are already APIs for that, except for the software nodes.
> 
> Bart

I looked into this further, but couldn't find any Rust abstraction for
registering a new `platform_device` (no file contains a platform device
registration function such as `platform_device_register()`,
`platform_device_register_*()`, or `platform_device_alloc()`/
`platform_device_add()`). So, we can't write a fully Rust kunit module
for the GPIO consumer API, at least for v7.3-rc3.

The best approach I think is a combination of a Rust consumer driver and
a C kunit module dedicated to testing the consumer driver. This is
almost the same as `drivers/gpio/gpiolib-kunit.c`, except that instead
of directly exercising the GPIO consumer APIs, the module I'm suggesting
exercises them indirectly, through the Rust consumer driver.

Best regards,
Kohei Ito
