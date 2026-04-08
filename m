Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D2B3DB625
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 20:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775680281; cv=none; b=bMFBrWbpsydVm88P4geLSrR1CxztzkWevvpW9Pa+ndxtigv3/CoZK4Sni25Stt8ArTn+EEjaKvMAs5eQTBfzwY7YqG9M5aqDa0mY2vnCjR3FhCE2powflvpmVsykX45PFeSfhGgOD+F9bFInMn+E4zXZWC4RAhUtXit0NnFGdf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775680281; c=relaxed/simple;
	bh=6tZmwdYcc3wViypyLiPFnF/1JGDJg1j1xhQaD+sHhTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoyqu5Tve6U5cSlGjxvoCvak9B5osefwV7Lly8wDKnTth9tJPGV7kiJaeDUaSRS+W4uZaS3BHyBcW6HPPJO4CGgcL5Lhv46vuBZ3mFwt3ybkXX+AyuJwPuF4ZiYQWv/KFSrWVBQX98ZkHO6n90lBmprw7QXgw1eMdgCkGFk6HNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx1BaiFh; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx1BaiFh"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfb723793so81992f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Apr 2026 13:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775680278; x=1776285078; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N8JNHNus4Dn4fr5KYBH1+ONPQKFNyrvIKVVmnCA9yg4=;
        b=Fx1BaiFhoL/tVDm4aYibab3oz3Lki2X+cnKuag6gjlClDR+FsECwWBKac8hLXCN9PE
         qoR9b1Zce3P+nZfpIsH9ms48OfT4rd6UavM0mhUU6IB/1JwtHU6Nb0Tz20uhC2odF2cF
         jkxkgsvJrDQU9ZWjvsANyPoX/B0ideAGoBaoPmAiax0YY1ffXRadW4Fu7ZPApGjczmKA
         8tbk/uc32XFZ5DVY7Pz15BDruDZTcEzJBQNNt1Ywvr2I61Bh8x9gqASLENmOa7WlwP+i
         a27KNaJ3MG/DQU1vaCkN3LlipXcMKoC5OIJW6ELvgpZDVYVMzRIx+rxQUcgeF1AZFYpk
         +e3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775680278; x=1776285078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8JNHNus4Dn4fr5KYBH1+ONPQKFNyrvIKVVmnCA9yg4=;
        b=FrzCsU6CACB0IVA7IvAEl3zTWdjkSuS2qSio4sJqxNZepZrdUO8w1wLHGJFpdKfjQN
         nPo68LpbS8dRXoAoP59N5TzKThmF5U9rJogzF+XTOsRiiMeTgS5Xexy+0ytxx+ziuB61
         +3Nt0PoJtgrHwfI7TGP0qZXwn/D+GZLys8qyQ7kEWY2WiB3DiCGMh/WqRncLOEdLM5cN
         hNOslcwfsIoaXBMsNJbKA7FLnvpsLHZ/AfZxhlNyW0txcwcgId7mU0/Mpe7ktJGIiQHe
         E1s+wvxKavuctgj7ABOMBcUSXtzwykuPf8Y6gltmOqOdarySpeIzbfIA5/de3TO7Lu+t
         bqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpXWuQY8GnGNqVPVBVGdD9Bliu5a3Wpryjsbnk8m0LI9jXZtXTNluoyonB6/HoVvLYtAKJOniy2WyivtLPIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHSmd4oElbDpTkF+QdxaGP2cMMxEpWmWaP4HXB+p3PUTGZJn3f
	1ENJuev/OExLWBKj4mbdyjropf4/YKEQdKtX0x8PA63PcLT0PsmyxlJC
X-Gm-Gg: AeBDiesU36ndiwE1eLP0r2OH4rkCYAdXnRikgx7mWrRVcVY2JQgtuNzX3ChFLLuKVCo
	xAW2SfudUPmy6GFebN8t5T/ttVuD+/MUbD+r+/cZDz5PTX1Xc47yPxdoCcqv3xG8HUWsIRyJwTJ
	dgZ4CRnquuWtjVaHrxF9l5Yc4YHdwwurawdd+sAiVfCX1mbhjLAui1cbex+uyq5mgFwwyVurDnR
	rHTq/i0/oSLUt+4yh+wNTQ+V4PdsMNuIWnpoCtvu/gCjKZrWPkTFfbQub8YaLzt2vp19t/z2I8H
	1r/I6zoEHrJ4bnnp6G1UGqbPt2+I07T2Xs+ceVBecFrvZxGiRX11cPu79iD2Boac6ZyqRQL4ziy
	KhrlURFSh977xYfzwK9CDnCL8F367TyN+PGN6AxGDH5ccPQW6spJp0PqVh3M+CQzuCKQ7o+EyL5
	Tjt6g1uppVWJrlBDXJwuNKCzVoEP212xX5lYQmds2LdQKGUgp+hFbnNVknyLzn5fOfzWzmmhmI2
	UxkjXW9b1t9fY0Eew==
X-Received: by 2002:a05:6000:250f:b0:43d:1e97:d6c0 with SMTP id ffacd0b85a97d-43d5a18e958mr883682f8f.28.1775680278060;
        Wed, 08 Apr 2026 13:31:18 -0700 (PDT)
Received: from ?IPV6:2a06:5906:2639:e200:f1b9:3192:4f75:2510? ([2a06:5906:2639:e200:f1b9:3192:4f75:2510])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c54bdsm61577775f8f.16.2026.04.08.13.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 13:31:17 -0700 (PDT)
Message-ID: <85e8de3e-cb00-4911-95b4-282bd7ec21e4@gmail.com>
Date: Wed, 8 Apr 2026 21:31:16 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] MAINTAINERS: add Rust I2C tree and update Igor
 Korotin's email
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Igor Korotin <igor.korotin@linux.dev>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260404-update-rust-i2c-maintainers-v2-1-42f929828eb1@linux.dev>
 <CANiq72nzNa29_YduauW_qwPq9sLbYa+28ykq42_bbfLnOqUm9Q@mail.gmail.com>
 <707e9f2e-048a-469e-adbb-17334dd027ab@linux.dev> <adGOXajATeerw91I@shikoro>
 <c26d043d-43a8-49a9-a866-d2bd5922b549@linux.dev> <ada3tSA4LdRl_nTL@shikoro>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <ada3tSA4LdRl_nTL@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Wolfram

On 4/8/2026 9:16 PM, Wolfram Sang wrote:
> 
>> Yes, this will go through the i2c-rust tree and be included via the usual
>> pull request.
> 
> When will the pull request come? Merge window starts next week
> probably...
> 

Should I wait for an Ack, or is this good to go for the upcoming pull 
request?

Thanks
Igor
