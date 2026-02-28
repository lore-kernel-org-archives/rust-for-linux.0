Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BAB239562
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 00:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772238726; cv=pass; b=sCDy2Jhh5EkFFFGNNkaIo2tCFt8aQyztdiZYteES9BR+44KQKNdrzGGl+sW0sn4SQ8F9jvPxMTPvy67m/CONC2kOYXzDAQVGOT9S0LbEze+gdtjT/+hYlDjDiYlr8NEh4I2ty8AkkMVcjqa8h44gJqPaLvUWisN4vrnm6o5Ozlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772238726; c=relaxed/simple;
	bh=C3CnTFwSthot4sYLVs71VHIeX+OkLFCZaQ1LOS8DEBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpDxk8BrrbOklsUEkl/lKPywx9EpoObHjGCHPwBG4G6iYLL8C8JnaMOuUb5ApTw6pQvjZvgs9ND17BipOgaotszZ6uG7zKGay9T776opvi2CWvl1QsbHfaY5PXIkgI4WqttoQ+/XwqlB/rZbd8ORevJs0jELi5Q+wEhA+gRiA74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=Dj6xmKcu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="Dj6xmKcu"
ARC-Seal: i=1; a=rsa-sha256; t=1772238717; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fwOgd8ByCLrknjw+j36cKkLr60I5L9/C8oMwkbHuDVc9I5oggsoWnKRQb4yl5+pJonLSBG21jeB+jIKWH/SSd3y+FrZuooFiWXy3ugbrZjtt0kNDCX6TnPhRPLHX6TLAyNTqgF8neEtNwqE2RUmzpNof0a/KivXl0Y6tVia88Dg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772238717; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oCIHlpQgBkmjDuN9ncF6UHRqsxo3OYDm6kfja9KZP+s=; 
	b=Raj7tcTCG0yXw0a337HNlyEM70m8Hyc/V5at34npihWFKZaYE9sE2elYg3T/tov+UWhqZhJ2IHzdQnkWlKhRQjij08tOAphzaYJmSDceghtICh/X/3LWPisEKcYts70ihPIm8fhrgsNPR/e7fAMXrb5Kmj9zWZ7PM0CswnuMNDg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772238717;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=oCIHlpQgBkmjDuN9ncF6UHRqsxo3OYDm6kfja9KZP+s=;
	b=Dj6xmKcuECr373zFV2ERvQtVHQaZieWoh0lnU7bmQZPcI9sKjeiXQN+HrRZKcY9n
	8ClaqpfnGPCzXneG3c7mYHFDTbEBVCwS6yd89DlJiFKotn3MK/Hg76c+nhM2tliJPXy
	84YsleSVgPuqDY2KIFnJ9NkxOjcT6jgY/fp2k05o=
Received: by mx.zohomail.com with SMTPS id 1772238715560812.3808240970304;
	Fri, 27 Feb 2026 16:31:55 -0800 (PST)
Date: Fri, 27 Feb 2026 16:31:54 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
Message-ID: <aaI3erbu6Gr5StrX@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com>
 <20260212114418.3d7d7ca8@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212114418.3d7d7ca8@fedora>

On Thu, Feb 12, 2026 at 11:44:18AM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:09 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > 
> > Add a Memory Management Unit (MMU) driver for Tyr. The MMU wraps a
> > SlotManager for allocating hardware address space slots. The underlying
> > AddressSpaceManager performs MMU operations including enabling/disabling
> > address spaces, flushing page tables, and locking regions for page table
> > updates.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  drivers/gpu/drm/tyr/driver.rs            |   3 +
> >  drivers/gpu/drm/tyr/mmu.rs               |  91 +++++++
> >  drivers/gpu/drm/tyr/mmu/address_space.rs | 322 +++++++++++++++++++++++
> >  drivers/gpu/drm/tyr/tyr.rs               |   1 +
> >  4 files changed, 417 insertions(+)
> >  create mode 100644 drivers/gpu/drm/tyr/mmu.rs
> >  create mode 100644 drivers/gpu/drm/tyr/mmu/address_space.rs
> > 
> > diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> > index 2973a8b3cc09..ad5a765a6c2a 100644
> > --- a/drivers/gpu/drm/tyr/driver.rs
> > +++ b/drivers/gpu/drm/tyr/driver.rs
> > @@ -43,6 +43,7 @@
> >      gem::BoData,
> >      gpu,
> >      gpu::GpuInfo,
> > +    mmu::Mmu,
> >      regs, //
> >  };
> >  
> > @@ -148,6 +149,8 @@ fn probe(
> >          let uninit_ddev = UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref())?;
> >          let platform: ARef<platform::Device> = pdev.into();
> >  
> > +        let _mmu = Mmu::new(pdev, iomem.as_arc_borrow(), &gpu_info)?;
> > +
> >          let data = try_pin_init!(TyrDrmDeviceData {
> >                  pdev: platform.clone(),
> >                  clks <- new_mutex!(Clocks {
> > diff --git a/drivers/gpu/drm/tyr/mmu.rs b/drivers/gpu/drm/tyr/mmu.rs
> > new file mode 100644
> > index 000000000000..8e076c35f342
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tyr/mmu.rs
> > @@ -0,0 +1,91 @@
> > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > +
> > +//! Memory Management Unit (MMU) driver for the Tyr GPU.
> > +//!
> > +//! This module manages GPU address spaces and virtual memory operations through
> > +//! hardware MMU slots. It provides functionality for flushing page tables and
> > +//! managing VM updates for active address spaces.
> > +//!
> > +//! The MMU coordinates with the [`AddressSpaceManager`] to handle hardware
> > +//! address space allocation and page table operations, using [`SlotManager`]
> > +//! to track which address spaces are currently active in hardware slots.
> > +//!
> > +//! [`AddressSpaceManager`]: address_space::AddressSpaceManager
> > +//! [`SlotManager`]: crate::slot::SlotManager
> > +#![allow(dead_code)]
> > +
> > +use core::ops::Range;
> > +
> > +use kernel::{
> > +    devres::Devres,
> > +    new_mutex,
> > +    platform,
> > +    prelude::*,
> > +    sync::{
> > +        Arc,
> > +        ArcBorrow,
> > +        Mutex, //
> > +    }, //
> > +};
> > +
> > +use crate::{
> > +    driver::IoMem,
> > +    gpu::GpuInfo,
> > +    mmu::address_space::{
> > +        AddressSpaceManager,
> > +        VmAsData, //
> > +    },
> > +    regs::MAX_AS_REGISTERS,
> > +    slot::{
> > +        SlotManager, //
> > +    }, //
> 
> formatting nit:
> 	slot::SlotManager, //
> 
> > +};
> > +
> > +pub(crate) mod address_space;
> > +
> > +pub(crate) type AsSlotManager = SlotManager<AddressSpaceManager, MAX_AS_REGISTERS>;
> > +
> 
> /// MMU component of the GPU.
> ///
> /// This is used to bind VM objects to an AS (Address Space) slot
> /// and make the VM active on the GPU.
> 
> > +#[pin_data]
> > +pub(crate) struct Mmu {
> > +    /// Manages the allocation of hardware MMU slots to GPU address spaces.
> > +    ///
> > +    /// Tracks which address spaces are currently active in hardware slots and
> > +    /// coordinates address space operations like flushing and VM updates.
> > +    #[pin]
> > +    pub(crate) as_manager: Mutex<AsSlotManager>,
> > +}
> > +
> > +impl Mmu {
> 
>     /// Create an MMU component for this device.
> 
> > +    pub(crate) fn new(
> > +        pdev: &platform::Device,
> > +        iomem: ArcBorrow<'_, Devres<IoMem>>,
> > +        gpu_info: &GpuInfo,
> > +    ) -> Result<Arc<Mmu>> {
> > +        let slot_count = gpu_info.as_present.count_ones().try_into()?;
> > +        let as_manager = AddressSpaceManager::new(pdev, iomem, gpu_info.as_present)?;
> > +        let mmu_init = try_pin_init!(Self{
> > +            as_manager <- new_mutex!(SlotManager::new(as_manager, slot_count)?),
> > +        });
> > +        Arc::pin_init(mmu_init, GFP_KERNEL)
> > +    }
> > +
> 
>     /// Make a VM active.
>     ///
>     /// This implies assigning the VM to an AS slot through the slot
>     /// manager.
> > +    pub(crate) fn activate_vm(&self, vm: ArcBorrow<'_, VmAsData>) -> Result {
> > +        self.as_manager.lock().activate_vm(vm)
> > +    }
> > +
> 
>     /// Make the VM inactive.
>     ///
>     /// Evicts the VM from its AS slot through the slot manager.
> 
> > +    pub(crate) fn deactivate_vm(&self, vm: &VmAsData) -> Result {
> > +        self.as_manager.lock().deactivate_vm(vm)
> > +    }
> > +
> 
>     /// Flush caches after a VM update.
>     ///
>     /// If the VM is no longer resident, this is a NOP, otherwise, the
>     /// AS manager will flush the GPU and MMU (TLB) caches.
> > +    pub(crate) fn flush_vm(&self, vm: &VmAsData) -> Result {
> > +        self.as_manager.lock().flush_vm(vm)
> > +    }
> > +
> 
>     /// Flags the start of a VM update.
>     ///
>     /// If the VM is resident, any GPU access on the memory range being
>     /// updated will be blocked until `Mmu::end_vm_update()` is called.
>     /// This guarantees the atomicity of a VM update.
>     /// If the VM is not resident, this is a NOP.
> > +    pub(crate) fn start_vm_update(&self, vm: &VmAsData, region: &Range<u64>) -> Result {
> > +        self.as_manager.lock().start_vm_update(vm, region)
> > +    }
> > +
> 
>     /// Flags the end of a VM update.
>     ///
>     /// If the VM is resident, this will let GPU accesse on the updated
>     /// range go through, in case any of them were blocked.
>     /// If the VM is not resident, this is a NOP.
> > +    pub(crate) fn end_vm_update(&self, vm: &VmAsData) -> Result {
> > +        self.as_manager.lock().end_vm_update(vm)
> > +    }
> > +}
> > diff --git a/drivers/gpu/drm/tyr/mmu/address_space.rs b/drivers/gpu/drm/tyr/mmu/address_space.rs
> > new file mode 100644
> > index 000000000000..60e9a79112f0
> > --- /dev/null
> > +++ b/drivers/gpu/drm/tyr/mmu/address_space.rs
> > @@ -0,0 +1,322 @@
> > +// SPDX-License-Identifier: GPL-2.0 or MIT
> > +
> > +//! GPU address space management and hardware operations.
> > +//!
> > +//! This module manages GPU hardware address spaces, including configuration,
> > +//! command submission, and page table update regions. It handles the hardware
> > +//! interaction for MMU operations through MMIO register access.
> > +//!
> > +//! The [`AddressSpaceManager`] implements [`SlotOperations`] to integrate with
> > +//! the slot management system, enabling and configuring address spaces in the
> > +//! hardware slots as needed.
> > +//!
> > +//! [`SlotOperations`]: crate::slot::SlotOperations
> > +
> > +use core::ops::Range;
> > +
> > +use kernel::{
> > +    bits::*,
> > +    device::{
> > +        Bound,
> > +        Device, //
> > +    },
> > +    devres::Devres,
> > +    error::Result,
> > +    io,
> > +    iommu::pgtable::{
> > +        IoPageTable,
> > +        ARM64LPAES1, //
> > +    },
> > +    platform,
> > +    prelude::*,
> > +    sync::{
> > +        aref::ARef,
> > +        Arc,
> > +        ArcBorrow,
> > +        LockedBy, //
> > +    },
> > +    time::Delta, //
> > +};
> > +
> > +use crate::{
> > +    driver::IoMem,
> > +    mmu::{
> > +        AsSlotManager,
> > +        Mmu, //
> > +    },
> > +    regs::*,
> > +    slot::{
> > +        Seat,
> > +        SlotOperations, //
> > +    }, //
> > +};
> > +
> > +/// Hardware address space configuration registers.
> > +///
> > +/// Contains the values to be written to the GPU's AS registers when
> > +/// activating this address space.
> > +#[derive(Clone, Copy)]
> > +pub(crate) struct AddressSpaceConfig {
> > +    pub(crate) transcfg: u64,
> > +    pub(crate) transtab: u64,
> > +    pub(crate) memattr: u64,
> 
> Don't know if we need to document those fields.

v2 will add docs.

> 
> > +}
> > +
> > +/// Any resource/information that will be used by the AddressSpaceManager
> > +/// to make a VM active is present in VmAsData.
> > +///
> > +/// On activation, we will pass an Arc<VmAsData> that will be stored in
> > +/// the slot to make sure the page table and the underlying resources
> > +/// (pages) used by the AS slot won't go away while the MMU points to
> > +/// those.
> > +pub(crate) struct VmAsData {
> > +    /// Tracks this VM's binding to a hardware address space slot.
> > +    as_seat: LockedBy<Seat, AsSlotManager>,
> > +    /// Hardware configuration for this address space.
> > +    as_config: AddressSpaceConfig,
> > +    /// Page table (managed by devres).
> > +    pub(crate) page_table: Pin<KBox<Devres<IoPageTable<ARM64LPAES1>>>>,
> > +}
> > +
> > +impl VmAsData {
> 
> Missing doc.
> 
> > +    pub(crate) fn new(
> > +        mmu: &Mmu,
> > +        as_config: AddressSpaceConfig,
> > +        page_table: Pin<KBox<Devres<IoPageTable<ARM64LPAES1>>>>,
> > +    ) -> VmAsData {
> > +        Self {
> > +            as_seat: LockedBy::new(&mmu.as_manager, Seat::NoSeat),
> > +            as_config,
> > +            page_table,
> > +        }
> > +    }
> > +}
> > +
> > +/// Manages GPU hardware address spaces via MMIO register operations.
> > +pub(crate) struct AddressSpaceManager {
> 
> Missing docs on the first two fields.
> 
> > +    pdev: ARef<platform::Device>,
> > +    iomem: Arc<Devres<IoMem>>,
> > +    /// Bitmask of available address space slots from GPU_AS_PRESENT register
> > +    as_present: u32,
> > +}
> > +
> > +impl SlotOperations for AddressSpaceManager {
> > +    type SlotData = Arc<VmAsData>;
> > +
> > +    fn activate(&mut self, slot_idx: usize, slot_data: &Self::SlotData) -> Result {
> > +        self.as_enable(slot_idx, &slot_data.as_config)
> > +    }
> > +
> > +    fn evict(&mut self, slot_idx: usize, _slot_data: &Self::SlotData) -> Result {
> > +        if self.iomem.try_access().is_some() {
> > +            let _ = self.as_flush(slot_idx);
> > +            let _ = self.as_disable(slot_idx);
> 
> I don't think we should ignore the errors returned by
> as_flush/disable(). Ultimately, what we should do is trigger a GPU
> reset and leave the slot 'busy' until we're sure no one will try
> to use it (the "stop everything" happening in the reset path). Once this
> is done, we can forcibly evict the VM (basically remove the VM from the
> slot without doing any HW transaction) and let the reset do its job.
> 
> Since we're not yet at a point where we have a functional reset flow,
> I'd recommend failing the eviction if as_flush/disable() returns an
> error (shouldn't happen with just the FW-boot logic anyway). This means
> we might leave active slots behind and possibly leak resources when that
> happens, but that's better than the UAF we'd create if the AS still
> points to a page table that's been freed.

Ack v2 will propagate these errors.

> 
> > +        }
> > +        Ok(())
> > +    }
> > +}
> > +
> > +impl AddressSpaceManager {
> 
> Missing docs.
> 
> > +    pub(super) fn new(
> > +        pdev: &platform::Device,
> > +        iomem: ArcBorrow<'_, Devres<IoMem>>,
> > +        as_present: u32,
> > +    ) -> Result<AddressSpaceManager> {
> > +        Ok(Self {
> > +            pdev: pdev.into(),
> > +            iomem: iomem.into(),
> > +            as_present,
> > +        })
> > +    }
> > +
> > +    fn dev(&self) -> &Device<Bound> {
> > +        // SAFETY: pdev is a bound device.
> > +        unsafe { self.pdev.as_ref().as_bound() }
> > +    }
> > +
> > +    fn validate_as_slot(&self, as_nr: usize) -> Result {
> > +        if as_nr >= MAX_AS_REGISTERS {
> > +            pr_err!(
> > +                "AS slot {} out of valid range (max {})\n",
> > +                as_nr,
> > +                MAX_AS_REGISTERS
> > +            );
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        if (self.as_present & (1 << as_nr)) == 0 {
> > +            pr_err!(
> > +                "AS slot {} not present in hardware (AS_PRESENT={:#x})\n",
> > +                as_nr,
> > +                self.as_present
> > +            );
> > +            return Err(EINVAL);
> > +        }
> > +
> > +        Ok(())
> > +    }
> > +
> > +    fn as_wait_ready(&self, as_nr: usize) -> Result {
> > +        let op = || as_status(as_nr)?.read(self.dev(), &self.iomem);
> > +        let cond = |status: &u32| -> bool { *status & AS_STATUS_ACTIVE == 0 };
> > +        let _ =
> > +            io::poll::read_poll_timeout(op, cond, Delta::from_millis(0), Delta::from_millis(10))?;
> > +
> > +        Ok(())
> > +    }
> > +
> > +    fn as_send_cmd(&mut self, as_nr: usize, cmd: u32) -> Result {
> > +        self.as_wait_ready(as_nr)?;
> > +        as_command(as_nr)?.write(self.dev(), &self.iomem, cmd)?;
> > +        Ok(())
> > +    }
> > +
> > +    fn as_send_cmd_and_wait(&mut self, as_nr: usize, cmd: u32) -> Result {
> > +        self.as_send_cmd(as_nr, cmd)?;
> > +        self.as_wait_ready(as_nr)?;
> > +        Ok(())
> > +    }
> > +
> > +    fn as_enable(&mut self, as_nr: usize, as_config: &AddressSpaceConfig) -> Result {
> > +        self.validate_as_slot(as_nr)?;
> > +
> > +        let transtab = as_config.transtab;
> > +        let transcfg = as_config.transcfg;
> > +        let memattr = as_config.memattr;
> > +
> > +        let transtab_lo = (transtab & 0xffffffff) as u32;
> > +        let transtab_hi = (transtab >> 32) as u32;
> > +
> > +        let transcfg_lo = (transcfg & 0xffffffff) as u32;
> > +        let transcfg_hi = (transcfg >> 32) as u32;
> > +
> > +        let memattr_lo = (memattr & 0xffffffff) as u32;
> > +        let memattr_hi = (memattr >> 32) as u32;
> > +
> > +        let dev = self.dev();
> > +        as_transtab_lo(as_nr)?.write(dev, &self.iomem, transtab_lo)?;
> > +        as_transtab_hi(as_nr)?.write(dev, &self.iomem, transtab_hi)?;
> > +
> > +        as_transcfg_lo(as_nr)?.write(dev, &self.iomem, transcfg_lo)?;
> > +        as_transcfg_hi(as_nr)?.write(dev, &self.iomem, transcfg_hi)?;
> > +
> > +        as_memattr_lo(as_nr)?.write(dev, &self.iomem, memattr_lo)?;
> > +        as_memattr_hi(as_nr)?.write(dev, &self.iomem, memattr_hi)?;
> > +
> > +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_UPDATE)?;
> > +
> > +        Ok(())
> > +    }
> > +
> > +    fn as_disable(&mut self, as_nr: usize) -> Result {
> > +        self.validate_as_slot(as_nr)?;
> > +
> > +        // Flush AS before disabling
> > +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_FLUSH_MEM)?;
> > +
> > +        let dev = self.dev();
> > +        as_transtab_lo(as_nr)?.write(dev, &self.iomem, 0)?;
> > +        as_transtab_hi(as_nr)?.write(dev, &self.iomem, 0)?;
> > +
> > +        as_memattr_lo(as_nr)?.write(dev, &self.iomem, 0)?;
> > +        as_memattr_hi(as_nr)?.write(dev, &self.iomem, 0)?;
> > +
> > +        as_transcfg_lo(as_nr)?.write(dev, &self.iomem, AS_TRANSCFG_ADRMODE_UNMAPPED as u32)?;
> > +        as_transcfg_hi(as_nr)?.write(dev, &self.iomem, 0)?;
> > +
> > +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_UPDATE)?;
> > +
> > +        Ok(())
> > +    }
> > +
> > +    fn as_start_update(&mut self, as_nr: usize, region: &Range<u64>) -> Result {
> > +        self.validate_as_slot(as_nr)?;
> > +
> > +        // The locked region is a naturally aligned power of 2 block encoded as
> > +        // log2 minus(1).
> > +        //
> > +        // Calculate the desired start/end and look for the highest bit which
> > +        // differs. The smallest naturally aligned block must include this bit
> > +        // change, the desired region starts with this bit (and subsequent bits)
> > +        // zeroed and ends with the bit (and subsequent bits) set to one.
> > +        let region_width = core::cmp::max(
> > +            64 - (region.start ^ (region.end - 1)).leading_zeros() as u8,
> > +            AS_LOCK_REGION_MIN_SIZE.trailing_zeros() as u8,
> > +        ) - 1;
> > +
> > +        // Mask off the low bits of region.start, which would be ignored by the
> > +        // hardware anyways.
> > +        let region_start =
> > +            region.start & genmask_checked_u64(u32::from(region_width)..=63).ok_or(EINVAL)?;
> > +
> > +        let region = (u64::from(region_width)) | region_start;
> > +
> > +        let region_lo = (region & 0xffffffff) as u32;
> > +        let region_hi = (region >> 32) as u32;
> > +
> > +        // Lock the region that needs to be updated.
> > +        let dev = self.dev();
> > +        as_lockaddr_lo(as_nr)?.write(dev, &self.iomem, region_lo)?;
> > +        as_lockaddr_hi(as_nr)?.write(dev, &self.iomem, region_hi)?;
> > +
> > +        self.as_send_cmd(as_nr, AS_COMMAND_LOCK)
> > +    }
> > +
> > +    fn as_end_update(&mut self, as_nr: usize) -> Result {
> > +        self.validate_as_slot(as_nr)?;
> > +        self.as_send_cmd_and_wait(as_nr, AS_COMMAND_FLUSH_PT)
> > +    }
> > +
> > +    fn as_flush(&mut self, as_nr: usize) -> Result {
> > +        self.validate_as_slot(as_nr)?;
> > +        self.as_send_cmd(as_nr, AS_COMMAND_FLUSH_PT)
> > +    }
> > +}
> > +
> > +impl AsSlotManager {
> > +    /// Locks a region for page table updates if the VM has an active slot.
> > +    pub(super) fn start_vm_update(&mut self, vm: &VmAsData, region: &Range<u64>) -> Result {
> > +        let seat = vm.as_seat.access(self);
> > +        match seat.slot() {
> > +            Some(slot) => {
> > +                let as_nr = slot as usize;
> > +                self.as_start_update(as_nr, region)
> > +            }
> > +            _ => Ok(()),
> > +        }
> > +    }
> > +
> > +    /// Flushes page table updates for a VM if it has an active slot.
> > +    pub(super) fn end_vm_update(&mut self, vm: &VmAsData) -> Result {
> > +        let seat = vm.as_seat.access(self);
> > +        match seat.slot() {
> > +            Some(slot) => {
> > +                let as_nr = slot as usize;
> > +                self.as_end_update(as_nr)
> > +            }
> > +            _ => Ok(()),
> > +        }
> > +    }
> > +
> > +    /// Flushes page tables for a VM if it has an active slot.
> > +    pub(super) fn flush_vm(&mut self, vm: &VmAsData) -> Result {
> > +        let seat = vm.as_seat.access(self);
> > +        match seat.slot() {
> > +            Some(slot) => {
> > +                let as_nr = slot as usize;
> > +                self.as_flush(as_nr)
> > +            }
> > +            _ => Ok(()),
> > +        }
> > +    }
> > +
> > +    /// Flushes page tables for a VM if it has an active slot.
> > +    pub(super) fn activate_vm(&mut self, vm: ArcBorrow<'_, VmAsData>) -> Result {
> > +        self.activate(&vm.as_seat, vm.into())
> > +    }
> > +
> > +    /// Flushes page tables for a VM if it has an active slot.
> > +    pub(super) fn deactivate_vm(&mut self, vm: &VmAsData) -> Result {
> > +        self.evict(&vm.as_seat)
> > +    }
> > +}
> > diff --git a/drivers/gpu/drm/tyr/tyr.rs b/drivers/gpu/drm/tyr/tyr.rs
> > index f54b997355e0..ae435c7e80b1 100644
> > --- a/drivers/gpu/drm/tyr/tyr.rs
> > +++ b/drivers/gpu/drm/tyr/tyr.rs
> > @@ -11,6 +11,7 @@
> >  mod file;
> >  mod gem;
> >  mod gpu;
> > +mod mmu;
> >  mod regs;
> >  mod slot;
> >  
> 
