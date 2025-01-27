Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E0C1FDA84;
	Mon, 27 Jan 2025 13:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984956; cv=none; b=Bbjn5iLsemdL3wBqr+j3v0txia2glpxDiGCzVmzlPKgBhiQADTpXjmFnntSuQLbHiYBSbfDWb21V/iZXPjR478D/DUqbMMORjtHIGd+SZ8PJ/OuUIqusqq/mM48/MKu6WYkfL7jfkGJYW0rPnVXUQa9toNBad3RR5WYsKFMWTCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984956; c=relaxed/simple;
	bh=rWDts6fMB0ffqGacgZL8GQQ0Em1IasBPlb+xKC5Amcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqdBwBqPijApmDolHNceGEo6eFs88z8v58V8v7+WQJDJLToRddKTx2176TtEzNJluuCsfWZx+8COfYOgUI5dcz5mU7f6xBM04Lq70Hkjz5AbB9avRRDfTkL7xvuWR9vhl7UzMPbdX4o4Si2v1kd9hFUOvK6UUgOa3tfPuu53VEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnVj1Qo4; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnVj1Qo4"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43618283d48so31258165e9.1;
        Mon, 27 Jan 2025 05:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737984953; x=1738589753; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chFkxYCypi2umV++tBJ0kxcUCwOf0OcWmg0+yMZbEio=;
        b=AnVj1Qo4uztuh6BFsAGp/x9Q+MZs/o1fTJq2qTDc3EehidU9+nHaWCpKHjp5f+qDEx
         9SiS+RYVZzxPFcU11i/Y4K6oMOzVkbWeBvDahsr7y+wMVDNaccWpAjbY98iqBz3rBr0z
         lPhxuefseonhGkQC4vb6cSCzg17nKgo0utOK4DO1vUvalBrdfTS8NHbpQRNWEvZq+KKE
         RSgeKHZzpfPg54mb4PAu42n1EzjeaX64F5aE1NtkFcWdMAc9up8rSET8p+BEYlVcC/Jr
         MTwW73lJE+h3I/tbFUsjaxUWTCMAL/jh/PJnDo8JLEhYbJSSaGEmBRwmku9QIOVdcO+n
         agTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984953; x=1738589753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chFkxYCypi2umV++tBJ0kxcUCwOf0OcWmg0+yMZbEio=;
        b=g553kNyHHKBKP9Qs6yP7YWOwtCldKObaOP8qVRx6XpSi0OAXSyoLEyxR8XpCGHIVe3
         hL7El5pR78/47WNZWcR+/lp10FjJAkEK9IgkJnq4/9pdT5iL3bsxACW/HM5wUSdWmfla
         EpBiWW+40ptefeUUgQPKjFmRpsQcoGTgpV2ktNSa/gGJssGO39eugkATEUcXMIRoWKwQ
         tTcBE/CaJJrOATv72y5Qolui6HQzw38ojb1sEo7ish9027WKbNfzbtgVo59iwk4gmnAU
         Dgr7WE8e21v0uXXXDQGFHVhsK44AfknRY+JkxtQFUjOmcl9bwHmJw6+diGHk3ZWY2hVu
         /LVA==
X-Forwarded-Encrypted: i=1; AJvYcCUNnMfDUxNz+95lP1gSNblOU1BWqZfpZl9z/n/2oKcJiJQIntQzS9oJ4hWRgob2YwkULlMMkGBGhhs2hWzd53U=@vger.kernel.org, AJvYcCWiIbQdLLW6xsdIRv5jlWcv03VmZwS34oFNqJVe+vjSw/sQROCQ0lsCyKTnlGJAKXuW7OWN5eArgWMmBoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAzXdvdDo/PQCg1Fl5iogx2wc7n9O9/9VHocX2qH528Af45XrQ
	Jzqpi/1FpKMm5QcfmEqOmAOwYiSXrqziVEuWGcbLFFQ6TDTfSDQe
X-Gm-Gg: ASbGncunG3/m5kLd5mbfcdZKjWJOkJglwiiqArSTPp/2dD/nG4u99E6bS/zi2M658Kd
	PMWbQIS9+8RscBdXK3jiwE3KPWUzoo6ScpGul2hzJJbyRLi3v+FOYtQ1Zskaa3UE/RUelRmDAI9
	+NN0S54zq7RaOxktMNgxsulr+eG/zHEzDnTd4yOtS6IDLQ3JjKFzpSLEgQfXhXc+4n3yfSGxp0I
	7uBhzTriFSGMA8RFWsl77TWWGZnDc+urpCiikdLHFK8xBRtdq562nCr7qMnS6gZ/TFcG/FJFXoc
	iaPtFtKH3bEcFRPOKw==
X-Google-Smtp-Source: AGHT+IFJIbOvsaT9gYI7fP4tWKSszVhy75V73ZtCwcDIFMFR8bVBKgGFsos3LrobUva5VxDA+5tQvg==
X-Received: by 2002:a05:600c:3b94:b0:434:9934:575 with SMTP id 5b1f17b1804b1-438913e02f8mr454618775e9.16.1737984952490;
        Mon, 27 Jan 2025 05:35:52 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm130705855e9.3.2025.01.27.05.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 05:35:52 -0800 (PST)
Message-ID: <66976464-ef42-4020-9f13-2038fd5b22cc@gmail.com>
Date: Mon, 27 Jan 2025 14:35:51 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
 <8953765e-d978-4a91-bc81-9ab154ac2255@gmail.com>
 <CAH5fLgi-CJCveLmc6hFdAYOhpRULovDh_Cix4FyV=kBeg9oiFA@mail.gmail.com>
 <912d9ba8-4cd1-434c-ba32-5c74ef4c12be@gmail.com>
 <CAH5fLghaE6fC0riAch7Wj94ZqNx86mi4ytBhCzcR7KCcw6ZqVQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CAH5fLghaE6fC0riAch7Wj94ZqNx86mi4ytBhCzcR7KCcw6ZqVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.01.25 2:33 PM, Alice Ryhl wrote:
> On Mon, Jan 27, 2025 at 2:27 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>>
>> Hi Alice
>>
>> On 27.01.25 11:27 AM, Alice Ryhl wrote:
>>> <snip>
>>>>
>>>> to make sure that `misc_register` is called after data is initialized and to that
>>>> `data` will be dropped correctly in case `misc_register` fails.
>>>>
>>>> But I'm not very familiar with `(try_)pin_init!` so this might be unnecessary?
>>>
>>> Using pin_chain is definitely incorrect because it will run the
>>> destructor of MiscDeviceRegistration if the misc_register call fails,
>>> but calling misc_deregister is incorrect in that case.
>>>
>>> You should be able to just move the `data <-
>>> UnsafePinned::try_pin_init(data)` line to the top so that the field is
>>> initialized first.
>>>
>>
>> So if I understand correctly, the following should be correct:
>>
>> pub fn register(
>>     opts: MiscDeviceOptions,
>>     data: impl PinInit<T::RegistrationData, Error>,
>> ) -> impl PinInit<Self, Error> {
>>     try_pin_init!(Self {
>>         data <- UnsafePinned::try_pin_init(data),
>>         inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
>>             // SAFETY: The initializer can write to the provided `slot`.
>>             unsafe { slot.write(opts.into_raw::<T>()) };
>>             // SAFETY: We just wrote the misc device options to the slot. The miscdevice will
>>             // get unregistered before `slot` is deallocated because the memory is pinned and
>>             // the destructor of this type deallocates the memory.
>>             // `data` is Initialized before `misc_register` so no race with `fops->open()`
>>             // is possible.
>>             // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
>>             // misc device.
>>             to_result(unsafe { bindings::misc_register(slot) })
>>         }),
>>         _t: PhantomData,
>>     })
>> }
>>
>> Sorry I don't know the details of `(try_)pin_init` and the docs only say:
>>> The fields are initialized in the order that they appear in the initializer. So it is possible
>>> to read already initialized fields using raw pointers.
>>>
>>> IMPORTANT: You are not allowed to create references to fields of the struct inside of the
>>> initializer.
>>
>> This says its invalid to create references, but as soon as `misc_register` its theoretically
>> possible that a `open()` call happens and creates a reference to the Registration. I assume
>> that is fine, because the Registration would be fully initialized at that point, but that's
>> technically against the Docs.
> 
> Creating a reference immediately after misc_register finishes should
> be fine. I think that warning is more strict than necessary.
> 
>> Also does `try_pin_init!()` automatically drop `data` when `bindings::misc_register` fails?
> 
> Yep. On failure, previous fields are cleaned up.
> 
>> I couldn't find anything in the Docs about when and what is dropped.
>>
>> Is there a equivalent to `cargo expand` for the kernel?
>> It would be nice to be able to look at the code generated by the macros.
> 
> You can expand Rust macros by invoking make on the file with an .i
> extension, in exactly the same way as you expand C macros.

Thanks!
