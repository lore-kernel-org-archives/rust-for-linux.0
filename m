Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E02D6E5A
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 18:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760380471; cv=none; b=knNTypAKNYExSc0kyerYFJY9zUtswkwZIIq9uKqUNDNDLMkAQlxCr4k3rPQ3ZFrYr0+7Eqkfxy5hI/pV2AChp2Cz7w8+nmltuMK7YQNfMTSSsO8i4sMVDHXLVN+WHB7vjtgaiEWfgdeCKyfI9E7x4m3xiFMsu1UYr1aF8jdcgmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760380471; c=relaxed/simple;
	bh=MhcnUYIzW/AjzXhn2E+PvO698S4Cf6FqeCfg4+Wjp0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bosKXuhycPIk3lUzViDcHKj37ejPRta917OUfjbhRng9Mp+KdbadUp3ATh8lB3jfVqy9d0qMcrFEREYo31UipVAUtc5k+Pvy18Nua+36ZpsU9AAXUdcIrzp5eRkVyI1hcB9GZBFpIafg6wvLGy2KikexYz8lqhjury3xZWi1jtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ym8M83Gj; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ym8M83Gj"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b5a8827e692so68029666b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Oct 2025 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760380468; x=1760985268; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ay88j/QH+hyyaDBYdXcO1dx59pcNYIrbAIsPI7MQ/r0=;
        b=ym8M83GjNWGwF+4tsGmYsHLbaPw+5Q9ol66z0+BSv49SO2oEAvVk0y9EDa/WyxIv11
         i5R0F1Nc26odJPK0HVY8O94K7oUEXSeVXAbvDb/GpZBzlAC4547cUecaYabC3e3bim3c
         UVwAJ5mGmA1FqmR1OneRzlQVpbNhyZYqdNZI1VUMB6ygLh8lhun8FDksBYlzR/b6MRuR
         a7HAH3tHmQbE5LhVgiClt62YbVp3CfK2bkWPyI0VVMh+RqGGBLrEFVIZKNPukDtAFJE3
         +HRyzafHZEE1jCnV8WVP511z1nFi6XHzq8zbxOmUC5Ac2XLsmfuU5yXgjQP6tvmHrU7q
         8wmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760380468; x=1760985268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ay88j/QH+hyyaDBYdXcO1dx59pcNYIrbAIsPI7MQ/r0=;
        b=Mr2GxD65GfjkXJIjZetGu9akaJueyqXyJcGoEUrB2SVrzCPD9YaF2gG4Ab6vclGZ2Y
         8yOtmhh7AwvDbNYPKlWRsz10/cIeq0Rgj7FJToLCyGpEe9q3PzpGaNkpwn50qDVtba6m
         zprOtPrzvYzO9ApqQI1ttkF0t3W6zAZsHtp7eZ/lm1GGXvyqCqBgvejzn673TzWNK5Ye
         64KzsE6dEDkT+E2GpjDq1mho9E9FO1LLoCuf0g1r19hmy6SbcMxsR/XXPQAtX5Xr4Jq3
         zwE2hFeiolMbVGzSJ21oiqTbR2KM37t6DIV7UDZzQD1gblhDjhmTuYoVXmCV8L91oTmo
         4DAw==
X-Forwarded-Encrypted: i=1; AJvYcCV8azjF87hNNDYC/WJfpO6sAkl5jP/DQj85ytT7z8LHqevYSK7dtNmgwTG/EvhnHLa5000uf2i4LUfGW12uTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/kIdS56fA/QwqGjY04lF3P1CAtSOaoIr2C8lJbOQG6ilvtH7X
	671iSI4Y3LHXofKXwajwxRnJRSOkBZa3J2Aw3PPG7MccbmQ0dSfWb9iicWcJbc7Lugwn0mfjFM+
	yRWnWw86muXFvgA6fMQ==
X-Google-Smtp-Source: AGHT+IGe1qNQN2z1oRXedOyQR3Zfee2RXdyhLUdBm0dMR5H6rdNOgRFmc0Gkgty5AvsElHYqpi3+spY3mX20Te0=
X-Received: from ejn19.prod.google.com ([2002:a17:906:593:b0:b3c:12c2:d0dd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2689:b0:b3e:bb87:772c with SMTP id a640c23a62f3a-b50aab9c912mr2457025366b.17.1760380467851;
 Mon, 13 Oct 2025 11:34:27 -0700 (PDT)
Date: Mon, 13 Oct 2025 18:34:27 +0000
In-Reply-To: <20251012145221.172116-3-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251012145221.172116-1-markus.probst@posteo.de> <20251012145221.172116-3-markus.probst@posteo.de>
Message-ID: <aO1GM4WXs37Zpm0G@google.com>
Subject: Re: [PATCH v4 2/2] rust: leds: add basic led classdev abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Oct 12, 2025 at 02:52:39PM +0000, Markus Probst wrote:
> Implement the core abstractions needed for led class devices, including:
> 
> * `led::LedOps` - the trait for handling leds, including
>   `brightness_set`, `brightness_get` and `blink_set`
> 
> * `led::InitData` - data set for the led class device
> 
> * `led::Device` - a safe wrapper around `led_classdev`
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

> +pub trait LedOps: Send + 'static + Sized {
> +    /// If set true, [`LedOps::brightness_set`] and [`LedOps::blink_set`] must not sleep
> +    /// and perform the operation immediately.
> +    const BLOCKING: bool;
> +    /// The max brightness level
> +    const MAX_BRIGHTNESS: u32;
> +
> +    /// Sets the brightness level.
> +    ///
> +    /// See also [`LedOps::BLOCKING`]
> +    fn brightness_set(&self, brightness: u32) -> Result<()>;
> +
> +    /// Gets the current brightness level.
> +    fn brightness_get(&self) -> u32 {
> +        build_error!(VTABLE_DEFAULT_ERROR)
> +    }
> +
> +    /// Activates hardware accelerated blinking.
> +    ///
> +    /// delays are in milliseconds. If both are zero, a sensible default should be chosen.
> +    /// The caller should adjust the timings in that case and if it can't match the values
> +    /// specified exactly. Setting the brightness to 0 will disable the hardware accelerated
> +    /// blinking.
> +    ///
> +    /// See also [`LedOps::BLOCKING`]
> +    fn blink_set(&self, _delay_on: &mut usize, _delay_off: &mut usize) -> Result<()> {
> +        build_error!(VTABLE_DEFAULT_ERROR)
> +    }

These functions should probably take a &Device<Bound> argument so that
they can use methods that require a bound device (such as IO).

> +impl<T: LedOps> Device<T> {
> +    /// Registers a new led classdev.
> +    ///
> +    /// The [`Device`] will be unregistered on drop.
> +    pub fn new<'a>(
> +        parent: &'a device::Device<Bound>,
> +        init_data: InitData<'a>,
> +        ops: T,
> +    ) -> impl PinInit<Devres<Self>, Error> + 'a {
> +        Devres::new(
> +            parent,
> +            try_pin_init!(Self {
> +                ops,
> +                classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_classdev| {
> +                    // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write.
> +                    // `led_classdev` gets fully initialized in-place by
> +                    // `led_classdev_register_ext` including `mutex` and `list_head`.
> +                    unsafe { ptr.write(bindings::led_classdev {
> +                        max_brightness: T::MAX_BRIGHTNESS,
> +                        brightness_set: T::BLOCKING
> +                            .then_some(Adapter::<T>::brightness_set_callback),
> +                        brightness_set_blocking: (!T::BLOCKING)
> +                            .then_some(Adapter::<T>::brightness_set_blocking_callback),
> +                        brightness_get: T::HAS_BRIGHTNESS_GET
> +                            .then_some(Adapter::<T>::brightness_get_callback),
> +                        blink_set: T::HAS_BLINK_SET
> +                            .then_some(Adapter::<T>::blink_set_callback),
> +                        .. bindings::led_classdev::default()
> +                    }) };

This doesn't look like something rustfmt would output? Could you run
rustfmt if you haven't already. If it doesn't do anything, then please
format it outside of the macro and move it back in.

Alice
