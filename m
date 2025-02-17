Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F702217655
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Feb 2025 10:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787494; cv=none; b=unfjoykwCziL2UFDqXeSgybUOjoD7rUqM2okQHVEkj6IDz5jFuggizAVU1V7EDmIs4yPErc6bduz7RyPxRxe/wUlzVoqCtZH41hYBJCqMXP1BEMuHfMW+Cmk0RezPUaxz70n4067/pvQ68YnHTDQoI9xNb3bwzpCIDWygxRJxC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787494; c=relaxed/simple;
	bh=H8Yjq3z/rw7nRyXOlTznVPJ6PUKJuVKPnKBPhN1Qy5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fY8+jO8EfXIE76CbZKNeM8Z21V0TQY+MIyA2yjLLf15XjOS8r1o89FwdUGHHsSGPoOC/GQTDGO+ZnjEcnViFfOIiXHYa/CsTrMoyj1qxEEiXXmdyom6Rf0C8B/jeIVqKEmT0kZWM4l0IZ/A8ak/zHuqDwjEr9hdiODllgXMsPI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XcwEHFWJ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XcwEHFWJ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so5956737a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Feb 2025 02:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787493; x=1740392293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu0INveFi62eikawLzwjz3VL3L6K5JPkT0wcB0x2gBM=;
        b=XcwEHFWJ0s/nSpZCusg5KkV5h7GrPerRWfZaxrTlqUoeE6ELDTE/+4UHJ1QirlR17D
         7aLJ7xEqDLa1jka6HVdOp6EuhFMAy7VdH0Xs5VCqHVb4bem/fZ1f5OIceMtACdaJIybr
         yl0DoxAb6GP7tYqLzQtp1djcBlcJbeceh0jcqERR2+md4mlrzoFzvuSqwQz8+uFUj6Ju
         XrtBSulZKubXfvtyQuxfuLVx6617Oocb8uEJJwgRwm7pdtRghkUUDD+0PCAwV3fws87z
         TXn38O2yrH3gMGWBKbZdp0ghG6gi8W64SSiulykFuMPzZ4PZcgOr0914VfU8+KYa5C7C
         zEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787493; x=1740392293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fu0INveFi62eikawLzwjz3VL3L6K5JPkT0wcB0x2gBM=;
        b=RLkmbCdwnUC5nEtwT3Ygxz/mX+LqfkjZnBS7kZzm32krukn7FyuH5/D7JZX5MTWQda
         /go4ySTTxsxV+iHRpLIZdE9QwHbxaCQKCoUiQjOpGhQ3jiQN39pKQFFx8rg/KvBSaSxs
         MPVTk4lTdKBmYUYeaiHznu/UngUS8PTpvX7+esnNMz9jHu1JAaPk/uNnmcL2cE4Mv6+I
         SMO311zCnzLJ2YzDs1k6h4rRRl4EuW5rJqbrOeqRm+9hbQEwqyir3QLHoExjxoZ6O2gT
         thb/q7j4keS9/EhB7MUEkgaTn0IOu1Laxh4smYK+oQD9eciqXD+iwrHeDyCO9JZodJo9
         dJxA==
X-Forwarded-Encrypted: i=1; AJvYcCVgpoNVaKguT7kHYsAk6moG3l48HUpULNweOwbyDs6myN/wUyKoKNH82Rx02jAz6MzFl14nwMWWk0UGC4gv8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGQFnU+zfqVRN2pbp1aa4qeBs4jvoJo4ihGQ5zoobCYMe+dVX
	EJGf8xX/yYE+ryGZ/QzkGcbnert9bSoiEz/lHzNlXyGNA4EE6hboqm+pGmWAUzE=
X-Gm-Gg: ASbGncs07x6uu3OglQZAiaeKDFAtV6ND76wZ+ZaIhMLnw6FXcUS+NeAKaI0PzBOCdq6
	8Fk+xxSf02t9TUrkHJHQ6w4mnrfutbKOpnFIcuj0URh1yQyOAJttF10AVjyKVaOw1CYvkOvpH8B
	XFUujl/Xw7CwIbXixTwDjwcs7XK7igCK8XrKO7hHYNBD4yhZ/re81xu1Vqe/KX1/+AfJDUYuNPu
	ctrgD89hH8CzrZMBwslb5ULQjCoHRXPGPbPlzqsxqj78lsYzFHc6uwYNzvbSY/hrzVh2rSgXngB
	huNZwUJWBubx2MfaZQ==
X-Google-Smtp-Source: AGHT+IE/JsAXrNdfIVWSDqL+q49O/G9yQ+bipOIfparOozc5D45H1FB/VF6I+KOFErnxnRWxPlUA2w==
X-Received: by 2002:a17:90b:510c:b0:2ee:ab29:1a57 with SMTP id 98e67ed59e1d1-2fc40d13203mr14479699a91.2.1739787492679;
        Mon, 17 Feb 2025 02:18:12 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d55960ecsm68106515ad.253.2025.02.17.02.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:18:12 -0800 (PST)
Date: Mon, 17 Feb 2025 15:48:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Anisse Astier <anisse@astier.eu>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V8 00/14] Rust bindings for cpufreq and OPP core + sample
 driver
Message-ID: <20250217101809.fi2b5q5wgxsseqko@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <Z6Sgwbgfp-9SCr8Y@pollux>
 <20250207071538.xjxauatta2jsedz4@vireshk-i7>
 <CANiq72k4N_bD3_QxFKveyjGsSeXJX7y6fKU4EVt0hBOcq9q7tA@mail.gmail.com>
 <20250210080601.afrxidoywz4ukqdt@vireshk-i7>
 <CANiq72kuebpOa4aPxmTXNMA0eo-SLL+Ht9u1SGHymXBF5_92eA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kuebpOa4aPxmTXNMA0eo-SLL+Ht9u1SGHymXBF5_92eA@mail.gmail.com>

On 17-02-25, 09:39, Miguel Ojeda wrote:
> Ah, I see now -- yeah, this is due to:
> 
>     https://blog.rust-lang.org/2024/10/17/Rust-1.82.0.html#safely-addressing-unsafe-statics
> 
> You could do (probably with a comment):
> 
>         pub fn new(name: &'static CStr, data: T::Data, flags: u16,
> boost: bool) -> Result<Self> {
>     +        #![allow(unused_unsafe)]
>     +
>             let mut drv = KBox::new(
> 
> Yeah, a bit annoying... :(

+        // Required due to Rust 1.82's stricter handling of `unsafe` in mutable statics. The
+        // `unsafe` blocks aren't required anymore with later versions.
+        #![allow(unused_unsafe)]

> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index d2e7913e170b..e7c62770fc3b 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs

> +        attr[next] =
> +            // SAFETY: ...

Ah, I wasn't sure if adding a SAFETY comment after `=` is fine.

Thanks.

-- 
viresh
