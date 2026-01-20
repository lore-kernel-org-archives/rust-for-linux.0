Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65A73AE713
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896494; cv=none; b=M5SGAvdftncNQO65gZoGRkARg5tGQ/NBUxqNwlsC7bnNwOItwS1bokRRBl5Rg/LcEnYOA8i4Ouly+hW2bYGgPuXZ3QRRFsy/3cAbVsf6gPYmv7NlQuahB+H/k3s4jjYBaNeNX6l6xGSomc5Pf6ZP4TdPE1QbHn7Wzo2glGjhEF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896494; c=relaxed/simple;
	bh=+SQClug0ijWjldOO0uBkcSJCiLEZHCZdK0RkOK3fzRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlxXc8AGuUVCKRsLZCz253ZWLWuqe7NP40baWynL4H3I0r+g47hxfLZvoGmsgJeSgVBLam4LMUg28HpUOQ6sCAOXpfu56pa5J4DER2AYK8zPqya7TAUrP/N1P/wSjlORXx7aHsTnBLbmNNPdx1TaDGKKnxaejxaFObrKc1rx3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso3410178a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768896492; x=1769501292;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ysVv/ia/9PZ8QZoFVsW+VPMV2hxwUw+bf0IIM6Xc/A=;
        b=lwyW9oDC397xcH2l1uJDN87SoXvMtdM2IUrpRVZD/M5EInPbyTzU1XQt28tAfDOUYK
         9fSmYvhIYA0IYUvEVLSBp4vvPhC0uopAeVL6lMf5djEa2qYlll9ICbSafRg3Cmeaccoa
         3ZU+Y+kLzLFwT1TYkcdjO2qtO/ydjFmKfQPEIxr3k12PKfT3xeB9PbOLNoX/RdO1rvZa
         oerNQZXIyKSS9P2AWjFxjDOaxxK88r/QEDAvKQEMr8Ct2NAGXSJQLw3p/POzFZM18bCV
         nTXa+dgUfwlk4h4TuLKLMQmqXcJIrsM1Zn9+Haq2F4bGWgAFmVWSGbdDGbuOXGboWUeO
         L6dg==
X-Forwarded-Encrypted: i=1; AJvYcCWOYb2Nc6zfP/vir0BJBO/ZelDQ+ryw5uqMs9oVF+O6Qofk/A7IqILQLPD+cFgWWDSI5Jt/S+QsauDLVHxVdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/0hmdfwpZWPw5JY37CXjasHvNWMbw1qclYIkVHnApGk6+IzHo
	h5y67ZjFVsogR3ltWQTz3Fpw/wuTUde8olP+XA1e+24xrkFGSK1qwtuC
X-Gm-Gg: AZuq6aKotH9P0JHIvwI5QOCkroOLLyezeUj817eBAfFWy0mizgRXXF2PasKtjBS9uz/
	J8F0/TffSsmRD6VJPYQphgbpCYQpzRNGDVzZWU2NWA4alEkk5H9wLPfil9iD/qOHI2EHL+u0JjP
	cgJ2N1LDZ+z8CjnO6fBmis9Az4ruwFrOJKsdl/aMdheu2tJ+IMaBJqFQKtmehDz5nzEUvnbz+OP
	/5RY7WqzOSZbweoC13EZ9rtRqjH0XteYR0ByFp1KpsNASVacx0lie0l8GeSxfWXzBzfCArip6G2
	9hPZ5Xp+HPe4NFO5fEmAX/nYWJEwtN7CM31qZk2PEMGQYmhVAd1uvhkdCFDooGCn94svfKuzNBm
	M4AXYUWWvjRYmhuj5oCWz+CT8b4eOe/+pz2xFqOcDqKg/HqdfXOpJWoSD1JHxA6121U/xgaW3cI
	sH/0BPJqd/3aFcTHW3a8TOGAx291EMxfHw/BwBIGyYbg==
X-Received: by 2002:a17:90b:1d0d:b0:340:ad5e:ca with SMTP id 98e67ed59e1d1-3527317db18mr11704047a91.12.1768896492005;
        Tue, 20 Jan 2026 00:08:12 -0800 (PST)
Received: from [10.0.10.3] (61-221-120-113.hinet-ip.hinet.net. [61.221.120.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf23390asm9008520a12.3.2026.01.20.00.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 00:08:11 -0800 (PST)
Message-ID: <79bed32b-cb55-4747-a343-481ec44a4ce6@kylinos.cn>
Date: Tue, 20 Jan 2026 16:08:06 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] rust: fmt: add RawPtr for debugging pointer
 formatting
To: Gary Guo <gary@garyguo.net>, Ke Sun <sunke@kylinos.cn>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
 rust-for-linux@vger.kernel.org
References: <20260119033006.1453006-1-sunke@kylinos.cn>
 <20260119043502.1534349-1-sunke@kylinos.cn>
 <DFSLQ8C5ZGZK.2NH94EL0CQLKY@garyguo.net>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <DFSLQ8C5ZGZK.2NH94EL0CQLKY@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/19/26 21:31, Gary Guo wrote:
> On Mon Jan 19, 2026 at 4:35 AM GMT, Ke Sun wrote:
>> Add RawPtr type that formats pointers as their raw address without
>> hashing. This corresponds to the %px format specifier behavior in the
>> kernel.
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>   rust/kernel/fmt.rs | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 44 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
>> index 6052d9f8628bb..d023aa00c7470 100644
>> --- a/rust/kernel/fmt.rs
>> +++ b/rust/kernel/fmt.rs
>> @@ -6,7 +6,10 @@
>>   
>>   pub use core::fmt::{Arguments, Debug, Error, Formatter, Result, Write};
>>   
>> -use crate::bindings;
>> +use crate::{
>> +    bindings,
>> +    ffi::c_void, //
>> +};
>>   
>>   /// Internal adapter used to route allow implementations of formatting traits for foreign types.
>>   ///
>> @@ -233,3 +236,43 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>       {<T>} Adapter<&*const T>,
>>       {<T>} Adapter<&*mut T>,
>>   );
>> +
>> +/// A pointer that will be printed as its raw address (corresponds to `%px`).
>> +///
>> +/// **Warning**: This exposes the real kernel address and should only be
>> +/// used for debugging purposes. Consider using [`HashedPtr`] instead for
>> +/// production code.
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
>> +/// let ptr = RawPtr(0x12345678 as *const u8);
>> +/// pr_info!("Raw pointer: {:016p}\n", ptr);
>> +///
>> +/// // Width option test
>> +/// let cstr = CString::try_from_fmt(fmt!("{:30p}", ptr))?;
>> +/// let width_30 = cstr.to_str()?;
>> +/// assert_eq!(width_30.len(), 30);
>> +/// # Ok::<(), kernel::error::Error>(())
>> +/// ```
>> +#[repr(transparent)]
>> +#[derive(Copy, Clone)]
>> +pub struct RawPtr<T>(pub *const T);
> I wonder if this can be
>
>      struct RawPtr<T>(T);
>
> and then you can have
>
>      impl<T: core::fmt::Pointer> Pointer for RawPtr<T> { ... }
>
> this way you don't can use it for both ptr and reference, and you don't need to
> care about mutability.

Thanks for the suggestion. I'll explore it.

Best regards,
Ke Sun

>
> We could even do one step further and just have
>
>      use core::fmt::Pointer as RawPointer;
>
> so people can decide to allow `RawPtr` to format their custom smart pointer
> types.
>
> Best,
> Gary
>
>> +
>> +impl<T> Pointer for RawPtr<T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        // Directly format the raw address - no hashing or restriction.
>> +        // This corresponds to %px behavior.
>> +        core::fmt::Pointer::fmt(&self.0.cast::<c_void>(), f)
>> +    }
>> +}
>> +
>> +impl_pointer_forward!(
>> +    {<T>} RawPtr<T>,
>> +);
>
