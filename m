Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C821FF1AB
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Feb 2025 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738575155; cv=none; b=jOw6qSbkevrW/zLCTvTQDNlJhaqAqu58W7WqNT8HDzAdKcc0HqsAZuGdFqMIxyPvb5AavY4CmTaLr2gCbBm8/XlJEElH0TzVZXsE/EGFL0ix/GR7a2WPIT2hoHyWVqi4as6hv7M94U8E2MmVYO1N3lZOSn09Z5n5LgDmEhyQ0Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738575155; c=relaxed/simple;
	bh=tHeNzsPP5pqjXoE6hN8s4deC/sNuvZhZRHQmcbXY9/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQKYCgxFu3IB3n+ZyLVph8Kn/NXLcbc1kP9zAL7TVYshkaiuppSTMolqx7qQfEuzrtZgt1JRgpvQyTeIYuwkRC0A+aNfezhxqIKw4AoTi6qjwrueSNmiSHSBY7vC9tryza0nVKHiEiL+DJ6SaXJ+OzxYMFIlV8Gaj0EIHt3CLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uPMPPCa5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uPMPPCa5"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361c705434so30263405e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Feb 2025 01:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738575152; x=1739179952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrYBjepLttts43wmKj/MYk2WDjZApOA0ZfEIn34BDXg=;
        b=uPMPPCa5Vhkkj4tG0vA9eLNvBGWyomW6rcCWPoqs3LeYDBRG9szNM9nwYqysekFJzl
         cabqWl6R0FB/GGhYgduVXx5+O7pzVnSPUE6k1HPyLWc5vSqR3iIOxc9aFaxL1bp3jX9+
         luLzYnLpCGMmm2sRI3N1QcXHcdZxdEZBWMEWrsySKXImM81qtQr0febAGQmJW5Zkm2g0
         UykVO0u7dBFSpnhR9ompff4bMbW3XefD0I3fsqyAC3qVlNZhIYGKj7hqogkVLix7X4P8
         gJimkaO+Q5SG8aXQKTKExPWfF8bjSCESN/o9JkqGPZKpJRyGgmKGyG2hPsm/jo2foIdN
         /1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575152; x=1739179952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrYBjepLttts43wmKj/MYk2WDjZApOA0ZfEIn34BDXg=;
        b=WfIe1ELjAG6msKJ5rEOALkyN9j/CpXeGXBB5MxJLRwz9F+NTYDLtTFxlDFFMtc9JuP
         RT9nkgiggEvvJy0CtuLoIxHRbOGI0vGMuXs0/mCGjvOCLrSGYNCAS9spYN5ojG1BEMCS
         7S6rjMpYhaQMyzuvIjbkCtJNTfSdtIEOHYX6xWNhirV7LTDnwiZrK3tNrBSl8vpDL7Lr
         MiONYrfwPie0ad+GOElCnytTZpiDusTzkmtMSpW7FGyJquKIJwL1lucfjBTGcAxOCTNR
         yv0eAfFVN6H130seFShjRxaOblnIlmZ9O6UMGgDuVIip8/sPj/c4RXd2HjyYlaupqg90
         zY3w==
X-Forwarded-Encrypted: i=1; AJvYcCXqXOdf4eSW/84xzILEjmQkNNzvNX44nfXhHsfzDLOX41HgX8Xxu0mSEGRpjX73koXm8gtOEwh/FOwp17aihA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZzdLd4gNbMKJOO1dmZ9ciU5Cdtf9uU7yRlmzzQ3TotuPf4Vi
	p8JIZpW/5TteW8Fwj/BR6miEtEnMevuNqAXoPnyeHOAx+fmHxT9wKrgHcFXXURFO9vpC7pVApo/
	ZZ/TnPYyvtvFxT1AfmEb+8CnwhhhI4kfDXago
X-Gm-Gg: ASbGncuW7HUXvYZpITXkPTmf5/pP9nkguiUNSVbb7gZTEDVf3Z9acCwWg6d481ePyuh
	i1YGDf/iqRNJ2iGNV+8GxOJ8PFeDAtcW7XsgVl1j5rjljqBHdq5CgT8fh3wHPdlbdOntkDG0/Xk
	OdhFz41APbBSvJWoc+8NWJF+1F
X-Google-Smtp-Source: AGHT+IEPOyVPZQUNY0BD8dcY972kpjgVEpIOCaVoZTGD0Z4lhAQzI0DbFE8z1emthp5xKKrsgHdBFrStIjH33NSco+o=
X-Received: by 2002:a05:600c:138f:b0:434:f1e9:afae with SMTP id
 5b1f17b1804b1-438dc3aa785mr152784995e9.1.1738575152049; Mon, 03 Feb 2025
 01:32:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130220529.665896-1-daniel.almeida@collabora.com> <20250130220529.665896-3-daniel.almeida@collabora.com>
In-Reply-To: <20250130220529.665896-3-daniel.almeida@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:32:19 +0100
X-Gm-Features: AWEUYZlRzjKzAy1qfsG7-6ppCOGlMXmjKZybC1DCrZZOTMMhoUFZyu1SCCCeYE0
Message-ID: <CAH5fLgi5bQgztdxm2Ly-Bdp_W=f+xEdyQX+=y-mQ=d2h+FMhHQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] rust: io: mem: add a generic iomem abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.mco, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, boris.brezillon@collabora.com, 
	robh@kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 11:14=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Add a generic iomem abstraction to safely read and write ioremapped
> regions.
>
> The reads and writes are done through IoRaw, and are thus checked either
> at compile-time, if the size of the region is known at that point, or at
> runtime otherwise.
>
> Non-exclusive access to the underlying memory region is made possible to
> cater to cases where overlapped regions are unavoidable.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/io.rs     |   1 +
>  rust/kernel/io/mem.rs | 125 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 126 insertions(+)
>  create mode 100644 rust/kernel/io/mem.rs
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index 566d8b177e01..9ce3482b5ecd 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -7,6 +7,7 @@
>  use crate::error::{code::EINVAL, Result};
>  use crate::{bindings, build_assert};
>
> +pub mod mem;
>  pub mod resource;
>
>  /// Raw representation of an MMIO region.
> diff --git a/rust/kernel/io/mem.rs b/rust/kernel/io/mem.rs
> new file mode 100644
> index 000000000000..f87433ed858e
> --- /dev/null
> +++ b/rust/kernel/io/mem.rs
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Generic memory-mapped IO.
> +
> +use core::ops::Deref;
> +
> +use crate::device::Device;
> +use crate::devres::Devres;
> +use crate::io::resource::Region;
> +use crate::io::resource::Resource;
> +use crate::io::Io;
> +use crate::io::IoRaw;
> +use crate::prelude::*;
> +
> +/// An exclusive memory-mapped IO region.
> +///
> +/// # Invariants
> +///
> +/// - ExclusiveIoMem has exclusive access to the underlying `iomem`.
> +pub struct ExclusiveIoMem<const SIZE: usize> {
> +    /// The region abstraction. This represents exclusive access to the
> +    /// range represented by the underlying `iomem`.
> +    ///
> +    /// It's placed first to ensure that the region is released before i=
t is
> +    /// unmapped as a result of the drop order.
> +    #[allow(dead_code)]
> +    region: Region,

Instead of #[allow(dead_code)], I would prefix the name with an
underscore and comment that you hold on to it only for ownership.

> +    /// The underlying `IoMem` instance.
> +    iomem: IoMem<SIZE>,
> +}
> +
> +impl<const SIZE: usize> ExclusiveIoMem<SIZE> {
> +    /// Creates a new `ExclusiveIoMem` instance.
> +    pub(crate) fn ioremap(resource: &Resource) -> Result<Self> {
> +        let iomem =3D IoMem::ioremap(resource)?;
> +
> +        let start =3D resource.start();
> +        let size =3D resource.size();
> +        let name =3D resource.name();
> +
> +        let region =3D resource
> +            .request_mem_region(start, size, name)
> +            .ok_or(EBUSY)?;
> +
> +        let iomem =3D ExclusiveIoMem { iomem, region };
> +
> +        Ok(iomem)
> +    }
> +
> +    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<De=
vres<Self>> {
> +        let iomem =3D Self::ioremap(resource)?;
> +        let devres =3D Devres::new(device, iomem, GFP_KERNEL)?;
> +
> +        Ok(devres)
> +    }
> +}
> +
> +impl<const SIZE: usize> Deref for ExclusiveIoMem<SIZE> {
> +    type Target =3D Io<SIZE>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        &*self.iomem
> +    }
> +}
> +
> +/// A generic memory-mapped IO region.
> +///
> +/// Accesses to the underlying region is checked either at compile time,=
 if the
> +/// region's size is known at that point, or at runtime otherwise.
> +///
> +/// # Invariants
> +///
> +/// `IoMem` always holds an `IoRaw` inststance that holds a valid pointe=
r to the

typo: instance

> +/// start of the I/O memory mapped region.
> +pub struct IoMem<const SIZE: usize =3D 0> {
> +    io: IoRaw<SIZE>,
> +}
> +
> +impl<const SIZE: usize> IoMem<SIZE> {
> +    fn ioremap(resource: &Resource) -> Result<Self> {
> +        let size =3D resource.size();
> +        if size =3D=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let res_start =3D resource.start();
> +
> +        // SAFETY:
> +        // - `res_start` and `size` are read from a presumably valid `st=
ruct resource`.
> +        // - `size` is known not to be zero at this point.
> +        let addr =3D unsafe { bindings::ioremap(res_start, size as kerne=
l::ffi::c_ulong) };

Once you rebase on v6.14-rc1 this cast is no longer necessary.

> +        if addr.is_null() {
> +            return Err(ENOMEM);
> +        }
> +
> +        let io =3D IoRaw::new(addr as usize, size as usize)?;

Ditto here. Though isn't usize the wrong type for `addr`? Shouldn't
you have a type alias for phys_addr_t?

> +        let io =3D IoMem { io };
> +
> +        Ok(io)
> +    }
> +
> +    /// Creates a new `IoMem` instance.
> +    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<De=
vres<Self>> {
> +        let io =3D Self::ioremap(resource)?;
> +        let devres =3D Devres::new(device, io, GFP_KERNEL)?;
> +
> +        Ok(devres)
> +    }
> +}
> +
> +impl<const SIZE: usize> Drop for IoMem<SIZE> {
> +    fn drop(&mut self) {
> +        // SAFETY: Safe as by the invariant of `Io`.
> +        unsafe { bindings::iounmap(self.io.addr() as *mut core::ffi::c_v=
oid) }

Hmm ... void pointer? I wonder whether IoRaw should store this as a
pointer instead of an integer?

Alice

> +    }
> +}
> +
> +impl<const SIZE: usize> Deref for IoMem<SIZE> {
> +    type Target =3D Io<SIZE>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Safe as by the invariant of `IoMem`.
> +        unsafe { Io::from_raw(&self.io) }
> +    }
> +}
> --
> 2.48.0
>
