Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4453386323
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 00:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772239751; cv=pass; b=Vd0ofdanMe3Dh9jnMn9KPcR10SG66woAaXrgwLNpt8BqfoS/3Y8+ASqFJFrD8q1F4wP2blcndDGx/59x41SUf3+7+HhNvMvMXjwmHqO3WcwFphstuxabrltdIEjG5JUH9PIeGjUiVdrkObg0s6rt9yUOIfmll9BddOgJGKNNfrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772239751; c=relaxed/simple;
	bh=73yVjyLWbhPpdGm8xavEAZOz1tUD864cNMFmu3hw4z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UESMII/HOkJMP3efuAmwEBMLuKq9xW1QhM0V8WzGlkfxl3KXbu3EJgsHUAShrjyyBYlbAzczM9IHrzEELKKf6nPRD4vdRsltQOFIggTjWQSlKPDn4UfnIbU1iUm+aCcuVY5lB6la3RBSBdLw2Ifm9bQ/LmERaN6YrC+xNIn4hCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=WuOvKKMW; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="WuOvKKMW"
ARC-Seal: i=1; a=rsa-sha256; t=1772239742; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NZaSol3izM0mjUrkVVXBHvp95Lcwk5ONsrpGgkXCWsKERlQmO24HEOGYWgu4FqA3Ct54B9F6reVHKAsTnVAXtMOFfPNwDXp47W2sX3ee9DeG0RBQmWVLb8MeF4YbfqtrXxSAGWXnPxaeCv/dPuCoH75MReFd7xUmClihughrK2A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772239742; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EiDl6VYnKl3cFV7YarGwA9z7PR8IXhTiAnufRDCUnfQ=; 
	b=MZKWSsrAMiLlv98tcsPtxWdn4dGXxyhNIpwTQJlmgxjbXTvlIU4Ji9MLSPMYFyhym4T/VkdHUDdBfLH59W5NKz/jEPUvgQdL9lEJGStdXnCOezx0bqYpIVR1RCa43m52rWMlboNhc6dDjcOggeQcU0Bi/LFbmFCGgAkAF8Y9izM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772239742;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=EiDl6VYnKl3cFV7YarGwA9z7PR8IXhTiAnufRDCUnfQ=;
	b=WuOvKKMWO/VzcLyYqOAwmdvKwvpNTx/J6CPKF8O7OGIjRefjLutwSUKg9jUbOOXm
	BYNG42h22sK5AguAD9EJyxerQStcBkiHYFNQpwS+3mYrc+/KIlnOA1X0SnRJegkHlXS
	n4j1bOCGl2j+16UehUzEWHxcSjw/fwEAnzNIfVsE=
Received: by mx.zohomail.com with SMTPS id 1772239741142450.10358025467235;
	Fri, 27 Feb 2026 16:49:01 -0800 (PST)
Date: Fri, 27 Feb 2026 16:49:00 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
	daniel.almeida@collabora.com, boris.brezillon@collabora.com,
	beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 08/12] drm/tyr: add MMU module
Message-ID: <aaI7fDOtPdrbBD9v@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-9-deborah.brouwer@collabora.com>
 <aZmU8QUpu_gL9JDr@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZmU8QUpu_gL9JDr@google.com>

On Sat, Feb 21, 2026 at 11:20:17AM +0000, Alice Ryhl wrote:
> On Wed, Feb 11, 2026 at 05:37:09PM -0800, Deborah Brouwer wrote:
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
> 
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
> 
> I don't think the Box is needed if you #[pin] this field.

Ok, for v2, I moved the page table initialization from struct Vm to struct VmAsData
in the address_space.rs which allows us to construct it in place and #[pin] it.

> 
> Alice
