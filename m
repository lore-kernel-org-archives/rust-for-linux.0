Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7D42066F7
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767535888; cv=none; b=PNH8Nha1jP3awZnHPb6CcVFdYnFrGlYcZrO+iHmnqSVqJbWTJgbW8tOzADC2cTHS4lVjE7ZXBC6RcaoHVas4pIPlNvjytJR+Z9j4RmAlURZqB5RSOtVZs4lnp/Oh6WMVp73HPr7JBx0MA5+jrYzLPe+lVYKuEIArMKPZZNt45tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767535888; c=relaxed/simple;
	bh=4z7IJ3RmSvfcskfhQP9WT5iJ3OTPq1YGLLMFHPk+nmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3IY+qkGAqL49S/2pNVceHP/2/WISfRoYCm12/P1+DlIC9DYprdxjt1fQL+YjHZvsiAGOGvev6dOusxQigOetDbGe5sP4Gd7PShv3fSiiroGs9Yqf76furfKZO8VXLXsuffTcRTMz96+spknAhZHaPkfyqXj2uBfhVwVHXZFJwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a1388cdac3so121942525ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 06:11:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767535884; x=1768140684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fsjc6eK6Ijw3K+PY/ztBzmlLit7pc4QMYQvrU9hkkSo=;
        b=EnqL77F7O4ofVRHd5wChHjC+8f0YSmvD6vXmtdNrvGUPGO1vh40nd6IbseYTQ7RfKH
         ijUdQVIQZ4GZp8Cfdlq0PBdnV3r+L/sNO2ucryR7TCkfehOJ50X7eTYYu5qy5MpCG2dM
         n/uAHR3KvaysmwnbA+AL0zWaeWgkfFeI/bdCv4Yq/zuyOiHufa9omrJU0vnsRjjHkMjr
         O5gCssfmF71PZT2ezy7ipmJIHc7/nSfKPvVVhnSvHwrixJdSt2KbZQcks1A+xH0pbF5u
         LOXwp361jrnx24J9o6ITNfRv9mCWgyGuGBGbt1K0nP91qq6tdWA5Z+Y4fPf4V68OKKIS
         gNig==
X-Forwarded-Encrypted: i=1; AJvYcCXohZgxRTWNu00bq5DBQ4OLiDb0EiPna90qXkuFiMbTI5SCyBuZnxeyGWA3Jy8fU32L/3U1eJ7eojxZPOPTnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqz+A8nRz1j2mj1KO9OnhFXvze2GZK35M/wUEp+u/yj/gpn8yT
	8B9QZT23SWXNjB2y0oBZl+zhp7ewtmsyhnyYhYFVyHJUFd26ifLUin81
X-Gm-Gg: AY/fxX4rrSCCfbuvx+KwnyXx5TYRSICChyUIW3+/mQPyPQnAv77/9j6oAtf9gwXJaxV
	KzKD3QUC4nHwukKzkv7zX/E1WmFORHuW2ih78QtQCPJQmc66JL4lT9vNwflCZVzjBl/rKNag7TT
	TspYxydNVzykGO9Mr84lI3gsS/l9zaZv4QxWDJDy6S35JpW140yuhCNYssw96XN3+MhhmrDYK6p
	N1QjvqS5Ow1iNPO9K89YgApVIJavFWdA9QZEpuTjm3ARSYRZClkPPRO99cp+oQdn12i174SQvL2
	VXNs5gPb2YRdgXLdsLbxhN/jgdb7Kd8hg2p41E7UJ0PJcSj2wxUoODaQCr52TkZHPQVFTiOSjFz
	i1bCm7HkAdy+ZErMIy/WaCDAOVQZ2mqYFB+MLpBb1dSn/jp7KJVMAGo+2jk/cEdgBrVmz7yK0ld
	/VHOwMdCTDz6+xkb+PB+tftXhtdLzvXL3neV7eYFBdrJDFBF8=
X-Google-Smtp-Source: AGHT+IFGroKOmEDYNEfnLyvkzjfTn9DXqKx3c2454IZvQ/Ory7G0MmSBQDeDAQKx7j17tBFCUsxJWQ==
X-Received: by 2002:a17:903:228f:b0:295:6122:5c42 with SMTP id d9443c01a7336-2a2f2717b3cmr421307585ad.24.1767535883663;
        Sun, 04 Jan 2026 06:11:23 -0800 (PST)
Received: from [192.168.200.2] (210-61-187-174.hinet-ip.hinet.net. [210.61.187.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d7111fsm418791415ad.85.2026.01.04.06.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jan 2026 06:11:22 -0800 (PST)
Message-ID: <746289fd-a222-4f31-b9a1-a3afd4ea6b7d@kylinos.cn>
Date: Sun, 4 Jan 2026 22:11:12 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/4] rust: Add RTC driver support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
References: <20260104060621.3757812-1-sunke@kylinos.cn>
 <DFFUFRMWKRMO.INAMUGECPSQU@kernel.org>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <DFFUFRMWKRMO.INAMUGECPSQU@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/4/26 21:36, Danilo Krummrich wrote:
> On Sun Jan 4, 2026 at 7:06 AM CET, Ke Sun wrote:
>> Ke Sun (4):
>>    rust: add AMBA bus abstractions
>>    rust: add device wakeup support
>>    rust: add RTC core abstractions and data structures
>>    rust: add PL031 RTC driver
> May I ask how much of this (if any) has been generated with an LLM? Going
> through the code I saw quite some patterns that made me curious.

Yes, I used LLM assistance during development—mainly to help understand 
certain R4L mechanisms. Code comments and some boilerplate were 
generated with the help of LLM.


All code has been reviewed, tested, and verified by me to be correct and 
compliant with kernel coding standards, under the assumption that my 
understanding of the mechanisms is accurate.


Thanks for those. I'll look through your comments on the patch set and 
address them.


