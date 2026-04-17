Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE4539A054
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 12:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429862; cv=none; b=Krr4MuED7JPLgApjjtGMAST6s9IMQBx1Yqe2wMcumrW+S8RMJAUnCQEnepc7Fk7S3nWutLOMBIKtdxdANj7nkFNbVR1n6VTM0WKSva5gDXJs/w84n7NvP3jTQkPN34tcTw2BIojmhvfFldZrJCKynELNicTiuO5sYhOWaM72ZbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429862; c=relaxed/simple;
	bh=44TvqN+gIPHJ+xk3Hvp+BfZzAXzT3KgL/5jsiW8rF3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyTC23eDBNvL+93px296rAQ3HTx3iKVcWeWFTTRUiBC7nVHAa+RaTwnmxs6c3cGrGGVN6Tlphnr+u/Vm9Acv4KQBCJIrzBDRErOoTvLzzmOuUe/2ZGa9QWkKmR7FRZVidnNp1o60CUrmCKXfN17rNMqUl3eBWTjMaTodzVBAc+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ufHQfFOb; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ufHQfFOb"
Message-ID: <771ad315-0149-4de8-a39c-1c4bcaab2241@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776429848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0iDkpP2npHGZPhERTsC5e/97KQirTNrGZ+oon7DqZfI=;
	b=ufHQfFObPz9RENL8GIF/JjYnJsa0TQPCxInnGcH9njjEhmpd32Zbzi6XxxX0rL8wd3XwKL
	SwQZAlcLpzJxv8MeHOpWtxGWNkr3y+bhTkHbSxJOfHL0zz/tYJpWjzcBPq0Og7e4Yc1AK4
	TE2ueXDyVD/hKGW526eOG70u0s3hD1Y=
Date: Fri, 17 Apr 2026 20:43:28 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] rust: xarray: Add Guard::find() helper
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Tamir Duberstein <tamird@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260417-tyr-ioctls-deps-v1-0-41c6e9bb061c@linux.dev>
 <20260417-tyr-ioctls-deps-v1-4-41c6e9bb061c@linux.dev>
 <20260417082836.29530-1-work@onurozkan.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260417082836.29530-1-work@onurozkan.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Onur,

On 4/17/26 16:28, Onur Özkan wrote:
> On Fri, 17 Apr 2026 09:05:54 +0800
> Alvin Sun <alvin.sun@linux.dev> wrote:
>
>> Add a helper to find the first present entry in the XArray.
>>
>> Returns the index of the first present entry, or None if the array
>> is empty.
>>
>> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
>> ---
>>   rust/kernel/xarray.rs | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
>> index 235fda0e394ba..e43129d032d9d 100644
>> --- a/rust/kernel/xarray.rs
>> +++ b/rust/kernel/xarray.rs
>> @@ -217,6 +217,28 @@ pub fn remove(&mut self, index: usize) -> Option<T> {
>>           unsafe { T::try_from_foreign(ptr) }
>>       }
>>   
>> +    /// Finds the first present entry.
>> +    ///
>> +    /// Returns the index of the first present entry, or `None` if the array is empty.
>> +    pub fn find(&mut self) -> Option<usize> {
>> +        let mut index = 0usize;
> Nit: I don't know if this verbosity can ever be useful, it can simply be `= 0`;

Yeah, you're right - we can let the compiler infer the type automatically.
I haven't gotten used to that convenience yet :P

>
>> +        // SAFETY: `self.xa.xa` is always valid by the type invariant, and we hold the lock.
>> +        let ptr = unsafe {
>> +            bindings::xa_find(
>> +                self.xa.xa.get(),
>> +                &mut index,
>> +                usize::MAX,
>> +                bindings::XA_PRESENT,
>> +            )
>> +        };
>> +
>> +        if ptr.is_null() {
>> +            None
>> +        } else {
>> +            Some(index)
>> +        }
> This can be written with the `then_some` chain e.g., !ptr.is_null().then_some(..
> .) but I don't know if it ever makes it more readable or simpler. I guess it's
> up to preference.

I'm still not very used to the chained syntax style. For me, the if/else
approach is quite intuitive.

Best regards,
Alvin

>
> -Onur
>
>> +    }
>> +
>>       /// Stores an element at the given index.
>>       ///
>>       /// May drop the lock if needed to allocate memory, and then reacquire it afterwards.
>>
>> -- 
>> 2.43.0
>>
