Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6418301489
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 17:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765303161; cv=none; b=FHQ6XrvVaWsW+Ppadeu/ljcsySi774xNookRExzTyh2kwPxu2ESU7OZZqK9abri5fQ5i8jYdRRmvc4n3dgNW/zqK/UQmJBSLm7xG7e0F/Y+60aoLNvkCuM5v2+NzR2+JKJHmJO9pQfyWwKdYna2XR9Qpm4CY1Y8eSN7liu0/1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765303161; c=relaxed/simple;
	bh=bA0wuiy1d/JjgUyW5FUV9b+iMg8924V36lmVig/owYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=mcXsXg3b+D4sUXNyk52oYZ7jgPd9eLJJo5Yu8eLgg9UgW1aCCrDj7t1VGtTq/UigrLSN96Z65tWfgNyw49KAtbviMdkMLODn9S53Wpp8jMXfmqVMFWoGio+RgWGftFwGhhFD09KZ2HZZ/40Ddq34uT1OExJYbrjwHzSb/yd/XAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aprQ1o6q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aprQ1o6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765303158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d40vUR++1qaOFZuFdSMGSKMwO2iDcXUS86cXZ2oik34=;
	b=aprQ1o6ql1oaEm/C9xckXL2S5Ds0L0SHychx++ZmGEQxDBMpUfv5xNq6fMbrn4dqlkzB8Q
	8HDFuw1+cBLqC4or5eol2m/l0wv3HafbdRmKUFmo5lulr+PLQff9wHSxogQBL/a9eL3oqP
	HZlFW2DJ59eX9J1Brr0aXKkGbbBkBP8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-fkltsFaZMQGP2o3n4dZ6gQ-1; Tue, 09 Dec 2025 12:59:15 -0500
X-MC-Unique: fkltsFaZMQGP2o3n4dZ6gQ-1
X-Mimecast-MFC-AGG-ID: fkltsFaZMQGP2o3n4dZ6gQ_1765303155
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8883eb7f09bso82384076d6.0
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 09:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765303155; x=1765907955;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d40vUR++1qaOFZuFdSMGSKMwO2iDcXUS86cXZ2oik34=;
        b=v4QdKQG5mbKn0J+dqajcJubclvqG79GkV9Zn7YJCa7tpFOA4i07SYGP+S/6c0mqm2y
         8PRWHkIeOY34eLxecEcdZPyJ50QZjYOlkZSiFS1108t/+pMB/s3t6yVLQpAaOF80Cojd
         8CQD06pLnJFOO5LdDDsP6U3dNOQPxyqtUAvxQbq5nS6XiVDjq5Lh0doSbNJ+zlBwqSYk
         TiK/2mulyGbIsTs5fGv41G+jTPePrP6HfQgwpFE/DI5gofhvYdLwEqs7R5H1mtpzEdHe
         OSAfxFZta3l0zE41gSH0R2+wKuISZQlp2fZ4yKFuJZUYV8T8/TJtvFuMaWepb4pS1Zs+
         ubRA==
X-Forwarded-Encrypted: i=1; AJvYcCWO/wRVxXZHEZIK2YURwca0jH9IfAil8GflmMgXHlbsizPK4CXVRhh4gWJwGuoAC9WHzE4hYzBrKtGf+zMZBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwbzjmQ8AJIRp6eOIz4D+/PIUaxY7cTVMFwEqxtuY/6A4R0QzU
	NrkUEQrBXGpHEswaCsT8qz9XGclqea1s+zWjGN1rVzpuPXwG3shMmgFGS8NR4DWBr5ncbuo4YTg
	d3bovgloKCgr/7xJzUkGIpbEPJGgkBznynBnD7qyCu1Hiq6hZpzOqoR4CecrXK8CpgMz4
X-Gm-Gg: AY/fxX7M79fh8fKJYClFooMg2GLVuCW+OguFgbq53n6Y94J2xf85y6q+//2vAdkvtAx
	zZEp5LO6xaVqUvpz8xxAVPesuEJzlh1wb30/wb26vmvxlXtXlbSRxft6u7sO5OYUCuKAL3muJdV
	UFXBzZ7YOK9MizLb0cls3rZuT5GgSO+R7lvDwRhieSNp/syPmM0I/qeBZif850xTnI4nHDutoE5
	X+K/h5Gz9m8puTMsQVH/aUNKwOB4GQrM9jneEd8D1t9jM0zdKQuFkHhhPbkKh3B2qCzhElSNFW1
	SMO/pfx4gs6Xi2Yk4T4T4ZWhjZUAArS86uwxNZJtoowHL4tAezMiwTCc1SinRvZ7FVFmUTh3nap
	eo3RZpJL28A==
X-Received: by 2002:a05:6214:2422:b0:87f:b2d8:6020 with SMTP id 6a1803df08f44-8883dbf6cb3mr214779386d6.38.1765303154859;
        Tue, 09 Dec 2025 09:59:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW59vhBVoyXlKa64sg3W6fFSnkL9S5Jg3icr+p7GG1on3Wtf7TpWh8CqQWJvDh6TJDBZ4C/Q==
X-Received: by 2002:a05:6214:2422:b0:87f:b2d8:6020 with SMTP id 6a1803df08f44-8883dbf6cb3mr214778486d6.38.1765303154269;
        Tue, 09 Dec 2025 09:59:14 -0800 (PST)
Received: from localhost ([2607:f2c0:b021:e700:1a3d:b7ef:5d4d:bee5])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-888287a5518sm127224716d6.31.2025.12.09.09.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 09:59:13 -0800 (PST)
Date: Tue, 9 Dec 2025 12:59:13 -0500
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
Subject: Re: [PATCH 3/8] rust: pci: add {enable,disable}_sriov(), to control
 SR-IOV capability
Message-ID: <aThjcZrhbe8Ysgab@earendel>
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
 <20251119-rust-pci-sriov-v1-3-883a94599a97@redhat.com>
 <20251207063355.GA213195@joelbox2>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251207063355.GA213195@joelbox2>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3puPMTZhtPTuD5-orFwjk8m1JNxWTDChUYmRIUIwK38_1765303155
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 07, 2025 at 01:33:55AM -0500, Joel Fernandes wrote:
> On Wed, Nov 19, 2025 at 05:19:07PM -0500, Peter Colberg wrote:
> > Add methods to enable and disable the Single Root I/O Virtualization
> > (SR-IOV) capability for a PCI device. The wrapped C methods take care
> > of validating whether the device is a Physical Function (PF), whether
> > SR-IOV is currently disabled (or enabled), and whether the number of
> > requested VFs does not exceed the total number of supported VFs.
> > 
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> > ---
> >  rust/kernel/pci.rs | 30 ++++++++++++++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> > index 814990d386708fe2ac652ccaa674c10a6cf390cb..556a01ed9bc3b1300a3340a3d2383e08ceacbfe5 100644
> > --- a/rust/kernel/pci.rs
> > +++ b/rust/kernel/pci.rs
> > @@ -454,6 +454,36 @@ pub fn set_master(&self) {
> >          // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
> >          unsafe { bindings::pci_set_master(self.as_raw()) };
> >      }
> > +
> > +    /// Enable the Single Root I/O Virtualization (SR-IOV) capability for this device,
> > +    /// where `nr_virtfn` is number of Virtual Functions (VF) to enable.
> > +    #[cfg(CONFIG_PCI_IOV)]
> > +    pub fn enable_sriov(&self, nr_virtfn: i32) -> Result {
> > +        // SAFETY:
> > +        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
> > +        //
> > +        // `pci_enable_sriov()` checks that the enable operation is valid:
> > +        // - the device is a Physical Function (PF),
> > +        // - SR-IOV is currently disabled, and
> > +        // - `nr_virtfn` does not exceed the total number of supported VFs.
> > +        let ret = unsafe { bindings::pci_enable_sriov(self.as_raw(), nr_virtfn) };
> > +        if ret != 0 {
> > +            return Err(crate::error::Error::from_errno(ret));
> > +        }
> > +        Ok(())
> 
> nit: Why not use `to_result()` here?

Thanks! I queued `to_result()` for v2, from an unrelated review [1].

Peter

[1] https://lore.kernel.org/rust-for-linux/b8234f181d35b21a3319b95a54b21bdba11b8001.camel@redhat.com/

> 
> thanks,
> 
>  - Joel
> 
> 
> 
> > +    }
> > +
> > +    /// Disable the Single Root I/O Virtualization (SR-IOV) capability for this device.
> > +    #[cfg(CONFIG_PCI_IOV)]
> > +    pub fn disable_sriov(&self) {
> > +        // SAFETY:
> > +        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
> > +        //
> > +        // `pci_disable_sriov()` checks that the disable operation is valid:
> > +        // - the device is a Physical Function (PF), and
> > +        // - SR-IOV is currently enabled.
> > +        unsafe { bindings::pci_disable_sriov(self.as_raw()) };
> > +    }
> >  }
> >  
> >  // SAFETY: `pci::Device` is a transparent wrapper of `struct pci_dev`.
> > 
> > -- 
> > 2.51.1
> > 
> 

