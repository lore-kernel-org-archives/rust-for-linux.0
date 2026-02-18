Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AE47080E
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Feb 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771380233; cv=none; b=Rg2aYYVeD7GKHGZmGCKbgpUdU1/kXyuiOLCFagf5mHNt5/kCgf1EKNGgxTgts87b4wu6IBQbo2bkoSiDASBr8YfqHrY9j1R/OZjdhsmynnGb2oIYpU9+K6r51NMeDIJ/qRtTbCTNcVp+M+krne6/sMoLgXj4sNqfjmTvP6C4xDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771380233; c=relaxed/simple;
	bh=PUEtUvlnxfRwbku097xynciK1P/oSr9Kiu2SbUO2/mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=InuxRAt9ud7vMdhjJAP4DPVrjBYW/4tcvMLr96F8ZqjTPQyXduiDw2XsYIG96ig0vA+SZdyztDQbfowYyroj3YyTRLHejY9ICWN6kSUZGqkAFYFvifOGljvL8BGv+odDmWmx4lmc5dHtEW9JMhFcJls1P3Hg7SZQx8wSiHzLDo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L3Cq/OUm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L3Cq/OUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771380231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4cHvKSBZESAOv4yzpaqvORLgvpDRThGyDvq3HOoF2s=;
	b=L3Cq/OUmE39lqbDMi4RD6vO0nKtNjMPE/ztjEMWsLNVlvhTOqH32r9XGzP0KVBn0aRAxFL
	ECWwUisKahCsLGqWNef6y4+tDeZl1lkLIBUtMqQnU21mpb2qa6F7gP0gTMVMYLcLDLChC5
	RNeehsEWsOmhFqPRegVtRrvWEoWC158=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-iJIgTF30NlKu6GeJ0eHQ9g-1; Tue, 17 Feb 2026 21:03:50 -0500
X-MC-Unique: iJIgTF30NlKu6GeJ0eHQ9g-1
X-Mimecast-MFC-AGG-ID: iJIgTF30NlKu6GeJ0eHQ9g_1771380230
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8947d47793fso721606316d6.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 18:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771380230; x=1771985030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4cHvKSBZESAOv4yzpaqvORLgvpDRThGyDvq3HOoF2s=;
        b=H5huFlGHEN9Tz8FprrOM0z7I4e26n6OraLRRyNDUV2ip7TSeaSB0G3HJsvy/Ul7574
         qZnz61nN6ygovInDmxECBKtz9f9oOYan8RYAc0/cwHa7sv4RU/FODeYTgrPm33boNtDg
         OBORBfXBvJlmNErWutHe4lApu6RlDhuMIW8DMgxdyav9Qe0jBsrhwK7S/CwAx/O+qDJz
         MLvP2JpetlnXDrBTSOArQzzq42oxwLqsISpxFvCyQJkPSQa5xKQV2XplPHGXqrOTHTCB
         05XjVFD4U/ZCVG+f9j5t3h3/GvIj/bkxQHwxVJ5wfrSlzp1UWvBlx3dyjco0Gz2Ujm0S
         RBqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiS4r552wimKirz7r8ifvF5gjaUHYzpdn5y/BO7lpvkEFn/2z+g03uBjlzhxabH/BKCD//oce/Fsli82ly2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/pRBQ1Vpd/xsfsiWAOtxy8980D2XNl+Wna8rQIvQb39rUc2t
	q2NyCXW6zxX+tHQcx/Hg9h9E7YdB0CanTY+mn4zdR/eyS5L1kTb+qvmsy++o0LLo6xC/Kjzlf7s
	PNvZk3J8x7jrv1VwVMBA+bsSSHPZWIcpPoEwdXI4bSb5bQWbig5/2yOPfu4T0CHpwnU7o
X-Gm-Gg: AZuq6aI5Oc+iMMl2sJVrOaVoKo00BBpES/rBbqxTqRdAoZ7aDATcszIC9NudHmoEXA5
	5hL+S+8Ffa1DZb06He5s7dUaie53US9UJUgkg1X9p+jXSmEgsSqW0bPdCJuOxx3+35X4hSZHIMF
	kzjy3CYEsox1hTJGjy8vA1W3BDs8ixR6dUXtJIWd4V/mORcv3jXPpFVpUXVLit17GFQl1Jvbs5O
	3dcx1pYgxLl8OGwbioOjM+MS8+ejjuysmpv+rJSf/9beKPsuU6xxc1reb08XDy8I59/V94h2Q7G
	iE1VpU283YprhKshcbCyCAlnszySSVzZeX9inty2EUnW1scIh5yZAaFkMssrVUKfOFW6REGlI6L
	uWQEMpj8CpzPyfMJCGqWyUg==
X-Received: by 2002:ad4:5dee:0:b0:894:6cb7:da94 with SMTP id 6a1803df08f44-897402c95aamr190212996d6.8.1771380229534;
        Tue, 17 Feb 2026 18:03:49 -0800 (PST)
X-Received: by 2002:ad4:5dee:0:b0:894:6cb7:da94 with SMTP id 6a1803df08f44-897402c95aamr190212556d6.8.1771380228953;
        Tue, 17 Feb 2026 18:03:48 -0800 (PST)
Received: from localhost ([2607:f2c0:b1e3:9a00:3d5c:8422:4052:e7a6])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-8971cc7dc1csm176656526d6.10.2026.02.17.18.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 18:03:48 -0800 (PST)
Date: Tue, 17 Feb 2026 21:03:47 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 10/10] samples: rust: add SR-IOV driver sample
Message-ID: <aZUeA1hmYlZIILQg@earendel>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
 <20260205-rust-pci-sriov-v2-10-ef9400c7767b@redhat.com>
 <0e762787-7270-426f-81ee-b24761617c18@de.bosch.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <0e762787-7270-426f-81ee-b24761617c18@de.bosch.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zxNbLOODK0m-5S3InCMnC8ftkMmYjpRlUnOQuU5HtCI_1771380230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dirk,

On Mon, Feb 16, 2026 at 09:27:44AM +0100, Dirk Behme wrote:
> Hi Peter,
> 
> On 05.02.2026 21:59, Peter Colberg wrote:
> > Add a new SR-IOV driver sample that demonstrates how to enable and
> > disable the Single Root I/O Virtualization capability for a PCI device.
> > 
> > The sample may be exercised using QEMU's 82576 (igb) emulation.
> > 
> > Link: https://www.qemu.org/docs/master/system/devices/igb.html
> > Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> > ---
> > Changes in v2:
> > - Use "kernel vertical" style on imports.
> > - Demonstrate how to reach driver data of PF device from VF device.
> > ---
> >   MAINTAINERS                       |   1 +
> >   samples/rust/Kconfig              |  11 ++++
> >   samples/rust/Makefile             |   1 +
> >   samples/rust/rust_driver_sriov.rs | 127 ++++++++++++++++++++++++++++++++++++++
> >   4 files changed, 140 insertions(+)
> > 
> ...
> > diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..84d057629c7b03d743179a4e05ccc092f814bf6b
> > --- /dev/null
> > +++ b/samples/rust/rust_driver_sriov.rs
> > @@ -0,0 +1,127 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Rust SR-IOV driver sample based on QEMU's 82576 ([igb]) emulation.
> > +//!
> > +//! To make this driver probe, QEMU must be run with `-device igb`.
> > +//!
> > +//! Further, enable [vIOMMU] with interrupt remapping using, e.g.,
> > +//!
> > +//! `-M q35,accel=kvm,kernel-irqchip=split -device intel-iommu,intremap=on,caching-mode=on`
> > +//!
> > +//! and append `intel_iommu=on` to the guest kernel arguments.
> > +//!
> > +//! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
> > +//! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
> > +
> > +use kernel::{
> > +    device::Core,
> > +    pci,
> > +    prelude::*,
> > +    sync::aref::ARef, //
> > +};
> > +
> > +use core::any::TypeId;
> > +
> > +#[pin_data(PinnedDrop)]
> > +struct SampleDriver {
> > +    pdev: ARef<pci::Device>,
> > +    private: TypeId,
> > +}
> > +
> > +kernel::pci_device_table!(
> > +    PCI_TABLE,
> > +    MODULE_PCI_TABLE,
> > +    <SampleDriver as pci::Driver>::IdInfo,
> > +    [
> > +        // E1000_DEV_ID_82576
> > +        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10c9), ()),
> > +        // E1000_DEV_ID_82576_VF
> > +        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10ca), ())
> > +    ]
> > +);
> > +
> > +#[vtable]
> > +impl pci::Driver for SampleDriver {
> > +    type IdInfo = ();
> > +
> > +    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> > +
> > +    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
> > +        pin_init::pin_init_scope(move || {
> > +            dev_info!(
> > +                pdev.as_ref(),
> 
> The `as_ref()` in the `dev_*()` prints can be dropped. Example:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/samples/rust/rust_driver_pci.rs?id=600de1c008b2302b56d69ff27d12a9d8d14892ac

Thank you for the pointer, dropped in v3.

Peter

> 
> Best regards
> 
> Dirk
> 

