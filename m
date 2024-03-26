Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCE71B28D
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Mar 2024 18:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711476230; cv=none; b=X/LGdjem3TGz+/eTjJSyWnTj00MOzmoxcQSNGNSpk0r4yUrZv8v6pjWLAx86jId1t4PJIkYhSMBNsub7RewFoCBsBGH1wfsmZEF//RDrS/4gZxuG6HfWCNBxNY5uG9VYH+c7yIb5+Lo51V6pVXgWeJ7DGzi8FbgOZ8tmB1aA6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711476230; c=relaxed/simple;
	bh=qgK+5AocEEUwDEWu0NSCm6BsSlkuym1oinF9fcTTz+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBuHGTD2/LozIO/z6ADBadegibepq3Okr+Kbwn963u4OPrX+crgA38U0XczWdHVk5039CpxFz/AQAP1cPa9xakeQuW6eSAz+anzyc03rWT9pyllE/maL5yWwM+piGEVSSjae1QLXWECy9bhX3n0MbUBzY7p/yO/KwNoitgEp6Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=p9htoJpb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="p9htoJpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7738FC433F1;
	Tue, 26 Mar 2024 18:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711476230;
	bh=qgK+5AocEEUwDEWu0NSCm6BsSlkuym1oinF9fcTTz+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9htoJpb+ISEuDmkZUofF0Sh0E3eeceGn86OhhZDc1d8+x80oF0adr7d+4dOrIsc0
	 n2B/YlrQosDsfU3V7gsXDiS13zo4HdX0nBbxLS6BWKGbo6IuUqEFUu0eaVBbS9yv8h
	 OQHCvnG8SleqVknzKyIETlT4/kJoy5KU9C30KDnc=
Date: Tue, 26 Mar 2024 19:03:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 3/8] rust: device: Add a stub abstraction for devices
Message-ID: <2024032607-sheath-headlock-1fb2@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-4-dakr@redhat.com>
 <2024032518-swampland-chaperone-317b@gregkh>
 <ZgLxcXTw3awyW7cH@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgLxcXTw3awyW7cH@pollux>

On Tue, Mar 26, 2024 at 05:01:53PM +0100, Danilo Krummrich wrote:
> On Mon, Mar 25, 2024 at 07:17:46PM +0100, Greg KH wrote:
> > On Mon, Mar 25, 2024 at 06:49:07PM +0100, Danilo Krummrich wrote:
> > > +        let name = unsafe { bindings::dev_name(ptr) };
> > > +
> > > +        // SAFETY: The name of the device remains valid while it is alive (because the device is
> > > +        // never renamed, per the safety requirement of this trait). This is guaranteed to be the
> > > +        // case because the reference to `self` outlives the one of the returned `CStr` (enforced
> > > +        // by the compiler because of their lifetimes).
> > 
> > devices are renamed all the time, I don't understand how this can be
> > true here.
> 
> As the comment says, it's the safety requirement of this trait, which is
> documented in the DOC comment of trait RawDevice. Admittedly, it's not obvious,
> since the comment isn't part of this diff and was introduced in the previous
> commit "rust: device: Add a minimal RawDevice trait". Maybe we should move it to
> this commit then.
> 
> It says: "Additionally, implementers must ensure that the device is never
> renamed. Commit a5462516aa99 ("driver-core: document restrictions on
> device_rename()") has details on why `device_rename` should not be used."

Yes, I agree it should not be used, but that's different from you saying
"this is safe as the device will never be renamed" which is not true
unless you somehow prevent that from ever happening on a pointer that
the rust code gets here.  How can you do that?

And why the issue if the device is renamed (other than the documented
ones), why is the rust code here special in this way?

> > > +
> > > +impl Device {
> > > +    /// Creates a new device instance.
> > > +    ///
> > > +    /// # Safety
> > > +    ///
> > > +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
> > 
> > device pointers are NULL all the time, you better be able to handle this
> > otherwise it's not going to go well :(
> 
> You mean as in check for NULL and return an error in case? I wouldn't see much
> value in that.
> 
> I think the only places where we call this are the ones where the C side already
> guarantees that the raw device pointer is valid, e.g. probe() or remove()
> callbacks.

If that's true, then that's fine, but say that, and perhaps test for it
if you are going to guarantee it.  Otherwise we have many places in the
kernel where device pointers are NULL and code needs to handle it in
general when dealing with device pointers for other types of usages.

> > > +    pub unsafe fn new(ptr: *mut bindings::device) -> Self {
> > > +        // SAFETY: By the safety requirements, ptr is valid and its refcounted will be incremented.
> > > +        unsafe { bindings::get_device(ptr) };
> > > +        // INVARIANT: The safety requirements satisfy all but one invariant, which is that `self`
> > > +        // owns a reference. This is satisfied by the call to `get_device` above.
> > > +        Self { ptr }
> > > +    }
> > > +
> > > +    /// Creates a new device instance from an existing [`RawDevice`] instance.
> > > +    pub fn from_dev(dev: &dyn RawDevice) -> Self {
> > > +        // SAFETY: The requirements are satisfied by the existence of `RawDevice` and its safety
> > > +        // requirements.
> > > +        unsafe { Self::new(dev.raw_device()) }
> > > +    }
> > > +}
> > > +
> > > +// SAFETY: The device returned by `raw_device` is the one for which we hold a reference.
> > > +unsafe impl RawDevice for Device {
> > > +    fn raw_device(&self) -> *mut bindings::device {
> > > +        self.ptr
> > > +    }
> > > +}
> > > +
> > > +impl Drop for Device {
> > > +    fn drop(&mut self) {
> > > +        // SAFETY: By the type invariants, we know that `self` owns a reference, so it is safe to
> > > +        // relinquish it now.
> > > +        unsafe { bindings::put_device(self.ptr) };
> > > +    }
> > > +}
> > > +
> > > +impl Clone for Device {
> > > +    fn clone(&self) -> Self {
> > > +        Self::from_dev(self)
> > 
> > Does this increment the reference count?
> 
> Yes, it does. from_dev() calls new() and new() calls get_device() again.

Ok, but why would you ever allow a device structure to be cloned?
That's not something that should ever happen, once it is created, it is
the ONLY instance of that structure around, and it can't be changed, as
you passed it off to be handled by the driver core, and the driver core
is the one that handles the lifetime of the object, NOT the bus or the
driver that happens to bind to it.

I've been worried about how the interaction between the driver core and
rust code is going to handle structure lifetime rules.  You need to be
very careful here with what you do.  Rust code can create these
structures, but once they are passed to the driver core, you lose the
ability to control them and have to allow the driver core to manage
them, as that's its job, not the rust code.

thanks,

greg k-h
