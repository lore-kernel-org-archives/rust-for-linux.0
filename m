Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CDD2D9EEF;
	Fri, 30 Jan 2026 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769780901; cv=none; b=JbMGy+Q8qO7anbbcyK/xO/IkNm6XTDNhvK5nfiZUjJCZafZe1n3LPdkHzMuU5NJD9sJ24JCpiFTBNIAZ8+0NCnMiSJQFHu3z5O+zPv4eOla7C2gq9XexR1reBhqXKCCTf8kRs62zUDxeheXDf1cLPw0yEFMQTjgluOdrSNhQgao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769780901; c=relaxed/simple;
	bh=OxtEeF2uXGbFh8UZfqrHdfMGjlLIwPoFvUCXj9THMT8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DfGMp4R4FcSLMcgEpTrqg6/KKlQoR8b/kJiLNYVbjv0P3ua4M/bA65fV128YvXx9XuhHBhMncOgJv34HZMRozuPT7mefMqys/6onDS3+ap/vX2NTrO2kHsRHZEEDiBWs+TFr20vkV2QbpATDT7Mqwf+0tpNI8H+PIEWa8l9tj4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rcGWQZYo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rcGWQZYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D0BBC4CEF7;
	Fri, 30 Jan 2026 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769780900;
	bh=OxtEeF2uXGbFh8UZfqrHdfMGjlLIwPoFvUCXj9THMT8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rcGWQZYo0QJFsDswK+5HM5d7SaC+3kUD0iy7vbRey6xEilGHHz8eDUbWrIAOEbb28
	 PizmwZvky8ltxagclRoy/Of5DLI5+/FKMAjTOmcmETvsoRcdR8fx88+jlPGor+gMj+
	 WN4EeLY/eCNnoyWIlT80E9kwguqMqaMjv/uRVCzTPtS/VjUpAz0fegheZ/zSSBBOqy
	 /GGue8yLrxkBnYUl4qeGTaH/X9u35u8zzkGSet9klNKpb49jszC36wRdd61tbGUO6F
	 Ingk2oI2DM45kOZkytI9mcQOGFHvtwO8SrgUWCae+00dXDQ/zW5LRNdSby36bEhrBy
	 9KuXi7v6OCkyw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: page: add volatile memory copy methods
In-Reply-To: <DG1Y5V810II1.1HE2T0HDBLNXI@garyguo.net>
References: <20260130-page-volatile-io-v1-1-19f3d3e8f265@kernel.org>
 <eGcGSx_-fgeLHkPmdfbWgLGhzEcmXunLzIAvS1-X3GqwyFOny9Frz1xN29-fj99sHxxa5_1WrcPxuSSZKxCHhA==@protonmail.internalid>
 <DG1Y5V810II1.1HE2T0HDBLNXI@garyguo.net>
Date: Fri, 30 Jan 2026 14:48:12 +0100
Message-ID: <877bszrz37.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Fri Jan 30, 2026 at 12:33 PM GMT, Andreas Hindborg wrote:
>> When copying data from buffers that are mapped to user space, or from
>> buffers that are used for dma, it is impossible to guarantee absence of
>> concurrent memory operations on those buffers. Copying data to/from `Page`
>> from/to these buffers would be undefined behavior if regular memcpy
>> operations are used.
>>
>> The operation can be made well defined, if the buffers that potentially
>> observe racy operations can be said to exist outside of any Rust
>> allocation. For this to be true, the kernel must only interact with the
>> buffers using raw volatile reads and writes.
>>
>> Add methods on `Page` to read and write the contents using volatile
>> operations.
>>
>> Also improve clarity by specifying additional requirements on
>> `read_raw`/`write_raw` methods regarding concurrent operations on involved
>> buffers.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/page.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>
>> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
>> index 432fc0297d4a8..6568a0d3b3baa 100644
>> --- a/rust/kernel/page.rs
>> +++ b/rust/kernel/page.rs
>> @@ -7,6 +7,7 @@
>>      bindings,
>>      error::code::*,
>>      error::Result,
>> +    ffi::c_void,
>>      uaccess::UserSliceReader,
>>  };
>>  use core::{
>> @@ -260,6 +261,8 @@ fn with_pointer_into_page<T>(
>>      /// # Safety
>>      ///
>>      /// * Callers must ensure that `dst` is valid for writing `len` bytes.
>> +    /// * Callers must ensure that there are no other concurrent reads or writes to/from the
>> +    ///   destination memory region.
>>      /// * Callers must ensure that this call does not race with a write to the same page that
>>      ///   overlaps with this read.
>>      pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
>> @@ -274,6 +277,30 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
>>          })
>>      }
>>
>> +    /// Maps the page and reads from it into the given IO memory region using volatile memory
>> +    /// operations.
>> +    ///
>> +    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
>> +    /// outside of the page, then this call returns [`EINVAL`].
>> +    ///
>> +    /// # Safety
>> +    /// Callers must ensure that:
>> +    ///
>> +    /// * The destination memory region is outside of any Rust memory allocation.
>> +    /// * The destination memory region is writable.
>> +    /// * This call does not race with a write to the same source page that overlaps with this read.
>> +    pub unsafe fn read_raw_toio(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
>> +        self.with_pointer_into_page(offset, len, move |src| {
>> +            // SAFETY: If `with_pointer_into_page` calls into this closure, then
>> +            // it has performed a bounds check and guarantees that `src` is
>> +            // valid for `len` bytes.
>> +            //
>> +            // There caller guarantees that there is no data race at the source.
>> +            unsafe { bindings::memcpy_toio(dst.cast::<c_void>(), src.cast::<c_void>(), len) };
>
> I feel that this should be a generic utility that integrates with our IO infra
> that allows you to copy/from IO to a slice.

While that might also be useful, for my particular use case I am copying
between two pages. One is mapped from user space, the other one is
allocated by a driver. No slices involved. Pasting for reference [1]:


    /// Copy data to the current page of this segment from `src_page`.
    ///
    /// Copies  `PAGE_SIZE - (self.offset() % PAGE_SIZE` bytes of data from `src_page` to this
    /// segment starting at `self.offset()` from offset `self.offset() % PAGE_SIZE`. This call
    /// will advance offset and reduce length of `self`.
    ///
    /// Returns the number of bytes copied.
    pub fn copy_from_page(&mut self, src_page: &Page, src_offset: usize) -> usize {
        let dst_offset = self.offset() % PAGE_SIZE;
        debug_assert!(src_offset <= PAGE_SIZE);
        let length = (PAGE_SIZE - dst_offset)
            .min(self.len() as usize)
            .min(PAGE_SIZE - src_offset);
        let page_idx = self.offset() / PAGE_SIZE;

        // SAFETY: self.bio_vec is valid and thus bv_page must be a valid
        // pointer to a `struct page`.
        let dst_page = unsafe { Page::from_raw(self.bio_vec.bv_page.add(page_idx)) };

        dst_page
            .with_pointer_into_page(dst_offset, length, |dst| {
                // SAFETY:
                // - If `with_pointer_into_page` calls this closure, then it has performed bounds
                //   checks and guarantees that `dst` is valid for `length` bytes.
                // - Since we have a shared reference to `src_page`, the read cannot race with any
                //   writes to `src_page`.
                unsafe { src_page.read_raw_toio(dst, src_offset, length) }
            })
            .expect("Assertion failure, bounds check failed.");

        self.advance(length as u32)
            .expect("Assertion failure, bounds check failed.");

        length



Best regards,
Andreas Hindborg

[1] https://github.com/metaspace/linux/blob/3e46e95f0707fa71259b1d241f689144ad61cc62/rust/kernel/block/bio/vec.rs#L142

