Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380344C80
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Jun 2025 07:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751181631; cv=none; b=jE4zDhlLb8QCt3hVLzIdkXmUDtljIJ0xqMulec9VbUL40xznkmO+JtedGPEaIgOxFeC1Ad3owN2bkTIzqUmIT6tzHoWY87gB/LMasb6Xvs8OY/9T/SoqtwQpl3zIUnYvDerM4b09C0C6INebbH6wbzovOcKlVv9Ur1iKbbi/ajw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751181631; c=relaxed/simple;
	bh=Cpp4cimSlX6/ZA+LS1tvkBe5d6uSGAhUqiVr+pmYzpU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jwHoqIjddEKioiJKsT4+MdAWyx1Jd194VDUpPsgA/aWC9P5fvmsWlY0ieVfW0H4Bauq5aU+EUYAK30zMZsc+7iQVLqW3IvCw27eKfZ/5SkRO4v1lhWTYQVSNB7IT/yaTOIAr8oFc1kAw0h8xXGtF0A7R5DPNdLico3093uZ0jyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org; spf=pass smtp.mailfrom=penguintechs.org; dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b=a100A77s; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=penguintechs.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=penguintechs.org header.i=@penguintechs.org header.b="a100A77s"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c3d06de3so1538006b3a.0
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Jun 2025 00:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=penguintechs.org; s=google; t=1751181628; x=1751786428; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3YbYWCMUijBwsfHEBbDnTMP57muDMHFrEOHCcbc1whE=;
        b=a100A77sxKk1gtNpMy/JCKtFz8t9QWsqyQS+qSjflKj7eUQUdE9UhpqxeJlJLrbql+
         y9rdPyzsYDsDU1NBTpPPb6vhwVh5mHzPZ2P6V0mIG+1caSWFu/EyJsyEMB75SuJ4XCqm
         vsZr2ueQsH0xmDKjA+7Nyt+MOD4cp+ODnODac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751181628; x=1751786428;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3YbYWCMUijBwsfHEBbDnTMP57muDMHFrEOHCcbc1whE=;
        b=k20/XSciVHu6PaU5vZ249CuC65dVBtN54RE0OSRmGnxfqq5ZRx1z2XpQbaPwgof4v4
         8WidkuoWT7RXO8ij+hpjwe3/XT9LPFvfWE+/D1UD99Ybzxs30tAeYgcEtgsXEXCFUruB
         3ofKP8H0p8Mdvbl7NXkOzKScfxL3hIw9Lxp32KZrdtFTqs3u5UR6XuTt5KGoSxEc9h2k
         X+HrGNIH3iGDXiqJo4KPpvZcmbVZh0qHrtBUrYV5MSKPn2pVGARiAbfk0wGmq9TeoheZ
         S/QUikRmICo7cg72LC6S1B/hHE9xr3uDxwfBgu9LheOSpC39GbYNmfaQ7jpsRspOZqhR
         T57g==
X-Forwarded-Encrypted: i=1; AJvYcCWPm1HWSQywMsEZeTUPzMf9KuqpAz4EuEwZEYPK1p2h9ZWbR86jfXweTokzFDyU4Eyk+wjjMTRp/lqHopXFUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI8qPhYCXHzXqIk0XcVKnwEP4ug6L6yLK5Gc45HTN8AD5JPd8p
	D/h6cbAmbSwPuZ0KSnKFRkBgttKKH0V4vAK/KJVECw2qcpOhunY9+25SLxhIq30LYmBdVFaQSh+
	y1oyrzIGK
X-Gm-Gg: ASbGncvP/LrSGqeTKuVjfeMO52OH+RgaV05D1mW5QUarT5b3kS9nYfYHs3EEiH9qepE
	dM1SJ3Jb8ab+6YZPK8bdbqIre27z1aKo3HKFjIpcZixPjZwaQqxsE3rCgKe5jL/WH7vGwT5zOeY
	NTJ+ELU7QdpznFVxPhQqtmOr7NOXfdIrsHBuF2PkdDAJghmVh4WrOYlwhsodGlaYIt8PCus1A/c
	GUfm2MuSs9wPoKLsbNRNFvTjCYY92dm9dPjwWoYX7X90GwOyS4+9vka7JgFcgdjOY2aqhF2PyHc
	rvh87bey+w/cj95/ukbYYeLjX16Tq3aHiR29yZBoxtERV4MAXt3tE4TiANN6akBRHjVGrF8nm/6
	Af7uGOxtAsNrXfH0fWL1DFDblcZbEcXQlhbpr4Rcju1tf3Q==
X-Google-Smtp-Source: AGHT+IEHkik0r8PJ7wgKd9VwE2NTDfBOTlJf0xKoCEuaiQe9ZnV5cbmTfkGbKhXrCLsrJpCbzOkIvw==
X-Received: by 2002:a05:6a00:1898:b0:748:eb38:8830 with SMTP id d2e1a72fcca58-74af6fcdd6amr11854659b3a.13.1751181628497;
        Sun, 29 Jun 2025 00:20:28 -0700 (PDT)
Received: from ?IPV6:2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08? ([2601:646:8700:dd30:5f3e:5ba7:e0ea:9a08])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef308sm5885444b3a.157.2025.06.29.00.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 00:20:28 -0700 (PDT)
Message-ID: <a6b1b841-87b5-4b77-ac15-89364cc760ea@penguintechs.org>
Date: Sun, 29 Jun 2025 00:20:27 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: pci: fix documentation related to Device instances
From: Wren Turkal <wt@penguintechs.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>,
 linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
References: <20250629055729.94204-2-sergeantsagara@protonmail.com>
 <ee8636ef-ecf5-4e1b-a304-9a96df1ae4ba@penguintechs.org>
Content-Language: en-US
In-Reply-To: <ee8636ef-ecf5-4e1b-a304-9a96df1ae4ba@penguintechs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Apologies on the double send. I thought the first didn't go through. 
Please ignore this message and reply to the other.

wt

On 6/29/25 12:15 AM, Wren Turkal wrote:
> On 6/28/25 10:57 PM, Rahul Rameshbabu wrote:
>> Device instances in the pci crate represent a valid struct pci_dev, 
>> not a struct
>> device.
>>
>> Signed-off-by: Rahul Rameshbabu <sergeantsagara@protonmail.com>
>> ---
>>
>> Notes:
>>      Notes:
>>      I noticed this while working on my HID abstraction work and 
>> figured it would be
>>      a small fixup I could send afterwards.
>>      Link: https://lore.kernel.org/rust-for- 
>> linux/20250629045031.92358-2-sergeantsagara@protonmail.com/
>>
>>   rust/kernel/pci.rs | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
>> index 6b94fd7a3ce9..af25a3fe92e5 100644
>> --- a/rust/kernel/pci.rs
>> +++ b/rust/kernel/pci.rs
>> @@ -254,7 +254,7 @@ pub trait Driver: Send {
>>   ///
>>   /// # Invariants
>>   ///
>> -/// A [`Device`] instance represents a valid `struct device` created 
>> by the C portion of the kernel.
>> +/// A [`Device`] instance represents a valid `struct pci_dev` created 
>> by the C portion of the kernel.
> 
> Should this not just be a "a valid pci device" and let the type in the 
> function definition speak for the type instead of duplicating the type 
> name in the  doc comment?
> 
>>   #[repr(transparent)]
>>   pub struct Device<Ctx: device::DeviceContext = device::Normal>(
>>       Opaque<bindings::pci_dev>,
> 

-- 
You're more amazing than you think!

