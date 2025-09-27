Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704BB242D97
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Sep 2025 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758991431; cv=none; b=dgFOhb00bZasedDQeD9UdporDVGP0MdQkZJEb7pCCd+ktxLcJ0x03l8v8bZIfxAzr+AiA/XU0wxDwdFL1JBSueSYY3hoKGu+Mpz7qk+D05MBcAzW1WcPZZD9qixr6DmmNHV2W4MZmpGPUEO43EhVw4u9vU7qO80iVZT8kXMS4Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758991431; c=relaxed/simple;
	bh=vKpTRRRmpkwvD+RKQ8Vdg4UWvE2ebw01JOfwjsbS5Qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKzQnUQPtBCMCdje/dbqc5CRkLDH0GOI79DrMpcG4PO19Nl+DPGUpJXB1s9OJlgaQ46yVtVkCjmToAAl7GAoj+9S4Qfl0ag7Vzlvtuq3jYC6YgETOhPc5LBvyPJTs8Q73uHJLqwhsZ5CANpNDsMeKHUp8f5R/1wti3TvSTCBgys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtRyPe0K; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtRyPe0K"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso20342605e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Sep 2025 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758991428; x=1759596228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOF0Bc+2gNxqDcWN5Q3dw7KfEBLw6JtH3pzFUg7pzQA=;
        b=YtRyPe0KtIa0kjup/zwBrbRwDVnHi0WaXzFiFg3Xpcv4wPgKFH0wRWujllvtkPNRdz
         XYtlSv/KbJKF7nb908fZSjIqZAz6KEcXP/XLJf96tITazZooRfdPtIyfQH6QtJqRh9ye
         CuDsmLQrWBcjZdQhw1N7+JsLNsbd0KZVAGxwNlt9QFEqniMapvCxuOG601Wlq890W3ap
         EBF7st/PVk0VSgQjCbhA/XQXhhOrWK+n+vtyZibHAj7lQrM6pqpxBreS1hKc33d1wCu/
         6xeqqB9RzApBQ4FU3cRvinwq950uAvq29uehlLsrocBKWbpWkjbiHAvY5Ei9oOaKAHsm
         SyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758991428; x=1759596228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OOF0Bc+2gNxqDcWN5Q3dw7KfEBLw6JtH3pzFUg7pzQA=;
        b=jbnldeDHP5FzNaiV8whgodIvMNMaBNjjUDgbvRbCQZxWKndd8yI3Q/hkzb9KYDv+qM
         6KBhyWyU/eU/gvncsUVYBbcDGv+hNPaRCNVgREmv3I3hef1fXfpbEsa2+XYG4TSnxUud
         PW9mTPMRjZwpsmjrLG80D7sFJEsaTQtAMVBK+KW7dKvd6yedTI/quJenUtU2OtpeAoxq
         xPL1InNz21Qu48yP3nWVcvVkNA3kBg7zQQl9hnKEvw5NNAvPCh5ZQ/djaTtc2dsUJHVr
         DessgdxL7Ef0qdczGan6Ci6/zLKRLm7/UoGPrU9tI2q7nmh78pyfxsOJ8rSbNxNFDtEe
         9K+w==
X-Forwarded-Encrypted: i=1; AJvYcCUPJ7OgnZnhUubBjVowQGWekue8gA/YehkGhDoXAw9uMe9feDZRwd2B3trjNZr0vO6jBGYfx6O6lTAMvkLmtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3FIhN031eYlJFBMaRGDNWucyxDpXacfWNnWB71kad54+uWcFd
	n/yxccHjdTdRB6RlSaZ4F6Xm+DaOzt7f34eZtZI8salyh6iaift/18s5
X-Gm-Gg: ASbGncumn11SF4truPSqUYSG34r2mhiKwinziu5bPkHMSGnujeH16JOOaqsCPAHrbb1
	IMOphjTgjymvvSSaiAlR7SZyZvoYsvalNt4qmjtA4l+PB38nRupRn8d/z5UPo/u9n1CtQPHp5h7
	E/x2DU1AN/CsgHzCFuGbYGDpOFQY+KtEaVR8/h9pu6+If2EP/ISnO3wSBXtEBzGUzd1Y43wHi7K
	HltRhXd2Yo9h5BGQ8aZCef8b/1Yp/3bolMHMurXLcNRcc8PAt7bMgKFZuooXZbQwwb2efoNpn65
	LoTNRGPBxRF2Se8EIYKl8YaSx84kCRIrR9vnCZslr8LLoy/5OLMluDom7ur05jf/L8YbBNrDh1J
	nM9zNy8nwMmUWf3i384nLURNtjB4gOz/83iC60KSl9HGOGzuzqmR0GnkfVgicQbCnQR5EYDXTT3
	njNlccdqPRbxnpyurU1ilBjFTs6ElVqA==
X-Google-Smtp-Source: AGHT+IFIv5xrxFaIIFhGL3xlayHFyRiak61vxIYfE2UYyGSdIiQTfaA3TXu6JLuem0D6Pr7aB35E1Q==
X-Received: by 2002:a05:6000:400b:b0:3f0:4365:1d36 with SMTP id ffacd0b85a97d-40e4354dfddmr11267608f8f.16.1758991427482;
        Sat, 27 Sep 2025 09:43:47 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:a8dc:c580:efa:e675? ([2a02:c7c:8b21:7400:a8dc:c580:efa:e675])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fbb27sm11247673f8f.4.2025.09.27.09.43.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 09:43:47 -0700 (PDT)
Message-ID: <f65c9cc0-318a-4c0a-9d0c-9c1a3d58d2b9@gmail.com>
Date: Sat, 27 Sep 2025 17:43:43 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] rust: i2c: add manual I2C device creation
 abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
 <20250911155015.97250-1-igor.korotin.linux@gmail.com>
 <DCQ9AXZ5APKN.1835AK0PVA3S5@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DCQ9AXZ5APKN.1835AK0PVA3S5@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Danilo

On 9/11/2025 9:34 PM, Danilo Krummrich wrote:
> On Thu Sep 11, 2025 at 5:50 PM CEST, Igor Korotin wrote:
>> +impl I2cAdapter {
>> +    /// Gets pointer to an `i2c_adapter` by index.
>> +    pub fn get(index: i32) -> Result<ARef<Self>> {
> 
> Where do we get this index usually from? OF, ACPI, etc. I assume? I feel like it
> could make sense to wrap it into a new type. Even though it is not safety
> relevant it eliminates a source for mistakes.

It usually comes as predefined magic number in a platform driver info.
I'll define a specific type for this number for clearance.

>> +    }
>> +}
>> +
>> +impl<Ctx: device::DeviceContext> AsRef<I2cAdapter<Ctx>> for I2cAdapter<Ctx> {
>> +    fn as_ref(&self) -> &I2cAdapter<Ctx> {
>> +        &self
>> +    }
>> +}
> 
> This AsRef implementation doesn't seem to do anything?

I misunderstood the concept of the ARef<T> a little bit and used this 
as_ref() instead of just getting a reference by &adapter. I'll remove 
this in the next drop

Thanks for the review. All other comments are noted. I'll address them 
in the next drop as well

Cheers
Igor
