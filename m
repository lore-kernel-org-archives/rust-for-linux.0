Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746D03D34B8
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201181; cv=none; b=lBf+5itJUShT2oykWSLu5afzONMsa5MvErZttDeXY8eiRvK5khgEjvAxyASyOiVwmyx1w2+UZORPFQIZs4+HaI7hTfJrF2r9bRUls4PYDkgTOyq5WhSbfSN3Xy1gWO47hsPWjea68XqfpDT9xDuJ/2H3f+cnQFLzH2u7HiZfsig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201181; c=relaxed/simple;
	bh=umP0OV33fwKCKd3TZ8ya/R6jkzgpG1QeYeANQaDMs/c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fSe+/PG8BWkR46pXowED1CtP/ebeToX/GNoJSLnZ07LwTg7VYk+kMOGVV+4YGlKW0cfPaL775Lu7951rvOTI73XE+WRAiauCN0T1cOb4Ocqd6EWCkIratbntTNTfQNBTiRJ4RETWLBLJSLGeWgH6yDKN50tz1hNZTHV1rEIM5jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yB479NNw; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yB479NNw"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-482d8e6e13aso3846775e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 02:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770201180; x=1770805980; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mv8Ns+0r/ar13P9PFIeyxSUNlNeBuSoNlKVGLjb/Lf4=;
        b=yB479NNwd4acxhyzFwPg6m2ouwLdnd0CtpTURLMZ2nx1lYTlgp2twvzSYbP1MaU0w7
         Q5SCR9D2KSomP8YztVlc0MtwpfxdGbanN6yOSVrZPKzJXAhPIC/jdmDWN+hbp9VffDta
         LNETRO4PuWStokaQnv/CyOc6YzFlK0CKHoVT8J4K5VZMD40GW7b4pSCJzkU7MGE53j8h
         vTPsli/T1kfHwRXKo5aDw2kd1m6exoUgJHGVihV9NlX9sin1s+0a4SdRIAaxLJkSwud2
         X5kOlVtSnv0DoskdZWCxMaJzjQjOelNSHu6evkmNP1rIqvdF9v4GMEUHwTqfWczIs0Hd
         ztNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201180; x=1770805980;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mv8Ns+0r/ar13P9PFIeyxSUNlNeBuSoNlKVGLjb/Lf4=;
        b=rAfE+GpBFg++euids60fn+A50i0U9cm0iqlaYE5YjYrZSb/eh42s4NX6Xl4EVHP/hO
         cFrWCa79wcCCBWpmZ1S9aVDX8bMiyC8aLTPKzAKxJEf0QbQ/eXHqszjUzRelHcUvBYyl
         CQNn1iJ71QUM4/uf49OjHGZ0kJyBl6Ma1+Xu1o555r0JwafIt4jIDI6UfTcA0WgpswPo
         I4EwQQyr4D7RDA4hfBc33m4+wwzw5DM50m0/ZpqOqgKzl8aGYX3kRHnzr22VP76BxnMc
         mIa0eEACbawWtGr2fctVrUfnwgysONqB2+v7FrYnT/mxdm3VQCI1kpMs9PN4y6jbgoU8
         rHnQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2R76PC6/AMic4a23SItbxiQ6voaQaPCYiIfg7sGd5vfSFbpUsoULYqbFAm0BNKUuAChqZq7aMIQnOWg3LEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4P8G0P0mzbSHM8+aWENQMRvFEaB1kiMeqkKhz4aOY2b6RRJoW
	j6nDqHm/du3q3499erVWHzrfIz9z+/QXuil0PC1JSRJD+L4BiRqqzsmethQOlGaVfL8WxR8gMrr
	LZ9Z3hF0bgHc2A6JcKg==
X-Received: from wmjf11.prod.google.com ([2002:a7b:cd0b:0:b0:480:4a03:7b78])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b70:b0:480:4ae2:def1 with SMTP id 5b1f17b1804b1-4830e931d8bmr32710365e9.13.1770201179820;
 Wed, 04 Feb 2026 02:32:59 -0800 (PST)
Date: Wed, 4 Feb 2026 10:32:58 +0000
In-Reply-To: <8006f30e-b794-4852-bc10-2981b5d010d8@cock.li>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260131154016.270385-1-shivamklr@cock.li> <20260131154016.270385-2-shivamklr@cock.li>
 <DG5FEPO6RCK4.17KOY7PRLNFKV@kernel.org> <aYIWd9wzPIRa4gZc@google.com>
 <DG5FWZ2CA3DR.2WBZ27YUYS705@kernel.org> <8006f30e-b794-4852-bc10-2981b5d010d8@cock.li>
Message-ID: <aYMgWr6iDTus0vDE@google.com>
Subject: Re: [PATCH v2 1/3] rust: alloc: Add shrink_to and shrink_to_fit
 methods to Vec
From: Alice Ryhl <aliceryhl@google.com>
To: Shivam Kalra <shivamklr@cock.li>
Cc: Danilo Krummrich <dakr@kernel.org>, cmllamas@google.com, gregkh@linuxfoundation.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 03, 2026 at 11:18:17PM +0530, Shivam Kalra wrote:
> On 03/02/26 21:13, Danilo Krummrich wrote:
> > On Tue Feb 3, 2026 at 4:38 PM CET, Alice Ryhl wrote:
> >> On Tue, Feb 03, 2026 at 04:19:14PM +0100, Danilo Krummrich wrote:
> >>> On Sat Jan 31, 2026 at 4:40 PM CET, Shivam Kalra wrote:
> >>>> This implementation guarantees shrinking (unless already optimal),
> >>>> because the kernel allocators don't support in-place shrinking,
> >>>> a new allocation is always made.
> >>>
> >>> I'm not sure we should go in this direction. There is a reason why krealloc()
> >>> does not migrate memory between kmalloc buckets, i.e. the cost of migration vs.
> >>> memory saving.
> >>>
> >>> For Vmalloc buffers the story is a bit different though. When I wrote vrealloc()
> >>> I left some TODO comments [1][2].
> >>>
> >>>   (1) If a smaller buffer is requested we can shrink the vm_area, i.e. unmap and
> >>>       free unused pages.
> >>>
> >>>   (2) If a bigger buffer is requested we can grow the vm_area, i.e. allocate and
> >>>       map additional pages. (At least as long as we have enough space in the
> >>>       virtual address space.)
> >>>
> >>> So, I think we should just use A::realloc(), leave the rest to the underlying
> >>> specific realloc() implementations and address the TODOs in vrealloc() if
> >>> necessary.
> >>>
> >>> [1] https://elixir.bootlin.com/linux/v6.18.6/source/mm/vmalloc.c#L4162
> >>> [2] https://elixir.bootlin.com/linux/v6.18.6/source/mm/vmalloc.c#L4192
> >>
> >> If kvrealloc() does the right thing, then let's use it.
> > 
> > It should once the TODOs of vrealloc() are addressed. The reason I left them as
> > TODOs was that I didn't want to implement all the shrink and grow logic for
> > struct vm_area without having a user that actually needs it.
> > 
> > If binder needs it, I think we should do it.
> Hi Danilo, Alice,
> 
> Thanks for the detailed feedback - I hadn't considered the kmalloc bucket
> migration costs.
> 
> Given that:
> - krealloc() intentionally avoids migrating data to smaller buckets when
> shrinking
> - vrealloc() has TODOs for in-place shrinking
> - The immediate need is binder, which uses KVec (could use either allocator)

Binder uses KVVec not KVec, which is the one that could use either allocator.

> I'm thinking the pragmatic path is:
> 
> 1. For v3: Simplify shrink_to() to use A::realloc() instead of
>    alloc+copy+free. This ensures we get whatever optimization
>    the allocator provides (including the bucket preservation for kmalloc).
> 
> 2. The vrealloc() in-place shrinking could be a separate follow-up
>    series, as it's a larger change to the allocator itself.
> 
> Does this approach make sense, or would you prefer I tackle the
> vrealloc TODOs first?

I would kind of prefer that we do this in two steps. First have
shrink_to() use the implementation it does right now. Then a follow-up
patch fix the TODOs in vrealloc().

Alice
