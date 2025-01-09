Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04369218E87
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 13:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430843; cv=none; b=Wz4scLIiwLpy3Br5DQwFmCVnmdP1sDLNMwOsh66pX/QMSx0q6Bw6or3kR3zT0SC3eUsK0jycXmyC46Wk+jJdCD/Lhr6QZPGUVmxs+6ebyhI2zIcLhgCscM/+FA/BmfpF4xIy0DIRznhDpYpx2A0ndAHksNecNLWCCpqEsaFNTXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430843; c=relaxed/simple;
	bh=ZIzdegSEBdglMlNTttHzBqWiL/sUuYXyc43n4at40tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHDjpUf24AfygJFw8UJpvTtZh0781R/cGzyeA8A2WRmB6tU1lJ3NYg8e38PE5p4ifMZwvhum32Mij4Z4uNMk035IMMnBqfb40RZ5xb+OhmLoSUQylPPhpRBEfjPHIIagm0agnHf0laCRMwWgxRwsMV/sThaHckCrXZt18UMcpSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P2tDH7BO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P2tDH7BO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385df53e559so743227f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jan 2025 05:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736430839; x=1737035639; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7uTnDYApbyImEUMHy0uUhD5sFnzFetSVVUMRL20tEI=;
        b=P2tDH7BO3yOvGg07DmT3A4LHEUg7TWInYMIQq00WnQ6rtqFdA0kZB5AyxBM9Zl2vHd
         wrB0OzOryYPLCXaDCWnxevhSlauuvONKQoye8BCxCrrDImiHJ5BDcbmx8ezo91d5CFSn
         YnAyA9Dua5uE0Y0opkgXxoxflHn0vuvLDYyCSjeRLuEijoY7pZ9doayXVH1gkzFmjETK
         TejvXRvKKFlc5KtSgJlvHK6MVFr9i0EPS8kO3N9dBSaLFb47ipOkQSVay5mQS9804qxO
         2gO2jrYLmwOenrQhXQmARemomk9I5Zcy5t8ouyYMpvtsA66ryd/pgAgdSBJLx8xRr7VB
         DG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736430839; x=1737035639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7uTnDYApbyImEUMHy0uUhD5sFnzFetSVVUMRL20tEI=;
        b=T5jeMKN6HMrT3RA50XJGF0meNlJicYmIX+UZnldAdr8U/QWJXfgGhlzXAaHEeLl2bM
         0Vs/L+OKh2pPQaPWSTIXG2gz6t/8mDGzjZoHKK4HrJ10JWo3cWr7nD0q+83uGgFdL2xj
         qRx09LcOXet/jqKkTqHbJYehRd96h5GzfYZUum6lDxAOl8EHOBAqD8cZ/yb5SU1jiX69
         ZreYXcr45e1r5dQ7dAWo1DXS23nu0weKJj+0GFa/6xeTTaM07RBkOW0qf5rTSP5lEIsG
         J/C9U2X9U1ZD+WnbGBWmCPx62hNIVlIU40Rx7xMBYE2aFI9mCj2lYZRu0/Rpu1n00TWC
         2HYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwOlqwPn+pSwX5DYN3YPhOTVazsQDhet+F6zICmsffZhInTCa8ci7FRNDfu13Hug2716yjm1H/kulJr8zmMg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsasj5+FRG4LQKpUSpOs0uRzm6PyluY5YpioXPEwzILsITeekQ
	oqWnmYSEYfk1s3DezNCpEVKcLbHNsCcZ7dxK81dB0Up2YhYkMbmHukgZmI7WJXty6kc9d/nMHE9
	mEijwO+lHXz9kZgUQFGbiXrcC6wWTcmmvL40p
X-Gm-Gg: ASbGncvfrTJVMRkAJuhVze/+4Wmm9KUcDZnXq/hHDwTzhRmNgbnxLeaCc9ZxDCM9VVl
	YX+LATITJHOMKFaHS0e12J+67ef603qobRqSCxHE=
X-Google-Smtp-Source: AGHT+IFnKnsauiS8dDFdXHXhbsm7rpm9abiye9h4J5buN/8s5yenCUJGTCxU3CNvyO4A5wCNWs4le8Oqd3zYQ6/yb1c=
X-Received: by 2002:a05:6000:1a85:b0:38a:4184:1520 with SMTP id
 ffacd0b85a97d-38a872eb1eamr5091021f8f.27.1736430839187; Thu, 09 Jan 2025
 05:53:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
 <20250109133057.243751-3-daniel.almeida@collabora.com>
In-Reply-To: <20250109133057.243751-3-daniel.almeida@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 9 Jan 2025 14:53:47 +0100
X-Gm-Features: AbW1kvaovOOxmWrSmo4uc73mMdEm66MY-V7vPcW_D7gyOEY02kea-Pob108OaF4
Message-ID: <CAH5fLghKfUqUNQBiGS4ORz_Ng3a865B+gjPRF4zGxJ=3VgV5Xg@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] rust: io: mem: add a generic iomem abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, boris.brezillon@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 2:32=E2=80=AFPM Daniel Almeida
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
>  rust/helpers/io.c     |  10 ++++
>  rust/kernel/io.rs     |   1 +
>  rust/kernel/io/mem.rs | 108 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 119 insertions(+)
>  create mode 100644 rust/kernel/io/mem.rs
>
> diff --git a/rust/helpers/io.c b/rust/helpers/io.c
> index 3cb47bd01942..cb10060c08ae 100644
> --- a/rust/helpers/io.c
> +++ b/rust/helpers/io.c
> @@ -106,3 +106,13 @@ resource_size_t rust_helper_resource_size(struct res=
ource *res)
>         return resource_size(res);
>  }
>
> +struct resource *rust_helper_request_mem_region(resource_size_t start, r=
esource_size_t n,
> +                                   const char *name)
> +{
> +       return request_mem_region(start, n, name);
> +}
> +
> +void rust_helper_release_mem_region(resource_size_t start, resource_size=
_t n)
> +{
> +       release_mem_region(start, n);
> +}
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
> index 000000000000..f2147db715bf
> --- /dev/null
> +++ b/rust/kernel/io/mem.rs
> @@ -0,0 +1,108 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Generic memory-mapped IO.
> +
> +use core::ops::Deref;
> +
> +use crate::io::resource::Resource;
> +use crate::io::Io;
> +use crate::io::IoRaw;
> +use crate::prelude::*;
> +
> +/// A generic memory-mapped IO region.
> +///
> +/// Accesses to the underlying region is checked either at compile time,=
 if the
> +/// region's size is known at that point, or at runtime otherwise.
> +///
> +/// Whether `IoMem` represents an exclusive access to the underlying mem=
ory
> +/// region is determined by the caller at creation time, as overlapping =
access
> +/// may be needed in some cases.
> +///
> +/// # Invariants
> +///
> +/// `IoMem` always holds an `IoRaw` inststance that holds a valid pointe=
r to the
> +/// start of the I/O memory mapped region and its size.

"and its size"? sentence is unclear to me ...

> +pub struct IoMem<const SIZE: usize =3D 0> {
> +    io: IoRaw<SIZE>,
> +    res_start: u64,
> +    exclusive: bool,

I don't think you need this after the `new` call, so you can remove
the field from the struct.

> +}
> +
> +impl<const SIZE: usize> IoMem<SIZE> {
> +    /// Creates a new `IoMem` instance.
> +    ///
> +    /// `exclusive` determines whether the memory region should be exclu=
sively

Incomplete sentence?

> +    /// # Safety
> +    ///
> +    /// The caller must ensure that the underlying resource remains vali=
d
> +    /// throughout the `IoMem`'s lifetime. This is usually done by wrapp=
ing the
> +    /// `IoMem` in a `Devres` instance, which will properly revoke the a=
ccess
> +    /// when the device is unbound from the matched driver.

I know that this is a requirement for IoRaw, but does the
`request_mem_region` call not guarantee that the memory region stays
valid until `drop` runs?

> +    pub(crate) unsafe fn new(resource: &Resource, exclusive: bool) -> Re=
sult<Self> {
> +        let size =3D resource.size();
> +        if size =3D=3D 0 {
> +            return Err(ENOMEM);
> +        }
> +
> +        let res_start =3D resource.start();
> +
> +        if exclusive {
> +            // SAFETY:
> +            // - `res_start` and `size` are read from a presumably valid=
 `struct resource`.
> +            // - `size` is known not to be zero at this point.
> +            // - `resource.name()` returns a valid C string.
> +            let mem_region =3D unsafe {
> +                bindings::request_mem_region(res_start, size, resource.n=
ame().as_char_ptr())
> +            };
> +
> +            if mem_region.is_null() {
> +                return Err(EBUSY);
> +            }
> +        }
> +
> +        // SAFETY:
> +        // - `res_start` and `size` are read from a presumably valid `st=
ruct resource`.
> +        // - `size` is known not to be zero at this point.
> +        let addr =3D unsafe { bindings::ioremap(res_start, size as usize=
) };
> +        if addr.is_null() {
> +            if exclusive {
> +                // SAFETY:
> +                // - `res_start` and `size` are read from a presumably v=
alid `struct resource`.
> +                // - `size` is the same as the one passed to `request_me=
m_region`.
> +                unsafe { bindings::release_mem_region(res_start, size) }=
;
> +            }
> +            return Err(ENOMEM);
> +        }
> +
> +        let io =3D IoRaw::new(addr as usize, size as usize)?;
> +
> +        Ok(IoMem {
> +            io,
> +            res_start,
> +            exclusive,
> +        })
> +    }
> +}
> +
> +impl<const SIZE: usize> Drop for IoMem<SIZE> {
> +    fn drop(&mut self) {
> +        if self.exclusive {
> +            // SAFETY: `res_start` and `io.maxsize()` were the values pa=
ssed to
> +            // `request_mem_region`.
> +            unsafe { bindings::release_mem_region(self.res_start, self.i=
o.maxsize() as u64) }
> +        }
> +
> +        // SAFETY: Safe as by the invariant of `Io`.
> +        unsafe { bindings::iounmap(self.io.addr() as *mut core::ffi::c_v=
oid) }
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
> 2.47.1
>
