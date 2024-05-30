Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F3E3207
	for <rust-for-linux@vger.kernel.org>; Thu, 30 May 2024 06:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051857; cv=none; b=EmX/neJgbvpAOg7bo5WRAnWjIpEy18j7gETu+paDaPirS2AhWYU5fw2gaGLw2Nd0zKzwkTWyWVGGbgrrLaVkDzFAs6kqIylpLYrIKNdedlYgGZZ45y9u/PFyHpFvWZp9DkoueOsWYG/3WcvCyAPno19c/VYG2A7UvFDg7uhCNJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051857; c=relaxed/simple;
	bh=rmhL0kz/m3mgguBfyG4lSNlnZ1074InA3j0e49mgDJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ZW2FfFyeECg0xT9f5S0e05373W3QuB6NCufgbxnV4TLbSiLSIUGxf6O1HL45QDzfibc9Hk1FMEt2xFimSEzMjnLHdXfqFpYJw2cGjUwZ/opEzO4qHBUvsCLnvNv/u5MnykAvPVpVc6bYnwydgmCYSHwMD72i904bgh2L3i60B6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zo/WB0qz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zo/WB0qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717051855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6UhhRx41Z6T54/uX+rvRSIQ4bG3F0Fzy3rQ4r+M7Xw=;
	b=Zo/WB0qzugDH8DHm26NNmeR2ftoDnhFlo6Wv33toMGxVO/OiaHUx4WInW1AaDecsZTEFyI
	FG0oft5YXFF3om1mMH4IL/LFvRSCjDYExOUGIdKUYlqL8hEdmz/QtVFhfUQ6NW/xqYRUZS
	u9LMMijqRl3IPtWmMngQThYW8QrimTM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-0q8z6SAxNhOYpTbFeUJscw-1; Thu, 30 May 2024 02:47:34 -0400
X-MC-Unique: 0q8z6SAxNhOYpTbFeUJscw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3580f213373so430522f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 23:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051648; x=1717656448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6UhhRx41Z6T54/uX+rvRSIQ4bG3F0Fzy3rQ4r+M7Xw=;
        b=LdQKYDPvpJfU7Zeb1Reu+78wZLr5FLB+nXH5aZ6vXVeO5N+MqW4XGl4YJV0R5J1GuY
         yl4flT3ilNGlzAGVkg4CmeCueKGXBRUiHIYkT3i64s69/eYuHfLRt2ngqCa+GxJpS9dB
         O88kMxLJu4y2j5pj2OtKOv07YuGMi2vK33Ren4AkH4+2mek75A73gTz+lUpLZRARdY7S
         YPLFf5xQcOSTEwUHr5eBzp3pF2gdssoIZiQL/XacneavLtKKZRFf0fuuEjK6nOI3S94x
         /TX2s4hdo+DdLD7MpKulJviC3Fy/Hlb8vCaVg3LjiIqhGV5q/LzjLos99Y/WTrkISCiu
         YN7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkAHAkeVKWuY1qCXZc+z2Y65F48k8EVJt2PVZ1zTiaK/DqzPSDkEIPHay0Uivis98/vXh15nMhIF88TiiDBs7aIUiyr4R3Q5OHblt+ESA=
X-Gm-Message-State: AOJu0Yz08fa+xZI21OFATAobpxTVwrCxLX6ZNhQdUccF+Fh0blsjJH10
	Wakp+S1E7i11lEdIxUVyf4WZjLPVnENK1eZgOsBC9FiVBFW/fWclSr7fZzb3UHVX/6iVIzAa5bQ
	ZYQ/ZG1QPeX683lOJWnPEbn3x8mRAqfwXdxDm0GBP7Vo0G/ZlnMndqs1Iot3Q5+kz
X-Received: by 2002:a05:6000:1883:b0:35d:bfa7:5f12 with SMTP id ffacd0b85a97d-35dc0091881mr968717f8f.19.1717051648544;
        Wed, 29 May 2024 23:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2THkDfZkgav7wfIpmSg8axTLOU7esgmVr44vwAJ61wnkwr2ymTrnaq1t0RgEDsR5qCuZd2A==
X-Received: by 2002:a05:6000:1883:b0:35d:bfa7:5f12 with SMTP id ffacd0b85a97d-35dc0091881mr968678f8f.19.1717051648049;
        Wed, 29 May 2024 23:47:28 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7d963sm16775384f8f.21.2024.05.29.23.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 23:47:27 -0700 (PDT)
Date: Thu, 30 May 2024 08:47:25 +0200
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
Message-ID: <Zlgg_Q5y3Q99Ts1s@pollux>
References: <2024052950-purely-sandstone-36c7@gregkh>
 <20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
 <ZlfeA7MEZRv404MO@pollux.localdomain>
 <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240530.132433.2195707766186347550.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 30, 2024 at 01:24:33PM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Thu, 30 May 2024 04:01:39 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > On Thu, May 30, 2024 at 08:28:24AM +0900, FUJITA Tomonori wrote:
> >> Hi,
> >> 
> >> On Wed, 29 May 2024 21:57:03 +0200
> >> Greg KH <gregkh@linuxfoundation.org> wrote:
> >> 
> >> >> For a Rust PHY driver, you know that you have a valid pointer to C's
> >> >> device object of C's PHY device during the probe callback. The driver
> >> >> creates a Rust device object to wrap the C pointer to the C's device
> >> >> object and passes it to the firmware abstractions. The firmware
> >> >> abstractions gets the C's pointer from the Rust object and calls C's
> >> >> function to load firmware, returns the result.
> >> >> 
> >> >> You have concerns about the simple code like the following?
> >> >> 
> >> >> 
> >> >> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> >> >> new file mode 100644
> >> >> index 000000000000..6144437984a9
> >> >> --- /dev/null
> >> >> +++ b/rust/kernel/device.rs
> >> >> @@ -0,0 +1,30 @@
> >> >> +// SPDX-License-Identifier: GPL-2.0
> >> >> +
> >> >> +//! Generic devices that are part of the kernel's driver model.
> >> >> +//!
> >> >> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> >> >> +
> >> >> +use crate::types::Opaque;
> >> >> +
> >> >> +#[repr(transparent)]
> >> >> +pub struct Device(Opaque<bindings::device>);
> >> >> +
> >> >> +impl Device {
> >> >> +    /// Creates a new [`Device`] instance from a raw pointer.
> >> >> +    ///
> >> >> +    /// # Safety
> >> >> +    ///
> >> >> +    /// For the duration of 'a, the pointer must point at a valid `device`.
> >> > 
> >> > If the following rust code does what this comment says, then sure, I'm
> >> > ok with it for now if it helps you all out with stuff like the firmware
> >> > interface for the phy rust code.
> >> 
> >> Great, thanks a lot!
> >> 
> >> Danilo and Wedson, are there any concerns about pushing this patch [1]
> >> for the firmware abstractions?
> > 
> > Well, if everyone is fine with this one I don't see why we can't we go with [1]
> > directly? AFAICS, we'd only need the following fix:
> > 
> > -//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
> > +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> > 
> > [1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/
> 
> The difference is that your patch touches the reference count of a
> struct device. My patch doesn't.
> 
> The following part in your patch allows the rust code to freely play
> with the reference count of a struct device. Your Rust drm driver
> interact with the reference count in a different way than C's drm
> drivers if I understand correctly. I'm not sure that Greg will be
> convinenced with that approach.

I don't see how this is different than what we do in C. If you (for whatever
reason) want to keep a pointer to a struct device you should make sure to
increase the reference count of this device, such that it can't get freed for
the time being.

This is a 1:1 representation of that and conceptually identical.

> 
> +// SAFETY: Instances of `Device` are always ref-counted.
> +unsafe impl crate::types::AlwaysRefCounted for Device {
> +    fn inc_ref(&self) {
> +        // SAFETY: The existence of a shared reference guarantees that the refcount is nonzero.
> +        unsafe { bindings::get_device(self.as_raw()) };
> +    }
> +
> +    unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> +        // SAFETY: The safety requirements guarantee that the refcount is nonzero.
> +        unsafe { bindings::put_device(obj.cast().as_ptr()) }
> +    }
> +}
> 
> The following comments give the impression that Rust abstractions
> wrongly interact with the reference count; callers check out the
> reference counter. Nobody should do that.

No, saying that the caller must ensure that the device "has a non-zero reference
count" is a perfectly valid requirement.

It doensn't mean that the calling code has to peek the actual reference count,
but it means that it must be ensured that while we try to increase the reference
count it can't drop to zero unexpectedly.

Your patch, as a subset of this one, has the same requirements as listed below.

> 
> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count.
> +    pub unsafe fn from_raw(ptr: *mut bindings::device) -> ARef<Self> {
> 
> +    /// Callers must ensure that `ptr` is valid, non-null, and has a non-zero reference count for
> +    /// the entire duration when the returned reference exists.
> +    pub unsafe fn as_ref<'a>(ptr: *mut bindings::device) -> &'a Self {
> +        // SAFETY: Guaranteed by the safety requirements of the function.
> +        unsafe { &*ptr.cast() }
> +    }
> 

