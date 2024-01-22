Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738CF40BE9
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705947292; cv=none; b=MoNiNacIJnYE/+arLQKFLyMqSsG16okOKuNRjZ0MrFRCO/HnuszhLXYcKS/SfhL21PM9b6IoddmRH/6KAAhd3OxnkmIoeeg8TxYqwwUDWfqY1RCKZv7OGr9IEQ6s0HN66MBKmve7SuF/aq2fDG+BUS1UWRvuRDL4p4Af9ar2p1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705947292; c=relaxed/simple;
	bh=eSkr0qU06wKrSi8tyWIVXPzwyIZjD2JbUFiCE91Pp4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kO/qZ1dvfmlhGke1XiDdzr70McPm4+btvoHq+q7nPkVLJZyfTvRd/uULugkvjqmTC+XyijGrnk7QxLjeLp5gHpPCJycx9PfsVHTLbZ3UlCvtNzO0LjwJdXDzJBVJwDBO+sreG9pgNsbQSKIeDR292zKX4PNvLggAOEINuaA8Z8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SheNWQr1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SheNWQr1"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d71c844811so14473285ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 10:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705947291; x=1706552091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ZQiUMIbM/QR+tefeQZWzCcqfxhlMmahEYlnL7cYztQ=;
        b=SheNWQr1jop5p6dq60fs4GYr/WpWWkAEqz7KNfq2VkiwQwh8TCXbnySIoKB9bqCKX0
         Dd/UIBnk8iAmXi4b6RG2gDStqi+DPMxXeHrP3eGvcsYczy0Nn9biJ3UmAIc9Ra+eZVMG
         irkdb5O+mPMWDGKuRz+yyB6PpCNN8V2toLLgVR0Cg+64ixSnlXccIHK1/qeJFQedk+CH
         07bmhD+JRRmlj+dTD7c033lkH5bdSM+UwGL/z/HPQinboOPvkZBdXE+7RQ+kTqFt+oTE
         /B952FuqtNqoE757nMiiL6vNhavsXagaN2+ayeylcKqSca78jGnN5BVpOi3fQI10zu1b
         tNGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705947291; x=1706552091;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZQiUMIbM/QR+tefeQZWzCcqfxhlMmahEYlnL7cYztQ=;
        b=vrBfcZ3V5yJ/YcI/qaKp+BMqjpXvqr06SzjRg7TeoZDbSwclMQ1p6EhLjlKXOQ3K/0
         Tza6OS5ROt5DH9nGjQ1IGfws6C04rFVt0jKXFDbXkcghajxM2JqKQXRD4kbQk95/aiCF
         aBzQAjc586t9p3WQFda0x501VkCop1xxAouZk6JLnfUgDO8og1g2OU6wciBbItHNYVxE
         bpbEJejMT19SdEd9v1GuHh6l3XnXPs1ucNCXlOHAUkh/jjXvgdoG4C0GHOIadGptm+K5
         1TF4mVZ83aOQb5AeuS/cUJxWJlgJ37quOzeGsIFjeP+ZdSbOVW1q/tCj/UrZv6zY+SPp
         5A/Q==
X-Gm-Message-State: AOJu0Yw6UUwLSyEhgfn4bZB8dGeJ3TytrLhaYWUe6bDf9BqBCzZtszY4
	XpQ0kpVbAC90b8vSwmQx0TTIudpa1yhFv65Kjzuce79F8TL2Vuwm
X-Google-Smtp-Source: AGHT+IElJbAA8mAnNnrba/R4lm/Ifm+knu0arQVZWNeGF9eu0fCyq819Qtrgg3oyxaQ9fq/YrYuMVg==
X-Received: by 2002:a17:902:8216:b0:1d5:a9d3:7787 with SMTP id x22-20020a170902821600b001d5a9d37787mr2294929pln.41.1705947290758;
        Mon, 22 Jan 2024 10:14:50 -0800 (PST)
Received: from [192.168.54.105] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id jh10-20020a170903328a00b001d6ea47ce68sm7541610plb.52.2024.01.22.10.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 10:14:50 -0800 (PST)
Message-ID: <e3378ca6-85b4-48de-81bc-f62e4e567bd1@gmail.com>
Date: Mon, 22 Jan 2024 15:14:41 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: types: Add `try_from_foreign()` method
Content-Language: en-US
To: Obei Sideg <linux@obei.io>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 Matt Gilbride <mattgilbride@google.com>
References: <20240122162553.64610-1-linux@obei.io>
 <0100018d31fe5238-538d9c26-64a3-49cb-ac76-22362f73d80f-000000@email.amazonses.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <0100018d31fe5238-538d9c26-64a3-49cb-ac76-22362f73d80f-000000@email.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/24 13:26, Obei Sideg wrote:
> Currently `ForeignOwnable::from_foreign()` only
> works for non-null pointers for the existing
> impls (e.g. Box, Arc). It may create a few
> duplicate code like:
> 
> ```rust
> // `p` is a maybe null pointer
> if p.is_null() {
>    None
> } else {
>    Some(unsafe { T::from_foreign(p) })
> }
> ``
> 
> Link: Rust-for-Linux/linux#1059
> 
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Matt Gilbride <mattgilbride@google.com>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Obei Sideg <linux@obei.io>
> ---
> [...]
> +    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<Self>;
>   }
>   
>   impl<T: 'static> ForeignOwnable for Box<T> {
> @@ -68,6 +80,14 @@ unsafe fn from_foreign(ptr: *const core::ffi::c_void) -> Self {
>           // call to `Self::into_foreign`.
>           unsafe { Box::from_raw(ptr as _) }
>       }
> +
> +    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<Self> {
> +        if ptr.is_null() {
> +            None
> +        } else {
> +            Some(Self::from_foreign(ptr))
> +        }
> +    }
> [...]

Shouldn't have `Box::try_from_foreign` been the default implementation
of `ForeignOwnable::try_from_foreign`?
