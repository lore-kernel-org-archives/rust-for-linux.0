Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009DB352C42;
	Sat, 31 Jan 2026 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769866451; cv=none; b=Z8QpDBytP1DhahG63Kar7SOFBDf3vj0blqaG2RMmyrSjLylTy3lJrCdn//D+UW9bpC8Gh95zJfBqjB13Z7CcHuA6xmDa/6AChyI6qfIVVX8FX4nFVEhL+0FL4M4oMnubYhzhycR3JvrsOjgCLX5eycEsrRMKmkC/VfSxpy3/K1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769866451; c=relaxed/simple;
	bh=OSALxL5+MFk5Sj9+OTgyZflH86KfchG0tfgD4nghV9o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pjdIxpxXt7+MDEJxw5U+HIuPwPxywkpCC62wLIkOU+u/62J4QTidrq73KO+L135wUrQc02hd0m19ozjaAVjdQbWXytQ/poBVYDAOYGd8nUVoR55Lz6FcjfjCc6nkONqkRo3q10Zawj0pIM1oEIy60vl4SeLnyUum0h2niKqWV0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmiDtb2b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmiDtb2b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9EBC4CEF1;
	Sat, 31 Jan 2026 13:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769866450;
	bh=OSALxL5+MFk5Sj9+OTgyZflH86KfchG0tfgD4nghV9o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CmiDtb2bRU0cdHgidAIfD3SQmhVHJXWiIMRTu8RVPlXgzcSU47b11OFJYfX+EhFov
	 2HycDkjTxGWdkXRYZt0i5GwgeNvRDgm4lll9IZtH41A5Jxx1nlud6hPMJ9SXQbk0Nv
	 c6Mf0wYakAvmTRR3h8GwwEzxzj5x8EobRQajzXHo8wykxY+N6M5iMeX9UIQzBt6Jho
	 RCEmQt8ccIx0HfHvHsqQ6VXbgdkBhaB8J0Z1TQbJH+rSQ4jK5yrnzvKJbD4jKUMwuP
	 DMFkG4py0t7xx2laHrS+2o+0JVaZk8ip3uW4qyz3m/0rN1Zd+1ZA9A5lYjfLbEI7VK
	 7rIDzrBrGoM4Q==
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
In-Reply-To: <aX2tyn9nBUEKM-SN@tardis.local>
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
Date: Sat, 31 Jan 2026 14:34:02 +0100
Message-ID: <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun@kernel.org> writes:

> On Fri, Jan 30, 2026 at 01:41:05PM -0800, Boqun Feng wrote:
>> On Fri, Jan 30, 2026 at 05:20:11PM +0100, Andreas Hindborg wrote:
>> [...]
>> > >> In the last discussions we had on this, the conclusion was to use
>> > >> `volatile_copy_memory` whenever that is available, or write a volatile
>> > >> copy function in assembly.
>> > >>
>> > >> Using memcpy_{from,to}io is the latter solution. These functions are
>> > >> simply volatile memcpy implemented in assembly.
>> > >>
>> > >> There is nothing special about MMIO. These functions are name as they
>> > >> are because they are useful for MMIO.
>> > >
>> > > No. MMIO are really special. A few architectures require them to be accessed
>> > > completely differently compared to normal memory. We also have things like
>> > > INDIRECT_IOMEM. memory_{from,to}io are special as they use MMIO accessor such as
>> > > readb to perform access on the __iomem pointer. They should not be mixed with
>> > > normal memory. They must be treated as if they're from a completely separate
>> > > address space.
>> > >
>> > > Normal memory vs DMA vs MMIO are all distinct, and this is demonstrated by the
>> > > different types of barriers needed to order things correctly for each type of
>> > > memory region.
>> > >
>> > > Userspace-mapped memory (that is also mapped in the kernel space, not __user) is
>> > > the least special one out of these. They could practically share all atomic infra
>> > > available for the kernel, hence the suggestion of using byte-wise atomic memcpy.
>> >
>> > I see. I did not consider this.
>> >
>> > At any rate, I still don't understand why I need an atomic copy function, or why I
>> > need a byte-wise copy function. A volatile copy function should be fine, no?
>> >
>>
>> but memcpy_{from,to}io() are not just volatile copy functions, they have
>> additional side effects for MMIO ;-)
>>
>
> For example, powerpc's memcpy_fromio() has eioio() in it, which we don't
> need for normal (user -> kernel) memory copy.

Ok, I see. Thanks for explaining. I was only looking at the x86
implementation, which is of course not enough.

>
>> > And what is the exact problem in using memcpy_{from,to}io. Looking at
>
> I think the main problem of using memcpy_{from,to}io here is not that
> they are not volatile memcpy (they might be), but it's because we
> wouldn't use them for the same thing in C, because they are designed for
> memory copying between MMIO and kernel memory (RAM).
>
> For MMIO, as Gary mentioned, because they are different than the normal
> memory, special instructions or extra barriers are needed.

I see, I was not aware.

>
> For DMA memory, it can be almost treated as external normal memory,
> however, different archictures/systems/platforms may have different
> requirement regarding cache coherent between CPU and devices, specially
> mapping or special instructions may be needed.

Cache flushing and barriers, got it.

>
> For __user memory, because kernel is only given a userspace address, and
> userspace can lie or unmap the address while kernel accessing it,
> copy_{from,to}_user() is needed to handle page faults.

Just to clarify, for my use case, the page is already mapped to kernel
space, and it is guaranteed to be mapped for the duration of the call
where I do the copy. Also, it _may_ be a user page, but it might not
always be the case.

>
> Your use case (copying between userspace-mapped memory and kernel
> memory) is, as Gary said, the least special here. So using
> memcpy_{from,to}io() would be overkill and probably misleading.

Ok, I understand.

> I
> suggest we use `{read,write}_volatile()` (unless I'm missing something
> subtle of course), however `{read,write}_volatile()` only works on Sized
> types,

We can copy as u8? Or would it be more efficient to copy as a larger size?

You suggested atomic in the other email, did you abandon that idea?

> so we may have to use `bindings::memcpy()` or
> core::intrinsics::volatile_copy_memory() [1]

I was looking at this one, but it is unstable behind `core_intrinsics`.
I was uncertain about pulling in additional unstable features. This is
why I was looking for something in the C kernel to use.

I think `bindings::memcpy` is not guaranteed to be implemented as inline
assembly, so it may not have volatile semantics?


Best regards,
Andreas Hindborg



