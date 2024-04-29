Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3D1779BD
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424513; cv=none; b=N0ybjVE3Hs+9jtvry3IxnV+o+8KS0Lm8H84jTuP7v3UoL31wqSqEtlG+ZzIo/DdTHuh8yT3+n/yqxvEKgSO/ZCYWc2Mj5oiNSd3topfb86bEXgnxpfWOqp9Z3EnSn+5n4cnYR4qgTT/Kb50zhnKNiOyz6RVyqgttyFnvplIuRTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424513; c=relaxed/simple;
	bh=mDDeEqzJBqctZNEVl5ZwLTGnYmH8htgdAqGFBBXCWZU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WsLrIFlL508UhXrfLU3cCJxP00NfsIf8tf7nNAFFxIWigcSlys5aTdcN9KeGTWUh5qH1csflxzTN4m4mWWUfDBv9tPmGPuaMUTIKa3Fk7vBhac8twa9+ITTZ055bjON3U+cnIRQ0R4Jk0cLRBWu0IjHixBW1IM57GonEk/Pkryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G2eVdR0U; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G2eVdR0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714424510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R8XLxm8s54LstJzOe86yy7jDz1DZmjcDTWkuMd1eVs0=;
	b=G2eVdR0UqejUVl42DDdIK00hubWnC+vZKb0Vsi9d5vpmvbem4R8GZTpdgRNawNftO+7U+w
	6vaM0IzKAwA1QmYBj+oEqAcYhTqQQHZn0JTpBTO8vvl5TfBFQdIoaEoOe8ZPGWkpAME107
	2kcqDBLhgN+j0ooUtyvntWxjIWaC5ls=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-QfW6NQhcPi-IArRlGlUxCA-1; Mon, 29 Apr 2024 17:01:48 -0400
X-MC-Unique: QfW6NQhcPi-IArRlGlUxCA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-41a3369659eso28555075e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Apr 2024 14:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714424507; x=1715029307;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8XLxm8s54LstJzOe86yy7jDz1DZmjcDTWkuMd1eVs0=;
        b=rJ1zGc5Jtf1c8+0Y0CttrKCwd5drU9+9MfrqCZR1t+Da5FwOHHLeeTpJqagonhHlS+
         JaMylm6r6CheBPGbWhQGf09vlWL6/vh/UKhhSVfhsNKgv+yKIK8yM2B0QmsDUGHf/sG7
         UoHq1bVbPAzEWGVyUVQ+3uHbeYj11MA8rAQ5NjVP6Q7hQj1PIBYi3b8TAtcVEwC38C37
         T6TBKfh+mr/yjfa3D9LO3fpA5AdPDgaJv9C1J97BTwDBtXXJtco0NYJ4Sk0Ho9hSlanD
         ipFbwTlYggbRH/MGlYRjCqf3p8b/eq0oyW0kkjJqwrG4KvoiBgKNFKwTysS+9x5ys72N
         HyjA==
X-Forwarded-Encrypted: i=1; AJvYcCVCc9eZLOPnxrcX+d6DmNtZgrvBH8SFodDPMvDJkTpP7jLFnJHMQQPA6irusW1Arj6pNiGKWac8BjWQ1xFAmJLfkbWuu3+8v45Bk0atMeg=
X-Gm-Message-State: AOJu0Yy68IPZDz0vRRThOe9gBxw+slldJ4b+I+eG8zBzSEJ2lfYLEoxQ
	rYVevidglMjqLlr4oNZuqltoyBnmbRYJ+IO/Km1G4oC9Aw+W2HSynOKQofNOUgxUVO5OCGAq5vY
	4WkSmD6I3/dHIuwGOjAPDbemrg1V0J+WuXkfkwiItJ3g7OcKC9tT1GcThqYsopCQc
X-Received: by 2002:a5d:480f:0:b0:34c:df15:9cc3 with SMTP id l15-20020a5d480f000000b0034cdf159cc3mr679176wrq.13.1714424507661;
        Mon, 29 Apr 2024 14:01:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1jbk5bfiIeAVYiK3EiURO0REoRStVX+/piINSh+G0oHr/typ3AUzOPIYM8/b3aoN1i624FQ==
X-Received: by 2002:a5d:480f:0:b0:34c:df15:9cc3 with SMTP id l15-20020a5d480f000000b0034cdf159cc3mr679168wrq.13.1714424507329;
        Mon, 29 Apr 2024 14:01:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d480f000000b0034d5d00979csm1068633wrq.59.2024.04.29.14.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 14:01:46 -0700 (PDT)
Message-ID: <8b68878e-2ddd-4f31-9f82-4abe638bf148@redhat.com>
Date: Mon, 29 Apr 2024 23:01:45 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
To: Boqun Feng <boqun.feng@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, rust-for-linux@vger.kernel.org
References: <20240429192435.2235-1-dakr@redhat.com>
 <Zi_6aDHO4B_iY9zF@boqun-archlinux>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Zi_6aDHO4B_iY9zF@boqun-archlinux>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/24 21:52, Boqun Feng wrote:
> On Mon, Apr 29, 2024 at 09:24:04PM +0200, Danilo Krummrich wrote:
>> Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
>> initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
>> passing a dangling pointer (instead of NULL) to krealloc() whenever a
>> new Vec<T> is created through VecExt<T> extension functions.
>>
>> This only works since it happens that Unique::dangling()'s value (0x1)
>> falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
>> krealloc() hence treats it the same as a NULL pointer however.
>>
> 
> Good catch!
> 
>> This isn't a case we should rely on, especially since other kernel
>> allocators are not as tolerant. Instead, pass a real NULL pointer to
>> krealloc_aligned() if Vec<T>'s capacity is zero.
>>
>> Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> 
> However, since this commit is not upstreamed yet, so it's suject to
> change, I'd avoid the "Fixes" tag here. Alternatively, Miguel can fold
> this patch into that commit in his tree.

I'd be surprised if rust-next wouldn't be fast-forward only, is it? If
fast-forward only, the commit IDs should be preserved on merge, hence it should
be fine to keep the "Fixes" tag.

As for squashing fixes into existing commits, this is something I would generally
not recommend doing. This would be a non-fast-forward operation and hence break
potential references to other commits in general (not only "Fixes" tags). Plus,
it's usually not providing a great motivation for potential contributors.

- Danilo

> 
> Either way:
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> 
> Regards,
> Boqun
> 
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   rust/kernel/alloc/vec_ext.rs | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/rust/kernel/alloc/vec_ext.rs b/rust/kernel/alloc/vec_ext.rs
>> index 6a916fcf8bf1..ffcf8a19f715 100644
>> --- a/rust/kernel/alloc/vec_ext.rs
>> +++ b/rust/kernel/alloc/vec_ext.rs
>> @@ -4,6 +4,7 @@
>>   
>>   use super::{AllocError, Flags};
>>   use alloc::vec::Vec;
>> +use core::ptr;
>>   use core::result::Result;
>>   
>>   /// Extensions to [`Vec`].
>> @@ -137,6 +138,15 @@ fn reserve(&mut self, additional: usize, flags: Flags) -> Result<(), AllocError>
>>   
>>           let (ptr, len, cap) = destructure(self);
>>   
>> +        // We need to make sure that ptr is either NULL or comes from a previous call to
>> +        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
>> +        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>'s capacity
>> +        // to be zero if no memory has been allocated yet.
>> +        let ptr = match cap {
>> +            0 => ptr::null_mut(),
>> +            _ => ptr,
>> +        };
>> +
>>           // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
>>           // `krealloc_aligned`. We also verified that the type is not a ZST.
>>           let new_ptr = unsafe { super::allocator::krealloc_aligned(ptr.cast(), layout, flags) };
>>
>> base-commit: 2c1092853f163762ef0aabc551a630ef233e1be3
>> -- 
>> 2.44.0
>>
> 

