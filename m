Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794946859;
	b=BMyAuG1PVMYj/lEBunYLT+e+HdAzVYjLhsqWxMBqySQSegUoz7c1BiyAF0C8ogbvSuJD
	 JrrJHuhBpZrxAIPK27QO5euEFsD4q20VhNUurEIaQZV73p8355QO7i1HCnWTU/8tdy/Lg
	 Zo0OQfhnkAHLPPYuqlLGgjeiKfnhcl/IkO/1Nh9+eenhSsq8tGqqaRrQOBMkbmXXk5IZk
	 EUF4mOyGn2af6dTncX8l1MMp/WQCNeL+b3leSNlO19+HLZP3vSeEgdDy9+Nc5m9d+grfu
	 5q7uqZyLqBp1U8UiglMMLoEnDLTXGSPmUDo8F22gp4Z+ax60in5DjgkCOY6Y7rEomAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wJnPRAtsIC+/lFKvaSJITyDCcMmwBTIjrSEQdzWYjus=;
	b=fFmJORoVg+VkIRGBGaSxDbdXFn4qbzetX5U4a+8SxsizdLH43Os6UF0urGrOIO9fN1bd
	 NljIuEpS5ywrKRMzAYF5s4EhB2ecxioQ0DC6b4D8kcEQzohCCs4e2jNqxhney3JDnrPZF
	 Han/bq8GGLJp/qmuzefLCvvG3aEkaFMmCqBQTyqNs875jXxw/bGs86hv1zjq/ybQgV0GR
	 6xpHNZ2d9SmpbelGnAMuCGxgNMvpQNHsw62TxvN+Q5OeLzF2xHz9uKPd4JCMG95s6LBSK
	 39K2AIYqsC+v8ej4W6ut0XlHCms6fBIWkqJfZB3aMXc9otmE53XQiDMRflLbQW4VEzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=S88o5Kgo;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2130606A32F
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 20:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2130606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=S88o5Kgo
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91eb449364cso1009126d6.2
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 12:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794946858; x=1795551658; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJnPRAtsIC+/lFKvaSJITyDCcMmwBTIjrSEQdzWYjus=;
        b=S88o5KgoxbrveL37wGuRzrzYcnhkBMWsA8x73ywQQE9fX1XVCCpsSwQNzTsH0IdaEc
         uIk3zsaUJJpzsXOe1LRLvGdCokJogPJQyoqnkZ3BufWjQV7YTF2W41whIAEyyV8PS1h3
         b0DAhTvlZiqWDzodzF3E0ioWMOtYgHO5jBkQ/ZXwYOkkb3YrrddxdTIpQgvkRjytAKCQ
         kzR+3nkUZ6SxdTxxbbTfXwtVVs2X34N1uwl0U4IWg2o21sqSKDGKoysZybPATkGX9Cve
         MuqcwLQU+6CPE5Wtbu6DL1GmbOZ0IefvkN29zB0i9Gao81jKYou6GxJEmH3quMDIGtu+
         J00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946858; x=1795551658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJnPRAtsIC+/lFKvaSJITyDCcMmwBTIjrSEQdzWYjus=;
        b=0Z0f9jAKOM8N3SusD4Rw8uk2FvW0/CVQErpPpP7TxvQOPH+arljlt+4WgDJL8v/hyI
         qWz6GIGiY2vZHvODG+QtYqMGcgJAmajhwRSJUownyR4QxNA5B2dgYsmBYywopPGe7tZS
         pRH2wBY9DElPBLGGILRTAkJ21H9TLeuYTBZNOvEYpqQuAyaK3fvsdDmLlt7u2lfjM257
         ojlteacoCDF8r2+nq5fbpVRyKnDmloKPeIlyKr1BJF6ipPnazgiMBOJN4I39dfPDgVoZ
         B+UtNNx9uO3iLqpnglYeGf1HN4dUhptrIYt3l3ktOq8W6Krd/UGa1Wx1VyQU0GWrdB7M
         Zo1g==
X-Forwarded-Encrypted: i=1; AL+hErFTDPdE5x9vX1AIgG63gZAN+m+q0UKOL1U9s41ARZ/WyF/KxdZJA2EzrvnV1KJflanhalf554w9+JZxL29wlg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9YCp+JWyzLDvzWY0HAe1zUcBr/DO54l7R53fd/dJfaqLoKs/J8
	eLdSGRKe34u+K80OdknYgMV1JUeeivdj4z97oy9riTcubgTykiBYD+xp1FajQPXdw9Q=
X-Gm-Gg: AZFdTZdj7YJed8KGJh/eBM4LF6Y0RmEJTUL1/N5Qo7DMtH01DjHZkoTgdEwQNShgSjj
	gT90ebTydpWp26wy+6cgDYZ8cM8jwq6XiMuA0GDqvcOORPRyy9ciJk91dzVif3PY4h73zXNaQnK
	xPRDn/UTpciF1/6uBn8AckWYWwSoHaq54s/uK8yHcDimK3gq6v+p+uRbYSFHyR6AlwGPxXUO9ok
	CbkwI4ZhUuB4MlOnmabZL7ecphMbYcdAdfwIp+k9jI1OTWZBKtG5uy4pYNgCg7xen1bt2IHt1WS
	cACMVAjvBXEYIvjwQ0+Gd4xo2PONeEj66vpwn816eINsla0rRF1nxMLawhJ5ZnZTrXXHxaqN1mM
	4bIoSPR10cRIGcX3C7FBkHFBfJv67VmjCw9ptZW2ehO6uTn+kJVStuzwXXcLQpPUDAD1W/Lye3f
	rLIGB1BYPoIo+N6Syr7IbNGsgEO2RsTGFek4fRvonix+vqXqXK9MAnRKZZjYoq8Ej4CiOMXkN7i
	BV1lWhN35u3JWTKRvqF3ytlcBmAXoijpGAv0jkOqf7weWg4My70nz83hX6//ABDxtpqgiT8vjpK
	QWlusQ==
X-Received: by 2002:a05:6214:3018:b0:91e:97a9:cf02 with SMTP id 6a1803df08f44-92114d84a69mr5475416d6.11.1794946857364;
        Tue, 17 Nov 2026 12:20:57 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70c72sm2569566d6.33.2026.11.17.12.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:20:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTPfj-0000000DL2h-3OIS;
	Tue, 17 Nov 2026 16:20:55 -0400
Date: Tue, 17 Nov 2026 16:20:55 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
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
	Detlev Casanova <detlev.casanova@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261117202055.GA3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>

On Tue, Nov 17, 2026 at 05:09:11PM -0300, Daniel Almeida wrote:
> Hi Jason,
> 
> > On 16 Nov 2026, at 16:38, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > 
> > On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> >> This series adds a Rust abstraction for IOMMU paging domains. A driver
> >> can allocate a domain, attach it to its device, map pages into it, and
> >> install a handler for its faults.
> >> 
> >> This will be used by the upcoming rkvenc driver that my colleagues
> >> Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> >> this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> >> [0].
> >> 
> >> As part of the security model, each client will have its own IOMMU
> >> domain. This is needed as the submission model will let userspace set
> >> most of the encoder's registers directly, so the kernel cannot check
> >> every memory access that a job makes the encoder do. With a single
> >> domain, one client could make the encoder read or write the memory of
> >> another client.
> > 
> > How do you plan to get the paging domain in the first place?
> 
> We plan to alloc a paging domain when a video encoder session is created. Then
> we call iommu_attach_device() before a job runs, and detach back to the default
> domain after it finishes so the next job can attach its own session's domain.
> This is so each session is isolated from each other.

If you do that you can't use the DMA API at all in your driver as you
have to set 'driver_managed = true'. Is it OK? If it is why not just
use VFIO?

Or are you planning DT horrors to get yourself a DT created "DMA
struct" ?

> > Using paging domains directly is very complicated, I'm not excite d to
> > see DRM trying to do this at all. IMHO there are many unanswered
> > questions how it could even do this safely.
> 
> In a very simplified way, this is not unlike how GPU drivers currently work. In
> fact, from a cursory look, this seems to be how rocket (the NPU driver) works
> too. Since we are merely porting the same ideas to video codec hardware, I am a bit
> surprised by your discontentment.

In my experiance any place I see DRM touching the iommu it is
immediately suspect. We keep uncovering horrors that people buried in
there. Yes, you can point to some DRM places doing something like
this, with a convoluted struct device scheme and DT hacks to make it
functional, no you should not copy it and certainly not entomb it in
rust. :(

> In any case, we need this isolation due to the submission model used.
> Most Vulkan drivers know their hardware pretty well, so a level of abstraction
> on top of it like V4L2 is unnecessary. Therefore, in order to achieve a leaner
> kernel driver, userspace programs most of the encoder's registers directly, so
> the kernel cannot validate every address a job makes the encoder access.

Sure, but you haven't explained what the iommu gets attached to (ie
where does the SID come from), how cache flushing works, who programs
the mappings, who is managing page pinning, etc.

Are you sure you shouldn't be using iommufd for this, tied into your
driver? It was intended for exactly this use case, to allow drivers to
delegate their translation to userspace. Though that doesn't relly
solve the questions about what it is even being attached to..

> The fault handler is used in the same way it is used in GPU drivers: to kill
> sessions if they fault. This way the driver can simply refuse further work from
> a misbehaving client, for example. It is also the natural place to enqueue a
> reset if the codec hardware is frozen as a result of the fault.

IIRC no GPU driver does that, they hook the obsolete fault handler not
supported in new iommu drivers not the new PRI based one... IDK we
have even wired this up to work this way.

It is nicer if the HW can tell you it faulted rather than expect the
iommu to do it.

Jason
