Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB271487ED;
	Thu, 23 Jan 2025 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737674800; cv=none; b=NDThyhwi93syjpJ5muI/rEKJ1ZqyvUg2i3y7Jndr6mvEgosQLD0fQ2wl9u0AKctSoGlXgrhlKrcPIpykQwt/fmzElrDUKAjkXoyUuEG5B+VEbjhmqAjMxSuBrYHwOj8XXnANA59PvBMaSHa56OP0MlbmcdLXbSq4hbYicSLVkJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737674800; c=relaxed/simple;
	bh=32mYY+Zmc+4FXZuD78GFf4Czn2s3Pmk687A7e2sEDY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cic/CZzZ/qUPmLOOY/A7Pc0EAjsCabQpOt1qXqHEV/ZgHrFTra+bfdCy8Ud2tAG9gyUtBkZV/syHH0iddU3tgr+bQM6dfVRD9JJVgSiN2bb2Mog3dW4h9W8JDMxIWC67OtQYgUpHFMd3MqvjazoA483OlrWcl8F2OkVg/puO91Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQMR+U+O; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQMR+U+O"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a88ba968aso1428674f8f.3;
        Thu, 23 Jan 2025 15:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737674796; x=1738279596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/56UYG2nyubHPh/66TmTbRS0RklJoHdEc0r8WuYEsYE=;
        b=SQMR+U+OCkjPcmCyyBTay9oVZre7eMOpVpVF6n8Qa+nqbyApT+oWbHsd+FlX8WsCz+
         VSekiB5a4DQINVPYDXje9p2kQT+JfYP3xs7J+idnnZDgrNWtY9h0nnZIG7r+aT2sreX/
         5Wya5aQGHfsNtF2NiGdWZEslTuEyc40TeFl+no+V2eWz4R64BGMA0remIp6VEG0eZQgZ
         UlzcNQsloldrcR1Tfv0MaX7Ul75bxQMBvem28Go1sBYK+viL8pORY4M92tzlF4wI9ZFd
         PcN6O8xF32cqNV/Mv0LJ25kj5NtgTAyiHeqi7qiq1dZok9YAUS+6vY2RjZ1Bb9iP8Dij
         9v7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737674796; x=1738279596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/56UYG2nyubHPh/66TmTbRS0RklJoHdEc0r8WuYEsYE=;
        b=Hx+faE4GMnt9gYfn8NrlqOqHfhGyKs/f8ndsbjKwOCJfzCatA3dE19RtgRoGXQmGag
         Wjeiqjoc9tm1WyAVGFe6BOIk7HZJwSZVu2VmfitLmLgd3de/zl0qg1IFsoDyyhS9mJX8
         WHaYB+XDoT+EdkE7zre3b6eyi02wRraKF6IoX89Vr3clGzr0yhOXn9EWID0RNLC6pTLb
         A1ox8YSIQmNCA94VYyY2sAI30EOVDBNPuxyPydBwwwzLg0zZrLBTtH9EJJW8pKwR4RB3
         X4NZgGTBg7o0e/ymtbwVfiAtp4Ocm/pE0POQD69rsrR9lGfgKJpfZuRM9gRbET9gZsbJ
         Ci4g==
X-Forwarded-Encrypted: i=1; AJvYcCXW1mwtFJshWNYHgdf9kmNLooEW5wUc/s+o+DTcOWdxRh6zu4fuwD0lZcY7afH/85wHXw6FTBUd071Mk7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ1ZISXngMrzQZxXnKQWKRGXFnnCa8rSeJskMJJ0T8lZiZrEzP
	akjuLFMouj+0m4aLZsjpdBx1BcbqKNDMEz5prRv7+Ogq79i8XQRJ
X-Gm-Gg: ASbGncti/V29X6a7DOd/4DsvOwvzz6jLXZYNLmBJVXaSmZi+tCz2IROIQ1onRvDQReu
	KaIgWlHFMb+jADau5TPxRjWXD5Z8t0m+Czdw3avxRfxfXauqcS8H2hsXYSPmfUi7qVMHtAUn9Yg
	uaRTyZNGNITALdFlG7j9Tsj23hWZu8EjAcocd1ClPa4DHiDuYJRIfOuRVEIJ36+tmiEe5y5ZjfG
	v/I3j8oYAlu/jiYYgakzC2jVmw/02yfor85SkqT8sk7ZJao55TPeSzlM85Y4CD1eCbPWCj7cv/v
	XrkLHNU2L3bcjdB/Rw==
X-Google-Smtp-Source: AGHT+IErWlVpR2JCo6701QQ7hbNDUKSnhdJYJ1NuvYYgPzQN2Ky2WboFF0L5ioSr2AVpKxO6Iqu8pg==
X-Received: by 2002:a5d:64a3:0:b0:385:f909:eb2c with SMTP id ffacd0b85a97d-38bf57a77a2mr34327573f8f.38.1737674796391;
        Thu, 23 Jan 2025 15:26:36 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d5easm941758f8f.25.2025.01.23.15.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 15:26:36 -0800 (PST)
Message-ID: <8953765e-d978-4a91-bc81-9ab154ac2255@gmail.com>
Date: Fri, 24 Jan 2025 00:26:35 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.01.25 11:11 PM, Christian Schrefl wrote:
> When using the Rust miscdevice bindings, you generally embed the
> MiscDeviceRegistration within another struct:
> 
> struct MyDriverData {
>     data: SomeOtherData,
>     misc: MiscDeviceRegistration<MyMiscFile>
> }
> 
> <snip>
>  
>  impl<T: MiscDevice> MiscDeviceRegistration<T> {
>      /// Register a misc device.
> -    pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
> +    pub fn register(
> +        opts: MiscDeviceOptions,
> +        data: impl PinInit<T::RegistrationData, Error>,
> +    ) -> impl PinInit<Self, Error> {
>          try_pin_init!(Self {
>              inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
>                  // SAFETY: The initializer can write to the provided `slot`.
> @@ -79,6 +85,7 @@ pub fn register(opts: MiscDeviceOptions) -> impl PinInit<Self, Error> {
>                  // misc device.
>                  to_result(unsafe { bindings::misc_register(slot) })
>              }),
> +            data <- Aliased::try_pin_init(data),
>              _t: PhantomData,
>          })

After some thought I think `register` needs to be something like:

pub fn register(
    opts: MiscDeviceOptions,
    data: impl PinInit<T::RegistrationData, Error>,
) -> impl PinInit<Self, Error> {
    try_pin_init!(Self {
        inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
            // SAFETY: The initializer can write to the provided `slot`.
            unsafe { slot.write(opts.into_raw::<T>()) };
            Ok::<(), Error>(())
        }),
        data <- UnsafePinned::try_pin_init(data),
        _t: PhantomData,
    })
    .pin_chain(|slot| {
        // SAFETY: We just wrote the misc device options to the slot. The miscdevice will
        // get unregistered before `slot` is deallocated because the memory is pinned and
        // the destructor of this type deallocates the memory.
        // `data` is Initialized before `misc_register` so no race with `fops->open()`
        // is possible.
        // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
        // misc device.
        to_result(unsafe { bindings::misc_register(slot.as_raw()) }).map_err(|err| {
            // Drop the Data in case misc_register fails.
            // SAFETY:
            // - We just initialized `data`.
            // - We are about to return `Err(err)`, so it is valid for us to drop `data`.
            unsafe {
                ptr::drop_in_place(slot.data.get());
            }
            err
        })
    })
}

to make sure that `misc_register` is called after data is initialized and to that
`data` will be dropped correctly in case `misc_register` fails.

But I'm not very familiar with `(try_)pin_init!` so this might be unnecessary? 

>      }
> @@ -97,10 +104,18 @@ pub fn device(&self) -> &Device {
>          // before the underlying `struct miscdevice` is destroyed.
>          unsafe { Device::as_ref((*self.as_raw()).this_device) }
>      }
> +
> +    /// Access the additional data stored in this registration.
> +    pub fn data(&self) -> &T::RegistrationData {
> +        // SAFETY:
> +        // No mutable reference to the value contained by self.data can ever be created.
> +        // The value contained by self.data is valid for the entire lifetime of self.
> +        unsafe { &*self.data.get() }
> +    }
>  }
>  
>  #[pinned_drop]
> -impl<T> PinnedDrop for MiscDeviceRegistration<T> {
> +impl<T: MiscDevice> PinnedDrop for MiscDeviceRegistration<T> {
>      fn drop(self: Pin<&mut Self>) {
>          // SAFETY: We know that the device is registered by the type invariants.
>          unsafe { bindings::misc_deregister(self.inner.get()) };
> @@ -113,6 +128,11 @@ pub trait MiscDevice: Sized {
>      /// What kind of pointer should `Self` be wrapped in.
>      type Ptr: ForeignOwnable + Send + Sync;
>  
> +    /// The additional data carried by the `MiscDeviceRegistration` for this `MiscDevice`.
> +    /// If no additional data is required than () should be used.
> +    /// This data can be accessed in `open()` using `MiscDeviceRegistration::data()`.
> +    type RegistrationData: Sync;
> +
>      /// Called when the misc device is opened.
>      ///
>      /// The returned pointer will be stored as the private data for the file.
> @@ -218,6 +238,9 @@ impl<T: MiscDevice> VtableHelper<T> {
>      // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
>      // associated `struct miscdevice` before calling into this method. Furthermore, `misc_open()`
>      // ensures that the miscdevice can't be unregistered and freed during this call to `fops_open`.
> +    // Since this the `MiscDeviceRegistration` struct uses `#[repr(C)]` and the miscdevice is the
> +    // first entry it is guaranteed that the address of the miscdevice is the same as the address
> +    // of the entire `MiscDeviceRegistration` struct.
>      let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
>  
>      // SAFETY:
> diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
> index 40ad7266c2252e5c0b4e91e501ef9ada2eda3b16..779fcfd64119bdd5b4f8be740f7e8336c652b4d3 100644
> --- a/samples/rust/rust_misc_device.rs
> +++ b/samples/rust/rust_misc_device.rs
> @@ -136,7 +136,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
>          };
>  
>          try_pin_init!(Self {
> -            _miscdev <- MiscDeviceRegistration::register(options),
> +            _miscdev <- MiscDeviceRegistration::register(options, ()),
>          })
>      }
>  }
> @@ -156,6 +156,8 @@ struct RustMiscDevice {
>  impl MiscDevice for RustMiscDevice {
>      type Ptr = Pin<KBox<Self>>;
>  
> +    type RegistrationData = ();
> +
>      fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Self>>> {
>          let dev = ARef::from(misc.device());
>  
> 

