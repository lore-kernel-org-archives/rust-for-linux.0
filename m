Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC53B661;
	Mon, 20 Jan 2025 00:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737332884; cv=none; b=IKvzfCf8fR9rFboa5YV0AOVmrcxxBDTSayGbOwtv/J7s+XGHxZhJNS0vgYuvWWbKvtsbTl10DjN0ljbpx4um9p0cyVWp0hJ6yID1uV6rGxpGWEBcbVcrfp4VRQXP7Glkru2r+OKvDhhWNoqaMOq6vbM+o1cCrlh+SGQTCzRbnAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737332884; c=relaxed/simple;
	bh=Ed9AhPgocAwEqtM2RR23sOxy/y6OEFRxn2F5v89fIak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ISdhRa8d4aNN51E8QJZRnSigGnY+iC7j0Ded1n9fJ0vBtmkcM583eYrelmlgMugIm0UoQLQ7Ogv6crsa/0R3ohp0zQ9e+5ftwIT8GDPMVwy+lqnkBWZ3iq8MHYbYnmnzAX7BzMyOj6s6ZzTXYhfbS3giArO/O+gW4p5lyos7OiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDACd4qF; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDACd4qF"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so6339875a12.3;
        Sun, 19 Jan 2025 16:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737332880; x=1737937680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePiVRnRYvYBO2Xxylj5VOaByguzn7M3+9j+YQS/W8qY=;
        b=VDACd4qFBIWgp1QXzLXvbZzsKc63tb+YIK+XbA9AH5tuqgnbhe46zXbf+Eu31uPU1W
         7s+Ak0jUJWe5OtPSBpdm1cWM7LckWf01F8hGHxjudGyb8eNlHvHaryuM0jPwCkCT/caF
         siepeduGqq4BktjilNqvIzXx2dKEf5k73NYRZssT1/AEsTGV9R5GvPLUfCX2/6RYJrBf
         xaKGnx9DS1heFRrmVja/Dd1UF9IodgmVk7WNozNhfGykqgG8FB+E4dTao0n8mLwrQzRS
         Cz0V9ZdME8hZ+Kx2bcDujIhBfeC0m2dzLHLH9IlAM9fHzLruEVkKRMOtUeyq69b3MLrI
         ZZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737332880; x=1737937680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePiVRnRYvYBO2Xxylj5VOaByguzn7M3+9j+YQS/W8qY=;
        b=lmoDhhWrYhyGRyMIiZwM+wV2PKqtu++yPwtwRrH7uNWisKBT0l0D87JHzS0M8klqB8
         la3yb50kYSholaSxw3qwW1PIPApYtJfFeGS5nZXKEkzgJgCbZr6YDBE4SUVYvGuqBnx7
         JWbr4POkrPZbUa8WhGdEKvg6mur3XLC59FJ/MmqD31VmD/GreScFtH6Fic+VsjfgwHEK
         3hCEPJzdrZjICUA9QkSVF+1X+F0Z8blZSPqhbmyW6EsmJlQkLREbLnYViMhfvFGD3FBc
         AgAj3oq3gwoen3bs80yHMVOIqWvYz5S1n4YKTRN5Zbm7tU3LNXkEk8sW+I/tG6jzrYXW
         xx1A==
X-Forwarded-Encrypted: i=1; AJvYcCWX+zq4dqyD5YE27Rsmedz7GIsTdjRU63JZ5K3nGFvo1tcMhKuvDxMb5iFlRI3EIyh+wirrmkPMeLJQ0BU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK6SluBVrQuCa2oEfuWPmMuuSuevCC2l+fHtfa0zLDvnWLpzoR
	RQwnqb2o3mx3YL08XUKzZ16c1c5BhMgr9glz+HfXZKlmIyekvj5x
X-Gm-Gg: ASbGncvJ6Y3HFtV8wQnV0c0iwy2nXQ0jf1kY2KVkI54ATyKxj9fes3deYZSUGnPvUTo
	L2TxXheb+O+6yV2FU/RTJdJDF+4G6zjQWdZJbOOu5mPHYaFnWqd1YH7GSIjiD9CMmyhG475Gz0o
	Tj1rFqnopEZrSSZ9uD6Tc1Ahtk4rYKK9qQhKUW/Eumhd4UB48DLZgosud6BS8+roeBuCXi+omIh
	WkRyiC5/8IXOrLRTpUO/+gQ1302XDU6J493uafEu7W2no+AN+XOV/4i7/bOvT9OFuCgmbxGF3Ef
	N9g6GLc=
X-Google-Smtp-Source: AGHT+IE/H1mc3pstYvu+uqglLoV5waQXNk+5ldobBACMDgC6xG2QKFjNjgDQB9mh32mseEyH3O9Bdw==
X-Received: by 2002:a05:6402:50d4:b0:5d0:cfad:f71 with SMTP id 4fb4d7f45d1cf-5db7db2bea3mr26144347a12.32.1737332880277;
        Sun, 19 Jan 2025 16:28:00 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73eb5b9bsm4882053a12.55.2025.01.19.16.27.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 16:28:00 -0800 (PST)
Message-ID: <ef3b773f-f797-46be-b6f0-eba2e0e34005@gmail.com>
Date: Mon, 20 Jan 2025 01:27:58 +0100
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
Content-Language: en-US
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
> In the `fops->open` callback of the miscdevice, you are given a
> reference to the registration, which allows you to access its fields.
> For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
> accessor to pull out miscdevice::this_device") you can access the
> internal `struct device`. However, there is still no way to access the
> `data` field in the above example, because you only have a reference to
> the registration.
> 
> Using container_of is also not possible to do safely. For example, if
> the destructor of `MyDriverData` runs, then the destructor of `data`
> would run before the miscdevice is deregistered, so using container_of
> to access `data` from `fops->open` could result in a UAF. A similar
> problem can happen on initialization if `misc` is not the last field to
> be initialized.
> 
> To provide a safe way to access user-defined data stored next to the
> `struct miscdevice`, make `MiscDeviceRegistration` into a container that
> can store a user-provided piece of data. This way, `fops->open` can
> access that data via the registration, since the data is stored inside
> the registration.
> 
> The container enforces that the additional user data is initialized
> before the miscdevice is registered, and that the miscdevice is
> deregistered before the user data is destroyed. This ensures that access
> to the userdata is safe.
> 
> For the same reasons as in commit 88441d5c6d17 ("rust: miscdevice:
> access the `struct miscdevice` from fops->open()"), you cannot access
> the user data in any other fops callback than open. This is because a
> miscdevice can be deregistered while there are still open files.
> 
> A situation where this user data might be required is when a platform
> driver acquires a resource in `probe` and wants to use this resource in
> the `fops` implementation of a `MiscDevice`.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> ---
>  rust/kernel/miscdevice.rs        | 37 ++++++++++++++++++++++++++++++-------
>  samples/rust/rust_misc_device.rs |  4 +++-
>  2 files changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index dfb363630c70b7187cae91f692d38bcf42d56a0a..3a756de27644e8a14e5bbd6b8abd9604e05faed4 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -16,7 +16,7 @@
>      prelude::*,
>      seq_file::SeqFile,
>      str::CStr,
> -    types::{ForeignOwnable, Opaque},
> +    types::{Aliased, ForeignOwnable, Opaque},
>  };
>  use core::{
>      ffi::{c_int, c_long, c_uint, c_ulong},
> @@ -49,24 +49,30 @@ pub const fn into_raw<T: MiscDevice>(self) -> bindings::miscdevice {
>  /// # Invariants
>  ///
>  /// `inner` is a registered misc device.
> -#[repr(transparent)]
> +#[repr(C)]
>  #[pin_data(PinnedDrop)]
> -pub struct MiscDeviceRegistration<T> {
> +pub struct MiscDeviceRegistration<T: MiscDevice> {
>      #[pin]
>      inner: Opaque<bindings::miscdevice>,
> +    #[pin]
> +    data: Aliased<T::RegistrationData>,
>      _t: PhantomData<T>,
>  }
>  
>  // SAFETY: It is allowed to call `misc_deregister` on a different thread from where you called
>  // `misc_register`.
> -unsafe impl<T> Send for MiscDeviceRegistration<T> {}
> +unsafe impl<T: MiscDevice<RegistrationData: Send>> Send for MiscDeviceRegistration<T> {}
>  // SAFETY: All `&self` methods on this type are written to ensure that it is safe to call them in
>  // parallel.
> -unsafe impl<T> Sync for MiscDeviceRegistration<T> {}
> +// MiscDevice::RegistrationData is always Sync.
> +unsafe impl<T: MiscDevice> Sync for MiscDeviceRegistration<T> {}
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

Changed to intra-doc links.

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

