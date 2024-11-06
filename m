Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239EC1D5AC6
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Nov 2024 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730882832; cv=none; b=BrfM4bsYUjCyPTNCc9P+B9BBKg85h1qJeuhC2L6mQOqOv+FMZUZDryYpfny0WeLeOiEOZMT0Zk2rag6sBJeDE/Fg2damWIrqP1P1cG1kHFfWkMvvq0E5YXWDy2A1VDIbmmUun0ujBnKmjqy4996NTKBb40s8wRCIPLmDPTlL2vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730882832; c=relaxed/simple;
	bh=hO/r4VGYGOtHPrlaSJYQrv4NcFnwHHgPRRwPNzdRpD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tl6w+3tZpjsuLPxz0hVNYwbksQ1OTiwPpZwXfxc07MNzsB5KPGEFAyxvrUAQT/FBKxbZ8j6yOS2XanqreaLUqCcQqz6JGqdydBtIoSM8MlLtEUMknHZfnSRZ6FXi3lbfXtvdRon+X8VLH/iuq/6henRp4ecsksHwIgZuU/1SCUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YI/QYTUB; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YI/QYTUB"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539e63c8678so7139630e87.0
        for <rust-for-linux@vger.kernel.org>; Wed, 06 Nov 2024 00:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730882829; x=1731487629; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aFXlIHSxfdDcobvUiRDb+mQpZMUb2QsQMzBcu03DS4o=;
        b=YI/QYTUBG9Q8lU52GNPkLy9q1JGwCcoFN1I6rB6RH3AH4fps0J+x4FD214Pw3U9VRj
         K8hFKD177BQc61W1dhNvmjyM1uXBAojvi9yeUV2THZSpYtAYdocSuO2BG7G4B8ss+LU1
         VD1UpwIdbsWPfmvxsEGJgEut0TZuVsdkDLHog/G16MPReLflIeUJHCfTmFAOtA+IKWUU
         XQtqNOEgbe/sCWn/G+O4EGwmhdVEQC2DnbgLG/qLPppESOhSH4dls8aDCEu3x8Z1nR9+
         BnT54Z1bIcO+Z9evaULo3IDY7uyPE9/vDSEwXC7o7jI5sa/2NFU+uP2O/xqJGKbP9gwm
         NBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730882829; x=1731487629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFXlIHSxfdDcobvUiRDb+mQpZMUb2QsQMzBcu03DS4o=;
        b=r7KNGXF7H4T6IXnmp0TZdfQbPEKfdRcbPUlhqy5pAiUgrSAZJdRExG19HcKtpK/YH0
         HdwbZI/Ylsku7CZGsPcdSjjK71w2bGaDjZax9FQN23Tkw8ZpfObC39+b8d2mfrpHU1a6
         7UFzotVHjyqcFEQIwMBHPmc4MXNqOLd+diwCvwj4Uo6QUEAHCPQiY45LtII4v8rulY3B
         4B1mXJMGBSSpMBTrhaehlaHZiK9fcCWIINuqF9m3UtsXkpGF4Gm8aQGL6JCY0rzH+cEV
         v/vE7TaFi6g51HSB0J5RTqYmEB6qA0CLks6IJtYOhu0IvJn0Kchuhdfuco0G6Eu+Yibf
         Q+AQ==
X-Gm-Message-State: AOJu0Yy0ip1UqdpAlN0qUHNWZNMmqfV9HWrovkyETmDNsTtcx8ALQQNV
	MyuhB91huQEJyGnfHMA56QaL/59ENF9aTII6qFb5VdEvLDsUlUjc
X-Google-Smtp-Source: AGHT+IGFCZBcEZN+9oXVZ5tJNmUopDraSZ+iZ9iviWsjK5V7KGA3rheEBm4UFClHtTLpsJ3T+cg5OQ==
X-Received: by 2002:a05:6512:4015:b0:536:a564:fd48 with SMTP id 2adb3069b0e04-53d65dca86amr9118178e87.3.1730882828934;
        Wed, 06 Nov 2024 00:47:08 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9c133sm2442885e87.100.2024.11.06.00.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 00:47:07 -0800 (PST)
Message-ID: <af6aa7ed-0eaf-4ce1-82d8-c3915f2c8e49@gmail.com>
Date: Wed, 6 Nov 2024 10:47:06 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] rust: add dma coherent allocator abstraction.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, aliceryhl@google.com,
 daniel.almeida@collabora.com, a.hindborg@kernel.org, dakr@redhat.com,
 airlied@redhat.com, wedsonaf@gmail.com, a.hindborg@samsung.com
References: <20241105104726.3111058-1-abdiel.janulgue@gmail.com>
 <20241105104726.3111058-3-abdiel.janulgue@gmail.com>
 <CANiq72nLNQD6f_Y2+jdcn3w_K0oXaEX-Y+mUE6Nco565m8Jzgw@mail.gmail.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <CANiq72nLNQD6f_Y2+jdcn3w_K0oXaEX-Y+mUE6Nco565m8Jzgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/11/2024 13:23, Miguel Ojeda wrote:
> Hi Abdiel,
> 
> Some quick comments on the docs I noticed.
> 
> On Tue, Nov 5, 2024 at 11:47 AM Abdiel Janulgue
> <abdiel.janulgue@gmail.com> wrote:
>>
>> +/// Abstraction of dma_alloc_coherent
>> +///
>> +/// # Invariants
>> +///
>> +/// For the lifetime of an instance of CoherentAllocation, the cpu address is a valid pointer
>> +/// to an allocated region of consistent memory and we hold a reference to the device.
> 
> Please use Markdown formatting everywhere (including documentation
> like here, as well as comments). For documentation, also please use
> intra-doc links where applicable (i.e. the square brackets, e.g.
> [`Foo`]).
> 
> Also, ideally, please define/explain the abstraction, rather than just
> saying it is an abstraction of something else.
> 
> Finally, if you want to have a link to a C header to refer to it, you
> can use a `srctree/...` link (please refer to others to see how it is
> usually done).
> 
>> +    /// # fn dox(dev: &Device) -> Result<()> {
> 
> Can we avoid this, i.e. use the `# Ok::<(), ...>(())` approach instead?
> 
> I see we got another `dox()` function in `page.rs`, which I guess is
> where you got it from, 

Yep, just learning it from existing code. But will update it.

Regards,
Abdiel
