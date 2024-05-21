Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEA056771
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 21:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716326614; cv=none; b=h1EjWx/uFCKSFv5GSlEVF3WLgPhqYdBR8tcjoxPUrpsfFK38F3hvHB2CIYy1ccEmC2RzY9bK1PfyaD6GEfLQqgjFRnadamZC0BzGG2KkxtjLDMMcFr3R+X4MdoSqFmRB5NH6JaZMmZ8hWunZ9DdlXKwrcxwLt3CexUYpcaBoZGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716326614; c=relaxed/simple;
	bh=EwH7o/8VRcfULQqTnFwqENvFz01TWQq0KwA7ytZTut0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulbL2uyp9c2wz3WyLJ1Q5kuCQBL2OKBMfLdcuuHlWj4sG4LYttRlGhhaJEFUCSe4PATIs61p1XAFQJz9Kq61XHODxfWpUy8mRiHUg+VeTurChwbJBP2jpDpEctG1yBbi/yIi9A9EHmyipX1tQp5hVEm8XPbSahoEh93XXNhaH7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dDTuSpQf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dDTuSpQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB84C4AF0A;
	Tue, 21 May 2024 21:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716326614;
	bh=EwH7o/8VRcfULQqTnFwqENvFz01TWQq0KwA7ytZTut0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dDTuSpQfyKkPJD32FZ3kt1ZsFwCbSfPKNjJoS1pcBupAMMd10PiNVqVXSDfbO8n7Z
	 wGqkQqUnzFGBdpU+9cRSRfsNIljeZhJU0LNbNUhyBwn2Ylie6FUVGjVYcsCU8qVlqP
	 rDbeYag8z0T/y4K3kHh+mM05EZrRbDI1Ap3pGWv3ktAWuPXXxPt6ziB8dVgMqOkwnA
	 Tce8oo8lGyDxrv35MBXP22Crk3bTeRzEHBFgGLOagZF6eo3ihotybFA/f5eXdvCIoN
	 PXslTBQmJri+24FI7BvuZPtHBL0omoZ1p7NYHdnvF1D0OTMchSJ94ZDUNwSIANwYJh
	 Oic9naCnYk6bQ==
Date: Tue, 21 May 2024 16:23:33 -0500
From: Rob Herring <robh@kernel.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, fujita.tomonori@gmail.com, lina@asahilina.net,
	pstanner@redhat.com, ajanulgu@redhat.com, lyude@redhat.com,
	gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [RFC PATCH 3/8] rust: drm: Add Device and Driver abstractions
Message-ID: <20240521212333.GA731457-robh@kernel.org>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172059.181256-4-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520172059.181256-4-dakr@redhat.com>

On Mon, May 20, 2024 at 07:20:50PM +0200, Danilo Krummrich wrote:
> From: Asahi Lina <lina@asahilina.net>
> 
> Add abstractions for DRM drivers and devices. These go together in one
> commit since both are fairly tightly coupled types.
> 
> A few things have been stubbed out, to be implemented as further bits of
> the DRM subsystem are introduced.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Co-developed-by: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |   2 +
>  rust/kernel/drm/device.rs       |  87 +++++++++
>  rust/kernel/drm/drv.rs          | 318 ++++++++++++++++++++++++++++++++
>  rust/kernel/drm/mod.rs          |   2 +
>  4 files changed, 409 insertions(+)
>  create mode 100644 rust/kernel/drm/device.rs
>  create mode 100644 rust/kernel/drm/drv.rs

[...]

> diff --git a/rust/kernel/drm/drv.rs b/rust/kernel/drm/drv.rs
> new file mode 100644
> index 000000000000..5dd8f3f8df7c
> --- /dev/null
> +++ b/rust/kernel/drm/drv.rs
> @@ -0,0 +1,318 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +
> +//! DRM driver core.
> +//!
> +//! C header: [`include/linux/drm/drm_drv.h`](../../../../include/linux/drm/drm_drv.h)
> +
> +use crate::{
> +    alloc::flags::*,
> +    bindings, device, drm,
> +    error::code::*,
> +    error::{Error, Result},
> +    prelude::*,
> +    private::Sealed,
> +    str::CStr,
> +    types::{ARef, ForeignOwnable},
> +    ThisModule,
> +};
> +use core::{
> +    marker::{PhantomData, PhantomPinned},
> +    pin::Pin,
> +};
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

This is missing an entry for DRIVER_GEM_GPUVA. And some others perhaps. 
I suppose some are legacy which won't be needed any time soon if ever. 
Not sure if you intend for this to be complete, or you are just adding 
what you are using? Only FEAT_GEM is used by nova ATM.

Rob
