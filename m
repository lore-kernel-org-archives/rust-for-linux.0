Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4711F1D6DD4;
	Thu, 16 Jan 2025 21:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737062126; cv=none; b=kM8A3ANxC7fLtmuqeXMCvXHThDn7djc1q5nl1JtcTT6Mn8RWa4lsvoEc+wfFNO+wj5ZogJGNKjTNewj6xEy7BLsQZJ22TEsPqAH8HiZh1aud3gSv3MJ91RN/DjBHTMyzNCo4DE/Um/JvRgP1GeDzcdYPn5MYYadL/7/73kVnkeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737062126; c=relaxed/simple;
	bh=nAsmj3B3+mricAINxi2nKqLcu48gS+D2KMS6j1SWKQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bN9Gdi10d1fLQff5Tg1e/UfmrEyIvbQub3LNbb7ln01nTsToe+OXVfjB74ZZzB7JWApi+e8Qh9ZSHDypTOtj5C//ywj1Gg6ilvJYYqcDnpLsUg8srAnWM0bmPdaqh3wU356o1SzyjaBJBBEuQCRX5r39V3NGvPq1IGesZyrFEgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCQNTjtK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCQNTjtK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4362f61757fso13368695e9.2;
        Thu, 16 Jan 2025 13:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737062122; x=1737666922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wgXNESa0LW3t3iYTMKhcMjVCU8z75J1a0aMzskYvB44=;
        b=jCQNTjtKIgnUe0F9uCy1IGjzuds1lhSJj6GOpvU/loKSMrLR6aeaI/onq3jfn0nZC8
         Xsp2hPpqCqot36UrBBsGUdDuhp0r3bN77UOEt8H6sB12a7InB+nvBSKDD9adpN0aMoCo
         E7N4+wEjTtdQnpRUbRlCC3dX3hUaapRUUo5L/ExwVJAR7OrbV5mkOVi7+vKFqJl+5Pou
         IpgdnlLHLHwMuBnqCtyz9/NtrHcAEWKdQ4d3TSRWKdApCAgd9GUFZvI6/6CVmOPUJh1L
         JPbJgfpgGHpd3seuGOL5mVC6RbqH51ZGg/K+cP+cruyOfw0kU0tkJdlYLUdgMWSWUTaT
         TlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737062122; x=1737666922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgXNESa0LW3t3iYTMKhcMjVCU8z75J1a0aMzskYvB44=;
        b=fGXfJ3J85GFPjA7PimWql8eLKs958JJo+cVkKgka+OkbxQLvW6f5LxtGKcdixLaXbo
         xTkZP1djyUEYb6Ud/tOWkQHK1ByYh4HYVhN7sgVQm5+wmxYbeaxfKsIz7lkN3NqQsckG
         M3Ycx6SBAL39pTQ1ZNwgXvBgj10eM4m9faEFrdHM1tL/rjuyVU4qd2SJhOqzG38a/XOA
         I4OwFeylZEoLx+TGwUgRz/RfuHepYK7bAEHQGbL6Nyte3rBI8I0IyJnWBmfUzYwarUoP
         PzurF8x7gR7xKbqUnoBYR10xXXXUwhS8AkcVKFtr956li1jubEK4RzuKnag9bjYSpF//
         8kRA==
X-Forwarded-Encrypted: i=1; AJvYcCX5+rTFZ/3OiOQj7D7MJsuj4UR5441FHicfsfhX2sxOz7DXXHEfQnA6yMKWStsbdxTPd+n/fwQXtK1pyLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynJrjVuwhKlaUJtTvXdvQPQDdMWk94nVnLMrHTx7N3obXoyGI2
	qOxiV5Y49kpr/oWesBZteDHjJoGWKOh5Z8yY/ApUJ5xtsWCV4WVd
X-Gm-Gg: ASbGncu5QEtWC1XZOFz9jPKveJpdGrG1XX3IJ0lHs2cp/KAPUdYL8UCumz4WZ2Z6ar2
	ULJrFUSrw4fC3n0XJl/Hcql3tE0G4n6YlixsvVQ9p6FDsyfkDrM4gsS/FiLbYGFL04BCyEFhKKY
	zo5/ZNfthpgUxk63CmO/8bSMNRqK+16/y4yMe8ZqdBSuXGbOoNoH32OLx4zr0ctfPrmIMMPs+EK
	wzgKU7z8SeC3HKLcdI1P1nKfaM7bA6Ysph0mDhIZ8QW5q9xhAI9s8iNjTqqDPhzuUEYbA==
X-Google-Smtp-Source: AGHT+IFDwjljwZmzjBl9+OQtKpm2FM43EFhs/r+YO70KEfsef7w4xsLlXjnrnUsosr5FT4Uw6W61cQ==
X-Received: by 2002:a05:600c:5027:b0:434:f5c0:3288 with SMTP id 5b1f17b1804b1-43891430ed1mr1873705e9.29.1737062122309;
        Thu, 16 Jan 2025 13:15:22 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3275901sm782403f8f.61.2025.01.16.13.15.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 13:15:21 -0800 (PST)
Message-ID: <25ac9fd7-7c4a-4936-bc20-4b2105b6df91@gmail.com>
Date: Thu, 16 Jan 2025 22:15:21 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 2/3] rust: io: mem: add a generic iomem
 abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.mco, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, boris.brezillon@collabora.com,
 robh@kernel.org
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250116125632.65017-1-daniel.almeida@collabora.com>
 <20250116125632.65017-3-daniel.almeida@collabora.com>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250116125632.65017-3-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Daniel

On 16.01.25 1:56 PM, Daniel Almeida wrote:
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
>  rust/helpers/io.c     | 10 +++++
>  rust/kernel/io.rs     |  1 +
>  rust/kernel/io/mem.rs | 98 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 109 insertions(+)
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
> index 000000000000..a287dc0898e0
> --- /dev/null
> +++ b/rust/kernel/io/mem.rs
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Generic memory-mapped IO.
> +
> +use core::ops::Deref;
> +
> +use crate::device::Device;
> +use crate::devres::Devres;
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
> +/// start of the I/O memory mapped region.
> +pub struct IoMem<const SIZE: usize = 0, const EXCLUSIVE: bool = true> {
> +    io: IoRaw<SIZE>,
> +    res_start: u64,

Please use bindings::resource_size_t here to to be compatible with 32-bit architectures.

> +}
> +
> +impl<const SIZE: usize, const EXCLUSIVE: bool> IoMem<SIZE, EXCLUSIVE> {
> +    /// Creates a new `IoMem` instance.
> +    pub(crate) fn new(resource: &Resource, device: &Device) -> Result<Devres<Self>> {
> +        let size = resource.size();
> +        if size == 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        let res_start = resource.start();
> +
> +        if EXCLUSIVE {
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
> +        let addr = unsafe { bindings::ioremap(res_start, size as kernel::ffi::c_ulong) };
> +        if addr.is_null() {
> +            if EXCLUSIVE {
> +                // SAFETY:
> +                // - `res_start` and `size` are read from a presumably valid `struct resource`.
> +                // - `size` is the same as the one passed to `request_mem_region`.
> +                unsafe { bindings::release_mem_region(res_start, size) };
> +            }
> +            return Err(ENOMEM);
> +        }
> +
> +        let io = IoRaw::new(addr as usize, size as usize)?;
> +        let io = IoMem { io, res_start };
> +        let devres = Devres::new(device, io, GFP_KERNEL)?;
> +
> +        Ok(devres)
> +    }
> +}
> +
> +impl<const SIZE: usize, const EXCLUSIVE: bool> Drop for IoMem<SIZE, EXCLUSIVE> {
> +    fn drop(&mut self) {
> +        if EXCLUSIVE {
> +            // SAFETY: `res_start` and `io.maxsize()` were the values passed to
> +            // `request_mem_region`.
> +            unsafe { bindings::release_mem_region(self.res_start, self.io.maxsize() as u64) }

Please use bindings::resource_size_t here as well.

> +        }
> +
> +        // SAFETY: Safe as by the invariant of `Io`.
> +        unsafe { bindings::iounmap(self.io.addr() as *mut core::ffi::c_void) }
> +    }
> +}
> +
> +impl<const SIZE: usize, const EXCLUSIVE: bool> Deref for IoMem<SIZE, EXCLUSIVE> {
> +    type Target = Io<SIZE>;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: Safe as by the invariant of `IoMem`.
> +        unsafe { Io::from_raw(&self.io) }
> +    }
> +}

Cheers
Christian

