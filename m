Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FFF215F7D;
	Sat, 31 Jan 2026 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769865593; cv=none; b=geWO8fJco+/3KCzgzOiv+7SSM+Fe+JxTsr3yflHnCRcGjkZa30lRi66K3kMDxXJN5tKTWTvDiosjByLbqqHtnaHt6xPJwLDQTJBKl2w75uHE4SWSVWU2fY0F12tKVOJFfzkOI8wnJFLekLoBMY1kU59BVr0Ii0XDYoTSAWwNJTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769865593; c=relaxed/simple;
	bh=hpLMprqmU96X1jlEjOAIBVjg0zmuYcko4wHzx0pcMwg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QcGYKxumfjxIrHTHqO2UiSSan4TrR5CNbRtAAhVoALKeCHEWUSwpMnAUFCkDag9+UOhO4HLWIVpRiRNRhQa3wv7/RObxPgXNFjr3Ooad7qdIdrSDxQXY02j8halNUHd/jypkoFySU6JTZQrcS3DOy5guvLmtA6hoNLkZwbIRj3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=raFdNyNK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="raFdNyNK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DE5C4CEF1;
	Sat, 31 Jan 2026 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769865592;
	bh=hpLMprqmU96X1jlEjOAIBVjg0zmuYcko4wHzx0pcMwg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=raFdNyNKMhvljTagI6mgSaAkzFUiAQdloKJFOxJbSez5j31aU8E/DTwo+EOOMZ6qC
	 Eia1kN7gmmD6hOSTNRd3z7H3i5915JdEvv83h+QiY42kHhcxBlyxu0kHOfnTsvFFGG
	 UH8PxeBfHsj/fWJu0+N8J5KAKKn8KYoFGlg2iC86w4Y6b57cEz9JdLKjqsE1F8M5Pu
	 0V1fLk3ArMKaZ3U1PA48j55HoRFoE9JH2wgF3WOaf5fUmx/0jP8/ipvPqn0ToW/m4t
	 9vqFDFEAdEC4gepMXUsjnjloH2HKMXWzOGSHiu4wAYn85hv2HqAInN5q+RBN19E8ON
	 s0Ui3TAK6Ku6A==
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
In-Reply-To: <aX0lcVngRcRwqgd5@tardis.local>
References: <877bszrz37.fsf@t14s.mail-host-address-is-not-set>
 <a8nHDdzac5l20akcxjjf9w7huObjn4eIHjUI-A17aKEwWl1N-4vvLBiVdqTQbBHwypMIA6gNkzm8YFXmMl44ew==@protonmail.internalid>
 <DG1ZJ1350EMS.1S1360PA496QG@garyguo.net>
 <874io3rwl3.fsf@t14s.mail-host-address-is-not-set>
 <iFJVkpTMbd-NR24OHYTJj8lr4dw7MwCQ9rJWiuRZFgK3JRDhIIAcpf5Z24viL5qHhkrPzpnKfvX7JS6X_VO2vg==@protonmail.internalid>
 <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net>
 <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
 <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid>
 <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <-5tKAwUVrj6fo337a8NWsHQBepB07jKIVI-VafwW1zp0vsGTCkBTuI5nCBniftYJePZy8kb7bhWptJ2Gc_B-kQ==@protonmail.internalid>
 <aX0lcVngRcRwqgd5@tardis.local>
Date: Sat, 31 Jan 2026 14:19:05 +0100
Message-ID: <87pl6prkc6.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun@kernel.org> writes:

> On Fri, Jan 30, 2026 at 05:20:11PM +0100, Andreas Hindborg wrote:
> [...]
>> >> In the last discussions we had on this, the conclusion was to use
>> >> `volatile_copy_memory` whenever that is available, or write a volatile
>> >> copy function in assembly.
>> >>
>> >> Using memcpy_{from,to}io is the latter solution. These functions are
>> >> simply volatile memcpy implemented in assembly.
>> >>
>> >> There is nothing special about MMIO. These functions are name as they
>> >> are because they are useful for MMIO.
>> >
>> > No. MMIO are really special. A few architectures require them to be accessed
>> > completely differently compared to normal memory. We also have things like
>> > INDIRECT_IOMEM. memory_{from,to}io are special as they use MMIO accessor such as
>> > readb to perform access on the __iomem pointer. They should not be mixed with
>> > normal memory. They must be treated as if they're from a completely separate
>> > address space.
>> >
>> > Normal memory vs DMA vs MMIO are all distinct, and this is demonstrated by the
>> > different types of barriers needed to order things correctly for each type of
>> > memory region.
>> >
>> > Userspace-mapped memory (that is also mapped in the kernel space, not __user) is
>> > the least special one out of these. They could practically share all atomic infra
>> > available for the kernel, hence the suggestion of using byte-wise atomic memcpy.
>>
>> I see. I did not consider this.
>>
>> At any rate, I still don't understand why I need an atomic copy function, or why I
>> need a byte-wise copy function. A volatile copy function should be fine, no?
>>
>
> but memcpy_{from,to}io() are not just volatile copy functions, they have
> additional side effects for MMIO ;-)

Alright. For the sake of my curiosity, could you explain these
additional side effects and the way thy are handled in the
implementation of these functions?

>
>> And what is the exact problem in using memcpy_{from,to}io. Looking at
>> it, I would end up writing something similar if I wrote a copy function
>> myself.
>>
>> If it is the wrong function to use, can you point at a fitting funciton?
>>
>
> I *think* for your use cases, a `user_page.read_volatile()` should
> suffice if the only potential concurrent writer is in the userspace
> (outside the Rust AM). The reason/rule I'm using is: a volatile
> operation may race with an access that compiler can know about (i.e.
> from Rust and C code), but it will not race with an external access.

That is my reasoning as well.

>
> However, byte-wise atomic memcpy will be more defined without paying any
> extra penalty.

Could you explain the additional penalty of `core::ptr::read_volatile`
vs `kernel::sync::atomic::Atomic::load` with  relaxed ordering?


Best regards,
Andreas Hindborg


