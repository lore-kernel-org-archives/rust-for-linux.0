Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098715;
	b=sl7ZlZ6wQXXR5KUWpBPzk9E3ZHXfZjbFjqtJJjRPnMtCsBO0/6K3EU7tnHybIcXubpYH
	 Og5bybJ/nUgareczX6iQcaV4sZ7B6kh+zl/G4KLHXD7qdwdBZWk7pFdG51Eq+hN3etVwC
	 MWRJxx292IjOKkSxWNTNwEuh1mwRjyyq7pGSO7NEu4il68+D4h3kIe9Uw5xDlfT2koEFa
	 9dpfo7LeGT2NmD9e8ejytIfNe/vmJVPL3HWt0SUrnsYVTRC81taj0XsDDkhwrp3v7pAEj
	 lOS/xgeIoSovXPew7q2lS95Nf+XFvEeuDsSJntVSxsH8gWKNQjgZqyRquono2kON/mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hL7cJlK2xvTgQa7LLQ9HzeCYEg5UwEM/V8Y7DTV8aIk=;
	b=5luaqzm9P9Kl+cp/cIz8osIyuUYGjJ0sxVs1uE4lky5q0eOa9AiQW+Vr/O9NPHa6pOcU
	 8lPFdEQBhG6yDfI3+9ETQ6stvPAnuvpbNm2iuSrgdUR6POjWNmMowZL8PF1wR/QhJvSw2
	 YzjNv7QwxR9NKlPcsihL4R7jyl8zMb4LISfaTiUHEM99TjeGUro8moxX+7qhVjH2JksNA
	 KhzC4vBoePHGUmu/Y3rnWyMety5vBsdc6BjOUXvlVX3XyTZrylwBzq69JDuU16sCFfbyb
	 X+R+YZUmHyjj8s9DYaCbRj8U0MQExNgHgq65wxffOU7GjAbLDo6QDnuPxyS1wUqOvuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nc3zegcp;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3BA606A32A
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 14:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3BA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nc3zegcp
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91e8938fd01so21346946d6.3
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 06:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795098713; x=1795703513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hL7cJlK2xvTgQa7LLQ9HzeCYEg5UwEM/V8Y7DTV8aIk=;
        b=nc3zegcpdDuJOHBk9ZcUtuhB6YmaHPoNp1hSAk3wpKKveFlc5sDOso+cviKfEFelGM
         pV375ZXtz6O3Q2NtdVRYNdjmJmBuetfA6eLQJihsorBv+nWhd8AgT6xf1yJByF6wykYB
         mRJWU5ejUgQBXmn1abv8BeztiYm/WJ7R3Gr3BGtApfk+NFMy2R5xXgSzQTIKvi8N5EDI
         14AbKUFXl2d+KPtdaN0xj7Vu2/KbBbi4yLQ/7s3Gw4rLYSA+1m26Rtoq8YmhS0Zubex9
         wcGqu4ZY3UyjUakKJ0LKBnxE06dGBWOuBMUUIMdVOyv+qSU9X6vnivLBPA/9k+XjMKZY
         kNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098713; x=1795703513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL7cJlK2xvTgQa7LLQ9HzeCYEg5UwEM/V8Y7DTV8aIk=;
        b=NRphez+cYKXrIiHxsmQ40BDVOCYT28n/80I+RqOU7o2dG1fLHaScXTqeFlCTN0/Nqx
         bZ7x8mqVx/niKC9XOp5Zpe4cK6Cw3V8GPsYb2fMgCwyTVhb6+IK58AoVWKi71M8QDait
         dFwB7XX5cC+cDvBxHKXkvmX829hYrSv0nEUObXN8PsNAF6rErfhRxcMmeDzQxMBomeju
         +7qXPCY1FspSn07k7LoSNOGB1GELcQEyX41MjSlClvjWecxgHHBM2Px40viFKnaEhUs9
         zb0U1JGpKA93GZrKX+5xJ6CLt3YAHfGdxDmz4ejRj/FOGf3XyUccIwNoBKeyyN38ulVf
         QpPw==
X-Forwarded-Encrypted: i=1; AL+hErH0dORR57X67560P6WgRhZAt1CcQC8XouLAIlmUopf2kZcJBDlo1GW6qAfM/Ocg7CipiCMl0NXlf45AEHlVYA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9Yey2UpZAqPCgDA2V5/YhWgok5dc8lXEKhixcEOZnA8ejHW6++
	cIjzUn3j5AOOdFcQO++4EWs1b4JJjWpVPpbO4X8D7Qn5OZF6SbUSIsqitxvDYd+1ZFw=
X-Gm-Gg: AZFdTZdhiBnCUJNHRilFgMnFvnzF2BMMqi5FqLQAyJvWk40NvfB5gLPuziLDad9By3a
	+axp90ucWaNKSfCUbmZpy14JsZ0IVIrgociD8RssIkF+UPJgGgI3ka5dcIRUr877bVlkNQ79HE0
	b/8KVpWXfgC8YBbn/nTbxvXh+xud1rO/h7tyauLNhQEV/xKNP0lJXx3TNsy6C4ukgGoby25LFuV
	8dAOK8jmvJH6d0r/N8+TvxqIoOT9dh6mqeuGxfHgVOt6o2z+sDbkObLf933PkTZbd0Dtl9vuT10
	dDD1BNEN6hTqaoQRYXsS8vgxfYMKKzUT9kTOWB+8++pPsLWPjDH5e/Q0O+KcX2h1lnP81PVHIQQ
	DpJ984IPevoEeRqtrHIwFwHMhTtqglVCTzFVYJSaRTegGu8vwl/ZQlJM2fLm+Kt30hlqczUFIpa
	AV8GL78tspW3AVD0bk6lLEcMHQF9aFajRUF9EQTm9q4O58uPQWzkC6JYHly7mY03iqDW3yAQOQ8
	w2i25GAo9yo9Bfinq7b6NfTwwoV74pNsZmyzuRB8TN9eChCQIwROn7BRWr0vgwrM2T8CNuWdRXb
	R9Xkeg==
X-Received: by 2002:a05:6214:2482:b0:921:2e91:eb51 with SMTP id 6a1803df08f44-9212e91ebc4mr18407586d6.57.1795098713268;
        Thu, 19 Nov 2026 06:31:53 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134042c21sm194846d6.35.2026.11.19.06.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:31:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3B1-00000000ssw-0FAP;
	Thu, 19 Nov 2026 10:31:51 -0400
Date: Thu, 19 Nov 2026 10:31:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
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
Message-ID: <20261119143151.GH3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
 <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>
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
In-Reply-To: <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>

On Thu, Nov 19, 2026 at 10:25:24AM -0300, Daniel Almeida wrote:
> > 
> > I can't speak for the actual intent of the Rust drivers, but
> > giving them the benefit of the doubt, none of that fearmongering
> > should apply: the valid use-case is just simple time-division
> > multiplexing.

To be clear, I think the use case is a reasonable thing to ask for,
but since when is this flow valid? Does something already do this???

And why didn't you disclose this immediately after my first question
"how do you intend to use this"? It would have saved alot of time.

Below is exactly something I think drivers should not be doing:
 
> > A = iommu_paging_domain_alloc(dev);
> > B = iommu_paging_domain_alloc(dev);
> > iommu_attach(dev, A);
> > iommu_map(A, iova_x, virt_to_phys(X));
> > dma_map(dev, X) //still needed for the underlying memory
> > ... //tell dev to do the work for context A using iova_x
> > dma_unmap(dev, X);
> > dma_map(dev, Y);
> > iommu_map(B, iova_y, virt_to_phys(Y));
> > iommu_detach(dev, A);
> > iommu_attach(dev, B);
> > ... //do some work in context B
> 
> Yeah, this is basically exactly what we want to do..yet Jason has been
> repeateadly saying you cannot call the dma api at all once you allocate paging
> domains. So now, I am confused.

Especially from Rust where we are supposed to be enforcing strong
safety invariants. This is not safe, and it is not following the
meaning of driver_managed_dma, it is not good if there are multi
device groups, cannot work DMABUF, and is exactly the sort of weird
stuff we keep breaking down the road :\

Sure with a lot of care this doesn't immediately explode today, but I
don't think we should be setting this as an API direction, especially
for safe rust.

All of this is very related to the PASID discussions from a while
back. The goal there was to allow the kernel to DMA map to a PASID
paging domain. IIRC the direction was to wrap the PASID in a struct
device, maybe a "fake/limited" struct device, so that the DMA API can
be used, dma-iommu.c manages the paging domain directly, and things
have a sensible driver API.

More like this:

 dma_dev = iommu_alloc_paging_dma_dev(dev)
 iommu_attach_pasid_paging_dma_dev(dev, dma_dev, pasid);
 dma_map(dma_dev, X)
 dma_umap(dma_dev)

With the additional twist that alot of embedded HW has apparently
choosen to not implement SSID but instead has a pool of SIDs that one
device can use, functionally similar to SSID.

We'd need also API support for unbundling the DT iommus=[] SID list
into something that the SIDs can be attached more like a PASID.  That
need, I think, has become clear with all the DT tricks and fake busses
to try to work around this issue. :|

Jason
