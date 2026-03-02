Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15CE375AD2
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772446686; cv=none; b=pAtcJJq+tQ8vrRmS8F/JshPXi/fiirgyQGrgrCBZMGDYYHD+5D9aXD8spW9dYnO4XHhzGFUlzfQMK5QSDfMGdFRWJWalWrWvGkTuAS+1Lk3+E3fs/b2MwAyG5mRajuoziYuGdbPplg7S6QvPI22REMCujZMALni3bpldITGjPQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772446686; c=relaxed/simple;
	bh=pCqJ4cE7T2aqTIS/ZplrUeqTINb/S1pfopDiR7DbeoA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQtmX0W/s6XJ09MgMVv7Inno3mYV/pMq4miC0EpDkPTedsq2HX1esDUtYiVjJNeqvMDfxWAQtTKOTUQJCa0SJ2vzamSbAKEb9HjEUikYpgaAceZ7mQylcjDq9Vm1uNrGsp+6G1h+a4ONER+XlSLhfpi+u+qnMdiiWqZzoIVlJ9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BaNGQNqH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BaNGQNqH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772446683;
	bh=pCqJ4cE7T2aqTIS/ZplrUeqTINb/S1pfopDiR7DbeoA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BaNGQNqHvKkIG+rTvhkBCpzs0xzU+vdU+MZC7jAJ4uGxV8uemGUBBo6Tj8uSFkOIo
	 idkFuU9EMptEwLOf6r6o1M22ka9ypYauZlXRqoQa1LT/XRpyGwsWh6On5KVOzbnR2y
	 n7Nie0Lw6PM8BUAU0QX+gk2lhjV1yYuNDREh/6kt+GZcfwKHO0TX3ZSj0kxFwkauzA
	 ia5DLKuUiLBYlHVdm0J4bTc5MWRKi3l3usy0jKZDSaDzDc6tr095oD4jDhg87cBRkp
	 JAuJk5/dt6apRVv9qnWb1Ei2IIv0jTPMjL+ZGonf5/bA2hBOa6pSxWYQrLr0ZgoJIh
	 6T0/YJYpQNKnw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF2DD17E0251;
	Mon,  2 Mar 2026 11:18:02 +0100 (CET)
Date: Mon, 2 Mar 2026 11:17:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>,
 rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 dri-devel@lists.freedesktop.org, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
Message-ID: <20260302111757.7bae333d@fedora>
In-Reply-To: <aaI0H8u7nAbMySek@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
	<20260212013713.304343-7-deborah.brouwer@collabora.com>
	<A849CDE2-C257-42D7-9FD2-E9442A540264@collabora.com>
	<aaI0H8u7nAbMySek@um790>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 27 Feb 2026 16:17:35 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> On Fri, Feb 20, 2026 at 11:25:47AM -0300, Daniel Almeida wrote:
> > 
> >   
> > > On 11 Feb 2026, at 22:37, Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> > > 
> > > Add support for GEM buffer objects backed by shared memory.
> > > 
> > > This introduces the BoCreateArgs structure for passing creation parameters
> > > including flags, and adds a flags field to BoData. A new_dummy_object()
> > > helper is provided to create a dummy GEM object for use as a GPUVM root.
> > > 
> > > The Bo type alias is added to simplify working with Tyr's shmem-backed
> > > GEM objects throughout the driver.
> > > 
> > > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > > ---
> > > drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
> > > 1 file changed, 44 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> > > index c1208d332dea..6a58f2da88d3 100644
> > > --- a/drivers/gpu/drm/tyr/gem.rs
> > > +++ b/drivers/gpu/drm/tyr/gem.rs
> > > @@ -1,28 +1,64 @@
> > > // SPDX-License-Identifier: GPL-2.0 or MIT
> > > +//! GEM buffer object management for the Tyr driver.
> > > +//!
> > > +//! This module provides buffer object (BO) management functionality using
> > > +//! DRM's GEM subsystem with shmem backing.
> > > 
> > > use kernel::{
> > >     drm::{
> > >         gem,
> > > +        gem::shmem,
> > >         DeviceContext, //
> > >     },
> > > -    prelude::*, //
> > > +    prelude::*,
> > > +    sync::aref::ARef, //
> > > };
> > > 
> > > -use crate::driver::TyrDrmDriver;
> > > +use crate::driver::{
> > > +    TyrDrmDevice,
> > > +    TyrDrmDriver, //
> > > +};
> > > 
> > > -/// GEM Object inner driver data
> > > +/// Tyr's DriverObject type for GEM objects.
> > > #[pin_data]
> > > -pub(crate) struct BoData {}
> > > +pub(crate) struct BoData {
> > > +    flags: u32,
> > > +}
> > > +
> > > +/// Provides a way to pass arguments when creating BoData
> > > +/// as required by the gem::DriverObject trait.
> > > +pub(crate) struct BoCreateArgs {
> > > +    flags: u32,
> > > +}
> > > 
> > > impl gem::DriverObject for BoData {
> > >     type Driver = TyrDrmDriver;
> > > -    type Args = ();
> > > +    type Args = BoCreateArgs;
> > > 
> > >     fn new<Ctx: DeviceContext>(
> > > -        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
> > > +        _dev: &TyrDrmDevice<Ctx>,  
> > 
> > Unrelated change?  
> 
> I switched to use the convenience type alias `TyrDrmDevice<Ctx>`
> here instead of using its full path. I can flag that in the commit
> mesage if that is what you mean?

I'd probably do that in a separate commit, like Daniel suggested, even
if that means introducing a one-line commit just for that cosmetic
change.
