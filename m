Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0EE22330F
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877629; cv=none; b=PK1rjiMTAbjpMvf50Deo12NRd3Bh1d7+q/t+yUmBmDtKwUSyHWSBLLlR+2SYZHpnf8Vyq46O5uG8eWJmKOCYvP8Ff5rBKVfYaa6lXVbTZb7K4usENO0vtlChzVjygCxG42ppdghNqmWi3Y5U5ErlCxnnKGndLsa9ilfVIIC6IqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877629; c=relaxed/simple;
	bh=WERr9EKdB/JGirUr4yPU2J/Uq52HDFruhNS7aUegMWw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ueqo4QQFT67Q3SkqSnm3dQpvQIyMn8jUz+z/SNIF8EsPuSbRMlUuPTR0Jpso+kljyRVaBZCY5JW46+9C4H6RzJbqRbWs1fAHI34wGj99JPOaP1Yo51Egv3SUtR19KLyYjKweEIGLFnJpk57VK6SHICHDhE0RDlW5EpOo8o4hCbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kchbawlh; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kchbawlh"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4eb9c80deso2021014f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 08:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748877625; x=1749482425; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wwOOjU9bxV9afMpPNL3ZIxVj60P8MeXECBBvUe0JcnY=;
        b=KchbawlhR8aduU40pRma6N4U4vIUhQCvFh2dM7AGmommxsTRLRbTDqEMlQJG1AuphY
         DwU34e6HAY3S35zlKsiyi2CQSUR8Mj+XRuuv7Y88f9o2l3lsLZeY+wEnQEirrJohVIrl
         UhHzVo6X+XHoMFHWAid3XgCtIu5iU0lynjl1B33J+ZbJnkhl5bht1jNQoif4I4cou5+i
         4zGtuPN1ra04Mt9l40NbWU1Jm801IrN0gDOR8HTKGrPkxd/0I9v0ckeXnbPWRyPbJL0L
         Cam/p5xb1dDzVF2GwfIsnntu4cZ50XvAXmVpAGvKzc2VsInzlRXpjUIRk+Nym2b3gHpL
         6Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877625; x=1749482425;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wwOOjU9bxV9afMpPNL3ZIxVj60P8MeXECBBvUe0JcnY=;
        b=cPwfN8a1ZI8cJlCXzA9vaaQhf/Rhchy0gcVcz6dZCRh4oJ/n5k/OyxYw7HcLU3tsEp
         Kgraepf6RzLqSPxLlCceBhOwfWdV8fTwlA2Vi3VBI9G+FglI9gZQrYXeWn6w2+JG3mbD
         JM1ppKtaBNdJU94tSk4Oxs6xpWsc+BLZfu7JvXCfV8GLX7Pb2KxR6g8doTcASGklrhcJ
         lcKqWa1/CHDXy/cZmCOjkAJ0DE/37wL5KwgnbMvaa8QdLQSO1LuGy7sGXzQQk6zCthw2
         OsaY2ozbnhzZjwCvUAHfrCGoq5ndGpmwwbXF8mQpo5T6ip42LVlmGoNCJOr/kO43CbmX
         GX/g==
X-Forwarded-Encrypted: i=1; AJvYcCVvUkaYlx3Qqec6hbg7D0Y2Axh/yLKnOWLd7Aw8IxDjcc9iS1YiC/U0vw4jc8swIIPO+oIJT71gWXtoIc7+Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2QytqI5tZ2P/2Fx37Tvph4INxC1eBFF3lptzj2sa72RO2ubkj
	MQaGa8A0qtFOgbdB16Zqg9MKgHx67GgtzIjkhZtHVH4e/BtxJ66gc5jUHHVRhODhZyduXAhgIqH
	sdo9wYo92Wth4cPk6Lg==
X-Google-Smtp-Source: AGHT+IF2Kk5s+bXFpT8E7HTF/mo6nfd1bu+MuIIru8He3ZGnDlq4QribwXsdu74sbJZgsRlHBa6HfH+6k6d5ME8=
X-Received: from wmbfs9.prod.google.com ([2002:a05:600c:3f89:b0:451:dead:79c4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2407:b0:3a4:f024:6717 with SMTP id ffacd0b85a97d-3a4f89e169cmr11091589f8f.53.1748877625564;
 Mon, 02 Jun 2025 08:20:25 -0700 (PDT)
Date: Mon, 2 Jun 2025 15:20:23 +0000
In-Reply-To: <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-1-d6fcc2591a88@collabora.com> <D9W5IX9Z7QMU.3DL48O2KYTN1Z@kernel.org>
Message-ID: <aD3BN7-MAyYq2NAX@google.com>
Subject: Re: [PATCH v3 1/2] rust: irq: add support for request_irq()
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 14, 2025 at 10:04:43PM +0200, Benno Lossin wrote:
> On Wed May 14, 2025 at 9:20 PM CEST, Daniel Almeida wrote:
> > +                )
> > +            });
> > +
> > +            if res.is_err() {
> > +                // SAFETY: We are returning an error, so we can destroy the slot.
> > +                unsafe { core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
> > +            }
> > +
> > +            res
> > +        };
> > +
> > +        // SAFETY:
> > +        // - if this returns Ok, then every field of `slot` is fully
> > +        // initialized.
> > +        // - if this returns an error, then the slot does not need to remain
> > +        // valid.
> > +        unsafe { pin_init_from_closure(closure) }
> 
> Please don't use `pin_init_from_closure`, instead do this:
> 
>     pin_init!(Self {
>         irq,
>         handler,
>         _pin: PhantomPinned
>     })
>     .pin_chain(|this| {
>         // SAFETY: TODO: correct FFI safety requirements
>         to_result(unsafe {
>             bindings::request_irq(...)
>         })
>     })
> 
> The `pin_chain` function is exactly for this use-case, doing some
> operation that might fail after initializing & it will drop the value
> when the closure fails.

No, that doesn't work. Using pin_chain will call free_irq if the call to
request_irq fails, which is incorrect.

Alice
