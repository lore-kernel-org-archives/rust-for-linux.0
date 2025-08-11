Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4809243968
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922366; cv=none; b=K3hwInL4oB2Vul2OG5kLE4I4Dhkdn2E5Bs4v89gO0HCSXB8NRjLqZlZz1TQKBiGtx34oFQtiuI3A7LkuL4/5yio5xRHu4Utot1E9Ln2TGyFmPM6Do8TzxxCVbRQ0RWmlaSilFEAN/LXUlTGCL6/JqGUjZPhhhTEVduUFqLbZXKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922366; c=relaxed/simple;
	bh=FsHTQHcPfc/xyafo/jiO+MOWQJe03c1YlWGp/uZWzpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hrD/DGw+olknJxPX5Nc7ed07FO5AeAgYemJxZJpY+mCGnH3sYVKs6LEYFoWcBDFegADB2ZM7EFxciXC3BsgreBVzwfg41QpvSK7zeK9R2TFEALhmNGhbH7T7o1c4mdsGG3rJFrSMhGFFyxjr+IpEYWJNPWp0A2ll+f8FXHlkmJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gChytDSA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gChytDSA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45994a72356so35133775e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 07:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754922363; x=1755527163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvVQHPNPuBLFONIAghpsGXDOeOU7ltwpMqBFv5I9o+o=;
        b=gChytDSAEZYej+PNHWZMrEikTki/JuyUx2zcO4McXZe2oJSVbFBgFUMHmXui1yD4uK
         ON4fTEI7gArOQSoTIH5asQZB21+uA3Iep6mdBDOm657lL4nDdZXeOY38gDmwRslmXity
         pynkhvWukL0sJcvx1OpqzldeC14DlMAXyAQe34uEywKJLkqDCTOwT01v7IQ59835wFwn
         lOeG3PcIswsETwwaC+cLtIhUJveaBl8EpIZNf+AT8zyKwVa5vTu0mDSSe7tumeRrDUOh
         PnmOc2jwqNyXfRy3mNW5szeAKlmk7RtN88R2BlhxyOxS87yP/+oN12DDwzCkiVRiwBIl
         /U7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754922363; x=1755527163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvVQHPNPuBLFONIAghpsGXDOeOU7ltwpMqBFv5I9o+o=;
        b=BirYFJklMo/79CzgEeCmqUXEqsydppiYgFNwsr710Kew9oYxdqi8Rze9HXELWzWQZS
         aerCc54LlQd0Yr9CFYo1Q8wol3FRdQyawiNwxrAkOrBFkY+6Otw2e51rGYkIihE8QZxj
         2kXUnV9w2BU1/mMMyRCA/pML0973vB+5QFvQ4H3us4MDMGdDGXXe+KXBq3s16i4N0grx
         OZccxBeF7iPeU/fb0WRUC4y4pe2xZSEKPcf3GakgzmpkxXHTtR27keP6sh3fyFOQBv5k
         YADgnXyWys8Fh00d31QAdNPmyplKozPfOzh+K31Yx8fRZjDMaum/3v7zYQEwmJ4OePpw
         G7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeU5+BCe0NnbLrOYUoN8GcsDG+IN6FaY5u2LjUS1LLg1ccQHO0einb7hnlQYmlsn4FlORplsOTTtfaeAqoOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTLgZA8dGZukEoi4dfukiZPSuDPNtejCwt2q6OeiL9py7/Zvvy
	hGGvgYpPT2xytaFB0mGH6REgCDMEU0WgYA40AdEic5vcB0ZSRLFEHSN+N2N/Y7qTtV50/yBIRfX
	mFrZIrJRvsiXyHALpuau7Yi5lTCGFedU3E26aVfUI
X-Gm-Gg: ASbGncs+8EVdiWLtyOfe+6zK0R9z4MSpI5t1a8ZDOBfqy0WvivwQwulqN4WWYd4g2UV
	kxeLJM6b2H09x1hFX1lZQqglxcLH+K6Q9ht/Lp57o3EIKGMF5XfqiwUZeQYrVXGxdmhrhXxMpSF
	Oc5X6rf0P+HlEU5/ke6YuRNP8cCTKvnjlLxi+Ou24H4kHC3YCwR8ZJJqYi7tc+I7mNzXgQVL1Hk
	NqV9bef
X-Google-Smtp-Source: AGHT+IGCyDu4/ktjPNgn4Et50OquWgMjoD+wDy1tJFPjPT6pavqtrM7rffgXK3ocUP9k+uvfJdqmzFX00GkaLz4o37A=
X-Received: by 2002:a05:600c:3504:b0:459:dfa8:b85e with SMTP id
 5b1f17b1804b1-45a1080a071mr781745e9.0.1754922362597; Mon, 11 Aug 2025
 07:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250811-irq-bound-device-v2-1-d73ebb4a50a2@google.com>
 <aJn2ogBSmedhpuCa@Mac.home> <CAH5fLghitfmSOByu4ZRmhwdsOadzJOLei_qrAjNM+V15spq44w@mail.gmail.com>
 <aJn9M3WPcI_ZGems@Mac.home>
In-Reply-To: <aJn9M3WPcI_ZGems@Mac.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Aug 2025 16:25:50 +0200
X-Gm-Features: Ac12FXwAdHcuhl4tSFWfQ1pDPx3Xe03sJ8_chcrIyexcIFZdekPm1szgSPr_PGY
Message-ID: <CAH5fLgg+1FtiHkXOzKLHFP-gRrq1Dq8yUO4RmyE7tM4aSDYioA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: irq: add &Device<Bound> argument to irq callbacks
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C2=B4nski?= <kwilczynski@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Dirk Behme <dirk.behme@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 4:24=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Mon, Aug 11, 2025 at 04:05:31PM +0200, Alice Ryhl wrote:
> > On Mon, Aug 11, 2025 at 3:56=E2=80=AFPM Boqun Feng <boqun.feng@gmail.co=
m> wrote:
> > >
> > > On Mon, Aug 11, 2025 at 12:33:51PM +0000, Alice Ryhl wrote:
> > > [...]
> > > > @@ -207,8 +207,8 @@ pub fn new<'a>(
> > > >              inner <- Devres::new(
> > > >                  request.dev,
> > > >                  try_pin_init!(RegistrationInner {
> > > > -                    // SAFETY: `this` is a valid pointer to the `R=
egistration` instance
> > > > -                    cookie: unsafe { &raw mut (*this.as_ptr()).han=
dler }.cast(),
> > > > +                    // INVARIANT: `this` is a valid pointer to the=
 `Registration` instance
> > > > +                    cookie: this.as_ptr().cast::<c_void>(),
> > >
> > > At this moment the `Regstration` is not fully initialized...
> > >
> > > >                      irq: {
> > > >                          // SAFETY:
> > > >                          // - The callbacks are valid for use with =
request_irq.
> > > > @@ -221,7 +221,7 @@ pub fn new<'a>(
> > > >                                  Some(handle_irq_callback::<T>),
> > > >                                  flags.into_inner(),
> > > >                                  name.as_char_ptr(),
> > > > -                                (&raw mut (*this.as_ptr()).handler=
).cast(),
> > > > +                                this.as_ptr().cast::<c_void>(),
> > > >                              )
> > >
> > > ... and interrupt can happen right after request_irq() ...
> > >
> > > >                          })?;
> > > >                          request.irq
> > > > @@ -258,9 +258,13 @@ pub fn synchronize(&self, dev: &Device<Bound>)=
 -> Result {
> > > >  ///
> > > >  /// This function should be only used as the callback in `request_=
irq`.
> > > >  unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, pt=
r: *mut c_void) -> c_uint {
> > > > -    // SAFETY: `ptr` is a pointer to T set in `Registration::new`
> > > > -    let handler =3D unsafe { &*(ptr as *const T) };
> > > > -    T::handle(handler) as c_uint
> > > > +    // SAFETY: `ptr` is a pointer to `Registration<T>` set in `Reg=
istration::new`
> > > > +    let registration =3D unsafe { &*(ptr as *const Registration<T>=
) };
> > >
> > > ... hence it's not correct to construct a reference to `Registration`
> > > here, but yes, both `handler` and the `device` part of `inner` has be=
en
> > > properly initialized. So
> > >
> > >         let registration =3D ptr.cast::<Registration<T>>();
> > >
> > >         // SAFETY: The `data` part of `Devres` is `Opaque` and here w=
e
> > >         // only access `.device()`, which has been properly initializ=
ed
> > >         // before `request_irq()`.
> > >         let device =3D unsafe { (*registration).inner.device() };
> > >
> > >         // SAFETY: The irq callback is removed before the device is
> > >         // unbound, so the fact that the irq callback is running impl=
ies
> > >         // that the device has not yet been unbound.
> > >         let device =3D unsafe { device.as_bound() };
> > >
> > >         // SAFETY: `.handler` has been properly initialized before
> > >         // `request_irq()`.
> > >         T::handle(unsafe { &(*registration).handler }, device) as c_u=
int
> > >
> > > Thoughts? Similar for the threaded one.
> >
> > This code is no different. It creates a reference to `inner` before
> > the `irq` field is written. Of course, it's also no different in that
> > since data of a `Devres` is in `Opaque`, this is not actually UB.
> >
>
> Well, I think we need at least mentioning that it's safe because we
> don't access .inner.inner here, but..
>
> > What I can offer you is to use the closure form of pin-init to call
> > request_irq after initialization has fully completed.
> >
>
> .. now you mention this, I think we can just move the `request_irq()`
> to the initializer of `_pin`:
>
> ------>8
> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
> index ae5d967fb9d6..3343964fc1ab 100644
> --- a/rust/kernel/irq/request.rs
> +++ b/rust/kernel/irq/request.rs
> @@ -209,26 +209,26 @@ pub fn new<'a>(
>                  try_pin_init!(RegistrationInner {
>                      // INVARIANT: `this` is a valid pointer to the `Regi=
stration` instance
>                      cookie: this.as_ptr().cast::<c_void>(),
> -                    irq: {
> -                        // SAFETY:
> -                        // - The callbacks are valid for use with reques=
t_irq.
> -                        // - If this succeeds, the slot is guaranteed to=
 be valid until the
> -                        //   destructor of Self runs, which will deregis=
ter the callbacks
> -                        //   before the memory location becomes invalid.
> -                        to_result(unsafe {
> -                            bindings::request_irq(
> -                                request.irq,
> -                                Some(handle_irq_callback::<T>),
> -                                flags.into_inner(),
> -                                name.as_char_ptr(),
> -                                this.as_ptr().cast::<c_void>(),
> -                            )
> -                        })?;
> -                        request.irq
> -                    }
> +                    irq: request.irq
>                  })
>              ),
> -            _pin: PhantomPinned,
> +            _pin: {
> +                // SAFETY:
> +                // - The callbacks are valid for use with request_irq.
> +                // - If this succeeds, the slot is guaranteed to be vali=
d until the
> +                //   destructor of Self runs, which will deregister the =
callbacks
> +                //   before the memory location becomes invalid.
> +                to_result(unsafe {
> +                    bindings::request_irq(
> +                        request.irq,
> +                        Some(handle_irq_callback::<T>),
> +                        flags.into_inner(),
> +                        name.as_char_ptr(),
> +                        this.as_ptr().cast::<c_void>(),
> +                    )
> +                })?;
> +                PhantomPinned
> +            },
>          })
>      }
>
>
> Thoughts?

That calls free_irq if request_irq fails, which is illegal.

Alice
