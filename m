Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E0523FC55
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223534; cv=none; b=q6P7C8WutAFwNpr6HJ1aSQzxBveOR8s42BnHr13M+I1sDg8V+5dCXFFJcFpJFAX0/Dp5XYiIK4ZaYQkfn9wezpZV8BQJF7CGm0ZwBy+8RGGGT93JQsAF5MGwACzhrM/NGaKwjo3KEgidknqT+AsG4Gdp0aIUw6d0LN8pWrA8Xqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223534; c=relaxed/simple;
	bh=YSnrE2Mf4NXuMV4nwjpl5ipWPI5O+hoQ3wDnyAzryLM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u0nqbQdnNotn/cjjidkjINCD08HaE3v6oOVfFC1Pa2CXKUDxGCoXPjNgLU8d8CeVXIIEF/Ik/JZJC7txcPChYmi4XcDCp5yATPc7kWwYH7Q6oQNbxTvft50i2K5n5Fipvidc9p71HUh+aGKHHevKJLLtOHK/0bJnHAuQKVzeyQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3SAfpPDm; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3SAfpPDm"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3978ef9a284so1068602f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 07:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742223530; x=1742828330; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0W54RDOvcdnQzS3X6oJkrsyeDCVHCelcC6YCVp/JKWY=;
        b=3SAfpPDmbm5V5eth1asmy7QRHMJgo22GeGYztFQ32ltGZvjWj8ogmSN3cEksrsi1n4
         Rgd/AWDMLP/9jtpfErz18zvCAEd/Xqrs4KtelRUJ6QJHsWiqWAC+acvtXpljdkQS9izL
         dH5OvIj7oHqFcqMeZ79gy8n2ZcCd6YbYLki6aK6W/y9oX6XMHyXOcop1srbVXEmyjs7s
         NpDi99k5iEwIrZXs2wqP9ENqMInbWonPDgpA5PrGmEoT6VXLKLky3YUaeIBtAPQ8iJrI
         ZFAZluQEtereUynfZF9UsRFKRQ6COrXs1DcVAuoqfthtTDX37rO421kbUgA+2c4wiagH
         iXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742223530; x=1742828330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0W54RDOvcdnQzS3X6oJkrsyeDCVHCelcC6YCVp/JKWY=;
        b=Y9tyrs1Fy+vU9obdvECyIFTvFm0+6QKas7PWqQ052qS9qLwanRvmcqvS+lwHHDpjOt
         A90CyTpaXJCHauqlA4o56HokE9OmLhESpeoSNt8pmXBKb6ZEbJN+1MZaJDAnBiMQbpis
         h/4ka+dzUyYccQHQphJP/QC5znCKbhHkyFUOH2v7D4vLL9ymBHvyJVCehO6B7S7WO+ZC
         7hUj7c4BdZmUCaz7kpEY42Y6ZciFH/63zOnwU4ey69RHzCVKE1lJjQCwgUqPSNzWCW+F
         VyeQ3BtuSmutizc/BoqaSOxfMiyJmSmUAT34gum1ol6rYxFlImhe7nHgewIi5AViKXeS
         I3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXCqA4hVlLV8jdxtABduX9mip/2Z1GpUSsvTLlXC0BIRotzPn6RDUjSFM0qxHXkFY5g+4bDKrCKS2FR+UQMYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIl+LGGknUMJZ4PlBlKrifgVL66EJK/FYs5lfA6Tquz1emgkdn
	ZsGYg45dHallAlxjcoKEiibh8x7FtMNH7nuumP8Pas/9UH7JyGMJFpGZXKxfQ/cMXUkvcl2Se8P
	YtkhWSV8C+YDbFA==
X-Google-Smtp-Source: AGHT+IGkKMstp6hUyo1fMGHnVlJ1yuahl6v9vWiGcfuGBZHhBDPMgMpxi1MLnx5580hjiU4Paz3WFdV5VN6fJOw=
X-Received: from wmgg15.prod.google.com ([2002:a05:600d:f:b0:43d:1db0:6628])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:402a:b0:390:f2f1:2a21 with SMTP id ffacd0b85a97d-3971f9e4985mr14314647f8f.37.1742223530580;
 Mon, 17 Mar 2025 07:58:50 -0700 (PDT)
Date: Mon, 17 Mar 2025 14:58:48 +0000
In-Reply-To: <87cyewhpxj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <u-vC1KbeOK3Fd2PClzinb8LmqS_dntOW-pOSmZIFWotCZeTOg30xR_GYUc4oReAKZeuuu7ZaXWzfeTkpGMlr0A==@protonmail.internalid>
 <20250122163932.46697-1-daniel.almeida@collabora.com> <87cyewhpxj.fsf@kernel.org>
Message-ID: <Z9g4qDd7qp2t_e9u@google.com>
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 04, 2025 at 02:43:20PM +0100, Andreas Hindborg wrote:
> "Daniel Almeida" <daniel.almeida@collabora.com> writes:
> > +    /// handler after suspending interrupts. For system wakeup devices users
> > +    /// need to implement wakeup detection in their interrupt handlers.
> > +    pub const COND_SUSPEND: Flags = Flags(bindings::IRQF_COND_SUSPEND as _);
> > +
> > +    /// Don't enable IRQ or NMI automatically when users request it. Users will
> > +    /// enable it explicitly by `enable_irq` or `enable_nmi` later.
> > +    pub const NO_AUTOEN: Flags = Flags(bindings::IRQF_NO_AUTOEN as _);
> > +
> > +    /// Exclude from runnaway detection for IPI and similar handlers, depends on
> > +    /// `PERCPU`.
> > +    pub const NO_DEBUG: Flags = Flags(bindings::IRQF_NO_DEBUG as _);
> > +}
> > +
> > +/// The value that can be returned from an IrqHandler or a ThreadedIrqHandler.
> > +pub enum IrqReturn {
> 
> I learned recently that if you choose the right representation here, you
> don't need to cast here and when you call `Handler::handle_irq`. I think
> `#[repr(u32)]` is the one to use here.

I wonder if we can get it to use the repr of the same size as
irqreturn_t?

> > +    /// The interrupt was not from this device or was not handled.
> > +    None = bindings::irqreturn_IRQ_NONE as _,
> > +
> > +    /// The interrupt was handled by this device.
> > +    Handled = bindings::irqreturn_IRQ_HANDLED as _,
> > +}
> > +
> > +/// Callbacks for an IRQ handler.
> > +pub trait Handler: Sync {
> > +    /// The actual handler function. As usual, sleeps are not allowed in IRQ
> > +    /// context.
> > +    fn handle_irq(&self) -> IrqReturn;
> > +}
> 
> What is the reason for moving away from the following:
> 
> 
>     pub trait Handler {
>         /// The context data associated with and made available to the handler.
>         type Data: ForeignOwnable;
> 
>         /// Called from interrupt context when the irq happens.
>         fn handle_irq(data: <Self::Data as ForeignOwnable>::Borrowed<'_>) -> Return;
>     }
> 
> 
> I think we will run into problems if we want to pass `Arc<Foo>` as the
> handler. I don't think we can `impl Handler for Arc<Foo>` in a driver
> crate, since both `Handler` and `Arc` are defined in external crates

My understanding is that since the data is not stored behind a
private_data void pointer, we don't need ForeignOwnable. I think we
should avoid using ForeignOwnable when it's not necessary.

We can support the Arc / Box case by adding

impl<T: ?Sized + Handler> Handler for Arc<T> {
    fn handle_irq(&self) -> IrqReturn {
        T::handle_irq(self)
    }
}

This way, the user implements it for their struct and then it works with
Arc<MyStruct> too.

This kind of blanket impl for Arc/Box is very common in userspace Rust
too. For example, the Tokio traits AsyncRead/AsyncWrite have blanket
impls for Box.

> > +#[pin_data(PinnedDrop)]
> > +pub struct ThreadedRegistration<T: ThreadedHandler> {
> > +    irq: u32,
> > +    #[pin]
> > +    handler: T,
> > +    #[pin]
> > +    /// Pinned because we need address stability so that we can pass a pointer
> > +    /// to the callback.
> > +    _pin: PhantomPinned,
> > +}
> 
> As others have mentioned, I wonder if we can avoid the code duplication
> that makes up most of the rest of this patch.

I'm worried that getting rid of duplication makes the code too complex
in this case. I could be wrong, but it seems difficult to deduplicate in
a simple way.

Alice
