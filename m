Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4322E13775E
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 16:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733760770; cv=none; b=g68X2LB3Fn82dtFOiDdYRolUPXpbKESm4YOc6+rngORaO6cvusRbsFEhpaS5vEqH088hBniZiys44l1ZKyUWPcu7oJVUzhsmqGvcUfxSauUhLLlP3V4A7nzG2r4bnrt2M03ivW8+KZWXg7GnsjeorlVA1hXJILhcvDuRTl3bd6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733760770; c=relaxed/simple;
	bh=9ix5CNt4eIacexTKkXwItlI4QcExjjLwAtTLMk29cM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpRZ16pA9VO6UyWdsLkDqpcUPyQjeGou4ENM7wUHbDptn5mpVEDWCyYXzTYMogdKgsljv2RpDNNqX2CZI3mZQ9FvLfXQDr7cyVWDKbCIuNBn1pXfo8YinWTdyYhgTo02UupoZKWoeyVW3y/yLH6VwSvq69/ZovQie3GNqsvQILA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=n68hkbtd; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="n68hkbtd"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa642e45241so604429066b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 08:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733760766; x=1734365566; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+R/N71w0KKNwVT/f+TarFu8rMgMX00BIWZhkzyv+9k=;
        b=n68hkbtdcLt+2mw+hMcYIymEQaSmfn/af5aiHbbE/PzNXBURfrW2TgZ0gcXwhpd9+W
         7cCCtqJAbfPlwJtkENxbwdzX3rrZfKzynfQqsvo3QtAnI9FBPNkn4yf7+u8zh26cBYFL
         IQNKNE+uZr/Uubgj4VZ238kJLJUPJkDU6vEYevaoVRG9fuAonTMIt2gG/qZW4tgfjvNv
         CnKwCYI1VrfomSR5BavoZMSXKMtbaES2pPZ5eypH1Ab3k6+vQxuOWBq3FGeKAlnTxPNk
         Ie0bXcjN26ucPr9DYI4hHAWfrLaaUHV9UNFnM5d9bRWrW6KReIVqARhEJwAAwlY+zBvK
         Zv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733760766; x=1734365566;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9+R/N71w0KKNwVT/f+TarFu8rMgMX00BIWZhkzyv+9k=;
        b=GwvzvXZbcN/Tm/38ZSJE5qimLgd+1rw1jo8CCuFppXsIkRbDkEzkKX1TdPps5vvlDz
         32ALHNLC6PhyiTmL3XOz/7l2Cz+024pL9JqLSrEeIxue9JrCdsq2Un0cSNwptvdTu61T
         8so+nQYXbV3McdYgIThUE9FIONyYdCjNZgCixCFo77sqiEe7rvGuSr1XAPE+xqLpA4y9
         p8ZsGWZ362QvQER05V9LyiGtTyjpRVjz1ezyUEh1wCDUU+yLjGltE/2MhxSTvyYxNv/X
         6PT8drnVCgkaVSG15J54rug/LLzK+pc0Izrh78lXAjjvG2lqEnsDl6plNe1fL3Aymftj
         tDsA==
X-Forwarded-Encrypted: i=1; AJvYcCVhejONUczmQYyaaeSZx8oWrEc/p5Rzw3mJM8LUj1Msv2lSmiJftJdty9vHhI3LJp06kKXgJngbSYLEaNQFhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz12iJUViS0aAoUbQ0zByBXCEBee+SEW+PvFWri8E6OZqxSXBs
	Eb000Bt0QvdDC2Oiv14aDZcjVdJvf/1xneAG3dqygUuEHs8VE29SCrneQdjWiVA=
X-Gm-Gg: ASbGnct/8Gnj7qlnYiaNvnonaAfrE/oTKEjpEzlCjdZ0BXy9CDS/dCIsbQFhWAdd0qL
	AoSCfdEDHlRnxDmotqKrT/IqC/ijQjCXWRsGAndaZxDUMsG9gmNPfg5uAQJObI4TzcjG0CNTecV
	DpjrPUuZkxJow069IR3zzOIlawt93dvTJIxFsYITGSlhnpZLm7ADfynd9ipUy+Bu3O+AHHd05Up
	YyB4fX4qv+c560hZE27/oeUVgu4rf1LzvN/QuEbW0+PSpsNWIDYS+Lcchic
X-Google-Smtp-Source: AGHT+IE4lFs79HCDGFnVN+Y4TEOhJ2vsSpkjg/YZzY1tYY9h6fwgf8E1cNpCxAR9AOP8w4kf8Cn+3w==
X-Received: by 2002:a17:907:7854:b0:aa6:18b6:310e with SMTP id a640c23a62f3a-aa69ce346a9mr110385866b.38.1733760766278;
        Mon, 09 Dec 2024 08:12:46 -0800 (PST)
Received: from [10.0.5.28] (remote.cdn77.com. [95.168.203.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa673e7a132sm290633166b.11.2024.12.09.08.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 08:12:45 -0800 (PST)
Message-ID: <dab64690-ec96-4980-81e7-aae87b53dc02@sedlak.dev>
Date: Mon, 9 Dec 2024 17:12:44 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] rust abstractions for interacting with sysfs
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20241208131545.386897-1-daniel@sedlak.dev>
 <2024120851-drowsily-anymore-52f7@gregkh>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <2024120851-drowsily-anymore-52f7@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/8/24 2:34 PM, Greg KH wrote:

>> I implemented a sample to present the API I have chosen for the Rust part.
>> It is a straightforward example that does not represent all capabilities
>> of the sysfs. The documentation will be potentially improved, but I would
>> like to first settle the abstractions.
> 
> What exactly do you want to represent in sysfs here?  Start with that
> and we can work backwards to say what types of bindings are needed.

Great question, I should have started with that earlier. Lets say I 
wrote a module that attaches some hooks to kernel function calls and the 
module does some accounting on that. What is the correct way to expose 
the statistics from that module? From my point of view this module does 
not fit into any subsystem already defined in `/sys/`, and procfs should 
be abandoned. Should I use debugfs for that?

Thank you for your feedback

Daniel
