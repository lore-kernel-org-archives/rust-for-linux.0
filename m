Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B32C2F6167
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 18:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765304668; cv=none; b=HEOAwMEVLpKhGxaAvDeeLzAeB82y2ntWNB193ppSq6CekjqJ/twClUtBDDJfrJ5xqlMI15KTP9IPmrCz948jwDVHQHlwxGpxT3McJNd8eu4iOgaPaZBUIy/Tr4SgoAcEEWCBt+kaYZ8HYr3Bj8IKzJtoCvPP+nngLcZlltm6qqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765304668; c=relaxed/simple;
	bh=hAn/Z5Df5IfuEg5YxLgjH2jmnTaDG3wqcDn0Zcz6LNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fAZxXkuyjBylsOyfDW5X4fBsoFaUIVeBKXcD+LoIXi5qWZaZ17sxDDMdtvdKQuFI8Vd19QajNTCQ2lw7jlu9h7UJcZHXc9SJwW1rhFUcjypzhj2O9xkNiy8lCMnmtj8S5JGDZyOfa4yzqBmWPLocw+kUSdp0Ta0msdfHJwehvyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HctDhQJ+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HctDhQJ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765304666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dnmWADxON+YmdpGHvTe/CcMuyEKp/5Q83Q83DsKz/iw=;
	b=HctDhQJ+4A3aUhAaAhKQnY+g776Z8uPWBktbJDdybVFtgq1Qc0Y9RQnJzsCIiGlIg09oWO
	9haPNMbODlSTqDLthKNGZxmG7tDPjVqSWvlLq1qsMEYy1FC5K6+J3U40SVlmBomXp+p1Ke
	f5b64Wv47GiSxbWV2n07CXJcO+3UwYM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-eOhTOctBOESrT9uqEBFEwg-1; Tue, 09 Dec 2025 13:24:21 -0500
X-MC-Unique: eOhTOctBOESrT9uqEBFEwg-1
X-Mimecast-MFC-AGG-ID: eOhTOctBOESrT9uqEBFEwg_1765304660
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88239fa9ec9so155535686d6.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 10:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765304660; x=1765909460;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnmWADxON+YmdpGHvTe/CcMuyEKp/5Q83Q83DsKz/iw=;
        b=kxQnucddLnV/6py7N1tP+qs/3PrJpxLn27A7SfoO4uuI6kIGouOCWy/VE6Kbzr539C
         OOYViygh9Xwm9moLDRdcHtUzBwOK9VV3FOgyHswXO254qMQIslLXO7oj1o6EiOs6pDue
         SPkMdBsqrDrgV3pQ3MCbXYOI0trfYXh4uygB7gt5HNZ98HFlzKTQ2LXDl/qK7w50F2Wy
         IgNmvEp6yPW8UdrSQrMnhZRo9gopp7AxGGJ38M8psM9pXzRf3LADBkQNNjncNh5udQ0F
         DmMBfBcs9xxD2NJKqn/EtdvqJZntIvrYO7BgeinevdImz7vR4NL5aSBgyWAE8v1jYmC7
         qTrw==
X-Forwarded-Encrypted: i=1; AJvYcCU2YLqtdpHuuiuWqx05CVG+fqO4rF80JdESud7YoCGaVdX/15+qac4OV0lfOGj3XUGNhvZZXAXl/u4+Lxpqng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG3g47pSEPf0kRrucQJz6AejN6EFvqRINrIec6c2Pw9xyWeouB
	+jBQDY7QmdM6dAukfiSayEtKCk8SJmjLUloP+Kzww1Oprw1WKL5aRAilW2Tp3fSPrlSWSuZc3Ql
	gNEeX2+DWG1FT53K/DnQeo1zx926+1p2O/0Y829WmR55TENLpNweR/lBDQyPQaKtpFavU
X-Gm-Gg: AY/fxX66rlvODnw8GQJ7StD1KCAEXkSdUVaJbkQEQrfwPLcvf8BO0JIVqnaP18Y+U2s
	W51CTXFODdBY2Hldx4wfg92jo+TX6wsE2mPwZKGLzyoCaCvc1ntSF4xMAv3Ayx0zVSPxGiTcdeq
	kT7tWK0XJdIuWw87I/mvWb0oPLsi84u2vY/G14iyhfAQqOy+MKE4cost2BgKxS2wHHW1hFJtXom
	ci0ByFYFT75j6tew7vjVnzIu3eMJd+tVTLX4fG55xns5loHSK3sQMHj9ZqJfZlDnJr0B9Q1DsIn
	hbkUtOl1+cBGzNKv7cGM/ojqepekg2V+21WpuydVFBPpXthknvqpJnXOSgDlgcsmf6P6PWI6ojv
	Z1ji/usZXTQ==
X-Received: by 2002:a05:6214:ca4:b0:880:5a6d:acdd with SMTP id 6a1803df08f44-8883db2a6b2mr191692806d6.20.1765304660182;
        Tue, 09 Dec 2025 10:24:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ8wAtHimvFzUwt+2wodU61BXEoK2Jlph6a1B6dGPRD3NMrmeZ11TpnWCcFApbeYhstxlBjw==
X-Received: by 2002:a05:6214:ca4:b0:880:5a6d:acdd with SMTP id 6a1803df08f44-8883db2a6b2mr191692316d6.20.1765304659571;
        Tue, 09 Dec 2025 10:24:19 -0800 (PST)
Received: from localhost ([2607:f2c0:b021:e700:1a3d:b7ef:5d4d:bee5])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-888287d5f9csm131225306d6.46.2025.12.09.10.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 10:24:19 -0800 (PST)
Date: Tue, 9 Dec 2025 13:24:18 -0500
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
Subject: Re: [PATCH 2/8] rust: pci: add is_physfn(), to check for PFs
Message-ID: <aThpUqJDqa_7VYtx@earendel>
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
 <20251119-rust-pci-sriov-v1-2-883a94599a97@redhat.com>
 <20251207063529.GA213398@joelbox2>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251207063529.GA213398@joelbox2>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: axIEwpyxSRPfqb-qQf-3yIc8xhQ4iRl6bX7KuDoYzyg_1765304660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 07, 2025 at 01:35:29AM -0500, Joel Fernandes wrote:
> On Wed, Nov 19, 2025 at 05:19:06PM -0500, Peter Colberg wrote:
> > Add a method to check if a PCI device is a Physical Function (PF).
> > 
> > Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> > ---
> >  rust/kernel/pci.rs | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> > index c20b8daeb7aadbef9f6ecfc48c972436efac9a08..814990d386708fe2ac652ccaa674c10a6cf390cb 100644
> > --- a/rust/kernel/pci.rs
> > +++ b/rust/kernel/pci.rs
> > @@ -409,6 +409,12 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
> >          Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
> >      }
> >  
> > +    /// Returns `true` if this device is a Physical Function (VF).
> 
> nit:  s/VF/PF/
> 
> also, add #[inline].
> 
> With that,
> 
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

Thanks, done.

Peter

> 
> thanks,
> 
>  - Joel
> 
> 
> 
> > +    pub fn is_physfn(&self) -> bool {
> > +        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
> > +        unsafe { (*self.as_raw()).is_physfn() != 0 }
> > +    }
> > +
> >      /// Returns `true` if this device is a Virtual Function (VF).
> >      pub fn is_virtfn(&self) -> bool {
> >          // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
> > 
> > -- 
> > 2.51.1
> > 
> 

