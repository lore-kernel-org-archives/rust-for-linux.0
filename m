Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26272163AA;
	Thu,  9 Jan 2025 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736421272; cv=none; b=dN+KvBhmJMqBOOIucBQchuPQdiZN9+B6fsSopHZInaONfmlBeST7jTJDXcSN3Ugj8JSNzZkAr87UIUT514PaugmBr+F0sMIbe+/Rzod7o/hM3ODkSvae5V33oxcUhSKqLdPfbyRFbaNVAITD/FLmOeYLpd8F7iGck12Vz5FqfAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736421272; c=relaxed/simple;
	bh=OWWcFlbpG+OMXb7VXzYJPRO+OVmfyWw2GlvoPFeUbws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5X68BhyYpgA3BWvzBwxf72rAZvPR1ovHovjWyXrgxoHUmhJZukboYU0fx5V+Vm2Nz70AwesJesWTwhxn6D92T3kTtqab5OrafjLm7uRktpcHB+TLPTnlqjiDwRi/F/udlbTchg7Enx1CdymOTQxF4e6NIQXPVOrXbY2U20p0PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuyxjdUR; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuyxjdUR"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-300392cc4caso6316611fa.3;
        Thu, 09 Jan 2025 03:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736421269; x=1737026069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDSrvt1tvrLZL3pv39ao1tOanTPvH3WNKnuKQXw/zNM=;
        b=TuyxjdURjOqfcCLZQfKhZ1XNom5WzCTqp0IucA5s8Sp1a2B4I/LC873kiHyU+wmiWK
         iEP/nkRWDDAU+QmTf+20z5tPA/3RYz48tqCHlW91TQlEnvvD4HU79er/AAoSWLDvXD0N
         2aOtGBPkhh0ll/9BsmgqRdCFEOqHSs8ZY0n+coafhkQChK4CBSz7wwOUyIEsm3MkC8T+
         +Z7RzXz3ykE73JILFjDkVRiwjOm5O/dXHArum9y7HFA7yJX57GqVYXs03/TP2EGlf8Uo
         qln29kHZg0R9eLvt36Y+75X2imAMPXsQN5b9Jki93/yPcZ/y97wHTfrE3Y0FAuKhZVdE
         QT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736421269; x=1737026069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDSrvt1tvrLZL3pv39ao1tOanTPvH3WNKnuKQXw/zNM=;
        b=NREWiyAhXqjUe2Bvvin59xvSLCTovht9cIKpsIN4alMds+IW3D3ZTWDzsvII2eNyut
         vDkj24vL+3wZC2sqcv286zNizWsSyDgi2hMePJFSPN2jTMFnGfQLkVPQ88DE16HvsLWV
         NBA9OUa+dwbqiGUFHgcKEuw1g6wh9tqUW4fHqyLL9UzkpSCL0Vahh49VueBBvjK7PRLQ
         nYhrha3A7HgSvTSRsPosyTeo3cNFt44hTDMFwoCQ/iU5jwVCEWDTWZNr9X7diO++pu60
         xrH+ypehzl239J7Lbxv5Fvg+z07WbWfPPWNDnOclp6oGhwL9tBYATGxJ+o22IULgCW14
         C87g==
X-Forwarded-Encrypted: i=1; AJvYcCX2/X/2H3U29QRDCxmjag33HcSKwakO1qklBQwGF2bLOGWWGJpOruGXUkY1pAPGG63fUr3VzpgF6PsVgFH8QWw=@vger.kernel.org, AJvYcCX2KMp+YN+/TfzoXzwz/8M8FybVl/41AUdO9xyJ0M1gAnwhC5P+CGPAC6JUfQXA/58ZRZ86+m14xr6ujr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxmch7Td4ZsVERknz89k5ckxkGGbQypHWmbRDbWMRJVOuzDzAW
	EWAjLqRhWVoMXTq3x1NlcxyCfiwbRnwkcogx/d8DFxgYFyqHWbMi
X-Gm-Gg: ASbGncuz8ENddKC4bMmtijG07XYIMHgHwNUzW7x5ZgmEv8V8kZyZ+gTAmbajYgLR5YM
	tBjMIWNA7M66RpiZPiQzqhkZwAjKPeNjQilcV465/JUJ3bAUBEMrH20tSw/uxhX/zVmEUuh0t9X
	lkt9UZsCt2EQelrU07c1oM2zDCO7zZNBQAmODxPlDNh/ID+RPFpRHySGDEFUvJ9yfgEsOv1QBk8
	D6X3vDD2PnHPY+jLenirbRFZEVLOzzdOGn3/WO3SMw04l1qy/z8hIt94lhJbDDJbALJYnFxFGdM
	bEmD4+C4Si8Dbea4HSYvdbeXfPE=
X-Google-Smtp-Source: AGHT+IGOTFBWUf0qMr+9PwwTq2Kyqqb8CpMObKdP6HCrxE2MChgbnsJPBPgxn4nmfxGO5Li8ZWHrqQ==
X-Received: by 2002:a05:6512:2399:b0:542:19ef:9877 with SMTP id 2adb3069b0e04-542845232d2mr1720792e87.17.1736421268391;
        Thu, 09 Jan 2025 03:14:28 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49e2esm165503e87.29.2025.01.09.03.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 03:14:26 -0800 (PST)
Message-ID: <ba95a574-2dba-4299-9ec4-bb776a228d98@gmail.com>
Date: Thu, 9 Jan 2025 13:14:25 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Daniel Sedlak <daniel@sedlak.dev>
Cc: aliceryhl@google.com, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com>
 <588af6c5-02cf-437a-a909-c22744a6df1c@sedlak.dev>
 <EFC67281-5CE1-44BC-92A5-7B0E4A7FB6AD@collabora.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <EFC67281-5CE1-44BC-92A5-7B0E4A7FB6AD@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/01/2025 21:09, Daniel Almeida wrote:
> I was trying to test this again, but it apparently doesn’t compile for the reasons
> Daniel Sedlak pointed out above.
> 

Okay, now I noticed the problem.

bindgen generates this rust signature for dma_alloc_attrs():

extern "C" {
     pub fn dma_alloc_attrs(
         dev: *mut device,
         size: usize,
         dma_handle: *mut dma_addr_t,
         flag: gfp_t,
         attrs: ffi::c_ulong,
     ) -> *mut ffi::c_void;
}

We are interested in the last argument 'attrs'. For some reason it seems 
ffi::c_ulong is defined as usize at least on top of `rust-next` commit 
0c5928deada15a8d075516e6e0d9ee19011bb000.

In previous versions ffi::c_ulong used to be u64. I also noticed that 
core::ffi::c_ulong is u64 while crate::ffi::c_ulong is usize. In the 
previous versions they're both u64.

So my mistake here as is I tried to match the signature manually by 
using usize as suggested by the compiler. Maybe we should stick to 
ffi::c_ulong return type for Attrs::as_raw() to be in sync the 
bindgen-generated interface?

Regards,
Abdiel

