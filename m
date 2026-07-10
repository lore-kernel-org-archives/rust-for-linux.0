Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47112232395
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 13:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691128; cv=none; b=aGlLAsTyUBKKhZre8Pj4Q9dc1qsn6JA313CSDPIUpP6T5YU+9yDLMhvqAFW3kOhu0nTWU7+KQwxiApYaNeLcuNdnMH7jC4qDfiz29TzX+BJ5NtUJ0nf4o177nDwKaaWnCfj6NKnfxpA0j/DGkUgMauwiK1AUTAsiRJ+pK98vR7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691128; c=relaxed/simple;
	bh=5/QXF8YMjirttucuh5zBWmxlQzCXMd2P6nTZj1Q9mvU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YoT0tL6maHJi/NfOUnh9HENaA6InoTyFaeBNk4gNo9LcGKCe32h5+/6yLMw4Bgg8KDfY3KgPQrByPwEQ27HSfZOXYli8tSv+mrqnZrud4FXcirzqUH4W2VDJn80tI82dIQOyrxvelU5O6xC1amCPfuJ9mTgh5iIPSjAf/cGMbH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZHHZqJVe; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZHHZqJVe"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-c15deb3377eso81635766b.3
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783691126; x=1784295926; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wG6HuNoWW7IygZyBT7H+i3l/PRkL2cEL2O38DxA5QNs=;
        b=ZHHZqJVeZwlGyIYHei+guwQyzpUrH2FcFNM2egTLh4SQtg5qweNn8afs4u17aXl2ZH
         EkXjzZlh9QoJZwcYCpnpIWkfA37ePHyj0O5TVsXyocUJCMGig4n5+2MLhjvqb5gSHONu
         g0XntSqFu3U4TSCteqjJJ6DHpVo5T7KulM27ekJ6H1Y9E3Tvoz44kSblZpm9VHuQYBLm
         dvoNTIGdyzmvifM8bLR6Q2w9RRs714TeX/r25SNLn1yF2AYucmbLaOixpjsr32JM7FGg
         EaV8eudb4BprhJu3XMjMninp5KDC7QMJaR5a3n8m5j9nU3pViKrErodajBdfI3WpIQDC
         nmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691126; x=1784295926;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wG6HuNoWW7IygZyBT7H+i3l/PRkL2cEL2O38DxA5QNs=;
        b=GnRV8T4YLiw5aZvDFlRWZizVV9wtdHDqp9EGSrcGOeeLdsugQ5ayKW62n3PtqF/8/N
         TPwNM0uddNswMvd1gmrXLaqHXu7P4ex9WTJF9DekKVVlvHOB5HLUHLdppGBcjOsymKVf
         n7F4+QCBT+bFUSoyE8EbfnxlsGePNIi4e1fe3OmxHEv2I6fS38ocDC4YFErRk2CTD6H3
         CerP6oxtGO348omnUYIXm7O1OtNl6o4eFOGxDXzb/qmRaWMuooUB/GSXHpiBKPJRMNxn
         Iru5KWGGk1qJWE0Yaqzt/vBPSfIkdj8Xm/QsFYkDI6nWd7XHOSbmhzxx3Hy38GpVsj+Z
         Wunw==
X-Forwarded-Encrypted: i=1; AHgh+RpSvlsQ61wEJqzSfgex47+koDyg3007fgBxuGOEV8YQcTMcYdtfWfEKpqic8Z0EG2K/FrW32Ef0sMZMTwGXrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypTqTjJAtAn2z44T/0kwRgKSLdCCMI85kcac3m40oXvjRjsdOQ
	+nqeuLDj0qtsS6vNRS4PXy0zy7yurerlFgjCoLTaNYm+HdHmApLVE5dH7odzA4hp33qzkGaqDav
	m1GIL/PjQHLG0bQMeFg==
X-Received: from ejbri40.prod.google.com ([2002:a17:906:d7e8:b0:c15:f2a5:1700])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1c2a:b0:c15:da6a:c27c with SMTP id a640c23a62f3a-c15da6ac90emr390710966b.25.1783691125330;
 Fri, 10 Jul 2026 06:45:25 -0700 (PDT)
Date: Fri, 10 Jul 2026 13:45:24 +0000
In-Reply-To: <20260709-fw-boot-b4-v6-3-ca391e1a4108@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260709-fw-boot-b4-v6-0-ca391e1a4108@collabora.com> <20260709-fw-boot-b4-v6-3-ca391e1a4108@collabora.com>
Message-ID: <alD3dMEuYHduWlzp@google.com>
Subject: Re: [PATCH v6 3/7] drm/tyr: add Memory Management Unit (MMU) support
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
	Gary Guo <gary@garyguo.net>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	boris.brezillon@collabora.com, samitolvanen@google.com, acourbot@nvidia.com, 
	alvin.sun@linux.dev, laura.nao@collabora.com, work@onurozkan.dev, 
	beata.michalska@arm.com, steven.price@arm.com, lyude@redhat.com
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 09, 2026 at 02:36:43PM -0700, Deborah Brouwer wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Add Memory Management Unit (MMU) support in Tyr. The MMU module wraps a
> SlotManager instance to allocate MMU address-space slots for use by
> virtual memory (VM) address spaces. The MMU's SlotManager uses an
> AddressSpaceManager to handle the hardware-specific callbacks. For
> example, the AddressSpaceManager activates and evicts VMs from slots by
> writing commands to the MMU registers.
> 
> Add an implementation block for the MMU's MEMATTR register to provide
> a method for translating the Memory Attribute Indirection Register (MAIR)
> format from the pagetable configuration to a format understood by the MMU.
> 
> Create an mmu instance during probe, it will be used by subsequent patches
> in this series.
> 
> Wrap the iomem stored in TyrDrmRegistrationData in an Arc. The iomem
> is stored in the mmu through its AddressSpaceManager. In anticipation
> of the iomem also being stored in the firmware object, set up shared
> ownership of the iomem now.
> 
> Update Kconfig to add the new MMU and IOMMU dependencies required
> by this MMU module.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

> +//! Memory Management Unit (MMU) module.
> +//!
> +//! The GPU MMU provides a limited number of memory address spaces for use by command streams.
> +//! The MMU translates virtual addresses to physical addresses and manages memory configuration
> +//! and access permissions.
> +//!
> +//! This MMU module is essentially a locked wrapper around a [`SlotManager`] instance.
> +//! The [`SlotManager`] manages the assignment of virtual address spaces to hardware address-space
> +//! (AS) slots. MMU commands such as updates and flushes are carried out by the
> +//! [`AddressSpaceManager`] which actually writes to the MMU registers.
> +#![allow(dead_code)]

This occurs in a few different commits, but I'd make sure to use
expect(dead_code) here so we are sure to remove it when everything is
used.

> +/// Virtual memory (VM) address space data for use in MMU operations.
> +#[pin_data]
> +pub(crate) struct VmAsData<'bound> {
> +    /// The address space seat tracks this VM's binding to a hardware address space slot.
> +    /// Uses [`LockedBy`] to ensure safe concurrent access to the slot assignment state,
> +    /// protected by the [`AsSlotManager`] lock.
> +    as_seat: LockedBy<Seat, AsSlotManager<'bound>>,

Why not use the LockedSeat type alias here?

> +        let lockaddr_val = LOCKADDR::zeroed()
> +            .try_with_size(lockaddr_size)?
> +            .try_with_base(lockaddr_base)?
> +            .into_raw();

Should this be:

	let lockaddr_val = LOCKADDR::zeroed()
	    .try_with_size(lockaddr_size)?
	    .try_with_base(lockaddr_base >> 12)?
	    .into_raw();

or even just

	let lockaddr_val = lockaddr_size | lockaddr_base;

?

Alice
