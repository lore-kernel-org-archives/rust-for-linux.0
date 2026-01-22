Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBFD48124C
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769069517; cv=none; b=J12ugscDNxN5uLKmffwIW6PT3G0eS1SbWxXEkRhB5ARKNVq//8rkQYvwIX1zeGttlk5h+tyGpK1z1wlW2MJqWX29VmewhgAKmXxuPgb6+NvVns3h8k62Dbz9zwokyMEW9SFtA2ZFIQFCY+G9OrRgPLG5+BachdbvkiK4IL2sRpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769069517; c=relaxed/simple;
	bh=m3aU7DWy/M0SGJlaemXL5AdqBBouFELXzwf7AqL65e4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pPkDc6+FYqXaNQ8C9srDEOzhYjfeM3WS82TNo3Iwf1kJ5HSRnepe9BQUUPfvwRXY7mVYQUmbrWYrTzcqX1FGbUmINLiBUgQMM+W/Prj78WVQkY7jdXpjhZqvTwG7EGVdBXAM11fwdOfhlbVLQor652Lr3uPxDQJvpCHsSZwM9bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a76f90872cso3947135ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 00:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769069511; x=1769674311;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hM1DAqo90xa+7zxJY9rFUvG717i0Et5sJh+cWEbjvMM=;
        b=jvUGr+UWdu2G0lX+CLNH5D8T/Co5hYDUJElxrZJGERNmdmcAkq6zbzCMjhv0BNYfHx
         ztvTMyRzlO3nNJ4kMBt3Qr+craM9OgVjft+foRNXOby3l7lKJSa7wZMnWuG5zMQtnKz1
         deWQsvL9isimyIfOHFhdqVLTggWA1L1y8IDno3aM7mjsREU5AJ51qGRZVY1/atDomT1a
         5+rmHjp8pwQPY9BALGp7o2IKk3prJZiJGHx2h8NkYzvrv9uO5tRoVMcnPAxuAblu/1vx
         y9maLLtixI8h+ZiM1+WzETaup9Hj7zvCVQlPIjfwJXt4CFPUU4hXWpP3noxodA5mC3H7
         zpAA==
X-Forwarded-Encrypted: i=1; AJvYcCUidgBFz+6L+wiGZ5X9fQu8nVGKQQzuT5asKp+fK2Du9GBSNN8DPLjhONMqY4TblFeI62HPuD44N7CzWbYJdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn59G3UKegzlcOtcU0NYhlwOon4N5Vlw/BhxcoG9hmofc4b6y9
	Lbtbq1vo+czN02zYqlzc0KvM27UhnS9okM9xruRiMHBP/R+IV7YQcD8L
X-Gm-Gg: AZuq6aIdnWKQevS4r0X8/vkLwo/dtCt1ZZLM67ZAMsaFnFeP033gNOvl7fM+9E56eaR
	+I5Z5HI02w9x4Y+tJxEFxKKAXxg9InIwfv3PqPZX9S2RwQj5rMJVJR9t5f0ypH5AbMHvFJ+D/tK
	hL3I561qLCI+/l33Z7WxXioiXZWpw56xQv0gz/uVBmeW6OhmdLddKRo6PiYoOqlWH9Gw9ivnWsi
	PHmyRZF88tRn1khddNhY9/1HwZS10CcLi7qrenlULR2ch4/GD2zsduQ4qXaOypNwqqFIGepOQ5p
	kopZiD40bGbBnAYYmyW5ijC/QpkgJATLIPZrK4J+WyfsMza7fEQz763NrXoevS09TfU5NnWkwX2
	O6NiDnsfn083xR9jBvbxAws12UARMsHJ72b01Ksmmh1WQoQ/UYVOuos/spHtNNjFAwWPT8RH3Ew
	4cpSzcWJZAvUSbqKEOTM5rGVjJRkfEvR+EOPaDHJ71XQ==
X-Received: by 2002:a17:902:e74e:b0:2a7:80ac:85b2 with SMTP id d9443c01a7336-2a780ac8660mr68940805ad.16.1769069511472;
        Thu, 22 Jan 2026 00:11:51 -0800 (PST)
Received: from [10.0.10.3] (210-61-187-173.hinet-ip.hinet.net. [210.61.187.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce534sm172622985ad.27.2026.01.22.00.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 00:11:50 -0800 (PST)
Message-ID: <d14e3fc0-26df-489c-8fe3-f430fed1275e@kylinos.cn>
Date: Thu, 22 Jan 2026 16:11:39 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] rust: fmt: add safe pointer formatting support
From: Ke Sun <sunke@kylinos.cn>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org
References: <20260121050059.2315091-1-sunke@kylinos.cn>
 <20260121050059.2315091-2-sunke@kylinos.cn>
 <CAJ-ks9=5NWkeOUVQ+PwSB7nfSxgn1brseC=OP5cG+78oT34WUg@mail.gmail.com>
 <b3d24a14-6d9c-457b-98f3-64226c0bc68c@kylinos.cn>
In-Reply-To: <b3d24a14-6d9c-457b-98f3-64226c0bc68c@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/22/26 15:53, Ke Sun wrote:
>
> On 1/22/26 02:06, Tamir Duberstein wrote:
>> On Wed, Jan 21, 2026 at 12:01 AM Ke Sun <sunke@kylinos.cn> wrote:
>>> Add Pointer trait and two pointer wrapper types for safe pointer
>>> formatting:
>>>
>>> - Pointer trait: A copy of core::fmt::Pointer for foreign types.
>>>
>>> - HashedPtr: Formats pointers with kernel hashing (corresponds to %p).
>>>    This is now the default behavior when formatting raw pointers with
>>>    "{:p}", preventing kernel memory layout information leakage.
>>>
>>> - RawPtr: Formats raw address without hashing (corresponds to %px).
>>>
>>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>>> ---
>>>   rust/kernel/fmt.rs | 168 
>>> ++++++++++++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 166 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
>>> index 84d634201d90a..d53184d0a12bc 100644
>>> --- a/rust/kernel/fmt.rs
>>> +++ b/rust/kernel/fmt.rs
>>> @@ -27,8 +27,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>>       };
>>>   }
>>>
>>> -use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, 
>>> UpperExp, UpperHex};
>>> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, 
>>> Pointer, LowerExp, UpperExp);
>>> +use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, 
>>> UpperHex};
>>> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, 
>>> LowerExp, UpperExp);
>>>
>>>   /// A copy of [`core::fmt::Display`] that allows us to implement 
>>> it for foreign types.
>>>   ///
>>> @@ -90,3 +90,167 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>>       {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: 
>>> core::fmt::Display},
>>>       {<T: ?Sized>} crate::sync::UniqueArc<T> {where 
>>> crate::sync::UniqueArc<T>: core::fmt::Display},
>>>   );
>>> +
>>> +/// A copy of [`core::fmt::Pointer`] that allows us to implement it 
>>> for
>>> +/// foreign types.
>>> +///
>>> +/// Types should implement this trait rather than 
>>> [`core::fmt::Pointer`].
>>> +/// Together with the [`Adapter`] type and [`fmt!`] macro, it 
>>> allows for
>>> +/// formatting foreign types (e.g. types from core) which do not 
>>> implement
>>> +/// [`core::fmt::Pointer`] directly.
>> This doesn't seem applicable here.
>>
>>> +///
>>> +/// By default, raw pointers (`*const T` and `*mut T`) are 
>>> formatted using
>>> +/// [`HashedPtr`], which hashes the pointer value to prevent 
>>> leaking kernel
>>> +/// memory layout information.
>> This seems odd to mention on the trait given the description above
>> states the trait is for implementing on foreign types. We should
>> probably state that this exists *only* to prevent raw pointers from
>> being formatted.
>>
>>> +///
>>> +/// [`fmt!`]: crate::prelude::fmt!
>>> +/// # Example
>> Can we have some proper tests instead? i.e. this doesn't show us what
>> the hashed result looks like. It might be tricky to get the correct
>> CONFIG conditions.
>
> The `no_hash_pointers` config is exported, and
> `kunit_run_all_tests()` happens to run before
> `mark_readonly()`:
>
>   kernel_init()
>     |- kernel_init_freeable()
>     |      \ - kunit_run_all_tests()
>     |- mark_readonly()
>
> So we can save the value of `no_hash_pointers`,
> modify it to run some tests, and restore it
> after testing:
>
> /// let no_hash_pointers = unsafe { bindings::no_hash_pointers };
> /// let ptr_const = 0x12345678 as *const u8;
> /// let ptr_mut = 0x12345678 as *mut u8;
> ///
> /// unsafe { bindings::no_hash_pointers = false; }
> /// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr_const))?;
> /// assert_eq!(cstr.to_str()?.starts_with("0x00000000"), true);
> ///
> /// unsafe { bindings::no_hash_pointers = true; }
> /// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr_mut))?;
> /// assert_eq!(cstr.to_str()?, "0x0000000012345678");
> ///
> /// unsafe { bindings::no_hash_pointers = no_hash_pointers; }
>
Of course, I will adjust the test content according to the
pointer width.
> Are these tests sufficient? If so, remove the doctests for
> RawPtr and HashedPtr, and keep only this one for the Pointer
> trait？
>
> I will remove the transparent declarations and fix inappropriate
> comments.
>
> Thanks,
> Ke Sun
>
>>
>>> +///
>>> +/// ```
>>> +/// use kernel::{
>>> +///     prelude::fmt,
>>> +///     str::CString, //
>>> +/// };
>>> +///
>>> +/// // Works with const pointers
>>> +/// let ptr_const = 0x12345678 as *const u8;
>>> +/// pr_info!("Default pointer: {:p}\n", ptr_const);
>>> +///
>>> +/// // Works with mut pointers
>>> +/// let ptr_mut = 0x12345678 as *mut u8;
>>> +/// pr_info!("Default pointer: {:p}\n", ptr_mut);
>>> +///
>>> +/// // Width option test
>>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr_const))?;
>>> +/// assert_eq!(cstr.to_str()?.len(), 30);
>>> +/// # Ok::<(), kernel::error::Error>(())
>>> +/// ```
>>> +pub trait Pointer {
>>> +    /// Same as [`core::fmt::Pointer::fmt`].
>>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
>>> +}
>>> +
>>> +impl<T: ?Sized + Pointer> Pointer for &T {
>>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>> +        Pointer::fmt(*self, f)
>>> +    }
>>> +}
>>> +
>>> +impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
>>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>> +        let Self(t) = self;
>>> +        Pointer::fmt(t, f)
>>> +    }
>>> +}
>>> +
>>> +macro_rules! impl_hashed_pointer {
>>> +    ($($ptr_ty:ty),* $(,)?) => {
>>> +        $(
>>> +            impl<T> Pointer for $ptr_ty {
>>> +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>> +                    Pointer::fmt(&HashedPtr(*self), f)
>>> +                }
>>> +            }
>>> +        )*
>>> +    };
>>> +}
>>> +
>>> +impl_hashed_pointer!(*const T, *mut T);
>>> +
>>> +/// A pointer that will be hashed when printed (corresponds to `%p`).
>>> +///
>>> +/// This is the default behavior for kernel pointers - they are 
>>> hashed to
>>> +/// prevent leaking information about the kernel memory layout.
>>> +///
>>> +/// # Example
>>> +///
>>> +/// ```
>>> +/// use kernel::{
>>> +///     fmt::HashedPtr,
>>> +///     prelude::fmt,
>>> +///     str::CString, //
>>> +/// };
>>> +///
>>> +/// let ptr = HashedPtr(0x12345678 as *const u8);
>>> +/// pr_info!("Hashed pointer: {:p}\n", ptr);
>>> +///
>>> +/// // Width option test
>>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
>>> +/// let width_30 = cstr.to_str()?;
>>> +/// assert_eq!(width_30.len(), 30);
>>> +/// # Ok::<(), kernel::error::Error>(())
>>> +/// ```
>>> +#[repr(transparent)]
>> Does this matter?
>>
>>> +#[derive(Copy, Clone)]
>>> +pub struct HashedPtr<T>(pub *const T);
>>> +
>>> +impl<T> Pointer for HashedPtr<T> {
>>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>> +        let ptr = self.0;
>>> +        // The default width for %p is 2 * sizeof(ptr) (see 
>>> lib/vsprintf.c:
>>> +        // pointer_string() and ptr_to_id()), which is 16 
>>> characters on
>>> +        // 64-bit systems. With the "0x" prefix and null 
>>> terminator, this
>>> +        // is at most 19 characters. 32 bytes is sufficient for all 
>>> pointer
>>> +        // formats including hash values.
>>> +        let mut buf = [0u8; 32];
>>> +
>>> +        // SAFETY: scnprintf never writes more than size-1 
>>> characters, so
>>> +        // len is at most buf.len() - 1.
>>> +        // The "%p" format produces a fixed pointer format: "0x..." 
>>> (e.g.,
>>> +        // "0x00000000b231c2e6").
>>> +        let len =
>>> +            unsafe { bindings::scnprintf(buf.as_mut_ptr(), 
>>> buf.len(), c"0x%p".as_ptr(), ptr) };
>>> +        let formatted = core::str::from_utf8(&buf[..len as 
>>> usize]).map_err(|_| Error)?;
>> Instead of erroring, can we use str::from_utf8_unchecked with a 
>> safety comment?
>>
>>> +
>>> +        // Use pad() to respect width and alignment. Padding with 
>>> explicit
>>> +        // characters (e.g., {:0>16p}) is supported, but zero-padding
>>> +        // shorthand (e.g., {:016p}) is not.
>>> +        f.pad(formatted)
>>> +    }
>>> +}
>>> +
>>> +/// A wrapper that formats any type implementing 
>>> [`core::fmt::Pointer`] as its
>>> +/// raw address without hashing (corresponds to `%px`).
>>> +///
>>> +/// **Warning**: This exposes the real kernel address and should 
>>> only be
>>> +/// used for debugging purposes.
>>> +///
>>> +/// # Example
>>> +///
>>> +/// ```
>>> +/// use kernel::{
>>> +///     fmt::RawPtr,
>>> +///     prelude::fmt,
>>> +///     str::CString, //
>>> +/// };
>>> +///
>>> +/// // Works with const pointers
>>> +/// let ptr_const = RawPtr(0x12345678 as *const u8);
>>> +/// pr_info!("Raw pointer: {:018p}\n", ptr_const);
>>> +///
>>> +/// // Works with mut pointers
>>> +/// let ptr_mut = RawPtr(0x12345678 as *mut u8);
>>> +/// pr_info!("Raw pointer: {:018p}\n", ptr_mut);
>>> +///
>>> +/// // Works with references
>>> +/// let value = 42u8;
>>> +/// let ptr_ref = RawPtr(&value);
>>> +/// pr_info!("Raw pointer: {:018p}\n", ptr_ref);
>>> +///
>>> +/// // Width option test
>>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr_const))?;
>>> +/// let width_30 = cstr.to_str()?;
>>> +/// assert_eq!(width_30.len(), 30);
>>> +/// # Ok::<(), kernel::error::Error>(())
>>> +/// ```
>> Ditto here.
>>
>>> +#[repr(transparent)]
>> Same question here.
>>
>>> +#[derive(Copy, Clone)]
>>> +pub struct RawPtr<T>(pub T);
>>> +
>>> +impl<T: core::fmt::Pointer> Pointer for RawPtr<T> {
>>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>> +        // Directly format the raw address - no hashing or 
>>> restriction.
>>> +        // This corresponds to %px behavior.
>>> +        core::fmt::Pointer::fmt(&self.0, f)
>>> +    }
>>> +}
>>> -- 
>>> 2.43.0
>>>
