Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030524;
	b=E3YjpbnsZMkMulKyHZA26LrByUctZ3Sb2ASlDsSN5HnWf52NXsGz8jC8HzeNKfcS7ZKP
	 K8BhscoKF7WRk12q2uGTv3LkP+NcLar4eliaG+H2K/Xr82kbxbtDvoCIr91Zc6vM2DYRY
	 5ZjSdvRjb6wjpx+vUiMJ0rzlIgDvKkSZyBEUt1VIbYRuAdc90UNAOO01r22NzmFaf0Oei
	 Wgopw9dShyZnZI0BKVN9oD/opQ3I/ZaZonTT8prgPv04jY5JXXUvVpoU5QuCVLvbkRE8O
	 +ddtdX3bQbNV67C5iATAWZlHgtFcwIRdoC3H6iodDaVsyIs+H3/ijEMjsTJ6nZQZT5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=svDhZvS2nvuMtlSX/aJAYIzvYs1mM+RCPAdRdKGv9lw=;
	b=xH5jb4HNsCPe/Jb3L7ypJmk3BglvsJu9ZBiBk8iriL4EuinleQrfCUrdqFZbDt2QfPj1
	 4eli5vC0+OHOW1/1eYpZ5wy8Tku5wJtvbFV9QmUoI8CEVIIYAntZpBmlzaWIZgCEt/Feq
	 4rC7RJ9+NYdyjZRA8iONKPSo2kIX1KgrR4bS09t8V/bWcIvlUuZKR9Ltz77z/D0+266vl
	 V4DmUEIkMHXtq1XtaDnCxjA/MSfoS6FECBtzxFgnnGCjIZ2Q2Wfuw0zFiDbcKQ4VQdzHC
	 SBr6985uyB6jyLK2ropjEkh/wbGP10ycI7vw8GWXIV29xhzXAjdXtcYkyCHB1j4AXeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nYrfU8ls;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE93606C418
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 19:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE93606C418
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nYrfU8ls
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53664b4860bso14108111cf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 11:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795030523; x=1795635323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=svDhZvS2nvuMtlSX/aJAYIzvYs1mM+RCPAdRdKGv9lw=;
        b=nYrfU8lscKvsCv08FhVyznw1+/ixOPZ5ujpSMFdgTglW28ZRDyvsT3l5OCv1zPVx5z
         p4Bbyu+r1usWuZLpn2zdQt/tLjNOqC4Y6zda09XyAuzgsfWEuL25PHehtYAAJ1L3VYoU
         9soQcIMgLcZ0a14wdZ3uW2xGHG1Lm+GgdcVdQBlv6Se15wewe1zioxmPGH+2IP+agESf
         zvQTTrIs/JtT2lpwYVT3J18WLDFvp+SsvLrIucO15OemadjveZK+DGPJzXtDkOYtRB+d
         18KjvIE/D9SHH5jU+SMqOdyb24y5LDFYdq/zXgZKk6MHIDMPvufWJoyqqMJ4REj1YSp9
         ZMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030523; x=1795635323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svDhZvS2nvuMtlSX/aJAYIzvYs1mM+RCPAdRdKGv9lw=;
        b=C5/AeJKSg+C0hnuYw6rd5lLV/KxH9DkOUIEA4teYTgoydpaKKV9H8pjPsWesfoJicP
         Aa5j8m38TbypPS0d53o/YwwbwYF26qKjdq5TlfOjZ5tYlBC4oPitf4IAccM6WPTJHgeh
         wshRCg78IwzuDbChVHlOJImHr17VALlgyBu/Z30OgtY512kv/FHB/ohUCbq54Ck0de+a
         ZLIJq0nzsV866IjCKOvWqM3+q4gk8s2W/kzkCw6zjqDIRo629rdq02G+RNdQUSZYa83Y
         WpVTjRQ1CoKIXL+WmIJSVh49yycIJQmg4+WstseIrBhCS8C7CeEiqdaVeIWr1Ay8Taws
         aGBg==
X-Forwarded-Encrypted: i=1; AL+hErHYMEqKxckVgWbL9nGejT5lkPLYi1A0rNy0JFakIrYSr/Q+zqAgIzVI6vxp4qjJLq42PTlKSE42yM/J+yeG2g==@vger.kernel.org
X-Gm-Message-State: APuU4Z9o6VoQblGFLubXB4kS9gHa7z7LpeHaGq8W3eYJCMvpCJgmajIb
	dccy8Kr/UZvHfhllZqMPS6MeAXon38T2GqdZmW5yJTVR8Yx1Fob3rfnsVXB9JUG3KX0=
X-Gm-Gg: AYBFou1xW8YEgB6XIqtvAsMRFNoeKREfew16uDR5G03+XJshXErJtvmoUmAhnX67UHc
	m6ecpe3o4FPJfS5Kcj7uM44R0+nwZ76rpWsvApxJucMvM4Qcu39XIDQsnQG2ExRH0BROWVmT2Lg
	bVsrK8sHGauScrX3RLafOzBfHNlwvActXcifCiunUDlhDnllQTrMaVNegwIrM4oarU8aRwB5WLm
	Mil/PjynVVUwmTRXhZQpZSvxMxwl1RidKU84SySY+/IZz2Ge8N0U2ylPfFd/Jmw7V6ocA9OtaUz
	nFOCQa/rdb+LeOOgmX25rQy2X8WN8JfKCME4IYvJMBb95lJFVuhbbkW0hq2l9BXzELJK+/u34Pv
	hKXFS6y8sSPaK9ifukIcsmFZPrMN9J8GoEP3eRMfPEbgKFEZFRPGMFV5/0AiJsbvy3T6RTh/gOa
	HggWkR3kYILq6+KQKIUcauKJGW0NDy491lIulALMVr4TtLjkPOfFfqOFP7VQxtpBYbBRkKnU/3I
	CbRsTdHKsx9eMY+IKmkYeqVMkWSI6uXFE/3ndBIojmzXyfKP4JSg3fEGxa3Fd0qLkE8L62a+YX5
	w8+SVw==
X-Received: by 2002:a05:622a:4c08:b0:55d:2dd1:48c8 with SMTP id d75a77b69052e-55d5a80a719mr59797531cf.67.1795030523112;
        Wed, 18 Nov 2026 11:35:23 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66b24f4dsm7057611cf.5.2026.11.18.11.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:35:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTlRB-0000000GGIL-2q4J;
	Wed, 18 Nov 2026 15:35:21 -0400
Date: Wed, 18 Nov 2026 15:35:21 -0400
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
Message-ID: <20261118193521.GD3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>
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
In-Reply-To: <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>

On Wed, Nov 18, 2026 at 04:11:40PM -0300, Daniel Almeida wrote:
> 
> > On 17 Nov 2026, at 17:20, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > 
> > On Tue, Nov 17, 2026 at 05:09:11PM -0300, Daniel Almeida wrote:
> >> Hi Jason,
> >> 
> >>> On 16 Nov 2026, at 16:38, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >>> 
> >>> On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> >>>> This series adds a Rust abstraction for IOMMU paging domains. A driver
> >>>> can allocate a domain, attach it to its device, map pages into it, and
> >>>> install a handler for its faults.
> >>>> 
> >>>> This will be used by the upcoming rkvenc driver that my colleagues
> >>>> Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> >>>> this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> >>>> [0].
> >>>> 
> >>>> As part of the security model, each client will have its own IOMMU
> >>>> domain. This is needed as the submission model will let userspace set
> >>>> most of the encoder's registers directly, so the kernel cannot check
> >>>> every memory access that a job makes the encoder do. With a single
> >>>> domain, one client could make the encoder read or write the memory of
> >>>> another client.
> >>> 
> >>> How do you plan to get the paging domain in the first place?
> >> 
> >> We plan to alloc a paging domain when a video encoder session is created. Then
> >> we call iommu_attach_device() before a job runs, and detach back to the default
> >> domain after it finishes so the next job can attach its own session's domain.
> >> This is so each session is isolated from each other.
> > 
> > If you do that you can't use the DMA API at all in your driver as you
> > have to set 'driver_managed = true'. Is it OK? If it is why not just
> > use VFIO?
> 
> No, not OK :/ We want to use GEM shmem, which calls into the DMA API internally
> through drm_gem_shmem_get_pages_sgt() -> dma_map_sgtable().

You cannot continue to use DMA API once you start touching a paging
domain directly. It is why driver_managed exist.

If you want to use the DMA API you need two struct devices and now you
are into DT abuse land.

So what exactly are you planning on doing

And why do you need the paging domain at all if you are using the DMA
API?

> The CPU mappings are write-combined, so the only cache maintenance is the clean
> of newly allocated pages, which dma_map_sgtable() does in
> drm_gem_shmem_get_pages_sgt(). 

Yes, this is why you should be using the DMA API, that doesn't explain
how any direct use of a paging domain will work.

> The mappings themselves are chosen by the kernel driver. We don't
> care about what the actual IOVA is. All we care about is that a
> given GEM object is mapped to a given domain, and that we have some
> IOVA representing the start of the allocation, such that we can pass
> that to the device.

Wonderful, what is the paging domain for?

> > Are you sure you shouldn't be using iommufd for this, tied into your
> > driver? It was intended for exactly this use case, to allow drivers to
> > delegate their translation to userspace. Though that doesn't relly
> > solve the questions about what it is even being attached to..
> 
> I had a cursory look at iommufd, but it seems like:
> 
> a) it requires IOMMU_CAP_CACHE_COHERENCY, which is not offered by the rk_iommu
> backing the RK3588 SoC we are currently targeting. In fact, IIUC, this does not
> seem to be possible, since the encoder is not cache coherent with the CPU?
> I.e., does iommufd expect hardware cache coherency/snooping?

*Linux* expects coherency, if you are DMAing direcly to user cachable
memory and you aren't coherent there are issues, and minimally your
driver would have to do the cache flushing.

Which we have deliberately made it so drivers cannot do to force them
to use the DMA API.

This is one of the unresolved problems if a driver tries to use a
paging domain directly.

> b) there is no way to do what I said above about GEM, i.e.: there is no
> connection between iommufd and GEM.

Right, because you started out saying you wanted userspace to control
the mapping and put user memory into it. Kernel controlled GEM
mappings is something entirely different.

> You seem to be saying that what I'm proposing here has a few pitfalls that have
> come up over the years. Perhaps we can massage iommufd to make our use case
> work? I can volunteer to do whatever work is needed, of course.

I am very confused about what you are even doing. Can you explain more
clearly please? What does you DT look like? What do your attach calls
do? How many struct devices do you have? Who is calling the DMA API?
Who is mapping the paging domain? And who handles cache flushing
issues for your incoherent architecture?

Jason
