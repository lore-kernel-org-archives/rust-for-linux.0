Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25102135A63
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 10:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737973666; cv=none; b=urOAmGow6Y+Jm4vPcqumloTvlXibf9vwzSLBd2fmqUP7VbuqmaEn3wbhWs0OKDIoM8fWm6Qb+mJgS1nVkaz6KidLtwl0wXgNNBITXghdGW1kFD6lH86k5i74RUqvNM1ZQcvHF7sZ/UEmNexIjdygX54g96CJrnt5YShIucjRbtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737973666; c=relaxed/simple;
	bh=9WltOooB3gfkVdTh/qp/u8NhNtSbit7HnPPedS2uleU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FG2vogXJsbEigYuDucWVe2pvJYfviTz7v5LU5pEfOMVmwdtnUzGkE8pJRJk2DidglmQGU6BNlrPt7AA8YqLvuYjcDlhAKNWyF1qbzZyY5TCaYxPCJ6PX+e5o9MvGd/XqS0fIEt7dN1ddU57gCiRVVlH9Kte7rjamExFuCsjWw5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R7/GAxh8; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R7/GAxh8"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso32938405e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 02:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737973662; x=1738578462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=px3SDk5Kazn8dfkM4KysIW4j1nWIOv8Fz86w4h9auTU=;
        b=R7/GAxh832RxbxYWp6jtC1HgJHvGiDCgAucn8BMtLPfaBW4VhaQos8+AItTg+Y8R9F
         xJdbxW2hJV79O1UCdqzDbinJd5VtWxKtLQSVbNHYnJytih8XcSljfCGz9Xv/CD0CxkFY
         9eFlIZquXQ4XNYZVlG5y+OEBeXvAhJ9HanMCVXKvmSqeGjAoD3US1v/aVa5S+VkmBRUi
         lLMzSQSNx/p6RUylP65HmcjBN9lg+DtQaJZw1MpgDS0yo9Z7HjXd7IQPGIwp4GYfeVKR
         n6Syptnr0EThgVBM1vcgHbE6m3hUX/fTveCIcetVbICDQc1sKp5QwiDbVtLr7vSyjHuV
         pS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737973662; x=1738578462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=px3SDk5Kazn8dfkM4KysIW4j1nWIOv8Fz86w4h9auTU=;
        b=fStBpjo3d5wqtEgiRiptb2OLRctMibqokxaVE2Ajyf59RsrrMoosal0MjbC5mDPlC6
         WiuPAY1EbqTBRlpMWa+H+mu8jxYAx85ntChJA+K6Gv5R30vLlpQeKD0PUdYJEQVXdCwC
         QkiSYmTwffIyMHE3N9j80p70BOVm7TaUHuFL71xXgENHQNy4EJyhgjzefXejIhQxoBoc
         3DcREWrOspdSraFjBtOSjTRds7IDRrmsPSHickH5C0UccIJRXQpUbr5kfiBnNeA40wpn
         K3ryNn7iyc2ZbYZxkM8HbQ2FDS5cYEt/H+BdjaUx1a2cbleGr2A6oamd3V2dCt9Deoyb
         2mFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGGibu6vzJALbIs2wjmFUViWtw0KgpawGx5/8Q3pH8zjRKN30f4f+dVr4QDKp4/Ok8WXS2TS7sE4OcgOKTWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIfXVMjzN7eoOCdyQmSh2d4o93VVPbhLwGgJWkzqZUiR296Api
	10Q+PWNzYQlpJka8JWJObk1Y7uM+59SnKJspUZkzo++za4ZPIgQOgANZn0s0IFDD6ptQJOrcu2e
	szXRebtGc9na9ReLprELYtRB8VSorSgkuKIPY
X-Gm-Gg: ASbGnctcQrBR7qa+gmkAQWX5ST71RJrbxVM7Qp7Ye8r2XcC7bbGhEtjhpTCJQpI6kyr
	bvDW8opfJfBD0obbleAHdiWfX9gQHGIEI1iiVys9SXpY3cra8DIxBUh6xMzLiFyWAiuW/F4Vp9N
	Oc83bEVFlS9CGhJcd+
X-Google-Smtp-Source: AGHT+IEwAfZsNOZp5NBzYXqmXKMwWWnv7DCAhKee+0PZAgAEEqJEbxakyMC1Sv84tJnNSiGODZWRXyuei0+ro8TJoA4=
X-Received: by 2002:a5d:6483:0:b0:38a:6183:77b9 with SMTP id
 ffacd0b85a97d-38c22267cbamr18453197f8f.6.1737973662340; Mon, 27 Jan 2025
 02:27:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com> <8953765e-d978-4a91-bc81-9ab154ac2255@gmail.com>
In-Reply-To: <8953765e-d978-4a91-bc81-9ab154ac2255@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jan 2025 11:27:30 +0100
X-Gm-Features: AWEUYZm1YxmUrQSIDHRooum1YYq_7rOOdNC56wLOCw8Tl_2aOHhFGExy-XaVdY8
Message-ID: <CAH5fLgi-CJCveLmc6hFdAYOhpRULovDh_Cix4FyV=kBeg9oiFA@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to MiscDeviceRegistration
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 12:26=E2=80=AFAM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> On 19.01.25 11:11 PM, Christian Schrefl wrote:
> > When using the Rust miscdevice bindings, you generally embed the
> > MiscDeviceRegistration within another struct:
> >
> > struct MyDriverData {
> >     data: SomeOtherData,
> >     misc: MiscDeviceRegistration<MyMiscFile>
> > }
> >
> > <snip>
> >
> >  impl<T: MiscDevice> MiscDeviceRegistration<T> {
> >      /// Register a misc device.
> > -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Err=
or> {
> > +    pub fn register(
> > +        opts: MiscDeviceOptions,
> > +        data: impl PinInit<T::RegistrationData, Error>,
> > +    ) -> impl PinInit<Self, Error> {
> >          try_pin_init!(Self {
> >              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::m=
iscdevice| {
> >                  // SAFETY: The initializer can write to the provided `=
slot`.
> > @@ -79,6 +85,7 @@ pub fn register(opts: MiscDeviceOptions) -> impl PinI=
nit<Self, Error> {
> >                  // misc device.
> >                  to_result(unsafe { bindings::misc_register(slot) })
> >              }),
> > +            data <- Aliased::try_pin_init(data),
> >              _t: PhantomData,
> >          })
>
> After some thought I think `register` needs to be something like:
>
> pub fn register(
>     opts: MiscDeviceOptions,
>     data: impl PinInit<T::RegistrationData, Error>,
> ) -> impl PinInit<Self, Error> {
>     try_pin_init!(Self {
>         inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevi=
ce| {
>             // SAFETY: The initializer can write to the provided `slot`.
>             unsafe { slot.write(opts.into_raw::<T>()) };
>             Ok::<(), Error>(())
>         }),
>         data <- UnsafePinned::try_pin_init(data),
>         _t: PhantomData,
>     })
>     .pin_chain(|slot| {
>         // SAFETY: We just wrote the misc device options to the slot. The=
 miscdevice will
>         // get unregistered before `slot` is deallocated because the memo=
ry is pinned and
>         // the destructor of this type deallocates the memory.
>         // `data` is Initialized before `misc_register` so no race with `=
fops->open()`
>         // is possible.
>         // INVARIANT: If this returns `Ok(())`, then the `slot` will cont=
ain a registered
>         // misc device.
>         to_result(unsafe { bindings::misc_register(slot.as_raw()) }).map_=
err(|err| {
>             // Drop the Data in case misc_register fails.
>             // SAFETY:
>             // - We just initialized `data`.
>             // - We are about to return `Err(err)`, so it is valid for us=
 to drop `data`.
>             unsafe {
>                 ptr::drop_in_place(slot.data.get());
>             }
>             err
>         })
>     })
> }
>
> to make sure that `misc_register` is called after data is initialized and=
 to that
> `data` will be dropped correctly in case `misc_register` fails.
>
> But I'm not very familiar with `(try_)pin_init!` so this might be unneces=
sary?

Using pin_chain is definitely incorrect because it will run the
destructor of MiscDeviceRegistration if the misc_register call fails,
but calling misc_deregister is incorrect in that case.

You should be able to just move the `data <-
UnsafePinned::try_pin_init(data)` line to the top so that the field is
initialized first.

Alice
