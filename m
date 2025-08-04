Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593F1C5489
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754328539; cv=none; b=BxTm4XEJJoukVvkZoDUZR+8TFvbRgMHp5VRYrG8V5vD9SE8zVL9IUW2KeosCcwCjrbK8q0guJao1EiRAuGytoXdHmIaCelSnx2z/IjAQx3wnWiuXGRAFF2zKX6911Kf11uzmSBio1mNGWHhWAso/FpmWd1q+r48iBJNzTs4imx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754328539; c=relaxed/simple;
	bh=uMAUmffTPUG7bFQVBUpQTG/xk0fu2i4jSlJrqNu0usU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffiz9WKbo9S8XNQmdrl5tT+FHNnaGk9Uay5Ekq5wN+kFQnmF1XZ3UJ2/j8iHdob3wszKycdbAz3nHZasZQHbokcozZ3G9MZNVYR6ToQNUKnXtEwUnnJsctgJEHSFImbeUAnpGNt2gONlofNnZuu8Qz9SD7AweTdihKRvSyi8mHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+v+wRBI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+v+wRBI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23fd3fe0d81so42950505ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Aug 2025 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754328538; x=1754933338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMAUmffTPUG7bFQVBUpQTG/xk0fu2i4jSlJrqNu0usU=;
        b=X+v+wRBIWbEw88cLZY+oIH9kmpqqDX6S35zjdRH2Vb3kd8E1H4UUaOGMGj/ALIO+B0
         pk2E/1/NhrUYVuB73GQzb1h81Z7jBwCD4scuyp5G5K1glnq63qeyYMMKET4aRoqreuya
         3+UD+A7tFKk6wEC29rIEkPfCaxrKH/TK5Z1Oa10nacvsAAQE/h7WOBpE9I+42dmMDna0
         q/LFGjjaoLBe6sswpWRgulgXTtNdw7q47nAszzWLYNyCTlB4y3yyXu3JndAezAYWeQsg
         rDz2p/Fry2iOa2/HNEm8FHjVCu6h7auWLfnkWYhKA6TSk+PQm0EvmAzWaDSHvjPnITQb
         kwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754328538; x=1754933338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMAUmffTPUG7bFQVBUpQTG/xk0fu2i4jSlJrqNu0usU=;
        b=ZXpIE7fHSEnVVq56zGsPuyfHwuvmss6YcWcyPrSsr2c37tNrXdsnGaSi9LYVvpUFhM
         ihYXrYq/DjOSeXhqggNLsfEMujEanWTR9wkvoGfJk0JNpqlZOWN4rMCCZrAv6+/h6R//
         VfK8H2P2QGVNxJ3462rWVo1OQpj7qNJz/AeLu7GbFQXyU/QnUE5AWSTMIU8C25tnWqtK
         zVUUdM65LeprGn67qDDirjaC+3KJpVsTlXzeZ0uKPwyXNeVysdnFK0mcL6vAhdaRaomd
         lpbfy2nIKW+2GUi5wRHoOrenvE0lt1EgoFbiF3EyC9owdzYfJBkkYfkQ9eBDmXkTLf/x
         jJRw==
X-Forwarded-Encrypted: i=1; AJvYcCXOtHsenwdNwz68x7yzTx3ysazEZrXVVzG8TjjFn+mmgmjmZETL1VDEnzbCcsSXXnLWdqQdTRJq9Xg4XKR8sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTsXWhx6uGLMUPoPKVz6ara9h5YvoMhPFxoknEzACV2q5alv7I
	T2auKDImoAW7VYYTE5+EBDl13W1CRd4hr3w0LQkkzR06UPDnWAFJmS01
X-Gm-Gg: ASbGncuwVkDCtPXPOjlBlZ0r1EpuMGNB/CdrUs0MHyr+3o0CMuOgisinBXQDAbWi9K4
	hk7sjQxDnAxsohlW1BO1jDfpVq2GV+tcSTVd7b0b8eYzk9f1T4fOQd6+9RXnoFDBvy//yJ3xS/y
	8yCfVGQvXX5/e2T03hexXtis5G1GKnCCN+E8ibr4E2dMHoUjOav7tbircrsI2yXiUTKr7z6pkV8
	M22MJRVVHkF6qZBDmmJcNA1m4ki9lHJaWC2YHKI3eQz9GUSNuCHUgG/rHIIcg7pXYIpwTHd/zf/
	RBnDHUF+bcCU+qdrcsKKyYGRIm0YqGOHq5hx1N79PofP/ZzrZjU8PxNuopFg6TqQ/hobI0kIUhm
	WadF9ivyIMGq4OjlrawA+n83uYVu7QHunIt0O6zZ77Q==
X-Google-Smtp-Source: AGHT+IHipnf/cuL0DU41NAA6dkElQZeXYjJhwiWUp5O791c4aU0qnEdHXpKmJ8HSfaE1yRLYbERmOg==
X-Received: by 2002:a17:903:32c7:b0:23f:e2e0:f89b with SMTP id d9443c01a7336-24246f56383mr125378575ad.3.1754328537585;
        Mon, 04 Aug 2025 10:28:57 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aabda2sm115159925ad.163.2025.08.04.10.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 10:28:57 -0700 (PDT)
Message-ID: <663019c6-af05-44bb-ad9e-3b88cbc399a8@gmail.com>
Date: Mon, 4 Aug 2025 18:26:33 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <08e89f95-6c95-4998-988c-e25f3cbfb389@gmail.com>
 <DBTQRIGWJDYB.2VNIOFWLKZFG3@kernel.org>
 <3e53e2c8-4988-448e-b2ac-6eaf6d62e050@gmail.com> <aJDbmFx3QAm-TY4L@shikoro>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <aJDbmFx3QAm-TY4L@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Wolfram

On 8/4/25 17:11, Wolfram Sang wrote:
> So, for starters, we can use my tree in the seperate I2C RUST entry. We
> did a similar thing with the I2C MUX subsubsystem. By the time, we can
> move to a dedicated tree, if there is a need. Thinking about it, there
> will not be a lot of patches for I2C Rust, or?

Can't say for sure. I don’t expect much from my side, but from time to
time there are Rust commits that change multiple subsystems at once —
kind of like a wildcard hit.

Anyway, as far as I see, we can always adjust the workflow later if
needed. For now, we just need to start somewhere.

Thanks,
Igor
