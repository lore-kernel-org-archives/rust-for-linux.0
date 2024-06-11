Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D1017CA1B
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Jun 2024 13:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718112876; cv=none; b=nrv9KlBwL0rC/9BebFYgHprNXKAN73cpx4O1+4z7Jt63Nkos5jHmKUBeMi2iMQxfZTQG2ZFGaf7AUXDa29F9OGoWNwTC+/i+gaf6hL2b3JhOqZsyjEdvVw6+ASB1L+6EE81MIzVOwP/Z8PCQ3qpBkWFSRQVrTepm25ytKacfG9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718112876; c=relaxed/simple;
	bh=fMnXH3P0sY84oJ2i2VipVV01IJMpLfSoDJiUvYvQfns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UfW0uZq70Et7rCvB5mZokBowVvLmotJjwLsG8uo4OTZExt7rUB2lypqD7O8v6VrAMlserpkpJ6b3Kt4ConVfOkmMPnnmaWGG/p+Rt+BioqUh2eluG65s2y6NBxMZR1Hyjjhe0uZsSYd+PiOPG2GCoGWbr8krtalsyGQ2SK+MywI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RAJ7JzzM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RAJ7JzzM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718112873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zlFqDsmpxiQwCMlRn4XZlM9/t+MHExO4t8nH/Whd6bg=;
	b=RAJ7JzzMsTu72t6pqihU4sARVmtkMOgTX3tkMZoubgQbX4Tw7Iox/l7jlCOeAckLoJafPw
	yCesIIXQSXZZJEmM1GpngNM66Ct0K+TxGftd0PhOmjehNltqs4KX0Bdz1xb1u7gKMIW2CN
	D8gcm2eBjja0r79lkghhEtRU9+T2bTU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-M59nwCaAMKe31cVcbf4m_A-1; Tue, 11 Jun 2024 09:34:27 -0400
X-MC-Unique: M59nwCaAMKe31cVcbf4m_A-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-35f2730d114so1287964f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jun 2024 06:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718112866; x=1718717666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlFqDsmpxiQwCMlRn4XZlM9/t+MHExO4t8nH/Whd6bg=;
        b=VgvWL/QSWt+3/H15VP0F64Oq4IpskTjY7FXLYyAKix1k1hTst85jqoUE3bC16i7xr8
         jOU40DzoxUO6/Zp4U7ddGEMaIomw8WTAtpq9qACeEQukMNBjApU/kqS9/B7KOf3kNsrn
         I6C/1rv+v6V3L9tY3i0RPUvzvTvQnKHIkw7LjdG+jfkMO5OLikw46IE6iHbWZc0lghRJ
         krdpOS8dcycTxEoSCsr9jfOTkWM/iouj9mUMGbFa89CD8dvcG2rhfbNrIurXlhVRDCgj
         RTDjnTOHbNtJNy56ChhB93BmY7M8ScMsA+MYOzWxsD2N7D34EFiYEssCAc9tZaPPBB2h
         /VLA==
X-Forwarded-Encrypted: i=1; AJvYcCV9exWAcCU0cMUOuwZtYfND2WZ7L3aqKrYEtnP+uZLXlms35Od7WBljc9IhoWc8KbX5iQkPxbjRR6aQL+MurfLgWItbXc66ewQhRnXf9UY=
X-Gm-Message-State: AOJu0YwfYyvpe7w1/CDeXLqm27/EVQ1NFCVynHaxZMGYSw6+HacwrE4P
	LWr0lJH4mKOLy7Napc5uRl8pZtXZ52MtS2PZGzRdUbyHKsetUOnGa/TdUh4cLmDl5yc/AErpM08
	xn7RSLBjGflBnx3+p6LNeIYAW5d6iZB9A6TeiszdKlvUxnKRUxiGOlHQ9IKniAWBR
X-Received: by 2002:a5d:4bcf:0:b0:35f:1d1a:11c0 with SMTP id ffacd0b85a97d-35f2b27ed29mr2421732f8f.12.1718112866101;
        Tue, 11 Jun 2024 06:34:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtvsdbGvd3XwP/XQg2ucbgKXsN6X7Gi981zQpTfdDMs0qq8PbLVMYy8FUi4ZtzUR3cJqEqzg==
X-Received: by 2002:a5d:4bcf:0:b0:35f:1d1a:11c0 with SMTP id ffacd0b85a97d-35f2b27ed29mr2421709f8f.12.1718112865674;
        Tue, 11 Jun 2024 06:34:25 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d2e73dsm14053708f8f.16.2024.06.11.06.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 06:34:25 -0700 (PDT)
Date: Tue, 11 Jun 2024 15:34:22 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, mcgrof@kernel.org, russell.h.weight@intel.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, airlied@gmail.com, fujita.tomonori@gmail.com,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rust: add firmware abstractions
Message-ID: <ZmhSXuO_hmV8Tmjx@pollux>
References: <20240610180318.72152-1-dakr@redhat.com>
 <20240610180318.72152-3-dakr@redhat.com>
 <2024061128-provolone-coyness-1d3c@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024061128-provolone-coyness-1d3c@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 11, 2024 at 08:31:46AM +0200, Greg KH wrote:
> On Mon, Jun 10, 2024 at 08:02:28PM +0200, Danilo Krummrich wrote:
> > Add an abstraction around the kernels firmware API to request firmware
> > images. The abstraction provides functions to access the firmware's size
> > and backing buffer.
> > 
> > The firmware is released once the abstraction instance is dropped.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/kernel/firmware.rs         | 107 ++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs              |   1 +
> >  3 files changed, 109 insertions(+)
> >  create mode 100644 rust/kernel/firmware.rs
> > 
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
> > index 000000000000..7ff4c325f670
> > --- /dev/null
> > +++ b/rust/kernel/firmware.rs
> > @@ -0,0 +1,107 @@
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
> > +/// use kernel::firmware::Firmware;
> > +///
> > +/// let fw = Firmware::request("path/to/firmware.bin", dev.as_ref())?;
> > +/// driver_load_firmware(fw.data());
> > +/// ```
> > +pub struct Firmware(NonNull<bindings::firmware>);
> > +
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
> 
> How does this handle when CONFIG_FW_LOADER is not enabled?  Why are you
> building these bindings if that option is not checked?

Good catch, gonna fix it.

> 
> > +
> > +    /// Send a request for an optional firmware module. See also
> > +    /// `bindings::firmware_request_nowarn`.
> > +    pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self> {
> > +        Self::request_internal(name, dev, bindings::firmware_request_nowarn)
> > +    }
> > +
> > +    /// Send a request for a firmware with platform-fw fallback. See also
> > +    /// `bindings::firmware_request_platform`.
> > +    pub fn request_platform(name: &CStr, dev: &Device) -> Result<Self> {
> > +        Self::request_internal(name, dev, bindings::firmware_request_platform)
> > +    }
> > +
> > +    /// Send a request for a firmware directly without usermode helper. See also
> > +    /// `bindings::request_firmware_direct`.
> > +    pub fn request_direct(name: &CStr, dev: &Device) -> Result<Self> {
> > +        Self::request_internal(name, dev, bindings::request_firmware_direct)
> > +    }
> 
> Why just these variants?  Why not just add the ones that people actually
> need instead of a random assortment like you choose here :)

Indeed seems a bit random, not entirely though. I chose `request_firmware` and
`firmware_request_nowarn` since those are the ones we need in Nova, maybe we can
switch some calls to `request_firmware_into_buf` in the future, once we got the
allocator API in place.

I added `firmware_request_platform` and `request_firmware_direct` as well, since
they share the same function signature as the ones mentioned above and hence all
four of them share the same implementation through `Firmware::request_internal`,
just passing a different function pointer.

If you prefer I can drop the latter for now though.

- Danilo

> 
> thanks,
> 
> greg k-h
> 

