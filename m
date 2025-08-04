Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337D61E5B9A
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322014; cv=none; b=mArqQeIRHnz0rgvOpHYanyqmNxQPOqPWTT9vdLvmYsJ4ioR9L5YpHDoF6sZ19b6zxszpiLWXAI+tQjBSPW337EgqXYf7efCEkHZjdx1PtrurcmODBhCldAo0tR+StfSRFJGzgdZD16//+CTv5QWH8EBiESljpdrRY2CAdjp9FF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322014; c=relaxed/simple;
	bh=n3BBsAFN9PqbcAqBdHC7oi3j3PNdVVro0/Bw6si36wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJbgzjwFGpcTuRDyX5yIls4w8c4ir9P7aJ4ZtNSQpV7ZlxT2yw6YDGcYaslMTVze2Y8ATrCaS7QkkRhLs+vw0QnR7R/icLK2NzXWm+485O+579bOOI6zXakFGZdsblnzy3oHHN41zOn+uEhA05cGVW+7RQHUSTVfXoe48JXjndU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEun+Ebm; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEun+Ebm"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b8db5e9b35so1596945f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Aug 2025 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322011; x=1754926811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+HJ67G/SqqE7+RcRdM3hLELI7sjEU6T7W9lOiGHNXNI=;
        b=SEun+EbmR+U3RCYV6XrmWc50l1W4jAr+1vxIudWi90GkxIw3p1Rwts2ox3sKldoq5e
         ZiHynBfRupV2hv+I6as8Ji61ZApmiQB1oj4J5U1BlOoqEipztncwwqVnBLmaAPk3+yt9
         oGpQsEmE856gFJp2oFMdVFeH+2Ouw9wdfixDjJbh5pwIl7/NBlKFNpBOlyxKMfM17Cyw
         d/gb1OHp4F8sGDSjeohQ4IpEBD9n7u8BAIAXSPuDXLSONOfUUScIBMfO3TVuYJLQ3v9e
         4x1jKXRP78xOhKTJjCnn1k97imA8184CF4pHEkyRS7uUfAhYkEEYSTQbsNVSNxjTvlfZ
         9y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322011; x=1754926811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HJ67G/SqqE7+RcRdM3hLELI7sjEU6T7W9lOiGHNXNI=;
        b=kNmQEJvbw8E63oz0dwlfKU6lGH9cLUD++ZPs4EQEELO4D7KR0i/OUFv/hkvyn8vCUz
         XLmTHMxGLLiiyzQQNsEz2x7q7A2IYAK3q1J1sJUY4FQ4U2YZVF5IUX08oBZ+VEd4fma0
         XpejhA1eL/n5V6lXZI3u02OzGYp8T6hdnDDtJ3yMotgCsaVZbG6b/oW9MVcKXdyUqEZ3
         +UHh85j68UJganpWBy9CUYuNYQltcKtjqdJ7rgKM/mfT5KdR6ZIKWmEIWsxfe5IgEtp2
         9O5X0XuSR5+u7SkEPgNLwwP8IBG2f6ZhxM9wbRWjXUSUGTPQ+PGImyPCWioErhTdkW9T
         3cFw==
X-Forwarded-Encrypted: i=1; AJvYcCWF79o6r/bDhAh2EoU4MQMEZNZbFLv5FRJdMzeh7JutsTsgdJ0x9eW6p60JSM54G2w3Ex+CzBoidvClKt/9bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyVIH7pxx/+YJhSxgfNn0ID6Y4GsdytBLdA22qgnhG9tFkI4IH
	87M+Q+t8V4ZVIOwuroaC6qm8LNRULA0RIR2A3omIsRKR0S0dJk4R2pqF
X-Gm-Gg: ASbGncvEj25tZ1mdB9ofdlAggw2i+xmWYT4g4l3OuazCBbhPywjJGHR0e66PNF7fJbk
	b69TgMtml1eaqW89QGyAtv5ZrqusJzLkHVNgWxrvl9WZk++Fstjs59Bv8mIL1Yo9m+kkyZK7SmE
	AL4uQaeVbPn9ThMhhzpKsXVW+Vq3Zvd7N+qbFlmS2y6ogNj8PMCMX4L7uMPdwN4TzDUbVSICSlC
	QNk6Hml6YtH7bqiVge/W27GeCQqjXTeVtlwtDTgxUIbWKPEs6t9R5DISURH3VtZQxJB3ZpsWCBS
	j87R9o+zuIG10ZWJTUZDkQZcxxl8cT6kCwr4G6djoBjsLdc17OAXoBEnB3zcLhzc9Ryxw3VI31h
	M4U4eNDmqoKoeP8RAQcBwerZ6i0D/
X-Google-Smtp-Source: AGHT+IHYnOY3QpCRr0/jXbQNH/A+L8JBP3jKaerE1mbfoQ+zJAqCNtXPqoWFHDOv+lMkK8OiRFs25w==
X-Received: by 2002:a5d:5d0e:0:b0:3b7:8525:e9cc with SMTP id ffacd0b85a97d-3b8d9474b30mr6825906f8f.18.1754322011196;
        Mon, 04 Aug 2025 08:40:11 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459de0d4cf1sm25570675e9.13.2025.08.04.08.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 08:40:10 -0700 (PDT)
Message-ID: <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com>
Date: Mon, 4 Aug 2025 16:40:10 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
 <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Danilo

On 8/4/25 16:17, Danilo Krummrich wrote:
> On Mon Aug 4, 2025 at 4:58 PM CEST, Igor Korotin wrote:
>> On 8/2/25 01:00, Danilo Krummrich wrote:
>>> On Fri Aug 1, 2025 at 5:40 PM CEST, Igor Korotin wrote:
>>>> +M:	Igor Korotin <igor.korotin.linux@gmail.com>
>>>> +R:	Danilo Krummrich <dakr@kernel.org>
>>>
>>> If you'd like me to keep an eye on this as well, this is fine with me.
>>>
>>
>> Yeah. I really need your help if you don't mind. Thanks.
>>
>> Could you also briefly tell me finally which tree for patches should I
>> use, how do I do it and if I need to represent it in the MAINTAINERS
>> file somehow?
> 
> Given that Wolfram said that he prefers you to maintain the code under a
> separate entry and send him PRs, you would need your own git tree where you
> pick up patches, which you then send as a PR to Wolfram.
> 
> The link to the tree should go under "T:" in the MAINTAINERS file in the entry
> your patch already contains.
> 
> I understand you haven't been a maintainer so far and haven't picked up patches
> and send pull requests, so it can be a bit much in the beginning.
> 
> A good place to start is the "Kernel Maintainer Handbook" [1].
> 
> Additionally, if you're willing to pick up this responsibility, I'd happy to
> offer you a call where we could go through the details of applying patches and
> send PRs and clarify questions to ensure it's going to be a smooth experience
> for everyone involved.
> 
> Once things are in place, you should clarify with Wolfram when in the release
> cycle he expects you to send PRs, i.e. until which -rc before the merge window
> for new patches, and if he has any additional expectations.
> 
> I know it may look a bit complicated at a first glance, but it's not as
> complicated as it may appear either. :)
> 
> [1] https://docs.kernel.org/maintainer/index.html

Wow, that’s a lot to take in — but thanks a lot for the detailed
explanation.

I’m a bit worried about it, to be honest, but I’ll give it a try at least.

I’ll start by going through [1] in the next few days to get the basics.

Thanks again for the info and for offering help.

Best regards,
Igor
