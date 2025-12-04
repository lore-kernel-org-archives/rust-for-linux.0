Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C752FB978
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 21:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764882471; cv=none; b=tNQNCtt4qIZPaHUqMlbzDsIiyIzAAbwgSvI99OIVMkcfHIM2SIKY/AfuleAk6Ueni74MuA+brVmHDiEowno7owyRCG93YhtJe+S/FTqvz75ua4oLOegu2gTjddciH5PxCCZJvqbwencn0ch8CPzY3vkEV3Tc+IVoVwvc82FGit4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764882471; c=relaxed/simple;
	bh=NW9cQQoEAaaq3AA9nc6mb/b5UPvD+lPeMPRsPYxJB4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Qpj8UMqszQvp2pj5J+tegmyFG5h6XtKkD23XEScSNABixLIV6VN+tvoNCSayiQlswBiYFhBeGyd5VxlDLeR64MFIYiKfaXIaN6URSZmxXBThVophFIMgZ+kIi280BAYNvkoMORdWd5wzvPh4xi4xAxG1hGs/sfb++D8zVqVu/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYiQL4aU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYiQL4aU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764882467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Utloqd78xIty0AP3e9N1+0oedDpwpptC21lH5x2/t7g=;
	b=CYiQL4aUlncXZCvDOinYeR9qsKbWjQkRLPhhsc+kC7kCt6CKkVP0L8SsplxFQ8Y3aJVdlk
	BnWMRV+i31FFEZtgHWXF3GHAjLNZP6/daYLgPoh1ZxwSiRsIau1J7KtZP1MujQb63OkGpJ
	bPPlgNtl1yXeRGZP879oZ0+KtCAo8S0=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-3RF40kcrPBuuOivZiGveyQ-1; Thu, 04 Dec 2025 16:07:45 -0500
X-MC-Unique: 3RF40kcrPBuuOivZiGveyQ-1
X-Mimecast-MFC-AGG-ID: 3RF40kcrPBuuOivZiGveyQ_1764882464
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7881cff41b7so18725417b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 13:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764882464; x=1765487264;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Utloqd78xIty0AP3e9N1+0oedDpwpptC21lH5x2/t7g=;
        b=jOfXqkYuiPOCqbJMQ71qTwJPkNY2jFsmvmg/4JeL5Oy+jzXTKaSBUzHdvQ9EunIx6R
         FYVBcUxxGilwo3pQ+RRUGvDtbWznW8qxw9DiazxGnREzEsZMLdH5F4sMBdzYK0qjBoPz
         UxojksEhzCJnO4IhJy0QtHxQfWntVHzn+drG2iIYOc/dHevzluCL0uxigQEWDgCwS5qI
         HOtrN5OWZKzeWgYDg1FdCWh56re71pqjbgAZxjW6QLOIS9h2815rKRfDPncMB0nwvpep
         YAWh4NZ+Ux26028pCU1KEa/cZiCOnQxKsXYU94HXFBnissk3unPZil+u7rMo8bWCwk+z
         FXdg==
X-Forwarded-Encrypted: i=1; AJvYcCW9ag4Z1QKblcYY2R5ctGmokxYL+6fyA5qb5oJwUyogjF5UmkQPlcfh2Xq6qevwSeuo6pU0EabrKSMWTjAWZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQkTxUDtZBLRewqhGRDvUFE9FlSENpNmiDOWjMqnbXJAUJqalB
	RA6tcqtGVBtygTrk8lHLzrz9HfT4zy6JJY+GzrFKbaeWdWmpnd8gn2cXuXFQRoeYvt4I9ftvajP
	6jpLGVi3HeLS6XvOOVkpGq2xgtUhLcLaGiYZLePRBSUra2cETqvABtmGkboO8WLiw+b1g
X-Gm-Gg: ASbGnctHUeG6nmgZLuppGb5lpOdqflNiTZdgAWzFzYzY+03rN6lXh8kpQKyGxPHmEyj
	Urs5VP4xilfdZf7Zobcltsq6tEtiHRRS/lukZ4wjzMhwFaJdzxamQyZIpQuwpHVAG0AnOduzhNp
	vkhlppSU/POor3LVqsjgfx/1+KzLBgCizJIz0uPrt7IwFQx4f7KvqZdhtWfBTyzG5U4tqLzfaNn
	GKtNzIFkbhdGF99CSFb2pFWTSqh9z7VPeZhZPhM7G2bIv+tsJBfQpv8ZDLMWwPl+XtwKCnbTh/s
	M0dkr3JBvbAiq6ZAsC2wpInUR9XN4rFw8r6dI5yozIsUtBoVF75wviamSISrmXSyvqnmwXjZteE
	Ikiuo6acKcA==
X-Received: by 2002:a05:690c:1e:b0:786:5789:57ce with SMTP id 00721157ae682-78c0bffa67bmr64181217b3.43.1764882464266;
        Thu, 04 Dec 2025 13:07:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHm82XKkqw4kfk5U49CAGJ/i+43HgaWocHH822ewl7ru2nz49+bzl9Zv11OSszH0Ut14YtklA==
X-Received: by 2002:a05:690c:1e:b0:786:5789:57ce with SMTP id 00721157ae682-78c0bffa67bmr64180817b3.43.1764882463673;
        Thu, 04 Dec 2025 13:07:43 -0800 (PST)
Received: from localhost ([2607:f2c0:b021:e700:58e4:f7ce:31b9:7841])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-78c1b7a72dcsm9479027b3.52.2025.12.04.13.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 13:07:43 -0800 (PST)
Date: Thu, 4 Dec 2025 16:07:42 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
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
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: Re: [PATCH 7/8] rust: pci: add physfn(), to return PF device for VF
 device
Message-ID: <aTH4HifpRnqWA6X8@earendel>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
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
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
References: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
 <20251119-rust-pci-sriov-v1-7-883a94599a97@redhat.com>
 <20251121232642.GG233636@ziepe.ca>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251121232642.GG233636@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cs6WtuXPzP6ERRal76cwSLkhYQ0n9Ci-2zEpXgsmDI4_1764882464
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 21, 2025 at 07:26:42PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 19, 2025 at 05:19:11PM -0500, Peter Colberg wrote:
> > Add a method to return the Physical Function (PF) device for a Virtual
> > Function (VF) device in the bound device context.
> > 
> > Unlike for a PCI driver written in C, guarantee that when a VF device is
> > bound to a driver, the underlying PF device is bound to a driver, too.
> 
> You can't do this as an absolutely statement from rust code alone,
> this statement is confused.
> 
> > When a device with enabled VFs is unbound from a driver, invoke the
> > sriov_configure() callback to disable SR-IOV before the unbind()
> > callback. To ensure the guarantee is upheld, call disable_sriov()
> > to remove all VF devices if the driver has not done so already.
> 
> This doesn't seem like it should be in this patch.
> 
> Good drivers using the PCI APIs should be calling pci_disable_sriov()
> during their unbind. 
> 
> The prior patch #3 should not have added "safe" bindings for
> enable_sriov that allow this lifetime rule to be violated.
> 
> > +    #[cfg(CONFIG_PCI_IOV)]
> > +    pub fn physfn(&self) -> Result<&Device<device::Bound>> {
> > +        if !self.is_virtfn() {
> > +            return Err(EINVAL);
> > +        }
> > +        // SAFETY:
> > +        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
> > +        //
> > +        // `physfn` is a valid pointer to a `struct pci_dev` since self.is_virtfn() is `true`.
> > +        //
> > +        // `physfn` may be cast to a `Device<device::Bound>` since `pci::Driver::remove()` calls
> > +        // `disable_sriov()` to remove all VF devices, which guarantees that the underlying
> > +        // PF device is always bound to a driver when the VF device is bound to a driver.
> 
> Wrong safety statement. There are drivers that don't call
> disable_sriov(). You need to also check that the driver attached to
> the PF is actually working properly.

Thank you for the review. I missed the obvious case where the
PF driver is a C driver that does not disable SR-IOV on unbind
and the VF driver is a Rust driver that invokes physfn().

> I do not like to see this attempt to open code the tricky login of
> pci_iov_get_pf_drvdata() in rust without understanding the issues :(

I will work on a proper solution based on Danilo's proposal [1].

[1] https://lore.kernel.org/all/DEFL4TG0WX1C.2GLH4417EPU3V@kernel.org/

Thanks,
Peter

