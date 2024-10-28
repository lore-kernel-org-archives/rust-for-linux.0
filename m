Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0B31DE4F6
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 15:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730129392; cv=none; b=KyqHV/B8+aIu31OiFYtuQDB5vZtxkHLlbo5aZN5BR8mJgRphP+5KQoteqj7x8WQC3D5/mql6gDzZTZtSXjCEeugP3bKwbyAxidsefHQJ3EsIurXMQG0707k4kZxUHeMXuF6Yy9XZUhQkJa6cNPF/w1lKhp+ArljDq7/SW8FkDA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730129392; c=relaxed/simple;
	bh=AAzETCzm3PUNUothvEzvyRscZ+S2yMTWy3ZHS7T6Z4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=if4vp16tybWfkkC0XrocPkkpBe7YYd26k/+wzZqlqBhBXg+3IuG4DZa4gNfoyuFTuSiys2QL51UggeFIBrWAFPKTmPth9vM2zlvro3mvHxnUF5bYdX9LU3MyrbbwyDHWI1ri6lITo0QBEJDFfoeC/fT4fi7x/fLp8BH6YjOTMv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ujW+G9TZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ujW+G9TZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso46200165e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 08:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730129388; x=1730734188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3FAgKWaXDYSeOE3sz6lYi88L4aRpYRsQzJF96vEboY=;
        b=ujW+G9TZdFf+gpmuC77V/iJf1Qojm+UKAM9fl/TJ6NqU9/WSPvw/52UoVa972H3jb0
         M43iNuOrgx0IzM3+T1F15jGtaZixPLAuZY1ltlR2udEQDAG0EQO6VdXYtCezAu+RmlMx
         xPSEfBnQqrmW0vXTVoxx3uDz61Z9B6GJ/M7PB/ncB5fiUVjWpAMIfG8vIs9iW9yrcuaO
         b7IA+RX3MwlYMOudQ2XhJ+7SJQNMP+jfSMNGCDrBmaSHVqYBKEvpn++N0FfCzmBUu+hx
         GwUmuQfHvcJVwbn6Vgx94/hh8lw3N+8D7oPoJUaF7UNA9vyInkh/86ohClx2FSMFY7cE
         KnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730129388; x=1730734188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3FAgKWaXDYSeOE3sz6lYi88L4aRpYRsQzJF96vEboY=;
        b=XSzGrQNeT+xQncfGq0P4WzcHjMRJdpm19wyzk1UmS3WGe7g/09y/AUBEhp1Xe6fhDI
         PeqFDEFTNhcylBS1roeJa9Di9EigHw/GuFGmAnDhqFQgSx21a7iJf4nBbB4lBbbQtwTA
         7xir6Wy7a3x56crQv/GXbiQ8V2X4rZS+a1AXAwBYqY0u/LqZuRXTWTSf6PFIvlmUWsFu
         fnIQwGhuphojYryNw5O7Q6h2AiDaQ4GppTUBg5ipBC/eXlCHIeQvPFFb/cQjqs0iqi2Q
         VsFE0Pb3qWpWKsbm1oN7FL03Oo6z1t6VpWoWdOWlkK6G4Eh8V4kDJWD3M3L9Ax9GB3sW
         aTNw==
X-Forwarded-Encrypted: i=1; AJvYcCUiGMFOWkFOBbfnCvOy3PKZqsqf0VqCvmLPspNVNRlry9Fe/BrAimFEz4ELIZZ7DiLX0i2ZUKz/AcDBJUVuJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY2fOQdLfC40g20+bQ/eid8FxpvQfV9DO2OiG4lXrr7PcpvT66
	JeQc/6whpkaDbIH9X3eZdaYVbzqrl8XZRYtwhhG6917Ox2990nIINFZWYP1l2trTZOZaN4IYPmU
	k2XAgkyW7u5CoSfv5mPUqGP321vewNKLgg+uf
X-Google-Smtp-Source: AGHT+IHawBDIgilbZPsUe/TSlQw0DqkHLPio+71RhsjpUAuIluzp6NO/FWJ7APyR+ockCRbn1Xrrhd602oyEi9t6HwM=
X-Received: by 2002:a05:600c:3c8c:b0:431:4fa0:2e0b with SMTP id
 5b1f17b1804b1-4319ad146b1mr68407845e9.28.1730129387966; Mon, 28 Oct 2024
 08:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
In-Reply-To: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 28 Oct 2024 16:29:36 +0100
Message-ID: <CAH5fLgjRJtdpcOZySpRN-keLSMJjJdfXZGOhy_cEbiM3uNU7Tw@mail.gmail.com>
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

On Thu, Oct 24, 2024 at 4:20=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Both regular and threaded versions are supported.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

I left some comments below:

> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..4b5c5b80c3f43d482132423c2=
c52cfa5696b7661
> --- /dev/null
> +++ b/rust/kernel/irq/request.rs
> @@ -0,0 +1,450 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright 2019 Collabora ltd.

should this be 2024?

> +/// The value that can be returned from an IrqHandler;
> +pub enum IrqReturn {
> +    /// The interrupt was not from this device or was not handled.
> +    None =3D bindings::irqreturn_IRQ_NONE as _,
> +
> +    /// The interrupt was handled by this device.
> +    Handled =3D bindings::irqreturn_IRQ_HANDLED as _,
> +}
> +
> +/// Callbacks for an IRQ handler.
> +pub trait Handler: Sync {
> +    /// The actual handler function. As usual, sleeps are not allowed in=
 IRQ
> +    /// context.
> +    fn handle_irq(&self) -> IrqReturn;
> +}
> +
> +/// A registration of an IRQ handler for a given IRQ line.
> +///
> +/// # Invariants
> +///
> +/// * We own an irq handler using `&self` as its private data.

The invariants section is usually last.

> +/// # Examples
> +///
> +/// The following is an example of using `Registration`:
> +///
> +/// ```
> +/// use kernel::prelude::*;
> +/// use kernel::irq;
> +/// use kernel::irq::Registration;
> +/// use kernel::sync::Arc;
> +/// use kernel::sync::lock::SpinLock;
> +///
> +/// // Declare a struct that will be passed in when the interrupt fires.=
 The u32
> +/// // merely serves as an example of some internal data.
> +/// struct Data(u32);
> +///
> +/// // [`handle_irq`] returns &self. This example illustrates interior
> +/// // mutability can be used when share the data between process contex=
t and IRQ
> +/// // context.
> +/// //
> +/// // Ideally, this example would be using a version of SpinLock that i=
s aware
> +/// // of `spin_lock_irqsave` and `spin_lock_irqrestore`, but that is no=
t yet
> +/// // implemented.
> +///
> +/// type Handler =3D SpinLock<Data>;

I doubt this will compile outside of the kernel crate. It fails the
orphan rule because your driver neither owns the SpinLock type or the
Handler trait. You should move `SpinLock` inside `Data` instead.

> +/// impl kernel::irq::Handler for Handler {
> +///     // This is executing in IRQ context in some CPU. Other CPUs can =
still
> +///     // try to access to data.
> +///     fn handle_irq(&self) -> irq::IrqReturn {
> +///         // We now have exclusive access to the data by locking the S=
pinLock.
> +///         let mut handler =3D self.lock();
> +///         handler.0 +=3D 1;
> +///
> +///         IrqReturn::Handled
> +///     }
> +/// }
> +///
> +/// // This is running in process context.
> +/// fn register_irq(irq: u32, handler: Handler) -> Result<irq::Registrat=
ion<Handler>> {

Please try compiling the example. The return type should be
Result<Arc<irq::Registration<Handler>>>.

> +///     let registration =3D Registration::register(irq, irq::flags::SHA=
RED, "my-device", handler)?;
> +///
> +///     // You can have as many references to the registration as you wa=
nt, so
> +///     // multiple parts of the driver can access it.
> +///     let registration =3D Arc::pin_init(registration)?;
> +///
> +///     // The handler may be called immediately after the function abov=
e
> +///     // returns, possibly in a different CPU.
> +///
> +///     // The data can be accessed from the process context too.
> +///     registration.handler().lock().0 =3D 42;
> +///
> +///     Ok(registration)
> +/// }
> +///
> +/// # Ok::<(), Error>(())
> +///```
> +#[pin_data(PinnedDrop)]
> +pub struct Registration<T: Handler> {
> +    irq: u32,
> +    #[pin]
> +    handler: Opaque<T>,
> +}
> +
> +impl<T: Handler> Registration<T> {
> +    /// Registers the IRQ handler with the system for the given IRQ numb=
er. The
> +    /// handler must be able to be called as soon as this function retur=
ns.
> +    pub fn register(
> +        irq: u32,
> +        flags: Flags,
> +        name: &'static CStr,

Does the name need to be 'static?

> +        handler: T,
> +    ) -> impl PinInit<Self, Error> {
> +        try_pin_init!(Self {
> +            irq,
> +            handler: Opaque::new(handler)
> +        })
> +        .pin_chain(move |slot| {
> +            // SAFETY:
> +            // - `handler` points to a valid function defined below.
> +            // - only valid flags can be constructed using the `flags` m=
odule.
> +            // - `devname` is a nul-terminated string with a 'static lif=
etime.
> +            // - `ptr` is a cookie used to identify the handler. The sam=
e cookie is
> +            // passed back when the system calls the handler.
> +            to_result(unsafe {
> +                bindings::request_irq(
> +                    irq,
> +                    Some(handle_irq_callback::<T>),
> +                    flags.0,
> +                    name.as_char_ptr(),
> +                    &*slot as *const _ as *mut core::ffi::c_void,

Can simplify to `slot as *mut c_void` or `slot.cast()`.

> +                )
> +            })?;
> +
> +            Ok(())
> +        })
> +    }
> +
> +    /// Returns a reference to the handler that was registered with the =
system.
> +    pub fn handler(&self) -> &T {
> +        // SAFETY: `handler` is initialized in `register`.
> +        unsafe { &*self.handler.get() }

This relies on T being Sync as it could also get accessed by the irq
handler in parallel. You probably want the SAFETY comment to mention
that.

> +    }
> +}
> +
> +#[pinned_drop]
> +impl<T: Handler> PinnedDrop for Registration<T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY:
> +        // - `self.irq` is the same as the one passed to `reques_irq`.
> +        // -  `&self` was passed to `request_irq` as the cookie. It is
> +        // guaranteed to be unique by the type system, since each call t=
o
> +        // `register` will return a different instance of `Registration`=
.
> +        //
> +        // Notice that this will block until all handlers finish executi=
ng, so,
> +        // at no point will &self be invalid while the handler is runnin=
g.
> +        unsafe { bindings::free_irq(self.irq, &*self as *const _ as *mut=
 core::ffi::c_void) };

I can't tell if this creates a pointer to the Registration or a
pointer to a pointer to the Registration. Please spell out the type:
```
&*self as *const Self as *mut core::ffi::c_void
```

> +    }
> +}
> +
> +/// The value that can be returned from `ThreadedHandler::handle_irq`.
> +pub enum ThreadedIrqReturn {
> +    /// The interrupt was not from this device or was not handled.
> +    None =3D bindings::irqreturn_IRQ_NONE as _,
> +
> +    /// The interrupt was handled by this device.
> +    Handled =3D bindings::irqreturn_IRQ_HANDLED as _,
> +
> +    /// The handler wants the handler thread to wake up.
> +    WakeThread =3D bindings::irqreturn_IRQ_WAKE_THREAD as _,
> +}
> +
> +/// The value that can be returned from `ThreadedFnHandler::thread_fn`.
> +pub enum ThreadedFnReturn {
> +    /// The thread function did not make any progress.
> +    None =3D bindings::irqreturn_IRQ_NONE as _,
> +
> +    /// The thread function ran successfully.
> +    Handled =3D bindings::irqreturn_IRQ_HANDLED as _,
> +}

This is the same as IrqReturn?

> +/// Callbacks for a threaded IRQ handler.
> +pub trait ThreadedHandler: Sync {
> +    /// The actual handler function. As usual, sleeps are not allowed in=
 IRQ
> +    /// context.
> +    fn handle_irq(&self) -> ThreadedIrqReturn;
> +
> +    /// The threaded handler function. This function is called from the =
irq
> +    /// handler thread, which is automatically created by the system.
> +    fn thread_fn(&self) -> ThreadedFnReturn;
> +}

Most of my comments above also reply to ThreadedHandler.

Alice
