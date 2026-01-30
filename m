Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D942D2D46CE;
	Fri, 30 Jan 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769786615; cv=none; b=H1agtyAEF1Z7Fgak+unbk5aJRrGmCNMZux55vXj1YSfi9anPMHsRwYSbkjB74s9AZ8NnZhBiDIO45ilFm2PSdj7H4U5tACtIX93YZCKz4xE96Lon/PK6y5v6phGgPFXuFJX5siN0TWA0ZMhvshBbK7QMpVENtKPsz5gD7bd1A0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769786615; c=relaxed/simple;
	bh=OfAxn43cAaKhhypDUQkzSI0HnPDRUKLR4w1dCB/YkXM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B7Oqco8Dl8tLuqOqwDpveVvvLlvb/Kopm7izS3OocrAFvCw/tMnzZp55Wn6oujV3sMjNuuWUmbl4xKwTVmiygivgln68Qg3mv3OyQmuTNd6BrhSeHIIa01Uz8/w6HGfa1ATI1pvfo5IwK5tudzDp/Cxo9K5iPWIpJ2HczJR5SRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efzWWnfp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efzWWnfp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C549C4CEF7;
	Fri, 30 Jan 2026 15:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769786615;
	bh=OfAxn43cAaKhhypDUQkzSI0HnPDRUKLR4w1dCB/YkXM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=efzWWnfpB6hvpZ13uEX2LOjlyqmi9mUPIy9EUBRjwa7fJK+OB1TAAT96WQXBzmHde
	 vkIA8v++kEio9KB5TzGwGKalRuUEM56+5v9UUbmZt7ktk1xKVkq5UXnyz4z5mZi94q
	 OBhgxdtIVKfG2HHsR+YUbL/fO1W+k6kTQR74Hkn0rokbxjk2jE78GbdPAwJPQN6e3x
	 dRTbKM2ROSuhSFi0AGrgV7jwx7Lll1LWV+/jIPK7yZB5FgoWYFBOcNyo1qp3Q6Rifr
	 T5wh2SeEdGrhO78RgGpYIiodXEZ6A5dkw3B/kZryw/7ZbAXkjMMk9rY1A+aTDxayhg
	 f6eccGO1Ks+IA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Gary Guo <gary@garyguo.net>, Alice Ryhl
 <aliceryhl@google.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, =?utf-8?Q?Bj=C3=B6?=
 =?utf-8?Q?rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
In-Reply-To: <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net>
References: <20260130-page-volatile-io-v1-1-19f3d3e8f265@kernel.org>
 <eGcGSx_-fgeLHkPmdfbWgLGhzEcmXunLzIAvS1-X3GqwyFOny9Frz1xN29-fj99sHxxa5_1WrcPxuSSZKxCHhA==@protonmail.internalid>
 <DG1Y5V810II1.1HE2T0HDBLNXI@garyguo.net>
 <877bszrz37.fsf@t14s.mail-host-address-is-not-set>
 <a8nHDdzac5l20akcxjjf9w7huObjn4eIHjUI-A17aKEwWl1N-4vvLBiVdqTQbBHwypMIA6gNkzm8YFXmMl44ew==@protonmail.internalid>
 <DG1ZJ1350EMS.1S1360PA496QG@garyguo.net>
 <874io3rwl3.fsf@t14s.mail-host-address-is-not-set>
 <iFJVkpTMbd-NR24OHYTJj8lr4dw7MwCQ9rJWiuRZFgK3JRDhIIAcpf5Z24viL5qHhkrPzpnKfvX7JS6X_VO2vg==@protonmail.internalid>
 <DG20LKAHMXMZ.262Y7NAC1A1Z9@garyguo.net>
Date: Fri, 30 Jan 2026 16:23:23 +0100
Message-ID: <871pj7ruok.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Fri Jan 30, 2026 at 2:42 PM GMT, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Fri Jan 30, 2026 at 1:48 PM GMT, Andreas Hindborg wrote:
>>>> "Gary Guo" <gary@garyguo.net> writes:
>>>>
>>>>> On Fri Jan 30, 2026 at 12:33 PM GMT, Andreas Hindborg wrote:
>>>>>> When copying data from buffers that are mapped to user space, or from
>>>>>> buffers that are used for dma, it is impossible to guarantee absence of
>>>>>> concurrent memory operations on those buffers. Copying data to/from `Page`
>>>>>> from/to these buffers would be undefined behavior if regular memcpy
>>>>>> operations are used.
>>>>>>
>>>>>> The operation can be made well defined, if the buffers that potentially
>>>>>> observe racy operations can be said to exist outside of any Rust
>>>>>> allocation. For this to be true, the kernel must only interact with the
>>>>>> buffers using raw volatile reads and writes.
>>>>>>
>>>>>> Add methods on `Page` to read and write the contents using volatile
>>>>>> operations.
>>>>>>
>>>>>> Also improve clarity by specifying additional requirements on
>>>>>> `read_raw`/`write_raw` methods regarding concurrent operations on involved
>>>>>> buffers.
>>>>>>
>>>>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>>>> ---
>>>>>>  rust/kernel/page.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 53 insertions(+)
>>>>>>
>>>>>> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
>>>>>> index 432fc0297d4a8..6568a0d3b3baa 100644
>>>>>> --- a/rust/kernel/page.rs
>>>>>> +++ b/rust/kernel/page.rs
>>>>>> @@ -7,6 +7,7 @@
>>>>>>      bindings,
>>>>>>      error::code::*,
>>>>>>      error::Result,
>>>>>> +    ffi::c_void,
>>>>>>      uaccess::UserSliceReader,
>>>>>>  };
>>>>>>  use core::{
>>>>>> @@ -260,6 +261,8 @@ fn with_pointer_into_page<T>(
>>>>>>      /// # Safety
>>>>>>      ///
>>>>>>      /// * Callers must ensure that `dst` is valid for writing `len` bytes.
>>>>>> +    /// * Callers must ensure that there are no other concurrent reads or writes to/from the
>>>>>> +    ///   destination memory region.
>>>>>>      /// * Callers must ensure that this call does not race with a write to the same page that
>>>>>>      ///   overlaps with this read.
>>>>>>      pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
>>>>>> @@ -274,6 +277,30 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
>>>>>>          })
>>>>>>      }
>>>>>>
>>>>>> +    /// Maps the page and reads from it into the given IO memory region using volatile memory
>>>>>> +    /// operations.
>>>>>> +    ///
>>>>>> +    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
>>>>>> +    /// outside of the page, then this call returns [`EINVAL`].
>>>>>> +    ///
>>>>>> +    /// # Safety
>>>>>> +    /// Callers must ensure that:
>>>>>> +    ///
>>>>>> +    /// * The destination memory region is outside of any Rust memory allocation.
>>>>>> +    /// * The destination memory region is writable.
>>>>>> +    /// * This call does not race with a write to the same source page that overlaps with this read.
>>>>>> +    pub unsafe fn read_raw_toio(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
>>>>>> +        self.with_pointer_into_page(offset, len, move |src| {
>>>>>> +            // SAFETY: If `with_pointer_into_page` calls into this closure, then
>>>>>> +            // it has performed a bounds check and guarantees that `src` is
>>>>>> +            // valid for `len` bytes.
>>>>>> +            //
>>>>>> +            // There caller guarantees that there is no data race at the source.
>>>>>> +            unsafe { bindings::memcpy_toio(dst.cast::<c_void>(), src.cast::<c_void>(), len) };
>>>>>
>>>>> I feel that this should be a generic utility that integrates with our IO infra
>>>>> that allows you to copy/from IO to a slice.
>>>>
>>>> While that might also be useful, for my particular use case I am copying
>>>> between two pages. One is mapped from user space, the other one is
>>>> allocated by a driver. No slices involved. Pasting for reference [1]:
>>>
>>> Then what you need is a byte-wise atomic memcpy, not memcpy_{from,to}io.
>>
>> Can you elaborate on how you get to this requirement?
>
> Memory that is possibly mapped into userspace is still normal memory, it is not
> I/O. I/O accessors (and IO memcpy) are specifically used for MMIO, and you
> should not be using them for userspace memory.
>
> For memory that can be mutated from userspace you can just treat them as a
> potentially concurrent accessor hence all accesses should be using atomic. When
> tearing is acceptable, byte-wise atomic is sufficient.

I would treat them the same as DMA regions and MMIO regions. As these
regions are outside of any Rust allocation, if we never make references
to them and if we only operate on them with volatile operations,
behavior of the copy operations like these are defined, as far as I
understand.

In the last discussions we had on this, the conclusion was to use
`volatile_copy_memory` whenever that is available, or write a volatile
copy function in assembly.

Using memcpy_{from,to}io is the latter solution. These functions are
simply volatile memcpy implemented in assembly.

There is nothing special about MMIO. These functions are name as they
are because they are useful for MMIO.


Best regards,
Andreas Hindborg


