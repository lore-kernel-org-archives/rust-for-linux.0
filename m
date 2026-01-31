Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E703612D8;
	Sat, 31 Jan 2026 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769891456; cv=none; b=uZD/9vQtSvZIV2C8p5hTxeeE1jq8+y3HFmURPdeTEvGaMyn42picIvLJnzQrhgaAClLYMpzVrwnFZDlhbpUj9t/WmhcilPnZFXoikmE+bu3HeJWAICzhrhhYf7aUOiouf4jZz4dz7oVHP2nChZeSTSSiH9FM5izND6WySnjjD1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769891456; c=relaxed/simple;
	bh=WPzfXLiw+0WylfHXpZX+CPos8JHMNZqhmeoO4ET2zvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IssDhW6YKFXpNkpeSNvWsMMM+zeP1/ok/OjRpWcpNJrbL0p3qn1F1QbGbog2CUkbeBDVrjsS/7zl4WqNvFAAccLGj8QyXpGvSEpt1ZqNecedC2w4mMYKKw8eA7I2qCCo+e3Jk9kJXKSLaqBJGNP8ymCXsiIaszC7pt5ybyZt58Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYifUOel; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYifUOel"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A715C4CEF1;
	Sat, 31 Jan 2026 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769891456;
	bh=WPzfXLiw+0WylfHXpZX+CPos8JHMNZqhmeoO4ET2zvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fYifUOelQyOosgKMVrK3MOBpzgqd54tRDlRzqLA39Xa2fklx4FPVfKZO2MO6Ufne2
	 WgcgZrZnfpKvZ9NMLVmdMDOaQyVUBVJGD0AFVMoO5VJ8ePcCMO12lJj1vhFwmwXkTk
	 fVavI+h1CbWPSLtfeTOK0CISh8WG3UC1ZZSnCxtpqsXvVVgGGF+qm3xsWptawd6B8K
	 TJuvocvXgM59P8EIyRZRNJW2DmwvVQcYm9rsNwj6gM0+l+eS5jVCq0Z/g7vORJ3KwL
	 QI70A8KtSk4sLqJwEuGUARiJtXsP+YesgtlYgvlibMaFvR3KeIlgJXG1S48iUv0oaB
	 bhft8ojOq2tkQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Boqun Feng <boqun@kernel.org>
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
In-Reply-To: <DG2WLWJD8V5W.2I24LZKS6JG6Q@garyguo.net>
References: <a8nHDdzac5l20akcxjjf9w7huObjn4eIHjUI-A17aKEwWl1N-4vvLBiVdqTQbBHwypMIA6gNkzm8YFXmMl44ew==@protonmail.internalid>
 <DG1ZJ1350EMS.1S1360PA496QG@garyguo.net>
 <874io3rwl3.fsf@t14s.mail-host-address-is-not-set>
 <iFJVkpTMbd-NR24OHYTJj8lr4dw7MwCQ9rJWiuRZFgK3JRDhIIAcpf5Z24viL5qHhkrPzpnKfvX7JS6X_VO2vg==@protonmail.internalid>
 <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net>
 <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
 <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid>
 <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <aX0lcVngRcRwqgd5@tardis.local>
 <SEV7bR_nyQNtvtgoO8X80HMkMTPLW_6roBSxJ-MpKHHNmkZQyVxSS9k1iFV7-bgAlHSLM566L8EqtRBnht65uA==@protonmail.internalid>
 <aX2tyn9nBUEKM-SN@tardis.local>
 <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>
 <gKLHFGuJqzRyjCupif-LFYn2ZY6OmhkyYj6idYTOnN4zMmNacFLBD1G9zzsYpTJn13GGvL0i-7JA-lIlBgakgQ==@protonmail.internalid>
 <DG2WLWJD8V5W.2I24LZKS6JG6Q@garyguo.net>
Date: Sat, 31 Jan 2026 21:30:46 +0100
Message-ID: <87bji9r0cp.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Sat Jan 31, 2026 at 1:34 PM GMT, Andreas Hindborg wrote:
>> "Boqun Feng" <boqun@kernel.org> writes:
>>
>>> On Fri, Jan 30, 2026 at 01:41:05PM -0800, Boqun Feng wrote:
>>>> On Fri, Jan 30, 2026 at 05:20:11PM +0100, Andreas Hindborg wrote:
>>>> [...]
>>>> > >> In the last discussions we had on this, the conclusion was to use
>>>> > >> `volatile_copy_memory` whenever that is available, or write a volatile
>>>> > >> copy function in assembly.
>>>> > >>
>>>> > >> Using memcpy_{from,to}io is the latter solution. These functions are
>>>> > >> simply volatile memcpy implemented in assembly.
>>>> > >>
>>>> > >> There is nothing special about MMIO. These functions are name as they
>>>> > >> are because they are useful for MMIO.
>>>> > >
>>>> > > No. MMIO are really special. A few architectures require them to be accessed
>>>> > > completely differently compared to normal memory. We also have things like
>>>> > > INDIRECT_IOMEM. memory_{from,to}io are special as they use MMIO accessor such as
>>>> > > readb to perform access on the __iomem pointer. They should not be mixed with
>>>> > > normal memory. They must be treated as if they're from a completely separate
>>>> > > address space.
>>>> > >
>>>> > > Normal memory vs DMA vs MMIO are all distinct, and this is demonstrated by the
>>>> > > different types of barriers needed to order things correctly for each type of
>>>> > > memory region.
>>>> > >
>>>> > > Userspace-mapped memory (that is also mapped in the kernel space, not __user) is
>>>> > > the least special one out of these. They could practically share all atomic infra
>>>> > > available for the kernel, hence the suggestion of using byte-wise atomic memcpy.
>>>> >
>>>> > I see. I did not consider this.
>>>> >
>>>> > At any rate, I still don't understand why I need an atomic copy function, or why I
>>>> > need a byte-wise copy function. A volatile copy function should be fine, no?
>>>> >
>>>>
>>>> but memcpy_{from,to}io() are not just volatile copy functions, they have
>>>> additional side effects for MMIO ;-)
>>>>
>>>
>>> For example, powerpc's memcpy_fromio() has eioio() in it, which we don't
>>> need for normal (user -> kernel) memory copy.
>>
>> Ok, I see. Thanks for explaining. I was only looking at the x86
>> implementation, which is of course not enough.
>>
>>>
>>>> > And what is the exact problem in using memcpy_{from,to}io. Looking at
>>>
>>> I think the main problem of using memcpy_{from,to}io here is not that
>>> they are not volatile memcpy (they might be), but it's because we
>>> wouldn't use them for the same thing in C, because they are designed for
>>> memory copying between MMIO and kernel memory (RAM).
>>>
>>> For MMIO, as Gary mentioned, because they are different than the normal
>>> memory, special instructions or extra barriers are needed.
>>
>> I see, I was not aware.
>>
>>>
>>> For DMA memory, it can be almost treated as external normal memory,
>>> however, different archictures/systems/platforms may have different
>>> requirement regarding cache coherent between CPU and devices, specially
>>> mapping or special instructions may be needed.
>>
>> Cache flushing and barriers, got it.
>>
>>>
>>> For __user memory, because kernel is only given a userspace address, and
>>> userspace can lie or unmap the address while kernel accessing it,
>>> copy_{from,to}_user() is needed to handle page faults.
>>
>> Just to clarify, for my use case, the page is already mapped to kernel
>> space, and it is guaranteed to be mapped for the duration of the call
>> where I do the copy. Also, it _may_ be a user page, but it might not
>> always be the case.
>
> In that case you should also assume there might be other kernel-space users.
> Byte-wise atomic memcpy would be best tool.

Other concurrent kernel readers/writers would be a kernel bug in my use
case. We could add this to the safety requirements.

>
>>
>>>
>>> Your use case (copying between userspace-mapped memory and kernel
>>> memory) is, as Gary said, the least special here. So using
>>> memcpy_{from,to}io() would be overkill and probably misleading.
>>
>> Ok, I understand.
>>
>>> I
>>> suggest we use `{read,write}_volatile()` (unless I'm missing something
>>> subtle of course), however `{read,write}_volatile()` only works on Sized
>>> types,
>>
>> We can copy as u8? Or would it be more efficient to copy as a larger size?
>
> Byte-wise atomic means that the atomicity is restricted to byte level (hence
> it's okay to say if you read a u32 with it and does not observe an atomic
> update). It does not mean that the access needs to be byte-wise, so it's
> perfectly fine to do a 32-bit load and it'll still be byte-wise atomic.

Ah.

>
>>
>> You suggested atomic in the other email, did you abandon that idea?
>
> The semantics we want is byte-wise atomic, although as a impl detail, using
> volatile for now is all that we need.
>
>>
>>> so we may have to use `bindings::memcpy()` or
>>> core::intrinsics::volatile_copy_memory() [1]
>>
>> I was looking at this one, but it is unstable behind `core_intrinsics`.
>> I was uncertain about pulling in additional unstable features. This is
>> why I was looking for something in the C kernel to use.
>>
>> I think `bindings::memcpy` is not guaranteed to be implemented as inline
>> assembly, so it may not have volatile semantics?
>
> In absence of full language LTO as we have today, it'll be fine (in practice).
> Unlike C, if you reference a symbol called "memcpy", it won't be treated as
> special and get turned into non-volatile memcpy.
>
> If the volatile memcpy intrinsics is stable, then we can switch to use that.

Got it, this aligns with what Boqun is writing. Let's go for that.

It also looks like memcpy is implemented in assembly for arm, arm32,
x86_64. Which would exempt it from LTO. Not sure about 32bit x86 though.
It defers to `__memcpy`. I could not figure out what that resolves to.
Is it from the compiler?


Best regards,
Andreas Hindborg


