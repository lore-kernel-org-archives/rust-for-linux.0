Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805EC3A3E91
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087957; cv=none; b=ePn08N8U2CcaJcmOPfeSpxVVR7VeelyUq5zEdC13KQYbwcqeESAh3QggCVQ5dT4OeP4FLuyUty9PEBAWC2Oaqf+DowLnGZ64P9gTQF+WgE7JQP8zxvaN3+7MBwrcF0PbdCI9sU78h6R1pYeoCe5rdTUcIVNbeQDj2vtyVOA3RDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087957; c=relaxed/simple;
	bh=6y1c91fgjclXXX3q7eoCwkYdCOu+CmejUzOcvXK4IGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LeAuCweRBSLw229OuNd1rw+FxaeeBtYAAv6FE3pcSpsHokC+A23fp3bYTvmvSqqy8Lq/uqXkBbueipKFcD0knH+tnOqu/9ZHBUKgdCwW9Ae52nx2H3nHtucmfjOgNehqIYlFS5WYuNLtGrlGItHe6Vz3jM2EaTfFyhOrLFaTBjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so45076345ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Aug 2026 00:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786087944; x=1786692744;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+YnlApfBOqkyLj2V1+8OgePCwbp5D/qP6XkukNPn8Q=;
        b=Ba7Q+ZQFlL20Y61XaynDem4LHXyb5V2T9ZE6PVSbsfnRmT7x7GAqCuek8K7gfhNVaL
         egMccA/fahxt+AJxCcTIbU4GwAH29lC5tT4fG0RhAEAvlmfXC0Usyx9cNiWP6FpVzD3M
         a8U7Hur9wxB+X/flziA4TDf9YksnswiyzNA6JMll9XpBJzMsbBdhL23wxoR2BEKdbUTA
         CsIx6X4fQWuVp+lxV41oC1ak2kvdDIgP+vTnR/MkJHtR2G9BsuX/pGkoz8xLlnFZbISf
         TbMMhD3Mjeiuew7CBseMEjUKZILt4BzCEeAaOCN6YvKlhAcFWDNrPERZRvSphD0KY4E0
         bybg==
X-Gm-Message-State: AOJu0Yzl1xqMeHfxD9Laq8c5+myNI5LKSVlk7PMvvZEPJw/xuaZ3uyCJ
	Ejzk6NVTfa+5aIbcX9n5lY2ZLviaoYrGHzyj8p7aMr22+rLR0xAbigA+
X-Gm-Gg: AR+sD13Y/1WH3VVMHqSZWPbBkHobVCN1TZoKzov+/4Qb75qDNPGzZBxnr5HmYy5Bkx9
	6rLnjaHcVsRvSwkRJ8pIS1HSMHNTmuBkxXl1QWlzpv+/jnfpvBWcGEPtRBuhas4DUATGGEDM4xb
	KkNS9sNPZ6mfpavehWiLL0WYCA1e7YzL3J1KSkfE9JrcJqn9cdHKodYZ9NaSOc0DPZhgGB3TYxy
	eHrMIg8H/AupXfiGCpiJHA1PvLViKPgZ1Hn5gil5IK+WLi3uqfBHhSZ0ZIbkkIHImnmSRCrBkLa
	5/3ztT9bMncwe8ncRb8NybDc548M6hZyN2O6iP8ye3MXt68txa36k0sZbmfozaoMebU8QsijOxw
	pB4REuLiZkTVWmzHCmmGH5TJwLAxhGw8Md72qvJmiCwZgcDHFM2fkkRcOkkItP6vdwPmH/QKm0i
	8R+PEmXG5oH6MQHOz5L47X1bZzs2LF
X-Received: by 2002:a17:903:2b03:b0:2ca:4f33:e86f with SMTP id d9443c01a7336-2d294c222b1mr23158405ad.12.1786087943994;
        Fri, 07 Aug 2026 00:32:23 -0700 (PDT)
Received: from [10.0.11.3] ([2a11:3:200::10a9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeab3dsm4721425ad.47.2026.08.07.00.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 00:32:23 -0700 (PDT)
Message-ID: <424ddf87-35bf-4a3a-8477-1ac4dddad6c6@kylinos.cn>
Date: Fri, 7 Aug 2026 15:32:13 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v13 2/2] rust: fmt: route {:p} through HashedPtr to
 prevent address leaks
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn>
 <20260706-hashedptr-v13-2-377a07f2f78d@kylinos.cn>
 <DKHXU8YP6CK0.1PJTQJKC3VRLB@garyguo.net>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <DKHXU8YP6CK0.1PJTQJKC3VRLB@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/6/26 22:41, Gary Guo wrote:
> On Mon Jul 6, 2026 at 6:18 AM BST, Ke Sun wrote:
>> Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
>> so that `{:p}` formatting uses the kernel's `%p` hashed format instead
>> of printing raw pointer values, preventing kernel address space leaks.
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>   rust/kernel/fmt.rs | 166 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 164 insertions(+), 2 deletions(-)
>>
>> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
>> index cd7d9664ff5b9..3d154dad06f64 100644
>> --- a/rust/kernel/fmt.rs
>> +++ b/rust/kernel/fmt.rs
>> @@ -39,13 +39,106 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>       LowerExp,
>>       LowerHex,
>>       Octal,
>> -    Pointer,
>>       UpperExp,
>>       UpperHex, //
>>   };
>> +use core::ptr::NonNull;
>>   impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
>>   
>> -impl<T: ?Sized + Pointer> Pointer for Adapter<&T> {
>> +/// A copy of [`core::fmt::Pointer`] that allows implementing pointer formatting for foreign types.
>> +///
>> +/// Together with the [`Adapter`] type and [`fmt!`] macro, it enables raw pointer formatting to be
>> +/// intercepted and routed to [`HashedPtr`] (kernel's `%p` hashed format), preventing kernel address
>> +/// leaks.
>> +///
>> +/// [`fmt!`]: crate::prelude::fmt!
>> +pub trait Pointer {
>> +    /// Same as [`core::fmt::Pointer::fmt`].
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
>> +}
>> +
>> +/// A wrapper for pointers that formats them using kernel's `%p` format specifier.
>> +///
>> +/// By default, `%p` prints a hashed representation of the pointer address to prevent kernel address
>> +/// leaks. When the `no_hash_pointers` kernel command-line parameter is enabled, the real address is
>> +/// printed instead (for debugging purposes).
>> +pub struct HashedPtr<T: ?Sized>(pub *const T);
>> +
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
> `%#p` should do the trick?
>
>> +                c"0x%p".as_char_ptr(),
>> +                self.0.cast::<core::ffi::c_void>(),
>> +            )
>> +        };
>> +
>> +        // SAFETY: "0x%p" produces only ASCII, which is valid UTF-8.
>> +        let hashed_str = unsafe { core::str::from_utf8_unchecked(&buf[..len as usize]) };
>> +
>> +        // Handle `{:0width$p}`: insert zeros after "0x" prefix.
>> +        if f.sign_aware_zero_pad() {
> zero pad can be implemented by `%0*p`.

`%#0*p` handles both the "0x" prefix and zero-padding in one pass,
and also fixes the "0x(____ptrval____)" issue Alice reported.

>
>> +            if let Some(width) = f.width() {
>> +                if hashed_str.len() < width && hashed_str.starts_with("0x") {
>> +                    return write!(f, "0x{:0>width$}", &hashed_str[2..], width = width - 2);
>> +                }
>> +            }
>> +        }
>> +
>> +        // Use `f.pad` to handle width/alignment formatting.
>> +        f.pad(hashed_str)
>> +    }
>> +}
>> +
>> +// Raw pointers are formatted via `HashedPtr` (kernel `%p`: hashed by default, plain with
>> +// `no_hash_pointers`).
>> +impl<T: ?Sized> Pointer for *const T {
>> +    #[inline]
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        Pointer::fmt(&HashedPtr(*self), f)
>> +    }
>> +}
>> +
>> +impl<T: ?Sized> Pointer for *mut T {
>> +    #[inline]
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        <*const T as Pointer>::fmt(&(*self).cast_const(), f)
> This could just be
>
>      Pointer::fmt(&HashedPtr(*self), f)

All the impls are `#[inline]`, so the compiler will eliminate the
intermediate calls anyway — but the direct style is cleaner. I'll
switch the other impls to the `HashedPtr(...)` form in v14.

Best regards,
Alvin

>
> by making use of `*mut T` -> `*const T` coercion. This would avoid doing
> multiple indirection. Same for all other impls below.
>
> Best,
> Gary
>
>> +    }
>> +}
>> +
>> +impl<T: ?Sized> Pointer for &T {
>> +    #[inline]
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        <*const T as Pointer>::fmt(&core::ptr::from_ref(*self), f)
>> +    }
>> +}
>> +
>> +impl<T: ?Sized> Pointer for &mut T {
>> +    #[inline]
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        <*const T as Pointer>::fmt(&core::ptr::from_ref(*self), f)
>> +    }
>> +}
>> +
>> +impl<T: ?Sized> Pointer for NonNull<T> {
>> +    #[inline]
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        <*const T as Pointer>::fmt(&self.as_ptr().cast_const(), f)
>> +    }
>> +}
>> +
>> +// `Adapter<&T>` bridges our `Pointer` trait to `core::fmt::Pointer`
>> +impl<T: Pointer> core::fmt::Pointer for Adapter<&T> {
>>       #[inline]
>>       fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>           Pointer::fmt(self.0, f)
>> @@ -112,3 +205,72 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>       {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
>>       {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
>>   );
>>
