Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795176233;
	b=HoEWFmBGs0ILluFPsnVWE/kfo9F1DJTgSVTzFkXmAyQr/+cCcdm9ndwMlC5+jSHsRT8f
	 gUwsJflD3tsH5wWgeK+6hMBzFPlhOX3YASDJyzR5quwaIqiVD1GzsQqDMfMX6VZrbIczk
	 o8hgdRiK2npS51hQ9Wq2d2TqguT7kyh1VGMjeBlsaKsuRwZcQUbhI78d5B4d/inkB6twh
	 scK9tGwxQo4Ck5CjRLGyVc0fk8sKUVQJafOpcfmCkUqKQP4BPXQlseTVyqy80oJpHeKBA
	 9JGL6WXWsp/maWDIjYubUYJ2+x8+q+NFar5qe0/hAxtBlgyj8uB1FoGdbaYZeZMOq2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795176233;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=SqWIR9Se+KYSxOeedAPrX5X3Izc466RyyVllm8girYs=;
	b=FjLuQFwW6wOurz7q8Vip/H9xEQEYccivx+scfQdsuvL9k7TDutHeGxcB/1f/Fmfq6J2O
	 /UaU3lFuluXsUDcIHTXNj4a+S+ABy5E5E5SM8TB1NnR0ufD1VIsS1PbDA6N8jKPHKeVPe
	 Ih6SIb4upbcJU4XAss7DMi/MpRSjXAkmpGN1hst0iBweyaLkKtEa0VieoTt6wYbmpAtKT
	 sxz1eMwPoekyNuPZmPBnajTAKcFRPBDXLptzv06iEetQAP/qQANrB97yCzMVgMzMJddn5
	 7x0U0O1kbcrFpQGn+MhEgzIeyolN4c7nLT/5zdCDb6cb4wCH6bJCwYKww4fNrbqLsqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQC0Wr3l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E118606A320;
	Fri, 20 Nov 2026 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eQC0Wr3l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9F91F000CA;
	Fri, 20 Nov 2026 12:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795176232;
	bh=SqWIR9Se+KYSxOeedAPrX5X3Izc466RyyVllm8girYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=eQC0Wr3lgUzzTkfZ+g++WQ6i9+JSsJkWmnj3lI8kE0w++Fj0Aif+hZDqhIL9sLyIx
	 a8Di/kqKCukJGTJC1zXepv5Sdr2LCP9iPBbdWF+A8jhGBp1iOQaNYJN7adT34Y3W9S
	 Pb+nv+aR2c9r1M0sYYw7/cHzuoRB8xHITNvgoDwEKeBy2Gh1Ujc9EBblYVSC3NiU26
	 a4amGvRPy1ozUlU0xEE6aDwbhw359/SVKYSi0RWbGncSHF6ILeSO+SgPi2eCETCBk6
	 z9bgDTJwIM9aRQu/yAj/ctpZU9mN6fxaqnl7WJSRpJYz286xTIXsEojssbBso6V1c4
	 oiEmhIyhrZC5A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka
 <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, David
 Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Brendan Jackman
 <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Mike
 Rapoport <rppt@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie
 Kim <rakie.kim@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Matthew Wilcox <willy@infradead.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Daniel Almeida
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arve =?utf-8?B?SGrDuG5u?=
 =?utf-8?B?ZXbDpWc=?=
 <arve@android.com>, Todd Kjos <tkjos@android.com>, Christian Brauner
 <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, Igor B
 <igor.b@beldev.am>, Vitaly Wool <vitaly.wool@konsulko.se>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v22 0/6] rust: page: add page kinds
In-Reply-To: <3C3421E5-5B7D-42B8-ABD2-185375693D7A@nvidia.com>
References: <20261118-page-ownable-v22-0-d63ff73f4075@kernel.org>
 <37B6D4A8-288E-40E8-9214-EDABBFE49C39@nvidia.com>
 <871p8iue5y.fsf@t14s.mail-host-address-is-not-set>
 <3C3421E5-5B7D-42B8-ABD2-185375693D7A@nvidia.com>
Date: Fri, 20 Nov 2026 13:03:30 +0100
Message-ID: <87se0vu2ul.fsf@t14s.mail-host-address-is-not-set>
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
Content-Transfer-Encoding: quoted-printable

Zi Yan <ziy@nvidia.com> writes:

> On 18 Nov 2026, at 14:34, Andreas Hindborg wrote:
>
>> Zi Yan <ziy@nvidia.com> writes:
>>
>>> On 18 Nov 2026, at 11:18, Andreas Hindborg wrote:
>>>
>>>> Note: The page patches were part of the `Ownable` series [1] until v21.
>>>> This series continues the version numbering of that series, and it dep=
ends
>>>> on v22 of that series for `Ownable`, `Owned` and the split of `RefCoun=
ted`
>>>> and `AlwaysRefCounted`.
>>>>
>>>> Not all pages can be treated the same way. A page allocated with
>>>> `alloc_pages()` is managed by the page reference count, and kernel C c=
ode
>>>> routinely takes its own references to such a page. A page owned by the
>>>> slab allocator must not have references taken to it, but it can still
>>>> show up in places such as a bio vector. A frozen page has a reference
>>>> count of zero and is exclusively owned by the party that allocated it.
>>>>
>>>> A single `Page` type cannot describe all of these. This series makes
>>>> `Page` generic over a sealed `PageKind` that describes what is known a=
bout
>>>> the page:
>>>>
>>>>  - `Page<Base>` is the base kind. Nothing is known about the page
>>>>    beyond the validity of the `struct page`.
>>>>  - `Page<RefCounted>` is the default kind. The page is managed by the
>>>>    page reference count, and `Page<RefCounted>` implements
>>>>    `AlwaysRefCounted`.
>>>>  - `Page<Exclusive>` is a uniquely owned frozen page whose data area
>>>>    follows standard Rust aliasing rules, so the data is available as
>>>>    `&[u8]` and `&mut [u8]`. It is handled through
>>>>    `Owned<Page<Exclusive>>` and is the first in-tree user of `Owned`.
>>>>  - `Page<Frozen>` is a frozen page whose allocation is uniquely owned.
>>>>    Unlike for `Page<Exclusive>`, nothing is known about who accesses t=
he
>>>>    data of the page, so the data is only available through the unsafe
>>>>    raw accessors.
>>>
>>> Why do we need to allocate Page<Frozen> when we can allocate Page<Exclu=
sive>?
>>> To me, Page<Frozen> is an observed page state from a non-owner point
>>> of view.
>>
>> I'm not sure we need it, which is why I added this note:
>>
>>  This currently has no users, but I add it here for completeness. Let's
>>  discuss if we should keep it or not.
>>
>> The difference between the `Page<Frozen>` and `Page<Exclusive>` is that
>> `Page<Exclusive>` has stronger invariants. Namely that the (physical)
>> memory region of the page does not incur data races, and that the page
>> not in highmem. From a Rust point of view, this allows us to obtain a
>> reference to the page contents without jumping through any hoops.
>
> But access to memory region of the page is associated with page table
> mapping or IOMMU mapping (for device, and I assume devices are accessing
> data via virtual addresses instead of physical addresses to avoid further
> complication). It seems that you are trying to use page refcount =3D=3D 0
> to infer that no page table mapping exists for the page. But how about
> kernel direct map?

`Page<Exclusive>` has the invariant that it must not be in highmem, and
as such is always accessible in the kernel virtual address space. As far
as I understand, this means we do not need `kmap_local` before accessing
the contents.

> Anyone with struct page can use kmap_local*()
> to get kernel direct map and access the page content. kmap_local*()
> does not reject frozen pages.

`Page<Exclusive>` is a unique handle. Nobody can get a hold of the
underlying `struct page` to perform mapping operations on the page.

>
>>
>> I do not have a user for a frozen page without these invariants, but I
>> would assume there are use cases?
>
> For the above reason, everything is Page<Frozen>?

Pages that are part of user space process vmas are not frozen? We see
these in system calls for IO.

>
>>
>>> In core-mm, a page is frozen, when its refcount =3D=3D 0. The code look=
ing
>>> at the page knows the page is exclusively owned by others. If the code
>>> allocates a frozen page, it will not check its refcount, because
>>> the code knows it has the exclusive ownership of the page. To reflect
>>> this, the code calling alloc_frozen_pages() should just get
>>> Page<Exclusive>
>>
>> Is it always the case that users of frozen pages will use them in such a
>> way that they can guarantee no races to the page contents (physical
>> memory)? They cannot be mapped for DMA access or anything like that -
>> that always requires a refcount?
>
> See kmap_local*() case above.

Right. Both `Page<Frozen>` and `Page<Exclusive>` are guaranteed to be
the only reference the underlying `struct page`, and so nobody can do
mapping operations from under us. The difference of the two is that
`Page<Exclusive>` provides guarantees about placement out of highmem and
no races on the page contents.

>
>>
>>> and if the code encounters a Page<Base> and finds it has no refcount,
>>> it should convert it to Page<Frozen> or there should be a method
>>> that accepts PFN and return Page<Frozen> if the page of the PFN has no
>>> refcount, for PFN walkers.
>>
>> We can add conversion functions, that makes sense.
>>
>>>
>>> =E2=80=9Cthe data=E2=80=9D mentioned in Page<Exclusive> and Page<Frozen=
> is struct page
>>> data or the data in the physical frame pointed by Page<...>? If it
>>> is the former, is it better to use metadata?
>>
>> I'm referring to the actual physical memory region that the struct page
>> describes.
>>
>>>
>>> I am new to Rust, so feel free to correct me. Thanks. :)
>>>
>>
>> I'm new to mm, I really appreciate your eyes on this.
>
> Do you mind describing the high level workflow around Page in Rust?
> From my point of view, exclusive page content access is more related
> to page table (including IOMMU page table) than struct page itself.
> struct page ownership is more about the metadata stored in struct
> page for physical memory maintenance.

Just as in C code, there are many workflows around `Page`. Three main
ones I have seen in Rust code are:

- Pages that are part of io buffers during a syscall. The pages are
  mapped in at least one user space process and the kernel may want to
  read or write from/to them. These would be `Page<RefCounted>`.

- Pages that hit the block device driver API via the block layer. These
  can be anything, so we model them as `Page<Base>`.

- Pages used for backing storage like in the null block driver. These
  are modeled as `Page<Exclusive>`.

I think for the first one, binder is inserting and removing pages from
vmas to do it's IPC thing.

If someone were to write an allocator of some kind, they would probably
reach for the `Page<Frozen>`, as they would like to have ownership of
the metadata, but not the contents.

Best regards,
Andreas Hindborg

