Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A863368978
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 00:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237760; cv=pass; b=QFNTlPxWTkykDRuZ8X7aXWWgtzAe2e/Jbq6xs68eSk9xY2yHpavu2KbXWmWlnwW4N59i8Jw0rDZ6b/q3GslLXUsCC52f4MGMx0kRJNWDd4P0ANdmszE/1LteQCTiwNqRkfd+fUzy1ASd98cdLKgGO6Nwr41ukzU0AecrPD3fx3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237760; c=relaxed/simple;
	bh=TuqZDjAVaZ3Slr0oSKc1yZCFOMavULV6m3OzBVSxviw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NchY3qJMvpOn4TE+XG2SYsrPuzNRoNoL6FTZNMg5A8+GbIuYS3gVx4CYVfTR8AhTeahpXqzfVX3CegaaPbW3svS4EjaIJTEwUkLPfutCmsu49TJoydE17aMrQqHiKiiExNblXe/Gr+EFvprBmc8B1O80oH9POd9/64x81o2ZBio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=kim84M7r; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="kim84M7r"
ARC-Seal: i=1; a=rsa-sha256; t=1772237752; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TYdY5es+oGOO3pZ4SXDDoT7KcFxOMpHiwTvE3i1unOeguHYtkj4nZ+sIIx57p/8/ikXkKx+lc0LMNkhwND/ktXV7fQjygFT2U8Tn7UBvkwQHhIMm2L1TFaffSgKp0zOmf7muSZAoqTHlVs/JRQFhlJApx2K+ApxBFrzQSGTeg2c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772237752; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5nFMWQWU4zEH65iO/rhvvbmp8zYj8uU1wd/pzV24teE=; 
	b=SZHDdGEQf0ZLCmxlVtBLYOcL3zsPgJivWgllOHky93XQ2Xl9VP051CXhgCMgqY63yO9sVKZCv9xaVG90fDHCRziKR4jfuVNU+eLstYIkzJR/CBCq8b0rVqWRgr/sgySBOHloaZ7eDBoef9AE/nXUK+0iogFO1AmJwejEUM2+h3s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772237752;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=5nFMWQWU4zEH65iO/rhvvbmp8zYj8uU1wd/pzV24teE=;
	b=kim84M7rh54X2rEzXEeAeVLY6/uP1MtQeOniP0QXA4oh5hY1YkHNxqsaOfiptwul
	LF2GRZ5gv/u/w1mm97YC2ehSlsWOKBgrFFrzFONEsmx2nlXj/eM+pwayyJdC6ZwZyta
	m8LPgkW6+cilBfWk3WnPgLCXxVBKfp0bLPRE5OTA=
Received: by mx.zohomail.com with SMTPS id 1772237749627842.6409021789674;
	Fri, 27 Feb 2026 16:15:49 -0800 (PST)
Date: Fri, 27 Feb 2026 16:15:49 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
Message-ID: <aaIztSwqsQ68XgVW@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-7-deborah.brouwer@collabora.com>
 <20260212091734.0497dc87@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212091734.0497dc87@fedora>

On Thu, Feb 12, 2026 at 09:17:34AM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:07 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
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
> >  drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
> >  1 file changed, 44 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> > index c1208d332dea..6a58f2da88d3 100644
> > --- a/drivers/gpu/drm/tyr/gem.rs
> > +++ b/drivers/gpu/drm/tyr/gem.rs
> > @@ -1,28 +1,64 @@
> >  // SPDX-License-Identifier: GPL-2.0 or MIT
> > +//! GEM buffer object management for the Tyr driver.
> > +//!
> > +//! This module provides buffer object (BO) management functionality using
> > +//! DRM's GEM subsystem with shmem backing.
> >  
> >  use kernel::{
> >      drm::{
> >          gem,
> > +        gem::shmem,
> >          DeviceContext, //
> >      },
> > -    prelude::*, //
> > +    prelude::*,
> > +    sync::aref::ARef, //
> >  };
> >  
> > -use crate::driver::TyrDrmDriver;
> > +use crate::driver::{
> > +    TyrDrmDevice,
> > +    TyrDrmDriver, //
> > +};
> >  
> > -/// GEM Object inner driver data
> > +/// Tyr's DriverObject type for GEM objects.
> >  #[pin_data]
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
> >  impl gem::DriverObject for BoData {
> >      type Driver = TyrDrmDriver;
> > -    type Args = ();
> > +    type Args = BoCreateArgs;
> >  
> >      fn new<Ctx: DeviceContext>(
> > -        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
> > +        _dev: &TyrDrmDevice<Ctx>,
> >          _size: usize,
> > -        _args: (),
> > +        args: BoCreateArgs,
> >      ) -> impl PinInit<Self, Error> {
> > -        try_pin_init!(BoData {})
> > +        try_pin_init!(Self { flags: args.flags })
> >      }
> >  }
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
> 
> Nit: I'd probably move this new_dummy_object() addition to the commit
> introducing Vm support.

Ok that works too.

> 
