Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E132FA12;
	Mon, 15 Dec 2025 11:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765797072; cv=none; b=BoOIjH7nWsj+FrEPXD2b5LfUvPYoo8KVb+66PZwbKf8sSkLa1HD5fVXtDfM0RC+7JmdGQromfmDT+fYQhpInpkxVESID+tsTNG7dR2wCcDr58DvYQtqx5+dLRm+s1HB71p7EYIqK5yCpZAIH6pT2UQpgDy0ZKyO2TZdeyE3axXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765797072; c=relaxed/simple;
	bh=H/CNyDkpcyE1zLIwMnQrhRRnRB1MooGf02izcjfXxdo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=AElHEfKcaInmfiPtNs4ykQZZP2KTv+qnhEE6MChCa2FvyxT10ZaSn6dLG8mg/sL910gkG1/pZwGRqHxoM8n7A9SiaFHoVJ6rhYaxPFjh2NM9v3reNm7o2iPoHnEnVEiitaKz4az+3BcRLVcA3Vbq49j1A99q8tIy2wXVOEQdCxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roQEf2LL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roQEf2LL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45034C4CEF5;
	Mon, 15 Dec 2025 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765797072;
	bh=H/CNyDkpcyE1zLIwMnQrhRRnRB1MooGf02izcjfXxdo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=roQEf2LLiAa8A4ayr13IFkSQ5cP+UwpXr3ARuRhGFgTIuZ6c9K6/Z0wdYUwTeYeAh
	 pWbvK6qKq3Yd3pl0nn22X1Oy7/LF3znhF846n5vNCWJGcNK8lAM1a3VOHFF8xy4pfL
	 ikXaOe9pouRGLF1rY16LxAGEJQWtrWYzob+prUjncQ126dV50EpDpu9VMlR85M285Q
	 WQ4MIqZPJuTz8/T4u5UG8xNE7H2vmudP2/I9QPkgC5qHkWLCxfr7YOMqa+CgfXfYl9
	 go9jxql7U3DweoTgTLSzPSM8zMo9hm8zsAc7y/IZlG71WQrCNJAUQm/99pzQu8DcCn
	 BpwJT+D1EMGOA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Dec 2025 12:11:08 +0100
Message-Id: <DEYQTIINCLA8.D0NCI46QBXD3@kernel.org>
Subject: Re: [PATCH 1/2] rust: Add soc_device support
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251212-soc-bindings-v1-0-db51044ce805@google.com>
 <20251212-soc-bindings-v1-1-db51044ce805@google.com>
In-Reply-To: <20251212-soc-bindings-v1-1-db51044ce805@google.com>

On Sat Dec 13, 2025 at 12:14 AM CET, Matthew Maurer wrote:
> Adds the ability to register SoC devices.

Please use imperative mood and add at least one sentence for motivation.

> diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..b8412751a5ca8839e588cf5bd=
52f2e6a7f33d457
> --- /dev/null
> +++ b/rust/kernel/soc.rs
> @@ -0,0 +1,137 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Google LLC.
> +
> +//! SoC Driver Abstraction
> +//!
> +//! C header: [`include/linux/sys_soc.h`](srctree/include/linux/sys_soc.=
h)
> +
> +use crate::bindings;
> +use crate::error;
> +use crate::prelude::*;
> +use crate::str::CString;
> +use core::marker::PhantomPinned;
> +use core::ptr::addr_of;

Please use kernel vertical style [1].

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

> +
> +/// Attributes for a SoC device

NIT: Please end with a period.

Also, can we slightly expand the documentation please? I mean, it is fairly
obvious what it is, but maybe one brief sentence what those attributes are =
about
does not hurt. :)

> +pub struct DeviceAttribute {
> +    /// Machine
> +    pub machine: Option<CString>,
> +    /// Family
> +    pub family: Option<CString>,
> +    /// Revision
> +    pub revision: Option<CString>,
> +    /// Serial Number
> +    pub serial_number: Option<CString>,
> +    /// SoC ID
> +    pub soc_id: Option<CString>,

Please also expand on the documentation of the fields, only repeating the n=
ame
of the field does not seem overly useful.

For instance, the revision field could point out what kind of revision, and
whether the revision format is specific to the spcific SoC device, etc.

> +}
> +
> +// SAFETY: We provide no operations through `&BuiltDeviceAttribute`
> +unsafe impl Sync for BuiltDeviceAttribute {}
> +
> +// SAFETY: All pointers are normal allocations, not thread-specific
> +unsafe impl Send for BuiltDeviceAttribute {}

Here and in a few more places below, please end with a period.

> +#[pin_data]
> +struct BuiltDeviceAttribute {
> +    #[pin]
> +    backing: DeviceAttribute,
> +    inner: bindings::soc_device_attribute,
> +    // Since `inner` has pointers to `backing`, we are !Unpin
> +    #[pin]
> +    _pin: PhantomPinned,

It's not strictly required in this case, but I think it would be better to =
make
inner an Opaque<bindings::soc_device_attribute> and drop the PhantomPinned =
in
return.

> +}
> +
> +fn cstring_to_c(mcs: &Option<CString>) -> *const kernel::ffi::c_char {
> +    mcs.as_ref()
> +        .map(|cs| cs.as_char_ptr())
> +        .unwrap_or(core::ptr::null())
> +}
> +
> +impl BuiltDeviceAttribute {
> +    fn as_mut_ptr(&self) -> *mut bindings::soc_device_attribute {
> +        core::ptr::from_ref(&self.inner).cast_mut()
> +    }
> +}
> +
> +impl DeviceAttribute {
> +    fn build(self) -> impl PinInit<BuiltDeviceAttribute> {
> +        pin_init!(BuiltDeviceAttribute {
> +            inner: bindings::soc_device_attribute {

You can use Opaque::new() here.

> +                machine: cstring_to_c(&self.machine),
> +                family: cstring_to_c(&self.family),
> +                revision: cstring_to_c(&self.revision),
> +                serial_number: cstring_to_c(&self.serial_number),
> +                soc_id: cstring_to_c(&self.soc_id),
> +                data: core::ptr::null(),
> +                custom_attr_group: core::ptr::null(),
> +            },
> +            backing: self,
> +            _pin: PhantomPinned,
> +        })
> +    }
> +}
> +
> +// SAFETY: We provide no operations through &Device
> +unsafe impl Sync for Device {}
> +
> +// SAFETY: Device holds a pointer to a `soc_device`, which may be sent t=
o any thread.
> +unsafe impl Send for Device {}
> +
> +/// A registered soc device
> +#[repr(transparent)]
> +pub struct Device(*mut bindings::soc_device);
> +
> +impl Device {
> +    /// # Safety
> +    /// * `attr` must be pinned
> +    /// * `attr` must be valid for reads during the function call
> +    /// * If a device is returned (e.g. no error), `attr` must remain va=
lid for reads until the
> +    ///   returned `Device` is dropped.
> +    unsafe fn register(attr: *const BuiltDeviceAttribute) -> Result<Devi=
ce> {
> +        let raw_soc =3D
> +            // SAFETY: The struct provided through attr is backed by pin=
ned data next to it, so as
> +            // long as attr lives, the strings pointed to by the struct =
will too. By caller
> +            // invariant, `attr` is pinned, so the pinned data won't mov=
e. By caller invariant,
> +            // `attr` is valid during this call. If it returns a device,=
 and so others may try to
> +            // read this data, by caller invariant, `attr` won't be rele=
ased until the device is.
> +            error::from_err_ptr(unsafe { bindings::soc_device_register((=
*attr).as_mut_ptr()) })?;
> +        Ok(Device(raw_soc))
> +    }
> +}

I think the Device structure is neither used in the sample nor in your qcom
socinfo driver, and I don't see it being used in the near future either.

The only thing it does is to provide an unsafe register() function that cal=
ls
soc_device_register() which should rather be called by Registration::new()
instead. Hence, let's drop the Device struct entirely.

When moving the struct soc_device pointer to Registration, please use NonNu=
ll
instead of a raw pointer.

> +#[pin_data(PinnedDrop)]
> +/// Registration handle for your soc_dev. If you let it go out of scope,=
 your soc_dev will be
> +/// unregistered.
> +pub struct DeviceRegistration {

For consistency (DRM, auxiliary, i2c, PWM, etc.), please call this just Reg=
istration.

> +    #[pin]
> +    attr: BuiltDeviceAttribute,
> +    soc_dev: Device,
> +    // Since Device transitively points to the contents of attr, we are =
!Unpin
> +    #[pin]
> +    _pin: PhantomPinned,
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for DeviceRegistration {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: Device always contains a live pointer to a soc_device=
 that can be unregistered
> +        unsafe { bindings::soc_device_unregister(self.soc_dev.0) }
> +    }
> +}
> +
> +impl DeviceRegistration {
> +    /// Register a new SoC device
> +    pub fn register(attr: DeviceAttribute) -> impl PinInit<Self, Error> =
{
> +        try_pin_init!(&this in Self {
> +                    attr <- attr.build(),
> +                    // SAFETY: We have already initialized attr, and we =
are inside PinInit and Self
> +                    // is !Unpin, so attr won't be moved and is valid. I=
f it returns success, attr
> +                    // will not be dropped until after our `PinnedDrop` =
implementation runs, so the
> +                    // device will be unregistered first.
> +                    soc_dev: unsafe { Device::register(addr_of!((*this.a=
s_ptr()).attr))? },

Please prefer &raw.

> +                    _pin: PhantomPinned,
> +        }? Error)
> +    }
> +}
>
> --=20
> 2.52.0.305.g3fc767764a-goog

