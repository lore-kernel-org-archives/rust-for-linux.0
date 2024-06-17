Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB44919069C
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Jun 2024 22:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718664654; cv=none; b=LJ7mteWSuleFHh6hXaTxCufQpowDSGj8T3Ro9TKaN/TCKBbq5k4NT87wu5fUHbqfWHEZn0vxNUisW6VNWJKvFjVJ2S1ybcprazK5QkWLXnzgP3KdR5Fd0G3eVAaess2UHoZOWW3LW7+ho2vnqfPmTntjP3vRYXhaTHEza6yI2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718664654; c=relaxed/simple;
	bh=HEWUK6bdL9EW9nryzTZspp0xb1vBnajyA8g5xFQ46GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C2lUmoUJu915mmiao25HriBcWG8kIDs0GYx1eppb+h19a5hymyusxNb0iYb+I7sWRcmlBLm8tNtBZfjLvJIn65T8qQr+lgjJoI1Hqs8xWW/v310XUHbAkGC2sCr9iQoxLnnimXx9nJtDETmpbrLnx2gWTsbdkgutCDDx7YZHU9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T0dsB+rd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0dsB+rd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718664651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FI+Lsreg2NUHIrTwyfhuKoVJ7UaM/v+Wceo88R/pEC0=;
	b=T0dsB+rdfScSHAlWhMgVyHbxK+ORss10pLYOv3XreLM3R32h2XQZ3kOHFRU6C6gHlnsGxz
	72VbvZwDtuhMsnCkxIQPldPhrY8fp71Vg6AycPtswwmH5HCKKiFsA/VXVvkWE/hgBgl/5i
	CuihQRMbA2KzlRyQoPaOyCSTMdjpeCs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-HZdlNa0XPT-7CHU9rlYByA-1; Mon, 17 Jun 2024 18:50:49 -0400
X-MC-Unique: HZdlNa0XPT-7CHU9rlYByA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-35f1cfa0be9so2636664f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Jun 2024 15:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718664648; x=1719269448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FI+Lsreg2NUHIrTwyfhuKoVJ7UaM/v+Wceo88R/pEC0=;
        b=vVESyq5ZBSzdNOFMR/J18wSXMGMymVeIPnmiUy64u2SOlQWfroM3lZqwO52pgipTnv
         vzailLZEZiFKynlQ8l9SXXeV7DbEu+HpSKYCTI0+YipdC3+bC3L5CV26sjWus7f8bi8V
         /uDcKQQUAKKmvKZpL92idIdRv83KWTFZoyktNdKloBqqSS7o6HIddO/f5c38IjOilw9z
         a6NV9CpgH5XAWuRqgtbbX0UjzXeIykRnZTtoxLfiue8YluyOew17Xmggk15yuAvjArCp
         aDQbaUAuELRpI4g2ltgfbo0DpCUNawnJqB5ZsWFNTDxxJOQWGxAZkuptgJDRxIuBtmGf
         WVRg==
X-Forwarded-Encrypted: i=1; AJvYcCWJkfSx6ZbYx95Zg4pd8yDMgkGRzSVThxLt5IRcT1lQO8n0Apb54CtE+1TqVisPdyiSt9v5t5NCHD0uvDqll7MvFFy44dUytDS72kebA8c=
X-Gm-Message-State: AOJu0YzexIHiu1HIvsoOB5fA20Srnt8wEQ3xwzYUk6ttLgYTkiJN9zNJ
	YWAoWBVSyu+jKNFtIqu1sZsWSwRZAEnsVjWRB0sapn9uczHMOK1Hwa7auTdEAnRPvLaNYwwAy1D
	b1ZnzNOk8SBz0JEhIEz94juv1LGZtwrHmqityRA1q0/dKs+G5GHGR+tsT2pj2OBao
X-Received: by 2002:a5d:5987:0:b0:35f:f58:38f6 with SMTP id ffacd0b85a97d-3607a7838c6mr8447821f8f.49.1718664648497;
        Mon, 17 Jun 2024 15:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiymbbgXEScj4GiC5BPfcwtItANz00+7/xzWt2OIJKKbKFcwmU2cWReGm+WQueVWR6sQGJGw==
X-Received: by 2002:a5d:5987:0:b0:35f:f58:38f6 with SMTP id ffacd0b85a97d-3607a7838c6mr8447798f8f.49.1718664647968;
        Mon, 17 Jun 2024 15:50:47 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de607sm210127145e9.34.2024.06.17.15.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:50:47 -0700 (PDT)
Date: Tue, 18 Jun 2024 00:50:45 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, mcgrof@kernel.org,
	russ.weight@linux.dev, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, airlied@gmail.com, fujita.tomonori@gmail.com,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: add firmware abstractions
Message-ID: <ZnC9xajuhN6nSQb-@cassiopeiae>
References: <20240617203010.101452-1-dakr@redhat.com>
 <20240617203010.101452-3-dakr@redhat.com>
 <ZnCzLIly3DRK2eab@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZnCzLIly3DRK2eab@boqun-archlinux>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 17, 2024 at 03:05:32PM -0700, Boqun Feng wrote:
> On Mon, Jun 17, 2024 at 10:29:41PM +0200, Danilo Krummrich wrote:
> > Add an abstraction around the kernels firmware API to request firmware
> > images. The abstraction provides functions to access the firmware's size
> > and backing buffer.
> > 
> > The firmware is released once the abstraction instance is dropped.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  drivers/base/firmware_loader/Kconfig |  7 ++
> >  rust/bindings/bindings_helper.h      |  1 +
> >  rust/kernel/firmware.rs              | 98 ++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs                   |  2 +
> >  4 files changed, 108 insertions(+)
> >  create mode 100644 rust/kernel/firmware.rs
> > 
> > diff --git a/drivers/base/firmware_loader/Kconfig b/drivers/base/firmware_loader/Kconfig
> > index 5ca00e02fe82..a03701674265 100644
> > --- a/drivers/base/firmware_loader/Kconfig
> > +++ b/drivers/base/firmware_loader/Kconfig
> > @@ -37,6 +37,13 @@ config FW_LOADER_DEBUG
> >  	  SHA256 checksums to the kernel log for each firmware file that is
> >  	  loaded.
> >  
> > +config RUST_FW_LOADER_ABSTRACTIONS
> > +	bool "Rust Firmware Loader abstractions"
> > +	depends on RUST
> > +	depends on FW_LOADER=y
> > +	help
> > +	  This enables the Rust abstractions for the firmware loader API.
> > +
> >  if FW_LOADER
> >  
> >  config FW_LOADER_PAGED_BUF
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> > index ddb5644d4fd9..18a3f05115cb 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -9,6 +9,7 @@
> >  #include <kunit/test.h>
> >  #include <linux/errname.h>
> >  #include <linux/ethtool.h>
> > +#include <linux/firmware.h>
> >  #include <linux/jiffies.h>
> >  #include <linux/mdio.h>
> >  #include <linux/phy.h>
> > diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> > new file mode 100644
> > index 000000000000..05a4f84cfd42
> > --- /dev/null
> > +++ b/rust/kernel/firmware.rs
> > @@ -0,0 +1,98 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Firmware abstraction
> > +//!
> > +//! C header: [`include/linux/firmware.h`](srctree/include/linux/firmware.h")
> > +
> > +use crate::{bindings, device::Device, error::Error, error::Result, str::CStr};
> > +use core::ptr::NonNull;
> > +
> > +// One of the following: `bindings::request_firmware`, `bindings::firmware_request_nowarn`,
> > +// `firmware_request_platform`, `bindings::request_firmware_direct`
> > +type FwFunc =
> > +    unsafe extern "C" fn(*mut *const bindings::firmware, *const i8, *mut bindings::device) -> i32;
> > +
> > +/// Abstraction around a C `struct firmware`.
> > +///
> > +/// This is a simple abstraction around the C firmware API. Just like with the C API, firmware can
> > +/// be requested. Once requested the abstraction provides direct access to the firmware buffer as
> > +/// `&[u8]`. The firmware is released once [`Firmware`] is dropped.
> > +///
> > +/// # Invariants
> > +///
> > +/// The pointer is valid, and has ownership over the instance of `struct firmware`.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// # use kernel::{c_str, device::Device, firmware::Firmware};
> > +///
> > +/// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device>` instance
> > +/// # let dev = unsafe { Device::from_raw(core::ptr::null_mut()) };
> > +///
> > +/// let fw = Firmware::request(c_str!("path/to/firmware.bin"), &dev).unwrap();
> > +/// let blob = fw.data();
> > +/// ```
> > +pub struct Firmware(NonNull<bindings::firmware>);
> > +
> 
> I feel like eventually we need a very simple smart pointer type for
> these case, for example:
> 
>     /// A smart pointer owns the underlying data.
>     pub struct Owned<T: Ownable> {
>         ptr: NonNull<T>,
>     }
> 
>     impl<T: Ownable> Owned<T> {
>         /// # Safety
> 	/// `ptr` needs to be a valid pointer, and it should be the
> 	/// unique owner to the object, in other words, no one can touch
> 	/// or free the underlying data.
>         pub unsafe to_owned(ptr: *mut T) -> Self {
> 	    // SAFETY: Per function safety requirement.
> 	    Self { ptr: unsafe { NonNull::new_unchecked(ptr) } }
> 	}
> 
> 	/// other safe constructors are available if a initializer (impl
> 	/// Init) is provided
>     }
> 
>     /// A Ownable type is a type that can be put into `Owned<T>`, and
>     /// when `Owned<T>` drops, `ptr_drop` will be called.
>     pub unsafe trait Ownable {
>         /// # Safety
> 	/// This could only be called in the `Owned::drop` function.
>         unsafe fn ptr_drop(ptr: *mut Self);
>     }
> 
>     impl<T: Ownable> Drop for Owned<T> {
>         fn drop(&mut self) {
> 	    /// SAFETY: In Owned<T>::drop.
> 	    unsafe {
> 	        <T as Ownable>::ptr_drop(self.as_mut_ptr());
> 	    }
> 	}
>     }
> 
> we can implement Deref and DerefMut easily on `Owned<T>`. And then we
> could define Firmware as
> 
>     #[repr(transparent)]
>     pub struct Firmware(Opaque<bindings::firmware>);
> 
> and
> 
>     unsafe impl Ownable for Firmware {
>         unsafe fn ptr_drop(ptr: *mut Self) {
> 	    // SAFETY: Per function safety, this is called in
> 	    // Owned::drop(), so `ptr` is a unique pointer to object,
> 	    // it's safe to release the firmware.
>             unsafe { bindings::release_firmware(ptr.cast()); }
>         }
>     }
> 
> and the request_*() will return a `Result<Owned<Self>>`. 
> 
> Alice mentioned the need of this in page as well:
> 
> 	https://lore.kernel.org/rust-for-linux/CAH5fLgjrt0Ohj1qBv=GrqZumBTMQ1jbsKakChmxmG2JYDJEM8w@mail.gmail.com		

I think in the `Page` case this is useful to create `Page` references from
previously allocated memory.

In the case of `Firmware`, I agree it makes sense to use it once we have it,
but other than for consistency, is there any advantage?

> 
> Just bring it up while we are (maybe not? ;-)) at it. Also I would like
> to hear whether this would work for Firmware in the longer-term ;-) But
> yes, I'm not that worried about merging it as it is if others are all
> OK.

I think there's not too much to add here in the future, once we got an allocator
API (I should get back to that soon), I want to add a method that copies the
data to a new buffer allocated with a given allocator. And maybe we want to
support a few other request_firmware_* functions in the future, but none of that
should require the above abstraction.

> 
> > +impl Firmware {
> > +    fn request_internal(name: &CStr, dev: &Device, func: FwFunc) -> Result<Self> {
> > +        let mut fw: *mut bindings::firmware = core::ptr::null_mut();
> > +        let pfw: *mut *mut bindings::firmware = &mut fw;
> > +
> > +        // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
> > +        // `name` and `dev` are valid as by their type invariants.
> > +        let ret = unsafe { func(pfw as _, name.as_char_ptr(), dev.as_raw()) };
> > +        if ret != 0 {
> > +            return Err(Error::from_errno(ret));
> > +        }
> > +
> > +        // SAFETY: `func` not bailing out with a non-zero error code, guarantees that `fw` is a
> > +        // valid pointer to `bindings::firmware`.
> > +        Ok(Firmware(unsafe { NonNull::new_unchecked(fw) }))
> > +    }
> > +
> > +    /// Send a firmware request and wait for it. See also `bindings::request_firmware`.
> > +    pub fn request(name: &CStr, dev: &Device) -> Result<Self> {
> > +        Self::request_internal(name, dev, bindings::request_firmware)
> > +    }
> > +
> > +    /// Send a request for an optional firmware module. See also
> > +    /// `bindings::firmware_request_nowarn`.
> > +    pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self> {
> > +        Self::request_internal(name, dev, bindings::firmware_request_nowarn)
> > +    }
> > +
> > +    fn as_raw(&self) -> *mut bindings::firmware {
> > +        self.0.as_ptr()
> > +    }
> > +
> > +    /// Returns the size of the requested firmware in bytes.
> > +    pub fn size(&self) -> usize {
> > +        // SAFETY: Safe by the type invariant.
> > +        unsafe { (*self.as_raw()).size }
> > +    }
> > +
> > +    /// Returns the requested firmware as `&[u8]`.
> > +    pub fn data(&self) -> &[u8] {
> > +        // SAFETY: Safe by the type invariant. Additionally, `bindings::firmware` guarantees, if
> 
> Does this "Safe by the type invariant" also covers the following safe
> requirement of `from_raw_parts`?
> 
> 	The memory referenced by the returned slice must not be mutated for the duration of lifetime 'a, except inside an UnsafeCell.
> 
> in that `&[u8]` has the same lifetime as `&self`, and as long as
> `&self` exists, no function can touch the inner `data`? If so, I
> probably want to call this out.

Yes, nothing should ever modify the firmware buffer after it has been requested
successfully. I can add this to the type invariant.

> 
> Regards,
> Boqun
> 
> > +        // successfully requested, that `bindings::firmware::data` has a size of
> > +        // `bindings::firmware::size` bytes.
> > +        unsafe { core::slice::from_raw_parts((*self.as_raw()).data, self.size()) }
> > +    }
> > +}
> > +
> > +impl Drop for Firmware {
> > +    fn drop(&mut self) {
> > +        // SAFETY: Safe by the type invariant.
> > +        unsafe { bindings::release_firmware(self.as_raw()) };
> > +    }
> > +}
> > +
> > +// SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, which is safe to be used from
> > +// any thread.
> > +unsafe impl Send for Firmware {}
> > +
> > +// SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, references to which are safe to
> > +// be used from any thread.
> > +unsafe impl Sync for Firmware {}
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index dd1207f1a873..7707cb013ce9 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -30,6 +30,8 @@
> >  mod build_assert;
> >  pub mod device;
> >  pub mod error;
> > +#[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
> > +pub mod firmware;
> >  pub mod init;
> >  pub mod ioctl;
> >  #[cfg(CONFIG_KUNIT)]
> > -- 
> > 2.45.1
> > 
> 

