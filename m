Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C2E2F3B
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Mar 2025 22:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743201980; cv=none; b=Iu9FRXN/RBBKz8BG0fBKu9fEkRfT6ULKuKtuFKvEVKLCP52+rUBthEfV3036gfYpFgyUhiOKmupDyIGkSBw27bMPHk0LxxBMwD6QYXY5+P5EtpKAoBKEOxjZXuLmRa91BoGwFThkHJ05HS0iBNtu3knTpIpQzk1uApcnl/EV9DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743201980; c=relaxed/simple;
	bh=gKPBVUpj+xuutNs0NDxBSv7wG9g2bTlQC3qVmWnO40M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7hfwFc5vni2TMeVaRUkuytkYp2CDEpyG3firPB9/viRUjuI7umfaTFAdlvpJMO/iOL1SsNtCc6z80Fv26UJC2KSr1rVOV3Mtty3TOIarkhCtIzYcoboyh37ti+oq7S6AVhE5a0tjdiWl1NMrIGC2oeZRj8s4yN58gd5GVGEiT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y54rwQTD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y54rwQTD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9D6C4CEE4;
	Fri, 28 Mar 2025 22:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743201979;
	bh=gKPBVUpj+xuutNs0NDxBSv7wG9g2bTlQC3qVmWnO40M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y54rwQTDxr9Sw0n66Or5YPHaLyYjr4sGExbr41S8t31zFTNaZNJEOG/oLYRaCkZrO
	 aUJzCmHOl2hwoCMWfue25wgvXNICtaN7dH6SjkSKCwRjsJPsHIn0wBEanCUyiTQNzm
	 HFP/Z9XSX0azyE3zZAcvV/R390L7Ha6MHfbwL0fmrRwqpAKRsjPajJwO1/2zRgvseH
	 c0rlHtxpyJdRq6UQIZfazbgAg5KA9jWs+5qIIXdLTKouWhIevRm8cSKCQZgPlrZ+ju
	 r3oh34cRdmxtnxmFZIhE3BDXgisIQMbU33ZF47VA0g6t0OHEeeFXbWtDoiG9Ju3RjP
	 ZWqMPqNqMCjzA==
Date: Fri, 28 Mar 2025 23:46:12 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, acurrid@nvidia.com,
	lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 3/8] rust: drm: add driver abstractions
Message-ID: <Z-cmtEZzILsLVpu9@pollux>
References: <20250325235522.3992-1-dakr@kernel.org>
 <20250325235522.3992-4-dakr@kernel.org>
 <43ad9fdcc62897bd0a78689020a8dd291b045ce4.camel@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <43ad9fdcc62897bd0a78689020a8dd291b045ce4.camel@redhat.com>

On Fri, Mar 28, 2025 at 06:00:11PM -0400, Lyude Paul wrote:
> On Wed, 2025-03-26 at 00:54 +0100, Danilo Krummrich wrote:
> > diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> > new file mode 100644
> > index 000000000000..1ac770482ae0
> > --- /dev/null
> > +++ b/rust/kernel/drm/driver.rs
> > @@ -0,0 +1,143 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +
> > +//! DRM driver core.
> > +//!
> > +//! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
> > +
> > +use crate::{bindings, drm, str::CStr};
> > +use macros::vtable;
> > +
> > +/// Driver use the GEM memory manager. This should be set for all modern drivers.
> > +pub const FEAT_GEM: u32 = bindings::drm_driver_feature_DRIVER_GEM;
> > +/// Driver supports mode setting interfaces (KMS).
> > +pub const FEAT_MODESET: u32 = bindings::drm_driver_feature_DRIVER_MODESET;
> > +/// Driver supports dedicated render nodes.
> > +pub const FEAT_RENDER: u32 = bindings::drm_driver_feature_DRIVER_RENDER;
> > +/// Driver supports the full atomic modesetting userspace API.
> > +///
> > +/// Drivers which only use atomic internally, but do not support the full userspace API (e.g. not
> > +/// all properties converted to atomic, or multi-plane updates are not guaranteed to be tear-free)
> > +/// should not set this flag.
> > +pub const FEAT_ATOMIC: u32 = bindings::drm_driver_feature_DRIVER_ATOMIC;
> > +/// Driver supports DRM sync objects for explicit synchronization of command submission.
> > +pub const FEAT_SYNCOBJ: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ;
> > +/// Driver supports the timeline flavor of DRM sync objects for explicit synchronization of command
> > +/// submission.
> > +pub const FEAT_SYNCOBJ_TIMELINE: u32 = bindings::drm_driver_feature_DRIVER_SYNCOBJ_TIMELINE;
> > +/// Driver supports compute acceleration devices. This flag is mutually exclusive with `FEAT_RENDER`
> > +/// and `FEAT_MODESET`. Devices that support both graphics and compute acceleration should be
> > +/// handled by two drivers that are connected using auxiliary bus.
> > +pub const FEAT_COMPUTE_ACCEL: u32 = bindings::drm_driver_feature_DRIVER_COMPUTE_ACCEL;
> > +/// Driver supports user defined GPU VA bindings for GEM objects.
> > +pub const FEAT_GEM_GPUVA: u32 = bindings::drm_driver_feature_DRIVER_GEM_GPUVA;
> > +/// Driver supports and requires cursor hotspot information in the cursor plane (e.g. cursor plane
> > +/// has to actually track the mouse cursor and the clients are required to set hotspot in order for
> > +/// the cursor planes to work correctly).
> > +pub const FEAT_CURSOR_HOTSPOT: u32 = bindings::drm_driver_feature_DRIVER_CURSOR_HOTSPOT;
> 
> IMHO I don't think that we should be exposing any of these constants, building
> the feature flag mask should honestly be abstracted away into the rust
> bindings as not doing so means it's very easy to break assumptions that could
> lead to unsoundness.

Yep, that was the plan, just forgot to make them crate private; on the other
hand I should probably drop them entirely for now.

- Danilo
