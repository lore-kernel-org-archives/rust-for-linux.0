Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2578520CCDF;
	Thu, 23 Jan 2025 10:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627688; cv=none; b=Fh0Q9uzA2lEBYcTpoC3eGGw5aiPVqFLWbXSroocp912XLW0zPhLUj+oQuec+8293S091+RzEeUWDbgOm5euxhcbFMJhx06MvrJeAaJdj1axU2zIMEhRPDNZQR9VPt9jQBSsW45kJFFoUA4reZjI18Q/ttx6WIIr4ffSkPdduB3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627688; c=relaxed/simple;
	bh=kk4HA5vDppyGWzTb7XH809DECIRN03DbdW8hfodxvqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pj1pJsP96YVtY85DotV+VyskODgmSRSkPHfGchk6GN29wDEXt+yH94RCBm/8kyqvavaXkZA3fprRI01qDx2RzzTpawXfdY4aV14tIedBMnEzMqrC0hK6VR6gP/njAwWnksML27mtkj0ZnnwMYhGcEZdUO4qm/VwuNsB2lKxM+XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHKs2/f9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHKs2/f9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab39f84cbf1so143590066b.3;
        Thu, 23 Jan 2025 02:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737627685; x=1738232485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Reu37OJc+YBSU+2HqT1wU4OxNOzAxq+mVUXqI2qpwcI=;
        b=BHKs2/f9x+PKEiGh/WeLEAjKU4obSyWkuu9DdXSxZA+tjEG6Y4UZp/F0zWGo3kMBTj
         1z4j7z1BqY/rU7WvS8lhPjdbtVi5WEs5QlQ4RjahOU3beRP7FM+o+vkoJLj1BbT3fQEe
         f0SbQoM8d19N/azrbjH+UCj97lOy/2mnWhTaHV6uhjGUuwIQEYk+sgCgMp/2BCqLf31/
         cfw5m3S/biifBOA72XFd2B5uUYaiuMDXtKpvXKUKgNTv12fxH5S5AsfHqUOlXVAYPPa0
         xV+aghwwmfj87dbaOUPi5YohdTGrV2ScJcRvdGgI8UyCjbi7LLVj6XFkueNGapaQMWXZ
         Drjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737627685; x=1738232485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Reu37OJc+YBSU+2HqT1wU4OxNOzAxq+mVUXqI2qpwcI=;
        b=RP139Brz9f7bM+wC6qWLgaN2KeZWgZO5TxJ0ElG8oOEzS4nJxjI+N64EJbMLiChk0Q
         B8Hv0xTOvd+KO92mDxyUmqDnPOrZe92W847qPjsLxqGTYbb2xsu1sacl8G14inwBstg4
         ILAs+6Y6vNvJ7Q2d8nxlg7KG7Lm5NmIjWwgQeHjvyiaLdN5aCSdWVeBUfrLldDuxpwXo
         I4ZgycgrAoLT+aAG+vQfsS65nKUh49cyLBKBUn2nfodmJdgqgaXXqEiNDFfbrfJt1yME
         ZSq+Ns+fVuZiS9ZHuv1o9TGgrnYmoV/uam7onBOHf2zuxng1/5oNvfIHj7Jy1B6aYIfL
         03Ug==
X-Forwarded-Encrypted: i=1; AJvYcCV3P6tDd+hDSSkm7Vebdp5cRdSQHXResDPyU9MYXqR77FbOsEB0AL0VEgFug44j3MV8pmwt/KK0cgu+Flg=@vger.kernel.org, AJvYcCWAu2JiQAaw/MqZF1cNlmXyOnKzEurHh2diHZcwjWHUz+g2St/FhUBAX/cvahQBUdWam6+tMbHyt0aYcrVxtxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyff/qaql3/sgD3cRoVrIIC2LsMnG0KZhS/HbBD3knOwFNFR7Jw
	zKCooNWzaeayVeRs9rxTU4IwtH8jelesWfnfBVvja0bTZY352pVV/eDM48KiRAY=
X-Gm-Gg: ASbGncsKH9UxB8qwtto+Se56p6XKlrtvx6utUrIBi8a0WB5vKjeEnnZ7M3o0qP+VqCh
	m7tjB1QNg4oJKdvokReLBTSvaYhaDgPCDLB4lytK+THf7EuwIgBXzUYe9iKkj1CGu1zIRvXCbnh
	lYYGS7BYqAdJwTKSlw2dQl1QDljlyv/ZQZTLI06Im2S2Wyh8yu5afrXWklBLd57jDoq59/PPe/K
	+0RjphnvhjgPyQdFshdHWcILfcbVImhdZFQ+7LjoccfBulfeJqeNv8XIIUlozrbMBlPI7ipRpkj
	1V8ablvo9gyldg==
X-Google-Smtp-Source: AGHT+IFmpqm2VcJTgrgH8R0aMH7vaNLrbujfeTPVXBsJxQPw9xlmyoZTJ1AnwgC5MGZhGFDk5q+m4A==
X-Received: by 2002:a17:907:6ea6:b0:aa6:2704:4840 with SMTP id a640c23a62f3a-ab38b3cfb30mr2214407266b.51.1737627684989;
        Thu, 23 Jan 2025 02:21:24 -0800 (PST)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce0f58sm1029002266b.48.2025.01.23.02.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:21:24 -0800 (PST)
Message-ID: <b7492912-3e58-43c4-aa0c-e6bcd4925e24@gmail.com>
Date: Thu, 23 Jan 2025 11:21:23 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] rust: add Aliased type
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
 <Z46Gzg_5kv-MwZNL@boqun-archlinux>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <Z46Gzg_5kv-MwZNL@boqun-archlinux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 20.01.25 6:24 PM, Boqun Feng wrote:
> Hi Christian,
> 
> [Cc Daniel and Danilo]
> 
> Thanks for the patch!
> 
> On Sun, Jan 19, 2025 at 11:11:13PM +0100, Christian Schrefl wrote:
>> This type is useful for cases where a value might be shared with C code
>> but not interpreted by it.
>> In partiquarly this is added to for data that is shared between a Driver
>> and a MiscDevice implementation.
>>
>> Similar to Opaque but guarantees that the value is initialized and the
>> inner value is dropped when Aliased is dropped.
>>
>> This was origianally proposed for the IRQ abstractions [0], but also
>> useful for other cases where Data may be aliased, but is always valid
>> and automatic drop is desired.
>>
>> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
>> ---
>>  rust/kernel/types.rs | 40 ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 40 insertions(+)
>>
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index 3aea6af9a0bca70ee42b4bad2fe31a99750cbf11..5640128c9a9055476a0040033946ba6caa6e7076 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -528,3 +528,43 @@ pub enum Either<L, R> {
>>  /// [`NotThreadSafe`]: type@NotThreadSafe
>>  #[allow(non_upper_case_globals)]
>>  pub const NotThreadSafe: NotThreadSafe = PhantomData;
>> +
>> +/// Stores a value that may be aliased.
>> +///
>> +/// This is similar to `Opaque<T>` but is guaranteed to contain valid data and will
>> +/// Call the Drop implementation of T when dropped.
>> +#[repr(transparent)]
>> +pub struct Aliased<T> {
> 
> As I already mentioned [1], the name `Aliased` is more reflecting the
> fact that this wrapper will avoid generating the "noalias" attribute(?)
> on the reference/pointer to the type rather than an intuitive idea about
> "why or when do I need this". Moreover, I think the argument about the
> naming of the counterpart in unstable Rust (UnsafePinned) makes sense to
> me [2]: this type alone won't prevent `&mut Aliased` getting `swap`, and
> it has to be used with `Pin`.
> 
> Therefore, I think we should use a different name, perhaps
> `(Always)Shared`, or just use `UnsafePinned`, or, as always, looking
> fowards to a better name from anybody ;-)
> 
> [1]: https://lore.kernel.org/rust-for-linux/Z407egxOy7oNLpq8@boqun-archlinux/
> [2]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#naming

I don't particularly care about the name, I mostly used aliased, because that's
the name that Alice originally used.

`(Always)Shared` seems confusing to me.

I guess we can use `UnsafePinned`, but most people won't know what that means,
also I'm not sure if it's a good Idea to use the same name as a (future) 
language type.

If there is a consensus on a good name I'll use that for the next version.

> 
> Regards,
> Boqun
> 
>> +    value: UnsafeCell<T>,
>> +    _pin: PhantomPinned,
>> +}
>> +
>> +impl<T> Aliased<T> {
>> +    /// Creates a new `Aliased` value.
>> +    pub const fn new(value: T) -> Self {
>> +        Self {
>> +            value: UnsafeCell::new(value),
>> +            _pin: PhantomPinned,
>> +        }
>> +    }
>> +    /// Create an `Aliased` pin-initializer from the given pin-initializer.
>> +    pub fn try_pin_init<E>(value: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>> +        // SAFETY:
>> +        // In case of an error in value the error is returned, otherwise the slot is fully initialized,
>> +        // since value is initialized and _pin is a Zero sized type.
>> +        // The pin invariants of value are upheld, since no moving occurs.
>> +        unsafe { init::pin_init_from_closure(move |slot| value.__pinned_init(Self::raw_get(slot))) }
>> +    }
>> +    /// Returns a raw pointer to the opaque data.
>> +    pub const fn get(&self) -> *mut T {
>> +        UnsafeCell::get(&self.value).cast::<T>()
>> +    }
>> +
>> +    /// Gets the value behind `this`.
>> +    ///
>> +    /// This function is useful to get access to the value without creating intermediate
>> +    /// references.
>> +    pub const fn raw_get(this: *const Self) -> *mut T {
>> +        UnsafeCell::raw_get(this.cast::<UnsafeCell<MaybeUninit<T>>>()).cast::<T>()
>> +    }
>> +}
>>
>> -- 
>> 2.48.1
>>

