Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8621C287
	for <rust-for-linux@vger.kernel.org>; Thu, 30 May 2024 02:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717034515; cv=none; b=tVqbFtRIBnFWKDoWz65oQBxacqwIv9Sc/KEoWlagIKGi+tGkPTwsQPsS14cM5EGpSyPS95qyq+xo1vz4PAsssNhTBvdDPxZFMU3K0aLmz2+Q7sJDisYyBjHKU95oOCBs6Ub478VP+5O4lA5rwv1P3ahXO7PRqDNLzxtzVhj7rv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717034515; c=relaxed/simple;
	bh=4wMgk4I87EJBdAoT81JZYe0IEAH2P1wMakFxXHL0TX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GMQFXSXcP0FX+x12c9PQieNRbifGKKyCwOOtf4/n2NZ5WyGuW86znqmHdK8vkErijLIpKOnj5Levd/HNQdmLN9DIMlc9Ar14gUlS7wYg9DTIHjBVEy7KHXl66imxNIzV7ZrzHgzv7CQxG9zrVefQ2tsnPEiTlHi+xWBgg8rnfYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X19tGEy4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X19tGEy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717034512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=55UuKSwYXJi7adh0NBI3TuBTOOEtGh+oD29onBT0shk=;
	b=X19tGEy4vX2JppfwuI6LPlqTZMkce4egPEZmcodbnF5+xvQHGrtblDClY7VrWQh/4ZhWDn
	x3oY+a1FnjGDGeApY716+/uCKK0q50yWTbjgEe1lYwrSX+cxKCTOeU3znnNfLR5WGKXRNC
	FP2lNvkGTayzREGDpONUqy0a/lF0NDo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-pxGq_hV6PkyL6hu9DB5CIg-1; Wed, 29 May 2024 22:01:51 -0400
X-MC-Unique: pxGq_hV6PkyL6hu9DB5CIg-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42128f7b5fbso422105e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 19:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717034505; x=1717639305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55UuKSwYXJi7adh0NBI3TuBTOOEtGh+oD29onBT0shk=;
        b=KlSL6so7ZsqyAGchEdXrvTMyuR+ISXhOxqdRfioXCxxhORnPYffhGiAeKXkI8mpKe/
         73VIAOx1jXGZEWehj8qzbAZ0Fnqt/mmRdJA0yYJxFrCxzxnCMu1bOMSaKYI7cngwIFEe
         VEWbkOKdIHZ+UQ5ItGIAmNMsHW58YfV9Z1jDlpyefCYkIvFa8aQO66VUe/nD9BQYYFuH
         ONn2xwJHQ8pEiVnbYCNbA+fGZkusnAX4xtaaIkBoQ/rxwI5m+3zyKRD3aXYJ0ha6fc8u
         2NNSh6v6u4vcBYa7L4vtEXjI5gsH1uK6hNo85znzTLZTZ529WBGm8HvBRH4PQCOKMU0x
         m4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVlHZnxS+ZOZwOz3XqPAqQjKAR4JqNZXGFFXDwrJezr4P9gQ451p84emWYLxI/ehY1+SPwOpodyBFikXTNyip2S4atBE4zL6dz3E2K9Eng=
X-Gm-Message-State: AOJu0YyMvrX9zPqC7X6Sbr4aEEsbBB3ccaxskw3JhN09vfaMfvSl3n6o
	OSUCwzuG/eNzWEw6lilglxO/TEU6g65YPTtgpSYLpmqwtfKHk87LWgcV/2/BT5VXFQrlTRJTy3e
	1eKiOOF+nJN2BDMYUAc/w56WUypTM36Se1vunLayetQRQLVFwqUNPLCKmh++Af8Bo
X-Received: by 2002:a05:600c:3115:b0:41a:ff7d:2473 with SMTP id 5b1f17b1804b1-4212780a8f6mr10011055e9.4.1717034504945;
        Wed, 29 May 2024 19:01:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFm/RlXxCoTw+3/Eu3ygBcOVuc3izz16ZIvvwzqDoOJ+khErysmUe9W6T4HYOjHGaZFHaGekQ==
X-Received: by 2002:a05:600c:3115:b0:41a:ff7d:2473 with SMTP id 5b1f17b1804b1-4212780a8f6mr10010795e9.4.1717034504440;
        Wed, 29 May 2024 19:01:44 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:2c63:6b4d:717b:4982])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212708a6d6sm9547005e9.43.2024.05.29.19.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 19:01:43 -0700 (PDT)
Date: Thu, 30 May 2024 04:01:39 +0200
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
Message-ID: <ZlfeA7MEZRv404MO@pollux.localdomain>
References: <2024052816-makeshift-irrigate-cef5@gregkh>
 <20240529.092821.1593412345609718860.fujita.tomonori@gmail.com>
 <2024052950-purely-sandstone-36c7@gregkh>
 <20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240530.082824.289365952172442399.fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 30, 2024 at 08:28:24AM +0900, FUJITA Tomonori wrote:
> Hi,
> 
> On Wed, 29 May 2024 21:57:03 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> >> For a Rust PHY driver, you know that you have a valid pointer to C's
> >> device object of C's PHY device during the probe callback. The driver
> >> creates a Rust device object to wrap the C pointer to the C's device
> >> object and passes it to the firmware abstractions. The firmware
> >> abstractions gets the C's pointer from the Rust object and calls C's
> >> function to load firmware, returns the result.
> >> 
> >> You have concerns about the simple code like the following?
> >> 
> >> 
> >> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> >> new file mode 100644
> >> index 000000000000..6144437984a9
> >> --- /dev/null
> >> +++ b/rust/kernel/device.rs
> >> @@ -0,0 +1,30 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +
> >> +//! Generic devices that are part of the kernel's driver model.
> >> +//!
> >> +//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)
> >> +
> >> +use crate::types::Opaque;
> >> +
> >> +#[repr(transparent)]
> >> +pub struct Device(Opaque<bindings::device>);
> >> +
> >> +impl Device {
> >> +    /// Creates a new [`Device`] instance from a raw pointer.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// For the duration of 'a, the pointer must point at a valid `device`.
> > 
> > If the following rust code does what this comment says, then sure, I'm
> > ok with it for now if it helps you all out with stuff like the firmware
> > interface for the phy rust code.
> 
> Great, thanks a lot!
> 
> Danilo and Wedson, are there any concerns about pushing this patch [1]
> for the firmware abstractions?

Well, if everyone is fine with this one I don't see why we can't we go with [1]
directly? AFAICS, we'd only need the following fix:

-//! C header: [`include/linux/device.h`](../../../../include/linux/device.h)
+//! C header: [`include/linux/device.h`](srctree/include/linux/device.h)

[1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-2-dakr@redhat.com/

> 
> I you prefer to be the author of the patch, please let me know. Who
> the author is doesn't matter to me. Otherwise, I'll add
> Co-developed-by tag.
> 
> [1] https://lore.kernel.org/rust-for-linux/20240529.092821.1593412345609718860.fujita.tomonori@gmail.com/
> 

