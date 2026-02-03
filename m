Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69F286348;
	Tue,  3 Feb 2026 17:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770140911; cv=none; b=GqvU5wnN3di1ok4A6sXmmOr/yTfJVZ3XwGL93put2sli5M2+C4bhFmn2jHsZMmwq7jY/fNPlIttnDcwBqBccaCfY7GZdjRbFeA+lqSP5vznQVlj00cpDz30ARqMvjuJOrDmvBj1gyUiRTIIsVYl4w/YgedqKAeJf6Ta1lOaziT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770140911; c=relaxed/simple;
	bh=RzhQz/6PmdrQAW/9kQ9deMnwz3nhAMY81C5KrLGbxuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izM7J+Opa/h3MjugQfUMejF6urf2SkikU031KWZBXqm8JbZug9WKS1CtoyENJOeioKHRcG8ZOYvXYTwVcbM/khwDg3Tu/ti6KQp4gijQc7UAqOpZeo8PaDh/Sy2kfblrHZkZNkdpNmnxVX5POSINXjE+IVFlo3pjwjkkZ9JaZbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=DWeWyiW0; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="DWeWyiW0"
Message-ID: <8006f30e-b794-4852-bc10-2981b5d010d8@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1770140903; bh=RzhQz/6PmdrQAW/9kQ9deMnwz3nhAMY81C5KrLGbxuk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DWeWyiW01PSqdMuT54auvFGLW9wSj+zFUJ6csKdvIrsKDL/7lNwFpDcmWGDWjjaIc
	 MLIHJZyDAy4Tj3E+2WBbKQ28Rf86av+INzuJq0DBpoSNAZZB9JB7Af3jR8H06dCiX5
	 HKpgQA5fTary2yGH5ni9j+Ix46UNonoyYan538bcX+iNu0zHPJoU/oBQ2DFWMe2SJB
	 oyr4IybJ88aLG068k2LGQRVNucvHzWuctR8CfiEHvBkuY25ButlBlUgarvloqxPqGP
	 O2DEB7pgZLIUfp8L/Ac3rlnZ1cBihvAw4xUsLTRnwtb3sG9bLYZpQie52yBuet/vWP
	 61S9a6p0DKs5A==
Date: Tue, 3 Feb 2026 23:18:17 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] rust: alloc: Add shrink_to and shrink_to_fit
 methods to Vec
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Cc: cmllamas@google.com, gregkh@linuxfoundation.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com,
 urezki@gmail.com
References: <20260131154016.270385-1-shivamklr@cock.li>
 <20260131154016.270385-2-shivamklr@cock.li>
 <DG5FEPO6RCK4.17KOY7PRLNFKV@kernel.org> <aYIWd9wzPIRa4gZc@google.com>
 <DG5FWZ2CA3DR.2WBZ27YUYS705@kernel.org>
Content-Language: en-US
From: Shivam Kalra <shivamklr@cock.li>
In-Reply-To: <DG5FWZ2CA3DR.2WBZ27YUYS705@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/26 21:13, Danilo Krummrich wrote:
> On Tue Feb 3, 2026 at 4:38 PM CET, Alice Ryhl wrote:
>> On Tue, Feb 03, 2026 at 04:19:14PM +0100, Danilo Krummrich wrote:
>>> On Sat Jan 31, 2026 at 4:40 PM CET, Shivam Kalra wrote:
>>>> This implementation guarantees shrinking (unless already optimal),
>>>> because the kernel allocators don't support in-place shrinking,
>>>> a new allocation is always made.
>>>
>>> I'm not sure we should go in this direction. There is a reason why krealloc()
>>> does not migrate memory between kmalloc buckets, i.e. the cost of migration vs.
>>> memory saving.
>>>
>>> For Vmalloc buffers the story is a bit different though. When I wrote vrealloc()
>>> I left some TODO comments [1][2].
>>>
>>>   (1) If a smaller buffer is requested we can shrink the vm_area, i.e. unmap and
>>>       free unused pages.
>>>
>>>   (2) If a bigger buffer is requested we can grow the vm_area, i.e. allocate and
>>>       map additional pages. (At least as long as we have enough space in the
>>>       virtual address space.)
>>>
>>> So, I think we should just use A::realloc(), leave the rest to the underlying
>>> specific realloc() implementations and address the TODOs in vrealloc() if
>>> necessary.
>>>
>>> [1] https://elixir.bootlin.com/linux/v6.18.6/source/mm/vmalloc.c#L4162
>>> [2] https://elixir.bootlin.com/linux/v6.18.6/source/mm/vmalloc.c#L4192
>>
>> If kvrealloc() does the right thing, then let's use it.
> 
> It should once the TODOs of vrealloc() are addressed. The reason I left them as
> TODOs was that I didn't want to implement all the shrink and grow logic for
> struct vm_area without having a user that actually needs it.
> 
> If binder needs it, I think we should do it.
Hi Danilo, Alice,

Thanks for the detailed feedback - I hadn't considered the kmalloc bucket
migration costs.

Given that:
- krealloc() intentionally avoids migrating data to smaller buckets when
shrinking
- vrealloc() has TODOs for in-place shrinking
- The immediate need is binder, which uses KVec (could use either allocator)

I'm thinking the pragmatic path is:

1. For v3: Simplify shrink_to() to use A::realloc() instead of
   alloc+copy+free. This ensures we get whatever optimization
   the allocator provides (including the bucket preservation for kmalloc).

2. The vrealloc() in-place shrinking could be a separate follow-up
   series, as it's a larger change to the allocator itself.

Does this approach make sense, or would you prefer I tackle the
vrealloc TODOs first?

Thanks,
Shivam
