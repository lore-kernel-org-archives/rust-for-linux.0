Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE1D29DB88
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 07:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769068431; cv=none; b=oqFmob27EDoxTJeFD0jnL/qncy3spwltdaIMGX+ZqYcI0KmjMZRxRGiTIu8QucCqG+hQyVB528kSp8csFOhE4SnGUl0NozvCjRRnm460S1WJscGCf2Yj239Hn2mVVj3HLMZvw0/5WOwmz6JIFHAQNf4esXg5l/XWbPFFdrWBg8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769068431; c=relaxed/simple;
	bh=Wyfp5BefQTdf3QGIxxdoMHfm9YFC3TZ4RZDsX5dufzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/KCITFTMDX86eIEKdFZfZbaEp3PtEy2MI3ccqzT5EGeeSkZj9inN30oUM2Ucx7V6OL0ZjUEQ0L//k16aFba9PFhhHKarJuo7IxvghwdrCoiuycf2OX78CmJF/f84reogW7x4K795pK8Ut55IyMI8UDFNiSPjRhXcNuew+nQdjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0a95200e8so4922445ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 23:53:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769068429; x=1769673229;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ohm923ipA+RhHO7Ox9Ph5hJiYHEXD0JVny+bepv1bOw=;
        b=FBzeQ7YPLTXPhlPINC5YeahsqrovaAB2F4VMX3FYjevrO7SmB1/ZC8yvRFMNW8UwEC
         xvr+TqbB5AUHbpEVVxqjn2pP8UsJRxBY9AOXpxgT4qR5E7YqEhSw7H8GC/f27Utn/HMD
         NdY1U3XrIIMe2JnIrOTB9Gzf3F70I52RNfcU6+VmY1sJOdp0UNzIq63rykmTeq74f54G
         4qomT48d/2GGUT230aT7qTGIf1E3mOxV3URAxJq76Yvgx+7Q75KYVg93A0gcZZLEeuqW
         jRiih18rvEftH1aeHzKRMFC1ivww3foSxYuavnZAUMN2tAQ/WrnxQ61jJKU+aMIMQPt4
         WIzw==
X-Forwarded-Encrypted: i=1; AJvYcCXpi37tmRXtD7kvMTJm4966VPR2YmttNaFhBttaJc3Infpb18Ca77SXjtdKwFCzGePi9srXDWcTbzPflpz0Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAy7BhHlS32PwZgF4GVi54a8Eh+p2uWbK+YqU0Em3OzFNn9Ub
	HKpCwcSgZG3sekKY1pTdpuVvaPDRn3ptbMjV4h+nXHWVHuUA42hZ0B/f
X-Gm-Gg: AZuq6aIDo8m4N/B+mhazjt7LUYkxbfZ6so6I09jTtscamMNDByeTNij+t6UXIMQmB4b
	qpQpJ1VhPztXK/tRhx4mmsz0J2IoPyx5UJyCykX7iAK7C0TRBfoTiGoVUsfbud6adPxt3OnfX/y
	bteAD66InWjMsShg413KjeL1yIw98xpQl2pvt/Jiji33Oq8WNpmsNcTzjV/O2kJp4ZzF58wcJB7
	luBOWjSU6gpUlGR30Xq9L84MAs0aROr6TZbPfCE18heDIBrbEFNR3oVLEsG+m9LXkysXDAp6pp1
	+x0FbyBYWZqZPVqM3x3KZBF+ZBtzlOBsudp+pl71lb0JewQdzcWLFkLpdurRnMOth4V8lY0nwOw
	vMdOPlcP1IH3sFBTvOkQJtK7hofcnnKcYe2L42nZetzbMXweC7JvL8eRXNsFydSpWXtsoyqEgqV
	UrePOZXQ==
X-Received: by 2002:a17:903:350c:b0:295:24ab:fb06 with SMTP id d9443c01a7336-2a7698fd6e1mr62376675ad.22.1769068428708;
        Wed, 21 Jan 2026 23:53:48 -0800 (PST)
Received: from [10.0.10.3] ([45.142.165.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9ee9sm173374895ad.22.2026.01.21.23.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 23:53:48 -0800 (PST)
Message-ID: <b3d24a14-6d9c-457b-98f3-64226c0bc68c@kylinos.cn>
Date: Thu, 22 Jan 2026 15:53:42 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] rust: fmt: add safe pointer formatting support
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
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <CAJ-ks9=5NWkeOUVQ+PwSB7nfSxgn1brseC=OP5cG+78oT34WUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/22/26 02:06, Tamir Duberstein wrote:
> On Wed, Jan 21, 2026 at 12:01 AM Ke Sun <sunke@kylinos.cn> wrote:
>> Add Pointer trait and two pointer wrapper types for safe pointer
>> formatting:
>>
>> - Pointer trait: A copy of core::fmt::Pointer for foreign types.
>>
>> - HashedPtr: Formats pointers with kernel hashing (corresponds to %p).
>>    This is now the default behavior when formatting raw pointers with
>>    "{:p}", preventing kernel memory layout information leakage.
>>
>> - RawPtr: Formats raw address without hashing (corresponds to %px).
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>   rust/kernel/fmt.rs | 168 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 166 insertions(+), 2 deletions(-)
>>
>> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
>> index 84d634201d90a..d53184d0a12bc 100644
>> --- a/rust/kernel/fmt.rs
>> +++ b/rust/kernel/fmt.rs
>> @@ -27,8 +27,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>       };
>>   }
>>
>> -use core::fmt::{Binary, LowerExp, LowerHex, Octal, Pointer, UpperExp, UpperHex};
>> -impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, Pointer, LowerExp, UpperExp);
>> +use core::fmt::{Binary, LowerExp, LowerHex, Octal, UpperExp, UpperHex};
>> +impl_fmt_adapter_forward!(Debug, LowerHex, UpperHex, Octal, Binary, LowerExp, UpperExp);
>>
>>   /// A copy of [`core::fmt::Display`] that allows us to implement it for foreign types.
>>   ///
>> @@ -90,3 +90,167 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>       {<T: ?Sized>} crate::sync::Arc<T> {where crate::sync::Arc<T>: core::fmt::Display},
>>       {<T: ?Sized>} crate::sync::UniqueArc<T> {where crate::sync::UniqueArc<T>: core::fmt::Display},
>>   );
>> +
>> +/// A copy of [`core::fmt::Pointer`] that allows us to implement it for
>> +/// foreign types.
>> +///
>> +/// Types should implement this trait rather than [`core::fmt::Pointer`].
>> +/// Together with the [`Adapter`] type and [`fmt!`] macro, it allows for
>> +/// formatting foreign types (e.g. types from core) which do not implement
>> +/// [`core::fmt::Pointer`] directly.
> This doesn't seem applicable here.
>
>> +///
>> +/// By default, raw pointers (`*const T` and `*mut T`) are formatted using
>> +/// [`HashedPtr`], which hashes the pointer value to prevent leaking kernel
>> +/// memory layout information.
> This seems odd to mention on the trait given the description above
> states the trait is for implementing on foreign types. We should
> probably state that this exists *only* to prevent raw pointers from
> being formatted.
>
>> +///
>> +/// [`fmt!`]: crate::prelude::fmt!
>> +/// # Example
> Can we have some proper tests instead? i.e. this doesn't show us what
> the hashed result looks like. It might be tricky to get the correct
> CONFIG conditions.

The `no_hash_pointers` config is exported, and
`kunit_run_all_tests()` happens to run before
`mark_readonly()`:

   kernel_init()
     |- kernel_init_freeable()
     |      \ - kunit_run_all_tests()
     |- mark_readonly()

So we can save the value of `no_hash_pointers`,
modify it to run some tests, and restore it
after testing:

/// let no_hash_pointers = unsafe { bindings::no_hash_pointers };
/// let ptr_const = 0x12345678 as *const u8;
/// let ptr_mut = 0x12345678 as *mut u8;
///
/// unsafe { bindings::no_hash_pointers = false; }
/// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr_const))?;
/// assert_eq!(cstr.to_str()?.starts_with("0x00000000"), true);
///
/// unsafe { bindings::no_hash_pointers = true; }
/// let cstr = CString::try_from_fmt(fmt!("{:p}", ptr_mut))?;
/// assert_eq!(cstr.to_str()?, "0x0000000012345678");
///
/// unsafe { bindings::no_hash_pointers = no_hash_pointers; }

Are these tests sufficient? If so, remove the doctests for
RawPtr and HashedPtr, and keep only this one for the Pointer
trait？

I will remove the transparent declarations and fix inappropriate
comments.

Thanks,
Ke Sun

>
>> +///
>> +/// ```
>> +/// use kernel::{
>> +///     prelude::fmt,
>> +///     str::CString, //
>> +/// };
>> +///
>> +/// // Works with const pointers
>> +/// let ptr_const = 0x12345678 as *const u8;
>> +/// pr_info!("Default pointer: {:p}\n", ptr_const);
>> +///
>> +/// // Works with mut pointers
>> +/// let ptr_mut = 0x12345678 as *mut u8;
>> +/// pr_info!("Default pointer: {:p}\n", ptr_mut);
>> +///
>> +/// // Width option test
>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr_const))?;
>> +/// assert_eq!(cstr.to_str()?.len(), 30);
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
>> +pub trait Pointer {
>> +    /// Same as [`core::fmt::Pointer::fmt`].
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result;
>> +}
>> +
>> +impl<T: ?Sized + Pointer> Pointer for &T {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        Pointer::fmt(*self, f)
>> +    }
>> +}
>> +
>> +impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        let Self(t) = self;
>> +        Pointer::fmt(t, f)
>> +    }
>> +}
>> +
>> +macro_rules! impl_hashed_pointer {
>> +    ($($ptr_ty:ty),* $(,)?) => {
>> +        $(
>> +            impl<T> Pointer for $ptr_ty {
>> +                fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +                    Pointer::fmt(&HashedPtr(*self), f)
>> +                }
>> +            }
>> +        )*
>> +    };
>> +}
>> +
>> +impl_hashed_pointer!(*const T, *mut T);
>> +
>> +/// A pointer that will be hashed when printed (corresponds to `%p`).
>> +///
>> +/// This is the default behavior for kernel pointers - they are hashed to
>> +/// prevent leaking information about the kernel memory layout.
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// use kernel::{
>> +///     fmt::HashedPtr,
>> +///     prelude::fmt,
>> +///     str::CString, //
>> +/// };
>> +///
>> +/// let ptr = HashedPtr(0x12345678 as *const u8);
>> +/// pr_info!("Hashed pointer: {:p}\n", ptr);
>> +///
>> +/// // Width option test
>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
>> +/// let width_30 = cstr.to_str()?;
>> +/// assert_eq!(width_30.len(), 30);
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
>> +#[repr(transparent)]
> Does this matter?
>
>> +#[derive(Copy, Clone)]
>> +pub struct HashedPtr<T>(pub *const T);
>> +
>> +impl<T> Pointer for HashedPtr<T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        let ptr = self.0;
>> +        // The default width for %p is 2 * sizeof(ptr) (see lib/vsprintf.c:
>> +        // pointer_string() and ptr_to_id()), which is 16 characters on
>> +        // 64-bit systems. With the "0x" prefix and null terminator, this
>> +        // is at most 19 characters. 32 bytes is sufficient for all pointer
>> +        // formats including hash values.
>> +        let mut buf = [0u8; 32];
>> +
>> +        // SAFETY: scnprintf never writes more than size-1 characters, so
>> +        // len is at most buf.len() - 1.
>> +        // The "%p" format produces a fixed pointer format: "0x..." (e.g.,
>> +        // "0x00000000b231c2e6").
>> +        let len =
>> +            unsafe { bindings::scnprintf(buf.as_mut_ptr(), buf.len(), c"0x%p".as_ptr(), ptr) };
>> +        let formatted = core::str::from_utf8(&buf[..len as usize]).map_err(|_| Error)?;
> Instead of erroring, can we use str::from_utf8_unchecked with a safety comment?
>
>> +
>> +        // Use pad() to respect width and alignment. Padding with explicit
>> +        // characters (e.g., {:0>16p}) is supported, but zero-padding
>> +        // shorthand (e.g., {:016p}) is not.
>> +        f.pad(formatted)
>> +    }
>> +}
>> +
>> +/// A wrapper that formats any type implementing [`core::fmt::Pointer`] as its
>> +/// raw address without hashing (corresponds to `%px`).
>> +///
>> +/// **Warning**: This exposes the real kernel address and should only be
>> +/// used for debugging purposes.
>> +///
>> +/// # Example
>> +///
>> +/// ```
>> +/// use kernel::{
>> +///     fmt::RawPtr,
>> +///     prelude::fmt,
>> +///     str::CString, //
>> +/// };
>> +///
>> +/// // Works with const pointers
>> +/// let ptr_const = RawPtr(0x12345678 as *const u8);
>> +/// pr_info!("Raw pointer: {:018p}\n", ptr_const);
>> +///
>> +/// // Works with mut pointers
>> +/// let ptr_mut = RawPtr(0x12345678 as *mut u8);
>> +/// pr_info!("Raw pointer: {:018p}\n", ptr_mut);
>> +///
>> +/// // Works with references
>> +/// let value = 42u8;
>> +/// let ptr_ref = RawPtr(&value);
>> +/// pr_info!("Raw pointer: {:018p}\n", ptr_ref);
>> +///
>> +/// // Width option test
>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr_const))?;
>> +/// let width_30 = cstr.to_str()?;
>> +/// assert_eq!(width_30.len(), 30);
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
> Ditto here.
>
>> +#[repr(transparent)]
> Same question here.
>
>> +#[derive(Copy, Clone)]
>> +pub struct RawPtr<T>(pub T);
>> +
>> +impl<T: core::fmt::Pointer> Pointer for RawPtr<T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        // Directly format the raw address - no hashing or restriction.
>> +        // This corresponds to %px behavior.
>> +        core::fmt::Pointer::fmt(&self.0, f)
>> +    }
>> +}
>> --
>> 2.43.0
>>
