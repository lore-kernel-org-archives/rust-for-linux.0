Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28C238D40A
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088746; cv=none; b=Nuf0fDTUo8OriLZ51GgA4OYEtgEa/lxIcTPyOwclwrb06r9Y5vZhjkvtUTDszwn3nQ+g7W0VzxNFwvnxO47JUQKm0DdXx9n2gC6HflG5OqyJm+nC647WwnyzqpM2jJe9eFd5m8fwM4H8ZnWbPALggPZ78rTdTD/ILFdQ50v7JGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088746; c=relaxed/simple;
	bh=NTeZEZyafqPk8/2NoFpLPL+V8tanYZzlsAMKuDv00QM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPXlXfYW2iAcbsgcROjDWwCScOO5vEdFjfL6Y50lbHI9GnLxRW7RGf6XX1pGNUkq6axk3suhwAAZ50wuMuscTNQu9NAMZoCqA5D9Z+/2PrVI5RAWnImn4keSCFOx4ofpcp7zGkpWaJKOOrdr+GY5LjD5PMChKK2ntkniGHXOfu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=A2BUcKrl; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="A2BUcKrl"
Message-ID: <44744324-888d-44de-b037-11964fbaf037@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786088741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9vzjYZ4GSlV7vg5GLvIWnMkpY2opNiPR7FBbvalFXs4=;
	b=A2BUcKrl6IRA6aZ3wDkjRqUytSUMG6KyzbSH5+11hHEakiM8og8mJNchdDZiUD/jyLUozn
	AUWvDBBl9golousJyAywmoyTim5/P6RDUEmpj2PNYgadjeq1hKVUtaIPpH5tF8FMWT0u1n
	DpQCmx6ERwtIaUaI0Jed7xDW1mUd7uw=
Date: Fri, 7 Aug 2026 15:45:23 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v13 2/2] rust: fmt: route {:p} through HashedPtr to
 prevent address leaks
To: Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
 <20260706-hashedptr-v13-2-377a07f2f78d@kylinos.cn>
 <anLxCshIflMu-1zI@google.com> <anSZIy78YzTH_CAb@desktop>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <anSZIy78YzTH_CAb@desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 8/6/26 22:24, Link Mauve wrote:
> On Wed, Aug 05, 2026 at 08:15:06AM +0000, Alice Ryhl wrote:
>> On Mon, Jul 06, 2026 at 01:18:44PM +0800, Ke Sun wrote:
>>> Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
>>> so that `{:p}` formatting uses the kernel's `%p` hashed format instead
>>> of printing raw pointer values, preventing kernel address space leaks.
>>>
>>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> Overall looks good to me, but one thing:
>>
>>> +impl<T: ?Sized> Pointer for HashedPtr<T> {
>>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>> +        use crate::str::CStrExt as _;
>>> +
>>> +        let mut buf = [0u8; 32];
>>> +
>>> +        // SAFETY: `buf` is a valid, writable buffer of 32 bytes, sufficient for all architectures
>>> +        // (max 19 bytes for 64-bit). The format string `c"0x%p"` is null-terminated and `%p`
>>> +        // matches the pointer argument.
>>> +        let len = unsafe {
>>> +            crate::bindings::scnprintf(
>>> +                buf.as_mut_ptr().cast(),
>>> +                buf.len(),
>>> +                // Rust's `{:p}` includes a "0x" prefix, the kernel's `%p` does not.
>>> +                c"0x%p".as_char_ptr(),
>>> +                self.0.cast::<core::ffi::c_void>(),
>>> +            )
>>> +        };
>> When given a null pointer, this will print 0x(null), which seems a bit
>> weird. It may also print 0x(ptrval) or 0x(____ptrval____) during early
>> boot.
> I’ve also seen a bunch of 0x(ptrval) during testing.

Same `0x(ptrval)` issue — also addressed in v14.

>
> This series resolves a mystery where I thought I was crazy since
> addresses of pointers and references were never what I thought they
> were, and instead were always on the stack, thanks a lot for resolving
> this!

I was just as confused — spent quite a while debugging before
realizing `{:p}` was the culprit. I'll send v14 shortly, would
be great if you could give it another spin.

>
> Tested-by: Link Mauve <linkmauve@linkmauve.fr>

Thanks for testing!

Best regards,
Alvin

>
>> It seems like it'd be nice to special-case these to provide better
>> output in those cases.
>>
>> Alice
>>
