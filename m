Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6428827FB34
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763653781; cv=none; b=IYAtXpBnt0Jb7rbJd84QfQRWCDIK4Xrc4kcaInetTA+LxrWKz7cvjgTB9sdBwCGi7xtMM7HzBssDHs5OIVYfjs7miVBqU3GrzfuzxTFfcfx3fV92l7fpULWmZR58iibQ1+89v+DcSFvPwURFFcC3xB1VKVNYtz0e02arQ9UAz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763653781; c=relaxed/simple;
	bh=Z7khxCy0juQFD7sc2XVpGJcgIRewBFI8alTprYiEvgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ILiZXA4rwQZNsWTHWJncOm+AJJiIFZhsr0R5DQ4qFfchNNx6Ju9Uvzg4ZMEwiaLI/vZrpEShT+Qzah0oeapYhlUZd+pj03E5aFFcTURl+ABVErx8OcI4O4Quf45RBHXRoHEKGqqSsbt67MsxJMkafqvTvEWPj6Ps3mlHXe1H+GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S4VRuRrF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S4VRuRrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763653778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91ugE35V8USHsTpLgO4hUdjEiFkkZFTQ1do7SDOhLck=;
	b=S4VRuRrFMfMjIxTqiOyegmx748xmX84H6D6YWG1zpRomeX/w8BcqlYSANib/BzpzUVYJTL
	qGmcFbET18Euvk5NGnNbSO1qpH5fA/bCfFchdr0lJng/gLC6Ms0hI3p3r8DKWzyMUuq6lk
	7mDy9Exn0qoCi9yE9Wr9E9+M4zRajek=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-Qoo-ciVZOu219z4-j03JBw-1; Thu, 20 Nov 2025 10:49:35 -0500
X-MC-Unique: Qoo-ciVZOu219z4-j03JBw-1
X-Mimecast-MFC-AGG-ID: Qoo-ciVZOu219z4-j03JBw_1763653774
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8804b991976so27011446d6.2
        for <rust-for-linux@vger.kernel.org>; Thu, 20 Nov 2025 07:49:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763653774; x=1764258574;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91ugE35V8USHsTpLgO4hUdjEiFkkZFTQ1do7SDOhLck=;
        b=FwHKtXtrQUvzQNJDrvBVCI2RonPIM7F0tmqOXZIfg1QlJgAjaJii/Fa9zjMAh/DK4i
         k1IMAI4cckruI+CeeLVs0PsAW1294tze2cafzRPE3e9ozAGmgpGt9RprUcM+hDkWjkGk
         BZp0Ua2qjk73uXmlK2mCnGpLSDMVl/yInONXGY+0yhF+8lJWznk/8FEKIl2urMu+DYQb
         g+XBnICUS+5WHciXqQsxIgT745KDZKplttQKdLt7Kjw/IKmMwS/tndZGv1MfhjcEmD0w
         tuHOa//+fGCjltYWL45DB58oQwa3bb5tBLIpx93lewph5JiJm4/VSLAVxHXEwZZCDezq
         OKqg==
X-Forwarded-Encrypted: i=1; AJvYcCVRpLX0NxS4fbsuNS6XT2XV3J27IPgz8KBYj6Fb9rnaScQHNa4Otu6+mQTc6T2W6pa99zFKsk4Mt86nbgajpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpIjV1Qu2LpDdGXWVFTFHfqe5an2kHdN4JdRypOrWmWYYH6TGZ
	7BpAqlCRwMBQ/amffFEBLU/iCr77jNqfWISaqtktkTA/mCZpCi7bwpV8Jo9wFNAvJPLXDFKI72Z
	eTf1GBs/xiBdEwkzQ8Uue9ZMXm7ng/dO/FZ82NBwEkq6oV3djnLtu8NOXbG3yEU1bX/KR
X-Gm-Gg: ASbGncuX6l/0naFxlcRyST+/67ocyeykBthfk+f15m5rEuhJx7Vxikh1PN9ofDoBPV8
	hfBg03bSkGClfNFFM0DwMdqG0Fm6AKI01isYOtchg5eYd+yy2EOIPW0VlgqfEdjY7BDr+EuDpI1
	I4185bYH1VE2gxmAmyVk9lIlQXp/vvRKwxlHs9YHYoTONaCQLEVx0qh8h6dFqnh64tgCP+2J0Ig
	luPYHaPUaVdf5sPGKqDfWms7bq6JLuEWnDdq0DdKjopMq15lGFflFPh2YDvptthIJcb5gERYUuO
	MSrKArHh9pAk85pmbKXeP1DePPFee4xINdNW/mIXkWulTrj3Zgtx6Y439dE7rgBkoMdc0RamiwT
	EUlCpsBnH
X-Received: by 2002:a05:6214:3283:b0:87c:1fd9:da52 with SMTP id 6a1803df08f44-8847a3d973dmr11876d6.9.1763653774072;
        Thu, 20 Nov 2025 07:49:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZDZecDuAU2AHXM6Uqgl8MchJS3ZXsbLZQMQHbbLh7Q6dI9fcKtwuWdhAIK4pa19g+Q9VupA==
X-Received: by 2002:a05:6214:3283:b0:87c:1fd9:da52 with SMTP id 6a1803df08f44-8847a3d973dmr11206d6.9.1763653773470;
        Thu, 20 Nov 2025 07:49:33 -0800 (PST)
Received: from localhost ([2607:f2c0:b141:ac00:5cae:3da9:9913:ff7])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-8846e573909sm19710936d6.39.2025.11.20.07.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 07:49:33 -0800 (PST)
Date: Thu, 20 Nov 2025 10:49:32 -0500
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
Subject: Re: [PATCH 8/8] samples: rust: add SR-IOV driver sample
Message-ID: <aR84jHNj0rhNRbaK@earendel>
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
 <20251119-rust-pci-sriov-v1-8-883a94599a97@redhat.com>
 <20251120084132.40f72ba4.zhiw@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20251120084132.40f72ba4.zhiw@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -IKSBbITeo_B8e9KIscW_UroKXGTaVd9mYTsXW4UGV4_1763653774
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 20, 2025 at 08:41:32AM +0200, Zhi Wang wrote:
> On Wed, 19 Nov 2025 17:19:12 -0500
> Peter Colberg <pcolberg@redhat.com> wrote:
> 
> > Add a new SR-IOV driver sample that demonstrates how to enable and
> > disable the Single Root I/O Virtualization capability for a PCI
> > device.
> > 
> > The sample may be exercised using QEMU's 82576 (igb) emulation.
> > 
> 
> snip
> 
> > +
> > +    fn sriov_configure(pdev: &pci::Device<Core>, nr_virtfn: i32) ->
> > Result<i32> {
> > +        assert!(pdev.is_physfn());
> > +
> > +        if nr_virtfn == 0 {
> > +            dev_info!(
> > +                pdev.as_ref(),
> > +                "Disable SR-IOV (PCI ID: {}, 0x{:x}).\n",
> > +                pdev.vendor_id(),
> > +                pdev.device_id()
> > +            );
> > +            pdev.disable_sriov();
> > +        } else {
> > +            dev_info!(
> > +                pdev.as_ref(),
> > +                "Enable SR-IOV (PCI ID: {}, 0x{:x}).\n",
> > +                pdev.vendor_id(),
> > +                pdev.device_id()
> > +            );
> > +            pdev.enable_sriov(nr_virtfn)?;
> > +        }
> > +
> 
> IMO, it would be nice to simply demostrate how to reach the driver data
> structure (struct SampleDriver) and its members (I think accessing one
> dummy member in the SampleDriver is good enough, not something fancy),
> which I believe quite many of the drivers need to do so and they can
> take this as the kernel recommended approach instead of inventing
> something new differently. :)

Thanks for the suggestion. I added a `private` member to SampleDriver,
similar to the rust_driver_auxiliary sample, and extended the VF-only
path of probe() to demonstrate how to reach the driver data of the PF
device from a VF device.

Peter

> 
> Z.
> 
> > +        assert_eq!(pdev.num_vf(), nr_virtfn);
> > +        Ok(nr_virtfn)
> > +    }
> > +}
> > +
> > +#[pinned_drop]
> > +impl PinnedDrop for SampleDriver {
> > +    fn drop(self: Pin<&mut Self>) {
> > +        dev_info!(self.pdev.as_ref(), "Remove Rust SR-IOV driver
> > sample.\n");
> > +    }
> > +}
> > +
> > +kernel::module_pci_driver! {
> > +    type: SampleDriver,
> > +    name: "rust_driver_sriov",
> > +    authors: ["Peter Colberg"],
> > +    description: "Rust SR-IOV driver",
> > +    license: "GPL v2",
> > +}
> > 
> 

