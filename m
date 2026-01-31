Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D373F366053;
	Sat, 31 Jan 2026 20:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769890461; cv=none; b=S7GuxGz4fNbMezGAQkGGEEpfiHVEWF0pT1iJDoiwDfQOzoVnAqbd+viqL0gobtqs7eQm/q87g65o5Levs8MVeFHeFthjUYQHyPsgbGwjRO0gDmPXaBiIwVNkI6Tu7NrQIBOJaNlDiVkeSmy7Hb3CCWo8idVGHfwzscGJFfLy63c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769890461; c=relaxed/simple;
	bh=DTCumRgyc8R+RzhO7lqI2NlUMLnsMy/AP3XZTPLTC8g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CcCps9MduJkxAqAhTxbLT0hkmiZx3/r9k6O67vawKfO39WGeFYeFRxRS45Z9wbDS9L3YNw9LPxMsDB6Kg7aIhn4zSTv4q91QuGzoZLh2n+c6qQbgbvan6itdcvmVE5UsoU/kv1Z8vkJreOmLbeCt7uyYYA4Te1SBI2jGRI2T8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bIFfvR2D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bIFfvR2D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81CBBC4CEF1;
	Sat, 31 Jan 2026 20:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769890461;
	bh=DTCumRgyc8R+RzhO7lqI2NlUMLnsMy/AP3XZTPLTC8g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bIFfvR2Djintd5gEOXAcP0/fCyWEZTqtfP05ytfx86MZ1fGGxyM9dX2X7S2zTK8Pj
	 RYdpctU0COuH8I/dcvS/8G5MBWl+EvASY+Et4GoBvMTH1q0F2dPKiQfYidVlXnhl2h
	 aOslpIHKhmf33KgFwY7Rn/FFKt1dj+bofATIsml3rt7GjkHrAJca8YCU2AuaoEmzzN
	 nXGPDjLStEDqT+z3E4Ypzm2YaS/UNcDO2qjOcatI8NsRu9WG78YmYa0ett/ZRNMwh5
	 h0I2rYtp/o/Zl1XIACXWIUAH0we5kb3BhzuG1DPZf35JBYHMmkGzyjghkIZGgti1eC
	 QgN3SpKjHPewQ==
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
In-Reply-To: <aX4tTMrMx1G7hXHf@tardis.local>
References: <iFJVkpTMbd-NR24OHYTJj8lr4dw7MwCQ9rJWiuRZFgK3JRDhIIAcpf5Z24viL5qHhkrPzpnKfvX7JS6X_VO2vg==@protonmail.internalid>
 <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net>
 <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
 <-9VZ2SJWMomnT82Xqo2u9cSlvCYkjqUqNxfwWMTxKmah9afzYQsZfNeCs24bgYBJVw2kTN2K3YSLYGr6naR_YA==@protonmail.internalid>
 <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <aX0lcVngRcRwqgd5@tardis.local>
 <SEV7bR_nyQNtvtgoO8X80HMkMTPLW_6roBSxJ-MpKHHNmkZQyVxSS9k1iFV7-bgAlHSLM566L8EqtRBnht65uA==@protonmail.internalid>
 <aX2tyn9nBUEKM-SN@tardis.local>
 <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>
 <2K11BlRP4dLJg30wg9iuWS-cPdgQvA3NuAu1jrQiq5E3u4eovN08u52BlW6dP2rQiG29mJl6f20X_zi-u85Mow==@protonmail.internalid>
 <aX4tTMrMx1G7hXHf@tardis.local>
Date: Sat, 31 Jan 2026 21:14:09 +0100
Message-ID: <87h5s1r14e.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Boqun Feng" <boqun@kernel.org> writes:

> On Sat, Jan 31, 2026 at 02:34:02PM +0100, Andreas Hindborg wrote:
> [..]
>> >
>> > For DMA memory, it can be almost treated as external normal memory,
>> > however, different archictures/systems/platforms may have different
>> > requirement regarding cache coherent between CPU and devices, specially
>> > mapping or special instructions may be needed.
>>
>> Cache flushing and barriers, got it.
>>
>
> For completeness, I think for some architectures/platforms, cache
> coherence between CPU and devices can be achieved by hardware, in that
> case, DMA memory access can be just a normal memory access.
>
>> >
>> > For __user memory, because kernel is only given a userspace address, and
>> > userspace can lie or unmap the address while kernel accessing it,
>> > copy_{from,to}_user() is needed to handle page faults.
>>
>> Just to clarify, for my use case, the page is already mapped to kernel
>> space, and it is guaranteed to be mapped for the duration of the call
>> where I do the copy. Also, it _may_ be a user page, but it might not
>> always be the case.
>>
>
> Ok, if it's not a page mapped to userspace, would there be any other
> access from kernel while copying the page? If there is other kernel
> thread or interrupt could write to source page, the write needs to be
> atomic in some level (byte-wise for example), so does the read part of
> the copy.

No matter if it is a page from user space or a page only mapped in the
kernel, there should be no concurrent access by kernel threads.

These pages are the IO buffers for block device IO. For direct user IO
they would be user space pages mapped to the kernel during IO. For
regular IO, they are managed by the page cache. I am pretty sure proper
locking is in place so that the pages are not mutated or read while an
IO request is outstanding from the page cache.

Maybe encryption could be a case where data is written by kernel threads
(in case of no hw acceleration) to IO buffers mapped in kernel space.
But again, these operations would not overlap with the IO request, and
proper synchronization should be in place.

>
>> >
>> > Your use case (copying between userspace-mapped memory and kernel
>> > memory) is, as Gary said, the least special here. So using
>> > memcpy_{from,to}io() would be overkill and probably misleading.
>>
>> Ok, I understand.
>>
>> > I
>> > suggest we use `{read,write}_volatile()` (unless I'm missing something
>> > subtle of course), however `{read,write}_volatile()` only works on Sized
>> > types,
>>
>> We can copy as u8? Or would it be more efficient to copy as a larger size?
>>
>
> Copying as a larger size is more efficient: less instructions for the
> same amount of data to copy.
>
>> You suggested atomic in the other email, did you abandon that idea?
>>
>
> No, if we have byte-wise atomic copy, I'd still use that, but that is
> not something already implemented in Rust. (my reply had a "if we want
> to avoid implementing something by ourselves" at last)

Got it.

>
>> > so we may have to use `bindings::memcpy()` or
>> > core::intrinsics::volatile_copy_memory() [1]
>>
>> I was looking at this one, but it is unstable behind `core_intrinsics`.
>> I was uncertain about pulling in additional unstable features. This is
>
> That's also why I said "(or suggest Rust to stabilize something).
>
>> why I was looking for something in the C kernel to use.
>>
>> I think `bindings::memcpy` is not guaranteed to be implemented as inline
>> assembly, so it may not have volatile semantics?
>>
>
> Well, it's used in C as if it's volatile, for example, it's used in the
> similar case in bio_copy_data_iter() (hopefully you can confirm that's
> indeed a similar case).

Yes, this is the exact same situation. It is used higher in the stack,
but same constraints.

> And I'm suggesting we use it forever, just use
> it while waiting for volatile_copy_memory() or something.

Ok, I'm fine with that. We can use this one and add a TODO note.


Best regards,
Andreas Hindborg


