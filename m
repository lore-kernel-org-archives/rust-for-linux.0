Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B8918BC3D
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 20:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681642; cv=none; b=UrEx3oVxhKYzW3uhxmO6xaHcJJG8BMGIWCyhpOQj2ofDHa8H61qpUnro/5mnvNUbs9JTcif20fGTDEjDqUwrjXZgciwC+mMZvNN95tGqvpC5IKmxX4pHsmbcRmeQANfARcB/J809W7iJKwPEbyOJdleEdZ+NJmA2vKSblU62Njs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681642; c=relaxed/simple;
	bh=gKg0Dw7Paitg3iXBUhHKunRE5ysCLnjUhDe/xfwXzrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAbcXHtei45eWDswxEnlyaE84wMmS69CCh7cWiebTuGxhbtYOqE20wVZ5bomKTZPrFgLAFk3IRPpcJ9Dqw54NFeVv+tk93q2V97U2Qcax1wC8uNr1TUVDGMNv/z3IdxRyKiElPTPtcThcJCCQmdAvl6h6haxS2AqWdAKsbWQgY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AI7RRDf5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AI7RRDf5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so41395305e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Oct 2025 13:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761681639; x=1762286439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mL851umhUPJLZ6fct/l6q3TFneLb85EfFLqNrx5cTZg=;
        b=AI7RRDf5yH6zsSvodwvn/lJD2JvPZgGpoZaVyT0O/ZcWoBkp97oYatqKpn2tR4deJS
         j5GXFZFVnhV7zs1TQNthPh9hnAx5Ffw/OylAlDHCDAswvY3QT/ywImCHD6yCyAnDdrGR
         SR89afuRIgi6oaxoEr13wx7+tjn4H+bjcwGTaC5vemcBOeLSgKhp/krFjpMypXf/O3bC
         cX6eDk39yznXO7lyw4jqtdyaeTvMac9lNqdoKHaZ5N1FJO3az4r1AnYOP3G8cJB3y01B
         xMARHUUohB5D3tnHeFDStaiE8/2xOzX63WG7itOqZDDrFixdkMwd1P/SkYBGMY6wObgo
         Hp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761681639; x=1762286439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mL851umhUPJLZ6fct/l6q3TFneLb85EfFLqNrx5cTZg=;
        b=cxsF2kI6kRgF5APNuQstrpdvvXVkIqbEq72jQT+AccJ1+ZIfu8dPJS5S8SmZY0pusQ
         e3cKm03FTKk+WG5MJIsq7ae8OdPJsW4ADlz3EnW1bcsTCey3FPTYql1355QQ519GVKyc
         /T9+qP83saMdpRsbqnMHhhqLbNVAN3jMyzuCDPKA5qv9jRnycyGDRVX8McHqw02eeT0/
         ru5P4owis6pEb2T8TBgzrbWTy9G8nGe7NuF1Iq0LpqB6rwuUXDgfavUccbPYALdsKXk7
         uapQrnptqB9mndvojfJNtICmADZtxS6ZDxuh9hCbxJjtuuu7vxUpWN/NWTONCyvQsRcY
         zlcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMvkxK93Auh2mQszd+qyW37ds48ToVGlYBfuRmOUsgho5dLUSyF69RiCUJ1cpRoZjZWEL5NxqNGKj3L3bdJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCxGfWCQla0cRJBQpxOTxGllcf8OEDplkMipgb08lKv0izbvf4
	JPQIO94r66CEDgMTBlggWl5LOPKmbWkp+Q1OJKyykYO2l++0w4NUK40D
X-Gm-Gg: ASbGnctJQOvRVWn1hhr0N6VaRPF2v8QsZ99jJYPZjIdtE5SXYvTh2VAHG+oqAdEuzPJ
	W6nHsWoVMnwZgDs5Q4KgLgFfORM2FXMqSb/AT2Rrf08Jv99yuw2AX8pE9NT2pvLk5BrKenuE5Bu
	YYn2MtahNpY5gphy07XVjJILYx6RX+BF8anYYKKsoPH2qAiLIg7tW2iyJipK8Oiq38+IA8/RLQQ
	/MuEW8ddZhUreJgOnZALdBjvWkDWk5j8xIewbZEls36LlUccftijoBGsc+715js0CWTkZIKEA0Y
	EMJmVFwXOIV1AcfchcbEFcH7Olb1BDK7Iv1LJBbbHMLjShIpwBuTR6+8NPiyokcqDyioIAoDY6x
	GHph6egmyS97yfHjXVJsNH73etkZz06w4ye+/ORoOzJZ8a79+Eif42um/chA9Uqc3f/9E6mRh/A
	AEC8JX6oKRT4ZRJMWpBKVKr4bknW1NZhe8cAE4Vq8r0aIpiM2vM58/QrRsRlxgDTGU
X-Google-Smtp-Source: AGHT+IE/cBkMs1Ecb7E2+3QULB4TXzU55o3BTa1Vq4AzJPk/MOxEfEIBV9ttaFmvDXICTt90aFlWKQ==
X-Received: by 2002:a05:600c:46c3:b0:477:be4:7a52 with SMTP id 5b1f17b1804b1-4771e1f3bc7mr4985065e9.39.1761681639187;
        Tue, 28 Oct 2025 13:00:39 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:1c86:bfdc:bc48:7705? ([2a02:c7c:8b21:7400:1c86:bfdc:bc48:7705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b9994sm7557365e9.16.2025.10.28.13.00.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 13:00:38 -0700 (PDT)
Message-ID: <56672794-727b-4ed2-aa73-9e976e266346@gmail.com>
Date: Tue, 28 Oct 2025 20:00:38 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] rust: i2c: Add basic I2C driver abstractions
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
References: <508bd9a1-c75a-4d1d-bed7-ee759ac5a701@kernel.org>
 <20251026184143.280797-1-igor.korotin.linux@gmail.com>
 <4568187f-ab63-4c86-b327-90720ad20ac9@kernel.org>
 <30fbb191-5300-45e9-93d3-8b2ef5cf18ef@gmail.com>
 <DDTFXY5VJCS2.1ZB9EPNLDTPAC@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DDTFXY5VJCS2.1ZB9EPNLDTPAC@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Danilo

On 10/27/2025 10:00 PM, Danilo Krummrich wrote:
> In fact, quite some C drivers are already doing exactly this by hand. For
> instance, see [3]. Four lines after [3], raa215300_rtc_unregister_device() is
> registered with devm_add_action_or_reset(), which calls i2c_unregister_device().

Now that you’ve mentioned the parent device, I finally understand what 
you mean.
Originally, I started my Rust-for-Linux journey with the goal of 
rewriting one of
our platform drivers that has I2C children — and yes, it has a root 
platform_device.
For now, I’ve put that rewrite on hold and focused on the I2C part 
instead, which
is why I was thinking from the perspective of rust_driver_i2c.rs: it’s a 
purely
artificial sample driver that creates an I2C client for a non-existent 
physical
device using an I2C adapter. That’s why the puzzle didn’t fit together 
for me earlier.

> Having that said, I'm a bit curious now: What is your use-case for
> i2c:Registration?

As for my view of i2c::Registration, I see it as a safe wrapper around 
i2c_new_client_device that holds a pointer to the newly created I2C 
client and releases it automatically when dropped.

Thanks for the explanation, I'll drop a new version when ready

Best Regards
Igor
