Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDE11D524
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Mar 2024 01:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711503543; cv=none; b=fIWenwliBJv4v2cT9ee9m0Y0Q9cL/6f7KBU65bqDwIuXXD/zd2nQWceT8ILxXBzczFFRQdUfAsWKxwNa4RpQPBQldFUu1a/ptX4/wre7ZUCKHH0rF219Y31Q0AeBYCCodztYosoDd09uR1ygLRclekX6ezBUv7K3BuurRSxOl2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711503543; c=relaxed/simple;
	bh=kB/+7YBu0BySc/XBLk71b6sEPpUhtzeYpNh/a96TzMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwzkeDfK7Juee0KiLOtNmC4wBuH3W/VZqha0xxUcz+/gHxQvbCeWB6oQbX4kK4/sQ5lyUQpmj+uAHbBX3PPSDSaqYeJvNEhxKOw6Kgr0XZoNoU2RuGyWjzdzYuhJ5yHtHL/cdZjyqKfdG3lT8iwWwyV4dQ9E0k6B110PshIY00o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSX4xyP6; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSX4xyP6"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-609eb3e5a56so67194777b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 18:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711503540; x=1712108340; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pMgoCIIK5m2JdWatOlb26ZR7/HG1LBCYcoa+ScIW8hM=;
        b=dSX4xyP6tSrd139aHi+hhSYgpafpyDOh9+C45jGL+X86tbqO1IR2ypEqflNCd+fllR
         H/9OeeWbxVBvphVFYbEDveKUGA8nSDlJjLtdsX5S5x3+YCgg2cx3y6xg0W/QWheYtoRg
         8zunHpDK2Kj+1TEUk7/hLLVEdgmgrs9R1HLsPFxjUrejh0iDcujNrm3sAbz21FfvgZ9E
         OyXuV2c51JkAUSM0njbyWiRZXIr+iyi7tFGWjk5FBXSINFc8l5glomidG6mYVrZQYamG
         E2gP7m8ntVWOkBFY8yX+UmOAE/HTXQDxHk7t1gRVTN+t3xrdDx9AfjB8xTB3dVCUmn84
         33eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711503540; x=1712108340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pMgoCIIK5m2JdWatOlb26ZR7/HG1LBCYcoa+ScIW8hM=;
        b=c722vxlNEPKX31feqwSGLZK0Xii6Delma0Fnw4OrihiJaZ59JcvJ4x5zmaul0TIwa6
         8Xaq1IyOLMqM9eXR8Q074jLHxBzLlFMVDEe8Hqd1drPnI0wNfW1FPAKjZShxshxiGcPu
         jj2y6Lce3SjU0t/T3s9LZZFmsyVu4zFoq+3F9v6YhnKM7lSaQO3r0qGh6sc6ASb22Fyr
         bc2PZbT22rO8nm0o48AeUyo6Ct4pu3JRRb9b0EHp/0VdBiV8y4F2MT8Olp2WHC+ZbdVf
         6fWDSQiPYM6QvWSjPilfRteaU6boAJLsVbZ3jB8s/k5V+n2UMA226KvKqwFBUCZ7xgD7
         0KHA==
X-Forwarded-Encrypted: i=1; AJvYcCXpX4LyV4AUOi3s4xtMnGwjYli7m6ZUYNXorQtqv1OiajiT+VmPxj7PoWglUwNA4gcszMhnb32/ftM1iTFFFlJRk8JDJeVxk8xOoYYsB54=
X-Gm-Message-State: AOJu0YxdNi80M6L41matFU22z71xpeG7YkqVmWRicl674wVAkTw/w8dr
	T71v/7ZRKjoxpnwyrL5ymK6NgmdUSTwytDjY1U8RC01jNVPd6J3fJWhZSRTACbw1B4sX4cKzpBn
	Bqc2unzF7Pw7TtVaMHJpMKYuqJOE=
X-Google-Smtp-Source: AGHT+IGT2AL0iuVby10l+J09z7OHSUpfUdzOJXpQLsGzRCQoodGAynrhXEp4QcwV3iugD10rIUhkYQwOxZKPQlfSN6k=
X-Received: by 2002:a81:c306:0:b0:610:c2a5:e2 with SMTP id r6-20020a81c306000000b00610c2a500e2mr4705871ywk.11.1711503540455;
 Tue, 26 Mar 2024 18:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325174924.95899-1-dakr@redhat.com> <20240325174924.95899-4-dakr@redhat.com>
 <2024032518-swampland-chaperone-317b@gregkh>
In-Reply-To: <2024032518-swampland-chaperone-317b@gregkh>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Tue, 26 Mar 2024 22:38:49 -0300
Message-ID: <CANeycqqQjSqA8CK66wyaNnSckr2GNDtfEUv_Tm29WbzAs7Njzg@mail.gmail.com>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@redhat.com>, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, rust-for-linux@vger.kernel.org, x86@kernel.org, 
	lyude@redhat.com, pstanner@redhat.com, ajanulgu@redhat.com, 
	airlied@redhat.com, Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Mar 2024 at 15:17, Greg KH <gregkh@linuxfoundation.org> wrote:
>
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
> > +     return dev_get_drvdata(dev);
> > +}
> > +EXPORT_SYMBOL_GPL(rust_helper_dev_get_drvdata);
> > +
> > +const char *rust_helper_dev_name(const struct device *dev)
> > +{
> > +     return dev_name(dev);
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

This was discussed before:
https://lore.kernel.org/lkml/ZAnB%2FDozWsir1cIE@kroah.com/

I even sent a patch (that Greg applied) that fixes the C comment that
lead to the safety comment above:
https://lore.kernel.org/lkml/20230406045435.19452-1-wedsonaf@gmail.com/

The decision then was to remove the `name` method until some driver
actually needed it. (We had no plans to upstream the one that used it
in the rust branch, pl061 gpio.)

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
>
> thanks,
>
> greg k-h
