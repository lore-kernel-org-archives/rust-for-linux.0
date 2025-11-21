Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50A2F12B5
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 17:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763744723; cv=none; b=MqG6SIsqs0Ed7999GfMEiETVgk0xAoAihY83/v2tG92coXbhX5sSDo4mr7lbeBbKnQUDv9P4blHn/TeULQWRHkA78OJEnDoFLDQ4K/+t+17iUr6d7tTJ/Xol/LTicZLrrtTq7MpXD+neYE8fZsZ3vsw4bPbnuOiO8V8gk76WZZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763744723; c=relaxed/simple;
	bh=tmekbxR8wc1I7t6Q6VZZ1XIp/NWvYZvJ1hM4SKb77K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CIxCh0ntTbuoCfR/u0pkLUP9LYoueLoxxCzItvl8WbAYswvyPEftiLe782Iwkc5oImNDD3bIAFNd/kM9+bbt/mHKpdwcpAmY09Kfpa+IZV0piUuBLgWuf+J4fA0W3XBOWu1OW4Urc1Zjid6kgbDc/GkY5i1s3SyBMV6RRMq95Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dRPb/C2Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dRPb/C2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763744717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pcee4/A8vRRbWn/DfexDhknhgtkMbBICYwtyayyfJMY=;
	b=dRPb/C2Z7MFbX5V+b9PL3D2TTSiUXPkFHAdTdAU59y7hjsUGhCYoicyMIqV9MlEN/Vsi3B
	FklHUXuy9b3diqhZTuzWuEku1IPaTcL/CY46cg+9glj8eX180KrUVnsmWn2SEm6ttDsoLi
	X0Pbi//6clfy8JFGVSmsyheyeMNV+FA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-CX2NM8h7ONiCEReyx6IMmQ-1; Fri, 21 Nov 2025 12:05:13 -0500
X-MC-Unique: CX2NM8h7ONiCEReyx6IMmQ-1
X-Mimecast-MFC-AGG-ID: CX2NM8h7ONiCEReyx6IMmQ_1763744713
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8804b991976so58176126d6.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Nov 2025 09:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763744713; x=1764349513;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcee4/A8vRRbWn/DfexDhknhgtkMbBICYwtyayyfJMY=;
        b=pmlCbADIGVinoltL2VORyHIxDe7sFQCW6IsuYfX2soiEFz2Cnr1C89wAyXXuOC4HaO
         zq4af03qCEaGEgVLZfYB5epvP+CAn6HAoEOepq/v1v8wp6bfbrsavgBdDqbFrqCum7gQ
         F/0JfYdY/SYGos0avVWSpqBZoVklZCUNJYsdZNasYJlPVIU5lfvss3gU0F4fuOIzCTQH
         EcAtOJjLTlg+I+5NdsUpM28c+yxcoWgks++DF4bbfVSGt8yJOyO/eXzNbjq4pJ5RZLtp
         3uyH4cM2txQPRTzmdWDgMJAPdSQNp0Ns4xyvczJLOp3YQgqGF2R66kzrqDHjaBK3mFxT
         sYJw==
X-Forwarded-Encrypted: i=1; AJvYcCU9r1+vjIM8u5D2wVC5KuPuuVn0kBl0jcRY/KTqLeHVXKv6Fv9A9jPd6aZfV1uRdIhK/Vv7+8tC/e2FYpKozQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqSJxBq2G9i2QzHAwblH2vzhVdLKL/RvQHTSNNgp7zXOuQBWBt
	JwK6IObxWVGlVWGmuFS9GDW/5wYh4jQVfXsu/4MCXMYi957ISdG9AsISzeak+OOLMSuliUuy55Z
	npmSxErbwSAXWsAaToveV7fhsPPbUsC3OP6Sxn2D6X81jVd//WzHv6R0DirxXJANiJud0
X-Gm-Gg: ASbGnctGUAlQG3irFuQzLxV7ejR9CpP1+uaIWET6oRmOdtb5OkCJf8M7BUnir+nOM9R
	xFHEQkZ5m/2YCkXuQfRJB1Ibb7To3041IB0gpND7ELDLyqNwey+54n7wra9FY4PpcTH5PTUYgwX
	Cua9TKRB38YpoZQm09Z3ijgJmCSTdQXcL0w9JPVH3QXmt8iGb+rF3hzCClF5/ogtUhCcX8wBbBF
	BEGGZ01TbAZg7dXXwljDEkrSpV/CPKP2PNuMJjhd48op5cLMXMWcRO+DAaX6TZ1usr0NwLUozEP
	F9lrnLhCjfpSYKoJcxxaePLciz4t+UPfhRihjDv/Rge/ccQCa8JKWkGI+3f4cvuvP8RN85U5OC+
	Yo/XdTPm9yg==
X-Received: by 2002:ad4:5aae:0:b0:882:6cd3:7f64 with SMTP id 6a1803df08f44-8847c525dbemr42276056d6.44.1763744712757;
        Fri, 21 Nov 2025 09:05:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLRcV7K0Bhq8TE5Bm7cm2cdZ/VYsJmCfeBsteGuVKLE0o2xsrM2bCCmTKOW8kK51KJ84vQ/g==
X-Received: by 2002:ad4:5aae:0:b0:882:6cd3:7f64 with SMTP id 6a1803df08f44-8847c525dbemr42275096d6.44.1763744712063;
        Fri, 21 Nov 2025 09:05:12 -0800 (PST)
Received: from localhost ([2607:f2c0:b141:ac00:2fb1:d1df:b122:3b2c])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-8846e446a06sm43506306d6.2.2025.11.21.09.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 09:05:11 -0800 (PST)
Date: Fri, 21 Nov 2025 12:05:10 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Zhi Wang <zhiw@nvidia.com>
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
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 0/8] rust: pci: add abstractions for SR-IOV capability
Message-ID: <aSCbxjbNJPPy2NVd@earendel>
Mail-Followup-To: Zhi Wang <zhiw@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
 <20251120083213.6c5c01a5.zhiw@nvidia.com>
 <aR8t0XdZVyN-0mak@earendel>
 <20251120203444.321378c2.zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251120203444.321378c2.zhiw@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jpEFKUcT8NWJwBjjKoOYBSOJzxm4v-2QXK5qhtoPZuw_1763744713
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 20, 2025 at 08:34:44PM +0200, Zhi Wang wrote:
> On Thu, 20 Nov 2025 10:03:45 -0500
> Peter Colberg <pcolberg@redhat.com> wrote:
> 
> Hi Peter:
> 
> I met some errors when compiling on driver-core-next branch, you can
> fix those in the next spin.
> 
> Fixes:
> 
> diff --git a/drivers/gpu/nova-core/driver.rs
> b/drivers/gpu/nova-core/driver.rs index ca0d5f8ad54b..730e745cad63
> 100644 --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -49,6 +49,7 @@ pub(crate) struct NovaCore {
>      ]
>  );
>  
> +#[vtable]
>  impl pci::Driver for NovaCore {
>      type IdInfo = ();
>      const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> 
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index d6cc5d7e7cd7..2d68db076f92 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -292,6 +292,7 @@ macro_rules! pci_device_table {
>  ///     ]
>  /// );
>  ///
> +/// #[vtable]
>  /// impl pci::Driver for MyDriver {
>  ///     type IdInfo = ();
>  ///     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> 
> The code in the examples should be able to compile.
> 
> You can enable doctest by:
> 
> CONFIG_RUST_KERNEL_DOCTESTS=y
> 
> Then:
> 
> impl Device<device::Bound> {
>     /// Returns the Physical Function (PF) device for a Virtual
> Function (VF) device. ///
>     /// # Examples
>     ///
> 
> snip
> 
>     /// ```
>     /// let pf_pdev = vf_pdev.physfn()?;
>     /// let pf_drvdata = pf_pdev.as_ref().drvdata::<MyDriver>()?;
> 
> I saw this part is not able to be compiled.^

Thanks Zhi, I applied all fixes.

Peter

> 
> Z.
> 
> > On Thu, Nov 20, 2025 at 08:32:13AM +0200, Zhi Wang wrote:
> > > On Wed, 19 Nov 2025 17:19:04 -0500
> > > Peter Colberg <pcolberg@redhat.com> wrote:
> > > 
> > > Hi Peter:
> > > 
> > > Thanks for the patches. :) I will test them with nova-core and come
> > > back with Tested-bys.
> > 
> > Perfect, thanks Zhi.
> > 
> > > Nit: Let's use "kernel vertical" styles on imports. [1]
> > > 
> > > [1]
> > > https://lore.kernel.org/all/20251105120352.77603-1-dakr@kernel.org/
> > 
> > Thanks, done for patch "samples: rust: add SR-IOV driver sample".
> > 
> > Peter
> > 
> > > 
> > > > Add Rust abstractions for the Single Root I/O Virtualization
> > > > (SR-IOV) capability of a PCI device. Provide a minimal set of
> > > > wrappers for the SR-IOV C API to enable and disable SR-IOV for a
> > > > device, and query if a PCI device is a Physical Function (PF) or
> > > > Virtual Function (VF).
> > > > 
> > > > Using the #[vtable] attribute, extend the pci::Driver trait with
> > > > an optional bus callback sriov_configure() that is invoked when a
> > > > user-space application writes the number of VFs to the sysfs file
> > > > `sriov_numvfs` to enable SR-IOV, or zero to disable SR-IOV [1].
> > > > 
> > > > Add a method physfn() to return the Physical Function (PF) device
> > > > for a Virtual Function (VF) device in the bound device context.
> > > > Unlike for a PCI driver written in C, guarantee that when a VF
> > > > device is bound to a driver, the underlying PF device is bound to
> > > > a driver, too.
> > > > 
> > > > When a device with enabled VFs is unbound from a driver, invoke
> > > > the sriov_configure() callback to disable SR-IOV before the
> > > > unbind() callback. To ensure the guarantee is upheld, call
> > > > disable_sriov() to remove all VF devices if the driver has not
> > > > done so already.
> > > > 
> > > > This series is based on Danilo Krummrich's series
> > > > "Device::drvdata() and driver/driver interaction (auxiliary)"
> > > > applied to driver-core-next, which similarly guarantees that when
> > > > an auxiliary bus device is bound to a driver, the underlying
> > > > parent device is bound to a driver, too [2].
> > > > 
> > > > Add an SR-IOV driver sample that exercises the SR-IOV capability
> > > > using QEMU's 82576 (igb) emulation and was used to test the
> > > > abstractions [3].
> > > > 
> > > > [1] https://docs.kernel.org/PCI/pci-iov-howto.html
> > > > [2]
> > > > https://lore.kernel.org/rust-for-linux/20251020223516.241050-1-dakr@kernel.org/
> > > > [3] https://www.qemu.org/docs/master/system/devices/igb.html
> > > > 
> > > > Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> > > > ---
> > > > John Hubbard (1):
> > > >       rust: pci: add is_virtfn(), to check for VFs
> > > > 
> > > > Peter Colberg (7):
> > > >       rust: pci: add is_physfn(), to check for PFs
> > > >       rust: pci: add {enable,disable}_sriov(), to control SR-IOV
> > > > capability rust: pci: add num_vf(), to return number of VFs
> > > >       rust: pci: add vtable attribute to pci::Driver trait
> > > >       rust: pci: add bus callback sriov_configure(), to control
> > > > SR-IOV from sysfs rust: pci: add physfn(), to return PF device
> > > > for VF device samples: rust: add SR-IOV driver sample
> > > > 
> > > >  MAINTAINERS                           |   1 +
> > > >  rust/kernel/pci.rs                    | 148
> > > > ++++++++++++++++++++++++++++++++++ samples/rust/Kconfig
> > > >    |  11 +++ samples/rust/Makefile                 |   1 +
> > > >  samples/rust/rust_dma.rs              |   1 +
> > > >  samples/rust/rust_driver_auxiliary.rs |   1 +
> > > >  samples/rust/rust_driver_pci.rs       |   1 +
> > > >  samples/rust/rust_driver_sriov.rs     | 107
> > > > ++++++++++++++++++++++++ 8 files changed, 271 insertions(+)
> > > > ---
> > > > base-commit: e4addc7cc2dfcc19f1c8c8e47f3834b22cb21559
> > > > change-id: 20251026-rust-pci-sriov-ca8f501b2ae3
> > > > 
> > > > Best regards,
> > > 
> > 
> > 
> 

