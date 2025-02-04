Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390FD20C479
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670384; cv=none; b=YrZyvKE5IBvQdTlsHyVNrsWNFiSokfASPTndlT4HQJbq0BxGMys1pzPGCFNzLitBKPhGUOWipZHFiptbm7+zzy3PQcpELNyVwBWisOrLsvX/l6HTvn3NjECHWFMD11qWLSmKh/QqZZZeqT9brHPRM2CYH5jZtQs4pEK2DwMZYtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670384; c=relaxed/simple;
	bh=FkgYftkApv8VX324U0d/4yt+FA/nCmIjEwsanDl9G9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tx3nQkIXdwVSd/4dXfGNiUQ4e8MDmjA5rhZ8NyHtaDhrrdjV0Y2XoN3Hepy7+6OB8IcGi37HxXNT2K/TB1LmVXSbCDejDKq4BqcTcH/4uYVPYrhWVcbQBcChFWPB/+4tA7VvgV+X/kz9e9D44zYev+ssUbchz1SDHPCEHl286dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=edl/zpgg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="edl/zpgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738670381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2LUApxnuAa+ydDxl9UBbGeUWTs0jot9Q4DP3ECp3Z9s=;
	b=edl/zpgg0L1+in8mENbXV+QhXQIbslviLFPoYrwZ0aoRizogfH6AipGsmO5fTZiPI+9KVX
	qLG/HNWzmBuha+KgvhFdW+79UxW/yp7ygEb47xQL/bi7dfILaGmr+9mINPf0niG+4ksOlN
	r6aijFmXKD2JCQ+4nw2EJcZfN8Q9WNA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-VVOKT1RDMquu-ciOJ_r7UA-1; Tue, 04 Feb 2025 06:59:40 -0500
X-MC-Unique: VVOKT1RDMquu-ciOJ_r7UA-1
X-Mimecast-MFC-AGG-ID: VVOKT1RDMquu-ciOJ_r7UA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4359206e1e4so46826105e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 03:59:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738670379; x=1739275179;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2LUApxnuAa+ydDxl9UBbGeUWTs0jot9Q4DP3ECp3Z9s=;
        b=sV1DFUtquXPg39qtBuHIZr0b+xvRak678geIBXUj8Q8c6FBtiNH0EF+IArQWzNA8Lv
         BbjZaw8TOLdd3LV2ZSd0H/olAeeZjVWdrO+yHMbNfQnjJ5zoj6D+iu2Cwz8HoCW/cZPf
         Q7/sn7L4O9t9r4JuHN1gV29/H+dYAFrF4v6V4xGz4lMssOKzY1loqzdoE7Rwz5fav3xH
         faGDXAN7u0NrSSepozVTknmbStXEEcGq9hgMebj/3g0zxG5FPiOB0Vb8jMY/CChXUp0V
         /Qspcpxgp82ckXHojiUz5Bq88yXujDK5p4CkNsOjYkHo67CHFRkoKj0QWTWRe0GUJS6s
         7jtA==
X-Forwarded-Encrypted: i=1; AJvYcCXQgUkFILtt/xN5Y1F/pkOwKyP19hamcbj4Mb2DtNaRK30fx/O68bhjyz7HlO21zsna6XY6n6SRML+wClt6dQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/Hy+QSHceg9hEJ0caSbERDdcNNOWoYO7aUzZvYgxPD4X3ND0
	rXtPK0cCSiLkt0xG3vfrHYJua86tDefPP4yv/NPyNrErqGvDJd/XNR9AY0VU4BDV7llOdfHrQUG
	FGvs6ummnfhRM1nQFvTsdSmoFz1q0mfr8NEzrby4qNMI0iQohWsKhHK05Dw6RyD1p
X-Gm-Gg: ASbGnctjBfQsjtkIq9P82MZTP7FMa/WKBvfrwsFi6BbguhSitQxl5qHfwsp7KPdBKy7
	+9breWPsIrzEG3H3uWaP1KAb2r4AR9o4aC7YeUr2RzUJWb1YjUpS9hLBFEOIKMwUoQ1YmsLYAMW
	j69P1Y2CZ4w5x13T1Rgt6gsSbf2IGtNTk2HJgH5lZqv8XhHeKNwK9AcNEwHeGi8VfCq8KGvOjvq
	3wuxzE9R9y7l8lqd+YNIOqzR5/9Ly+QuiPkplfTz8zNDA1pOgN63Z1PNow9h3+km45GXr0lCvfq
	G8n9Jv9bRBtnJ2cErj3mLisASOfBb1dIIuE6qAApFrlbfeCtx5i5U+4XymkZuxlPMwVJJi5TeR+
	KpNhVknmF02l88+9W3kFp2vtdlEI=
X-Received: by 2002:a05:600c:1e21:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-438dc3c31ccmr327002045e9.11.1738670378752;
        Tue, 04 Feb 2025 03:59:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsWlTVIIk0lhbvohEYB4NAWstCZ9sfyHqicnXCgjWKJv+h96/Zlz1HorRnS/HrBQGHjV90cw==
X-Received: by 2002:a05:600c:1e21:b0:434:a781:f5d9 with SMTP id 5b1f17b1804b1-438dc3c31ccmr327001605e9.11.1738670378320;
        Tue, 04 Feb 2025 03:59:38 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de016sm191286705e9.9.2025.02.04.03.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 03:59:37 -0800 (PST)
Message-ID: <f1498b22-0bc1-489a-8c2c-35aa48c7fe7d@redhat.com>
Date: Tue, 4 Feb 2025 12:59:35 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Asahi Lina <lina@asahilina.net>, Zi Yan <ziy@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>,
 Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, Oscar Salvador <osalvador@suse.de>,
 Muchun Song <muchun.song@linux.dev>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <41ca3445-80cd-43c1-8f9e-634c195c9187@asahilina.net>
 <37A0729B-A711-4D45-B9F0-328FDB9ADD28@nvidia.com>
 <0e19e1c3-293b-4740-93f3-2c410893288b@redhat.com>
 <82047858-480a-45e3-b826-3a46fbebe842@asahilina.net>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZgEEwEIAEICGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAhkBFiEEG9nKrXNcTDpGDfzKTd4Q9wD/g1oFAl8Ox4kFCRKpKXgACgkQTd4Q
 9wD/g1oHcA//a6Tj7SBNjFNM1iNhWUo1lxAja0lpSodSnB2g4FCZ4R61SBR4l/psBL73xktp
 rDHrx4aSpwkRP6Epu6mLvhlfjmkRG4OynJ5HG1gfv7RJJfnUdUM1z5kdS8JBrOhMJS2c/gPf
 wv1TGRq2XdMPnfY2o0CxRqpcLkx4vBODvJGl2mQyJF/gPepdDfcT8/PY9BJ7FL6Hrq1gnAo4
 3Iv9qV0JiT2wmZciNyYQhmA1V6dyTRiQ4YAc31zOo2IM+xisPzeSHgw3ONY/XhYvfZ9r7W1l
 pNQdc2G+o4Di9NPFHQQhDw3YTRR1opJaTlRDzxYxzU6ZnUUBghxt9cwUWTpfCktkMZiPSDGd
 KgQBjnweV2jw9UOTxjb4LXqDjmSNkjDdQUOU69jGMUXgihvo4zhYcMX8F5gWdRtMR7DzW/YE
 BgVcyxNkMIXoY1aYj6npHYiNQesQlqjU6azjbH70/SXKM5tNRplgW8TNprMDuntdvV9wNkFs
 9TyM02V5aWxFfI42+aivc4KEw69SE9KXwC7FSf5wXzuTot97N9Phj/Z3+jx443jo2NR34XgF
 89cct7wJMjOF7bBefo0fPPZQuIma0Zym71cP61OP/i11ahNye6HGKfxGCOcs5wW9kRQEk8P9
 M/k2wt3mt/fCQnuP/mWutNPt95w9wSsUyATLmtNrwccz63XOwU0EVcufkQEQAOfX3n0g0fZz
 Bgm/S2zF/kxQKCEKP8ID+Vz8sy2GpDvveBq4H2Y34XWsT1zLJdvqPI4af4ZSMxuerWjXbVWb
 T6d4odQIG0fKx4F8NccDqbgHeZRNajXeeJ3R7gAzvWvQNLz4piHrO/B4tf8svmRBL0ZB5P5A
 2uhdwLU3NZuK22zpNn4is87BPWF8HhY0L5fafgDMOqnf4guJVJPYNPhUFzXUbPqOKOkL8ojk
 CXxkOFHAbjstSK5Ca3fKquY3rdX3DNo+EL7FvAiw1mUtS+5GeYE+RMnDCsVFm/C7kY8c2d0G
 NWkB9pJM5+mnIoFNxy7YBcldYATVeOHoY4LyaUWNnAvFYWp08dHWfZo9WCiJMuTfgtH9tc75
 7QanMVdPt6fDK8UUXIBLQ2TWr/sQKE9xtFuEmoQGlE1l6bGaDnnMLcYu+Asp3kDT0w4zYGsx
 5r6XQVRH4+5N6eHZiaeYtFOujp5n+pjBaQK7wUUjDilPQ5QMzIuCL4YjVoylWiBNknvQWBXS
 lQCWmavOT9sttGQXdPCC5ynI+1ymZC1ORZKANLnRAb0NH/UCzcsstw2TAkFnMEbo9Zu9w7Kv
 AxBQXWeXhJI9XQssfrf4Gusdqx8nPEpfOqCtbbwJMATbHyqLt7/oz/5deGuwxgb65pWIzufa
 N7eop7uh+6bezi+rugUI+w6DABEBAAHCwXwEGAEIACYCGwwWIQQb2cqtc1xMOkYN/MpN3hD3
 AP+DWgUCXw7HsgUJEqkpoQAKCRBN3hD3AP+DWrrpD/4qS3dyVRxDcDHIlmguXjC1Q5tZTwNB
 boaBTPHSy/Nksu0eY7x6HfQJ3xajVH32Ms6t1trDQmPx2iP5+7iDsb7OKAb5eOS8h+BEBDeq
 3ecsQDv0fFJOA9ag5O3LLNk+3x3q7e0uo06XMaY7UHS341ozXUUI7wC7iKfoUTv03iO9El5f
 XpNMx/YrIMduZ2+nd9Di7o5+KIwlb2mAB9sTNHdMrXesX8eBL6T9b+MZJk+mZuPxKNVfEQMQ
 a5SxUEADIPQTPNvBewdeI80yeOCrN+Zzwy/Mrx9EPeu59Y5vSJOx/z6OUImD/GhX7Xvkt3kq
 Er5KTrJz3++B6SH9pum9PuoE/k+nntJkNMmQpR4MCBaV/J9gIOPGodDKnjdng+mXliF3Ptu6
 3oxc2RCyGzTlxyMwuc2U5Q7KtUNTdDe8T0uE+9b8BLMVQDDfJjqY0VVqSUwImzTDLX9S4g/8
 kC4HRcclk8hpyhY2jKGluZO0awwTIMgVEzmTyBphDg/Gx7dZU1Xf8HFuE+UZ5UDHDTnwgv7E
 th6RC9+WrhDNspZ9fJjKWRbveQgUFCpe1sa77LAw+XFrKmBHXp9ZVIe90RMe2tRL06BGiRZr
 jPrnvUsUUsjRoRNJjKKA/REq+sAnhkNPPZ/NNMjaZ5b8Tovi8C0tmxiCHaQYqj7G2rgnT0kt
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <82047858-480a-45e3-b826-3a46fbebe842@asahilina.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BmmZzXTTKQWdm9zK8fslgIHF4UJM4Ik5mcInZ6K5WQ0_1738670379
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>> Add DavidH and OscarS for memory hot-remove questions.
>>>
>>> IIUC, struct page could be freed if a chunk of memory is hot-removed.
>>
>> Right, but only after there are no users anymore (IOW, memory was freed
>> back to the buddy). PFN walkers might still stumble over them, but I
>> would not expect (or recommend) rust to do that.
> 
> The physaddr to page function does look up pages by pfn, but it's
> intended to be used by drivers that know what they're doing. There are
> two variants of the API, one that is completely unchecked (a fast path
> for cases where the driver definitely allocated these pages itself, for
> example just grabbing the `struct page` back from a decoded PTE it
> wrote), and one that has this check:
> 
> pfn_valid(pfn) && page_is_ram(pfn)
> 
> Which is intended as a safety net to allow drivers to look up
> firmware-reserved pages too, and fail gracefully if the kernel doesn't
> know about them (because they weren't declared in the
> bootloader/firmware memory map correctly) or doesn't have them mapped in
> the direct map (because they were declared no-map).
 > > Is there anything else that can reasonably be done here to make the API
> safer to call on an arbitrary pfn?

In PFN walkers we use pfn_to_online_page() to make sure that (1) the 
memmap really exists; and (2) that it has meaning (e.g., was actually 
initialized).

It can still race with memory offlining, and it refuses ZONE_DEVICE 
pages. For the latter, we have a different way to check validity. See 
memory_failure() that first calls pfn_to_online_page() to then check 
get_dev_pagemap().

> 
> If the answer is "no" then that's fine. It's still an unsafe function
> and we need to document in the safety section that it should only be
> used for memory that is either known to be allocated and pinned and will
> not be freed while the `struct page` is borrowed, or memory that is
> reserved and not owned by the buddy allocator, so in practice correct
> use would not be racy with memory hot-remove anyway.
> 
> This is already the case for the drm/asahi use case, where the pfns
> looked up will only ever be one of:
> 
> - GEM objects that are mapped to the GPU and whose physical pages are
> therefore pinned (and the VM is locked while this happens so the objects
> cannot become unpinned out from under the running code),

How exactly are these pages pinned/obtained?

> - Raw pages allocated from the page allocator for use as GPU page tables,

That makes sense.

> - System memory that is marked reserved by the firmware/bootloader,

E.g., in arch/x86/mm/ioremap.c:__ioremap_check_ram() we refuse anything 
that has a valid memmap and is *not* marked as PageReserved, to prevent 
remapping arbitrary *real* RAM.

Is that case here similar?

> - (Potentially) invalid PFNs that aren't part of the System RAM region
> at all and don't have a struct page to begin with, which we check for,
> so the API returns an error. This would only happen if the bootloader
> didn't declare some used firmware ranges at all, so Linux doesn't know
> about them.
> 
>>
>>>
>>> Another case struct page can be freed is when hugetlb vmemmap
>>> optimization
>>> is used. Muchun (cc'd) is the maintainer of hugetlbfs.
>>
>> Here, the "struct page" remains valid though; it can still be accessed,
>> although we disallow writes (which would be wrong).
>>
>> If you only allocate a page and free it later, there is no need to worry
>> about either on the rust side.
> 
> This is what the safe API does. (Also the unsafe physaddr APIs if all
> you ever do is convert an allocated page to a physaddr and back, which
> is the only thing the GPU page table code does during normal use. The
> walking leaf PFNs story is only for GPU device coredumps when the
> firmware crashes.)

I would hope that we can lock down this interface as much as possible.

Ideally, we would never go from pfn->page, unless

(a) we remember somehow that we came from page->pfn. E.g., we allocated
     these pages or someone else provided us with these pages. The memmap
     cannot go away. I know it's hard.
(b) the pages are flagged as being special, similar to
     __ioremap_check_ram().

-- 
Cheers,

David / dhildenb

