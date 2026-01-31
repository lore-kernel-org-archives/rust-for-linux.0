Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8902D8DBB;
	Sat, 31 Jan 2026 20:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769890840; cv=none; b=TYTSbknT3EBrdmWWOeLIgUJcx6RzXREVnjzWcpYN7vqksHfks7nxb+mNit1sJe7et6mrbJ50f4wxet+RXy9WLCyxEh7L/Xmn91/5yC+ydJwPCuW2pJBTBiKzZ88dxLPRFkXMKJO7JyYFtD58iGFeSCdgb6rUry1k2pO7fGkTzV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769890840; c=relaxed/simple;
	bh=E+FjPUDD2STzZ2F+mu5i9jIX+oL2Q7gCtZ2tAaA3UF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TB85kLHq3puCA4eri01WCdba2Y47WECxE9+VFUCaZiMvbUfVy+Mdu5PejYTeYcsBE2vSnJ6mAQlM42DxxgLVIml2lsFtN9GGtdVxZI4x1HFyotuW3xXYg1jkPlXQ9PCN5ELekuopD1mAFj5SnwMx+XXVUNmi0LnLYfUSZOsUJIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njAGVM34; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njAGVM34"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37329C4CEF1;
	Sat, 31 Jan 2026 20:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769890840;
	bh=E+FjPUDD2STzZ2F+mu5i9jIX+oL2Q7gCtZ2tAaA3UF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=njAGVM34VN4KkdyLiFE680zZD4k/uvAXGOGINgsC6VgUuisU/n9ObPoRQRUDjphqv
	 HZGoaTt49tMV4uNX1HjqLI4DPvO1fvdjKc23EW/BrOULSEsDG3EsSztB9ijEY+jewy
	 81Gaq5X7LpLBZ7cE/QSymvGg0zxdIOVzAOwkBu5hFQcqXTyyhm9gw8S9AitSduTMPN
	 BmQpFmTIaXYmg1mgQycVwQ2NkNE2leuu8N9w1RVhfXep8wv4tIw4W9Qj3E6aqdFbgH
	 BucEFwIjiW4LiMhzMNAE9JuxP2kjNAIH/k46rRlHQijdKZWHvKdS9MB/RdMq1L1VIp
	 2vbhPtqTez0zg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Boqun Feng <boqun@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
In-Reply-To: <aX5YWdBxPmPrTLDA@tardis.local>
References: <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
 <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid>
 <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <-5tKAwUVrj6fo337a8NWsHQBepB07jKIVI-VafwW1zp0vsGTCkBTuI5nCBniftYJePZy8kb7bhWptJ2Gc_B-kQ==@protonmail.internalid>
 <aX0lcVngRcRwqgd5@tardis.local>
 <87pl6prkc6.fsf@t14s.mail-host-address-is-not-set>
 <DceHeOJQ2ZdVoA8jlWqMpTO6bHsSLi-JNu4iXSpnMetXsYWKkLkv7vGSdHqqNIVV4XnkW5SfReAA9dDoUENEIw==@protonmail.internalid>
 <aX4xNxsF5Qs0CTPW@tardis.local>
 <87jywxr42q.fsf@t14s.mail-host-address-is-not-set>
 <TFt9ABV5Iu9YWftctEzCIUk8W7mK1fVRsvxtIZi1ex8Eq1fi-Xc3SrNODFWkm9nHMB7ySTmcXCJT5cL2PW9kHA==@protonmail.internalid>
 <aX5YWdBxPmPrTLDA@tardis.local>
Date: Sat, 31 Jan 2026 21:20:29 +0100
Message-ID: <87ecn5r0tu.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun@kernel.org> writes:

> On Sat, Jan 31, 2026 at 08:10:21PM +0100, Andreas Hindborg wrote:
>> "Boqun Feng" <boqun@kernel.org> writes:
>>
>> > On Sat, Jan 31, 2026 at 02:19:05PM +0100, Andreas Hindborg wrote:
>> > [..]
>> >> >
>> >> > However, byte-wise atomic memcpy will be more defined without paying any
>> >> > extra penalty.
>> >>
>> >> Could you explain the additional penalty of `core::ptr::read_volatile`
>> >> vs `kernel::sync::atomic::Atomic::load` with  relaxed ordering?
>> >>
>> >
>> > I don't understand your question, so allow me to explain what I meant:
>> > for the sake of discussion, let's assume we have both
>> >
>> > 	fn volatile_copy_memory(src: *mut u8, dst: *mut u8, count: usize)
>> >
>> > and
>> >
>> > 	fn volatile_byte_wise_atomic_copy_memory(<same signature>, ordering: Ordering)
>> >
>> > implemented. What I meant was to the best of my knowledge, when ordering
>> > = Relaxed, these two would generate the exact same code because all the
>> > architectures that I'm aware of have byte wise atomicity in the
>> > load/store instructions. And compared to volatile_copy_memory(),
>> > volatile_byte_wise_atomic_copy_memory() can bear the race with another
>> > volatile_byte_wise_atomic_copy_memory() or any other atomic access
>> > (meaning that's not a UB). So I'd prefer using that if we have it.
>>
>> Ok, thanks for clarifying. I assumed you were referring to the other
>> functions I mentioned, because they exist in `kernel` or `core`.
>> `volatile_copy_memory` is unstable in `core`, and as far as I know
>> `volatile_byte_wise_atomic_copy_memory` does not exist.
>
> I was using volatile_byte_wise_atomic_copy_memory() to represent the
> concept that we have a volatile byte-wise atomic memcpy. I was trying to
> discuss the performance difference (which is 0) between a "volatile
> memory copy" and "a volatile byte-wise atomic memory copy" based on
> these concepts to answer your question about the "penalty" part of my
> previous reply.
>
>>
>> When you wrote `read_volatile`, I assumed you meant
>> `core::ptr::read_volatile`, and the atomics we have are
>> `kernel::sync::atomic::*`.
>
> It was the curse of knowledge, when I referred to "byte-wise atomic
> memcpy", I meant the concept of this [1], i.e. a memcpy that provides
> atomicity of each byte.
>
> [1]: https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2022/p1478r7.html
>
>>
>> So now I am a bit confused as to what method you think is usable here.
>> Is it something we need to implement?
>>
>
> First, since the length of the copy is not fixed, we will need something
> like `volatile_copy_memcpy()` to handle that. So I need to take back my
> previous suggestion about using `read_volatile()`, not because it would
> cause UB, but because it doesn't handle variable lengths.

We could call it in a loop? Would that be inefficient?

>
> But if there could be a concurrent writer to the page we are copying
> from, we need a `volatile_byte_wise_atomic_copy_memory()` that we need
> either implement on our own or ask Rust to provide one.
>
> Does this help?

Yes, this is all super helpful and much appreciated. Thanks!


Best regards,
Andreas Hindborg



