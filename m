Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAF627F017
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 11:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757505150; cv=none; b=rf+T9viPU3Qrt2NUIlSQeJx6EZ0Y0q+MN8OsWGS4EgFlgEcZj7U2XZ3fY708829LXYRnFHuzbdq54e8DHeE0ftBHga9ruTXeA1fkjhQg+0+RMwDDMGFnNattboGGUp8h0jPaq6ATBBZkeULe82sfvtSEUYGcR2lG0LPA5EjafWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757505150; c=relaxed/simple;
	bh=e4bdA9laZbM3EfcZ0X9/imMIUb2Gb39r21T9GFYy+58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZExV/KO1q6GJXtVBRkPrf105SJ17Px9wIXZx65iyRdVu5a7VERN2yGp1TXTjA7WaQEAb6eGn9UaL6tCj0sTo2Nf+zY1vA4i7Mf7FzRNJMlfduNUSCkyyqs0RJ7SAaAyhO/y0Z4hEw1aScawngL2o0FJFbJtIsDzHNSzcPgrExLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CeDAY/M6; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CeDAY/M6"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3e3aafe06a7so3345453f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757505147; x=1758109947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U46X76YKHn1BRClXohd2pCqWqgDo3sVqrrD/BOqtq6c=;
        b=CeDAY/M6L9S82earBtraBVwXVIsIAoqdZV6FeAewZAILRKNLIJmeMdxqH3nVMsSQVr
         FmIA+FIA6ktCxrRbptJhEKLgMV+gTxnL5DKC1rWcuskHbEciiVw93XmZSgxtdemTR4/o
         JGuyAi7MNbosp0bCUJ1vEhTWUrtSWKMzW9GAOGiPTTTrzlB2cAmo11+49QEk/HtWT4WS
         oMBrR5PkouMQOnUSSnMP+M8wW0shwU2UZBJXPOo4+7GPSusdOzQpw8bM/ZPqv6O+cFA3
         OxNMU6vXp+aZ2GaU+baAwTaUTBJ9VEdS6xuKuPhF5h1y3J8n1jWzWcVZVMgUGM+hfavy
         tgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757505147; x=1758109947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U46X76YKHn1BRClXohd2pCqWqgDo3sVqrrD/BOqtq6c=;
        b=RPUGd8cbQZ53WGFvtUooVnJnE0+6iSNlom/g8DE5R7IMRSkWMbeNxzXrE2YBrcuqG5
         gZ085H2h3vfOsa88F3Zz0fEWUdThjcBZ6NtEN83grbRxNDcGei1jDXSkRTm6svpMQcO+
         gJja4C8p376aM8ehLDR6a+IKtsKuLjKwjwdzUg+6l7DyCUJDFFiXS/E9rDHOVf71UdS2
         TWBPryvjJSf7xITOZkna6lH4xfsY1mTwyjtF3aGGcX33AL7WjMNvp7OFuUDzjmAjVzPJ
         voRmAdoKKp8ibLzXf+/6QlB2UPJjPXcu6v6/t8rHD6wyDPw4360/MRX9KkD62HP+4uu4
         gqDw==
X-Forwarded-Encrypted: i=1; AJvYcCW55xt/PDrzKJ6dmX5DSkwr+Gyt+U0/pxwXyZZFRI2803JSjatRuYEtr5tlP+VHRyAQb5WJcR83lMzUBMSBLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWdb6p9epdPKBuI6p6U5yMJCrCGpFzBmlhjKrs6zz+h6CW1JAd
	YmunJvUXagVwfz1BnYQ0/nnbhUiWmD1PTutewk9hPgwA3qWktz2LWJKthi3Xz+/+SDOVH5ynrkF
	BiachCIF6jEGHURVg+RLJyoaVsl/hsezMPgWdmxk1
X-Gm-Gg: ASbGnctFXB4/XkI2hJc4CRgoX2sbQcoPryorSNiXngAVaCT8kA7jyIniPpWg9vmr9PW
	Hnbjj1S5/IYV+/C7aVI+znOifeVhy79BJ8qJPd+XwNJDUTw/alZ0IgTz5EwZ0CSTZ/7jc2rNMyu
	P9G3tlmzq+8I876AmjARl4bDC5TbjuguMp4g5FG39GO0/tngk09euiInqizempBttdTcb3VCvze
	OPI/gk3TN9zFa80byZo6FSXlIFcnwXPxxeEpCN9Rc2vareXBK5K37G5OQ==
X-Google-Smtp-Source: AGHT+IErhntOQVzgPns8ISGDADdpAB61F5bnMVwtgDnrhzYG8zp4IeEhc7oW9TpLnTCtbJ5aJuLv6ZOvVJkT4RdrFy8=
X-Received: by 2002:a05:6000:25c2:b0:3df:33e9:14cc with SMTP id
 ffacd0b85a97d-3e6442da8d5mr13285933f8f.54.1757505146808; Wed, 10 Sep 2025
 04:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250910100755.2361281-1-lossin@kernel.org> <aMFQL-Hq1KvBG5lh@google.com>
 <DCP1Y8N4SRRF.25V7F6PV5ODCQ@kernel.org> <CAH5fLgg+-oz_cP9=ke+ukp9qYZAsD=hKqvvGfkJWRcCKdrTQ-g@mail.gmail.com>
 <DCP2STI9M1XX.3RHBQDPQOC3JO@kernel.org>
In-Reply-To: <DCP2STI9M1XX.3RHBQDPQOC3JO@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 10 Sep 2025 13:52:14 +0200
X-Gm-Features: AS18NWC693vUyJRrFe_67v99ngDuGtmgBjD0KGQIP9wthtOlQgbODTCOn6ws5us
Message-ID: <CAH5fLgjS+T1acN9jsEv85bhhXwevSA2trqu-9aFFsKpH82b8iA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: pin-init: add `#[bind]` attribute to access
 previously initialized fields
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Fiona Behrens <me@kloenk.dev>, 
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 1:15=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed Sep 10, 2025 at 12:40 PM CEST, Alice Ryhl wrote:
> > On Wed, Sep 10, 2025 at 12:36=E2=80=AFPM Benno Lossin <lossin@kernel.or=
g> wrote:
> >>
> >> On Wed Sep 10, 2025 at 12:17 PM CEST, Alice Ryhl wrote:
> >> > On Wed, Sep 10, 2025 at 12:07:53PM +0200, Benno Lossin wrote:
> >> >> Assigning a field a value in an initializer macro can be marked wit=
h the
> >> >> `#[bind]` attribute. Doing so creates a `let` binding with the same
> >> >> name. This `let` binding has the type `Pin<&mut T>` if the field is
> >> >> structurally pinned or `&mut T` otherwise (where `T` is the type of=
 the
> >> >> field).
> >> >>
> >> >> Signed-off-by: Benno Lossin <lossin@kernel.org>
> >> >
> >> > Is there a reason we can't apply this to all fields and avoid the
> >> > attribute?
> >>
> >> Adding the attribute was due to Boqun's concern on v1 [1]. I think it
> >> might be surprising too, but I'm also happy with no attribute.
> >>
> >> [1]: https://lore.kernel.org/all/aLshd0_C-1rh3FAg@tardis-2.local
> >
> > IMO the ideal is if it works without an attribute. Perhaps trying that
> > in the kernel is a reasonable experiment to find out whether that's
> > reasonable to do for the general language feature?
> >
> >> > Do we have a place that might be able to use this?
> >>
> >> I didn't find one, but Danilo plans to base some changes on top this
> >> cycle that need this.
>
> We can use it in devres right away:
>
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index d04e3fcebafb..97c616a1733d 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -137,10 +137,11 @@ pub fn new<'a, E>(
>      {
>          let callback =3D Self::devres_callback;
>
> -        try_pin_init!(&this in Self {
> +        try_pin_init!(Self {
>              dev: dev.into(),
>              callback,
>              // INVARIANT: `inner` is properly initialized.
> +            #[bind]
>              inner <- Opaque::pin_init(try_pin_init!(Inner {
>                      devm <- Completion::new(),
>                      revoke <- Completion::new(),
> @@ -150,8 +151,7 @@ pub fn new<'a, E>(
>              //
>              // [1] https://github.com/Rust-for-Linux/pin-init/pull/69
>              _add_action: {
> -                // SAFETY: `this` is a valid pointer to uninitialized me=
mory.
> -                let inner =3D unsafe { &raw mut (*this.as_ptr()).inner }=
;
> +                let inner =3D core::ptr::from_ref(inner.into_ref().get_r=
ef());

Overall looks good. Looks like you want Opaque::get here rather than
the cast cast cast operation.

>                  // SAFETY:
>                  // - `dev.as_raw()` is a pointer to a valid bound device=
.
> @@ -160,7 +160,7 @@ pub fn new<'a, E>(
>                  //    properly initialized, because we require `dev` (i.=
e. the *bound* device) to
>                  //    live at least as long as the returned `impl PinIni=
t<Self, Error>`.
>                  to_result(unsafe {
> -                    bindings::devm_add_action(dev.as_raw(), Some(callbac=
k), inner.cast())
> +                    bindings::devm_add_action(dev.as_raw(), Some(callbac=
k), inner.cast_mut().cast())
>                  }).inspect_err(|_| {
>                      let inner =3D Opaque::cast_into(inner);
>
>
> Together with the initializer code blocks this becomes quite nice. :)
>
> > Danilo, what plans do you have?
>
> Besides that, the plan is [1].
>
> [1] https://lore.kernel.org/all/DCL32RUQ6Z56.1ERY7JBK6O1J6@kernel.org/

Looks nice :)

Alice
