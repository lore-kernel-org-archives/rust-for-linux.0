Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E563BB50
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Sep 2024 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725294552; cv=none; b=VNsRSBzedEO+Ho6zeSNEt9+PpRdhffYvxdc+7+vwHF24o0tZa5Q0278uW6p2fpLIoivBd7PhVAGnh3t/4q8yJaQ6+bVizsQ22UOuJKIkyv8xgMU48RB0JbVcMCpMluDQy8pEk2CU4pLrNlyNad+H7X+Dps9DANO6Nxd7cEsxwEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725294552; c=relaxed/simple;
	bh=G6K13CJC2DrwrDTMz8VzGuGlhI8l6imLYI5zMRy5W7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxuxaZekWA0Tl5Qfsi/i/xQa4hZtGLmp6PEOh06Hab2IBmGoHPQz/GfMHDugmt+6/2RIDkByYDtGE0wtkA6JsFAXq790rp5RWMsO2svnLl5uvomATyppdwBSJDuuiDmetqDBtWUUU0i+Ak7rNLlv5R1dTVstsfeq3lwvLY/dI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=g4kRKE+l; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="g4kRKE+l"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374c3eef39eso1200039f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Sep 2024 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1725294549; x=1725899349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h5KU+rNRLvaJ/D5quKO81u0TuE+I1OMwUjzPfu7dClg=;
        b=g4kRKE+l5JDcXvxVQrCvxjb5bCn/iTK8iSrsL0pqSefHpEMGvHhfDjO0nTPiQWHAod
         H/pADP/U5cYwFk2vXz2uKGd5fo1Ysto105L/yXIvdpmENobkY5PEdLod1PMKINkwZtn2
         ZK0y2mLGuQ4jazP24UFv2JkFLTqail6aGOQ+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725294549; x=1725899349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5KU+rNRLvaJ/D5quKO81u0TuE+I1OMwUjzPfu7dClg=;
        b=gpAHieHw7Yz2oNmkSloUZx5z/vGDhPcWVAIcE78OFM5deDvjUL8D1HZFFq1wQ53qmx
         ytua6Y1U+jwBOzKKLin+mJREHOyOpG8M/KcZXj7hwxz/vH8WbOX5LAwslUGq8jMoIjZv
         GBJdW0CAS1L1qHmgdeNQYS3LpmhdFqhzSoFJ0b9sBIh4cMSQYRWTwC9EZOUAoVomUwLU
         fplVQH7VQdfZLtSkjNuLn3WScRKDPS5LiGmr1R2QMzm6h1AH4lhUaV/rZhvB2YRkmSdl
         taMG64Sb1YEQ598iM6giqDghYq+fFmIseWMUvZz8vwn/UeMYOMRMqzgIq85FMTGbCDuR
         0yGA==
X-Forwarded-Encrypted: i=1; AJvYcCVy58dR80dzK7Fng84Dp125BUejwJ9Cp/5f05eiy9+cJE4usNX05rJBYtFJLTXcq9M9SGXfh5hFXGdu9HtHEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRpBOSqKyO8ghiz1aqwfq4NDZxGO0OBqOFQwAP4MpsVMDdG0ei
	IolpP9aiQ6slHnQoMURDtmiaB1K/3kQH0sL5fr+3FCrJPqbGRNFJpzkJGnanDNM=
X-Google-Smtp-Source: AGHT+IHqTG5KvhSgCm7KrEwQ8lyUbuu2d/L8TNd/Qet4eR2cgdK9CYH3eEIh2l6C3HD2JgAknw7GxQ==
X-Received: by 2002:adf:f3c4:0:b0:374:c8cc:1bb1 with SMTP id ffacd0b85a97d-374c94714e5mr3230317f8f.39.1725294548922;
        Mon, 02 Sep 2024 09:29:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c610d437sm4929321f8f.97.2024.09.02.09.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 09:29:08 -0700 (PDT)
Date: Mon, 2 Sep 2024 18:29:06 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Danilo Krummrich <dakr@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com, gregkh@linuxfoundation.org,
	robh@kernel.org, daniel.almeida@collabora.com,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 3/8] rust: drm: add driver abstractions
Message-ID: <ZtXn0hesji0s_45x@phenom.ffwll.local>
References: <20240618233324.14217-1-dakr@redhat.com>
 <20240618233324.14217-4-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618233324.14217-4-dakr@redhat.com>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Wed, Jun 19, 2024 at 01:31:39AM +0200, Danilo Krummrich wrote:
> Implement the DRM driver abstractions.
> 
> The `Driver` trait provides the interface to the actual driver to fill
> in the driver specific data, such as the `DriverInfo`, driver features
> and IOCTLs.
> 
> Co-developed-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/drm/drv.rs          | 141 ++++++++++++++++++++++++++++++++
>  rust/kernel/drm/mod.rs          |   1 +
>  3 files changed, 143 insertions(+)
>  create mode 100644 rust/kernel/drm/drv.rs
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index ed25b686748e..dc19cb789536 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -6,6 +6,7 @@
>   * Sorted alphabetically.
>   */
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_ioctl.h>
>  #include <kunit/test.h>
>  #include <linux/errname.h>
> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> new file mode 100644
> index 000000000000..cd594a32f9e4
> --- /dev/null
> +++ b/rust/kernel/drm/drv.rs
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM driver core.
> +//!
> +//! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
> +
> +use crate::{bindings, drm, private::Sealed, str::CStr, types::ForeignOwnable};
> +use macros::vtable;
> +
> +/// Driver use the GEM memory manager. This should be set for all modern drivers.
> +pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
> +/// Driver supports mode setting interfaces (KMS).
> +pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
> +/// Driver supports dedicated render nodes.
> +pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
> +/// Driver supports the full atomic modesetting userspace API.
> +///
> +/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
> +/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
> +/// should not set this flag.
> +pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
> +/// Driver supports DRM sync objects for explicit synchronization of command submission.
> +pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
> +/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
> +/// submission.
> +pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
> +/// Driver supports compute acceleration devices. This flag is mutually exclusive with `FEAT_RENDER`
> +/// and `FEAT_MODESET`. Devices that support both graphics and compute acceleration should be
> +/// handled by two drivers that are connected using auxiliary bus.
> +pub const FEAT_COMPUTE_ACCEL: u32 = bindings::drm_driver_feature_DRIVER_COMPUTE_ACCEL;
> +/// Driver supports user defined GPU VA bindings for GEM objects.
> +pub const FEAT_GEM_GPUVA: u32 = bindings::drm_driver_feature_DRIVER_GEM_GPUVA;
> +/// Driver supports and requires cursor hotspot information in the cursor plane (e.g. cursor plane
> +/// has to actually track the mouse cursor and the clients are required to set hotspot in order for
> +/// the cursor planes to work correctly).
> +pub const FEAT_CURSOR_HOTSPOT: u32 = bindings::drm_driver_feature_DRIVER_CURSOR_HOTSPOT;
> +
> +/// Information data for a DRM Driver.
> +pub struct DriverInfo {
> +    /// Driver major version.
> +    pub major: i32,
> +    /// Driver minor version.
> +    pub minor: i32,
> +    /// Driver patchlevel version.
> +    pub patchlevel: i32,
> +    /// Driver name.
> +    pub name: &'static CStr,
> +    /// Driver description.
> +    pub desc: &'static CStr,
> +    /// Driver date.
> +    pub date: &'static CStr,
> +}
> +
> +/// Internal memory management operation set, normally created by memory managers (e.g. GEM).
> +///
> +/// See `kernel::drm::gem` and `kernel::drm::gem::shmem`.
> +pub struct AllocOps {
> +    pub(crate) gem_create_object: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            size: usize,
> +        ) -> *mut bindings::drm_gem_object,
> +    >,
> +    pub(crate) prime_handle_to_fd: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            file_priv: *mut bindings::drm_file,
> +            handle: u32,
> +            flags: u32,
> +            prime_fd: *mut core::ffi::c_int,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) prime_fd_to_handle: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            file_priv: *mut bindings::drm_file,
> +            prime_fd: core::ffi::c_int,
> +            handle: *mut u32,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) gem_prime_import: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            dma_buf: *mut bindings::dma_buf,
> +        ) -> *mut bindings::drm_gem_object,
> +    >,
> +    pub(crate) gem_prime_import_sg_table: Option<
> +        unsafe extern "C" fn(
> +            dev: *mut bindings::drm_device,
> +            attach: *mut bindings::dma_buf_attachment,
> +            sgt: *mut bindings::sg_table,
> +        ) -> *mut bindings::drm_gem_object,
> +    >,
> +    pub(crate) dumb_create: Option<
> +        unsafe extern "C" fn(
> +            file_priv: *mut bindings::drm_file,
> +            dev: *mut bindings::drm_device,
> +            args: *mut bindings::drm_mode_create_dumb,
> +        ) -> core::ffi::c_int,
> +    >,
> +    pub(crate) dumb_map_offset: Option<
> +        unsafe extern "C" fn(
> +            file_priv: *mut bindings::drm_file,
> +            dev: *mut bindings::drm_device,
> +            handle: u32,
> +            offset: *mut u64,
> +        ) -> core::ffi::c_int,
> +    >,
> +}
> +
> +/// Trait for memory manager implementations. Implemented internally.
> +pub trait AllocImpl: Sealed {
> +    /// The C callback operations for this memory manager.
> +    const ALLOC_OPS: AllocOps;
> +}
> +
> +/// The DRM `Driver` trait.
> +///
> +/// This trait must be implemented by drivers in order to create a `struct drm_device` and `struct
> +/// drm_driver` to be registered in the DRM subsystem.
> +#[vtable]
> +pub trait Driver {
> +    /// Context data associated with the DRM driver
> +    ///
> +    /// Determines the type of the context data passed to each of the methods of the trait.
> +    type Data: ForeignOwnable + Sync + Send;
> +
> +    /// The type used to manage memory for this driver.
> +    ///
> +    /// Should be either `drm::gem::Object<T>` or `drm::gem::shmem::Object<T>`.
> +    type Object: AllocImpl;

Bit similar comment to what I discussed at length with lyude, drivers
might have a need for different implementations. But I think from the kms
discussions we have solid solution for that, so I think we should be fine.

> +
> +    /// Driver metadata
> +    const INFO: DriverInfo;
> +
> +    /// Feature flags
> +    const FEATURES: u32;

I think there's a type safety issue here with allowing drivers to muck
with these directly. Example:

- If you don't set FEAT_GEM but try to use gem C functions, stuff blows up
  because the core doesn't call drm_gem_init() in that case.

- For modesetting it's more fun because there mandatory init functions are
  meant to be called by the driver, in the right sequence, interleaved
  with other driver setup code for all the right modeset objects. If you
  get it wrong you go boom.

For the modeset side of things I've dumped a pile of comments on lyude's
patches already: Essentially during registration I think we need a special
drmKmsDriverInit object or phantom type or so, so that you can proof
you're registering kms objects at the right time, with the rust
abstraction calling all the other functions around that in the right
order.

For gem I think we should flat out not allow non-gem drivers in rust. At
least until someone comes up with a need for a non-gem driver.

For some of the values like hotspot cursor support we might need to change
the rust abstraction to compute these at runtime driver init, and then set
them somewhere in the runtime data structure instead of having them
statically sepcified in drm_driver->features.

In general these feature flag are midlayer design and that tends to be
bad, rust is just the messenger here.

Cheers, Sima


> +
> +    /// IOCTL list. See `kernel::drm::ioctl::declare_drm_ioctls!{}`.
> +    const IOCTLS: &'static [drm::ioctl::DrmIoctlDescriptor];
> +}
> diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
> index 9ec6d7cbcaf3..d987c56b3cec 100644
> --- a/rust/kernel/drm/mod.rs
> +++ b/rust/kernel/drm/mod.rs
> @@ -2,4 +2,5 @@
>  
>  //! DRM subsystem abstractions.
>  
> +pub mod drv;
>  pub mod ioctl;
> -- 
> 2.45.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
