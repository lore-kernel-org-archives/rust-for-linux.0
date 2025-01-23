Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0478420FABF;
	Thu, 23 Jan 2025 15:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737647551; cv=none; b=Mvyxris4Aar6BR2f2N5By/+t6pZNML4rNDyzHeAfLzbkk56JnnB3UuSoLxz0riB87oCTcyEulzUWpMGW5fgIZ3G4F3+ScDRFSm4YZZgzkVjZwdWGu+0+uzC/W6b8Bn8fhW9seCevyQQ6XzsM4KbGmKlvaZHw+rQSiCaIFWCn8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737647551; c=relaxed/simple;
	bh=X6HHfE3i01ri1RYLBrZHZDdUuDkSoTKufFQyQh5bC+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsMGaXKs+VMVWSaQGDaPXKJMlAaT5swOYMkmj/G9CuoLtg0rFTGr9BsaOvcPS1XO7BPDqUub83fNoNRKBG8LG6rQ+yLJc53X3FJtHnUMVzAod8Bax0ztWJR+4VAkuZTqvdbeIbqAIDsEVx06r66Kf6t3TDruWMw0dJjUBjo9PKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5KJivG4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5KJivG4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43618283d48so8059425e9.1;
        Thu, 23 Jan 2025 07:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737647548; x=1738252348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UltKUCQdmWR5ej0iABYUfRzQYg4yk+WToe9Xf57HHZM=;
        b=L5KJivG4HU9BidFs+gcBuZTw/FHVn9BJ3ewNUYyzLwZY6JDGrXOsQS0X39vTIbb0v7
         1Ol8k0cV7QbzYmLvaWnVIMgtUE9SHyFdagFqYpLPNExPYL57mcqul8f9pr8/PyAmWrMh
         w1Fgtgl8fJEl1SfukphwrVLUk47LnUbC0UOpDuEAa/HZjI25N1XkgYqBbj5pRbYPW1Ar
         AIEIT+CDW+Ud1dQHYDHBaDItPHXNf7dPG9r3RaPey5LretSL7sE3V1LljWBjPLiMJYXt
         mRNwLIxJvwvbNtrXhc1/hV70pOPRdzrCGtSLpzIvPl5jbT66ywAN0BtgCLlxxOQ88nQJ
         G+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737647548; x=1738252348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UltKUCQdmWR5ej0iABYUfRzQYg4yk+WToe9Xf57HHZM=;
        b=EX6V3wC5KEfQ6LParL4f6XN1//pd425J4SIOe+KMfTSqzlFb5GDr7xRY+gEwk0aW7S
         xzAmSYITe7tNwm1UaJlz6p7adLmAg9/LlZC+QrHYhCvZIS6NcwQO13MxCqNDRLewf6Uc
         gJyEryjl4MH1ZgbUa4FSX+ZcMZVyKcC+99hgINVKoFCYUlyfOJXSzfrAL9V1RfHsGUhO
         YEx48lgWLq3qW+uxLH3XlQjcrEtof69xEV0cb4ywRSrB0DTPBdea8V/fvjeMfgYIri5X
         JuIE5uCun2EtWUqWLpxlHrN3damSpvP2+l8h2GAv626t5529b/wSvC4Pd3RwlG+pShSn
         HsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnCyRQgy1ED6cTsfKfkj7QJqxkMj/1Foyz7pTi0fzywO2IJhiGdRiCE/HXXN4q578DxgsZhPfyHIJojwg=@vger.kernel.org, AJvYcCUymDYtEw1kgPe+/NzQwv3KQbJbDQ9HtGMWwOedFbhU2K0ipnc2iLobGMme3TjnN5tNn5nra3YrI4stXIGVDTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEN+pkaa2OZ2AUZEGFqTgdFzdPI5bknW08cHKN5XsV3D6u1jjE
	QsCeMsHjlxf48y5lFAp7SASCSv5S+bBNQd9qo/PKqTKWQHtWHwBM
X-Gm-Gg: ASbGncuuzCniEplYTIEHFtgIDEsBUeOmILJjN/9gMszenbna/HU4ED10rLJF9OpyWkr
	J70lV7Ysi3vF9aWNYH7QJR3U7YF+2ZFfRGFxBZ9ZfmmiG2ufQ9GpJ6I23tuSDF9lXaFkeNnpLSI
	Z4i8KZzN/i1O+9iUHi7A9aZCdjUHhKizqVFyUX5ktPygfTMNFiCBeI98Pw2zmKFIevEolisxIWe
	RXUOvcYW4k6go+Eht+n4K6KePft25/jBLVWiXMmIHIaCOanuxy+tzj0CFeSYJBOgVeoZliQGzFT
	vFV8/Td6FO3t1zHAMg==
X-Google-Smtp-Source: AGHT+IFThpm1B97GrqZT90rw6okMV1/px5RPzSNr2ig5tXFLamWjzdLtGkOinbKUFSmm2gJ9FkoxbA==
X-Received: by 2002:a05:600c:1e1c:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-438913bf655mr259548655e9.3.1737647548041;
        Thu, 23 Jan 2025 07:52:28 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17650esm51852f8f.12.2025.01.23.07.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:52:27 -0800 (PST)
Message-ID: <81cffd91-6b0b-4f09-a5c8-e1697975502e@gmail.com>
Date: Thu, 23 Jan 2025 16:52:26 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
 <2025012243-myspace-woof-1d1e@gregkh>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <2025012243-myspace-woof-1d1e@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 22.01.25 10:28 AM, Greg Kroah-Hartman wrote:
> On Sun, Jan 19, 2025 at 11:11:14PM +0100, Christian Schrefl wrote:
>> When using the Rust miscdevice bindings, you generally embed the
>> MiscDeviceRegistration within another struct:
>>
>> struct MyDriverData {
>>     data: SomeOtherData,
>>     misc: MiscDeviceRegistration<MyMiscFile>
>> }
>>
>> In the `fops->open` callback of the miscdevice, you are given a
>> reference to the registration, which allows you to access its fields.
>> For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
>> accessor to pull out miscdevice::this_device") you can access the
>> internal `struct device`. However, there is still no way to access the
>> `data` field in the above example, because you only have a reference to
>> the registration.
> 
> What's wrong with the driver_data pointer in the misc device structure?
> Shouldn't you be in control of that as you are a misc driver owner?  Or
> does the misc core handle this I can't recall at the moment, sorry.


I don't know the internals of (C) miscdevice good enough to know where I'm
allowed to store something, since there is no private_data field.

Not sure how the lifetimes of the whole device and device->driver_data are.
But even that instead we use that we will need a rust abstraction for that to
allow safe drivers.

> 
>> Using container_of is also not possible to do safely. For example, if
>> the destructor of `MyDriverData` runs, then the destructor of `data`
>> would run before the miscdevice is deregistered, so using container_of
>> to access `data` from `fops->open` could result in a UAF. A similar
>> problem can happen on initialization if `misc` is not the last field to
>> be initialized.
>>
>> To provide a safe way to access user-defined data stored next to the
>> `struct miscdevice`, make `MiscDeviceRegistration` into a container that
>> can store a user-provided piece of data. This way, `fops->open` can
>> access that data via the registration, since the data is stored inside
>> the registration.
> 
> "next to" feels odd, that's what a container_of is for, but be careful
> as to who owns the lifecycle of the object you are trying to get to.
> You can't have multiple objects with different lifecycles in the same
> structure (i.e. don't mix a misc device and a platform device together).
> 
> So a real example here would be good to see, can you post your driver at
> the same time so that we can see what you are doing and perhaps provide
> a better way to do it?


The `struct miscdevice` is currently the first item in the 
`MiscDeviceRegistration` so the  `struct miscdevice` and the 
`MiscDeviceRegistration` have the same address.
I can use container_of! if people think that more understandable.

> 
> thanks,
> 
> greg k-h

