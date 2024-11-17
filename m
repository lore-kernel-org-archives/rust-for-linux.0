Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3934F2C6A3
	for <rust-for-linux@vger.kernel.org>; Sun, 17 Nov 2024 07:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731828862; cv=none; b=C/B5B921f0AV5LHac9NZ5RjaCC4UsQbyQdaYIdQ/jWxx7QyU5SJJ4pZLDK06hvYh4nL94cMQkS3nsEcMYteHnJ4hnA9yQvvGyxopQ4O07wx+SBEheAEUugPGFs0rrHwaYLBH9Eio/6kCQYwY2ltoI1F22TACa4Yo94nTenEtoKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731828862; c=relaxed/simple;
	bh=29OC8N0Lz9n+zVO8zYkqiGVDOqO39ow89Z8PYalbIgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wd++T4paLvKvHfNhcJuO+uhA5DT6rEZEa/AAkDcQfIexSNXgXYobRpKpe/GPPqYbSkmYWx/BY+fQRXVgAdaul+oZPKRYWgZ/wraYFfaIEQPFSBZK7ZwN8hZyBRJ+GNkrju+tfVVqtv60ratci2HIa/P+KpdooVCwFTnyVPIwQSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBwSlwt1; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBwSlwt1"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315eac969aso17563865e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 16 Nov 2024 23:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731828859; x=1732433659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMkH3XNETlXR5Aqm7GFLHCsw353P/st9GZvD9W4jK8g=;
        b=mBwSlwt1LoEg26e3HjKvuzEKUyzKRqr5VM37dj/7G4KHPakZ4G+a/IRyfnSuvnpb6m
         LBDmOUfIQ/+ZYildtsw7NYIDdTENQeYhHZrbC78QChzmUNHXmruYA98al6BEqk25sgx2
         ER9x9/y6oeqZdJ34L9dC/9pzEGee5s1SoHoADF1xhy0E9kXgnBKbNxf+tIv/2dITH6/i
         oCFvErtP0XZNtpDX6aUvMBmvxpMb9qTAdhQxSRkQC1mHBAXS/XAmwbaxOvDApjCkjk8f
         4oF/kwY3EHLRGir3sShlNp1WthvO/sqxVZAnmcGaGJBzlMQ28oALGVIUYJEIi9J8uqCd
         o3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731828859; x=1732433659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qMkH3XNETlXR5Aqm7GFLHCsw353P/st9GZvD9W4jK8g=;
        b=TMbKo/HMk56EO4ZVqLsRqoRc6sMU5FvLVv1alqMRm0xpaQQ91AoC5lRY9g3IyAiL7F
         ZGSRlOKo+xZnSrbcavxeTP7ve57FUBbYMVVCfg1lQ9Y1ZQCx0F7z5BybC0Cbq6CUfzFL
         69h6t+6DodJjQZByRhJtnTBXRftBKj0ssXVRHoYiLPH8oVbD8cdGvG5eMZtlIKVM4tj1
         Eg94hEamxqTPX/heZtaoQMudTJ0HHnLZSK18C5cyi/ebHaNMQl+VBcNSgSHErfPp/bOc
         gPmQSi4KTBoTV544mW1F9QUnpDPJrRcC+FAF531LnKh7/4CpIg84PGhVv9NvBcCXMsYB
         dn8w==
X-Forwarded-Encrypted: i=1; AJvYcCVWDmNzsae6fvquaT/6s2ryu6v3xr6sriiTjSQB61nUc5Gk70rteKITXyb/3mxIRgi3X9KZURPFQcrgyt6FRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyD7HhM3dJGaJ6oexZAzUc2Vq3nh72P8QWXuBu9bCCsgmFp+47r
	GNH4mgL7fTveGb4WKGQfVY35cV0YNRwVNM0/E29KAQtLxw6sd/+0
X-Google-Smtp-Source: AGHT+IGDOnhERf/L41aTWbacJPwEJGCXqv+9uqfMbaXa6fZ770RbZbUg8fMghTVHwwpQd5+iJox3rQ==
X-Received: by 2002:a05:600c:1907:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-432d973e363mr97549545e9.4.1731828859261;
        Sat, 16 Nov 2024 23:34:19 -0800 (PST)
Received: from ?IPV6:2003:df:bf0d:b400:a326:2e93:6b9d:90be? (p200300dfbf0db400a3262e936b9d90be.dip0.t-ipconnect.de. [2003:df:bf0d:b400:a326:2e93:6b9d:90be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80582sm111745975e9.19.2024.11.16.23.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 23:34:18 -0800 (PST)
Message-ID: <702ce883-3d20-45c0-b597-ba55f56d418e@gmail.com>
Date: Sun, 17 Nov 2024 08:34:17 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: kernel: init: replace unwraps with the question
 mark operators
To: Daniel Sedlak <daniel@sedlak.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20241116195221.373332-1-daniel@sedlak.dev>
 <20241116195221.373332-2-daniel@sedlak.dev>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20241116195221.373332-2-daniel@sedlak.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 16.11.24 20:46, Daniel Sedlak wrote:
> Link: https://lore.kernel.org/rust-for-linux/CANiq72nsK1D4NuQ1U7NqMWoYjXkqQSj4QuUEL98OmFbq022Z9A@mail.gmail.com/


While talking about that thread, do you like to cover the dox()
replacement

https://lore.kernel.org/rust-for-linux/459782fe-afca-4fe6-8ffb-ba7c7886de0a@de.bosch.com/

as well?

Thanks for working on this! :)

Dirk


> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
> ---
>  rust/kernel/init.rs | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
> index 347049df556b..81d69d22090c 100644
> --- a/rust/kernel/init.rs
> +++ b/rust/kernel/init.rs
> @@ -1076,8 +1076,9 @@ pub fn uninit<T, E>() -> impl Init<MaybeUninit<T>, E> {
>  /// ```rust
>  /// use kernel::{alloc::KBox, error::Error, init::init_array_from_fn};
>  /// let array: KBox<[usize; 1_000]> =
> -///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL).unwrap();
> +///     KBox::init::<Error>(init_array_from_fn(|i| i), GFP_KERNEL)?;
>  /// assert_eq!(array.len(), 1_000);
> +/// # Ok::<(), Error>(())
>  /// ```
>  pub fn init_array_from_fn<I, const N: usize, T, E>(
>      mut make_init: impl FnMut(usize) -> I,
> @@ -1120,8 +1121,9 @@ pub fn init_array_from_fn<I, const N: usize, T, E>(
>  /// ```rust
>  /// use kernel::{sync::{Arc, Mutex}, init::pin_init_array_from_fn, new_mutex};
>  /// let array: Arc<[Mutex<usize>; 1_000]> =
> -///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), GFP_KERNEL).unwrap();
> +///     Arc::pin_init(pin_init_array_from_fn(|i| new_mutex!(i)), GFP_KERNEL)?;
>  /// assert_eq!(array.len(), 1_000);
> +/// # Ok::<(), Error>(())
>  /// ```
>  pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
>      mut make_init: impl FnMut(usize) -> I,

