Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB62367DF;
	Fri, 13 Feb 2026 13:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770987706; cv=pass; b=Iyr8hO+hSRIjsqJu2glBhXiurMfn20xZrt+fIL/wmwZj7OY6H9yGw4ARqD7fLnpeUodqAd1DS5yL7H2TFgBJvHNCoA+ebID9iNZpDMGswM6SVsjfsRjNv0kCmQ1dIL389LSF5azPTRxDo8WViLbA4cSZc50WHnpMzJvmpHkszLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770987706; c=relaxed/simple;
	bh=Dxwm0SKbUQGxbWMJdOn8vWDS6htbR1XOVWllHTkjKh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6JBqStLXwvrNfR27iLRLoStaHVjXyycXqeys2zCevfLdYX1/3J3fTU5ePDfMScP11XK7EYGex1IHvSMVAGyEHi5FrSboHmH0iGe16cpGEo7mxqyaTmsU87JHMN+t3USmYHHfLfUZn2fdaw7AIOgoAjSE1aunUqLbY4gPd1UP7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b=Tv0vGj6i; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=shivamkalra98@zohomail.in header.b="Tv0vGj6i"
ARC-Seal: i=1; a=rsa-sha256; t=1770987624; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=SGn5AnYfZJBi77FUY0z7Jz3VxZWApyB+zXmZZlRvEDx5sRxfLSd8PeOK2CH250Odm6PYUTK91FvkalWCpt0oT25qAX+y9PLh4Bv8NuqozU2q9Oii9Fr4ccJJ3ubNdhz3aLpENfH8iyLCx6woTnqrUhjbWsgrv143WQpzGJmzSks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1770987624; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fn1TE2wQXVQQpUsVuFA2oiV8+lG37ig1Ar8qEwbmER4=; 
	b=dPlqADqnqs0oSSxQ9azvBqaFjRGK3lcpHwDjTkenzB2CTrUWM8dImFlb1ZybjglcqM6wpV7eMiQSvN/Il82AEMstjqooxbN6M9rBgpgFupMjRYjLqo0zPJgf0Sy6K054ZRtc7jAGbit9cJ34VwDBXF/kZcn0Z44XQTh4dRlsuYw=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=shivamkalra98@zohomail.in;
	dmarc=pass header.from=<shivamkalra98@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770987624;
	s=zoho; d=zohomail.in; i=shivamkalra98@zohomail.in;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fn1TE2wQXVQQpUsVuFA2oiV8+lG37ig1Ar8qEwbmER4=;
	b=Tv0vGj6iV8Pga8InAUVyW0scn6uQB+n2T82VRTa3LwpL1Y9vRG7qPPxSVkOUsP4u
	vgsfnGtWLDD9qylk5PGPigOJfu7+qDRxpvzcunM4g5cQ56miFwJt7OJICgY8tvVQfu4
	6by0u+MYBPMqmEkSKw2Hgt7R4VikgNUG8B9foZLI=
Received: by mx.zoho.in with SMTPS id 1770987619836377.71368789710255;
	Fri, 13 Feb 2026 18:30:19 +0530 (IST)
Message-ID: <c355881e-29b6-4f98-846e-885851c02c10@zohomail.in>
Date: Fri, 13 Feb 2026 18:30:17 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: kvec: implement shrink_to for KVVec
To: Danilo Krummrich <dakr@kernel.org>,
 Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260212-binder-shrink-vec-v3-v4-0-bd02f06bf2cd@zohomail.in>
 <20260212-binder-shrink-vec-v3-v4-1-bd02f06bf2cd@zohomail.in>
 <DGCWFFTC3TNK.32I96GCV77PFH@kernel.org>
Content-Language: en-US
From: Shivam Kalra <shivamkalra98@zohomail.in>
In-Reply-To: <DGCWFFTC3TNK.32I96GCV77PFH@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/02/26 15:38, Danilo Krummrich wrote:
> On Thu Feb 12, 2026 at 9:17 AM CET, Shivam Kalra via B4 Relay wrote:
>> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
>> index ac8d6f763ae81..8524f9f3dff0a 100644
>> --- a/rust/kernel/alloc/kvec.rs
>> +++ b/rust/kernel/alloc/kvec.rs
>> @@ -9,7 +9,7 @@
>>  };
>>  use crate::{
>>      fmt,
>> -    page::AsPageIter, //
>> +    page::{AsPageIter, PAGE_SIZE},
> 
> Please keep the kernel import style [1].
> 
> [1] https://docs.kernel.org/rust/coding-guidelines.html#imports
> 
>>  };
>>  use core::{
>>      borrow::{Borrow, BorrowMut},
>> @@ -734,6 +734,82 @@ pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
>>          self.truncate(num_kept);
>>      }
>>  }
>> +// TODO: This is a temporary KVVec-specific implementation. It should be replaced with a generic
>> +// `shrink_to()` for `impl<T, A: Allocator> Vec<T, A>` that uses `A::realloc()` once the
>> +// underlying allocators properly support shrinking via realloc.
>> +impl<T> Vec<T, KVmalloc> {
>> +    /// Shrinks the capacity of the vector with a lower bound.
>> +    ///
>> +    /// The capacity will remain at least as large as both the length and the supplied value.
>> +    /// If the current capacity is less than the lower limit, this is a no-op.
>> +    ///
>> +    /// Shrinking only occurs if the operation would free at least one page of memory.
> 
> Since this is now specific to Vec<T, KVmalloc>, the correct statement would be
> that for kmalloc() allocations realloc() takes the decision and for vmalloc()
> allocations it will only be shrunk if at least one page can be freed. Please
> also add that in the vmalloc() case, we are doing a deep copy.
> 
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// // Allocate enough capacity to span multiple pages.
>> +    /// let elements_per_page = kernel::page::PAGE_SIZE / core::mem::size_of::<u32>();
>> +    /// let mut v = KVVec::with_capacity(elements_per_page * 4, GFP_KERNEL)?;
>> +    /// v.push(1, GFP_KERNEL)?;
>> +    /// v.push(2, GFP_KERNEL)?;
>> +    ///
>> +    /// v.shrink_to(0, GFP_KERNEL)?;
>> +    /// # Ok::<(), Error>(())
>> +    /// ```
>> +    pub fn shrink_to(&mut self, min_capacity: usize, flags: Flags) -> Result<(), AllocError> {
>> +        let target_cap = core::cmp::max(self.len(), min_capacity);
>> +
>> +        if self.capacity() <= target_cap {
>> +            return Ok(());
>> +        }
>> +
>> +        if Self::is_zst() {
>> +            return Ok(());
>> +        }
> 
> We should check for is_vmalloc_addr() here and just call realloc() if it is
> false.
> 
> The reason is that this will ensure that the semantics of this function will be
> as close as possible to the final implementation, which will fully rely on
> realloc().
> 
> I also understand that calling realloc() if !is_vmalloc_addr() seems
> superfluous, but I don't want this code to make assumptions about the semantics
> of the backing allocators.
> 
>> +        // Only shrink if we would free at least one page.
>> +        let current_size = self.capacity() * core::mem::size_of::<T>();
>> +        let target_size = target_cap * core::mem::size_of::<T>();
>> +        let current_pages = current_size.div_ceil(PAGE_SIZE);
>> +        let target_pages = target_size.div_ceil(PAGE_SIZE);
>> +
>> +        if current_pages <= target_pages {
>> +            return Ok(());
>> +        }
>> +
>> +        if target_cap == 0 {
>> +            if !self.layout.is_empty() {
>> +                // SAFETY: `self.ptr` was allocated with `KVmalloc`, layout matches.
>> +                unsafe { KVmalloc::free(self.ptr.cast(), self.layout.into()) };
>> +            }
>> +            self.ptr = NonNull::dangling();
>> +            self.layout = ArrayLayout::empty();
>> +            return Ok(());
>> +        }
>> +
>> +        // SAFETY: `target_cap <= self.capacity()` and original capacity was valid.
>> +        let new_layout = unsafe { ArrayLayout::<T>::new_unchecked(target_cap) };
>> +
>> +        // TODO: Once vrealloc supports in-place shrinking (mm/vmalloc.c:4316), this
>> +        // explicit alloc+copy+free can potentially be replaced with realloc.
> 
> I'd drop this comment as it reads as if this function should be changed, even
> though the TODO comment above already explains that it should be replaced.
> 
>> +        let new_ptr = KVmalloc::alloc(new_layout.into(), flags, NumaNode::NO_NODE)?;
>> +
>> +        // SAFETY: Both pointers are valid, non-overlapping, and properly aligned.
> 
> If a safety comment justifies multiple things, we usually structure it as a
> list.
> 
>> +        unsafe {
>> +            ptr::copy_nonoverlapping(self.as_ptr(), new_ptr.as_ptr().cast::<T>(), self.len);
> 
> NIT: Please move the semicolon at the end of the unsafe block.
> 
>> +        }
>> +
>> +        // SAFETY: `self.ptr` was allocated with `KVmalloc`, layout matches.
> 
> Same here.
> 
>> +        unsafe { KVmalloc::free(self.ptr.cast(), self.layout.into()) };
>> +
>> +        // SAFETY: `new_ptr` is non-null because `KVmalloc::alloc` succeeded.
>> +        self.ptr = unsafe { NonNull::new_unchecked(new_ptr.as_ptr().cast::<T>()) };
>> +        self.layout = new_layout;
>> +
>> +        Ok(())
>> +    }
>> +}
>>  
>>  impl<T: Clone, A: Allocator> Vec<T, A> {
>>      /// Extend the vector by `n` clones of `value`.
>>
>> -- 
>> 2.43.0
> 
Thanks for the feedback.
I will soon send an update on the v5 patch.
