Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100114;
	b=SOjAlX0Nfn8DbLsrFLJ/Iq/WgXSEbckCVndhwoowaHlxtUqOcQY0jGdyjBNaogtFtGcE
	 ldB3bIjmmuaefEq3+cpINHtWP/SLhD2pSWUnRDmbJuxny6CMeLDWf9DJJ3UIB4xwp6V+8
	 LEaoiuWVHgQ+mApOyQ0Tn3K3tkDUcZ4NCeWz0g1ni/HERBN+fc4WcJlZhCHbJBA4sQbFj
	 +eEh4cZ14N7UE3Wn4eForqp8j+3OjDuGKG3YkTjkzryzCYjyG4FemFQ23KF/+bVexy+Xu
	 uSxuHvBz5kZrFN1QIlbFgJHoEw/srKwGoaI82+3Ik7P5V2RZ4dyDPcSE1oO0E6ypT8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=G+3w7qcryJEhye/h2qafkqEU5e//COD+Oo6UYEV8BlY=;
	b=Sild9EFHJjKH3JVaSG4LJl6RwHLv4oNH9AIsMwnd/l0OdbKpY3HatyCu/zlyS6iI2/Kg
	 2iw60zsqO9hS5/p7IDpG/+l6KPvA1PIopObqvOBVw2mN1hxH0NWY0wOiTOp9fZ4TJR1ZY
	 L0z8p2GT+P1KgBdddSYMGBZ2/QPch5b+EdsH95V/VjJfKGLBUfZJhp1gl4YsZYQuTprxE
	 7fJt6FWAPwUSRS6iGnXgXUVP/RrAGufJmiJUbeDKVQka1fCv/2zFM78J889aDD4FkJbPr
	 fFyp5l4j6CzJEI1uMkZrBhHHA+e0Dy3gg3cdwXaH4e9URYbwtL+Tjd3v+P5exUp2dIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=U8SNLZUp;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D3C606A320
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 14:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D3C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=U8SNLZUp
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c445c95d553so331685666b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 06:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795100112; x=1795704912; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+3w7qcryJEhye/h2qafkqEU5e//COD+Oo6UYEV8BlY=;
        b=U8SNLZUpSmGooaNMNN6PYxECySXVz+MwMEK9xjhak0eCZ91ckA29HCyhgHzb10RV8b
         f4TvcU0VyWf709cOjM7r27zVdPNpfkwVfIkLyAi38VpTpqdIfp4gBtWA4C49tPHiLPFD
         OoyXlBOoXgVwGneT14LJARwicBIWqQn0lIlZE+0B9HXe/xQVKCDod0RtdHsCaPY4PHMg
         bq8zqi1IxyGwQjOpCfqTFiIONWpfPqlq09g16etOvi7LbT+DEEjCduYiA6YuAruU98a3
         d2Y10yr4F3Tyjsr79RmGaBD4MTJLGTniCwXuDfDMkrDyXboTIKZmfQJrNQxl5uocv5ke
         aOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100112; x=1795704912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+3w7qcryJEhye/h2qafkqEU5e//COD+Oo6UYEV8BlY=;
        b=PpNRUoUl4ASHVtZWbIM6aSNi76HyUFG2bnhT4ejDjyTLbxZukrWUs+QAo6XpZ23XB1
         WNgmNruV5KAh5g4gGU7/YtK23EbLrXDriyi2ePUqsKKtjc0l+C7qIMVhhrmmMatDvEF9
         ftPWkd2iCha0HPurWz1UY214MhvRD3bcliEP4AI5YPvkzp7Wsh7RtYAHeQMI0AXrtLTl
         rs6q6y6Qh+/JGzm0zAC7WAFoxpykNSO74Gh8uEpg73MRX6vQ018/ASlmqmoG/hGYwMDX
         9M9hhTJu+2uabt2U26uMssMhqPgQxkK2KydTb/iW2FZPtjygg8dhxHh8DiRoHLPzxcEt
         ZJLA==
X-Forwarded-Encrypted: i=1; AL+hErHy4F0FDgomH9KC58Oy7l6LzH1RmFNfRSpxBqQp/x8+JuNsggWqElbwdArpULFsJMpfc9FXsjuajkZSePX49w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wSjh4s6R14XOR5ZeWq92mf9Z+pwCQVPP7U6bz4SUBGWdLn+0U
	rS8CqyDgQPrnpY2sMsfBdLLVWlT5SAnpUqlizYn1xVe2IsqKRO8Xti3L3CtTC4d1j8Q=
X-Gm-Gg: AYBFou1uX9hxquwiaPE+fsdKTNzcPnZ+LgelRJ92Jm1BV6MjAp8gsczskPhiC2xS+2O
	53LSml9mueX/hg2phlYXm34pL5ELI68tVA4sv3BTdKs4n/MbbAZleuxXg7m8FNx+0p8zSM4a6U1
	RENYo/SMWkGRfv8b90OYC7pVSlxVSF6KEbHDSo+SPk0GhXhz7EBTYbEy3qk4or4jii4YkVnJt8l
	k+r76XPRYI70bVX9ra+RT1lAhhFmJ5AHq6R+6qzWNRi/ofpo0+l2dQsdDmtmyd1JA5GkF8jmwVa
	JSml/oSG0yI/g585n3632snjTDWDs4y5L06rWi06xrHX9eBn4sUtVJwn1DU6erPca7JGU9COOs0
	4di1GyE9me4CHKwOUnOyQNMmI3bLr/oELEr/tBSvv26mRRwZzJJPuKisCq2e/ZiJew+gbDtnYQz
	cmVTXW9ZKTQIs0vJ0leTU1Dp473w8RE1tDVpkrOtUGyFkHDoY3oxe2/ta2ibdDFsEx2Az5AB2JH
	jUUN1tPmT0gTMo73B5rUT25jT/7+ZYcP3iHsI0ZYYhcXOKjWp9b3j163u505vHIohGTDr3cAHwL
	+q+bFg==
X-Received: by 2002:a17:907:ea94:b0:c50:aa10:d888 with SMTP id a640c23a62f3a-c513acab9d6mr6638766b.40.1795100111790;
        Thu, 19 Nov 2026 06:55:11 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm2503566b.40.2026.11.19.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:55:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3XZ-00000000vhT-1zwc;
	Thu, 19 Nov 2026 10:55:09 -0400
Date: Thu, 19 Nov 2026 10:55:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261119145509.GJ3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>
 <20261118193521.GD3115493@ziepe.ca>
 <457fe01cc1fbc5b6e2d7b5c9c167012b56fe86b2.camel@collabora.com>
 <20261118210626.GF3115493@ziepe.ca>
 <06d4eead-b765-44b9-94a8-6ec2d71d172a@arm.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06d4eead-b765-44b9-94a8-6ec2d71d172a@arm.com>

On Thu, Nov 19, 2026 at 01:03:52PM +0000, Robin Murphy wrote:
> On 18/11/2026 9:06 pm, Jason Gunthorpe wrote:
> > On Wed, Nov 18, 2026 at 02:41:32PM -0500, Nicolas Dufresne wrote:
> > > Jason,
> > > 
> > > Le mercredi 18 novembre 2026 à 15:35 -0400, Jason Gunthorpe a écrit :
> > > > > No, not OK :/ We want to use GEM shmem, which calls into the DMA API internally
> > > > > through drm_gem_shmem_get_pages_sgt() -> dma_map_sgtable().
> > > > 
> > > > You cannot continue to use DMA API once you start touching a paging
> > > > domain directly. It is why driver_managed exist.
> > > 
> > > You are building a strong argument around something that is not what we intent
> > > this binding to be used for. If you had cared about the context you'd know we
> > > don't want to touch paging from userspace in this type of drivers.
> > 
> > Go re-read Daniel's answer and perhaps you can understand my confusion:
> > 
> > https://lore.kernel.org/all/3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com/
> > 
> > If you want to
> > 
> >     "We plan to alloc a paging domain when a video encoder session is created. Then
> >      we call iommu_attach_device() before a job runs"
> > You cannot use the DMA API.
> > 
> > You absolutely CANNOT attach a brand new driver controlled domain, use
> > the DMA API to populate it, and then detach it.
> > 
> > Then we have the issue that the rust bindings expose iommu_map, which
> > cannot even be used on any non-coherent arch due to lack of cache
> > flushing.
> > 
> > Further, from a Rust binding perspective all these unsafe things I
> > talked about have to be blocked by the Rust compiler:
> >   1) You cannot attach a domain to a driver_managed_dma=false device
> >   2) You cannot call DMA API functions on a driver_managed_dma=true device
> >   3) I object to exposing iommu_get_domain_for_dev()/etc to Rust
> >      due to how unsafe it is, but if you were to do it then the
> >      returned pointer must never be used with attach or iommu_map/unmap
> >      functions.
> >   4) Since there is no cache flushing a non-coherent arch must never be
> >      allowed to call iommu_map(), since it is unsafe to create memory
> >      incoherence.
> > 
> > Thus, what exactly is the plan here? Do you see my concern?
> 
> Yes, your concern is a restriction that you largely made up :)
> 
> This is very much *not* driver_managed_dma, which TBH is poorly named since
> it really means either "no DMA at all and thus fine to nominally hotplug
> into live domains" or "userspace-managed DMA with no chance of ever
> inserting DMA API calls at the right points".

Now you are making things up :) When we invented driver_managed_dma it
was explicitly for the driver to take control of the domain attachment
away from the DMA API. For whatever reason the driver might have to do
that.

I wanted to convert all the places calling attach to this model but it
was too difficult with no way to test on all the embedded hardware,
but I still think that is the right thing to do.

Jason
