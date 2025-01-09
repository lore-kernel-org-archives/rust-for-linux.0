Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B721A43B;
	Thu,  9 Jan 2025 16:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736438649; cv=none; b=heuhq46drc2/2M5r6abTIUPrRBbliDIgGSGUSuDSNJXR/iyYmdA3If6ZnKzunZBkuJjAm0DKkLUUXsk8e+1iTIJ4NFNyF0ZThJWgbx0vII0py9p/z4DpavLmlX53KUah7IGlabV/+MZtTZZCm9Rp9fDY6UdpqufsVD51XWdDFkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736438649; c=relaxed/simple;
	bh=32k5Xue1AcDYFtdF2jkQ1Y+o8ibm9ZyZO27+UUVr0H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVw2F0EYYnV1ZGAnNTlIh9wjMT/DBEVQ5/V+DagsZoS6mYi8VX7Vv0WWGswGQYnz2OVRAfr6s+pB3nYR7GH0jzJZQuPlkYt7vO9sQHdVVCyOEdSlgrRhz2uKU0D7kvBwwgY1I3IFMemIop8KnXwU+Ybv75dvKKUCDLhFWBSGVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Em6S+qWy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Em6S+qWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E17BC4CED2;
	Thu,  9 Jan 2025 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736438649;
	bh=32k5Xue1AcDYFtdF2jkQ1Y+o8ibm9ZyZO27+UUVr0H4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Em6S+qWyYzsRAhzr96bRZchuT72/m5Ew7RONFt/S+GJwxxeYKPOKUktJNhgeiNM9H
	 9I6eMGdh+2uI+sF8CSm5M0kT9JEM+hQlO0bAnaZjgraqAo+qBLkJlH8060lrrORPXj
	 vweNhqa8Va5c25R8+ETSmWMDEhdXbCATXGaN6OaMdBC+3mdvXet2YjnOhHsk4JUFcG
	 YIVDJM6womSR4iq67ZD700HDZzZz13xh75ZovMVz2v9/A2ghNWJqmZ0eG60O3kzu1R
	 bVDl/L9llg9i0oEP9ytuYdXLXNDONbWUS9kvFX2fUhHDhdVIqombyXOdfgVRVAepu5
	 sfKvj3Zg1g4Zg==
Date: Thu, 9 Jan 2025 17:04:03 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	gregkh@linuxfoundation.org, rafael@kernel.org,
	boris.brezillon@collabora.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] rust: platform: allow ioremap of platform
 resources
Message-ID: <Z3_zc3CuU1lmTDhF@pollux>
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
 <20250109133057.243751-4-daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109133057.243751-4-daniel.almeida@collabora.com>

On Thu, Jan 09, 2025 at 10:30:55AM -0300, Daniel Almeida wrote:
> The preceding patches added support for resources, and for a general
> IoMem abstraction, but thus far there is no way to access said IoMem
> from drivers, as its creation is unsafe and depends on a resource that
> must be acquired from a some device first.
> 
> Now, allow the ioremap of platform resources themselves, thereby making
> the IoMem available to platform drivers.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/platform.rs | 98 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 97 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
> index 03287794f9d0..9575917a1b2d 100644
> --- a/rust/kernel/platform.rs
> +++ b/rust/kernel/platform.rs
> @@ -5,8 +5,11 @@
>  //! C header: [`include/linux/platform_device.h`](srctree/include/linux/platform_device.h)
>  
>  use crate::{
> -    bindings, container_of, device, driver,
> +    bindings, container_of, device,
> +    devres::Devres,
> +    driver,
>      error::{to_result, Result},
> +    io::{mem::IoMem, resource::Resource},
>      of,
>      prelude::*,
>      str::CStr,
> @@ -189,6 +192,99 @@ fn as_raw(&self) -> *mut bindings::platform_device {
>          // embedded in `struct platform_device`.
>          unsafe { container_of!(self.0.as_raw(), bindings::platform_device, dev) }.cast_mut()
>      }
> +
> +    /// Maps a platform resource through ioremap() where the size is known at
> +    /// compile time.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```no_run
> +    /// # use kernel::{bindings, c_str, platform};
> +    ///
> +    /// fn probe(pdev: &mut platform::Device, /* ... */) -> Result<()> {
> +    ///     let offset = 0; // Some offset.
> +    ///
> +    ///     // If the size is known at compile time, use `ioremap_resource_sized`.
> +    ///     // No runtime checks will apply when reading and writing.
> +    ///     let resource = pdev.resource(0).ok_or(ENODEV)?;
> +    ///     let iomem = pdev.ioremap_resource_sized::<42>(&resource, true)?;
> +    ///
> +    ///     // Read and write a 32-bit value at `offset`. Calling `try_access()` on
> +    ///     // the `Devres` makes sure that the resource is still valid.
> +    ///     let data = iomem.try_access().ok_or(ENODEV)?.readl(offset);
> +    ///
> +    ///     iomem.try_access().ok_or(ENODEV)?.writel(data, offset);
> +    ///
> +    ///     # Ok::<(), Error>(())
> +    /// }
> +    /// ```
> +    pub fn ioremap_resource_sized<const SIZE: usize>(
> +        &self,
> +        resource: &Resource,
> +        exclusive: bool,
> +    ) -> Result<Devres<IoMem<SIZE>>> {
> +        // SAFETY: We wrap the resulting `IoMem` in a `Devres`.
> +        let io = unsafe { IoMem::new(resource, exclusive) }?;

If we trust `resource`, then IoMem::new() could already return a `Devres<IoMem>`
avoiding the `unsafe`.

> +        let devres = Devres::new(self.as_ref(), io, GFP_KERNEL)?;
> +
> +        Ok(devres)
> +    }
> +
> +    /// Maps a platform resource through ioremap().
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```no_run
> +    /// # use kernel::{bindings, c_str, platform};
> +    ///
> +    /// fn probe(pdev: &mut platform::Device, /* ... */) -> Result<()> {
> +    ///     let offset = 0; // Some offset.
> +    ///
> +    ///     // Unlike `ioremap_resource_sized`, here the size of the memory region
> +    ///     // is not known at compile time, so only the `try_read*` and `try_write*`
> +    ///     // family of functions are exposed, leading to runtime checks on every
> +    ///     // access.
> +    ///     let iomem = pdev.ioremap_resource(&resource, true)?;
> +    ///
> +    ///     let data = iomem.try_access().ok_or(ENODEV)?.try_readl(offset)?;
> +    ///
> +    ///     iomem.try_access().ok_or(ENODEV)?.try_writel(data, offset)?;
> +    ///
> +    ///     # Ok::<(), Error>(())
> +    /// }
> +    /// ```
> +    pub fn ioremap_resource(&self, resource: &Resource, exclusive: bool) -> Result<Devres<IoMem>> {
> +        self.ioremap_resource_sized::<0>(resource, exclusive)
> +    }
> +
> +    /// Returns the resource at `index`, if any.
> +    pub fn resource(&self, index: u32) -> Option<&Resource> {
> +        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct platform_device`.
> +        let resource = unsafe {
> +            bindings::platform_get_resource(self.as_raw(), bindings::IORESOURCE_MEM, index)
> +        };
> +
> +        // SAFETY: `resource` is a valid pointer to a `struct resource` as
> +        // returned by `platform_get_resource`.
> +        (!resource.is_null()).then(|| unsafe { Resource::from_ptr(resource) })
> +    }
> +
> +    /// Returns the resource with a given `name`, if any.
> +    pub fn resource_by_name(&self, name: &CStr) -> Option<&Resource> {
> +        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct
> +        // platform_device` and `name` points to a valid C string.
> +        let resource = unsafe {
> +            bindings::platform_get_resource_byname(
> +                self.as_raw(),
> +                bindings::IORESOURCE_MEM,
> +                name.as_char_ptr(),
> +            )
> +        };
> +
> +        // SAFETY: `resource` is a valid pointer to a `struct resource` as
> +        // returned by `platform_get_resource`.
> +        (!resource.is_null()).then(|| unsafe { Resource::from_ptr(resource) })
> +    }
>  }
>  
>  impl AsRef<device::Device> for Device {
> -- 
> 2.47.1
> 
