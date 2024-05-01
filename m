Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D834F898
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 15:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714578543; cv=none; b=jlbeuYUN0GcABy9v5VXBKo0fYYiRzCGIMaoJHm+Hl1dcNJtN3R/T0imWQaqzz0a6SDeyfn9g0me7cqV69a+BE1q3zeV2qG3WVOW+9zdM57uuaE9qH53sZlIpEj+jarVIPoA9LEL945w1QGPOmrooOcqwKX0jEUS5A/PLqdX81t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714578543; c=relaxed/simple;
	bh=akxyz0JlehtSx5RbeW8CHtS9tfUo374YLAiBb8lNurQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsbuS0uxeYBV24styutLkSKZVPitcRnFSqlxC6YCE0G4Eml4vy3huPSVOEV2+d1ClyjdS2w4h1nRQjWQACexbilUDx4S2sEMwKP2izXq0Jk2up1h2CjkeAMz12AScmlexlWfeLrdLpgSRIIvKw8IqcCddNVP6XoW+tKG8TzNcvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xwcn+t6A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xwcn+t6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714578540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zUcTkr4EM5mybe+gr3PMu2mKAAQLbP86xZha4moGL4o=;
	b=Xwcn+t6Apf7zynznyVSCGoSD1d3YuAuhQmQYyXeXoZijR8LuVCbanIw6XczVp3UXEQ8QjZ
	xBUboxzTTauWsq1NfjiNONOkN/kPH4Bf31orNKhE/ozg9AFPupS44xtupEzqwEPcBZs5Nm
	1BKyCgbb8NMIkDtWXmgblywdkgI7BDI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-erjGapFxO6aITDeCLQx7Kw-1; Wed, 01 May 2024 11:48:59 -0400
X-MC-Unique: erjGapFxO6aITDeCLQx7Kw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-34da2fe5cf7so440829f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 01 May 2024 08:48:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714578538; x=1715183338;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zUcTkr4EM5mybe+gr3PMu2mKAAQLbP86xZha4moGL4o=;
        b=BMH01LsFF4yJF/C4poB7jpRf9YbWPhJ1Xd0v+15HG6zsFHnspNBsD/oPUEHfubka6h
         Z3dwvLOsDgYOHPh2MSVYRgBwsDEuPwuLRayeBNhrivD0ObSADyCfSJjNCa0N0aU5HnJT
         ZBKoX1PSzCRLfOMK6tSD7Tv19DdcnHnycXoO/ZNolBaezd46/qUve0a9kQzGDG65aIUc
         cEl3pfzI7biSiKVIILnQZkOAmlcBQiXgFOqWxVB7GsvHtAenuOi86WgXLLs9X/a/+7tp
         uJM2q8th9KlRaj5eVg1tsGd7thgm61iTsMDBPlujzzNxaKVv4G1N7kP3r0NdoPNLfMjP
         imjg==
X-Forwarded-Encrypted: i=1; AJvYcCVqv2d8hzIwdGjTbLsbTOylQ193nErZsXOga6cxeEuU/rqRycmKKQ+TJGgRik+QOnx6tJleuCPOXCNvQdRKukvEpWU9xJ8/lVig40ib4mk=
X-Gm-Message-State: AOJu0YzaInT+zIBcNJiIof5da0z8OIbO0oxqM8xKCW8c7O7v3tLRxgkq
	IOlXeSkPAEFDMWqT2lmzq1qsISXEo8IQXDiZ2EJkHqzJyfdpn6vR1WtyOM+1AAgjcIA+wcHSF3p
	IqBGFsv6zS26vhbDAVDWtlRB1gg+R8CIrfVwekbPFFgdHmfYvA3lfdTSy1qUcUqBa
X-Received: by 2002:a5d:4f0f:0:b0:34d:7a55:5060 with SMTP id c15-20020a5d4f0f000000b0034d7a555060mr34909wru.11.1714578538127;
        Wed, 01 May 2024 08:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxeeSrbtuVgxbZ3hjsx7cmz9xt5hG2NbzSbmbeoURhVOLVV0b/sMnCWXfije2NoaplG+m79g==
X-Received: by 2002:a5d:4f0f:0:b0:34d:7a55:5060 with SMTP id c15-20020a5d4f0f000000b0034d7a555060mr34888wru.11.1714578537697;
        Wed, 01 May 2024 08:48:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id t13-20020adfe10d000000b0034cfa17d74dsm8570326wrz.104.2024.05.01.08.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 08:48:57 -0700 (PDT)
Message-ID: <4d45fd05-a206-4038-aba2-cf60deab5048@redhat.com>
Date: Wed, 1 May 2024 17:48:56 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP 3/8] rust: alloc: implement AllocatorWithFlags trait
To: Benno Lossin <benno.lossin@proton.me>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 a.hindborg@samsung.com, aliceryhl@google.com, ajanulgu@redhat.com,
 zhiw@nvidia.com, acurrid@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com,
 rust-for-linux@vger.kernel.org
References: <20240429201202.3490-1-dakr@redhat.com>
 <20240429201202.3490-4-dakr@redhat.com>
 <b098c9ee-a9b5-4bef-8703-ef56e6b1dcb7@proton.me> <ZjI6k4YUsdUA_LaF@pollux>
 <87aabc79-6034-42a2-8987-4c8b0d4e17ee@proton.me>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <87aabc79-6034-42a2-8987-4c8b0d4e17ee@proton.me>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/1/24 17:39, Benno Lossin wrote:
> On 01.05.24 14:50, Danilo Krummrich wrote:
>> On Wed, May 01, 2024 at 08:32:01AM +0000, Benno Lossin wrote:
>>> On 29.04.24 22:11, Danilo Krummrich wrote:
>>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>>> ---
>>>>    rust/kernel/alloc.rs | 21 +++++++++++++++++++++
>>>>    1 file changed, 21 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
>>>> index 9bc1b48b5641..ec45ba8f77ce 100644
>>>> --- a/rust/kernel/alloc.rs
>>>> +++ b/rust/kernel/alloc.rs
>>>> @@ -8,6 +8,14 @@
>>>>    pub mod box_ext;
>>>>    pub mod vec_ext;
>>>>
>>>> +use core::{
>>>> +    alloc::{Allocator, AllocError, Layout},
>>>> +    ptr,
>>>> +    ptr::NonNull,
>>>> +};
>>>> +
>>>> +use flags::*;
>>>> +
>>>>    /// Flags to be used when allocating memory.
>>>>    ///
>>>>    /// They can be combined with the operators `|`, `&`, and `!`.
>>>> @@ -68,3 +76,16 @@ pub mod flags {
>>>>        /// small allocations.
>>>>        pub const GFP_NOWAIT: Flags = Flags(bindings::GFP_NOWAIT);
>>>>    }
>>>> +
>>>> +pub unsafe trait AllocatorWithFlags: Allocator {
>>>> +    unsafe fn alloc_flags(&self, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>;
>>>> +    unsafe fn realloc_flags(&self, ptr: *mut u8, old_size: usize, layout: Layout, flags: Flags) -> Result<NonNull<[u8]>, AllocError>;
>>>
>>> Please use `rustfmt`, there exists a make target that does it for you.
>>
>> Sure, gonna fix.
>>
>> Out of curiosity, given that we have this make target, the expectation obviously
>> seems to be that all Rust code in the kernel must be formatted with this. I
>> think that's indeed desirable. Two questions regarding this:
>>
>> How do we scale (as in ensure) this once Rust code becomes more common in
>> subsystems?
> 
> There also is the make target `rustfmtcheck` which can be used to check
> if the code has been formatted correctly (ie it will error on wrongly
> formatted code).
> IIRC there were some plans to add such a check to CI, but I don't know
> the status of that.
> 
>> Is it possible for rustfmt to change rules unexpectedly? If so, how would we
>> deal with that?
> 
> AFAIK, `rustfmt` has a stable format [1] and if we really find
> something that breaks our code, we can also add our own defaults to the
> `.rustfmt.toml`.
> 
> [1]: https://rust-lang.github.io/rfcs/2437-rustfmt-stability.html
> 
>>> Also why are these functions `unsafe`? You haven't specified a `Safety`
>>> section, which means nobody knows what the requirements are.
>>
>> I think I did this because they did inherit the safety requirements from
>> krealloc() (as you also point out in another patch).
>>
>> I think they shouldn't be unsafe, just as the corresponding Allocator ones
>> aren't.
>>
>> Gonna change that.
> 
> Sounds good.
> 
>>>> +
>>>> +    fn default_allocate(&self, layout: Layout) -> Result<NonNull<[u8]>, AllocError> {
>>>> +        unsafe { self.realloc_flags(ptr::null_mut(), 0, layout, GFP_KERNEL) }
>>>> +    }
>>>
>>> Why do we want to have these functions? I think that it would make sense
>>> to forbid all other ways of allocating memory. So only allow allocation
>>> where the flags are explicitly passed.
>>
>> I agree that we should forbid allocating memory with implicit default page
>> flags.
>>
>> I added them, since I think we'll always need some implementation of the
>> Allocator trait. And this just was the obvious generic implementation.
>>
>> If we agree to forbid allocating without page flags, we can just always return
>> an error?
> 
> There are multiple options that we could do here:
> 1. Return an error.

I'd WARN() additionally here.

> 2. Print a warning at runtime and allocate regardless. Additionally use
>      `klint` to lint against usage of that function.
> 3. Use `build_error!`.

Agreed, that'd be even better - Will give that a shot.

> 
> I think that 1 could be very unexpected and hard to debug. 2 is better,
> but at the moment `klint` is not required to run, so we would have to
> change that. 3 is my preferred option, but I am not 100% confident that
> it will work.
> 
> So maybe give option 3 a try and if that doesn't work, we can try to
> come up with a different solution.
> 

