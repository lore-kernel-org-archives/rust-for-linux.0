Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F4513C66F
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 16:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711468924; cv=none; b=djeXd2brAzcJUd2arFimNrlBnmA4z5MwzwuSgSeg3DLCP+ND6rcEInpyKzOHpnuG9er8wYHOqYqx7Lnlfgsid41f7ICKl8oQRV/U4Og6YMvGFYd//GhJJDIwl1dZg30nBgEqHKkN6P+I7keKhqNFg+kngh3kMA0BeILVVX5yfI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711468924; c=relaxed/simple;
	bh=pb+Bl8Wz5dzM0KVQ7OIBbYx3YFhd0hpHZlq5EbLWpWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=A0YKgJq9tj8aejTOchpyHLMC1B14VUyx0ndr+/5kV+P20Zc2NwxJ/OsVewH91oHnX70UBMxoMiRqMrhkPRqxeCcqRySZIqH6VyIFT236MsdOyDspVeuBS4aey5N58udWd+n43h+hxT7gbrNvcqhQIkErUPvxTc92MjBUwGajOeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J3F9uAtL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J3F9uAtL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711468920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+JHT+qs7d5xGgM52y/zA3jfhIt76hKSRJuKLXLWCCJA=;
	b=J3F9uAtLrnmxIQ7ioL5Nv4DXOKYw21hY3xrEN95GGJ+LoYItKkF1NRt4Ogi2EE9OHC4P60
	AKqumLTHsRawJIX+KPt8X+bCgsXI2Ka9l9poqydeioHA3mAdPbiEtwgH+VcKi4uKA/0O5R
	FsMs3Coizxl7K3Wiz86Dqvl479V+7to=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-vrpcsZwHMfKbvc55v5Rq5A-1; Tue, 26 Mar 2024 12:01:57 -0400
X-MC-Unique: vrpcsZwHMfKbvc55v5Rq5A-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a46cc88be5fso385425566b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 09:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711468916; x=1712073716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JHT+qs7d5xGgM52y/zA3jfhIt76hKSRJuKLXLWCCJA=;
        b=QRgqjbdC5wRR8+x8/ix617+oOs+kux/7ywy2BhTPS2zYP/rRcx4U+K15tHROFIJffy
         Jju2rEOqJen7v5PqbwDHPqgFxJBpYWoBpBq1rF0nLCHesII14mUNX6zaTiDEqzRSuDdu
         tvaem480ZFxtVhyZhqC9poADo2VTMSFlL34THJoATEzbec0OJz6eTI4kJ67BcE59KbGI
         YGGRNI7si5BbGShz7gynby1Qszj1h6eip7TOPFnIh4LcNrXChJcU+njfi+0L3AxnmeEj
         ecaBS6Y4htxlLP1PNkiXYvppEarT81tCQnbRLGsh8NgecsbwMOjWCADmYQyyzUOvkEmw
         O8Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUuF7XfyT58Oe1u69zl3ylI4Fcy92yITa7H8E8VgT/B4C+vTDim4oGN23Pcz1SM6spyeYPY9aEOb3gTwl9PN0bR0u9J0X7PSEC8PVvhXmM=
X-Gm-Message-State: AOJu0YwHa5CO15niqpyskcPYhY2JEQE9uQ8t0MvXoBslQn4BeFqMQcy6
	0JbO3dwA6nOyxYHtSrhr2qXCbxCwAgUId28ZpZEgAo4SVRXVLrc74rR1sByOaabN1rDSe69gHcP
	Q1g9lYC1ZlTWm7WK8iTgzVykBod3fHtK6ooNIz7NqXdXNoR1Oxj0fkESxEgY23L4e
X-Received: by 2002:a17:906:c307:b0:a47:345f:4ec1 with SMTP id s7-20020a170906c30700b00a47345f4ec1mr1194918ejz.57.1711468916680;
        Tue, 26 Mar 2024 09:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtMnhn+EP8+m1X3gDg3NtZkLG3VTI9gS1vRUtSJMgNQlnfZvtuTb7w7TQ2z0rb0eS0rSHYUA==
X-Received: by 2002:a17:906:c307:b0:a47:345f:4ec1 with SMTP id s7-20020a170906c30700b00a47345f4ec1mr1194887ejz.57.1711468916320;
        Tue, 26 Mar 2024 09:01:56 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id x15-20020a1709060a4f00b00a455519bcb3sm4380911ejf.55.2024.03.26.09.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 09:01:55 -0700 (PDT)
Date: Tue, 26 Mar 2024 17:01:53 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <ZgLxcXTw3awyW7cH@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
 <2024032518-swampland-chaperone-317b@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024032518-swampland-chaperone-317b@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 25, 2024 at 07:17:46PM +0100, Greg KH wrote:
> On Mon, Mar 25, 2024 at 06:49:07PM +0100, Danilo Krummrich wrote:
> > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > 
> > Add a Device type which represents an owned reference to a generic
> > struct device. This minimal implementation just handles reference
> > counting and allows the user to get the device name.
> > 
> > Also, implement the rust_helper_dev_get_drvdata helper.
> > 
> > Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > Co-developed-by: Asahi Lina <lina@asahilina.net>
> > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/helpers.c        | 13 ++++++++
> >  rust/kernel/device.rs | 76 ++++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 88 insertions(+), 1 deletion(-)
> > 
> > diff --git a/rust/helpers.c b/rust/helpers.c
> > index 70e59efd92bc..1e40661a33d1 100644
> > --- a/rust/helpers.c
> > +++ b/rust/helpers.c
> > @@ -23,6 +23,7 @@
> >  #include <kunit/test-bug.h>
> >  #include <linux/bug.h>
> >  #include <linux/build_bug.h>
> > +#include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/errname.h>
> >  #include <linux/mutex.h>
> > @@ -157,6 +158,18 @@ void rust_helper_init_work_with_key(struct work_struct *work, work_func_t func,
> >  }
> >  EXPORT_SYMBOL_GPL(rust_helper_init_work_with_key);
> >  
> > +void *rust_helper_dev_get_drvdata(struct device *dev)
> > +{
> > +	return dev_get_drvdata(dev);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_dev_get_drvdata);
> > +
> > +const char *rust_helper_dev_name(const struct device *dev)
> > +{
> > +	return dev_name(dev);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_dev_name);
> > +
> >  /*
> >   * `bindgen` binds the C `size_t` type as the Rust `usize` type, so we can
> >   * use it in contexts where Rust expects a `usize` like slice (array) indices.
> > diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> > index 9be021e393ca..7309a236f512 100644
> > --- a/rust/kernel/device.rs
> > +++ b/rust/kernel/device.rs
> > @@ -4,7 +4,7 @@
> >  //!
> >  //! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> >  
> > -use crate::bindings;
> > +use crate::{bindings, str::CStr};
> >  
> >  /// A raw device.
> >  ///
> > @@ -20,4 +20,78 @@
> >  pub unsafe trait RawDevice {
> >      /// Returns the raw `struct device` related to `self`.
> >      fn raw_device(&self) -> *mut bindings::device;
> > +
> > +    /// Returns the name of the device.
> > +    fn name(&self) -> &CStr {
> > +        let ptr = self.raw_device();
> > +
> > +        // SAFETY: `ptr` is valid because `self` keeps it alive.
> 
> How can self keep it alive?

Device::new() calls get_device(), while the drop trait calls put_device(), hence
the expectation is that as long as self exists, we still hold a reference to the
raw device.

> 
> > +        let name = unsafe { bindings::dev_name(ptr) };
> > +
> > +        // SAFETY: The name of the device remains valid while it is alive (because the device is
> > +        // never renamed, per the safety requirement of this trait). This is guaranteed to be the
> > +        // case because the reference to `self` outlives the one of the returned `CStr` (enforced
> > +        // by the compiler because of their lifetimes).
> 
> devices are renamed all the time, I don't understand how this can be
> true here.

As the comment says, it's the safety requirement of this trait, which is
documented in the DOC comment of trait RawDevice. Admittedly, it's not obvious,
since the comment isn't part of this diff and was introduced in the previous
commit "rust: device: Add a minimal RawDevice trait". Maybe we should move it to
this commit then.

It says: "Additionally, implementers must ensure that the device is never
renamed. Commit a5462516aa99 ("driver-core: document restrictions on
device_rename()") has details on why `device_rename` should not be used."

> 
> 
> > +        unsafe { CStr::from_char_ptr(name) }
> > +    }
> > +}
> > +
> > +/// A ref-counted device.
> > +///
> > +/// # Invariants
> > +///
> > +/// `ptr` is valid, non-null, and has a non-zero reference count. One of the references is owned by
> > +/// `self`, and will be decremented when `self` is dropped.
> > +pub struct Device {
> > +    pub(crate) ptr: *mut bindings::device,
> > +}
> > +
> > +// SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
> > +unsafe impl Send for Device {}
> 
> It's safe if you have a reference count on the pointer.  Do you have
> that?

Yes, Device::new() calls get_device().

> 
> > +
> > +// SAFETY: `Device` only holds a pointer to a C device, references to which are safe to be used
> > +// from any thread.
> > +unsafe impl Sync for Device {}
> 
> Same as above.
> 
> 
> > +
> > +impl Device {
> > +    /// Creates a new device instance.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
> 
> device pointers are NULL all the time, you better be able to handle this
> otherwise it's not going to go well :(

You mean as in check for NULL and return an error in case? I wouldn't see much
value in that.

I think the only places where we call this are the ones where the C side already
guarantees that the raw device pointer is valid, e.g. probe() or remove()
callbacks.

> 
> > +    pub unsafe fn new(ptr: *mut bindings::device) -> Self {
> > +        // SAFETY: By the safety requirements, ptr is valid and its refcounted will be incremented.
> > +        unsafe { bindings::get_device(ptr) };
> > +        // INVARIANT: The safety requirements satisfy all but one invariant, which is that `self`
> > +        // owns a reference. This is satisfied by the call to `get_device` above.
> > +        Self { ptr }
> > +    }
> > +
> > +    /// Creates a new device instance from an existing [`RawDevice`] instance.
> > +    pub fn from_dev(dev: &dyn RawDevice) -> Self {
> > +        // SAFETY: The requirements are satisfied by the existence of `RawDevice` and its safety
> > +        // requirements.
> > +        unsafe { Self::new(dev.raw_device()) }
> > +    }
> > +}
> > +
> > +// SAFETY: The device returned by `raw_device` is the one for which we hold a reference.
> > +unsafe impl RawDevice for Device {
> > +    fn raw_device(&self) -> *mut bindings::device {
> > +        self.ptr
> > +    }
> > +}
> > +
> > +impl Drop for Device {
> > +    fn drop(&mut self) {
> > +        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
> > +        // relinquish it now.
> > +        unsafe { bindings::put_device(self.ptr) };
> > +    }
> > +}
> > +
> > +impl Clone for Device {
> > +    fn clone(&self) -> Self {
> > +        Self::from_dev(self)
> 
> Does this increment the reference count?

Yes, it does. from_dev() calls new() and new() calls get_device() again.

> 
> thanks,
> 
> greg k-h
> 

