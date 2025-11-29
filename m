Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7B6261B6E
	for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764418874; cv=none; b=qETF5/1RwEbN8XuslJIO2QM1pEYyWUFk18wpZb13tVSzcjq1jwOzIJMeq2hepzHl7tpZgnn633UVlF/x5cubIlSp5gLus++j60gqOW3IiCr00pHTPMTq9rB2+IC8/7Y7sUOJBahvz5Mr0hzkgaQ955ggpbyWfThZZkQKbEFohRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764418874; c=relaxed/simple;
	bh=/hGs8mbiQCRTygnbfmLXoaV4fdNOp1DAthk0vwLWjrY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTrCjH+zjjebia/IRn+awBR6J05J9wQHep4FlkifWBTYsABb2TA0EM/XibYEIiRDRDl7WFBfxmPqLPu+xrQeCx/VqcTSC5h4QaJBkpsLN2MJzdvAwwRTmvtFxQEkjmrG3NidGalqWLz9hikaAPRzKHW7n/khdy7OiB6vTaiS96A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiD12NmY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiD12NmY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477a1c28778so29753565e9.3
        for <rust-for-linux@vger.kernel.org>; Sat, 29 Nov 2025 04:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764418871; x=1765023671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KcVPfmTekyLiABGhJu4xmxadfb6FIwZsqQzyLFSkQjE=;
        b=eiD12NmYqerrQm7fuebXYtgVn3zuoPTe9VqJWJFSIVxbvok/4JoXwaGIEV9Hjr/Nq/
         OOwfdmKfaztM/cfCeW9g3ZTyK5haxLe9qV9w07gosZmr6FeoZ8dB2qIWwp0wQi/aGAu5
         p1DmM9VhOm/+Sk7L61Vki1dBVw6eeRmp2PCLXc4O3XwrbYdKe7coijNa/e2Ol1HYftwa
         bnuknRIlB7V4043eOA5wUgUp4gKhQvqqtPefiEfFUqPlH7j/YbvXFWZChuo0Hf6a7nJd
         /l/mnsdZyoetHu4s+cuBpE8DwA0YmbZpIGYorscIvnOvFYVTUsjwyPgZUxtYlF224m3t
         J5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764418871; x=1765023671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcVPfmTekyLiABGhJu4xmxadfb6FIwZsqQzyLFSkQjE=;
        b=gBOeZdjwomrH1C4jGqacwKowRk/iFypnpkxAndCQtSrCWuiAf7c1cZIbsfXERhQcME
         1z3+tkTO7vlTY6fN+VagPxT8SGD8pyMjP6DykFBxRcJctAWjjahR5cbsqNsq32PfYoio
         45O/l/LkEpaT+wv7AU2d5v03jYh9PlyycJFJj6s2DnPFM00q7uhnCnAdsWtI0Wq2Bd9H
         b2MBz7Onnjat1/ClCo0IXSbKWywCt9ZO0ycEAJpRIJlMiF8t/ctzPOHPjYB0Noqrthw3
         YmN4YCCEJV4xZLybQs8DXC36hPl1GQK5mXLXa5vx+dfiijQ/3nRyHMt1giq3OtVv7gAo
         NBuw==
X-Forwarded-Encrypted: i=1; AJvYcCVYvvm8DfcQKeK1LC29RsAKH/yqlfP6aDBgz1V2UcRxo1NLF6IatCIF0DUNWVY1yut9YpF+2P7JhDTiLpb4Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ablgdflV4ubBvbTSChmIieuehTif39HEX2dDw6MmEhM+GBcF
	SwL/+PgmaD8Bjq5qEJhgr+aggxPkB2tYCrNRYQkF+4Xzub0PUL+AZcsv
X-Gm-Gg: ASbGncvPw6ygdcYL9IGb/sKmudVMfBF6WuqV/yI9HfJF+1DX4irYOVsUPPbfkiBI4gb
	DntmYJQsR4BzRYGmY6Gn48e+BeHMW1yPInQegx02HI23fPh4/vj+m6nvnuCls8zfBgLklQ9WmLV
	WVLqv86KMp1J3sDChPXGKPi5j25e/jHfIAZWQEEZTWu8XIznNgsczIl7kkj9a72LJt8pYX2IjjQ
	vqRxZtKjQ+sde3UHPyRHSrlByIA5QTwXIDosxoFxqa1gTKwWJAkIiEV89wfS5m8U2mZuuGPDk6z
	PWhfT6sTLuO0lw0Riq0YQ2V2TG6FhB8BAIrrlPnLmz2AJsCcFKr8T3/JphflKRL9o3bz7kcTpPK
	YHg+gNDQYVOzeGK7n7yaclyLpgUKt/VLmKxXo7iO4PDjQBmOOZeHxDXFzCxxkW4ERwn1wGXk7EV
	WQyec6U3Nqq9yat5LgYD3s4F3NcX+SujZpkAeolTAJ/xee/ibx8AZKyRduOGmz63Hjy69oI3zZd
	A5+EHQt7cTRdJvY
X-Google-Smtp-Source: AGHT+IHPdRho1zaUXZGS4ozcekK0LR1lA9bfnMYzOaD4j+9k0x7QM6vylSP8/9z2op9t+DSRd2h1Jw==
X-Received: by 2002:a05:600c:3b96:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-47904ad907amr211433865e9.10.1764418870809;
        Sat, 29 Nov 2025 04:21:10 -0800 (PST)
Received: from ?IPV6:2a06:5906:2618:cb00:ddd6:3141:6a4a:f8d8? ([2a06:5906:2618:cb00:ddd6:3141:6a4a:f8d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a3f1sm15343627f8f.28.2025.11.29.04.21.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Nov 2025 04:21:09 -0800 (PST)
Message-ID: <1b7408c5-64a8-42f1-92ab-dd90a883c1a4@gmail.com>
Date: Sat, 29 Nov 2025 12:21:09 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: Shankari Anand <shankari.ak0208@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-6-shankari.ak0208@gmail.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <20251123092438.182251-6-shankari.ak0208@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/2025 9:24 AM, Shankari Anand wrote:
> Update call sites in `i2c.rs` to import `ARef` and
> `AlwaysRefCounted` from `sync::aref` instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>   rust/kernel/i2c.rs | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index 1aee46f59460..c50ca464d87c 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -17,10 +17,8 @@
>       of,
>       prelude::*,
>       str::CStrExt as _,
> -    types::{
> -        AlwaysRefCounted,
> -        Opaque, //
> -    }, //
> +    sync::aref::AlwaysRefCounted,
> +    types::Opaque, //
>   };
>   
>   use core::{
> @@ -32,7 +30,7 @@
>       }, //
>   };
>   
> -use kernel::types::ARef;
> +use kernel::sync::aref::ARef;
>   
>   /// An I2C device id table.
>   #[repr(transparent)]
> @@ -408,7 +406,7 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>   kernel::impl_device_context_into_aref!(I2cAdapter);
>   
>   // SAFETY: Instances of `I2cAdapter` are always reference-counted.
> -unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
> +unsafe impl crate::sync::aref::AlwaysRefCounted for I2cAdapter {
>       fn inc_ref(&self) {
>           // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
>           unsafe { bindings::i2c_get_adapter(self.index()) };

I'm fine with this going through either tree.

Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>

Thanks
