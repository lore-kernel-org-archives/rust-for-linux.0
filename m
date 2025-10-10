Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E711C2848AC
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Oct 2025 11:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760096494; cv=none; b=cO8FKB8RaSYTskGzmQ3GzwBXSpO9oOHqITcAQUAAhD/8QeDgh9LhtpPmKJqqjGPDeqQiyfTJka71zZhJ94xajjHCqMC5iVSAVqh+LuAxljfPUFmoY8PQjNLW5SQGRgXjOH+B1VtXssGOlkG7W10Un+4dSlEds8q5QvsZfcvktTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760096494; c=relaxed/simple;
	bh=tkTiJxl8UaIbZrZ5Iepj0nO+SegQeIHdV23Q7udL7N4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z8zQgI9ie0qR9KTw5bQojwWftrltIZuCe6vYpw1mLoZOwH8Rm4i1ddXKmnyW2wLtsblY3iKiTdYNBCW93tpMKfxXi5jRAvILsyOekWlv+leof76XAd+si1umPgSCwThQ8PpQKo9w2q3mLdAkcPnNF8jWQDo6jPw6atWrJsF8ouE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rGikc5D8; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rGikc5D8"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e2d845ebeso11398915e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Oct 2025 04:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760096490; x=1760701290; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sP1h7PdQ3Yf2Ey8PajK3BooFysbtdE3P3YzTihFpbEs=;
        b=rGikc5D8PvagHb1ouCLTYxB4MT2aFUJAbupk3y9xPxbgsZ13XjaiSkJTenEzflWWDs
         nPMImH8020/xg9npDzx5TSEJyS5PuTvmOpH6i72tl89XVU8BpzclJ1FyUcV99+OYsjjI
         478KRY/sdawONQbYjaZWSZkFbbW+ni3dlw2oGHJj/+WMENIxhbDsIaqVomE9zCz9u5iI
         HebcHkLTkdONlZtKvYi+SfDqVgd3GRT5Uj0MYjj57RYV2arnTwSa5/Zv65gsG8dXZwpw
         Q8Q1Xj29fM3+X8ZHB+IZP2vjmir9uxXGj4mOds/m5fSc57I+CMo/goTTnIOEQjERHTHn
         pF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760096490; x=1760701290;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sP1h7PdQ3Yf2Ey8PajK3BooFysbtdE3P3YzTihFpbEs=;
        b=wBrBZ+OWg7lAmc1VJExUvoSHpNDy0KseBM8f6vI3IMusvcfAHfpGznOLnwFGyaPkkY
         pgPEuMmdSDPX7egv3sMacsQKVrODCLhMGZHU+18kPLRNF4Q78QLdT2tl/bIys4218eyn
         19q5WxK5Z197jnGUcwuWRrwmyuNtk83dwK13EUxQaGqImRd+9wWnyX3AVqvRp6FIelRg
         EBy35Bil3NNo6ujOmzMIAysTyaNAmJFMxUHPBMlDSJkkVzczuYGJSvgQ2gjTGhpRUrz4
         wy1bGbdWe1Og0n/IVdT6hMd4QLWR1lxfJCBfAEs7Ft8oR0FoLjSdogYsUqYSj7vm1Em8
         Ntwg==
X-Forwarded-Encrypted: i=1; AJvYcCWofCRXZr/KVp93cAU2q1mVstZ6IasIQsvvRXLCM9TEBwFuNGHbIHIJ5haab5p8rG+FG1cwvsYgyPQwNdJsIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6o+XcCUjuw2x1mVjs7V5WmaeaHCsl6cmbrwGJ4Tg3X4iRlFri
	pi3Q4TTK91f9ei4sPs8e52nmjy+tV1bVJvlrpYv4YF6Njeq3k05l1EIGubby/vpveyY5w39HGID
	F62X1lt24rAsbACgNTg==
X-Google-Smtp-Source: AGHT+IH3iJKq/ZtJ/E8VBomZJGoJfltkSLDyqS69fUM9FlpvzWFrevx3ZuXdfXPbtVyCDBNDeQ3SHEuV9o3AiXY=
X-Received: from wmv6.prod.google.com ([2002:a05:600c:26c6:b0:46e:15a3:1c9b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1d1a:b0:46e:4a78:dea9 with SMTP id 5b1f17b1804b1-46fa9af17d4mr78562825e9.17.1760096490360;
 Fri, 10 Oct 2025 04:41:30 -0700 (PDT)
Date: Fri, 10 Oct 2025 11:41:29 +0000
In-Reply-To: <20251009181203.248471-3-markus.probst@posteo.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251009181203.248471-1-markus.probst@posteo.de> <20251009181203.248471-3-markus.probst@posteo.de>
Message-ID: <aOjw6QtVArJ807MX@google.com>
Subject: Re: [PATCH v2 2/2] rust: leds: add basic led classdev abstractions
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

On Thu, Oct 09, 2025 at 06:12:34PM +0000, Markus Probst wrote:
> Implement the core abstractions needed for led class devices, including:
> 
> * `led::Handler` - the trait for handling leds, including
>   `brightness_set`
> 
> * `led::InitData` - data set for the led class device
> 
> * `led::Device` - a safe wrapper around `led_classdev`
> 
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

> +/// The led class device representation.
> +///
> +/// This structure represents the Rust abstraction for a C `struct led_classdev`.
> +#[pin_data(PinnedDrop)]
> +pub struct Device {
> +    handler: KBox<dyn HandlerImpl>,
> +    #[pin]
> +    classdev: Opaque<bindings::led_classdev>,
> +}

Is it not possible to use Device<T> with a `handler: T` field here? That
avoids the box. I don't think other abstractions have needed that. If
it's needed, then why is LED special?

> +/// The led handler trait.
> +///
> +/// # Examples
> +///
> +///```
> +/// # use kernel::{c_str, led, alloc::KBox, error::{Result, code::ENOSYS}};
> +/// # use core::pin::Pin;
> +///
> +/// struct MyHandler;
> +///
> +///
> +/// impl led::Handler for MyHandler {
> +///     const BLOCKING = false;
> +///     const MAX_BRIGHTNESS = 255;
> +///
> +///     fn brightness_set(&self, _brightness: u32) -> Result<()> {
> +///         // Set the brightness for the led here
> +///         Ok(())
> +///     }
> +/// }
> +///
> +/// fn register_my_led() -> Result<Pin<KBox<led::Device>>> {
> +///     let handler = MyHandler;
> +///     KBox::pin_init(led::Device::new(
> +///         None,
> +///         None,
> +///         led::InitData::new()
> +///             .default_label(c_str!("my_led")),
> +///         handler,
> +///     ))
> +/// }
> +///```
> +/// Led drivers must implement this trait in order to register and handle a [`Device`].
> +pub trait Handler {
> +    /// If set true, [`Handler::brightness_set`] and [`Handler::blink_set`] must not sleep
> +    /// and perform the operation immediately.
> +    const BLOCKING: bool;
> +    /// Set this to true, if [`Handler::blink_set`] is implemented.
> +    const BLINK: bool = false;

We have a macro called #[vtable] that automatically generates this kind
of constant for you. Please use it.

> +impl Device {
> +    /// Registers a new led classdev.
> +    ///
> +    /// The [`Device`] will be unregistered and drop.
> +    pub fn new<'a, T: Handler + 'static>(
> +        parent: Option<&'a device::Device>,
> +        init_data: InitData<'a>,
> +        handler: T,
> +    ) -> impl PinInit<Self, Error> + use<'a, T> {
> +        try_pin_init!(Self {
> +            handler <- {
> +                let handler: KBox<dyn HandlerImpl> = KBox::<T>::new(handler, GFP_KERNEL)?;
> +                Ok::<_, Error>(handler)
> +            },
> +            classdev <- Opaque::try_ffi_init(|ptr: *mut bindings::led_classdev| {
> +                // SAFETY: `try_ffi_init` guarantees that `ptr` is valid for write.
> +                unsafe { ptr.write(bindings::led_classdev {
> +                    max_brightness: T::MAX_BRIGHTNESS,
> +                    brightness_set: T::BLOCKING.then_some(
> +                        brightness_set as unsafe extern "C" fn(*mut bindings::led_classdev, u32)
> +                    ),
> +                    brightness_set_blocking: (!T::BLOCKING).then_some(
> +                        brightness_set_blocking
> +                            as unsafe extern "C" fn(*mut bindings::led_classdev,u32) -> i32
> +                    ),
> +                    blink_set: T::BLINK.then_some(
> +                        blink_set
> +                            as unsafe extern "C" fn(*mut bindings::led_classdev, *mut usize,
> +                                                    *mut usize) -> i32

I think you can just do `blink_set as _`.

> +                    ),
> +                    .. bindings::led_classdev::default()
> +                }) };
> +
> +                let mut init_data = bindings::led_init_data {
> +                    fwnode: init_data.fwnode.map_or(core::ptr::null_mut(), FwNode::as_raw),
> +                    default_label: init_data.default_label
> +                                            .map_or(core::ptr::null(), CStr::as_char_ptr),
> +                    devicename: init_data.devicename.map_or(core::ptr::null(), CStr::as_char_ptr),
> +                    devname_mandatory: init_data.devname_mandatory,
> +                };
> +
> +                let parent = parent
> +                    .map_or(core::ptr::null_mut(), device::Device::as_raw);
> +
> +                // SAFETY:
> +                // - `parent` is guaranteed to be a pointer to a valid `device`
> +                //    or a null pointer.
> +                // - `ptr` is guaranteed to be a pointer to an initialized `led_classdev`.
> +                to_result(unsafe {
> +                    bindings::led_classdev_register_ext(parent, ptr, &mut init_data)

So it's ok that `init_data` is valid for the duration of this call and
no longer? It doesn't stash a pointer to it anywhere?

> +extern "C" fn brightness_set(led_cdev: *mut bindings::led_classdev, brightness: u32) {
> +    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev` stored inside a `Device`.
> +    let classdev = unsafe {
> +        &*container_of!(
> +            led_cdev.cast::<Opaque<bindings::led_classdev>>(),

Please use Opaque::cast_from instead.

> +    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev` stored inside a `Device`.
> +    let classdev = unsafe {
> +        &*container_of!(
> +            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
> +            Device,
> +            classdev
> +        )
> +    };

Instead of repeating this logic many times, I suggest a Device::from_raw
method.

> +extern "C" fn blink_set(
> +    led_cdev: *mut bindings::led_classdev,
> +    delay_on: *mut usize,
> +    delay_off: *mut usize,
> +) -> i32 {
> +    // SAFETY: `led_cdev` is a valid pointer to a `led_classdev` stored inside a `Device`.
> +    let classdev = unsafe {
> +        &*container_of!(
> +            led_cdev.cast::<Opaque<bindings::led_classdev>>(),
> +            Device,
> +            classdev
> +        )
> +    };
> +    from_result(|| {
> +        classdev.handler.blink_set(
> +            // SAFETY: `delay_on` is guaranteed to be a valid pointer to usize
> +            unsafe { &mut *delay_on },
> +            // SAFETY: `delay_on` is guaranteed to be a valid pointer to usize
> +            unsafe { &mut *delay_off },

To create a mutable reference, this safety comment should argue why it
is the case that nobody will access these fields for the duration of
`blink_set`. (For example, from another thread?)

Alice
