Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55222D8DC8;
	Fri, 30 Jan 2026 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769784154; cv=none; b=OwcAK7Ma9U7pSLtkkS7kGA37h+P99dCnC+8N3bR5rehsiwRMmnKnEMAep+Lkms/6a3IQc0KzQDvALRfsYk1chuTQif+hk022WzTEE7TCYtDLeguTqERfuGvvhDc2oMmE/M6MlgczwGpDa184jBEkzEtGCfkejJBU8B9+8jI7+a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769784154; c=relaxed/simple;
	bh=JPzOLHG40jPLavhTwN68d9iWIrexHiP3vBrSv5OwBgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LHIpmIMNB39Iz1nJ4bO+BgAfcnzwW/Nn5R37ICBMPxPlkPOxKO0t1vfjMv81TzwR89NNTrjlVexnRfRooCh0ljPmRywMZLgqxaaokWs2RcsM6czMW8c8eXkfMK1qDaU8IM4Zl+FVGk1yKQSlxGyjGZSt++5RHKfSY1GIk1pL7BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrC9r4HM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrC9r4HM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365C0C4CEF7;
	Fri, 30 Jan 2026 14:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769784154;
	bh=JPzOLHG40jPLavhTwN68d9iWIrexHiP3vBrSv5OwBgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KrC9r4HMnWBD5NWXRF1Rcd+cMLpLxZWGDYIl/rGJH733cpkH+1a+mCQfZUhv8Zkmu
	 EiV7BRpFpg5VZmrhHsy1BS6bElq9gs+WO4Fd6NITl99Bk+L66JZWK7rUZGr/ntCJ4K
	 WtxlSHwgF0Pdgw+sfOk3hhcCG1ThvxQPOJQd7Dv1Mrqi+zBgrkYft/Tm5C1LGpgqtI
	 2hfNwVrETY/LHUW9pIJ8Y9w/DRcQNwK/RlC5znRe0jR6XPWwxJ/O51iNOqc3z4xMb9
	 5AZlwe4U/Lp9s8YegmCFGQ+HtfbqPMuAoMZ5xUOMEPYp9gp9NE9m+rRPxQtfkl/jF7
	 KnrcipdYUfM4w==
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
In-Reply-To: <DG1ZJ1350EMS.1S1360PA496QG@garyguo.net>
References: <20260130-page-volatile-io-v1-1-19f3d3e8f265@kernel.org>
 <eGcGSx_-fgeLHkPmdfbWgLGhzEcmXunLzIAvS1-X3GqwyFOny9Frz1xN29-fj99sHxxa5_1WrcPxuSSZKxCHhA==@protonmail.internalid>
 <DG1Y5V810II1.1HE2T0HDBLNXI@garyguo.net>
 <877bszrz37.fsf@t14s.mail-host-address-is-not-set>
 <a8nHDdzac5l20akcxjjf9w7huObjn4eIHjUI-A17aKEwWl1N-4vvLBiVdqTQbBHwypMIA6gNkzm8YFXmMl44ew==@protonmail.internalid>
 <DG1ZJ1350EMS.1S1360PA496QG@garyguo.net>
Date: Fri, 30 Jan 2026 15:42:16 +0100
Message-ID: <874io3rwl3.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Fri Jan 30, 2026 at 1:48 PM GMT, Andreas Hindborg wrote:
>> "Gary Guo" <gary@garyguo.net> writes:
>>
>>> On Fri Jan 30, 2026 at 12:33 PM GMT, Andreas Hindborg wrote:
>>>> When copying data from buffers that are mapped to user space, or from
>>>> buffers that are used for dma, it is impossible to guarantee absence of
>>>> concurrent memory operations on those buffers. Copying data to/from `Page`
>>>> from/to these buffers would be undefined behavior if regular memcpy
>>>> operations are used.
>>>>
>>>> The operation can be made well defined, if the buffers that potentially
>>>> observe racy operations can be said to exist outside of any Rust
>>>> allocation. For this to be true, the kernel must only interact with the
>>>> buffers using raw volatile reads and writes.
>>>>
>>>> Add methods on `Page` to read and write the contents using volatile
>>>> operations.
>>>>
>>>> Also improve clarity by specifying additional requirements on
>>>> `read_raw`/`write_raw` methods regarding concurrent operations on involved
>>>> buffers.
>>>>
>>>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>>>> ---
>>>>  rust/kernel/page.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 53 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
>>>> index 432fc0297d4a8..6568a0d3b3baa 100644
>>>> --- a/rust/kernel/page.rs
>>>> +++ b/rust/kernel/page.rs
>>>> @@ -7,6 +7,7 @@
>>>>      bindings,
>>>>      error::code::*,
>>>>      error::Result,
>>>> +    ffi::c_void,
>>>>      uaccess::UserSliceReader,
>>>>  };
>>>>  use core::{
>>>> @@ -260,6 +261,8 @@ fn with_pointer_into_page<T>(
>>>>      /// # Safety
>>>>      ///
>>>>      /// * Callers must ensure that `dst` is valid for writing `len` bytes.
>>>> +    /// * Callers must ensure that there are no other concurrent reads or writes to/from the
>>>> +    ///   destination memory region.
>>>>      /// * Callers must ensure that this call does not race with a write to the same page that
>>>>      ///   overlaps with this read.
>>>>      pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
>>>> @@ -274,6 +277,30 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
>>>>          })
>>>>      }
>>>>
>>>> +    /// Maps the page and reads from it into the given IO memory region using volatile memory
>>>> +    /// operations.
>>>> +    ///
>>>> +    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
>>>> +    /// outside of the page, then this call returns [`EINVAL`].
>>>> +    ///
>>>> +    /// # Safety
>>>> +    /// Callers must ensure that:
>>>> +    ///
>>>> +    /// * The destination memory region is outside of any Rust memory allocation.
>>>> +    /// * The destination memory region is writable.
>>>> +    /// * This call does not race with a write to the same source page that overlaps with this read.
>>>> +    pub unsafe fn read_raw_toio(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
>>>> +        self.with_pointer_into_page(offset, len, move |src| {
>>>> +            // SAFETY: If `with_pointer_into_page` calls into this closure, then
>>>> +            // it has performed a bounds check and guarantees that `src` is
>>>> +            // valid for `len` bytes.
>>>> +            //
>>>> +            // There caller guarantees that there is no data race at the source.
>>>> +            unsafe { bindings::memcpy_toio(dst.cast::<c_void>(), src.cast::<c_void>(), len) };
>>>
>>> I feel that this should be a generic utility that integrates with our IO infra
>>> that allows you to copy/from IO to a slice.
>>
>> While that might also be useful, for my particular use case I am copying
>> between two pages. One is mapped from user space, the other one is
>> allocated by a driver. No slices involved. Pasting for reference [1]:
>
> Then what you need is a byte-wise atomic memcpy, not memcpy_{from,to}io.

Can you elaborate on how you get to this requirement?


Best regards,
Andreas Hindborg



