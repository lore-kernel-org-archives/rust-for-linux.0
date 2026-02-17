Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5260036AB78;
	Tue, 17 Feb 2026 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336613; cv=none; b=r7vTc4Ki2bivp4Aj7j6JyOpEY/U37te3HcFpCzZhPEBWDz6r303TejG8ZGU5e9OlTiilRpUNlDrLM5rz/wjg0R5C3nvHfdTWks6T2K/9xPvwas5QrLE6NqN2Q+rKyG9jb3Asx6JPLh4cfDxDLgQBChCm6wO2bBkTwrOIRWnV8wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336613; c=relaxed/simple;
	bh=Iy8wdT/7KAZeU5VN9H+5axw4leXfO3No4pUMNhfmehA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cV4HvU/rR80R4d3dKqtdhb1jg/49jd1krT0JSLf1xU/ahJt4kJZscteA3h2t6yI3rET2mqI3Z1vF6763KPl0k/EATaWdJ/cJExLlKb2x4G0d+ZIkAmLeTc0eN5H3ol1h4kCZCnAhDB2Vqx3c7ggQevvmM5lh93oJqYj7u5fHlzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAH8TVyK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAH8TVyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16983C4CEF7;
	Tue, 17 Feb 2026 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771336613;
	bh=Iy8wdT/7KAZeU5VN9H+5axw4leXfO3No4pUMNhfmehA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LAH8TVyKuqZ1PTZK2SPxb77WGWq9rrJnTXa8+AaHsLa8LU33ezmTFDSf9iiuYgzki
	 KSMC1o18J22PW2j9Yl0y0Aa4PYgizeauOPWSsffdEInipCNLZz4O/6vmmCPeqb6Ki9
	 Y47RTHZib0CZBu0JDyhPZ9iSuJK4gLu6gHtfwep5/yv5ZkXi1ED3A3DtLdPhpwAJJw
	 zSL6YukxGYdam1yXs/MTSZ4KJ+UI6Cz5MVqbPId7qWo18iAVJ3zQJ7S34x/c3izW/5
	 H5mVWCmKlxykBZdJD3fVhfz1S+f/Obtbd6MVSfkTtXrGy0HFrBrjBAy7jtAr6/pcjJ
	 qdYINAgGknjOQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
In-Reply-To: <aZRWOIPThLfIZ1Ph@google.com>
References: <aY9HD7nH5A-DtgmR@tardis.local>
 <2026021326-stark-coastline-c5bc@gregkh> <aY9PBfx3RRV7rXZ5@tardis.local>
 <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com>
 <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com>
 <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com>
 <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <kkmXYWYC07oImDD0FJFVCCWl45alQdraRLHoLr7zowZfE0tMz0MmPIpuyEYQRSLjBQqrp_Ch0iR2Rix_g49lNg==@protonmail.internalid>
 <aZRWOIPThLfIZ1Ph@google.com>
Date: Tue, 17 Feb 2026 14:56:40 +0100
Message-ID: <87ecmjcw2v.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Tue, Feb 17, 2026 at 12:09:11PM +0100, Peter Zijlstra wrote:
>> On Tue, Feb 17, 2026 at 10:47:03AM +0000, Alice Ryhl wrote:
>> > > > 	// OK!
>> > > > 	unsigned long *a, b;
>> > > > 	b = READ_ONCE(a);
>> > > > 	if is_valid(b) {
>> > > > 	    // do stuff
>> > > > 	}
>> > > >
>> > > > Now consider the following code:
>> > > >
>> > > > 	// Is this ok?
>> > > > 	unsigned long *a, b;
>> > > > 	memcpy(a, &b, sizeof(unsigned long));
>> > > > 	if is_valid(b) {
>> > > > 	    // do stuff
>> > > > 	}
>> > >
>> > > Why the hell would you want to write that? But sure. I think similar but
>> > > less weird example would be with structures, where value copies end up
>> > > being similar to memcpy.
>> >
>> > I mean sure, let's say that it was a structure or whatever instead of a
>> > long. The point is that the general pattern of memcpy, then checking the
>> > bytes you copied, then use the bytes you copied, is potentially
>> > susceptible to this exacty optimization.
>>
>> > > And in that case, you can still use volatile and compiler must not do
>> > > silly.
>> >
>> > What you mean by "volatile" here is the same as what this patch means
>> > when it says "per-byte atomic". If you agree that a "volatile memcpy"
>> > would be a good idea to use in this scenario, then it sounds like you
>> > agree with the patch except for its naming / terminology.
>>
>>   struct foo {
>>     int a, b;
>>   };
>>
>>   struct foo *ptr, val;
>>
>>   val = *(volatile struct foo *)ptr;
>>
>> why would we need a an explicit new memcpy for this?
>
> In my experience with dealing with `struct page` that is mapped into a
> vma, you need memcpy because the struct might be split across two
> different pages in the vma. The pages are adjacent in userspace's
> address space, but not necessarily adjacent from the kernel's POV.
>
> So you might end up with something that looks like this:
>
> struct foo val;
> void *ptr1 = kmap_local_page(p1);
> void *ptr2 = kmap_local_page(p2);
> memcpy(ptr1 + offset, val, PAGE_SIZE - offset);
> memcpy(ptr2, val + offset, sizeof(struct foo) - (PAGE_SIZE - offset));
> kunmap_local(ptr2);
> kunmap_local(ptr1);
>
> if (is_valid(&val)) {
>     // use val
> }
>
> This exact thing happens in Binder. It has to be a memcpy.
>
>> > > So I'm still not exactly sure why this is a problem all of a sudden?
>> >
>> > I mean, this is for `struct page` specifically. If you have the struct
>> > page for a page that might also be mapped into a userspace vma, then the
>> > way to perform a "copy_from_user" operation is to:
>> >
>> > 1. kmap_local_page()
>> > 2. memcpy()
>> > 3. kunmap_local()
>> >
>> > Correct me if I'm wrong, but my understanding is that on 64-bit systems,
>> > kmap/kunmap are usually complete no-ops since you have enough address
>> > space to simply map all pages into the kernel's address space. Not even
>> > a barrier - just a `static inline` with an empty body.
>>
>> That is all correct -- however that cannot be all you do.
>>
>> Any shared memory will involved memory barriers of a sort. You cannot
>> just memcpy() and think you're done.
>>
>> So yeah, on x86_64 those 1,2,3 are insufficient to inhibit the re-load,
>> but nobody should ever just do 1,2,3 and think job-done. There must
>> always be more.
>>
>> If it is a ring-buffer like thing, you get:
>>
>>          *   if (LOAD ->data_tail) {            LOAD ->data_head
>>          *                      (A)             smp_rmb()       (C)
>>          *      STORE $data                     LOAD $data
>>          *      smp_wmb()       (B)             smp_mb()        (D)
>>          *      STORE ->data_head               STORE ->data_tail
>>          *   }
>>
>> if it is a seqlock like thing you get that.
>>
>> If it is DMA, you need dma fences.
>>
>> And the moment you use any of that, the re-load goes out the window.
>
> I don't know how Andreas is using this, but the usage pattern I'm
> familiar with for `struct page` from my work on Binder is this one:
>
> 1. memcpy into the page
> 2. return from ioctl
> 3. userspace reads from vma
>
> or
>
> 1. userspace writes to vma
> 2. call ioctl
> 3. kernel reads from page
>
> which needs no barriers whatsoever. There is nothing to prevent this
> kind of optimization in this kind of code, so an evil userspace could
> trigger TOCTOU bugs in the kernel that are not present in the source
> code if the code was optimized like I described.

I'm processing disk IO in the Rust null block driver. The pages backing
the IO requests may be simultaneously mapped to user space, so there is
no way to guarantee that there is no concurrent memory operation to/from
the memory area. User space programs can do whatever.

I don't have any control flow depending on the data I copy. I just store
it somewhere and return it if a read IO for the same sector arrive.

Let me add a bit of context as to why I sent this patch. I am not an
expert on the finer details of this subject, so I rely on available
expertise in our community. It is my understanding that copying the
memory in the situation outlined above, without special consideration
(in Rust) would be undefined behavior. Such are the rules of the
language. Of course I don't want undefined behavior in the Rust null
block driver. When asked how to solve this, the experts suggested
defining this byte-wise atomic memory copy function, A function that
would have well defined behavior in this particular situation.

That seems like a reasonable course of action to me. I don't understand
why this is such a big deal, and I don't understand the need to use
aggressive language and swearing.

I would suggest that if we are failing to understand each other, or if
we are miscommunicating, let's be curious instead of angry. It get's us
to where we want to be, way faster. And it is a much more pleasant
journey.


Best regards,
Andreas Hindborg


