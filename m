Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C60F11CAF;
	Thu, 12 Feb 2026 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906111; cv=none; b=qR/TDmlo2Wd6REGV8lRuxigquCovVLjiyu0zCH4rCt6UTcOAoN8KvoT2VDZ9s2YSXVjZThUtH73EjE0Jgd8uWPbaOW1g+V8VV+fyAmpYymRauUxVnJet6liyD4KBXs4z2KkbG0WpDEoY42fZrxMF44B1jw+LrpCKPWa2agpYMRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906111; c=relaxed/simple;
	bh=2wTGXXhygF+m4+l1XNeZJSWol26qAdlL9WgwYRQRp3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=s/XfqHC/tgLqCuT4JT0MqpqQqTBG4tydomNu7DdXAYnY5GMhT25Jy3HhHtLy/4TWBfxflELANB1PM/HeAmBs7wDqRzSJ1hMKWEVIJQ+l63yFfGGkrQf+42Qd/7wY2R1qYgmCNp0tpdwJhcor3xvIqT8QoeexzrGEIyUGMUDNIL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l6ORjCYr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l6ORjCYr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A9BC4CEF7;
	Thu, 12 Feb 2026 14:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770906111;
	bh=2wTGXXhygF+m4+l1XNeZJSWol26qAdlL9WgwYRQRp3A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l6ORjCYr++1YVo+2r0Ejl/RoNdxEtKCHdc3SrsqDIpLnJErwh7Z+TAq4Tg360Ys6k
	 euglxDhsg6K1+lcDfoIALdT21JtRxPPfHedCjeMtR6mTTI1MWYTkiLHC5fhWYj8fQ7
	 ucvpBqjwpgJqIXpIbODFtBxv8tsRgE6MmYQo9bFMUuV81sltkUmH5fjTYdO++qLCM4
	 gGEkOHgdxPJ8JwKsLNUY7Ilz6oAc7wzyQcZa4jGvbmNL4tvrh9y1eyN9vnDFztDi3m
	 l5BR5U8/U1MWAvDz/w5PwGzayz7W9sPDm0GmvbM00vR0g6o/pLAwNJMpfo3+d1TSjS
	 S7XtQV8k6rtYQ==
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
In-Reply-To: <DG6B5Q4FJTYT.32ZVBMHJ6OR3G@garyguo.net>
References: <DG21IW5HZV2F.PXTH9P2IO8O7@garyguo.net>
 <87sebnqdhg.fsf@t14s.mail-host-address-is-not-set>
 <aX0lcVngRcRwqgd5@tardis.local>
 <SEV7bR_nyQNtvtgoO8X80HMkMTPLW_6roBSxJ-MpKHHNmkZQyVxSS9k1iFV7-bgAlHSLM566L8EqtRBnht65uA==@protonmail.internalid>
 <aX2tyn9nBUEKM-SN@tardis.local>
 <87ms1trjn9.fsf@t14s.mail-host-address-is-not-set>
 <gKLHFGuJqzRyjCupif-LFYn2ZY6OmhkyYj6idYTOnN4zMmNacFLBD1G9zzsYpTJn13GGvL0i-7JA-lIlBgakgQ==@protonmail.internalid>
 <DG2WLWJD8V5W.2I24LZKS6JG6Q@garyguo.net>
 <87bji9r0cp.fsf@t14s.mail-host-address-is-not-set>
 <878qddqxjy.fsf@t14s.mail-host-address-is-not-set>
 <aYFKbWfQmTInYy91@tardis.local>
 <87ldh8ps22.fsf@t14s.mail-host-address-is-not-set>
 <DG6B5Q4FJTYT.32ZVBMHJ6OR3G@garyguo.net>
Date: Thu, 12 Feb 2026 15:21:41 +0100
Message-ID: <87ldgyt53e.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Wed Feb 4, 2026 at 1:16 PM GMT, Andreas Hindborg wrote:
>> Boqun Feng <boqun@kernel.org> writes:
>>
>>> On Sat, Jan 31, 2026 at 10:31:13PM +0100, Andreas Hindborg wrote:
>>> [...]
>>>> >>>>
>>>> >>>> For __user memory, because kernel is only given a userspace address, and
>>>> >>>> userspace can lie or unmap the address while kernel accessing it,
>>>> >>>> copy_{from,to}_user() is needed to handle page faults.
>>>> >>>
>>>> >>> Just to clarify, for my use case, the page is already mapped to kernel
>>>> >>> space, and it is guaranteed to be mapped for the duration of the call
>>>> >>> where I do the copy. Also, it _may_ be a user page, but it might not
>>>> >>> always be the case.
>>>> >>
>>>> >> In that case you should also assume there might be other kernel-space users.
>>>> >> Byte-wise atomic memcpy would be best tool.
>>>> >
>>>> > Other concurrent kernel readers/writers would be a kernel bug in my use
>>>> > case. We could add this to the safety requirements.
>>>> >
>>>> 
>>>> Actually, one case just crossed my mind. I think nothing will prevent a
>>>> user space process from concurrently submitting multiple reads to the
>>>> same user page. It would not make sense, but it can be done.
>>>> 
>>>> If the reads are issued to different null block devices, the null block
>>>> driver might concurrently write the user page when servicing each IO
>>>> request concurrently.
>>>> 
>>>> The same situation would happen in real block device drivers, except the
>>>> writes would be done by dma engines rather than kernel threads.
>>>> 
>>>
>>> Then we better use byte-wise atomic memcpy, and I think for all the
>>> architectures that Linux kernel support, memcpy() is in fact byte-wise
>>> atomic if it's volatile. Because down the actual instructions, either a
>>> byte-size read/write is used, or a larger-size read/write is used but
>>> they are guaranteed to be byte-wise atomic even for unaligned read or
>>> write. So "volatile memcpy" and "volatile byte-wise atomic memcpy" have
>>> the same implementation.
>>>
>>> (The C++ paper [1] also says: "In fact, we expect that existing assembly
>>> memcpy implementations will suffice when suffixed with the required
>>> fence.")
>>>
>>> So to make thing move forward, do you mind to introduce a
>>> `atomic_per_byte_memcpy()` in rust::sync::atomic based on
>>> bindings::memcpy(), and cc linux-arch and all the archs that support
>>> Rust for some confirmation? Thanks!
>>
>> There is a few things I do not fully understand:
>>
>>  - Does the operation need to be both atomic and volatile, or is atomic enough on its
>>    own (why)?
>
> In theory, C11 atomic (without using volatile keyword) and Rust atomic are not
> volatile, so compiler can optimize them, e.g. coalesce two relaxed read of the
> same address into one. In practice, no compiler is doing this. LKMM atomics are
> always volatile.
>
>>  - The article you reference has separate `atomic_load_per_byte_memcpy`
>>    and `atomic_store_per_byte_memcpy` that allows inserting an acquire
>>    fence before the load and a release fence after the store. Do we not
>>    need that?
>
> It's distinct so that the semantics on the ordering is clear, as the "acquire"
> or "release" order is for the atomic argument, and there's no ordering for the
> other argument.
>
> Another thing is that without two methods, you need an extra conversion to
> convert a slice to non-atomic slice, which is not generally sound. (I.e. you
> cannot turn &[u8] to &[Atomic<u8>], as doing so would give you the ability to
> write to immutable memory.
>
>>  - It is unclear to me how to formulate the safety requirements for
>>    `atomic_per_byte_memcpy`. In this series, one end of the operation is
>>    the potential racy area. For `atomic_per_byte_memcpy` it could be
>>    either end (or both?). Do we even mention an area being "outside the
>>    Rust AM"?
>
> No, atomics are inside the AM. A piece of memory is either in AM or outside. For
> a page that both kernel and userspace access, we should just treat it as other
> memory and treat userspace as an always-atomic user.
>
>>
>> First attempt below. I am quite uncertain about this. I feel like we
>> have two things going on: Potential races with other kernel threads,
>> which we solve by saying all accesses are byte-wise atomic, and reaces
>> with user space processes, which we solve with volatile semantics?
>>
>> Should the functin name be `volatile_atomic_per_byte_memcpy`?
>>
>> /// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
>> ///
>> /// This copy operation is volatile.
>> ///
>> /// # Safety
>> ///
>> /// Callers must ensure that:
>> ///
>> /// * The source memory region is readable and reading from the region will not trap.
>
> We should just use standard terminology here, similar to Atomic::from_ptr.
>
>> /// * The destination memory region is writable and writing to the region will not trap.
>> /// * No references exist to the source or destination regions.
>> /// * If the source or destination region is within the Rust AM, any concurrent reads or writes to
>> ///   source or destination memory regions by the Rust AM must use byte-wise atomic operations.
>
> This should be dropped.
>
>> pub unsafe fn atomic_per_byte_memcpy(src: *const u8, dst: *mut u8, len: usize) {
>>     // SAFETY: By the safety requirements of this function, the following operation will not:
>>     //  - Trap.
>>     //  - Invalidate any reference invariants.
>>     //  - Race with any operation by the Rust AM, as `bindings::memcpy` is a byte-wise atomic
>>     //    operation and all operations by the Rust AM use byte-wise atomic semantics.
>>     //
>>     //  Further, as `bindings::memcpy` is a volatile operation, the operation will not race with any
>>     //  read or write operation to the source or destination area if the area can be considered to
>>     //  be outside the Rust AM.
>>     unsafe { bindings::memcpy(dst.cast::<kernel::ffi::c_void>(), src.cast::<kernel::ffi::c_void>(), len) };
>
> The `cast()` don't need explicit types I think?

Right, but similar to how `as _` can be bad during a refactor, `cast` without target
type can cause trouble.

Best regards,
Andreas Hindborg



