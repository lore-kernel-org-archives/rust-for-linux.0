Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63E71FFC4E
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 13:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430432; cv=none; b=BRLNc2XLczzCCqgVcmWLWC59pkj3TqyeWyypVbVpnDY5moUANXkwxUczD2YxlkS8SUhtINL7bhkxk4Cq1aI0WMW+IMx2Ki6+v/E1OLHXjA9315SuiwDXEwzT9e/ajWPYWDmToUX+NQ8dFI+1A6Hev+WAHoi5Og8FIhGnamj09q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430432; c=relaxed/simple;
	bh=oo5hO8GcmUCVvxhKCap+GQg6SFr6LInYnqC2LYQevD0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n2MRoMHc64Vw4S+6QY7Ahh/UizvbsWGCrI1VS5aV4mvRK4sQY/HNihKQpDIRPjR+OSFcRmOESv4ozpJLVsxC9P2KpzRJRKq0ZIsBT1534aCU9YIxYyVoFyR10tMaDRKHtDQUDqFoIAkX4put/umYs0n/on+O5OUO4toownwaH3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=CyvSb7UM; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="CyvSb7UM"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 840D0240028
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 14:47:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736430421; bh=oo5hO8GcmUCVvxhKCap+GQg6SFr6LInYnqC2LYQevD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=CyvSb7UMiJrVqy6uErtMksztRxVVQPEW5vuHWgk+6/KGXIFS/CRHNngObBQ0cmlsF
	 /sQPukXE9LT6Ga0wLCAEricq0xS8NZU9ISihdjZnoazYLI/PkYFCJX23x3eXeQJdUj
	 YGDLURGbwlEcQfd8JbdeWqxpn2DKBbipCvDeUF2TVvDFA/WJBOTaPvo8yJpDqMyHNz
	 TW2CrlqetfyTRu+7E9PdIOMOtXi7rE8kXZ2ZsATVjWlR7L+Y4z4T0Z6lPbEKkmMiu7
	 5/iU9GfeHTWWWTOgJBaVilXB0MyYkkFeCPtieKfcefly683p3oRK3vuVAT8tVro9d4
	 iFbJEOkTQ0pgA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YTR0f2xS3z9rxM;
	Thu,  9 Jan 2025 14:46:58 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: alex.gaynor@gmail.com,  boqun.feng@gmail.com,  gary@garyguo.net,
  bjorn3_gh@protonmail.com,  benno.lossin@proton.me,
  a.hindborg@kernel.org,  aliceryhl@google.com,  tmgross@umich.edu,
  gregkh@linuxfoundation.org,  rafael@kernel.org,  dakr@kernel.org,
  boris.brezillon@collabora.com,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] rust: io: mem: add a generic iomem abstraction
In-Reply-To: <20250109133057.243751-3-daniel.almeida@collabora.com> (Daniel
	Almeida's message of "Thu, 9 Jan 2025 10:30:54 -0300")
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
	<20250109133057.243751-3-daniel.almeida@collabora.com>
Date: Thu, 09 Jan 2025 13:46:57 +0000
Message-ID: <m2h668t7zi.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Almeida <daniel.almeida@collabora.com> writes:

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
> @@ -106,3 +106,13 @@ resource_size_t rust_helper_resource_size(struct resource *res)
>  	return resource_size(res);
>  }
>
> +struct resource *rust_helper_request_mem_region(resource_size_t start, resource_size_t n,
> +				    const char *name)
> +{
> +	return request_mem_region(start, n, name);
> +}
> +
> +void rust_helper_release_mem_region(resource_size_t start, resource_size_t n)
> +{
> +	release_mem_region(start, n);
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
> +/// Accesses to the underlying region is checked either at compile time, if the
> +/// region's size is known at that point, or at runtime otherwise.
> +///
> +/// Whether `IoMem` represents an exclusive access to the underlying memory
> +/// region is determined by the caller at creation time, as overlapping access
> +/// may be needed in some cases.
> +///
> +/// # Invariants
> +///
> +/// `IoMem` always holds an `IoRaw` inststance that holds a valid pointer to the
> +/// start of the I/O memory mapped region and its size.
> +pub struct IoMem<const SIZE: usize = 0> {
> +    io: IoRaw<SIZE>,
> +    res_start: u64,
> +    exclusive: bool,
> +}
> +
> +impl<const SIZE: usize> IoMem<SIZE> {
> +    /// Creates a new `IoMem` instance.
> +    ///
> +    /// `exclusive` determines whether the memory region should be exclusively
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that the underlying resource remains valid
> +    /// throughout the `IoMem`'s lifetime. This is usually done by wrapping the
> +    /// `IoMem` in a `Devres` instance, which will properly revoke the access
> +    /// when the device is unbound from the matched driver.
> +    pub(crate) unsafe fn new(resource: &Resource, exclusive: bool) -> Result<Self> {
> +        let size = resource.size();
> +        if size == 0 {
> +            return Err(ENOMEM);
> +        }

Shouldn't this be EINVAL instead? AFAIR, ENOMEM is typically used for
memory allocation failures or resource exhaustion, whereas EINVAL seems
more appropriate for signaling invalid resource configurations

> +
> +        let res_start = resource.start();
> +
> +        if exclusive {
> +            // SAFETY:
> +            // - `res_start` and `size` are read from a presumably valid `struct resource`.
> +            // - `size` is known not to be zero at this point.
> +            // - `resource.name()` returns a valid C string.
> +            let mem_region = unsafe {
> +                bindings::request_mem_region(res_start, size, resource.name().as_char_ptr())
> +            };
> +
> +            if mem_region.is_null() {
> +                return Err(EBUSY);
> +            }
> +        }
> +
> +        // SAFETY:
> +        // - `res_start` and `size` are read from a presumably valid `struct resource`.
> +        // - `size` is known not to be zero at this point.
> +        let addr = unsafe { bindings::ioremap(res_start, size as usize) };
> +        if addr.is_null() {
> +            if exclusive {
> +                // SAFETY:
> +                // - `res_start` and `size` are read from a presumably valid `struct resource`.
> +                // - `size` is the same as the one passed to `request_mem_region`.
> +                unsafe { bindings::release_mem_region(res_start, size) };
> +            }
> +            return Err(ENOMEM);
> +        }
> +
> +        let io = IoRaw::new(addr as usize, size as usize)?;
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
> +            // SAFETY: `res_start` and `io.maxsize()` were the values passed to
> +            // `request_mem_region`.
> +            unsafe { bindings::release_mem_region(self.res_start, self.io.maxsize() as u64) }
> +        }
> +
> +        // SAFETY: Safe as by the invariant of `Io`.
> +        unsafe { bindings::iounmap(self.io.addr() as *mut core::ffi::c_void) }
> +    }
> +}
> +
> +impl<const SIZE: usize> Deref for IoMem<SIZE> {
> +    type Target = Io<SIZE>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Safe as by the invariant of `IoMem`.
> +        unsafe { Io::from_raw(&self.io) }
> +    }
> +}
