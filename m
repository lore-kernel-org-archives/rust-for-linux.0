Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2467263CB
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 00:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237871; cv=pass; b=ucNfn3kFEH/8heG7N1Gk7oXYUjEbjRmXnuF52B6GvzdLbbFHW9iHDZJKV93/k524+n1FAYzxhTM2rA58vjxn09fcrXLPoKmOWHPowkZDlS2R1nDIGFpC3G6CXjfrpauGzTCotOJoKAvVTyZYNt63cQ0PSeOVSWzCFSFxNTK6B9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237871; c=relaxed/simple;
	bh=AyWhE0nAVWkgfy7iqd4XULC970Hvz7QfVqrUmk1J00Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0dB+FdoUqe0F1YMwyTOCq24j77Ri0Z8tf67pY2GheIv/T/DfDj1Fm7gD+5cfC5MWxIADMCEx2lIl/Xy7qz9fSqywirk+SzJVMtoD8akzXXodDVxGjTuR00TtxkDFiiTyNsWL2dq3vcSu4RK6w5rM8EZxHW6el5B4zmLqyv11dU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=YRP89O2e; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="YRP89O2e"
ARC-Seal: i=1; a=rsa-sha256; t=1772237858; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b0gYgNeiBHZlQwsupS6nM/lxig0cCLKjbXzBX37M4t2QULe21Z+jh2R/W3inZdTpSMNq6t2P9qOc+atp7Ccpd4+0vP6UQnSwhQ4v3Ark4KUQIckkr3Uy/NUNIN/NxGAK0f0j5PBoQckOaT3MvpNNPwyuKC5WlXPF1NmIZOZrWlA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772237858; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xBboO8K+xkEUBzbYX5xV5gkcLBnmymkque8l0b3Hc3s=; 
	b=I+pBLGEPpuk4rNu3YwOg2nGjwssYtOKvrXokIFSfVFOTUD3OMq4UXuXW4moFXYAU8a52/7huzChvsa4Y5+51SvtYPaJP1oiOohWvLABau23bxK3A0+gOzPHfyDZqB8CD6AzR1ODXUtTr0qFgi3g/wsSLRweE0MbhWRO5l9ejeGQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772237858;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=xBboO8K+xkEUBzbYX5xV5gkcLBnmymkque8l0b3Hc3s=;
	b=YRP89O2eUZq9P3F9xOAh5AzQmeor///c96vI9IsYctgrR/P3bVKSkexKqnexrZG1
	A/QmlRxNeJjXx1xGMyxFkwRJAWoLWmKl/ml69Pz8LZkSZibgKiUlGb77mN2acHx5HWQ
	t1+m19zqc3Jq0V4LvKtMQfDbCWbAtf9LQxZ5VVx8=
Received: by mx.zohomail.com with SMTPS id 1772237857173103.26535471031525;
	Fri, 27 Feb 2026 16:17:37 -0800 (PST)
Date: Fri, 27 Feb 2026 16:17:35 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	aliceryhl@google.com, boris.brezillon@collabora.com,
	beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
Message-ID: <aaI0H8u7nAbMySek@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-7-deborah.brouwer@collabora.com>
 <A849CDE2-C257-42D7-9FD2-E9442A540264@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A849CDE2-C257-42D7-9FD2-E9442A540264@collabora.com>

On Fri, Feb 20, 2026 at 11:25:47AM -0300, Daniel Almeida wrote:
> 
> 
> > On 11 Feb 2026, at 22:37, Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> > 
> > Add support for GEM buffer objects backed by shared memory.
> > 
> > This introduces the BoCreateArgs structure for passing creation parameters
> > including flags, and adds a flags field to BoData. A new_dummy_object()
> > helper is provided to create a dummy GEM object for use as a GPUVM root.
> > 
> > The Bo type alias is added to simplify working with Tyr's shmem-backed
> > GEM objects throughout the driver.
> > 
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> > drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
> > 1 file changed, 44 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> > index c1208d332dea..6a58f2da88d3 100644
> > --- a/drivers/gpu/drm/tyr/gem.rs
> > +++ b/drivers/gpu/drm/tyr/gem.rs
> > @@ -1,28 +1,64 @@
> > // SPDX-License-Identifier: GPL-2.0 or MIT
> > +//! GEM buffer object management for the Tyr driver.
> > +//!
> > +//! This module provides buffer object (BO) management functionality using
> > +//! DRM's GEM subsystem with shmem backing.
> > 
> > use kernel::{
> >     drm::{
> >         gem,
> > +        gem::shmem,
> >         DeviceContext, //
> >     },
> > -    prelude::*, //
> > +    prelude::*,
> > +    sync::aref::ARef, //
> > };
> > 
> > -use crate::driver::TyrDrmDriver;
> > +use crate::driver::{
> > +    TyrDrmDevice,
> > +    TyrDrmDriver, //
> > +};
> > 
> > -/// GEM Object inner driver data
> > +/// Tyr's DriverObject type for GEM objects.
> > #[pin_data]
> > -pub(crate) struct BoData {}
> > +pub(crate) struct BoData {
> > +    flags: u32,
> > +}
> > +
> > +/// Provides a way to pass arguments when creating BoData
> > +/// as required by the gem::DriverObject trait.
> > +pub(crate) struct BoCreateArgs {
> > +    flags: u32,
> > +}
> > 
> > impl gem::DriverObject for BoData {
> >     type Driver = TyrDrmDriver;
> > -    type Args = ();
> > +    type Args = BoCreateArgs;
> > 
> >     fn new<Ctx: DeviceContext>(
> > -        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
> > +        _dev: &TyrDrmDevice<Ctx>,
> 
> Unrelated change?

I switched to use the convenience type alias `TyrDrmDevice<Ctx>`
here instead of using its full path. I can flag that in the commit
mesage if that is what you mean?

> 
> >         _size: usize,
> > -        _args: (),
> > +        args: BoCreateArgs,
> >     ) -> impl PinInit<Self, Error> {
> > -        try_pin_init!(BoData {})
> > +        try_pin_init!(Self { flags: args.flags })
> >     }
> > }
> > +
> > +/// Type alias for Tyr GEM buffer objects.
> > +pub(crate) type Bo = gem::shmem::Object<BoData>;
> > +
> > +/// Creates a dummy GEM object to serve as the root of a GPUVM.
> > +#[expect(dead_code)]
> > +pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) -> Result<ARef<Bo>> {
> > +    let bo = gem::shmem::Object::<BoData>::new(
> > +        ddev,
> > +        4096,
> > +        shmem::ObjectConfig {
> > +            map_wc: true,
> > +            parent_resv_obj: None,
> > +        },
> > +        BoCreateArgs { flags: 0 },
> > +    )?;
> > +
> > +    Ok(bo)
> > +}
> > -- 
> > 2.52.0
> > 
> > 
> 
