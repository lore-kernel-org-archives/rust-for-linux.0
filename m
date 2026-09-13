Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2DF380FD6
	for <rust-for-linux@vger.kernel.org>; Sun, 13 Sep 2026 08:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289178; cv=none; b=OQbo+7XnhQaKYJhIwMkciqOBIfSjeJdSdE5JghMFhvR0c0zi9DaAwEsLHn/lFhhWiH1gzlNtOrmo8FiBObC+WIcKtGCfBLGM5Il218clD5PShUC4V9zbfhj9VB6OOi+5Mw2DxuyUCewWR8q9ZSMvvbD5WqZYgGdcKvHzrbipUlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289178; c=relaxed/simple;
	bh=iHvIsz7cl3fIxEd7ZH9+eu1Bi+Ug2ZIJ7yL/8KUNzhc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOEipFgF3C4gn812vJM6FgMqA8fyTEY5YmCkAbMR151EZFgXApFOR6BnbvwHFLSDbfxu3YIISzxpF5ovRQLNb/3IvBRt+P8oKY9vcjDU+njmbP9jACQQq9BeVQQwymkMeY4y0JehlRugY+ry9NwusogwRSL94lGzOD5f/8DJRlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jU/LtYRo; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jU/LtYRo"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fb334e72so11625525ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Sep 2026 01:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289176; x=1789893976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8L1RhqceTVtKN+YKBRtMP6Pzolyp5M8mVVEfY7BsJsg=;
        b=jU/LtYRoRbQUvU0jctkifESRhlMKVvQUlUykjquKDllblDB51b/rkhrsESGiMcN7Al
         xXdq/2FTTzsvKr4h1U0ZsXoY9job/bAk8QuSfNknKGGTlr1BBhPloUuIugXAQO9qn+R6
         lSj14kVSGtgao1GCqRXc6tye9sAq1xw+7X3a9HPwzNENPHeea32LnkeIY5A75jvmd+mE
         mwm91v0IqjolDt4bj1UJpRKRXDwGIkObQbor6MxogEfzBuhZalMpbXkgBZqQICIuT6/O
         RD3wFusepTunoNKAiyXQ42piNvUFGFtRQ3fUJVj/UGmV9l80yqDGrJA7TfwQYt9b7J3q
         c7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289176; x=1789893976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8L1RhqceTVtKN+YKBRtMP6Pzolyp5M8mVVEfY7BsJsg=;
        b=h2zvObbd2cKhf/e689yRKtF+lNZvWh5t4rflNtLgnocwMPXD3ybl7y1/b/9qbTeW3A
         Ei2IGYDQDCY3h29DAEEHbFJOaTGyY+mmNNMcH/mJsASmD74cdLPUw2DNJTWz98DxHo66
         e+hI+sp7jnKhLjfm7fyRY8WIoVaECaM4RTebUq5MCz9CqDRCgyNxkXfnDHsSlQomMZGs
         aYJ4QlhG5RJ2IPnuUhnkQIE0EA2Sqq9zlXbwiI0CkCypxIA1gSlKYrHLRjH4U1aTSWOI
         nrkzcmnTdFrTrZNu04PTNELJnPjAr7jVlnjX3yEFIQn581McokG9expOqeuKKpcSGWQy
         rDQw==
X-Forwarded-Encrypted: i=1; AKwUvBy5fVcjvVLA9blqB1KhfA74cHxFxeI5hesJvMS6wmnBIBZX0TxqIS5DQORDqjP+PXBucgc7aPpy7DustIBeBg==@vger.kernel.org
X-Gm-Message-State: AFuF++mVSIdGFkqbFdUqLZwiOakWrjTlwD88Rbco1FzMRSS6WZr++FLN
	PO1Kcst/h2rMdtl3pSkW0UP/l+xvNxFPQuxbWE3F9KTkXXnPc+6N7fGv
X-Gm-Gg: AYBFou2PSAhfiaRH21yvntfxJWXYMfyFWqHwcevi10qnImGmnOQOesmP+3/sap68Wph
	IPm1h3jpxGSrbkowtjVWybGSlv7m9s9Fq0g6GdzaLyhFTP9HkH3iZfbdKkRvTGFlhoV48ABDeXG
	KhBPtz5iDXOiPa8fzSabtS/OP3i53jbKrvg48H1N7JJrkSyAzsY0we8M0aDfrZSVZdo7P3qxWFc
	XEHH70oTHfALT5lWhl4o4XQDUqZpqnkhzm1cg3GE2ySH5SGvRYa7pmGhngQYIdf2VOgCiCXftPP
	3lvSiwkvK4SbipXyAdns4Rm9bT/4W/UoKTGMwJ+L9yfB7oVGiXLoA5FT0jnnp8vFOvvoCmYohWD
	mwy4yGnlk+ritKQf860n2AvMuB+MIbZQRmhRrdbLvWZz98lGksbP1PEnqOAdgZ+D0SMJ+KAUZgB
	DfRwPHbA9i3Hw/5RhxAEgB2R/YX0l6kCPUm/cM06uQeOndo/AvK4R1ZyfdPbJtI5tPCG4RlPPd0
	vWys/hpmqBQ8ox7kDjZArmCvXxfAw==
X-Received: by 2002:a17:90b:3810:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39d9c35dddemr21890581a91.21.1789289176156;
        Sun, 13 Sep 2026 01:46:16 -0700 (PDT)
Received: from localhost (madb688426.ap.nuro.jp. [219.104.132.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db113a3d0sm9891430a91.14.2026.09.13.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:46:15 -0700 (PDT)
Message-ID: <6aa662d7.0ca013b1.1575e3.0a60@mx.google.com>
X-Google-Original-Message-ID: <20260913084613.3dzcb4puhqeetjos@DESKTOP-1P5QNTF.>
Date: Sun, 13 Sep 2026 17:46:13 +0900
From: Kohei Ito <koheiito.dev@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
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
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Subject: Re: [PATCH 3/3] sample: rust: Add GPIO consumer sample driver
References: <20260906-add-rust-gpio-consumer-v1-0-24d192f93760@gmail.com>
 <20260906-add-rust-gpio-consumer-v1-3-24d192f93760@gmail.com>
 <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMRc=Meei7Z1f1n0M_Hy1LdxG=NVhkFeEiT3=p5QVpw6BTv3EA@mail.gmail.com>

Hi, Bartosz,

On Thu, Sep 10, 2026 at 12:37:17AM -0700, Bartosz Golaszewski wrote:
> On Sun, 6 Sep 2026 10:45:51 +0200, Kohei Ito <koheiito.dev@gmail.com> said:
> > Add a sample driver to demonstrate the use of the Rust GPIO APIs.
> >
> > Signed-off-by: Kohei Ito <koheiito.dev@gmail.com>
> > ---
> 
> I don't like samples as they rarely get built or tested. We seem to already
> have kunit support for rust, wouldn't it make more sense to implement a kunit
> module for rust GPIO abstractions? If we don't have provider abstractions, you
> should be able to reuse gpio-sim as the GPIO controller for testing just by
> instantiating simulated GPIO devices.

Thank you for your suggestion.

I assume the kunit module you have in mind would be implemented like
`gpiolib-kunit.c`. Based on your comment, I agree that a kunit-based
approach is more appropriate than a sample driver.

However, as far as I know, we don't yet have Rust abstractions for
platform_device registration and software_node, which are required to
implement a kunit-based module for testing GPIO consumer APIs. Given the
current state of Rust for Linux, I think creating a sample driver is a
more practical approach for now. I would like to consider migrating to a
kunit-based module as future work.

Best regards,
Kohei Ito
