Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A5217660
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 20:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738699832; cv=none; b=fix9XwmjDIYeHUywQYLrfMW4ooz9US1XeqRH4H7OM/CvEwQ0F8iyBBCDWK3cz/XvX5HVNnoSZvtvPzjTEsfKu3UM/w9ji46qGj9dq50BmecMAypYDTySvWVQJxskvz1DPye0OQYo5DPwcwntr93j7UGTzZT77KPGh6dSW1yH6Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738699832; c=relaxed/simple;
	bh=rf80j6lp1Z3DGrOAkvvJCGIz6wLkvy94AxZZMOnZxvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgGDOWy56kbwcjjnYCG9wjgzVQpZx5EjFWXSXl8I0zvfEKVcjNKLZ28asmPHFIURNrmeYANdSIYvztrtn/chzmFgY/VtQYAN+LuhWHioetayJJjlOTC3Ima/Q+/qvSQTkEjBsbee7JOYc+qbiyezZEwJxGyKwWnhikX4p9dXyfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XfO+0X43; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XfO+0X43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738699830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9KGn7TZ9Qy9WvkVJ0t6ZHAlutNTr5hGqmA01DIHm+is=;
	b=XfO+0X43K5F93HwOnHK5mDF/Kjt0ztIALM4P17wdNYjvyFSqoVNnLIvQUH2I4HBZvl+UeI
	ZuVc7+W++ATTezE1hWe24h0y3IujtcSnHJaviWrWbjSZOR/tlYsZeS8DVqmJHc9OpD+QiS
	yCUhv3GUxx4e5tQyMjhUIOS6lcF9Cn0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-4bP_lc-JOES_MM3aAO0SlQ-1; Tue, 04 Feb 2025 15:10:27 -0500
X-MC-Unique: 4bP_lc-JOES_MM3aAO0SlQ-1
X-Mimecast-MFC-AGG-ID: 4bP_lc-JOES_MM3aAO0SlQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43628594d34so31436635e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 12:10:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738699826; x=1739304626;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9KGn7TZ9Qy9WvkVJ0t6ZHAlutNTr5hGqmA01DIHm+is=;
        b=kaoJASqLpBmv+O+/pkgarrLNug2i95sWJK+uWGScUza9DDrKLX4S4AbOYOPrhEUmMo
         raD1ngN+Oa7kLPURcwsb5CQSwQjY02FGwZf2MmF8ka9kRXFr64BzscAyItEZrad8z8TD
         Fr5Hrmhw5aeGRSJxNztYvxfiZh86MtLyquzuctULXdxdDfLttow39RvA0i2lNC/7hr89
         Dh1IBY+yUmlyyiFdsfZ62w1q0XrHG7jeE7SvYUkobIYenv057B/HtNTdukbTo9P9eo/5
         7R3HvfFk0ro+tGRJ/0zS5TnMK1FrjXff4fhoylRnKPketJ4w0gsRbmA110sBFtAAOD2u
         Q8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXigVi3Iore53zje5mDXkREvAhuiVrQqJFkRQcrsRIu01N7zBIkbdDqN7Tn/MbzFI9hRdHg+swHWY+auTZfcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyacgykD1zxTQNxF0mt8x5jJQ9h7ZxV9BOBJA8d1XIfmUzZUBqG
	ebC1YwsedQHIuaW9yyy75jEYOAN66QKvR/NUwsHOh7kad22q3GDBQpxMTLJY+Ll2+EzkPqUVt0A
	7tpF5D9k2iibx7bJHEK9K6vFq5AYIwMsMiLC07eov1k302mSgUMC0l1WgG8HqNN+2
X-Gm-Gg: ASbGnctoHyycQAMSYrfy0PKZ6/M2noFIktycRjauGWvOuDteaQsQyBkbm1IrbtgpGi7
	4LXp58Fq8Y6LEHgQeSxh6cKF2x/8bg3PK/KGN8R1X9fkNB2U5BE71nlJLNQcneuLgIDS8SzjwA4
	qDQj9YVG2vEnE5T0860lY0snX0NxYQKaKqAVplvhji9JuMPu4e8Oo2EPC1LSove5G+mNUw6FDe7
	zMXxd/3rD084q8DxrhXc/YzS2aVzMF4bD1RAXtYslgn0MO8va2KsW8NC4AW8DD/qgOzrIjQ3evk
	mJqwW3kCNwGJU1BYLeNNuq+/ALLsrARoNgcWULe6ov6qUDA8nDE5Ot3LgyGmc0L+nVA12xi13fb
	S7mClNs2E/hxawoe1CzxfjeBf6E8=
X-Received: by 2002:a05:600c:468d:b0:436:5165:f21f with SMTP id 5b1f17b1804b1-438dc42933cmr207140315e9.26.1738699825890;
        Tue, 04 Feb 2025 12:10:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELPsfjrnbJWk3d/bgKH4wLXZSA/5kUiQqXHSypUCLqIEHICpcwCm/HVai1+PGPOYdwWfOgzQ==
X-Received: by 2002:a05:600c:468d:b0:436:5165:f21f with SMTP id 5b1f17b1804b1-438dc42933cmr207140085e9.26.1738699825427;
        Tue, 04 Feb 2025 12:10:25 -0800 (PST)
Received: from ?IPV6:2003:cb:c70a:300:3ae1:c3c0:cef:8413? (p200300cbc70a03003ae1c3c00cef8413.dip0.t-ipconnect.de. [2003:cb:c70a:300:3ae1:c3c0:cef:8413])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf758dbcsm2116447f8f.10.2025.02.04.12.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 12:10:24 -0800 (PST)
Message-ID: <6bcd3315-a0f9-463c-ab97-a43736f9b4f4@redhat.com>
Date: Tue, 4 Feb 2025 21:10:21 +0100
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
 <f1498b22-0bc1-489a-8c2c-35aa48c7fe7d@redhat.com>
 <1e9ae833-4293-4e48-83b2-c0af36cb3fdc@asahilina.net>
 <026c1a0c-e53a-4a5e-92da-6e4f18ce0fee@redhat.com>
 <cc1cd991-1871-4929-851e-d9672a45dcf0@asahilina.net>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <cc1cd991-1871-4929-851e-d9672a45dcf0@asahilina.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZwbvNsdZNtomWLk2KAtVAp0eoN1mdOurVg79ThuwCPs_1738699826
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.25 18:59, Asahi Lina wrote:
> On 2/4/25 11:38 PM, David Hildenbrand wrote:
>>>>> If the answer is "no" then that's fine. It's still an unsafe function
>>>>> and we need to document in the safety section that it should only be
>>>>> used for memory that is either known to be allocated and pinned and
>>>>> will
>>>>> not be freed while the `struct page` is borrowed, or memory that is
>>>>> reserved and not owned by the buddy allocator, so in practice correct
>>>>> use would not be racy with memory hot-remove anyway.
>>>>>
>>>>> This is already the case for the drm/asahi use case, where the pfns
>>>>> looked up will only ever be one of:
>>>>>
>>>>> - GEM objects that are mapped to the GPU and whose physical pages are
>>>>> therefore pinned (and the VM is locked while this happens so the
>>>>> objects
>>>>> cannot become unpinned out from under the running code),
>>>>
>>>> How exactly are these pages pinned/obtained?
>>>
>>> Under the hood it's shmem. For pinning, it winds up at
>>> `drm_gem_get_pages()`, which I think does a `shmem_read_folio_gfp()` on
>>> a mapping set as unevictable.
>>
>> Thanks. So we grab another folio reference via shmem_read_folio_gfp()-
>>> shmem_get_folio_gfp().
>>
>> Hm, I wonder if we might end up holding folios residing in ZONE_MOVABLE/
>> MIGRATE_CMA longer than we should.
>>
>> Compared to memfd_pin_folios(), which simulates FOLL_LONGTERM and makes
>> sure to migrate pages out of ZONE_MOVABLE/MIGRATE_CMA.
>>
>> But that's a different discussion, just pointing it out, maybe I'm
>> missing something :)
> 
> I think this is a little over my head. Though I only just realized that
> we seem to be keeping the GEM objects pinned forever, even after unmap,
> in the drm-shmem core API (I see no drm-shmem entry point that would
> allow the sgt to be freed and its corresponding pages ref to be dropped,
> other than a purge of purgeable objects or final destruction of the
> object). I'll poke around since this feels wrong, I thought we were
> supposed to be able to have shrinker support for swapping out whole GPU
> VMs in the modern GPU MM model, but I guess there's no implementation of
> that for gem-shmem drivers yet...?

I recall that shrinker as well, ... or at least a discussion around it.

[...]

>>
>> If it's only for crash dumps etc. that might even be opt-in, it makes
>> the whole thing a lot less scary. Maybe this could be opt-in somewhere,
>> to "unlock" this interface? Just an idea.
> 
> Just to make sure we're on the same page, I don't think there's anything
> to unlock in the Rust abstraction side (this series). At the end of the
> day, if nothing else, the unchecked interface (which the regular
> non-crash page table management code uses for performance) will let you
> use any pfn you want, it's up to documentation and human review to
> specify how it should be used by drivers. What Rust gives us here is the
> mandatory `unsafe {}`, so any attempts to use this API will necessarily
> stick out during review as potentially dangerous code that needs extra
> scrutiny.
> 
> For the client driver itself, I could gate the devcoredump stuff behind
> a module parameter or something... but I don't think it's really worth
> it. We don't have a way to reboot the firmware or recover from this
> condition (platform limitations), so end users are stuck rebooting to
> get back a usable machine anyway. If something goes wrong in the
> crashdump code and the machine oopses or locks up worse... it doesn't
> really make much of a difference for normal end users. I don't think
> this will ever really happen given the constraints I described, but if
> somehow it does (some other bug somewhere?), well... the machine was
> already in an unrecoverable state anyway.
> 
> It would be nice to have userspace tooling deployed by default that
> saves off the devcoredump somewhere, so we can have a chance at
> debugging hard-to-hit firmware crashes... if it's opt-in, it would only
> really be useful for developers and CI machines.

Is this something that possibly kdump can save or analyze? Because that 
is our default "oops, kernel crashed, let's dump the old content so we 
can dump it" mechanism on production systems.

but ... I am not familiar with devcoredump. So I don't know when/how it 
runs, and if the source system is still alive (and remains alive --  in 
contrast to a kernel crash).

-- 
Cheers,

David / dhildenb

