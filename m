Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC63C26E6FB
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767454722; cv=none; b=Rl/zgWX31VXSoG9PK6ZFEY+FO68sA18movoxMxHtI8vmPXsavfZ360wlt8ZwFyvwsdeBLvJlo289UyK4oEQ2WhjePJUMvd05kxOxl0KIgpxdQNSKqv/2cjIEKX5QEbRhwf7CZk1B0b3ggM6XTMs54kbof3bI/QYACjI3dHArONA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767454722; c=relaxed/simple;
	bh=Cq3k1/fXBP/fel0pjPIO4KMDsjM8pwucAIhaVZQ4XBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZx7KOzuYRqqUMF2k9nLmHPq1iHckQEbc2YNm+3lRSD7lWULDA5BUR3wNpuKWLlYaTAisG2ftPWEFPD/6PbtUZNu7gojGdkIm/IXYOmBDRyDpEV+hRZaR/N5YQkB/be+IK7s/L5EAZHrRYwjQCbigKiqpwtYBMMrr0o0deNHl8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=me7GF99J; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="me7GF99J"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so14365557a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 07:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767454718; x=1768059518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hs0EhRoobDLxoEH08l0zC5fr9dWFdN5yFIFiuBMlNQ=;
        b=me7GF99JAULmF/6ay0IJjFgsGXTTukgbeEgebbP8q/Z4bsdZ4vL3NvJsWK/PCrrn0t
         TLw6gDPXD6DidR8zBY8BLlNs4IwmmYAdXHNdn9ETipEo9Zs2GPneXyINpnhyovBMsRGh
         09qOy8YCggXhCMfKoLG9NV+EIvET66VXDeh91/0iufIhlqQO6luxHzdfsgXQAq+Dw5ey
         QFF+vSU8P/4sw8zI3XdcLImEXTzZOW569LgcX0VXHJ9DHiNoWAPcl1+N+Mc9SFHnrDWT
         CUa+rXF/pg+uaSjLO8MxwlZh5BBqpfXHf/Q96drNdzNI6KqVbj0NVEyqmw92luN6tGqD
         6m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767454718; x=1768059518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hs0EhRoobDLxoEH08l0zC5fr9dWFdN5yFIFiuBMlNQ=;
        b=nUhZ8s8XZyfM5Jhxer/aKC+opCqNHXfDtACXUxmzTyNuYkgf+BmdiaYM76IAerdgTK
         KfLyBeibyj1ngXmT3woro44P6MVs1DOSMvAesP+YjWO6jRnIUAydbNEDXmN4Ny8l+fd/
         jGVWA/havb2xXwCI5I4FrDg3UfAHHGB5MINLjdnHJwwCi34ikw573lYZ0L8AHC6mKFKn
         DeZEXJIM/BfEhaG5H5W+hTt17dnH850VRIkvY+Aaf0E6+J5aUFsb6B5SkGEKtudszqQ0
         ZzUfiIgeGVq4ea7RY6LIF3W1FQTFFdhWByLOZyN7SaOiaL3zPWnhubw8hlII7YXR8j2t
         U4cg==
X-Forwarded-Encrypted: i=1; AJvYcCV2fOLWbKVTvmKeV0Q8fOvB3ou0V8q72BvMR1D7bYz3lhkYV7IpaOZfq1bubLKzrTWRSK+nH3kORfo41jlHww==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNqzG8a4RHyfn3LqlYfwLxrc2pjz1RPicg19IwtuRIp1vbSaDm
	3bDsrDSwLfWxiDcAlXBDf2Xkt8oESdBx8Xb05B9g0qdtO7HHPJZffOb8
X-Gm-Gg: AY/fxX5sNrrKOZC/GXdpnjWHuaaMBDd1ZeisA5soicaxEeXTuvFShuqxJyrw7NrM2Qc
	iDzV1Yp6GiiqK2wislL0ERSFG7sWd2nrI7pXOP1OisfHhY3S0l3ktRMt02YHUfxtnYZKQu9QXUk
	WQAqXVtEOYU7tHW26BUY95sNjYnLSJQjG0kjtsXwNpA8JSmBZKNp4xNuP6ciW40Gfel9W3ht16w
	lj3/e+SjK2c+lzkkGLiqT3CgL7jY1mcNilaphFEnfzxiFRNV7e/8gwLLAVxp43vG8rrRgykXApZ
	dNVNb6zHIEQac84Jx2lS1uyde4Y5gNaZGAZ4YHAM4Ia+RVRA2I8A0CqiEb22stYOrR5n++EA2bx
	n4cEb1itY36of4fkVc5EoZT/cOEms0TpnFiIyPxUNLlSC422HDDmVyO8SoWpVq43kIBjH310B4X
	yMg+dVzsz4H6E+TDSKdahsVgufw0/IQiSoy0N42cX39XPQjzhq8j+1Q6MpLV2ht9AF0ANpF5x2c
	b1Y0FcTbq6qukDKLq5Q5HaXcw+lAdlJJiinB+rQzUgnvg==
X-Google-Smtp-Source: AGHT+IHX3y0FmDy1TKEc3tmnS+B1SrOgQ3j6ATmu3whCYNr8VYjGOlmbeI9SRs33adJYXlB3knoEvw==
X-Received: by 2002:a17:907:7638:b0:b80:6ddc:7dcd with SMTP id a640c23a62f3a-b806ddc842amr3076213466b.31.1767454717880;
        Sat, 03 Jan 2026 07:38:37 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:a75f:8613:8605:1c8b? (p200300dfbf2de300a75f861386051c8b.dip0.t-ipconnect.de. [2003:df:bf2d:e300:a75f:8613:8605:1c8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad83dasm5150694466b.25.2026.01.03.07.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 07:38:37 -0800 (PST)
Message-ID: <84cc5699-f9ab-42b3-a1ea-15bf9bd80d19@gmail.com>
Date: Sat, 3 Jan 2026 16:38:36 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] rust: pci: fix typo in Bar struct's comment
To: Danilo Krummrich <dakr@kernel.org>, Marko Turk <mt@markoturk.info>
Cc: dirk.behme@de.bosch.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260103143119.96095-1-mt@markoturk.info>
 <20260103143119.96095-2-mt@markoturk.info>
 <DFF23OTZRIDS.2PZIV7D8AHWFA@kernel.org>
Content-Language: en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <DFF23OTZRIDS.2PZIV7D8AHWFA@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.01.26 16:24, Danilo Krummrich wrote:
> On Sat Jan 3, 2026 at 3:31 PM CET, Marko Turk wrote:
>> inststance -> instance
> 
> It's trivial in this case, but we usually write at least something along the
> lines of "Fix a typo in the doc-comment of the Bar structure: 'inststance ->
> instance'."
> 
> Please also add a corresponding Fixes: tag.

While looking at this some days ago as well I came up with

Fixes: 3c2e31d717ac ("rust: pci: move I/O infrastructure to separate
file")

But that just moves the pre-existing typo from rust/kernel/pci.rs to
rust/kernel/pci/io.rs. So I'm unsure if that move-only commit should
be mentioned in Fixes:? Or if we should go back more to search for the
commit introducing this typo?

Best regards

Dirk

Btw: While we are at this file, do we want to add an 'is' in line 57
as well?

// `pdev` valid by the invariants of `Device`. => ... is valid ...


>> Signed-off-by: Marko Turk <mt@markoturk.info>
>> ---
>>  rust/kernel/pci/io.rs | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/rust/kernel/pci/io.rs b/rust/kernel/pci/io.rs
>> index 0d55c3139b6f..fba746c4dc5d 100644
>> --- a/rust/kernel/pci/io.rs
>> +++ b/rust/kernel/pci/io.rs
>> @@ -20,7 +20,7 @@
>>  ///
>>  /// # Invariants
>>  ///
>> -/// `Bar` always holds an `IoRaw` inststance that holds a valid pointer to the start of the I/O
>> +/// `Bar` always holds an `IoRaw` instance that holds a valid pointer to the start of the I/O
>>  /// memory mapped PCI BAR and its size.
>>  pub struct Bar<const SIZE: usize = 0> {
>>      pdev: ARef<Device>,
>> -- 
>> 2.51.0
> 
> 

