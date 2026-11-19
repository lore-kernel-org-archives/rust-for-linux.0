Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093442;
	b=V8fSSnEt8jddE3gSznFfIA1btLstK+V+Vb5Jiuef/jeY1TGQWZXp1M6tHd938wm0nXkK
	 smMjsKG1bdgM6a2oJPwfoxsWewH49r2WpWUJ0VHJB420M1IuUeuyfD7rixbrVGJruwPER
	 7evpm66Z9Gtj9b7RAMnHqJJuntOkMg4SrNAqMvERfx9YRpxN7xYADqG2OKrtPdt3ldEE3
	 +kejPBftbD9DBFkLRcgh/IevmptXrekQpK5qaTH+XKshlGzWhlarsLiaZeueiUsgQVk1o
	 SpuK6wr1KGknEUOjatYWtCrsY3wKo21OUz8lIyFNyHlPJtcdZWmCSSuBBPZg8SyczkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093442;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=t0uM0NBtYS/5IoagvFIL2DymKazUe4CV4ZOcwY0JkuA=;
	b=g9qR6+sJRz1jNCblIHkAN57MT5NIvbKnGx9bkn7J+B+epPn9uPQdMWDxWZSHfd3LgLJP
	 HKIqwSRrjJKgEREnjmKqoepLAMvJ7ruuxbuh7heq8EVCvX1IdYPfz/0plw5cRLd0lAeqU
	 pKj52FU55wV4gTn4e57Uz7OSEv9TMbZRo0y8ZF3Omi/Qbw7gxvL7/fBxUGSKcVDTbaqZi
	 1E11GHOGUPwikEMohPXxdJ4hl1GcAcSBLOmTvfuJtUGdl7feQFENYBcBy3rwn4Ue4c7N6
	 sfmeLy/kN3RJIDQ8dwqI8xo1qHWPuKru3Fz97qySGtSVCSk1eem/ibcxEi884zjUfTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="bV/ldCjM";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F00606A320;
	Thu, 19 Nov 2026 13:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F00606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bV/ldCjM
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 907E51575;
	Thu, 19 Nov 2026 05:03:57 -0800 (PST)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAC0D3F882;
	Thu, 19 Nov 2026 05:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795093440; bh=iIlEwi6pkHXBxZ9dNFNoka7f10xmdTnGjWHOLxEkjcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bV/ldCjMlEqMWyMzf+Y7IfkjNzUnjf+GmzrPVIPfw52FGzyFL6OVRLmhJZc3IxwEi
	 o4tFSyJEz/j36VmQl/u33QtPNmHxdMtbLrSoFjoGL62q6f+Co8ZvjhTFFeqzsfUKmH
	 nIh2jMWxjx53idxjvRQnHDIJ17tWuUi22CHT5CkI=
Message-ID: <06d4eead-b765-44b9-94a8-6ec2d71d172a@arm.com>
Date: Thu, 19 Nov 2026 13:03:52 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
To: Jason Gunthorpe <jgg@ziepe.ca>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, Detlev Casanova <detlev.casanova@collabora.com>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>
 <20261118193521.GD3115493@ziepe.ca>
 <457fe01cc1fbc5b6e2d7b5c9c167012b56fe86b2.camel@collabora.com>
 <20261118210626.GF3115493@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261118210626.GF3115493@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/11/2026 9:06 pm, Jason Gunthorpe wrote:
> On Wed, Nov 18, 2026 at 02:41:32PM -0500, Nicolas Dufresne wrote:
>> Jason,
>>
>> Le mercredi 18 novembre 2026 à 15:35 -0400, Jason Gunthorpe a écrit :
>>>> No, not OK :/ We want to use GEM shmem, which calls into the DMA API internally
>>>> through drm_gem_shmem_get_pages_sgt() -> dma_map_sgtable().
>>>
>>> You cannot continue to use DMA API once you start touching a paging
>>> domain directly. It is why driver_managed exist.
>>
>> You are building a strong argument around something that is not what we intent
>> this binding to be used for. If you had cared about the context you'd know we
>> don't want to touch paging from userspace in this type of drivers.
> 
> Go re-read Daniel's answer and perhaps you can understand my confusion:
> 
> https://lore.kernel.org/all/3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com/
> 
> If you want to
> 
>     "We plan to alloc a paging domain when a video encoder session is created. Then
>      we call iommu_attach_device() before a job runs"
>   
> You cannot use the DMA API.
> 
> You absolutely CANNOT attach a brand new driver controlled domain, use
> the DMA API to populate it, and then detach it.
> 
> Then we have the issue that the rust bindings expose iommu_map, which
> cannot even be used on any non-coherent arch due to lack of cache
> flushing.
> 
> Further, from a Rust binding perspective all these unsafe things I
> talked about have to be blocked by the Rust compiler:
>   1) You cannot attach a domain to a driver_managed_dma=false device
>   2) You cannot call DMA API functions on a driver_managed_dma=true device
>   3) I object to exposing iommu_get_domain_for_dev()/etc to Rust
>      due to how unsafe it is, but if you were to do it then the
>      returned pointer must never be used with attach or iommu_map/unmap
>      functions.
>   4) Since there is no cache flushing a non-coherent arch must never be
>      allowed to call iommu_map(), since it is unsafe to create memory
>      incoherence.
> 
> Thus, what exactly is the plan here? Do you see my concern?

Yes, your concern is a restriction that you largely made up :)

This is very much *not* driver_managed_dma, which TBH is poorly named 
since it really means either "no DMA at all and thus fine to nominally 
hotplug into live domains" or "userspace-managed DMA with no chance of 
ever inserting DMA API calls at the right points". The model here is 
basically just dma_link except you run your own explicit IOVA allocator, 
and you have to make the IOMMU and DMA API calls separately because 
there are no bundled helpers. Sure it's a relatively specialist use-case 
that's not for any old driver, and isn't without its own caveats, mostly 
that extra care would be needed if the device also had reserved regions 
and/or IOMMU-translated MSIs, but for the typical embedded media devices 
(in which I firmly include embedded NPUs, since from this perspective 
the way they work is still about the same) which do want to operate this 
way, those do not apply so it's fine and pretty straightforward.

Thanks,
Robin.
