Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9064A23
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471014; cv=pass; b=W6Kgg4g0HiQQ/uJ7UihRdv++F9k8BxJoSJsRVtYrbKePxxVNlNPTTXspEjN00WY6f15Z7NPazR/dhpGtN9q9ndVanJR3Vr5dwmmE8jE8tFXnf7xiNIib3Nx18i+EF/KdLp109+D1GNDKC/FxOdxhgOcSzPXelTD0aa10HKaLqfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471014; c=relaxed/simple;
	bh=ub95iMK1ZTUVrns/iuK9oSUqW2cXG9p86NQBNckeM7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEIc0UtHuzo23CSuffExKeEOoCH2zHHRIQlUyrFItHcjDx0gHoOA4iuMUO3oqHSe8zIUkz8uyF89EOrD/wa/BER4zP9QzGZ+kGvof0HthhMnXu7mYAstp8UonqMxPMv25XE744qH2rvNcu7ggQ9ZpIkQC8dMOLsERfVQ2MvObV4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=UB1WmjJ1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="UB1WmjJ1"
ARC-Seal: i=1; a=rsa-sha256; t=1772471006; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nIxKPqimEkEj3+VtKwCQbDx59+lpFCaUJb9STfD37jWy55f4WFBgSQy5MXBwxqDPMBueYuSsYeofCP2vDkEJMXvWq8LZnwDpjhzMau7j/XvSN9g3x/ekSC7+4kiQKBI6tITLlrz8VRc4WgMnKo5gBAsH+uJ66EObjDtxAN77OHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772471006; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G1nGZ9pjYdRxj6fO5beVqDO4Q6KE8nU16ODj3Ijuy10=; 
	b=BPfjAmHdlzhwEeW6rKSPnmQa1Fk0Hd8mPQm3FBAXZ5UJjhFt6XB0q/voPp/0JWj+0MapORQsROl26T4kUCtb7Cd37QXJTejHsu0TCP5UYCl9IxJRjzQxm1R/OUsJcxsH7ED8KAfnK9RCUWSh4g6IhseolhzHZOoiEKq+T5Yj44s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772471006;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=G1nGZ9pjYdRxj6fO5beVqDO4Q6KE8nU16ODj3Ijuy10=;
	b=UB1WmjJ1ufcshvvX87pa61YDincaf/ugV96I5jJxRFwgQXRtHhgzp85jqLfHZKo+
	XT5jjkyokSGCjEt/tjdTbnfI/8Dy2gVlvnobQEql8Zidh3XxqXHQ0dhqzwRAv51FTof
	WSwOgop748oVJBK7+dVYkDpRC5o8Z0LAJFHs488g=
Received: by mx.zohomail.com with SMTPS id 1772471003268422.2853518645959;
	Mon, 2 Mar 2026 09:03:23 -0800 (PST)
Date: Mon, 2 Mar 2026 09:03:22 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: rust-for-linux@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	dri-devel@lists.freedesktop.org, aliceryhl@google.com,
	beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
Message-ID: <aaXC2td--4_afzT4@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-7-deborah.brouwer@collabora.com>
 <A849CDE2-C257-42D7-9FD2-E9442A540264@collabora.com>
 <aaI0H8u7nAbMySek@um790>
 <20260302111757.7bae333d@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302111757.7bae333d@fedora>

On Mon, Mar 02, 2026 at 11:17:57AM +0100, Boris Brezillon wrote:
> On Fri, 27 Feb 2026 16:17:35 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > On Fri, Feb 20, 2026 at 11:25:47AM -0300, Daniel Almeida wrote:
> > > 
> > >   
> > > > On 11 Feb 2026, at 22:37, Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> > > > 
> > > > Add support for GEM buffer objects backed by shared memory.
> > > > 
> > > > This introduces the BoCreateArgs structure for passing creation parameters
> > > > including flags, and adds a flags field to BoData. A new_dummy_object()
> > > > helper is provided to create a dummy GEM object for use as a GPUVM root.
> > > > 
> > > > The Bo type alias is added to simplify working with Tyr's shmem-backed
> > > > GEM objects throughout the driver.
> > > > 
> > > > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > > > ---
> > > > drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
> > > > 1 file changed, 44 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> > > > index c1208d332dea..6a58f2da88d3 100644
> > > > --- a/drivers/gpu/drm/tyr/gem.rs
> > > > +++ b/drivers/gpu/drm/tyr/gem.rs
> > > > @@ -1,28 +1,64 @@
> > > > // SPDX-License-Identifier: GPL-2.0 or MIT
> > > > +//! GEM buffer object management for the Tyr driver.
> > > > +//!
> > > > +//! This module provides buffer object (BO) management functionality using
> > > > +//! DRM's GEM subsystem with shmem backing.
> > > > 
> > > > use kernel::{
> > > >     drm::{
> > > >         gem,
> > > > +        gem::shmem,
> > > >         DeviceContext, //
> > > >     },
> > > > -    prelude::*, //
> > > > +    prelude::*,
> > > > +    sync::aref::ARef, //
> > > > };
> > > > 
> > > > -use crate::driver::TyrDrmDriver;
> > > > +use crate::driver::{
> > > > +    TyrDrmDevice,
> > > > +    TyrDrmDriver, //
> > > > +};
> > > > 
> > > > -/// GEM Object inner driver data
> > > > +/// Tyr's DriverObject type for GEM objects.
> > > > #[pin_data]
> > > > -pub(crate) struct BoData {}
> > > > +pub(crate) struct BoData {
> > > > +    flags: u32,
> > > > +}
> > > > +
> > > > +/// Provides a way to pass arguments when creating BoData
> > > > +/// as required by the gem::DriverObject trait.
> > > > +pub(crate) struct BoCreateArgs {
> > > > +    flags: u32,
> > > > +}
> > > > 
> > > > impl gem::DriverObject for BoData {
> > > >     type Driver = TyrDrmDriver;
> > > > -    type Args = ();
> > > > +    type Args = BoCreateArgs;
> > > > 
> > > >     fn new<Ctx: DeviceContext>(
> > > > -        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
> > > > +        _dev: &TyrDrmDevice<Ctx>,  
> > > 
> > > Unrelated change?  
> > 
> > I switched to use the convenience type alias `TyrDrmDevice<Ctx>`
> > here instead of using its full path. I can flag that in the commit
> > mesage if that is what you mean?
> 
> I'd probably do that in a separate commit, like Daniel suggested, even
> if that means introducing a one-line commit just for that cosmetic
> change.

Sure, i'll check to make sure i haven't done this anywhere else, and
gather them all into a separate commit.

