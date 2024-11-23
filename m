Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C2A182C5
	for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732388897; cv=none; b=DYy6DfnGTf9BREKZW2P5ovzFGsoLISpDyeNBFbeQ/Q0G+x3xzYthxLfZ26hDdQ3iU6rL+qMymcN+zW8rr585ELVSFUcdPilWIYz3ecZE4BjtZlL5rtUMEtLdrTMvKS9UftE6oItu7MpGajaze/kfgZTofv1GbEBRq0ikOXHC6Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732388897; c=relaxed/simple;
	bh=QBf9yGIkieE/StDvtx4Ng5HNTR3aocDNvTTv9B6NOHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqy1VUx0jqWbj6SyxSK9DCNR9AQ+b8ZsLlWX+L032sD2Rcqup8HOxSTLvBuw+Hj2j/CKVf1OmOvmIIEqPEWQyEWX0AIycnLKB3wc54fXWYRw++gINRuHw27BIxdQu28qD3qSTmXcTwKwnxg5gCy1Aif+Y6JXOttA/TRjtkcsO1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=eyhtTvBb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="eyhtTvBb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-432d9b8558aso24075855e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 23 Nov 2024 11:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732388893; x=1732993693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gUvqtFGBRP2pIhVy87nMkD2d3EWztZDoBOAVH3AaoAk=;
        b=eyhtTvBbcZBwI2wlIqXy4P+Q3NBupRQZdxQsCRFLHsQWvLT9WhMTAC9XP3oqmElZEW
         L5tF4Gw2ip5Cgwv9qMRyii0f/rsZTub5Bu7GtOE5IWqHHO1PrQE2rIRcXVVGIvdkcENE
         g7H11TlqPQ/4mMvq/1BkiRmW2D35jD19ZpuK7Y4cnt+p5snY6gzzElvOD7sDbm8FbySB
         YvI6kRXjtsBT9keLjqCnyG3eC8qPrrGTOsmIsUVwT15YbHvgOvNbtpQSUBV1QYO6A+vq
         DLWZ3IE/SrY2HudfpmwHwVFv6Pw6Yj2fLWPXtoSfQztp/1XOh85xy7mNo7EwFoqq6m1Z
         LarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732388893; x=1732993693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gUvqtFGBRP2pIhVy87nMkD2d3EWztZDoBOAVH3AaoAk=;
        b=g5POQjzekriOLL5OpaXnvmHYUkFhb/z5k6QHNLUy6H9nnHUrHH5KL6/7482fpD5P46
         kD3fhLc9bZjxezPpiO/3nlzZtlVewTBOgydqK7cWE/sP/XB2AQ2+xBpIOa8A1Qa0zuYi
         mIWReewhHlB52tfrJCSmL1WipQliuAioBgY8PYLU2c++WTgdiy0nyJEW/HiC3o33r8ni
         m34XkhEp+Ql7UnZUnN1Dye5Fz49RA4acMmgDvLuEanYMVlkdOyQIBlpD7a827WHSkHZX
         a0LWxO4EXNkCC1HdeB2bgqxiuFFokJ9FikKKvH5/nShLsyxPAvGcON8fkB6oyh+djvQv
         SCcA==
X-Forwarded-Encrypted: i=1; AJvYcCVIEYpgb+16WYDJKZ4yZzIAgynqhKQcQ7GGNYEsAYPpWQy6zCrMnOWcJLejZWGCT1XrCggn/kRiIzxu/aZN/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx003Bw5aHhX4x4PzAiZTUv9izTb/c8Yor2b9KshUyglxkUT0X
	mIHMWbr5atflLhYjFt8SqWaaa9tx5KnNrQcNjFTd0wIVPQxzTE5bjCKhZHxC/wE=
X-Gm-Gg: ASbGnctYtlzexFS6Dtf5qMJtsf4y9+Zr6lEBeiOT+eG94NrniKJ9Hu6pI6+/wmAVzCf
	aaZ+m6i7jlmvzexaoR0bu/mYGr1Heqd+r5Itp9N2bYJ9CNUYmL6d2SeuZ1aEa/3Kpasl5m1JvBY
	jwCr8cdMo6/f5aAszSAjvikws5gtQHOXAIi5PNKd4ynz3ca2MTddr49Eicf0S/Kb3sUD7KgoiJ/
	Sv1xkLpqiUXOypp2mq/2o0GI+4T3vMk34Hq0A4ZA5GNZqLPInY=
X-Google-Smtp-Source: AGHT+IHJJYLXW4nBiLPkdrm6sa5rqKAmcHuP/MJjOIreyXNhCEavC8kAL/W1oEPpcrJ9CYKq20176A==
X-Received: by 2002:a05:600c:3b27:b0:431:9340:77e0 with SMTP id 5b1f17b1804b1-433cdb0b3b6mr60349465e9.9.1732388892114;
        Sat, 23 Nov 2024 11:08:12 -0800 (PST)
Received: from [192.168.88.249] ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b01e1170sm136486135e9.3.2024.11.23.11.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Nov 2024 11:08:11 -0800 (PST)
Message-ID: <9d29f9f8-f1b7-4c8a-b43b-9f98bceeada1@sedlak.dev>
Date: Sat, 23 Nov 2024 20:08:09 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: error: modify `from_errno` to use
 `try_from_errno`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
References: <20241123104857.49385-1-daniel@sedlak.dev>
 <20241123104857.49385-2-daniel@sedlak.dev>
 <CANiq72=YeDPnj==btj+4ZxrUub1kLB_vgHVVQ5RygivSP_m=uw@mail.gmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <CANiq72=YeDPnj==btj+4ZxrUub1kLB_vgHVVQ5RygivSP_m=uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/23/24 2:45 PM, Miguel Ojeda wrote:
> On Sat, Nov 23, 2024 at 11:49 AM Daniel Sedlak <daniel@sedlak.dev> wrote:
>>
>> Modify the from_errno function to use try_from_errno to
>> reduce code duplication while still maintaining all existing
>> behavior and error handling and also reduces unsafe code.
>>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1125
>> Suggested-by:  Miguel Ojeda <ojeda@kernel.org>
>> Co-developed-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
>> Signed-off-by: Guilherme Augusto Martins da Silva <guilhermev2huehue@gmail.com>
>> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
> 
> Usually, when you have a cover letter, the title of the patch would
> have been "[PATCH v3 1/1]", to indicate there was a cover letter. Did
> `git format-patch` not generate it?

Ops, I may used wrong series of commands, and this slipped away. Should 
I resend the patch with correct numbering?
> 
> It is not important, of course, but I thought I would mention it in
> case it helps.
> 
>> +    pub fn from_errno(errno: core::ffi::c_int) -> Error {
>> +        if let Some(error) = Self::try_from_errno(errno) {
>> +            error
>> +        } else {
> 
> `let ... else` would work here, but given we just return the `error`
> rather than having a long function afterwards, it is true it does not
> really help.

Thank you for the feedback and tip. Should I dig more into this and try 
to improve it more?
> 
> Thanks for the patch to both Guilherme and you, and for navigating the
> race condition on submitting it!
> 
> Cheers,
> Miguel

