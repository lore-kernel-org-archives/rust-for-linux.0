Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1215548EE
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 00:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237552; cv=pass; b=nn6bLCrKFjFI7bjc9o3kAuhoFX26ID7RTPr4Y7YGHSQlV0I2cfEPMMPkQVnACVegPjWf0dChE2+pir57cELKH78HkXT37DlQR/Wmon62aLFsQgB8dfFN8rX4FtpIi547Dp7tWel1N7ABSPk2esWGUUWXexdaWgqC4pI/9I3IP2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237552; c=relaxed/simple;
	bh=FHWI2P/Fwv2xBYBv8v9OlsDWpcvBPvAsDwpb5np8xi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1Ne6+urT6D0B8BzRmkwJ/1SuogeDOJe3+thG9kW95gY8liEsfnt5uTI246VVGNNtlqj4488HbV58td4UoadOeJ6WF1ff6p0YRgY7D1z/EJe0Hh+FcLW3yfaCdTFn+frkXnFZvO5NQtOpPgalCvYD1JQ71VEh7AsRZByg1wbMT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=jqpk2gv3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="jqpk2gv3"
ARC-Seal: i=1; a=rsa-sha256; t=1772237543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lHoFXfSQzbLXpczP5D45JTKPt1ThSCvGBoUaE5slBd64nvG4BeugGqx4VOvStn1Ab/HHBG+DFqos2wcO5rQb+jYgQgiPaJRULpZ3A3QyG0s6QxXO91Ctli1EwwYCm6PGsBFEcRK4S4YGEOfba2SJDe6kkzrGN5yA7sTndCkbqlk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772237543; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=urMyP6X1qSgUnf936PORQmfBPlAQbqK2HDDQz7EXRac=; 
	b=CLNU2E73r1QPn9kSxhZIhfB+4VXTG8dwGYHUNXVBQGsjb7KbVNxFct0eLxc4X1trqg8LzpQpa8NzAG7J6K93s0ApPTpswvZH/7nvai2wbFfiNYM0xFpkmQI3/as+2PWZ7f0xYcCeaCdh5/0T7baCNLPSqit92qcC23H8Dxow6JU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772237543;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=urMyP6X1qSgUnf936PORQmfBPlAQbqK2HDDQz7EXRac=;
	b=jqpk2gv3rBuVP9mHoUS+GFEf59bW0ZtDPC7D0d7AfSYrcVjZjYZBuxvXVmVSjNGT
	0Ygr+1MWnikmQcO+QQJCqYMLltpM+6TjBQ9OESKEugE1S3Y/L/H4mceIdxGnnvdaCQ4
	3N/4EtPMP2WYCW5syPpZUYL8tRtIkMWvljMV78wI=
Received: by mx.zohomail.com with SMTPS id 1772237541430580.1043397795119;
	Fri, 27 Feb 2026 16:12:21 -0800 (PST)
Date: Fri, 27 Feb 2026 16:12:20 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, aliceryhl@google.com,
	beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 05/12] drm/tyr: add MMU address space registers
Message-ID: <aaIy5GVP9Q5JP9Gu@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-6-deborah.brouwer@collabora.com>
 <20260212091624.3deda2ea@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212091624.3deda2ea@fedora>

On Thu, Feb 12, 2026 at 09:16:24AM +0100, Boris Brezillon wrote:
> On Wed, 11 Feb 2026 17:37:06 -0800
> Deborah Brouwer <deborah.brouwer@collabora.com> wrote:
> 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> I'm pretty sure I got that from Daniel's branch, and only tweaked a few
> minor things to make it work (I probably messed up authorship when
> doing that). I'd prefer to attribute that work to Daniel, if you don't
> mind.

Sure, sorry I didn't clarify that, will change the author in v2.

> 
> > 
> > Add register definitions and constants for managing MMU address space,
> > including:
> >   - Address space translation configuration (page table format, attributes)
> >   - Memory attributes (cacheability, shareability)
> >   - Address space commands (update, lock, flush)
> >   - AsRegister helper for per-AS register access
> > 
> > These will be used by the MMU/VM manager to configure page tables and
> > control address space operations.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > ---
> >  drivers/gpu/drm/tyr/regs.rs | 101 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 100 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> > index 611870c2e6af..9cb7ab0c806a 100644
> > --- a/drivers/gpu/drm/tyr/regs.rs
> > +++ b/drivers/gpu/drm/tyr/regs.rs
> > @@ -8,7 +8,10 @@
> >  #![allow(dead_code)]
> >  
> >  use kernel::{
> > -    bits::bit_u32,
> > +    bits::{
> > +        bit_u32,
> > +        bit_u64, //
> > +    },
> >      device::{
> >          Bound,
> >          Device, //
> > @@ -111,3 +114,99 @@ pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u3
> >  pub(crate) const MMU_IRQ_CLEAR: Register<0x2004> = Register;
> >  pub(crate) const MMU_IRQ_MASK: Register<0x2008> = Register;
> >  pub(crate) const MMU_IRQ_STAT: Register<0x200c> = Register;
> > +
> > +pub(crate) const AS_TRANSCFG_ADRMODE_UNMAPPED: u64 = bit_u64(0);
> > +pub(crate) const AS_TRANSCFG_ADRMODE_AARCH64_4K: u64 = bit_u64(2) | bit_u64(1);
> > +pub(crate) const AS_TRANSCFG_PTW_MEMATTR_WB: u64 = bit_u64(25);
> > +pub(crate) const AS_TRANSCFG_PTW_RA: u64 = bit_u64(30);
> > +
> > +pub(crate) const fn as_transcfg_ina_bits(x: u64) -> u64 {
> > +    x << 6
> > +}
> > +
> > +pub(crate) const AS_MEMATTR_AARCH64_SH_MIDGARD_INNER: u32 = 0 << 4;
> > +pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_NC: u32 = 1 << 6;
> > +pub(crate) const AS_MEMATTR_AARCH64_INNER_OUTER_WB: u32 = 2 << 6;
> > +
> > +pub(crate) fn as_memattr_aarch64_inner_alloc_expl(w: bool, r: bool) -> u32 {
> > +    (3 << 2) | (u32::from(w)) | ((u32::from(r)) << 1)
> > +}
> > +
> > +pub(crate) const AS_COMMAND_UPDATE: u32 = 1;
> > +pub(crate) const AS_COMMAND_LOCK: u32 = 2;
> > +pub(crate) const AS_COMMAND_FLUSH_PT: u32 = 4;
> > +pub(crate) const AS_COMMAND_FLUSH_MEM: u32 = 5;
> > +
> > +pub(crate) const AS_STATUS_ACTIVE: u32 = bit_u32(0);
> > +
> > +pub(crate) const AS_LOCK_REGION_MIN_SIZE: u32 = bit_u32(15);
> > +
> > +/// Maximum number of hardware address space slots.
> > +/// The actual number of slots available is usually much lower.
> > +pub(crate) const MAX_AS_REGISTERS: usize = 32;
> > +
> > +const MMU_BASE: usize = 0x2400;
> > +const MMU_AS_SHIFT: usize = 6;
> > +
> > +const fn mmu_as(as_nr: usize) -> usize {
> > +    MMU_BASE + (as_nr << MMU_AS_SHIFT)
> > +}
> > +
> > +pub(crate) struct AsRegister(usize);
> > +
> > +impl AsRegister {
> > +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
> > +        Ok(AsRegister(mmu_as(as_nr) + offset))
> > +    }
> > +
> > +    #[inline]
> > +    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
> > +        let value = (*iomem).access(dev)?.try_read32(self.0)?;
> > +        Ok(value)
> > +    }
> > +
> > +    #[inline]
> > +    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
> > +        (*iomem).access(dev)?.try_write32(value, self.0)?;
> > +        Ok(())
> > +    }
> > +}
> > +
> > +pub(crate) fn as_transtab_lo(as_nr: usize) -> Result<AsRegister> {
> > +    AsRegister::new(as_nr, 0x0)
> > +}
> > +
> > +pub(crate) fn as_transtab_hi(as_nr: usize) -> Result<AsRegister> {
> > +    AsRegister::new(as_nr, 0x4)
> > +}
> > +
> > +pub(crate) fn as_memattr_lo(as_nr: usize) -> Result<AsRegister> {
> > +    AsRegister::new(as_nr, 0x8)
> > +}
> > +
> > +pub(crate) fn as_memattr_hi(as_nr: usize) -> Result<AsRegister> {
> > +    AsRegister::new(as_nr, 0xc)
> > +}
> > +
> > +pub(crate) fn as_lockaddr_lo(as_nr: usize) -> Result<AsRegister> {
> > +    AsRegister::new(as_nr, 0x10)
> > +}
> > +
> > +pub(crate) fn as_lockaddr_hi(as_nr: usize) -> Result<AsRegister> {
> > +    AsRegister::new(as_nr, 0x14)
> > +}
> > +
> > +pub(crate) fn as_command(as_nr: usize) -> Result<AsRegister> {
> > +    AsRegister::new(as_nr, 0x18)
> > +}
> > +
> > +pub(crate) fn as_status(as_nr: usize) -> Result<AsRegister> {
> > +    AsRegister::new(as_nr, 0x28)
> > +}
> > +
> > +pub(crate) fn as_transcfg_lo(as_nr: usize) -> Result<AsRegister> {
> > +    AsRegister::new(as_nr, 0x30)
> > +}
> > +pub(crate) fn as_transcfg_hi(as_nr: usize) -> Result<AsRegister> {
> > +    AsRegister::new(as_nr, 0x34)
> > +}
> 
