Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EECA3A4AD4
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 07:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768894223; cv=none; b=JqYOytpGtSqvIOkGbtJfBDiab29am9ncztYqQMuMoA63J3QhN3I05zc0X8CUFza3IUnAeN4jG8GkIEnzyfxdJUcGE9+eXCMK39GZx5EmObSBwmgF49GxvCWX8hVR5n0pxs69bOOJQH8on5bTNcG6eEU9ohGi8mNp1585GHOJUJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768894223; c=relaxed/simple;
	bh=uLD3Kfhs9vF3FJWpTh+h1tfUYtHq+WcBdY8x474VHM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=saSL4MqZrD1oP+S3wU4Zc1pwUKs47JCnfB/pb/A7fAyYatQ75O73eYBnUKE1LMT3TyFDZX8469FyMoGTH4Ya7ig7jDAWP7GJl4pRfkvH4EmPebbhsBuaewHqDQQWIZSsNoLPoeW6q4+HjojT/8Vm99YQA/7v05BT83s5ZBzjxRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KtOk5rRo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KtOk5rRo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f478e5283so4420742b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 23:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768894220; x=1769499020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoPJzK2LY4Hk5//MGfrl2FrP1dHV0q7YgBR1i+LH4To=;
        b=KtOk5rRoq4kbGBWjUms1uU4VYMfsW7NMsE88D8rRheUHp1L5y1bSECjC/9QRPzdpyI
         uZbHFl+G+MOkx4bf/7KZpSUmbG7Y21fgbIYriXrVqHuwSuH8UJqSn8VNl6bHEXJk+aLw
         /54hXfzcj06MGa02BSKmZI7uqR+vr0kmBhBjJxQra/Hc80Ti8FCfvKwx1m6JIxxt1Ukm
         dao/9XM55YEjqm374l+JcHOHGokimwgqcylUQwN9ad5Hvz3HEy7Y8/eyJ/q/AFuHdLQM
         q9t0ETi1lCduLy75oE51Qlr/aiaFNCDNV7cph8wdnsj7W6zxgkSRXaYaHZEq+yIVUVvX
         I7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768894220; x=1769499020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AoPJzK2LY4Hk5//MGfrl2FrP1dHV0q7YgBR1i+LH4To=;
        b=v5h7FfXm+/5LLSF92+82hsBVcgFWiiaOzkIFHLKThcnsOrbr8MOqQp9A+aeYqIjCUK
         Mr9y+mnl4LHbNpBKD0L0U0usq7dtXAHXtksKmSjVLxPcdPZuh8y4JlBTbJxWxysElKHA
         +2AaztSWrjkst+aV4pcPKjvmANOmr0T4Qru66nrI21/L/wp2KyapxVhZEj/6yMMqoZx7
         Gn4wHCuWWGOgD7JdoZIvWmzPBe+tBxRMx+7LS8ytcltGccY0helOMeqjuOdeteCp6+GA
         qWY1a4wKGWRt3J+E++P4h0ClP2kUp8yKmBxEpo+/OmipOBuI9mw2W+hxdym+7Ruas52u
         N/Og==
X-Forwarded-Encrypted: i=1; AJvYcCWxP5aNqoa8xC37pRLOd4BlT/0kWrcXu/kebO+jKHUmi7V3l0GEmj7cFbYhRci4rFO7FKRK4/QX04V6nvXiog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwobT31h2j3Hr9jrQigkJQjALW4IGQl5ff3xMi7yF80fZdnh3WU
	fUv36eihjUPUNYba2MrxSI38MKlRydaU7m2NVBf/1J4744vq84FjBRPw
X-Gm-Gg: AZuq6aJH+X1js3oOqDdC0qfaD4SMna0X6cVa/oQt6AF7BGoLsvdmqruyBhTmYFs/X6t
	z5CYlkxyhZ/fTq7XnkJG61xRupgwMiIgW3qLm64XFRVa035xeGPWLNVSO3/j6oMalaTAw6tE2/+
	pscXgiTozE7p2tp+1F3GeN1gmDkj0hwWy3cCFPgoKHbEXgMBN0VZbZ8B/nAel90142iPL2+/0Fh
	ZXDtbezvmho1eMiuT/1V+sThbvxja3KnM3xBtUacMCupMLgGHtfZeolnI9hoPmhYDf8yS1OBnLY
	+hJgYqLblXX5JoiXUqM6ewOECxh8cm31dpEA9IUEEYTKH873HFY7AzaY0C7gahJbrJkr2HWlfzy
	SalbARYXAW+d7CxQ/LPDezIlueACzR6hUBGvh+SfYPcLvoeE+JenbYBMVAPF4BIyIAsMfGW5ARE
	ty8rkswKXfdQE=
X-Received: by 2002:a05:6a00:1996:b0:81d:e9b1:b6e3 with SMTP id d2e1a72fcca58-81f9f7f6242mr11721124b3a.14.1768894219641;
        Mon, 19 Jan 2026 23:30:19 -0800 (PST)
Received: from [10.0.10.3] ([45.142.165.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10be07fsm11179022b3a.20.2026.01.19.23.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 23:30:19 -0800 (PST)
Message-ID: <867a8e83-421f-404f-b0b2-7995006919d3@gmail.com>
Date: Tue, 20 Jan 2026 15:30:13 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] rust: fmt: make raw pointers default to HashedPtr
To: Tamir Duberstein <tamird@gmail.com>, Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org
References: <20260119033006.1453006-1-sunke@kylinos.cn>
 <20260119033006.1453006-4-sunke@kylinos.cn>
 <CAJ-ks9m9HV72MSchSS16FUzKLu9c6Ka2N4zZbg29VjNf8RCLOw@mail.gmail.com>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <CAJ-ks9m9HV72MSchSS16FUzKLu9c6Ka2N4zZbg29VjNf8RCLOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/19/26 21:17, Tamir Duberstein wrote:
> On Sun, Jan 18, 2026 at 10:30 PM Ke Sun <sunke@kylinos.cn> wrote:
>> Implement Pointer trait for raw pointer adapters, making raw pointers
>> default to HashedPtr when formatted. This provides safe pointer
>> formatting by default and prevents information leakage about kernel
>> memory layout.
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>   rust/kernel/fmt.rs | 41 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/rust/kernel/fmt.rs b/rust/kernel/fmt.rs
>> index b3501a11c7a3c..6052d9f8628bb 100644
>> --- a/rust/kernel/fmt.rs
>> +++ b/rust/kernel/fmt.rs
>> @@ -192,3 +192,44 @@ fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>>   impl_pointer_forward!(
>>       {<T>} HashedPtr<T>,
>>   );
>> +
>> +// Special handling for Pointer: default to HashedPtr for raw pointers.
>> +// This overrides the default Pointer implementation for raw pointers to
>> +// use hashing, which is the safe default behavior for kernel pointers.
>> +impl<T> Pointer for Adapter<*const T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        let Self(ptr) = self;
>> +        Pointer::fmt(&HashedPtr(*ptr), f)
>> +    }
>> +}
>> +
>> +impl<T> Pointer for Adapter<*mut T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        let Self(ptr) = self;
>> +        Pointer::fmt(&HashedPtr(*ptr), f)
>> +    }
>> +}
>> +
>> +// Handle references to raw pointers (needed when pointers are passed by
>> +// reference in macros).
>> +impl<T> Pointer for Adapter<&*const T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        let Self(ptr) = self;
>> +        Pointer::fmt(&HashedPtr(**ptr), f)
>> +    }
>> +}
>> +
>> +impl<T> Pointer for Adapter<&*mut T> {
>> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
>> +        let Self(ptr) = self;
>> +        Pointer::fmt(&HashedPtr(**ptr), f)
>> +    }
>> +}
> The equivalent code for Display handles references with a blanket
> impl. Is there a reason that doesn't work here?
>
>> +
>> +// Bridge implementations for raw pointer adapters.
>> +impl_pointer_forward!(
>> +    {<T>} Adapter<*const T>,
>> +    {<T>} Adapter<*mut T>,
>> +    {<T>} Adapter<&*const T>,
>> +    {<T>} Adapter<&*mut T>,
>> +);
> Can you help me understand why this isn't a blanket impl like we have
> for Display?
Hi Tamir,

The previous implementation was indeed a bit messy.

I've reorganized it. Please review:

1. First, add the Pointer trait:

pub trait Pointer {
     /// Same as [`core::fmt::Pointer::fmt`].
     fn fmt(&self, f: &mut Formatter<'_>) -> Result;
}

impl<T: ?Sized + Pointer> Pointer for &T {
     fn fmt(&self, f: &mut Formatter<'_>) -> Result {
         Pointer::fmt(*self, f)
     }
}

impl<T: ?Sized + Pointer> core::fmt::Pointer for Adapter<&T> {
     fn fmt(&self, f: &mut Formatter<'_>) -> Result {
         let Self(t) = self;
         Pointer::fmt(t, f)
     }
}

macro_rules! impl_pointer_forward {
     ($($ptr_ty:ty),* $(,)?) => {
         $(
             impl<T> Pointer for $ptr_ty {
                 fn fmt(&self, f: &mut Formatter<'_>) -> Result {
                     core::fmt::Pointer::fmt(self, f)
                 }
             }
         )*
     };
}

impl_pointer_forward!(*const T, *mut T);

2. Then add HashedPtr and RawPtr types.

<snip>

3. Finally, modify the impl_pointer_forward macro to make
      pointers default to HashedPtr:

macro_rules! impl_pointer_forward {
     ($($ptr_ty:ty),* $(,)?) => {
         $(
             impl<T> Pointer for $ptr_ty {
                 fn fmt(&self, f: &mut Formatter<'_>) -> Result {
                     Pointer::fmt(&HashedPtr(*self), f)
                 }
             }
         )*
     };
}

Does this approach look better?

Thanks,
Ke Sun
>
>> --
>> 2.43.0
>>
