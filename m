Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109752147E6
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161687; cv=none; b=SQ/biu249CNDYJdDoFInd9MPZKbO9kPfGwXJL2M+nHYsHfFFJ2iVzLXJAV786zwgVx2bUfbJW7ACu24Nx5P8imofZnnTqdOFKZGW/lOKQtIna6Q7ujoleOjY6uXKHlQcu+Yl7laOH00DVAAYjF7Ln6+/kzVN1K6pgCBbOIB589Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161687; c=relaxed/simple;
	bh=C8W/5GsJmCIKCN/wg4T3obD+ZMFqBZlAawRgEpe0aZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HD6I/2dXlFpLrykm5JJL93/bKYxfdY5Q4dZ7/i5tTQ83JxtIFQOPNbHM61KrwxZ7RTDtf4J7LiTbHfzqV7tehs+88KTlU1MlIxi/CE8XLPe4lIqGaU8blBOaykBZHzdWiExsKPcUW72llLbVUjtz7PFLScl2Oh7/cjjGhyk+eME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeONnUGI; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeONnUGI"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7c6dbdaced8so4868170a34.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768161685; x=1768766485; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AAEdLK+X3YFomibfs/nJUGuHj9KEH+0Eq3zrH9g87PM=;
        b=GeONnUGISzOLsGqo9bSEb7be0HGlW+ROkPd70g9obbFqsbsa6m0mK/BZNM7zSjRjxP
         sVf3s3IXuS6axTsNrGKxP/LiXzUNW/Jm+m16erThfuzOMKIUG8z41mDMUW0TGbyzgdhN
         A6YJ+gkwysdBHE0xW3hX0fvcJYbR6TooQzFefZ+ObA4FFZ/oVHd+mL/xUhLZBrFky/yH
         GuwiEL/ty9/GmANP35L0HCcIO1kf7jrssSp0PTDY7Zz8JIbBfe2txEIOHqK7SvmutJ1W
         IYPv8Z08lWb3Xd6S4lFP3jet4h9uc9FtVVD7jFRVu6dXL1/qzKKmEx4PFjynN5G8x2EB
         cpQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768161685; x=1768766485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAEdLK+X3YFomibfs/nJUGuHj9KEH+0Eq3zrH9g87PM=;
        b=FWnwZ6tdBxBie0ROdj6l1vrvUitfuIMr+AX/IFEMQd+T5I4aIA0oOiI/sJahf14zzW
         +8rV5rxJZ3jgkZ0OD9F+ueRA895htNC7jWro731aXEDfGbDijhOdDRbQuwHwYbN4PSx3
         Yjjj6v7YTKDXUp0KBA6mfv6uyc7usmWJOmLMxbmC3Zcf+XsfaRNX3rVQYNx+zmsFp9wJ
         766rvG0I3K6BZYxCgkIXejWu/H9BoZuo8XwVqHm+tPzJFxuldJ3pX+m59+g37RGqPDAW
         Me7/cltFUCVu6JxIa3NDlg7oB3MKCA+a7ubQXihvzq9R/FLaT/SOzvpbgjbMuNO189sy
         Z/RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV9bt1W3Nry+aRHKzypBYwRDPB/cR1RR6xi7r1OJHw6CEL3/FNpFQsHguDnMQersE8QN2tD8VyUwE8FF73yg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfxeUoHEjDrn1l+ZL5Z6yv5ERubJLxDsP56O2Xsk/Z7I9AaJ4i
	Np3Y4a3xRjXH75u6hM79G+G26xDIk4GDG6Sd9eoFo5WoSn58p8C2SoFN+sHGI3xa
X-Gm-Gg: AY/fxX4XGMmo9CR0vnuzm96eY2quBH38PicEXKVJ4Pc6cXEEwNJ8q4ZiUCM+sH3mOiZ
	sIOKSZl6EuYAdeGPWZ3BsLx+nhAN68K6pKpq5g1BwgnqBWPqLmRPgq7qRuP6FvxQ9iYRLpW0/O3
	71xxqBV6fFMvhfFUvRt5evNgjlSUMePoYoI5GdrC0u4TRPbBhlLvXJ8cmV3ezelQy/9SKhZfVXj
	eFgNh7jD5U+rHSqezPPdkXJp8naKwx8HYsFUacOjmIWH6z7UOOyeHyVAMcUFGAKwoARti/is0Uk
	y5eT2/6mKieOO9qnKohe+czvoJJlZB6o6WNLsUYnwgv+KQ49KAwnjIupbX0W041ajoxTymSJbYd
	HAeL1C4EqENk2upKJ3J5m+OYySaAi6wFzo6pwXwYRedk13s70p0qfqNUX08q4+7zkKteUrJBft+
	41hSXAlrxqsEXajaG10z6USrMMvAfQjvgAtbn0qCHiLRofSLpcR02xEvU2
X-Google-Smtp-Source: AGHT+IHpR26tjyLYMuiJM+eo7LOuRMeDzoaJBnSCSZojamOrxsiEQWZ9kE8SmjzzureBb+ehf7ZOcg==
X-Received: by 2002:a05:6830:6d25:b0:7bc:6cc3:a624 with SMTP id 46e09a7af769-7ce50a75bbfmr10048850a34.32.1768161684691;
        Sun, 11 Jan 2026 12:01:24 -0800 (PST)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce4781c43asm11645293a34.7.2026.01.11.12.01.19
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 12:01:20 -0800 (PST)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-65cf3d51c95so3169886eaf.2
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 12:01:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUt7xwMWehxp09PW5/JQvhLdgBilgWavB/Z1JhJjjNN6Xl/OxvcuGqeg/bKUSiOIQp+DfaAsBKnKpfZlSNCyQ==@vger.kernel.org
X-Received: by 2002:a05:6820:603:b0:65f:6794:9e6f with SMTP id
 006d021491bc7-65f6794a7admr4485979eaf.24.1768161679199; Sun, 11 Jan 2026
 12:01:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1768153572.git.foxido@foxido.dev> <42c8729d79c1264a2100b00d58b3f28a4584e585.1768153572.git.foxido@foxido.dev>
In-Reply-To: <42c8729d79c1264a2100b00d58b3f28a4584e585.1768153572.git.foxido@foxido.dev>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sun, 11 Jan 2026 22:01:08 +0200
X-Gmail-Original-Message-ID: <CAKBF=pvPFLtbYj_sR6j2HnE=uS9fwWLJnEMqk9_8FcfeTfo7gg@mail.gmail.com>
X-Gm-Features: AZwV_QifGwMHIW_mnzPBJDYNjeBOvmsZ_JjGTY4GL-K_cUTwegKGVWCBpxcOZUw
Message-ID: <CAKBF=pvPFLtbYj_sR6j2HnE=uS9fwWLJnEMqk9_8FcfeTfo7gg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: add WMI abstractions
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Armin Wolf <W_Armin@gmx.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Still found couple small things. Overall these looks really good to me.
Waiting for more. Please CC also me to this series. Usually you CC
people who do some reviewing as then they notice right away when
new series comes and can give another look.

On Sun, 11 Jan 2026 at 20:33, Gladyshev Ilya <foxido@foxido.dev> wrote:
>
> This introduces Rust abstraction for WMI subsystem via wmi::Driver trait
> and module_wmi_driver/wmi_device_table macros. Driver can be probed,
> notified on events and removed -- almost everything C-side can do.
>
> This abstraction will be used by subsequent redmi_wmi_rs reference
> driver.
>
> Signed-off-by: Gladyshev Ilya <foxido@foxido.dev>
> ---
>  MAINTAINERS                     |   1 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/lib.rs              |   2 +
>  rust/kernel/wmi.rs              | 286 ++++++++++++++++++++++++++++++++
>  4 files changed, 290 insertions(+)
>  create mode 100644 rust/kernel/wmi.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 765ad2daa218..4909ae8be6e3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -404,6 +404,7 @@ F:  Documentation/driver-api/wmi.rst
>  F:     Documentation/wmi/
>  F:     drivers/platform/wmi/
>  F:     include/uapi/linux/wmi.h
> +F:     rust/kernel/wmi.rs
>
>  ACRN HYPERVISOR SERVICE MODULE
>  M:     Fei Li <fei1.li@intel.com>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index a067038b4b42..f9671280c6b5 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -85,6 +85,7 @@
>  #include <linux/usb.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
> +#include <linux/wmi.h>
>  #include <linux/xarray.h>
>  #include <trace/events/rust_sample.h>
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf120042..db3e649d26eb 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -151,6 +151,8 @@
>  pub mod uaccess;
>  #[cfg(CONFIG_USB = "y")]
>  pub mod usb;
> +#[cfg(CONFIG_ACPI_WMI)]
> +pub mod wmi;
>  pub mod workqueue;
>  pub mod xarray;
>
> diff --git a/rust/kernel/wmi.rs b/rust/kernel/wmi.rs
> new file mode 100644
> index 000000000000..d6b9bc29a4d6
> --- /dev/null
> +++ b/rust/kernel/wmi.rs
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstractions for the WMI devices.
> +//!
> +//! C header: [`include/linux/wmi.h`](srctree/include/linux/wmi.h).
> +
> +use crate::{
> +    acpi::AcpiObject,
> +    device,
> +    device_id::{
> +        RawDeviceId,
> +        RawDeviceIdIndex, //
> +    },
> +    driver,
> +    error::{
> +        from_result,
> +        to_result,
> +        VTABLE_DEFAULT_ERROR, //
> +    },
> +    prelude::*,
> +    types::Opaque, //
> +};
> +use core::{
> +    marker::PhantomData,
> +    ptr::NonNull, //
> +};
> +use macros::vtable;
> +
> +/// [`IdTable`](kernel::device_id::IdTable) type for WMI.
> +pub type IdTable<T> = &'static dyn kernel::device_id::IdTable<DeviceId, T>;
> +
> +/// The WMI driver trait.
> +///
> +/// Driver can be called from arbitary thread without any ordering guarantees.

s/arbitary/arbitrary

> +#[vtable]
> +pub trait Driver: Send + Sync {
> +    /// The type holding information about each one of the device ids supported by the driver.
> +    type IdInfo: 'static;
> +
> +    /// The table of device ids supported by the driver.
> +    const TABLE: IdTable<Self::IdInfo>;
> +
> +    /// WMI driver probe.
> +    ///
> +    /// Called when a new WMI device is bound to this driver.
> +    /// Implementers should attempt to initialize the driver here.
> +    fn probe(dev: &Device<device::Core>, id_info: &Self::IdInfo) -> impl PinInit<Self, Error>;
> +
> +    /// WMI device notify.
> +    ///
> +    /// Called when new WMI event received from bounded device.

Maybe add here little bit info what does it mean that AcpiObject is
Optional. Something like:

/// Some notification events do not provide any additional ACPI data.
/// In those cases, `event` will be `None`.

> +    fn notify(self: Pin<&Self>, _dev: &Device<device::Bound>, _event: Option<&AcpiObject<'_>>) {
> +        build_error!(VTABLE_DEFAULT_ERROR);
> +    }
> +
> +    /// WMI driver remove.
> +    ///
> +    /// Called when the WMI driver is unbound from a WMI device.

Just copy paste this from example PCI. That way it is clear that
usually this should not be used.

    /// WMI driver unbind.
    ///
    /// Called when a [`Device`] is unbound from its bound [`Driver`].
Implementing this callback
    /// is optional.
    ///
    /// This callback serves as a place for drivers to perform
teardown operations that require a
    /// `&Device<Core>` or `&Device<Bound>` reference. For instance,
drivers may try to perform I/O
    /// operations to gracefully tear down the device.
    ///
    /// Otherwise, release operations for driver resources should be
performed in `Self::drop`.

> +    fn unbind(self: Pin<&Self>, _dev: &Device<device::Core>) {
> +        build_error!(VTABLE_DEFAULT_ERROR);
> +    }
> +}
> +
> +/// A WMI device.
> +///
> +/// This structure represents the Rust abstraction for a C [`struct wmi_device`].
> +/// The implementation abstracts the usage of a C [`struct wmi_device`] passed
> +/// in from the C side.
> +pub struct Device<Cxt: device::DeviceContext = device::Normal> {
> +    inner: Opaque<bindings::wmi_device>,
> +    _p: PhantomData<Cxt>,
> +}
> +
> +impl<Cxt: device::DeviceContext> Device<Cxt> {
> +    fn as_raw(&self) -> *mut bindings::wmi_device {
> +        self.inner.get()
> +    }
> +}
> +
> +/// An adapter for the registration of WMI drivers.
> +pub struct Adapter<T: Driver>(T);
> +
> +// SAFETY: A call to `unregister` for a given instance of `RegType` is guaranteed to be valid if
> +// a preceding call to `register` has been successful.
> +unsafe impl<T: Driver + 'static> driver::RegistrationOps for Adapter<T> {
> +    type RegType = bindings::wmi_driver;
> +
> +    unsafe fn register(
> +        wdrv: &Opaque<Self::RegType>,
> +        name: &'static CStr,
> +        module: &'static ThisModule,
> +    ) -> Result {
> +        macro_rules! map_callback {
> +            ($flag:ident -> $callback:ident) => {
> +                if T::$flag {
> +                    Some(Self::$callback)
> +                } else {
> +                    None
> +                }
> +            };
> +        }
> +
> +        // SAFETY: It's safe to set the fields of `struct wmi_driver` on initialization.
> +        unsafe {
> +            (*wdrv.get()).driver.name = name.as_char_ptr();
> +            (*wdrv.get()).driver.probe_type = bindings::probe_type_PROBE_PREFER_ASYNCHRONOUS;
> +            (*wdrv.get()).id_table = T::TABLE.as_ptr();
> +            (*wdrv.get()).probe = map_callback!(HAS_PROBE -> probe_callback);
> +            (*wdrv.get()).notify = map_callback!(HAS_NOTIFY -> notify_callback);
> +            (*wdrv.get()).remove = map_callback!(HAS_UNBIND -> remove_callback);
> +            (*wdrv.get()).shutdown = None;
> +            (*wdrv.get()).no_singleton = true;

Maybe comment for no_singleton

    // Every new WMI driver needs to set this true.

> +            (*wdrv.get()).no_notify_data = true;

Maybe add comment for no_notify_data

    // With this notify_callback() can receive empty notification
    // which is we then transform to 'None'.

> +        }
> +
> +        // SAFETY: `wdrv` is guaranteed to be a valid `RegType`.
> +        to_result(unsafe { bindings::__wmi_driver_register(wdrv.get(), module.as_ptr()) })
> +    }
> +
> +    unsafe fn unregister(wdrv: &Opaque<Self::RegType>) {
> +        // SAFETY: `wdrv` is guaranteed to be a valid `RegType`.
> +        unsafe { bindings::wmi_driver_unregister(wdrv.get()) };
> +    }
> +}
> +
> +impl<T: Driver + 'static> Adapter<T> {
> +    extern "C" fn probe_callback(
> +        wdev: *mut bindings::wmi_device,
> +        id: *const c_void,
> +    ) -> kernel::ffi::c_int {
> +        // SAFETY: The WMI core only ever calls the probe callback with a valid pointer to a
> +        // `struct wmi_device`.
> +        //
> +        // INVARIANT: `wdev` is valid for the duration of `probe_callback()`.
> +        let wdev = unsafe { &*wdev.cast::<Device<device::CoreInternal>>() };
> +
> +        let id = id as usize;

Convention has been that "as" cast has comments like

    // CAST:

This can be added also other places. This is just nit from me and I do not
require this. So up to you.

> +        let info = T::TABLE.info(id);
> +
> +        from_result(|| {
> +            let data = T::probe(wdev, info);
> +
> +            wdev.as_ref().set_drvdata(data)?;
> +            Ok(0)
> +        })
> +    }
> +
> +    extern "C" fn notify_callback(
> +        wdev: *mut bindings::wmi_device,
> +        obj: *mut bindings::acpi_object,
> +    ) {
> +        // SAFETY: The WMI system only ever calls the notify callback with a valid pointer to a
> +        // `struct wmi_device`.
> +        let wdev = unsafe { &*wdev.cast::<Device<device::CoreInternal>>() };
> +        // SAFETY:
> +        // - AcpiObject is repr(transparent) wrapper around FFI object, so it's safe to cast
> +        //    raw pointer to reference (in terms of alignment and etc),
> +        // - Option<&ref> is guaranteed to have same layout as raw pointer (with NULL representing
> +        //    None) by Rust's "nullable pointer optimization".
> +        let obj: Option<&AcpiObject<'_>> =
> +            unsafe { core::mem::transmute(obj as *const AcpiObject<'_>) };
> +
> +        // SAFETY: `notify_callback` is only ever called after a successful call to
> +        // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
> +        // and stored a `T`.
> +        let this = unsafe { wdev.as_ref().drvdata_borrow::<T>() };
> +        this.notify(wdev, obj);
> +    }
> +
> +    extern "C" fn remove_callback(wdev: *mut bindings::wmi_device) {
> +        // SAFETY: The WMI system only ever calls the remove callback with a valid pointer to a
> +        // `struct wmi_device`.
> +        let wdev = unsafe { &*wdev.cast::<Device<device::CoreInternal>>() };
> +
> +        // SAFETY: `remove_callback` is only ever called after a successful call to
> +        // `probe_callback`, hence it's guaranteed that `Device::set_drvdata()` has been called
> +        // and stored a `T`.
> +        let this = unsafe { wdev.as_ref().drvdata_borrow::<T>() };
> +        this.unbind(wdev);
> +    }
> +}
> +
> +impl<Ctx: device::DeviceContext> AsRef<device::Device<Ctx>> for Device<Ctx> {
> +    fn as_ref(&self) -> &device::Device<Ctx> {
> +        // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
> +        // `struct platform_device`.

Safety comment seems copy pasted so it is wrong.

> +        let dev = unsafe { &raw mut (*self.inner.get()).dev };
> +
> +        // SAFETY: `dev` points to a valid `struct device`.
> +        unsafe { device::Device::from_raw(dev) }
> +    }
> +}
> +
> +// SAFETY: `Device` is a transparent wrapper of a type that doesn't depend on `Device`'s generic
> +// argument.
> +kernel::impl_device_context_deref!(unsafe { Device });
> +kernel::impl_device_context_into_aref!(Device);
> +
> +// SAFETY: Instances of `Device` are always reference-counted.
> +unsafe impl crate::sync::aref::AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
> +        unsafe { bindings::get_device(self.as_ref().as_raw()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount is non-zero.
> +        unsafe { bindings::put_device(&raw mut (*obj.as_ref().as_raw()).dev) }
> +    }
> +}
> +
> +/// Abstraction for the WMI device ID structure, i.e. [`struct wmi_device_id`].
> +///
> +/// [`struct wmi_device_id`]: https://docs.kernel.org/driver-api/basics.html#c.wmi_device_id
> +#[repr(transparent)]
> +pub struct DeviceId(bindings::wmi_device_id);
> +
> +impl DeviceId {
> +    const GUID_LEN: usize = bindings::UUID_STRING_LEN as usize;
> +
> +    /// Constructs new DeviceId from GUID string.
> +    pub const fn new(guid: &[u8; Self::GUID_LEN]) -> Self {
> +        let mut inner: bindings::wmi_device_id = pin_init::zeroed();
> +
> +        build_assert!(inner.guid_string.len() == Self::GUID_LEN + 1);
> +
> +        // We are copying UUID_STRING_LEN bytes and we verified that UUID_STRING_LEN + 1 byte
> +        // exists and will remain '\0'. So we will construct valid C string.
> +        let mut i = 0;
> +        while i < Self::GUID_LEN {
> +            inner.guid_string[i] = guid[i];
> +            i += 1;
> +        }
> +
> +        Self(inner)
> +    }
> +}
> +
> +// SAFETY: `DeviceId` is a `#[repr(transparent)]` wrapper of `wmi_device_id` and does not add
> +// additional invariants, so it's safe to transmute to `RawType`.
> +unsafe impl RawDeviceId for DeviceId {
> +    type RawType = bindings::wmi_device_id;
> +}
> +
> +// SAFETY: `DRIVER_DATA_OFFSET` is the offset to the `context` field.
> +unsafe impl RawDeviceIdIndex for DeviceId {
> +    const DRIVER_DATA_OFFSET: usize = core::mem::offset_of!(bindings::wmi_device_id, context);
> +
> +    fn index(&self) -> usize {
> +        self.0.context as usize
> +    }
> +}
> +
> +/// Declares a kernel module that exposes a single WMI driver.
> +///
> +/// # Examples
> +///
> +/// ```ignore
> +/// module_wmi_driver! {
> +///     type: MyDriver,
> +///     name: "Module name",
> +///     author: ["Author name"],
> +///     description: "Description",
> +///     license: "GPL v2",
> +/// }
> +/// ```
> +#[macro_export]
> +macro_rules! module_wmi_driver {
> +    ($($f:tt)*) => {
> +        $crate::module_driver!(<T>, $crate::wmi::Adapter<T>, { $($f)* });
> +    }
> +}
> +
> +/// Create a WMI `IdTable` with its alias for modpost.
> +#[macro_export]
> +macro_rules! wmi_device_table {
> +    ($table_name:ident, $module_table_name:ident, $id_info_type: ty, $table_data: expr) => {
> +        const $table_name: $crate::device_id::IdArray<
> +            $crate::wmi::DeviceId,
> +            $id_info_type,
> +            { $table_data.len() },
> +        > = $crate::device_id::IdArray::new($table_data);
> +
> +        $crate::module_device_table!("wmi", $module_table_name, $table_name);
> +    };
> +}
> --
> 2.52.0
>
>
