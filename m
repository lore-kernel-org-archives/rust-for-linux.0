Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A14781AD2
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 11:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711539394; cv=none; b=I/1uXtwnKd0k0ZuscxlPh2R4XobHo/3RqqQYR2UjbxsOEHdzmVHKL9AbDZrACLTua/ptQGJy4bTM0fSMnCKXTAOi55cQY8UB76jPPws7urY7Rop1Y/elz9cowMFFqec4MF+Oesb+YqqhHIBfJjoyWyzhn9U6OnkwJm7HlnsfV60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711539394; c=relaxed/simple;
	bh=67UJQ3IaX8Elxh93kOqUXqd6okiXZqr80RI29q/2kz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GMW7Co3ZX6TjMceh25HvBRut4soOjiInAmamtSW/VCkHeFgi9dlzo1IkrSgaR1gUTUnEH37IJfmWhGakEhNntNaClI8Cob9Jwng+NHCQLtBBd/VC9uZYDemm5ak0LdjnOVW5IwRdeRhK0OKGUvOOwzltS97/QFBBDDQlx6DnQTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KNocv7w9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KNocv7w9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711539390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mJe6gQxeKQlnhdrkc46EjQ/OhJCMkrZivraCMFGzDa8=;
	b=KNocv7w9eO32CB/X88CkmfeY7F+gOEorqsGv9363pXuR//6yUHPl1U1fy8fB8FfRAqC1kR
	kYTgb1ycjM+SiBEYdyGTfH75RBU0Uv+A1QK6cohTyPvNTK0XkYXGLhJ8ThD9akYrxi1Tes
	B9WLpYrZ/PWF2U3SWl8H5lCLS9/3Fjk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-Za9TTsU6PRyta4XSZaOLOg-1; Wed, 27 Mar 2024 07:36:29 -0400
X-MC-Unique: Za9TTsU6PRyta4XSZaOLOg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4147ddecd52so4488625e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 04:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711539388; x=1712144188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJe6gQxeKQlnhdrkc46EjQ/OhJCMkrZivraCMFGzDa8=;
        b=W+rTv3WK0PI0vgj/YoWL6l2BllusY7FK9PKIbp905gAVOyvSoXXncu2R0iK7LvQ8He
         j7hDe1LzHh1B2lKGHm3JyanP4aSY+Dws6I6K2+iICs8WyZ/6nzjeKhF1+b/FbYRvoJ4F
         tHxG3UJCDx2rClhDKUR+iwbZHA/Mm/+msaLvaBsy5btMqXaBRXvj7S1fhHZbYFN/bvNZ
         w0zL6Cu156lpO+uzRaoYaMFOQvMnQplTRcbPantCxe99VlOP1h19GXE+sXKr8NUZn1MZ
         Qfa/H0zQKF/RBFfs/tmJa4DULe2Q6EwEyIrvFqzSkWW+8Ws4Yjew2Es9lAmOFPrFy5B6
         ebOw==
X-Forwarded-Encrypted: i=1; AJvYcCWcXgPKG7+zBISUxX3MfLAQ9tjDSWhdBvUoJUg+5ZcLs3esF6CqkdqWOkSp65OuaMkOr/zjboa+1VKi53qrHqUw7tIJrM6NrQgTPFnAG+g=
X-Gm-Message-State: AOJu0YxYsFRJtpdRzrnjriTpLQKyhPejvnAvGHtu5BaZkE1GXrXODJNx
	OBWFy0kRpwRYt/Nl547SeGmYvRgBW/4yOzJcSm/hZhD9EUaUOZvPQeHtt35h7QcFp0Wyvd9q7Cv
	R5t59YhwyiyTSfMB3dZfjzVgACq7E+B5ZsNROzFFbpRXMEJmxwRdS2dQCls76XAg12JxkO5/6
X-Received: by 2002:a05:600c:4f12:b0:414:87f7:993 with SMTP id l18-20020a05600c4f1200b0041487f70993mr3778546wmq.18.1711539387829;
        Wed, 27 Mar 2024 04:36:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoaI2RcIiCdNpX0je8PwOPD9JpIXnrt3S/SZ5jcLd6iuEltl5U9rg4B1z79PM+5huB9YZ5+Q==
X-Received: by 2002:a05:600c:4f12:b0:414:87f7:993 with SMTP id l18-20020a05600c4f1200b0041487f70993mr3778519wmq.18.1711539387433;
        Wed, 27 Mar 2024 04:36:27 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id j28-20020a05600c1c1c00b00414807ef8dfsm1918344wms.5.2024.03.27.04.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 04:36:27 -0700 (PDT)
Date: Wed, 27 Mar 2024 12:36:24 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <ZgQEuNhPF80SkDdW@pollux>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
 <ZgG7TlybSa00cuoy@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZgG7TlybSa00cuoy@boqun-archlinux>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 25, 2024 at 10:58:38AM -0700, Boqun Feng wrote:
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
> > +        let name = unsafe { bindings::dev_name(ptr) };
> > +
> > +        // SAFETY: The name of the device remains valid while it is alive (because the device is
> > +        // never renamed, per the safety requirement of this trait). This is guaranteed to be the
> > +        // case because the reference to `self` outlives the one of the returned `CStr` (enforced
> > +        // by the compiler because of their lifetimes).
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
> 
> At least for this part of abstraction, please do:
> 
> 	#[repr(transparent)]
> 	pub struct Device(Opaque<bindings::device>);
> 
> and impl AlwaysRefCounted for `Device`, use `ARef<Device>` as a wrapper
> of `*mut bindings::device`.

Thanks for pointing this out again, will do.

- Danilo

> 
> Regards,
> Boqun
> 
> > +// SAFETY: `Device` only holds a pointer to a C device, which is safe to be used from any thread.
> > +unsafe impl Send for Device {}
> > +
> > +// SAFETY: `Device` only holds a pointer to a C device, references to which are safe to be used
> > +// from any thread.
> > +unsafe impl Sync for Device {}
> > +
> > +impl Device {
> > +    /// Creates a new device instance.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
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
> > +    }
> >  }
> > -- 
> > 2.44.0
> > 
> 

