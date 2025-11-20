Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCC22BDC10
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763651045; cv=none; b=OtnxQKTkmjrhEjgecYLfm8K1nCgaSFrRhZT4k9GX5262ywhT/Bsb54lb6pkiRF3lK4tuyMAaiiKZMibWWNxGBi0l32xtX3VqTMss0WXNLHBlI3Row3+4wKUoEUJ/sGOmvOgOVZF+ozs3FmsGpCfnsV2qXxPs4obb/qdyWhg/gtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763651045; c=relaxed/simple;
	bh=NQUtKdB99qdvTUHW7TfJaCBvDQOzecNF+71V0RM1t14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cZ62RxGiVoOZsk4tkIC6XRRrpKhCiIeQ+SLdo5fQpKjn6VDw3kODIoC2E0Kl0N59QfvgwecF4GXXbScBW2+9A8zsp3e5IZb4rz7jfg/bt0Y19lfG6CkzNnfGJN1/MMVb7MtK6PXaSxI9StHEpB7u4FUZG3RysqyVqS+8jD7Ucy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TpycC0Je; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TpycC0Je"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763651033;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9DPCqHD/YaWcGoC8V0FZZxIZ6OMyIBB16RRDodVfkWQ=;
	b=TpycC0JexEzOtFeRg9yF0OdanaHXYKztmCNBoV3r99aO2ZC0YDubrzQXNbzeqf5AWZMM5T
	bYDeTpPOtc9ZFwEFz/Ana3slJj30s8ujlsdm7LTEqgv/Zd/nBAkSSNMmie6mfVhzMC6g+Y
	7H1Lt+0lLGURxSfmmZfNMo1f1f7F7E8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-WJghGK88OEOusj3tgt2SsA-1; Thu, 20 Nov 2025 10:03:52 -0500
X-MC-Unique: WJghGK88OEOusj3tgt2SsA-1
X-Mimecast-MFC-AGG-ID: WJghGK88OEOusj3tgt2SsA_1763651031
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b234bae2a7so292346985a.3
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 07:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763651031; x=1764255831;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9DPCqHD/YaWcGoC8V0FZZxIZ6OMyIBB16RRDodVfkWQ=;
        b=praFy9aPBTBuih5GGtaQBUXVUInIKbKy8xPn1qjEAzVH1iY/BM/TCzrqnB2eT+FCCa
         5f6AFHKCiHcK3tDfTDDm1MTzh7QhgH6ST4xZGXdQ4y73djPPVg/6ddCJ3nrv9K8I/IA+
         Jrl5B5aXP4AavSNZysVVcSJ8mmedLV3fyXY51jk6KNO4oDNUuOFsYr/QhdBxJS2WPDvq
         OlT2nN8K/2XvBC0AL9isrVbnmBgQzICzEJF/Zf2YJa44ZktW8/e1F6PG8YOqmS94sK7n
         5iPmhVOVo3TL8CTvHyp7Qkmd06xlxzRjcV+rDzElvmpWfyuyC4Mg3kS0psgvO4oAanCJ
         b2aw==
X-Forwarded-Encrypted: i=1; AJvYcCWx6kfwgyLQY8inZa8aJbIA3cfWdaeCHwj0pd4ROXTlvxEkjRKb1f/+JPTZR+M9ZOgWMYmWyFiJSaKlIikeEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0lA/Mbh638IbStNwHrwvuziv0h7U3SqPCIfwIeVB4NSL2dsrK
	YkgqgoZ3hqW2HNYC4tEwxxGA435eZZc5bGVatlwrdcBo8pMTdYhJvkjKwsKHemdL8uLMhLjGtjo
	AdW6oJh3p+YMkSVuhi38mx4f7puEVPa1ei9qycfYryZEBIgyKjJia9LoNueaiO4HlOkLO
X-Gm-Gg: ASbGnct7MjVe0J12WX2L1W6rinz6Duv4t9ksUf8/6QsZ/5d05GjoGKALogay8MiZdop
	8+1nOTRudA2sdelIhvzV3AjzzCGZiIicm20IZyjemnFt7bxFPbFC1S3pNIbdT7Uolt7zR5+oN1I
	6HTo20+4QhzxaM2LSotmrcWF0cQb2wneiIrNjq4b6Z7KrsvcBg4rDbCOVaowBXt6Pnmujser4kG
	uJSk/UEL5WLQtZs/pCMLJ0xfwjiG4tN0guU4kp4qLanBxBrLb6LTx4NXyPH2+ASa7YBwltAX9J/
	s9wqNY88IzUgh4d9J3JE8cEd/sZQ7oa6nI/p5cjcovtH0CFDZCMSrhBWfEr8IZlUDM4x6ImCJF2
	QeNoxbmpf
X-Received: by 2002:a05:620a:191f:b0:893:1c7:4b with SMTP id af79cd13be357-8b32f316197mr256304985a.31.1763651029942;
        Thu, 20 Nov 2025 07:03:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLS/dDFaSkMeWvvtf+oTu95OUr5fOT6MEqwh1eGpLFf0HLa3O3DKfWPSVqAmZHgEJfPkn3Iw==
X-Received: by 2002:a05:620a:191f:b0:893:1c7:4b with SMTP id af79cd13be357-8b32f316197mr256279885a.31.1763651027897;
        Thu, 20 Nov 2025 07:03:47 -0800 (PST)
Received: from localhost ([2607:f2c0:b141:ac00:5cae:3da9:9913:ff7])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-8b3295db58fsm165531085a.37.2025.11.20.07.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:03:47 -0800 (PST)
Date: Thu, 20 Nov 2025 10:03:45 -0500
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
Message-ID: <aR8t0XdZVyN-0mak@earendel>
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
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251120083213.6c5c01a5.zhiw@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G346iWxhBb98Wlq8PMSNPAw2zyqjGMaN0YnXadqXsic_1763651031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 20, 2025 at 08:32:13AM +0200, Zhi Wang wrote:
> On Wed, 19 Nov 2025 17:19:04 -0500
> Peter Colberg <pcolberg@redhat.com> wrote:
> 
> Hi Peter:
> 
> Thanks for the patches. :) I will test them with nova-core and come back
> with Tested-bys.

Perfect, thanks Zhi.

> Nit: Let's use "kernel vertical" styles on imports. [1]
> 
> [1] https://lore.kernel.org/all/20251105120352.77603-1-dakr@kernel.org/

Thanks, done for patch "samples: rust: add SR-IOV driver sample".

Peter

> 
> > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > capability of a PCI device. Provide a minimal set of wrappers for the
> > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> > 
> > Using the #[vtable] attribute, extend the pci::Driver trait with an
> > optional bus callback sriov_configure() that is invoked when a
> > user-space application writes the number of VFs to the sysfs file
> > `sriov_numvfs` to enable SR-IOV, or zero to disable SR-IOV [1].
> > 
> > Add a method physfn() to return the Physical Function (PF) device for
> > a Virtual Function (VF) device in the bound device context. Unlike
> > for a PCI driver written in C, guarantee that when a VF device is
> > bound to a driver, the underlying PF device is bound to a driver, too.
> > 
> > When a device with enabled VFs is unbound from a driver, invoke the
> > sriov_configure() callback to disable SR-IOV before the unbind()
> > callback. To ensure the guarantee is upheld, call disable_sriov()
> > to remove all VF devices if the driver has not done so already.
> > 
> > This series is based on Danilo Krummrich's series "Device::drvdata()
> > and driver/driver interaction (auxiliary)" applied to
> > driver-core-next, which similarly guarantees that when an auxiliary
> > bus device is bound to a driver, the underlying parent device is
> > bound to a driver, too [2].
> > 
> > Add an SR-IOV driver sample that exercises the SR-IOV capability using
> > QEMU's 82576 (igb) emulation and was used to test the abstractions
> > [3].
> > 
> > [1] https://docs.kernel.org/PCI/pci-iov-howto.html
> > [2]
> > https://lore.kernel.org/rust-for-linux/20251020223516.241050-1-dakr@kernel.org/
> > [3] https://www.qemu.org/docs/master/system/devices/igb.html
> > 
> > Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> > ---
> > John Hubbard (1):
> >       rust: pci: add is_virtfn(), to check for VFs
> > 
> > Peter Colberg (7):
> >       rust: pci: add is_physfn(), to check for PFs
> >       rust: pci: add {enable,disable}_sriov(), to control SR-IOV
> > capability rust: pci: add num_vf(), to return number of VFs
> >       rust: pci: add vtable attribute to pci::Driver trait
> >       rust: pci: add bus callback sriov_configure(), to control
> > SR-IOV from sysfs rust: pci: add physfn(), to return PF device for VF
> > device samples: rust: add SR-IOV driver sample
> > 
> >  MAINTAINERS                           |   1 +
> >  rust/kernel/pci.rs                    | 148
> > ++++++++++++++++++++++++++++++++++ samples/rust/Kconfig
> >    |  11 +++ samples/rust/Makefile                 |   1 +
> >  samples/rust/rust_dma.rs              |   1 +
> >  samples/rust/rust_driver_auxiliary.rs |   1 +
> >  samples/rust/rust_driver_pci.rs       |   1 +
> >  samples/rust/rust_driver_sriov.rs     | 107 ++++++++++++++++++++++++
> >  8 files changed, 271 insertions(+)
> > ---
> > base-commit: e4addc7cc2dfcc19f1c8c8e47f3834b22cb21559
> > change-id: 20251026-rust-pci-sriov-ca8f501b2ae3
> > 
> > Best regards,
> 

