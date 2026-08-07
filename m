Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EFB45DF72
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786089693; cv=none; b=ElGhHVXkHuOZ07wgHs0vi7JXtywhZYuUn7N+uCy8zP9d5g6guIVCfzyIEqKbzPzO1oego46DZESX58LNMqf/6ON31brqcwTlg10Jx+hIY2uzCyEd3IiAStmfS6xqjUL9ThPlzPELV2LZoJmf21orX32okNEInjMDLrs+fqqR4Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786089693; c=relaxed/simple;
	bh=ISdZ6oXmEjBT0hHV21ICRgveFwD1vNjiE/jCbEtLnSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djaGGr4CCYOAqXHI2PPp+cHjlMGZYMAmR0ZDjGjorYS3oR1ubeVrKpLbX3wOCMyMwngEy88haRENR8526w3P8Di7v1Ode+tfZe/7mN0VoRTdfb3wy8bXe7xKf+gYrYm1htyDSNKLWPZKMki1jR+wy7uHRJZNgznrqE35eTiv9cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2caced6038eso22103105ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 01:01:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786089687; x=1786694487;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cuuj9fXTVgUBM92motqgcjyFWe1OWgBBU8eslEuZEIs=;
        b=MsSfrHHtqxA7fAjZP2n55e1V41sn88lqe5WULwHdE/e8JOKFobUhhSXSD6YuC3LxOg
         8y5o5vIWwaZSR0oZ5F3Uw8Rx7ckIKr0FO6hbu9raxDg7SssjkIdx1ReY2DNVYARO1TSv
         Uu7wzciVwEaYyGz+1dmN2YrRQjJQ0Tgw6iZ/1YGKWrK/Ul3thLmqb7WgDi4+iT7S0yKb
         mqGBV8Y/5k4/1kyWmd0JIeHu8zQ7AOzNEMyZBByMmHhdLT1I6I7k+KhByoVvKfQGgZR/
         f8Jye7jlhUeo5QcA6zYw4FNZPpWLkd1MeTWTkmOClG4CIZHgZk/5TioAc4TQGYiNNpNH
         5ohw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1eZhZ2+MDkkTu0LqYZB+XaXSfqfsCiMDgZWXp8GzTirUYCLARDR2hm752xIAQqTTq6+I8mbXQAZ7G1RDFFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPJ40QZ5IWwFWAn4TVtIyUvHy5f0ttVv4sqWJV1iQqxvjUr5Zx
	3ca6si5u/FsGskPxfEjHFrf9NmRFMWn7bCQ42bnFBJQ9JP0cSenLdlXG
X-Gm-Gg: AR+sD10oSNcVXceH8Tl/LxZpwcLGUJGnkAH8yZbEm84yofvXwXLHTOBaaYIrnLZALRf
	OslyyOxI1sYZnvcoIS7adrVaz41aPuO8K/0nPkvEgIMCYp9IGnmPd5nh+w6OWWWpE7b2m8V5L+m
	FHmGJARvtQyQvi1Uj9EaRtXVETlilD+6e0wHatlml+lQm20TjWCiVKncW74rA7heXMSQnXgHvOM
	lF+fH8YUHWK9XL7YF/vqbwtE450two7eo7QUoplQD2tkpgo3MobHfgeQn2GP7/1nBevm7gzLOu8
	L2Dx+TLD5nW8gmLg9J5zHrGhPPli3ENpi+3wMrINUNXSd+AFieJSd6sBCfGyXInPZBp2qBoOmDJ
	Cir7jcBUKRM+wrCwf9+4mo0k7hg46XxEuAWt6b4ug3QZQOzC2tp+sp0lE0yNbISNlviRMErSY0F
	2tQwr6QVk0sQ9r18MqUTAw8P37r0/hXg==
X-Received: by 2002:a17:902:ce91:b0:2ca:2390:ff13 with SMTP id d9443c01a7336-2d0f704cc6fmr55509495ad.5.1786089687522;
        Fri, 07 Aug 2026 01:01:27 -0700 (PDT)
Received: from [10.0.11.3] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d123ac7b7bsm5189225ad.0.2026.08.07.01.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 01:01:25 -0700 (PDT)
Message-ID: <3403777f-f413-40f3-8033-85b02a7be242@kylinos.cn>
Date: Fri, 7 Aug 2026 16:01:16 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v13 2/2] rust: fmt: route {:p} through HashedPtr to
 prevent address leaks
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
 <20260706-hashedptr-v13-2-377a07f2f78d@kylinos.cn>
 <anLxCshIflMu-1zI@google.com>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <anLxCshIflMu-1zI@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/5/26 16:15, Alice Ryhl wrote:
> On Mon, Jul 06, 2026 at 01:18:44PM +0800, Ke Sun wrote:
>> Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
>> so that `{:p}` formatting uses the kernel's `%p` hashed format instead
>> of printing raw pointer values, preventing kernel address space leaks.
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> Overall looks good to me, but one thing:
>
>> +impl<T: ?Sized> Pointer for HashedPtr<T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        use crate::str::CStrExt as _;
>> +
>> +        let mut buf = [0u8; 32];
>> +
>> +        // SAFETY: `buf` is a valid, writable buffer of 32 bytes, sufficient for all architectures
>> +        // (max 19 bytes for 64-bit). The format string `c"0x%p"` is null-terminated and `%p`
>> +        // matches the pointer argument.
>> +        let len = unsafe {
>> +            crate::bindings::scnprintf(
>> +                buf.as_mut_ptr().cast(),
>> +                buf.len(),
>> +                // Rust's `{:p}` includes a "0x" prefix, the kernel's `%p` does not.
>> +                c"0x%p".as_char_ptr(),
>> +                self.0.cast::<core::ffi::c_void>(),
>> +            )
>> +        };
> When given a null pointer, this will print 0x(null), which seems a bit
> weird. It may also print 0x(ptrval) or 0x(____ptrval____) during early
> boot.

Thanks to Gary's suggestion, `%#p` in v14 adds the "0x" prefix for
normal pointers but leaves placeholder tokens like "(____ptrval____)"
untouched.

Best regards,
Alvin

>
> It seems like it'd be nice to special-case these to provide better
> output in those cases.
>
> Alice
>
