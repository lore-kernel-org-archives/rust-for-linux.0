Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E362FD1C2
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 16:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769186393; cv=none; b=LnFqiX1DOo8YU7lcZ1zCkFiRp98X0kfEb4bS2GjyMc6azWfXCOGCzYu503HWLiXuRa/G0jSqfzfQDy7m7a0SO/E8LRfa4DlmXXJJbO8gTR5clImPejN1BkVmGUhpngSZ99y/R60AxMJ5rZ06GsVqd4H52VzVBQSPe8vtpHcoqlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769186393; c=relaxed/simple;
	bh=If8LXL1LdBcy5i0s9sqgjgdgtM2cOhIFWd164DFMx7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9m7lP1uDAYhLKvcxCVWZcsLJFnR/8aNFjetfU2d7ijXs9/iFOL/g9rJb4LRnAE++wsuBIsmn5bf9A5KvUZmG2z4tqd0ce3rrLM2ba1t51SJVZp/4FXl4mf1QUHaTxz6VBuaER23setKGu0FrKjt6yRqimIuo3DIQXVE0Rlfi8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpJKMPko; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpJKMPko"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so28342345e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 08:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769186391; x=1769791191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TddlEja/Q1w3jg/xQT0V6s7ABeR/HePzj2vekgkVh74=;
        b=WpJKMPkoN2AqPJqBgIHcxmeTX4oL4/Ri4IVvc0ODdPpJGNfFCf1Q2opVceZ80QcUUZ
         RfUqUw8Oq1VY8gcwT1p21J1y7oUcIhHoZrhYRzUl5A6qMJT3j3yQKX+0Q19PwQx/HWtR
         5ZU5NZWBWfQztN25r4E+EGQhFcXRZ3RkFF9tapMryQiCvvNXA4dG6VBE3lkMaPO9Znth
         WUtbWEDXyKeddGwlVVjyZIsGtTskmQcCMo4DfA6Jaj4uSJu5+D0ymTYTKdefb/+uBYrn
         xbsvK/9KzYge/CYTCin1/Fnuzs0WWOe0LGIq7k2H46pom9GywLBy0OhOYMnfBNrXKi3I
         NcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769186391; x=1769791191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TddlEja/Q1w3jg/xQT0V6s7ABeR/HePzj2vekgkVh74=;
        b=lkg7223cRPQ3a84bcXHtpT/MxPk/2Qj15fJ9PGT25vEoXE2hmHqTbMEdDAkwdTBkya
         tfDtFoWhLOfNHE32mgPCUfFDm/et0PHY4KTlQc1aC67QVuqUWmayKyAWLT3ZRZc6bZ81
         j+2t3VmJVhJoqcl4sQIP32N2VJw1+uAx0YFONRsngTn/5ebfuPlq0hvQbN2a7yX7LIvG
         N2bhTJNSnM4FtfdFk1pNlhUWZe90OPra/v5ZyWm1UJU5SR0D10WiLn6KigdNUpEcqiq3
         H77sJQaQfmfyfUp+dc1A/aj6SUyCbQHIqdUqwgzYv2L0v4dNOlDglgAQijAo21NXeMcY
         +2qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnJ8d6Jy2zTCszWcQzDY7gZZSbml98ao1MHSlKDGRfAyLUMffvtSm7rbb/09Wnodt0vRF1PLTq/0+0FzntlA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc+JkQAjq5pIoLq3r4538tje05OCb6sVEwSumrMkvSsv+zLcEc
	dOU2kQwIJaj/uGL4SXGlDW/JGSXTIJIdySOEIRY7fiI5Tzq4Kr26OeqdOovT+g==
X-Gm-Gg: AZuq6aLEF0c1qwIvDq6nd8EYojhAMd3XhRCz8IxRTS3QqYWn0GTXhDClOOM3IKtr/lq
	ByewRcdQTk3zENmxSgzejQJClf/uMBj8cszshjq4Mqq9t4UNtBw2q4/NYp+dDF6TR+azaysw6u0
	vNUg7YDVnyAP/JA8A+OpyFfJ9QWW8dxfYTvHF17A4iC9YdnsQJ5Yo1YCYTUHo09KtisK/UOVCQP
	3OC4I/F6gaod9HCYbLMnALd+lng4BcDG6KqaXdbbT/T5tbFA/ALMO8NjStmSZdNYtmKFi8/zow0
	h9NB7S9Z1ewCl4JDuwu7qQ0l1tPefn5axXKcXi2/G8MhDaAP3Ajaf4nr0DEQWiX9eAN+NbCTK5v
	PIbWRml86ihBXbAcRDa+hOkmxgACS/er9Ld+daaulMWnA1KxfaVBiyaFRebnREjk1UxbGSLavY8
	JFTCnF2NPzLTO2n4c0d7LV51MBbsOrTKuxvnyi94sWcXxWP1NQCoLITskKwOUnc2lkJvk2/BjXW
	XoCcNrl2oU6WL/ChfXQGCpx48FEjyozGpYh8r95LV8=
X-Received: by 2002:a05:600c:5493:b0:47d:6140:3284 with SMTP id 5b1f17b1804b1-4804c9dbc2bmr56178585e9.37.1769186390697;
        Fri, 23 Jan 2026 08:39:50 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:336:adaa:8f43:9ca5? (p200300dfbf2de3000336adaa8f439ca5.dip0.t-ipconnect.de. [2003:df:bf2d:e300:336:adaa:8f43:9ca5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db7b434sm26650055e9.4.2026.01.23.08.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 08:39:50 -0800 (PST)
Message-ID: <70412586-7b40-4230-bc21-504a865e3376@gmail.com>
Date: Fri, 23 Jan 2026 17:39:48 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: dma: allow drivers to tune max segment size
To: Beata Michalska <beata.michalska@arm.com>, dakr@kernel.org,
 ojeda@kernel.org, rust-for-linux@vger.kernel.org
Cc: abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 aliceryhl@google.com, robin.murphy@arm.com, a.hindborg@kernel.org,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, tmgross@umich.edu, linux-kernel@vger.kernel.org
References: <20260123131308.3218421-1-beata.michalska@arm.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20260123131308.3218421-1-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.01.26 14:13, Beata Michalska wrote:
> Make dma_set_max_seg_size() available to Rust so drivers can perform
> standard DMA setup steps.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
> 
> v2:
> - Aligned safety requirements
> 
>  rust/helpers/dma.c |  5 +++++
>  rust/kernel/dma.rs | 17 +++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/rust/helpers/dma.c b/rust/helpers/dma.c
> index 2afa32c21c94..220b9308830f 100644
> --- a/rust/helpers/dma.c
> +++ b/rust/helpers/dma.c
> @@ -40,3 +40,8 @@ size_t rust_helper_dma_max_mapping_size(struct device *dev)
>  {
>  	return dma_max_mapping_size(dev);
>  }
> +
> +void rust_helper_dma_set_max_seg_size(struct device *dev, unsigned int size)
> +{
> +	dma_set_max_seg_size(dev, size);
> +}

I was about to ask "please add __rust_helper" [1]. But looking into
driver-core-next it looks like some of the function in dma.c have
__rust_helper (from [1]) and some don't (from [2]). Is this by
intention or was this an omission in [2]?

Best regards

Dirk

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/commit/rust/helpers/dma.c?h=driver-core-next&id=8a03afe94763108537e33b48378bbc7472b4cc9d

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git/commit/rust/helpers/dma.c?h=driver-core-next&id=d8932355f8c5673106eca49abd142f8fe0c1fe8b


