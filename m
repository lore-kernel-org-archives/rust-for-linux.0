Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AD61E1DF0
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 19:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517444; cv=none; b=N28q8s9k5qtym2h/H+k8X3UYlngxzBL1B51v7o/ll3XbgSVsh21uuY/B8EZeT9DU4Hh+d8PahE3PzUWTygmtTQyGb65EVNO5w/rsc+AWWyQ4ss+EnlcJpfnln6NBTq06fRXPW7jwtgHo8bXgaLwHcYQlkcDzbd7FOcAwML0/Ljw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517444; c=relaxed/simple;
	bh=poOoKvcO3Us3c4TUKHnMQxB/eLRcmFk1ClRZt9EbPKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Nli26Jc9yAySoGxjaLbs5mj/8nLNzgpjTNdUSkJCMtYN3FkJGBzSAOXt6yh/j5UTNfBtqKBP6RLO1wPMBV849uahF2SsOSjpaDghq2CAdDSNed1OExfX91RknfnHajnzzX9yHUirJJEdkk/SyuAuHCdeB5Xhoa10XD1S9vzfU94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZBKgFYgu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZBKgFYgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766517440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BPaf7cvMeUb+WR/4ptWdXDyfo9zJ3Ha3IyxL3hD0Trc=;
	b=ZBKgFYguwh3qmy9NRm698NYD1e+f07ur2ptZAoZjaBSY6o/Z1qctwBZa0ds9GtVG6MCYZE
	/P/v+H9r1bB0jFRK45w7BPiq8Tlk58Zj8KgUHIPxG0tz5H8103FKpMrmBc/79di1kHZoR8
	pgwL2SEeyTwDr+edq7n04R3+PUAg3Nk=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-_qQzAdASPV2B8xqLU2CQTQ-1; Tue, 23 Dec 2025 14:17:18 -0500
X-MC-Unique: _qQzAdASPV2B8xqLU2CQTQ-1
X-Mimecast-MFC-AGG-ID: _qQzAdASPV2B8xqLU2CQTQ_1766517438
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0d59f0198so70088795ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 11:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517437; x=1767122237;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BPaf7cvMeUb+WR/4ptWdXDyfo9zJ3Ha3IyxL3hD0Trc=;
        b=cpOHt75/1NPddVbThQdzg8F3smVfdg7ky8fIJsqfTLhHGr9hOqsBhECXj1UbW0fzS7
         jVKNjxZFRX4kdE2VZkp+QYoWKltZhN5Lu/geyNic+M5U3BuJwCNC9YJ+eliPdUsj4ZEp
         iuaYD+OrNmmH3mZoKNigrypFGuoSCg5GfNgU0WYSENHDGFNsnRhOzjwbvvFWQLP3NNlW
         giuidTB6KfoF2YzDRu/9fODwGnI+q/2SkCeEOsHz43ug0wl0t13EKyLRKxZ5Iz7COR1X
         pBlWeZuKYfBjAe0yEA8cEN9rwZoFr/yXmEEqjf2WWBLtIidQlDdRro5+W6uCj7k8Q5BX
         wuEw==
X-Forwarded-Encrypted: i=1; AJvYcCUovIp1IDwCjI5CQJsyr3HAo6lsKiSHPsq2slqC7gvQRr2nMwdYwTE8QCG9qEe9YUVIUSHHGv+Jqt7IL5X9AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyR5NxLiFg+nUsard/PmUxrRszsYTnkIFzCQaC6jgaLh8zFD7Z1
	Lg5QajmFE4X2Nz7X+72koik2SYgt8RsVzfJlMA+edeiiZm/HmYck+wo1DcMKrR0AP2l4Ten/cPD
	ZxlySqcJ0dwUejaAFnBrW25aQtHUjN3wZZ0l3+eV+554EygUEY37PwWrwHVSmdY6AYatj
X-Gm-Gg: AY/fxX7NqmkUMh2qIi+epiqP1eJ1D6dCzpcE1MZemdg+mZGoScvPDvAwVLwcGi1nsZQ
	/5p03tNAY1utsQKW09JH36LUkbaXZaNS/Y7iDuE9SOum6bJ3OYN8oF4PBIQHEEdDvXybe6/kyQ3
	efY2wW07V2NNWmxMHKmwQ5mFsCfOQ8rSya7cMKCchldjjp9Wy55wIC7n5oolD1x0yejieIkGCFZ
	/3+9NzvvYexarRzMb5w32AQHsbVvgEDyYCAtLFhSBCeNyBJiTBzgsd7aaiMXKi8TtgdbGjcOR8S
	/5njLGhpPG/t2HSApsMRj/GarWxHzuS7yIJZyo/UoyLkYxetix7BMO0/BVaJf1C6yoA1mggqaj+
	KvYRU8A0Nwg==
X-Received: by 2002:a17:902:e748:b0:295:738f:73fe with SMTP id d9443c01a7336-2a2f2732287mr152444475ad.30.1766517437257;
        Tue, 23 Dec 2025 11:17:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEWcWm65pg63KuHNSK7FvILIyANZhLme9Kp0jYEf3fR0k1Qze2WHIz7yDWuBwgWdMwAF/9U/g==
X-Received: by 2002:a17:902:e748:b0:295:738f:73fe with SMTP id d9443c01a7336-2a2f2732287mr152444145ad.30.1766517436635;
        Tue, 23 Dec 2025 11:17:16 -0800 (PST)
Received: from localhost ([2607:f2c0:b1e4:8e00:640b:e13f:5257:9d78])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2a2f3c666casm132973425ad.3.2025.12.23.11.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 11:17:16 -0800 (PST)
Date: Tue, 23 Dec 2025 14:17:12 -0500
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
Subject: Re: [PATCH 3/8] rust: pci: add {enable,disable}_sriov(), to control
 SR-IOV capability
Message-ID: <aUrquI3X68Ilmebh@earendel>
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
 <20251119-rust-pci-sriov-v1-3-883a94599a97@redhat.com>
 <20251121232833.GH233636@ziepe.ca>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251121232833.GH233636@ziepe.ca>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aLagx9kLNjR8o5-XKbKnNTTxtGrHdDIQhGCMT61hxbA_1766517438
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 21, 2025 at 07:28:33PM -0400, Jason Gunthorpe wrote:
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
> 
> Both these functions should only be called on bound devices - the
> safety statement should call it out, does the code require it?

Yes, these functions are in the Core device context that inherits from
the Bound device context, which guarantees that the PF device is bound
to a driver. I have added a note to the SAFETY comments.

> 
> Also per my other email SRIOV should be disabled before a driver can
> be unbound, this patch should take care of it to not introduce an
> dangerous enable_sriov().

Thanks for your review. This has been addressed in v2, which disables
SR-IOV before remove() when a PF driver opts in using a new flag
sriov_disable_on_remove, which is set by default for a Rust driver.

Further, enable_sriov() is prevented during remove() using a new
flag inhibit_enable in the pci_sriov structure that is set before
and cleared after the PF driver is unbound from the device.

Thanks,
Peter

> 
> Jason
> 

