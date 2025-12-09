Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D322F3C1F
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 18:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765304573; cv=none; b=PV6Ggur3m1lItVicKr69VwiAMBvL6G5/axTREdarWEl/8/7bK78K4MiuDetuxiTkj5/MhBAii+ckyo5FReF+iFHuFH1aT+IquRjq7+ZHts9yCbIF6z4D0C+PZZL4UYGbNzPePv1mtq4PljCuu4L3ghABuCbnoA9SiUwjGjpmMlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765304573; c=relaxed/simple;
	bh=EE7wXtjs9EBC1pz96zdtJaDICazZ+qtIBI35mNOiwXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=G7vP7+WqcRPypv5FB1ukOddlKuKJxH4/PheGH8OCrvVfilNfPKs+16MaUeZCuA0gq/djaKslCoib/GGQyPpxFkZbqLf21iaac0aKQ/o/WfrFexnI1AjwMCpNvu4eF8kJP29WaMWiYt8UV6kajY9xKMosXiQ7xp+1woFjKGPGr1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c8pe1A1n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c8pe1A1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765304570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WMOszaFVk9dmDMFq0LvRTh2fbh1Zhs/4RFuYjDJSUZI=;
	b=c8pe1A1nGwyCqWBct88u5gpCknUn5KBS7APJZvdQ1cNSXZwlWx90eq0FSj7uLmPOdSnHhh
	vQdL50GBroeZF1byrVnybJWELaaVGUj0Diw8b0fINNL1rd6/g9SQOILLybH/B2I+odgAwR
	Yhh54vrvzX+N5VKOgEYktpgLV+XgZlg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-cSU-9j0QMNSb8DT1_QJAmA-1; Tue, 09 Dec 2025 13:22:49 -0500
X-MC-Unique: cSU-9j0QMNSb8DT1_QJAmA-1
X-Mimecast-MFC-AGG-ID: cSU-9j0QMNSb8DT1_QJAmA_1765304568
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340c261fb38so10297706a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 10:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765304568; x=1765909368;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WMOszaFVk9dmDMFq0LvRTh2fbh1Zhs/4RFuYjDJSUZI=;
        b=Ru5dtjIkKIzGcckl2eBuyxxmlmGynHOb+CGbyKv+NC/OmJwXdvbSaSwZdkiJnGHrKH
         vpgDDb4RAwU2MkeXwq5HWtmZH087FhEr2yzy7ceL+dJOfWJH2awI5AahaVdpcqoatWPQ
         +FfFA5469V0B4S4mSL8Kfu0Kklu5MVXzmuxBdhrVenlVbL+SHblTkYsN2JwJJqVzYnxW
         8jIV+Ws2xawiNtDS2OW91hmrFjlFViwPwh2IMQy6b7veEdPl9oxVFgwB3uDrUNqvhSOG
         1jR/sXnM4CBwufNURRzhzFChYC1AUiixES1Zb0kwwXlDmSS3CpCF4PeHWKAkOxV4au4r
         0kcw==
X-Forwarded-Encrypted: i=1; AJvYcCVJZuf+QAWeYNdglAPnT1hn/yf2YIhQuvS8hqwng8/GbhbW7ILkfkOkJiVhv/VJMYb9zWCHmbMVD2J6n4zrUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx+qtJRcbUODW9odDYRuqZutrs8S/wJrd7KAfzdgCRXGo1DSZH
	BPM3sr8mo9/fwnpqTISvPwR75t57LmA/rgSkLmtVZylZrlXKdhOAVUDjbKLbffKQSglwxeJiLiO
	YUwyLZsO+Zpz4Zg8+gRtJpTDoRQt1t1Bp/XOJAmS/Iha10gxsv4OFthUc2+1E1nkzYXnE
X-Gm-Gg: ASbGncuajwl0HI63Hu8pgujChiv8vQjwDYLosa/Ce5rVfJLodvUHosZDi8Mazc+BuFQ
	wI6f5aYHPiExkX9It7VolKlu4zDTJwy8OgEhLVgYKUjUL98nNpAXcsm/tVvoGWhHAIVHtCXzr4h
	WWlMbs3ncvpEWYL08ATnHNkmNZKPzNQqCE1hEx0izJRcfBy5DCnTGrtb86ZdbtWavvKpm2WZAqs
	vQZMnEYFvvTlRMDEj1zKkZOK46WmHDuHG0Swl/iar71VKUPZR9iutUDGYqliriF8DcSkI/x+yGV
	WvOAS9a9dNQoaLge72jZBIlBXdwu466Rg9kbr3vPGGVMwKoFy0TzaY0UflZDB1NM9kBZ/oM03EC
	nYBl9YDRKjQ==
X-Received: by 2002:a05:7022:401:b0:11d:f464:5c97 with SMTP id a92af1059eb24-11e032d86admr10001655c88.39.1765304567942;
        Tue, 09 Dec 2025 10:22:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDwilm5GiGAv7e/m6VA+/VyYDDyNis+KEVWPuuPoKnNewKlxbpy5fSUp7p0RlzrwnLtnLoLg==
X-Received: by 2002:a05:7022:401:b0:11d:f464:5c97 with SMTP id a92af1059eb24-11e032d86admr10001629c88.39.1765304567147;
        Tue, 09 Dec 2025 10:22:47 -0800 (PST)
Received: from localhost ([2607:f2c0:b021:e700:1a3d:b7ef:5d4d:bee5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-11f283d465csm1567525c88.14.2025.12.09.10.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 10:22:46 -0800 (PST)
Date: Tue, 9 Dec 2025 13:22:43 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
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
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/8] rust: pci: add is_virtfn(), to check for VFs
Message-ID: <aTho82cpiQbrrCdd@earendel>
Mail-Followup-To: Joel Fernandes <joelagnelf@nvidia.com>,
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
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
References: <20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com>
 <20251119-rust-pci-sriov-v1-1-883a94599a97@redhat.com>
 <20251207062819.GA212851@joelbox2>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251207062819.GA212851@joelbox2>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w8G0cuUuMy4_xqOnW72QclrpVwoTd7a6lSNo6OwO9tE_1765304568
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 07, 2025 at 01:28:19AM -0500, Joel Fernandes wrote:
> On Wed, Nov 19, 2025 at 05:19:05PM -0500, Peter Colberg wrote:
> > From: John Hubbard <jhubbard@nvidia.com>
> > 
> > Add a method to check if a PCI device is a Virtual Function (VF) created
> > through Single Root I/O Virtualization (SR-IOV).
> > 
> > Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> > Reviewed-by: Alistair Popple <apopple@nvidia.com>
> > Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> > ---
> > This patch was originally part of the series "rust: pci: expose
> > is_virtfn() and reject VFs in nova-core" and modified as follows:
> > - Replace true -> `true` in doc comment.
> > - Shorten description and omit justification specific to nova-core.
> > 
> > Link: https://lore.kernel.org/rust-for-linux/20250930220759.288528-2-jhubbard@nvidia.com/
> > ---
> >  rust/kernel/pci.rs | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> > index 82e128431f080fde78a06dc5c284ab12739e747e..c20b8daeb7aadbef9f6ecfc48c972436efac9a08 100644
> > --- a/rust/kernel/pci.rs
> > +++ b/rust/kernel/pci.rs
> > @@ -409,6 +409,12 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
> >          Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
> >      }
> >  
> > +    /// Returns `true` if this device is a Virtual Function (VF).
> > +    pub fn is_virtfn(&self) -> bool {
> 
> Add #[inline] here and to `is_physfn()` similar to other methods in this struct?

Thanks for your review! Where should the line be drawn for #[inline]?

Should these be #[inline] as well and why (not)?

- Device::num_vf()
- Device<Core>::enable_sriov()
- Device<Core>::disable_sriov()

Why is Device<Core>::enable_device_mem() not #[inline], while
Device<Core>::set_master() is [1]? Is the former an oversight?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/tree/rust/kernel/pci.rs?id=67a454e6b1c604555c04501c77b7fedc5d98a779#n433

Thanks,
Peter

> 
> With that,
> 
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> thanks,
> 
>  - Joel
> 
> 
> > +        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
> > +        unsafe { (*self.as_raw()).is_virtfn() != 0 }
> > +    }
> > +
> >      /// Returns the size of the given PCI BAR resource.
> >      pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
> >          if !Bar::index_is_valid(bar) {
> > 
> > -- 
> > 2.51.1
> > 
> 

