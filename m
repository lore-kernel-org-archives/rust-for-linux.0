Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030490;
	b=ZFCt5c9CZg+x1/2H/g6KmCDeSo6NPBTPqDctWj14rIvbQUD/9OQ0dQBUE4wmJx0Fsaba
	 pbYB6bRyAlR3nEAEa9aE+FLfQcm0HwF4KGwC1Za5WymvHdlybbkWCZTdEBrL4+qgbJgE2
	 EH3oFezXwcFsj9AaQvyJt6SMSAFd+to7X4FAgmDbrPneziC7fN0ZFkNnIuED1JMb8FyrN
	 vYb26UaGOKSheo8vuM26bB25H3+MVssSWzzgjm/SWX7VRVFH1bon4ljgD/gdVIBkb2W51
	 giqYjuqXFUhIFIjV3BDHR0+b5h5bZt3ofOPlCOViNv9d2J0092lBt77baiHkhoz27Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030490;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8RxXpz7hlprBpizDk9lL07D5e79Ppid8aeCKYprG2ME=;
	b=jSb4SQJT/QsCOCjdyndkdVn5SY+Q/Id2+BzQhpw3KJ1sMBKwfHR0BR+RUEHKFa1TTGt0
	 1r+qt2IthUqwOmKbTQyWAngBI/SU43hliWQLMH1/5FGpxkvT1cwMFNIfjVTih6C5vnT+I
	 h1kzn2TzqKMdo7Twnjjy49CpDXtlbQaAeBK5M/ch/Nh8MJWrckVfq1eqCNvWC3Cpjxih7
	 gbyypg/K3zOivwd6fLZFavQ9AVuVVCOpnrZqa7yF4/6SSpA4g20B/IRmuZ4eKuUjx2l1k
	 NGFTSZXH2UWa9Ak+fELle37NBRwJeSolI23CTJwUJLIeGzSf/SRP/Y3iOg4N4neK15A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=caoGkr+z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD99606BB51;
	Wed, 18 Nov 2026 19:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=caoGkr+z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529431F000C4;
	Wed, 18 Nov 2026 19:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795030490;
	bh=8RxXpz7hlprBpizDk9lL07D5e79Ppid8aeCKYprG2ME=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=caoGkr+zi/fmbkrr6iGkrj0lzntp1e/kLAEuFcRbtktyvJK3yN3X8rgZDmtbwYUQr
	 6ytq8smNIkQQivbFExvo7pKBefVUcpxEXMIxFKWiDjN7pNkIeHK8C/p53IGsVfgFMh
	 Q1vr3TshI+heEGfti+KqZJHs5fkBzaCGPG5RZn9LR8jfuGr1LQChhKuQRv2bZZvuZp
	 zHuqWeftO6eyNXWCaPUbRiH1I9XDagZin13eFA2ReaVkEN4yOSjcOfVN8pR6ccYZ1K
	 h8j7JIthGjIqSk0TsFcWwqmR+H1FrUWSPuLwwIz4lSwQdkAzIA8tsTitcQ3VsAdUpq
	 GZT0wyHNfvUGg==
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
In-Reply-To: <37B6D4A8-288E-40E8-9214-EDABBFE49C39@nvidia.com>
References: <20261118-page-ownable-v22-0-d63ff73f4075@kernel.org>
 <37B6D4A8-288E-40E8-9214-EDABBFE49C39@nvidia.com>
Date: Wed, 18 Nov 2026 20:34:33 +0100
Message-ID: <871p8iue5y.fsf@t14s.mail-host-address-is-not-set>
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

> On 18 Nov 2026, at 11:18, Andreas Hindborg wrote:
>
>> Note: The page patches were part of the `Ownable` series [1] until v21.
>> This series continues the version numbering of that series, and it depen=
ds
>> on v22 of that series for `Ownable`, `Owned` and the split of `RefCounte=
d`
>> and `AlwaysRefCounted`.
>>
>> Not all pages can be treated the same way. A page allocated with
>> `alloc_pages()` is managed by the page reference count, and kernel C code
>> routinely takes its own references to such a page. A page owned by the
>> slab allocator must not have references taken to it, but it can still
>> show up in places such as a bio vector. A frozen page has a reference
>> count of zero and is exclusively owned by the party that allocated it.
>>
>> A single `Page` type cannot describe all of these. This series makes
>> `Page` generic over a sealed `PageKind` that describes what is known abo=
ut
>> the page:
>>
>>  - `Page<Base>` is the base kind. Nothing is known about the page
>>    beyond the validity of the `struct page`.
>>  - `Page<RefCounted>` is the default kind. The page is managed by the
>>    page reference count, and `Page<RefCounted>` implements
>>    `AlwaysRefCounted`.
>>  - `Page<Exclusive>` is a uniquely owned frozen page whose data area
>>    follows standard Rust aliasing rules, so the data is available as
>>    `&[u8]` and `&mut [u8]`. It is handled through
>>    `Owned<Page<Exclusive>>` and is the first in-tree user of `Owned`.
>>  - `Page<Frozen>` is a frozen page whose allocation is uniquely owned.
>>    Unlike for `Page<Exclusive>`, nothing is known about who accesses the
>>    data of the page, so the data is only available through the unsafe
>>    raw accessors.
>
> Why do we need to allocate Page<Frozen> when we can allocate Page<Exclusi=
ve>?
> To me, Page<Frozen> is an observed page state from a non-owner point
> of view.

I'm not sure we need it, which is why I added this note:

 This currently has no users, but I add it here for completeness. Let's
 discuss if we should keep it or not.

The difference between the `Page<Frozen>` and `Page<Exclusive>` is that
`Page<Exclusive>` has stronger invariants. Namely that the (physical)
memory region of the page does not incur data races, and that the page
not in highmem. From a Rust point of view, this allows us to obtain a
reference to the page contents without jumping through any hoops.

I do not have a user for a frozen page without these invariants, but I
would assume there are use cases?

> In core-mm, a page is frozen, when its refcount =3D=3D 0. The code looking
> at the page knows the page is exclusively owned by others. If the code
> allocates a frozen page, it will not check its refcount, because
> the code knows it has the exclusive ownership of the page. To reflect
> this, the code calling alloc_frozen_pages() should just get
> Page<Exclusive>

Is it always the case that users of frozen pages will use them in such a
way that they can guarantee no races to the page contents (physical
memory)? They cannot be mapped for DMA access or anything like that -
that always requires a refcount?

> and if the code encounters a Page<Base> and finds it has no refcount,
> it should convert it to Page<Frozen> or there should be a method
> that accepts PFN and return Page<Frozen> if the page of the PFN has no
> refcount, for PFN walkers.

We can add conversion functions, that makes sense.

>
> =E2=80=9Cthe data=E2=80=9D mentioned in Page<Exclusive> and Page<Frozen> =
is struct page
> data or the data in the physical frame pointed by Page<...>? If it
> is the former, is it better to use metadata?

I'm referring to the actual physical memory region that the struct page
describes.

>
> I am new to Rust, so feel free to correct me. Thanks. :)
>

I'm new to mm, I really appreciate your eyes on this.


Best regards,
Andreas Hindborg


