Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9A41FA15B
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 18:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879833; cv=none; b=RrMZ5vyHxHy63xbB6IaOxDEEqTD+TC8av85ENGqnUlQOl4RSo+oKRSF5okqXMKnAd2tBoJ6ajENM8IsdNp+SqSGj7FFAHcDhgt6R5aEWtu6o8t+r95L/UkHqGWEdIWxxkAFgLyGsaZf/Pd6wz0lPpcPzT3l5GTprrA4jPFDJXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879833; c=relaxed/simple;
	bh=BAt2ZEQD7IOL4R/IQiqWBSV99+y7gajLe5jimdF1o0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z9cbcVkT4oSJt7isEvLtVIfbnD+VgT/ST1acajfhFZDWK2HF8MAjO37HUZmKRAeCEl0cFRXx8NcD3rdUmRCYhUZAE83t61v8fnKnZSyJ7um0VxXarKowdZ8z+/AcfTX5swabG13SRlF123ZCWoJwWx63/TR8zzo+sDQKy4RlCaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MfgbGpsr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MfgbGpsr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43622267b2eso60871235e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jan 2025 10:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736879829; x=1737484629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6OVTpN6QQOyROrjZO4elCp5JsY1caRN4LlWeoNZSoA=;
        b=MfgbGpsrGn5kaIbvvTwBTw1zyUbKcn5N9VztGtvndlGB/k09lgiPFCL4F6Tre3Nn7T
         VuHY3B0NxwmkltV4HJk0+AYeK3gqKE7DKL3iySj+c69G/nSvrqUVKIyM7XuwN7iqCs2x
         rIwgMxPnFM9CDB8njWqlYUlFQcktKlI18fDQaU64pJ5hqq9YP5GVmyoTLTEYHjDRRSW1
         5QWdEVUwdotOzY4bIrNZQa3NkCvWlqH+uZdoDLhv7Rg418eQYhaf/o3TUySoq6+dAXgj
         Jc/wdNfHwoSYe8zhNcG7bwescQm9nq9/9P+WbUwJyOks/976Tx3VKgqkT01uktTHiFue
         ZZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736879829; x=1737484629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6OVTpN6QQOyROrjZO4elCp5JsY1caRN4LlWeoNZSoA=;
        b=R+eyK/ytQReZQIu34WXaic8lGi2dMcZEtVwieLYLYbMROa2/uzJCZPD19M7/qxpFI4
         OEbW494RbRlJa4f6IL0059FgPF4eb3okbQwiECrPTbmL/rVsfvbkOOBclgMggeFI97zz
         InHk6SQsmSbmiMhBo580dSJtaZyg6lsCe33NjtH23TVOMSxJJwQ9OH50T5QtEmoOSbRX
         FE8QuUZG+7xT0E7KC7YLomDhmUCMJjFAH/pgjSa9LUGA9unz0g9HTKwSThSIIkklwt6D
         e2xe3CSBmioQXF6A5MvbTQd9BFiAQnLcvd44+v8h/yASKayR2H3ps+Ivo0IYfbwrlu09
         UgEg==
X-Forwarded-Encrypted: i=1; AJvYcCVX+ZSNoH5xuhzLbpyfv0VCQHFqjy+M+mXUTxxWyc3tlxI2jCC8uC+q+lwXaFkUiYcQ6UvnltvJo8h8lC8eRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkpZ7ii9a8W3/afEuggXygpKjdcKg6fdXMwXiuQxoM7k0XO5/5
	MsDi+SaoB5djM8062C/YxNMbSC7jHJFiLRJZ/+GOD9sTadGkouej7C4oGMqt/MDDmr0wtPgZa2d
	CN2tCC12VX8PetO8KxcuJGvOkjUewptIuusf2
X-Gm-Gg: ASbGncs9efVv0QQ644x1x2Tb9SFRNxbmwIO8mcjSUV1JW+Z+68vyNIc1gtttXDbitOx
	FaVLs/64CUr7+22g7DI0p542U/pQOPzFyEBwWNhU=
X-Google-Smtp-Source: AGHT+IE6bEnCQp9VixIuc7QGr52oZkYgPy0kU531XI5G4wc4kJmMuNyY8u9dtMl1ADrB/M25xABeahc6Zird7x4fV+s=
X-Received: by 2002:a05:600c:3149:b0:434:f297:8e78 with SMTP id
 5b1f17b1804b1-436e267fbe1mr245486835e9.7.1736879829386; Tue, 14 Jan 2025
 10:37:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com> <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
In-Reply-To: <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 14 Jan 2025 19:36:57 +0100
X-Gm-Features: AbW1kvY6MF2Grzp3Z5g2Yz_zY6lduCkynMPhjKoPbLkBPxt1DEf3sPWwRWhDTNA
Message-ID: <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: add support for request_irq()
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 7:35=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Hi Alice,
>
> > On 13 Jan 2025, at 11:42, Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > On Thu, Oct 24, 2024 at 4:20=E2=80=AFPM Daniel Almeida
> > <daniel.almeida@collabora.com> wrote:
> >>
> >> +impl<T: Handler> Registration<T> {
> >> +    /// Registers the IRQ handler with the system for the given IRQ n=
umber. The
> >> +    /// handler must be able to be called as soon as this function re=
turns.
> >> +    pub fn register(
> >> +        irq: u32,
> >> +        flags: Flags,
> >> +        name: &'static CStr,
> >> +        handler: T,
> >> +    ) -> impl PinInit<Self, Error> {
> >> +        try_pin_init!(Self {
> >> +            irq,
> >> +            handler: Opaque::new(handler)
> >> +        })
> >> +        .pin_chain(move |slot| {
> >> +            // SAFETY:
> >> +            // - `handler` points to a valid function defined below.
> >> +            // - only valid flags can be constructed using the `flags=
` module.
> >> +            // - `devname` is a nul-terminated string with a 'static =
lifetime.
> >> +            // - `ptr` is a cookie used to identify the handler. The =
same cookie is
> >> +            // passed back when the system calls the handler.
> >> +            to_result(unsafe {
> >> +                bindings::request_irq(
> >> +                    irq,
> >> +                    Some(handle_irq_callback::<T>),
> >> +                    flags.0,
> >> +                    name.as_char_ptr(),
> >> +                    &*slot as *const _ as *mut core::ffi::c_void,
> >> +                )
> >> +            })?;
> >> +
> >> +            Ok(())
> >> +        })
> >
> > I think this does not run the destructor of `handler` when
> > `request_irq` returns an error.
> >
> > Alice
>
> How? T is passed by value, so if request_irq() fails and thus Registratio=
n::register() returns Err,
> I assume T is dropped.
>
> Or is the pin_init! stuff somehow special here?

It's not the pin_init! stuff, but the Opaque stuff. If it fails, then
it runs the destructor of Opaque<T>, which does *not* run the
destructor of T.

Alice
