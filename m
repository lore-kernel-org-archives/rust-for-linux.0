Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7412B23D7EC;
	Sat, 31 Jan 2026 21:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769895083; cv=none; b=pFYPrJ85/sE5NzssSAKsNlh9SjaoVLKCQ5GkIMvjHtn6TFn9WviC/eMDt8pp83PDBbji5sf85G83sDvPbsYeY3GQUvc1jVirAqJd06m/2ne0pzghYBJJDvzCYGGOTyhcTDdo+akLsopD+UhTad44WLi2LpvIoKcf/G6ygk3LLik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769895083; c=relaxed/simple;
	bh=rW9GLjLpKLue5JwGniSpSvStYQRe51vQoxuzZCwTYDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UQamr5z/hC5hXd02jo8pibrrMeT271Mtm5WXPz6B7QddiPp8BvACpUR+NxnhoQrgn+Z3B/wcaCc5rOrQC4FNlMh5qfPLr23hnaDosZmqflcyYT8Vb5DF5t+8/6TN3KC5araQhqcUTApxyWRnhb6lkeu2EgGfW3E1VlMxGg3ES5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mBFb3XMi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mBFb3XMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30075C4CEF1;
	Sat, 31 Jan 2026 21:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769895083;
	bh=rW9GLjLpKLue5JwGniSpSvStYQRe51vQoxuzZCwTYDo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mBFb3XMiuKTBm5bOqI1UNyF2Q4bxGK6HJTHWCKWGtg8yqJRYmiYpiS3i5HxL5bRmW
	 fQo4xiCRLRyNnquu1AZxkZ2pVfZ9S1hnK3JIFg+bKTeTR5JiAjsevC/1ZSSDfGwjde
	 1I6oEpmhJo1cG4bvVF9q3hsRDliCyWbcQPg9AKssKO5h5CjoT4RfYREVVf8Bhk75yN
	 c3acd81rH1xIP02WejcH3G8Kn8mrTJ3pNvUluqSOSogzn6viIiIFqOGc5uWINt+Uj8
	 +UTJ+Azwzw2Xqjgf/58a5SxcZ78JyHbezRA4jWdEp+9FGhUTkrfGZ+RKSuQSIBYmwC
	 lw7vOmZkWT0tg==
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
In-Reply-To: <87bji9r0cp.fsf@t14s.mail-host-address-is-not-set>
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
 <87bji9r0cp.fsf@t14s.mail-host-address-is-not-set>
Date: Sat, 31 Jan 2026 22:31:13 +0100
Message-ID: <878qddqxjy.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> "Gary Guo" <gary@garyguo.net> writes:
>
>> On Sat Jan 31, 2026 at 1:34 PM GMT, Andreas Hindborg wrote:
>>> "Boqun Feng" <boqun@kernel.org> writes:
>>>
>>>> On Fri, Jan 30, 2026 at 01:41:05PM -0800, Boqun Feng wrote:
>>>>> On Fri, Jan 30, 2026 at 05:20:11PM +0100, Andreas Hindborg wrote:
>>>>> [...]
>>>>> > >> In the last discussions we had on this, the conclusion was to use
>>>>> > >> `volatile_copy_memory` whenever that is available, or write a volatile
>>>>> > >> copy function in assembly.
>>>>> > >>
>>>>> > >> Using memcpy_{from,to}io is the latter solution. These functions are
>>>>> > >> simply volatile memcpy implemented in assembly.
>>>>> > >>
>>>>> > >> There is nothing special about MMIO. These functions are name as they
>>>>> > >> are because they are useful for MMIO.
>>>>> > >
>>>>> > > No. MMIO are really special. A few architectures require them to be accessed
>>>>> > > completely differently compared to normal memory. We also have things like
>>>>> > > INDIRECT_IOMEM. memory_{from,to}io are special as they use MMIO accessor such as
>>>>> > > readb to perform access on the __iomem pointer. They should not be mixed with
>>>>> > > normal memory. They must be treated as if they're from a completely separate
>>>>> > > address space.
>>>>> > >
>>>>> > > Normal memory vs DMA vs MMIO are all distinct, and this is demonstrated by the
>>>>> > > different types of barriers needed to order things correctly for each type of
>>>>> > > memory region.
>>>>> > >
>>>>> > > Userspace-mapped memory (that is also mapped in the kernel space, not __user) is
>>>>> > > the least special one out of these. They could practically share all atomic infra
>>>>> > > available for the kernel, hence the suggestion of using byte-wise atomic memcpy.
>>>>> >
>>>>> > I see. I did not consider this.
>>>>> >
>>>>> > At any rate, I still don't understand why I need an atomic copy function, or why I
>>>>> > need a byte-wise copy function. A volatile copy function should be fine, no?
>>>>> >
>>>>>
>>>>> but memcpy_{from,to}io() are not just volatile copy functions, they have
>>>>> additional side effects for MMIO ;-)
>>>>>
>>>>
>>>> For example, powerpc's memcpy_fromio() has eioio() in it, which we don't
>>>> need for normal (user -> kernel) memory copy.
>>>
>>> Ok, I see. Thanks for explaining. I was only looking at the x86
>>> implementation, which is of course not enough.
>>>
>>>>
>>>>> > And what is the exact problem in using memcpy_{from,to}io. Looking at
>>>>
>>>> I think the main problem of using memcpy_{from,to}io here is not that
>>>> they are not volatile memcpy (they might be), but it's because we
>>>> wouldn't use them for the same thing in C, because they are designed for
>>>> memory copying between MMIO and kernel memory (RAM).
>>>>
>>>> For MMIO, as Gary mentioned, because they are different than the normal
>>>> memory, special instructions or extra barriers are needed.
>>>
>>> I see, I was not aware.
>>>
>>>>
>>>> For DMA memory, it can be almost treated as external normal memory,
>>>> however, different archictures/systems/platforms may have different
>>>> requirement regarding cache coherent between CPU and devices, specially
>>>> mapping or special instructions may be needed.
>>>
>>> Cache flushing and barriers, got it.
>>>
>>>>
>>>> For __user memory, because kernel is only given a userspace address, and
>>>> userspace can lie or unmap the address while kernel accessing it,
>>>> copy_{from,to}_user() is needed to handle page faults.
>>>
>>> Just to clarify, for my use case, the page is already mapped to kernel
>>> space, and it is guaranteed to be mapped for the duration of the call
>>> where I do the copy. Also, it _may_ be a user page, but it might not
>>> always be the case.
>>
>> In that case you should also assume there might be other kernel-space users.
>> Byte-wise atomic memcpy would be best tool.
>
> Other concurrent kernel readers/writers would be a kernel bug in my use
> case. We could add this to the safety requirements.
>

Actually, one case just crossed my mind. I think nothing will prevent a
user space process from concurrently submitting multiple reads to the
same user page. It would not make sense, but it can be done.

If the reads are issued to different null block devices, the null block
driver might concurrently write the user page when servicing each IO
request concurrently.

The same situation would happen in real block device drivers, except the
writes would be done by dma engines rather than kernel threads.


Best regards,
Andreas Hindborg


