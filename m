Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B811A840E;
	Fri, 17 Jan 2025 19:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737141010; cv=none; b=uu80Sk5ASxHgCh1pkm4OYiM1yuB/Ej7aGYh1WjFoIng2pa7tQYKJ7p+kAJ0kZu8+2pWPpNe9C/Y0+1LHO4dfSjPOxJhFpeYFZnnT1ChSMNRw4Sb+dsb8FbrDwVdmZmIBjp3oGSMiQOLCDqINhTGS3/BErXa6dQxlvCh0dxfliVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737141010; c=relaxed/simple;
	bh=6bSQJQuDaly4oBY8u5yY44S8OYiNaD29V5U21qbneHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FpqdQkfa7fteuHejslTMCIGAW94MBRlj5JiD7MFnz82ElGGucm9Yp7bpUmpwoTyEaz0ydDd65dsEZFIAKl+lcMxzC6VKWOwPh8exVthx2zyFkLM/6TzmzrHMf4MLkhZNnCAgNSLMsZsBjmEfl+meB3RYonxP4zVIp05Xyn7Dd0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mp0NWRQt; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mp0NWRQt"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df80eeeedso2494635e87.2;
        Fri, 17 Jan 2025 11:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737141007; x=1737745807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KYMjJwjDC5d1EGswtLs/piOvg4B1ntDaj8I7fcHjGDk=;
        b=Mp0NWRQtxCPPkX79MkNELtPSUt4GRv1Y5xFfZdRH0qkdsqYmBUB+uuOkkXR3MdbS2E
         G1uRrtvfWMnHZ9eKp4QJ4zJJvWqK9N5eICXD+J6TWvZXxZGOC73Gxkzmo4L/btFJvGrY
         USnaZjgnPK1QeQVp+Pl0GkpB6vHt0R2DpSd9QWjSK9hdmfsy8vlR1D/JhuLDL31lcaM0
         FC3IoYybLpLAwx9K/LESkhX7xZBhoEm8r/NuU9UEmoIoQO6iz9e3VzWgU+RZRA5Yrj2H
         2l9tvkCAOXSVEZIPHwWH1vXTvPuaQDj06WE+adb8euBrc4/IqwHqNc19pr/Ub05suUy7
         +P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737141007; x=1737745807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYMjJwjDC5d1EGswtLs/piOvg4B1ntDaj8I7fcHjGDk=;
        b=arm0DXopt1p7XErgimxmdXsZHTcUG3REPTMnkQEio0pJtosN5+NMnQpObsJKJ1HTWv
         jMJdeomoqP9878ExyN7VyesoglUGPOVquPYUF8gdlK2OEZ/Ssgj448BmEWrEWzzOYVEM
         lp0X6atgpfXtCJVoGSgv7lTeXGeUFSpLR/2bjiwGjtwKoqm9cm7rm2Z0yShGqdM/bNp8
         4mJUORuz/rqOhyEK0Ehr3Z83RTfOgN7SEPnFtLgTp5RoMbAKgOEhqCsqnXgfWiShM4Vf
         TdmMWh3RhZMwYuu8lVjfFXO5MsU5NATw/OM3OMQS4eAhHlerMz9cccP4g9uquuBHP+4D
         ZQ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgVd7Bv5K87SWmdiwYu8zhuR6rJnI0Y9ZJ6xorbCqQPapi1fbsjtvnLclwekdAtPhsnLXge2rE0df5/iSrbZE=@vger.kernel.org, AJvYcCWVNSjArFLb/PAfYeBTCnA/8Pb7MHk1tEkyjpt/5kRUioJIdETSG8vRLs77HalN3d8TCGa5H+1ryW++vKs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt0JhKEHBhTYRlnaBM1dqnf++xgbAwOrXV9dPkc8K129W7TjaL
	UeSQVdL29lUJunSKy0whTge1YOhlmhk6F4r5o5R3f5xdiQvWGJGV
X-Gm-Gg: ASbGncvwQFaAZjhDuHWMEPxINqCDCE+2YPHOTAlD7F9d7FSRZ5GNr+VYc6L3ggeGxmw
	zytzZEMaZnc5OSUPaw/DcDX/0GS4/EMFshImRSO4B4xl/AuWb+qk7/83Okbxph7z/1qMrq2xQQA
	wAtEHbIkMXkLbchVCVSt8rjR/cxsaw1cM9PKILpz3HD77ws3LQeg4UgRxtcukpv/Jl3MJMta8w3
	Y3FFgIMu632zJJOmfSowp99ksfPfnQZZezSM5SwkCjajrehQ7QWSGI+RxImTZgXxfvV+lvjxcpZ
	+uQRUlL1rJPc5tIx6P8f2Mo8T48=
X-Google-Smtp-Source: AGHT+IErrerCITlsLuY/1AF/BCiS35sCLgXfRsqSr1c33Y5jFVuD1YlYQJnlJ+UFpnw5RSinwwwu9g==
X-Received: by 2002:a05:6512:230f:b0:540:1e65:1d7d with SMTP id 2adb3069b0e04-5439c2481ffmr1481551e87.23.1737141006892;
        Fri, 17 Jan 2025 11:10:06 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af60c4esm466066e87.128.2025.01.17.11.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 11:10:05 -0800 (PST)
Message-ID: <ddd6c0f6-a0da-4bf1-b9fd-9f73651b7cb0@gmail.com>
Date: Fri, 17 Jan 2025 21:10:03 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Danilo Krummrich <dakr@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Greg KH <gregkh@linuxfoundation.org>
References: <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
 <20250108151858.GB24499@lst.de> <Z36X_ZnCmBQBMoZ6@pollux>
 <20250109080812.GA20431@lst.de> <Z3-NqwAG_96yq8VD@pollux>
 <20250110083955.GA5395@lst.de> <Z4D5a5NYrAbNxUL6@pollux>
 <Z4kG5AcVeQKegLnb@pollux> <bbc60912-7ed5-4bb1-b273-8061abe49e10@arm.com>
 <Z4kshDHw8NEjQONR@pollux> <Z4pheSjBMOjgvk8W@phenom.ffwll.local>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <Z4pheSjBMOjgvk8W@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 17/01/2025 15:56, Simona Vetter wrote:
> Plus this patch here is not even close to tackling
> the sg based dma-api parts.

The scatterlist portion of dma-api bindings are in the pipeline. The 
idea was to start upstreaming this basic component of the dma-api first.

Regards,
Abdiel
