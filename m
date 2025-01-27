Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B0F1FDE28;
	Mon, 27 Jan 2025 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984477; cv=none; b=i9q9jRkzbk/eWg1TalVwcHoX2AuhItZ93l+iuFRBHh0q3jAuFBNddjv8aDQ4t+ZL+dLWZC64rdFUQiYjEEN+s4ZClabKyC4Uls3AWsOpYWSskCVPk1DCyCm/8/tmFtT9XvCpXkaMTXfq5f4BhhJyWMeWThLVx89U5CVe2RJtqcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984477; c=relaxed/simple;
	bh=QCHTZAs4CdjwoAcvTUXeKg/0x7fiO3/ioNmvqypL+8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhCImf2IkYzWT9JagR1Skct900vBveU9dbncv+zU1KJhxYyioLMYenbbKHU5IQ6LkjNwMEO4UmqU+e26Oa/ImKhEtlyU8xEPIXiFTYtWnfjkSzOA39jud9YsEft0qAbXJvIa5l6P7yxxvnWEvKUZ8YcGh5aF/idBa8DL5xcmI10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLJFB4k/; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLJFB4k/"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab698eae2d9so306212866b.0;
        Mon, 27 Jan 2025 05:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737984474; x=1738589274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xAG01zUBUwzPSsqc/JUxTlHiG8TKis9hglUCo5i5XK0=;
        b=FLJFB4k/n1LofUtuboDafQKcn2z0v/Z7UNzba3XUoiGnzxodgcVuQIkZxzNejdaG8R
         6G5AUKh/vkUcfn3ltpsOUCIlW6KNd+MF3izBKMqs14wS2M1QJVfkHw7e+4R5RLdHrONl
         bvzEc3Z7eWTASvig2o/bJLPP2j7YPvfwl9z2jr+SA8MWpjpSwKz+jY4wMHR5Uz6yMz8V
         XE/v7CViTEFoLfqFzd4VqZ/5jFb4DXzGl6Yd6yx99AX6rmz1A1qYUA7apsTFPPD0vutB
         eClhAVC/+sbTo8+1bNa/rz9ueloBUZ0iXbQFaK84j2Uaip3CCjIVZ0HNgrcZDc4LtUno
         qpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984474; x=1738589274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xAG01zUBUwzPSsqc/JUxTlHiG8TKis9hglUCo5i5XK0=;
        b=EJcwV25fDMwInqrHSL/LEpGZy0a3to+womCg2Ta/iIsyzabXGe7aQdJWP+iam+X+W/
         R8m31kGbHouEyWDLF1cBLuUchXdIYRsA1aM2Mb7h7Buql5WLsHLFqD2sotsEXYzBGMgH
         UQtgpllIqvuaH5V+j4crd5v37FTwsX3h0f0WN+iBHB9auMotStIE5GktgObfiSK2y3pX
         kUxFIzL3oY6n663engB8olU011vpQGE9nhwPyaPC9qhteosmxq6rCOACNBcaDtmBaDIf
         s3l/5ylrqBPh/LQpFwou7SR99TaInqM69lpI0lNGP7xidO6z5aEBAz+GGEd5C/FsIcS7
         IrrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9XEE3fnyyJTZ5uA1K+PC3ZROhawEn4LAsqezBYSKPy+rzdwzVOu0oJlpQpj0CTpSXkNFlUqVAB6zhpHU=@vger.kernel.org, AJvYcCXzeFlA0RvtEka28CMj2/1iEiOoJCtubqlTTd3+aj163LYHxhxefCKaxVoynzqqRShOcpThL84VThtFCIDJ6KY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR8GtVye8NfQxLWX1vj8N+vQf1lKeFCEMwgI9sf4auc7FZbRZt
	m5hiHGfEWQZ1AsujJEjO6nmUtj0e9WLno6LfxFjf2bDYnXSLuudY
X-Gm-Gg: ASbGncuylHg+tTT+pOa0Cjglbeth9h1CCHpyj2ZHxgI9/0tw/tRqFmIfU/4kvTzFcxi
	/esVRBK/naqJ58ujN1LunWz4AjsRvhwEPYUwplJ4PV7dZM2sJV5l/ejHqCZHPr00AqZnGAZypvq
	0uFfLysi9+Y5Mb7uMxQA+JzcJrPOaKI2CSpsiA7XapHdkI22j02sgnh0laZg8qLpUNCxtsdwRca
	scXXQYBwRTg7xmi37HmUpTHK8nNsIPVi0lWbKyNaVo9LEIDIuj3mSTmVohVUtxRNH2L+xTVCd50
	qXy2hUnzfr/xWGOvaQ==
X-Google-Smtp-Source: AGHT+IFzo95+fAajIhPc4gqnvWHYaw+Xv5E/3QWUOlw1LgZD93RVZVbaUygCdAzv8Z5tNhDkdNNFOg==
X-Received: by 2002:a17:907:1b05:b0:ab2:b936:f110 with SMTP id a640c23a62f3a-ab38b27a470mr3847971766b.20.1737984473751;
        Mon, 27 Jan 2025 05:27:53 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbb2esm588289866b.140.2025.01.27.05.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 05:27:53 -0800 (PST)
Message-ID: <912d9ba8-4cd1-434c-ba32-5c74ef4c12be@gmail.com>
Date: Mon, 27 Jan 2025 14:27:51 +0100
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
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CAH5fLgi-CJCveLmc6hFdAYOhpRULovDh_Cix4FyV=kBeg9oiFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alice

On 27.01.25 11:27 AM, Alice Ryhl wrote:
><snip>
>>
>> to make sure that `misc_register` is called after data is initialized and to that
>> `data` will be dropped correctly in case `misc_register` fails.
>>
>> But I'm not very familiar with `(try_)pin_init!` so this might be unnecessary?
> 
> Using pin_chain is definitely incorrect because it will run the
> destructor of MiscDeviceRegistration if the misc_register call fails,
> but calling misc_deregister is incorrect in that case.
> 
> You should be able to just move the `data <-
> UnsafePinned::try_pin_init(data)` line to the top so that the field is
> initialized first.
> 

So if I understand correctly, the following should be correct:

pub fn register(
    opts: MiscDeviceOptions,
    data: impl PinInit<T::RegistrationData, Error>,
) -> impl PinInit<Self, Error> {
    try_pin_init!(Self {
        data <- UnsafePinned::try_pin_init(data),
        inner <- Opaque::try_ffi_init(move |slot: *mut bindings::miscdevice| {
            // SAFETY: The initializer can write to the provided `slot`.
            unsafe { slot.write(opts.into_raw::<T>()) };
            // SAFETY: We just wrote the misc device options to the slot. The miscdevice will
            // get unregistered before `slot` is deallocated because the memory is pinned and
            // the destructor of this type deallocates the memory.
            // `data` is Initialized before `misc_register` so no race with `fops->open()`
            // is possible.
            // INVARIANT: If this returns `Ok(())`, then the `slot` will contain a registered
            // misc device.
            to_result(unsafe { bindings::misc_register(slot) })
        }),
        _t: PhantomData,
    })
}

Sorry I don't know the details of `(try_)pin_init` and the docs only say:
> The fields are initialized in the order that they appear in the initializer. So it is possible
> to read already initialized fields using raw pointers.
> 
> IMPORTANT: You are not allowed to create references to fields of the struct inside of the 
> initializer.

This says its invalid to create references, but as soon as `misc_register` its theoretically
possible that a `open()` call happens and creates a reference to the Registration. I assume
that is fine, because the Registration would be fully initialized at that point, but that's
technically against the Docs.

Also does `try_pin_init!()` automatically drop `data` when `bindings::misc_register` fails?

I couldn't find anything in the Docs about when and what is dropped.

Is there a equivalent to `cargo expand` for the kernel?
It would be nice to be able to look at the code generated by the macros.

Cheers
Christian 
