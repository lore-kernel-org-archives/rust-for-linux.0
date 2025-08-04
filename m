Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B851F7586
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754318457; cv=none; b=UbJharpp73zGuRJaZq+ibLA7kbImFhclKDZFuAbO6jYjoKeJb+xznEyOHXgCXwz/+Dy8j+FeR6ye5i1FyqxNVbPeZKDGBHh1RwhuRHuRIDmT07+S2F2MXcTFLYCiNzAQwKfKkqE+vlCV4UTy59GQQ3wQMb/hNt3HTGaIn2wlDgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754318457; c=relaxed/simple;
	bh=2OEpEKlpsQ+cAJMDuC8Unwl/9A6P7J5/25Dfs+DJHy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7+XJK3cgfXRaJH3DlMnqXgZbJaReYM4nWPCCIHemh1O7azxHFAtzOdpJKjGORC00671rFzOQ2/0oiXapN0n9CTQDK551gfx9BLX6cAFhiKbMXIQ8uSMqpSE9wPME3xdChroSoOVHVeQ5f9ZVGK2hhFR0/IaEDAonB8nXlniL3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBRfxWhf; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBRfxWhf"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b786421e36so2578727f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Aug 2025 07:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754318453; x=1754923253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lDFt6Q1UpmhX6GNWIASj7ymBR/pi9xVucELf+Yk+0qE=;
        b=UBRfxWhf0K31cGE19i+C+F7PpQ3LPTjhSiKuS/Zv+y9xYSfZgRZoq46DkaPTWjdhMn
         5/tieLtzaWSEERYMg9oNgvzmmIFBTMpAtvh7HqCaV9zyxDQEul+3/Mq+qUMvdM9FDCOF
         bQD2xejfoUVSl3zTx2t9CDylCnviiz0mWF0bfKwInivxCvhVSZXzGV/56wYFcO8+oXcF
         5HvZy1+FYFba7qAArl6FT0F1ndGH2sYMn2stPI81M++ZJKym3TUOevWZ4TxajQQ7Ue/F
         iFVI1kox4fsqYMAGWV5CWlXmNDskFSnDi61zMrF47O865VHvKiCwCctxv6sktEKSIJ7k
         ZOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754318453; x=1754923253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDFt6Q1UpmhX6GNWIASj7ymBR/pi9xVucELf+Yk+0qE=;
        b=Ia2qxx5WZ7LkKZ7mM8ZoApfxKpeq+jmmz/e9r4uh9HVziP9zyv4CNzoIpw77fE3R9w
         /HFdg8pOulyapPcAzFb/GMSaq5LgmZQVFlhI8K5XEXct4eoE18+zRHAr+V0IOpKiXi9G
         DeQV/oV4pFL70FUBaxCWK+r2uhPluVLXOTq18MNIG+kIbNFe1IdzQiFny8gYvKs+w4Rl
         eQ2iogliL3TISpoV55CzVwRAvO0eNABpmuispT4kzgSlyC2ywqLEOmcCtzjEaTeUk8G0
         0joi7u7Gkci7RyckFCVL2BSpDp8/EqgmKpD8DbkV8kM6HFOmCwprdE0Q99HOlUuuVgoO
         sxwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSaZkfkgZFFx3NFh4oT+K2rk4SwJ6bbxKHmFeG8SoAnhzQPNRen3hphCXiOf8dcZBuTuRGo16K+40qu2rX1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwjilMdLphRnn20XYxbcbliYS4kDVnv9Qt1W1QhN8jKmRvIh7x
	AXamueeFFjVv/NBupzAZS19ShcvWnaq/++V0/UV4XgXyl0zr6LwsUeXs
X-Gm-Gg: ASbGnctzenOSO/4i5UgJOXoC529//QozJcCXRTkN1hRrI95lvuM9Nvye3lih5Hi/k11
	b8NIh3nJHfwl5xdlDQIh4OUx/7aEWfRfLW931jeddVtdN8zHO6R/XR/m3+nnUL7dB8W6Qm5FIGW
	UVrLiGnaRMTAE9qqc7fI3iLu8QueX7Pt9IRoZ9BBXKUvB3mVrnCNObD51CXtLcx6gW7q/S2G/eS
	MdJdD00iNpc2uzjMbshiYddfzubVrNKmtF11JCo9RvCs53x2Sd1033NGZiuq1+ttWqLHC8WSyZs
	OcKoWQZr2Pwonb9v7XBHlsHyCTUryXi+QgmYr5pzkF4fTdNHtYNQXyE4fpqhPGbNGrPavTsoWFJ
	dsiNvx0jIuZD125R1AQ6cKxE0CwXtXQy92ggUac7PCQ==
X-Google-Smtp-Source: AGHT+IHMVXHMevXWXCOu4AqzglBf6LHbTyarfAO588QlQaTHzPbG2miVPV9SyrtBNeyI7HhTdoXkrg==
X-Received: by 2002:a05:6000:144d:b0:3a5:8cdd:c174 with SMTP id ffacd0b85a97d-3b8d9485977mr6675497f8f.26.1754318453144;
        Mon, 04 Aug 2025 07:40:53 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953f886dsm222030935e9.30.2025.08.04.07.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 07:40:52 -0700 (PDT)
Message-ID: <1652bde1-a06d-42f2-aba1-c852e2961e5e@gmail.com>
Date: Mon, 4 Aug 2025 15:38:36 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] rust: i2c: add manual I2C device creation
 abstractions
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154438.14759-1-igor.korotin.linux@gmail.com>
 <A5DDD914-C07D-41C6-83C4-5ED9730D8A5B@collabora.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <A5DDD914-C07D-41C6-83C4-5ED9730D8A5B@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Daniel

On 8/1/25 18:59, Daniel Almeida wrote:
>>         from_result(|| {
>>             let data = T::probe(pdev, info)?;
>>
>> @@ -312,6 +311,77 @@ fn shutdown(dev: &Device<device::Core>) {
>>     }
>> }
>>
>> +/// The i2c adapter reference
>> +///
>> +/// This represents the Rust abstraction for a reference to an existing
>> +/// C `struct i2c_adapter`.
>> +///
>> +/// # Invariants
>> +///
>> +/// A [`I2cAdapterRef`] instance represents a valid `struct i2c_adapter` created by the C portion of
>> +/// the kernel.
>> +#[repr(transparent)]
>> +pub struct I2cAdapterRef(NonNull<bindings::i2c_adapter>);
> 
> Is there a plan for an owned version? Otherwise I’d personally drop the
> “Ref” nomenclature.
> 

Not at the moment at least. I'll remove this Ref nomenclature in the
next drop

Thank you for the review!

Best Regards
Igor
