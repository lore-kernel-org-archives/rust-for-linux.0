Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC315FD04
	for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 19:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716837544; cv=none; b=bFU9qFGc4LskDbOQ6Fz9ckgelrSX5OyLhqw/Ef+ph/y/vBKGr6aA4sAD0p9NHYgwnKX/xGg3em58MXKjgoJvYNU2yp/9a4kZHu/haMnEyM7G0qNLKWhTtiKqTSVAe5m+Q1Rn4JgA8QvEEe2yxRk2iIE0uVPrx2H0ctj5oGIKoG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716837544; c=relaxed/simple;
	bh=8K8UwX2a/G7wEQqI+myC/Y/9nda/IA+AxaBbgUNKKI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=q2+Qpd/IP7bxb6EKipDTR3N1MnNA21nKJ8y0VxdF0l4N2/IeAuN4xLq+ikDJXtj8pnfIY+9bhal0EpT2JRhgrHb8Ok9gPS4TRjeqNX5908JeCEzu0t06R2XgYdJxmXSsQeujecYT1AwY0PKx0v2HDsHTsMQVwPX4/WV/+7E69/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cIR1WW+C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cIR1WW+C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716837541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=loF/Mw/iiB0HChmBYp73+/pJGWRpuF8gSDZHmx+bf5o=;
	b=cIR1WW+C0Xg1eZQQwja7gfh93oC1X9cJgdG09UH9lLVads6HnxYBI//05HgcnU8ezkCxVZ
	dKPe193zSTP2pIOui+RYS8f6yhN+KliuscqX0nrZL2ge8/ptU9+T9pn4MHi/tMloAmQIpn
	e/WLqgkcRdKiyqYUUY/jMaCUQjDZmU4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-J5yToGhpMomYIHw0ROrNcA-1; Mon, 27 May 2024 15:18:58 -0400
X-MC-Unique: J5yToGhpMomYIHw0ROrNcA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42110d8bf69so145825e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 12:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716837537; x=1717442337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loF/Mw/iiB0HChmBYp73+/pJGWRpuF8gSDZHmx+bf5o=;
        b=PU9WIO5MhWA88strpIoigZ7DzBaT9Ibj1wfCAS3qM9M6vXkqSz+3BXbk/Ur1fpIXm4
         8SWfTP6XTEGOoZaP8zT6URXbyxxcOUHsDGNv2GL17qG1AvGJ5Zm98zgGYzGmrmVYg38j
         MdSUWPobHt4XIlUHmCabJLIUzb8FWjHdEz9t7HyR/aQJN1J8rCZCAPtpky+CHzpyDRxb
         /K2BUk+8VQoIWgvDOQ6rTqouWFyjlD/R2E2DvuD6NfJZMOyrhmZ4geOB/x2t1eIXphs6
         K6/EBkDUiho8zTfLfLuaXLaTG5FI7xEHGmz4tNqDeA2HkWgBOvD+uhqG1gmiTitN9Flz
         0VDw==
X-Forwarded-Encrypted: i=1; AJvYcCV3rhMrGJcgDCo+YA7kU9lwpjxGP2eWE4ujC9AtyRrVk15er5nbIa3d+koqSdiUWnVlPGhqYzHMQrjaMWDjDnAzz0AA03hOsduHIozU5d8=
X-Gm-Message-State: AOJu0Yz+AL2agBikPDnt2F7rvYhILHUpTyHsVPM9TnDttURASo8detb4
	eZo3PKtAjVf4/nh/7BES8UQtm5KrOUD8pB807SLVvL2LTpKouxPKL7IAA/BrGtEyvtDa7xAH6+m
	m727oImiFopDO8CtF5ZZ9YezTtbaaJppv9LsBmEe04AuyxIeGVzxTgOLAWBABgYl9
X-Received: by 2002:a05:600c:4689:b0:41c:258:9b70 with SMTP id 5b1f17b1804b1-42108aa8976mr66428495e9.28.1716837536941;
        Mon, 27 May 2024 12:18:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKHkf3fuR3OotFm1vYpWip60TZra03wLXGfTzr8DfdrTUs58Tc9BX3jnSjZDeprGP/Fk6eoQ==
X-Received: by 2002:a05:600c:4689:b0:41c:258:9b70 with SMTP id 5b1f17b1804b1-42108aa8976mr66428285e9.28.1716837536522;
        Mon, 27 May 2024 12:18:56 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:748f:dc54:236c:b760])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089cc4e2sm118071795e9.39.2024.05.27.12.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 12:18:55 -0700 (PDT)
Date: Mon, 27 May 2024 21:18:53 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Zhi Wang <zhiw@nvidia.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Message-ID: <ZlTcnYNff2EDQJdj@pollux.localdomain>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240521083231.000074c2.zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240521083231.000074c2.zhiw@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 08:32:31AM +0300, Zhi Wang wrote:
> On Mon, 20 May 2024 19:24:19 +0200
> Danilo Krummrich <dakr@redhat.com> wrote:
> 
> > Add an abstraction around the kernels firmware API to request firmware
> > images. The abstraction provides functions to access the firmware
> > buffer and / or copy it to a new buffer allocated with a given
> > allocator backend.
> > 
> 
> Was playing with firmware extractions based on this patch.
> Unfortunately I ended up with a lot of pointer operations, unsafe
> statements.
> 
> As we know many vendors have a C headers for the definitions of the
> firwmare content, the driver extract the data by applying a struct
> pointer on it.
> 
> But in rust, I feel it would nice that we can also have a common
> firmware extractor for drivers, that can wrap the pointer operations,
> take a list of the firmware struct members that converted from C headers
> as the input, offer the driver some common ABI methods to query them.
> Maybe that would ease the pain a lot.

So, you mean some abstraction that takes a list of types, offsets in the
firmware and a reference to the firmware itself and provides references to the
corresponding objects?

I agree it might be helpful to have some common infrastructure for this, but the
operations on it would still be unsafe, since ultimately it involves
dereferencing pointers.

> 
> Thanks,
> Zhi.
> 
> > The firmware is released once the abstraction is dropped.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/bindings/bindings_helper.h |  1 +
> >  rust/kernel/firmware.rs         | 74
> > +++++++++++++++++++++++++++++++++ rust/kernel/lib.rs              |
> > 1 + 3 files changed, 76 insertions(+)
> >  create mode 100644 rust/kernel/firmware.rs
> > 
> > diff --git a/rust/bindings/bindings_helper.h
> > b/rust/bindings/bindings_helper.h index b245db8d5a87..e4ffc47da5ec
> > 100644 --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -14,6 +14,7 @@
> >  #include <kunit/test.h>
> >  #include <linux/errname.h>
> >  #include <linux/ethtool.h>
> > +#include <linux/firmware.h>
> >  #include <linux/jiffies.h>
> >  #include <linux/mdio.h>
> >  #include <linux/pci.h>
> > diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> > new file mode 100644
> > index 000000000000..700504fb3c9c
> > --- /dev/null
> > +++ b/rust/kernel/firmware.rs
> > @@ -0,0 +1,74 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Firmware abstraction
> > +//!
> > +//! C header:
> > [`include/linux/firmware.h`](../../../../include/linux/firmware.h") +
> > +use crate::{bindings, device::Device, error::Error, error::Result,
> > str::CStr, types::Opaque}; +
> > +/// Abstraction around a C firmware struct.
> > +///
> > +/// This is a simple abstraction around the C firmware API. Just
> > like with the C API, firmware can +/// be requested. Once requested
> > the abstraction provides direct access to the firmware buffer as +///
> > `&[u8]`. Alternatively, the firmware can be copied to a new buffer
> > using `Firmware::copy`. The +/// firmware is released once
> > [`Firmware`] is dropped. +/// +/// # Examples
> > +///
> > +/// ```
> > +/// let fw = Firmware::request("path/to/firmware.bin",
> > dev.as_ref())?; +/// driver_load_firmware(fw.data());
> > +/// ```
> > +pub struct Firmware(Opaque<*const bindings::firmware>);
> > +
> > +impl Firmware {
> > +    /// Send a firmware request and wait for it. See also
> > `bindings::request_firmware`.
> > +    pub fn request(name: &CStr, dev: &Device) -> Result<Self> {
> > +        let fw = Opaque::uninit();
> > +
> > +        let ret = unsafe { bindings::request_firmware(fw.get(),
> > name.as_char_ptr(), dev.as_raw()) };
> > +        if ret != 0 {
> > +            return Err(Error::from_errno(ret));
> > +        }
> > +
> > +        Ok(Firmware(fw))
> > +    }
> > +
> > +    /// Send a request for an optional fw module. See also
> > `bindings::request_firmware_nowarn`.
> > +    pub fn request_nowarn(name: &CStr, dev: &Device) -> Result<Self>
> > {
> > +        let fw = Opaque::uninit();
> > +
> > +        let ret = unsafe {
> > +            bindings::firmware_request_nowarn(fw.get(),
> > name.as_char_ptr(), dev.as_raw())
> > +        };
> > +        if ret != 0 {
> > +            return Err(Error::from_errno(ret));
> > +        }
> > +
> > +        Ok(Firmware(fw))
> > +    }
> > +
> > +    /// Returns the size of the requested firmware in bytes.
> > +    pub fn size(&self) -> usize {
> > +        unsafe { (*(*self.0.get())).size }
> > +    }
> > +
> > +    /// Returns the requested firmware as `&[u8]`.
> > +    pub fn data(&self) -> &[u8] {
> > +        unsafe {
> > core::slice::from_raw_parts((*(*self.0.get())).data, self.size()) }
> > +    }
> > +}
> > +
> > +impl Drop for Firmware {
> > +    fn drop(&mut self) {
> > +        unsafe { bindings::release_firmware(*self.0.get()) };
> > +    }
> > +}
> > +
> > +// SAFETY: `Firmware` only holds a pointer to a C firmware struct,
> > which is safe to be used from any +// thread.
> > +unsafe impl Send for Firmware {}
> > +
> > +// SAFETY: `Firmware` only holds a pointer to a C firmware struct,
> > references to which are safe to +// be used from any thread.
> > +unsafe impl Sync for Firmware {}
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index 6415968ee3b8..ed97d131661a 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -35,6 +35,7 @@
> >  #[cfg(CONFIG_DRM = "y")]
> >  pub mod drm;
> >  pub mod error;
> > +pub mod firmware;
> >  pub mod init;
> >  pub mod ioctl;
> >  #[cfg(CONFIG_KUNIT)]
> 

