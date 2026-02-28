Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C1C27CCEE
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 01:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772240484; cv=pass; b=p8LYDY9RyPwP40Z/NZOSyxxC4E3ekqoDGNx1lcrExw+3rrJV9dfWcfKC5VHnz1k+vxJzrpGBwu67d/S37AYjCFGsLXunzqtD08tJ10nUj4h1EwIO8H2JD5xTtnA6Esxjy4fSY8HVfOV/iTOo/+E4GQpBVNtk3JLlA6fLa1oYMWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772240484; c=relaxed/simple;
	bh=Lm2qr0C1J6E6HzE08o6OLmtA/Jo0aoUV/5FgiNAK6jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwJ0e+uNftsQ11Nr1Tn3/FyuREYAtbpiRYL/+bcdTCm15FqKlLv7IHkE8/8ATLZLdAq6kdDAcvo+ktkrHl6Zu/OYd1cNcMd6tm4x0nxa8m8lAkj/OJAVS/269MRuXRotfQuevVJSWsJYyLcVgEcarETEwe2ADBArcReNcgdr1iw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=gjDb4m9u; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="gjDb4m9u"
ARC-Seal: i=1; a=rsa-sha256; t=1772240474; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lfIKqghSlKRsr1v3j4O6YwUstab/7Yy3ro1FFjCtluHHRFBxw4CF0/7JREycbTP6mmbOu5Dg2csy0+uygnIWig9+agtPEWONxul0EOa1hirPIxgbJODm0XZE5/1pjC9cA7NihMoyIwIc92ie9Npnt92//WnpAuRmZ+W/vk67bM0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772240474; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=i5sxaA2PVY8xbh1tFOsrEa6kopnjclUJ02+xow5C6wI=; 
	b=mKhFerBv+U7SoPU9N6ju/EoDemLW5ATM9i18jD/8Fj9QTQaWVyafCj2l+TpiLMN5wtQUT0sndVWXhG11w5/lEUki5MSrk2MqszaCfSjktX5mjaRbmyJQKIQxoFYIJxXhAHsCWbnVwjTrshGJz876PN+t6B6qfGN5Wz7Z5GGpKWw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772240473;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=i5sxaA2PVY8xbh1tFOsrEa6kopnjclUJ02+xow5C6wI=;
	b=gjDb4m9uh9NzREgbjFyLYB6soyPnLxNhVUw7d/Ys6nZurMwpHg66Dp29n9E5VPO5
	R7jNNBAnHsmVwzCv67ZODqdPV1kDSyNxWo6BK65H+QCaGdq5NGpEKIl0hILRH4Dor8t
	ZM36dpWA+MOHQuSwZ6zzxCTdjLfcSl5Uh/TnI9vA=
Received: by mx.zohomail.com with SMTPS id 1772240471537395.6159296527935;
	Fri, 27 Feb 2026 17:01:11 -0800 (PST)
Date: Fri, 27 Feb 2026 17:01:11 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 10/12] drm/tyr: add a kernel buffer object
Message-ID: <aaI-V6Ux_FYk6HZl@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-11-deborah.brouwer@collabora.com>
 <20260212120043.36a560e9@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212120043.36a560e9@fedora>

On Thu, Feb 12, 2026 at 12:00:43PM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:11 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > Introduce a buffer object type (KernelBo) for internal driver allocations
> > that are managed by the kernel rather than userspace.
> > 
> > KernelBo wraps a GEM shmem object and automatically handles GPU virtual
> > address space mapping during creation and unmapping on drop. This provides
> > a safe and convenient way for the driver to both allocate and clean up
> > internal buffers for kernel-managed resources.
> > 
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  drivers/gpu/drm/tyr/gem.rs | 74 +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 70 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> > index 111acf33993f..3807810be7ea 100644
> > --- a/drivers/gpu/drm/tyr/gem.rs
> > +++ b/drivers/gpu/drm/tyr/gem.rs
> > @@ -4,6 +4,8 @@
> >  //! This module provides buffer object (BO) management functionality using
> >  //! DRM's GEM subsystem with shmem backing.
> >  
> > +use core::ops::Range;
> > +
> >  use kernel::{
> >      drm::{
> >          gem,
> > @@ -11,12 +13,22 @@
> >          DeviceContext, //
> >      },
> >      prelude::*,
> > -    sync::aref::ARef, //
> > +    sync::{
> > +        aref::ARef,
> > +        Arc,
> > +        ArcBorrow, //
> > +    },
> >  };
> >  
> > -use crate::driver::{
> > -    TyrDrmDevice,
> > -    TyrDrmDriver, //
> > +use crate::{
> > +    driver::{
> > +        TyrDrmDevice,
> > +        TyrDrmDriver, //
> > +    },
> > +    vm::{
> > +        Vm,
> > +        VmMapFlags, //
> > +    },
> >  };
> >  
> >  /// Tyr's DriverObject type for GEM objects.
> > @@ -61,3 +73,57 @@ pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) ->
> >  
> >      Ok(bo)
> >  }
> > +
> > +/// A buffer object that is owned and managed by Tyr rather than userspace.
> > +pub(crate) struct KernelBo {
> > +    #[expect(dead_code)]
> > +    pub(crate) bo: ARef<Bo>,
> > +    vm: Arc<Vm>,
> > +    va_range: Range<u64>,
> 
> Missing docs for all those fields.
Ack.
> 
> > +}
> > +
> > +impl KernelBo {
> > +    /// Creates a new kernel-owned buffer object and maps it into GPU VA space.
> > +    #[expect(dead_code)]
> > +    pub(crate) fn new<Ctx: DeviceContext>(
> > +        ddev: &TyrDrmDevice<Ctx>,
> > +        vm: ArcBorrow<'_, Vm>,
> > +        size: u64,
> > +        va: u64,
> 
> I'm already thinking about the next step (automatic VA-range
> allocation), and I'd be tempted to go directly for:
> 
> enum KernelBoVaAlloc {
> 	Explicit(u64),
> }
> 
> so we can easily extend it with
> 
> enum KernelBoVaAlloc {
> 	Auto,
> 	Explicit(u64),
> }
> 
> when we have to.
> 
Sure that is easily done.

> > +        flags: VmMapFlags,
> > +    ) -> Result<Self> {
> > +        let bo = gem::shmem::Object::<BoData>::new(
> > +            ddev,
> > +            size as usize,
> > +            shmem::ObjectConfig {
> > +                map_wc: true,
> > +                parent_resv_obj: None,
> > +            },
> > +            BoCreateArgs { flags: 0 },
> > +        )?;
> > +
> > +        vm.map_bo_range(&bo, 0, size, va, flags)?;
> > +
> > +        Ok(KernelBo {
> > +            bo,
> > +            vm: vm.into(),
> > +            va_range: va..(va + size),
> > +        })
> > +    }
> > +}
> > +
> > +impl Drop for KernelBo {
> > +    fn drop(&mut self) {
> > +        let va = self.va_range.start;
> > +        let size = self.va_range.end - self.va_range.start;
> > +
> > +        if let Err(e) = self.vm.unmap_range(va, size) {
> > +            pr_err!(
> > +                "Failed to unmap KernelBo range {:#x}..{:#x}: {:?}\n",
> > +                self.va_range.start,
> > +                self.va_range.end,
> > +                e
> > +            );
> > +        }
> > +    }
> > +}
> 
