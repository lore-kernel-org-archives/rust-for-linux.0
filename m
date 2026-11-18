Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035989;
	b=LsK2TMfxU3Cy7EK+QCVbXjtscqv2zWV1AoYKP0NgHb1U08Y61dssaUtLRkDU6mtfZClb
	 +KIPjn6ScBrC9Vcje3NR8LDadu45RuCtICku2h0uuMZxLQTbwUvBT5XIkoY6kk8C6QJU1
	 swIe1bQoRH20Q2tQX5ZOUnU0yrBeNobu8Mx9JEPXM4dHBdMK9vsKQvvaJ+OCggibv7qxz
	 igzMalIM2Sxe026AJn+9euLmr0SATxmg/OwZv6+J8M2BOVySmLQUbfE96AXY8jxnKFk+q
	 OkUwowmYYoKpb7vh3ncY87uNPigKaD8duD417Z+S42ybQtMfZChevP08CKBLDx9tIbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=pZ3JtacZcjsrcECbYipQCJ4gvP+CBNK95VHZ3UWM6ww=;
	b=0ZDH3r87QSg5DeRLlcx3tSqXt13aszByuCMQbZLP7VRP4WYQ3W1ZTZA7bBI9Ip9XpCsc
	 0ti7L1hFJ6TPAsM/RhsD2YjAfLFjGpJBe6pX/+zetJafYQGX/869abe7Ac4rPp4qkJB7g
	 YljivAmXrQlbd1yv5EijPOum5sp6qlQ427mUqjSyrJkWLPMfCB9YCWjIM/bKXHeNkFsL+
	 w9HPRnKPXxAjLhnBS+NmUfSDJiEKHEmtF6xsNtwNPCSdRl1UVKEl4qY9VuwplZH8XQnDg
	 O7oPjpGei1kCn4s/ws+U1brduA/Qv1hhWC/4Hmzz6uZXHbIubC8VZMkJ0NKMcFW5fWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KaGPGf7q;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B21D606A325
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 21:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B21D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=KaGPGf7q
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-949680e6d83so151719685a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 13:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795035988; x=1795640788; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZ3JtacZcjsrcECbYipQCJ4gvP+CBNK95VHZ3UWM6ww=;
        b=KaGPGf7qgbbucEYYgFiUG5ZMe+M+gxnIXYiye9EMd1ek0LBcp2J66fBc1Xzcclgaba
         zhk0t//rnYpdXx8D/U3P7c04aRbXHsc9p3gEu88aSdAFhG4CEesns7D25iI4aQ16pZtt
         S8snp761ySTocbmda8A/bjeZUWhM4lmsYOdbHlMPMAFDbpHtvMrvkrDKiVxOVAZRUsvN
         Ck6cFrhc+RDzjS8Tnw61iA+u2C76JaHcGvQbNPUjKr+2NIe0xkAh5MJ1LaNq/A37hCrg
         KhR0K+8sfg5nW4TVrjBBI8NXO19e4+0rDt0MXr8pnneeprrVvtUm9UOtPBm4K7/59349
         yQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035988; x=1795640788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pZ3JtacZcjsrcECbYipQCJ4gvP+CBNK95VHZ3UWM6ww=;
        b=HAJ2Xtb6W97fmLCBCJqT0VRQq+3HnBUpNkCgi/u5cY4MjkiFTjXru88IGatvh/usuZ
         74iyvOcT/FNSZbd17UAMN/+ow70pCzAwwP7FG6W2CEQLipoW1iMnXC/yabt5n+lCQYTg
         E1lOodbxWnFE9/0/24Rh/xFJRQQfTOldqXAYrnndWbc39KzXFOMsE0JCG6Rt6fgiyqOn
         fwHmxfu/+Z0hF57YLlqlrGW4BKHWKiMswMSFH7QX0rwSPqbZunz4O+UmvyLz7JTc81Wy
         6i+YWk3A2Khn5Dp4eHBMA0+WGTqSxfTW+Sn4kO+7BNbe6RnRriFV2lfNF3oHczgguvSE
         8Ubw==
X-Forwarded-Encrypted: i=1; AL+hErEwX4PFwSfEc7+hBFpQDayDlA7lkMcu7dkDYbhDEg6PquCsBTQoPJ3KUaLFqxV4O86lwYGTfFnywjQrkTkVbw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9TMaiMVcmafUMzAVAAiGVwOPrv3ENk0+KV+n40UrpuUIRvaCJF
	SsQ0FP7vdMN/QcQPBeMK6ue/oT2JYx2dxiix7RAGqVMraTENsPW9XbHTHUiogp875Ek=
X-Gm-Gg: AYBFou37BwYilLpaDOWX5CY0347HW+6z9H3aK2kJCYOT+zLsClFGuBUjrRf2n5fEFdl
	Ybb5RS4blgzp1oIxBmJWnwv2aupI/je49wznpIQzAZXjT+CQYeK6gYUe4EPPk6b9IMYbaozdvNi
	LwMF5s+9fwhZwORXEg7hU+HgHxgnDqXUn/g6QxqXXCbAykFJ6y8ENnGXlpiGiaroeJ0oWt7s+Xo
	8Hd0gjq+siAUDi7ue4PEwNeBXJDxjYJBH2Dm5r63sbW0GD9ZctgHWIWbKIhETcsIh9zH7rcDrrU
	RXI5X9BMYn0wv+qqqhgb/uDZhmGE3dU412952to9N8dF/9OouYyfhUFFKSPyH2Vqu2kSkwrgJol
	Cq5GDlOpIyb05rJYTk3YKTH/C3txSQ2T1Mh+AglmK2d40yYMlfaey2OUKOwvCkCDsbHxZoAJ9qZ
	5Thih2n2J/F9EItKaMQoFvL5ANBbxkj//EjVhnFlggjCRQh9GH/s/ad+dNGwCjeoociJbza054d
	5wQlCH9MIQGueOpRW1OUpJeEq1p9hN4UhmS4wDRstbfivGo5dN3yEKXAYcU8A7mZEPvbmlUvboo
	2/LD5r+oQpB40mCZlc4l4+byaXQ=
X-Received: by 2002:a05:620a:4556:b0:93e:c12c:f121 with SMTP id af79cd13be357-9499964526bmr691694185a.77.1795035988208;
        Wed, 18 Nov 2026 13:06:28 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b8182dbsm271138185a.41.2026.11.18.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:06:27 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTmrK-0000000GRJU-0IJL;
	Wed, 18 Nov 2026 17:06:26 -0400
Date: Wed, 18 Nov 2026 17:06:26 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261118210626.GF3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>
 <20261118193521.GD3115493@ziepe.ca>
 <457fe01cc1fbc5b6e2d7b5c9c167012b56fe86b2.camel@collabora.com>
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
In-Reply-To: <457fe01cc1fbc5b6e2d7b5c9c167012b56fe86b2.camel@collabora.com>

On Wed, Nov 18, 2026 at 02:41:32PM -0500, Nicolas Dufresne wrote:
> Jason,
> 
> Le mercredi 18 novembre 2026 à 15:35 -0400, Jason Gunthorpe a écrit :
> > > No, not OK :/ We want to use GEM shmem, which calls into the DMA API internally
> > > through drm_gem_shmem_get_pages_sgt() -> dma_map_sgtable().
> > 
> > You cannot continue to use DMA API once you start touching a paging
> > domain directly. It is why driver_managed exist.
> 
> You are building a strong argument around something that is not what we intent
> this binding to be used for. If you had cared about the context you'd know we
> don't want to touch paging from userspace in this type of drivers. 

Go re-read Daniel's answer and perhaps you can understand my confusion:

https://lore.kernel.org/all/3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com/

If you want to

   "We plan to alloc a paging domain when a video encoder session is created. Then
    we call iommu_attach_device() before a job runs"
 
You cannot use the DMA API.

You absolutely CANNOT attach a brand new driver controlled domain, use
the DMA API to populate it, and then detach it.

Then we have the issue that the rust bindings expose iommu_map, which
cannot even be used on any non-coherent arch due to lack of cache
flushing.

Further, from a Rust binding perspective all these unsafe things I
talked about have to be blocked by the Rust compiler:
 1) You cannot attach a domain to a driver_managed_dma=false device
 2) You cannot call DMA API functions on a driver_managed_dma=true device
 3) I object to exposing iommu_get_domain_for_dev()/etc to Rust
    due to how unsafe it is, but if you were to do it then the
    returned pointer must never be used with attach or iommu_map/unmap
    functions.
 4) Since there is no cache flushing a non-coherent arch must never be
    allowed to call iommu_map(), since it is unsafe to create memory
    incoherence.

Thus, what exactly is the plan here? Do you see my concern?

Jason
