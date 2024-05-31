Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7455C140395
	for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149603; cv=none; b=gEL4YjN+8IxYZr9spxYYKEO0WJev8pEfetV/+nrU3Pk9wKPT/WyQnBQkxi2trBFkWjDzFQeVTBlBD6vM5GjG0ETY6YiGZ3aqnjMV1PSoLbMFa9t/EfgIk7sKkL+ceoTd13HJA5PUBccL0j48i62sZdUh6oh/MML6xGPpRihLQtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149603; c=relaxed/simple;
	bh=LFzBA44iwcReBacIMwkY6YOHssOc1CG0UiXSEbtlzQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=oAFw6Of69jneoBklku5IOmH+Gj7vY+vrREUUR+5t0yuYH5q1Uv8SH8U9iVcPtUfwHpPBUxCEN4WXWW5JkAmTZP05oadukpYHcu5cmyXE27ElqgMzTaWJ25ms3bzS6smvRAR7dInZLoEql+43NDrmsWZUAJ1zRR8FaQX3nu+Wg24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3ocOUhQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3ocOUhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717149600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z2ekAT+HdylEYfyDggX/JisTQjbKg/RFJZ73WI20cAQ=;
	b=I3ocOUhQxDmYwdxJ878RfhdAB1BA3h4WGZOdc7gcHS4xygUvWRlyq+c9KbSCc6tro5xtW/
	zeqWygz1AaZjXEmd/TfbOc5tR7N9PW6Y4WKXGmMN6VJztm44ofNGcOa6+ECzCLcS8HxBM4
	lUp+FcaqWdM9CbhHxnrxOPkvPwmhPO8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-mP52cML5MM2ITFZkJttOJg-1; Fri, 31 May 2024 05:59:58 -0400
X-MC-Unique: mP52cML5MM2ITFZkJttOJg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42120e123beso17634455e9.0
        for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 02:59:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717149592; x=1717754392;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2ekAT+HdylEYfyDggX/JisTQjbKg/RFJZ73WI20cAQ=;
        b=axVQcQpiyVRmSepSPZ9lG72lqEBbx0jTyUcDtsZv4+qYZQqu51Lj/e7VtU+Oqj1zv5
         QSEt1aXmUr2wNJz4qUCPzEo/AeOCIG+EtwuUln7D9k4LSy5TcPp0HRHNPNz3fMn/F8sN
         ypHfqMs9ZQXTatKQp8KRiuz6jMYMox+xWuYz8v/L3v1tdORQJdOBdomyRxM8bgJDnHCd
         /BmVvisMS7nuWZxbHVzoGfzdqcOmS/S5+ZooX0dtXQCgKpSlww0mYWFyDCx/CmIIc7dU
         cngTo2ANRbOrFbn2hizkTrHFhgcKeW68X63GkF074JGeF6a3rW3MW5aVEEAKdzci6wTw
         r1vw==
X-Forwarded-Encrypted: i=1; AJvYcCWdZWEJ/6twzr7kYvN7IsR2JYAO2smTBAisRTfwi2IJR+htGa6aHh8sluwp2jLLKXRDR6mt49hWM6ysNXAv1hlvF7IOAi0fY1D1nJG8dTc=
X-Gm-Message-State: AOJu0Yz+8T3ON96CVblarzEMXZ4OI0Qayng0ovZO0Cq335yT+sDKsoU8
	4O6OJkL4HAExkArkcywgQqufOynJiA+syJutHjjnbvcLVzHRIBwlD8o0gdMC54Wp6xtYTI363Cu
	UF050tK5ozeGHZdBq0S1Tcvbr242pPxT6AEwEvmxq5kP99Bv6CFwgkdlHWktn1/Hg
X-Received: by 2002:a7b:cb4d:0:b0:41b:fa34:9e48 with SMTP id 5b1f17b1804b1-4212e0a52eamr14260105e9.30.1717149592488;
        Fri, 31 May 2024 02:59:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJi89QlpGP04dDoDisBplmOCCPtu2L69G8FLPbczN6kiL/eF0OWVOpZe0h/PK7zHDrNb/nyA==
X-Received: by 2002:a7b:cb4d:0:b0:41b:fa34:9e48 with SMTP id 5b1f17b1804b1-4212e0a52eamr14259805e9.30.1717149591851;
        Fri, 31 May 2024 02:59:51 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42132d5308csm4535325e9.35.2024.05.31.02.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 02:59:50 -0700 (PDT)
Date: Fri, 31 May 2024 11:59:47 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: gregkh@linuxfoundation.org, wedsonaf@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, lina@asahilina.net,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, mcgrof@kernel.org,
	russ.weight@linux.dev
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <Zlmfkws-QjNmFxfr@pollux>
References: <ZlfeA7MEZRv404MO@pollux.localdomain>
 <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
 <Zlgg_Q5y3Q99Ts1s@pollux>
 <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240531.165032.1895479176481879387.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 31, 2024 at 04:50:32PM +0900, FUJITA Tomonori wrote:
> On Thu, 30 May 2024 08:47:25 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> >> >> >> For a Rust PHY driver, you know that you have a valid pointer to C's
> >> >> >> device object of C's PHY device during the probe callback. The driver
> >> >> >> creates a Rust device object to wrap the C pointer to the C's device
> >> >> >> object and passes it to the firmware abstractions. The firmware
> >> >> >> abstractions gets the C's pointer from the Rust object and calls C's
> >> >> >> function to load firmware, returns the result.
> >> >> >> 
> >> >> >> You have concerns about the simple code like the following?
> >> >> >> 
> >> >> >> 
> >> >> >> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> >> >> >> new file mode 100644
> >> >> >> index 000000000000..6144437984a9
> >> >> >> --- /dev/null
> >> >> >> +++ b/rust/kernel/device.rs
> >> >> >> @@ -0,0 +1,30 @@
> >> >> >> +// SPDX-License-Identifier: GPL-2.0
> >> >> >> +
> >> >> >> +//! Generic devices that are part of the kernel's driver model.
> >> >> >> +//!
> >> >> >> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> >> >> >> +
> >> >> >> +use crate::types::Opaque;
> >> >> >> +
> >> >> >> +#[repr(transparent)]
> >> >> >> +pub struct Device(Opaque<bindings::device>);
> >> >> >> +
> >> >> >> +impl Device {
> >> >> >> +    /// Creates a new [`Device`] instance from a raw pointer.
> >> >> >> +    ///
> >> >> >> +    /// # Safety
> >> >> >> +    ///
> >> >> >> +    /// For the duration of 'a, the pointer must point at a valid `device`.
> >> >> > 
> >> >> > If the following rust code does what this comment says, then sure, I'm
> >> >> > ok with it for now if it helps you all out with stuff like the firmware
> >> >> > interface for the phy rust code.
> >> >> 
> >> >> Great, thanks a lot!
> >> >> 
> >> >> Danilo and Wedson, are there any concerns about pushing this patch [1]
> >> >> for the firmware abstractions?
> >> > 
> >> > Well, if everyone is fine with this one I don't see why we can't we go with [1]
> >> > directly? AFAICS, we'd only need the following fix:
> >> > 
> >> > -//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> >> > +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> >> > 
> >> > [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> >> 
> >> The difference is that your patch touches the reference count of a
> >> struct device. My patch doesn't.
> >> 
> >> The following part in your patch allows the rust code to freely play
> >> with the reference count of a struct device. Your Rust drm driver
> >> interact with the reference count in a different way than C's drm
> >> drivers if I understand correctly. I'm not sure that Greg will be
> >> convinenced with that approach.
> > 
> > I don't see how this is different than what we do in C. If you (for whatever
> > reason) want to keep a pointer to a struct device you should make sure to
> > increase the reference count of this device, such that it can't get freed for
> > the time being.
> > 
> > This is a 1:1 representation of that and conceptually identical.
> 
> A drm driver does such? If a drm driver allocates two types of
> driver-specific data and keep a pointer to the pci device, then the
> driver calls get_device() twice to increase the reference count of the
> pci's device?

Think about it more generically. If you store a pointer to a device in some
structure (driver private data, generic subsystem structure, etc.), can you
guarantee that without acquiring a reference that the device' reference count
doesn't drop to zero while your structure is alive?

There are cases where you can't, e.g. with Arc<device::Data>. How do you
guarantee (generically for every driver) the last reference of your device data
is dropped with the driver's remove callback? If we make it the driver's
responsibility to care about this the whole thing is unsafe as in C.

In some cases you can, mostly the ones where you free a structure in the
driver's remove callback. But again, then there is no advantage over what we do
in C. What if you change the lifetime of your structure later on, then you may
introduce a bug.

> 
> At the very least, network device drivers don't. a driver doesn't play
> with the reference count. The network subsystem does. And, the network

A quick 'grep' shows 23 occurrences of get_device() in network drivers.

> subsystem doesn't care about how many pointers to a pci device a
> driver keeps.

If none of the drivers has structures storing a pointer to a pci device that out
live the driver's remove callback that's fine.

> 
> With the patch [1], a driver plays with the reference count of a
> device and directly calls get/put_device. It's a different than C
> drivers for me (not sure about drm subsystem though).

It's not different. Again, when a C driver stores a device pointer in a
structure whose lifetime is not bound a special boundary, like the device remove
callback, it must increase the reference count.

It's just that most of the time we are moving within this boundary and in C we
just rely on that. In Rust we can only get this safe by taking a reference for
every pointer we store. And making it safe to use seems to be the goal.

Generally, the whole point of a reference count is that everyone who owns a
pointer to this shared structure increases / decreases the reference count
accordingly.

> 
> But I might be misunderstanding that Greg isn't convinced with this
> reference count thing. We need to wait for his response.
> 
> 
> >> +// SAFETY: Instances of `Device` are always ref-counted.
> >> +unsafe impl crate::types::AlwaysRefCounted for Device {
> >> +    fn inc_ref(&self) {
> >> +        // SAFETY: The existence of a shared reference guarantees that the refcount is nonzero.
> >> +        unsafe { bindings::get_device(self.as_raw()) };
> >> +    }
> >> +
> >> +    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> >> +        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
> >> +        unsafe { bindings::put_device(obj.cast().as_ptr()) }
> >> +    }
> >> +}
> >> 
> >> The following comments give the impression that Rust abstractions
> >> wrongly interact with the reference count; callers check out the
> >> reference counter. Nobody should do that.
> > 
> > No, saying that the caller must ensure that the device "has a non-zero reference
> > count" is a perfectly valid requirement.
> > 
> > It doensn't mean that the calling code has to peek the actual reference count,
> > but it means that it must be ensured that while we try to increase the reference
> > count it can't drop to zero unexpectedly.
> 
> Yeah, the same requirements but expressed differently.

Well, instead of

"ensure that `ptr` is valid, non-null, and has a non-zero reference count"

you propose

"the pointer must point at a valid `device`".

When I ask you to specify what "pointer to valid device" means, what would be
the answer?

Since we're still discussing this in the thread of the firmware abstraction, if
you have any further concerns, let's discuss them in the thread for the
corresponding patch.

Once we get to a conclusion I can send a series with only the device and firmare
abstractions such that we can get them in outside of the scope of the reset of
both series to get your driver going.

- Danilo

> 
> But again, I might be misunderstanding. Greg might have a different reason.
> 
> > Your patch, as a subset of this one, has the same requirements as listed below.
> > 
> >> 
> >> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
> >> +    pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {
> >> 
> >> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count for
> >> +    /// the entire duration when the returned reference exists.
> >> +    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
> >> +        // SAFETY: Guaranteed by the safety requirements of the function.
> >> +        unsafe { &*ptr.cast() }
> >> +    }
> >> 
> > 
> > 
> 

