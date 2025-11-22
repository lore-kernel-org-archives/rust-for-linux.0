Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA65E2AD35
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 14:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763820046; cv=none; b=IcYSr8McWL/UDhuoWDN0736MhgcOjsukwwYFLBnGfrA3Ye3Q6EpuZUiJ1SFrVE0R+t2WjkxLRxsgBFDvhBNb60wgVhwHOd0pRtmyLz/+vskjjqMLdGwMtVoqi4lo1Z2sjIhDsx1+ztsXn7UPwXgRZU/DYut71SmDl78IQbeoBhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763820046; c=relaxed/simple;
	bh=quy70Ek/g6qrhcqWBI6EKf77vs+SuiqG7tLVTxxmDl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dTOTIu+GmS2NmHDistWbq4TqiAyamqbYjFoqmW63AoXua1kZzyoByRfr9e2R3QbHVr2/VW8REPgajsWUWEy2IznodNdIomvyLwFp0vpgo20DDVTLARLiDXWHkpfQaorIq2Ev16RMPKXAVDkEsGMWTC49yrCAyK/dF7Fmn/sWI64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDFCY4pI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDFCY4pI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47796a837c7so18750955e9.0
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Nov 2025 06:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763820043; x=1764424843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfwrkbhLrbte3ifsqNDH76QA6U3FeJoA58L19HPvYEo=;
        b=FDFCY4pIZsO1DFTetcZ/L+iNMWBXtxKVGUWJzcfguUVlqLKXUo7L+J/977cfNysgD+
         IPssJevSWzwg/7gVqtgtyn6rCjlTSfDfxamIBnBa2CGY5yGJ0QPos35RBAmahiJbMsa4
         TbmcV5JFCTxNpgy5ETNMuAZDZviiorJPcIxCDiW865IvX/nM2sdKWSRvFI9vWftN4p0Q
         pgfTFizgiml+HXMnd2LivcDhQNEmofJjjqii7itHUzuiznvOl0VWHfkN5a3x+lJ26/T7
         QWbY1t0yBQcFBZ32+4KeIsCC0MT+QfzMzTzu6IiK83yuESOtkitcJQ9WoMpPn2rHH9K8
         Ndiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763820043; x=1764424843;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfwrkbhLrbte3ifsqNDH76QA6U3FeJoA58L19HPvYEo=;
        b=bpLFICJtcIKp6tpyzr4RO8YbpknpmJnEw7Y8ErVPzTkYiMLPB92pLi1I0gZI+loyxh
         buAITjOqbpqusIfzIXIy/llj5kqjYAFeIlmkz2Qlux/L0WfH1A2dkCKl/yFuix7wlf9m
         6Q7m/NM65uadt2QEkDptnv6T6OXR7hyaG8mPCC+YuvSKlo9I4047DWZs9ELnSp5yhzbl
         l2AwE5n2OD2qzzklV1cbU5MAxymBdsDgYrY+luxUxzTpXnMDC4NT0BW3pdmjwjARImez
         giQWYQtwCBLGnvG+Mhk8dqhh+O/iE62F90xz5j+IiUNY1CW8Wbbu82UFuHsVb4TPRdIT
         gx0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrG56HTkzBPOUaMcrU7DQHW4fBS850lGkj48RLA3H/CXuzqt0TFWwKq1IjED6Q7juuAE6JtWU0fZftqE87oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0k5S0kVD59cjlgkLHKEVdZM1yEeeXrr+mV4FmowqifkMYP2iY
	Id8N406N3gXAzQTCmhDwedEw4uSd/RDd3cMWI/sIrqQ5vhHJf2IuXo6v
X-Gm-Gg: ASbGncu8VoKaaOaE5oPHZykYJGFQshQB+hTH6FViycCFnDvO+25jJeCgVZzPpUYawdt
	mPHD6iyIFvQVKUzRXmzhMSFT9nl5Vvg6l5TLsByhuViUBzdT3Crm2tF64DyuoFslpS9mWm7eYrq
	FmAEXpVNTx0g8qytT6est1hYJYxJ6A4f6RjaZH/wziRW8s2J721GZ1JzTvCYGUcJz9UUECTL/zI
	0ETlQGypsuoCtinVgKoRGCKroJPUQVgWeBHCX+Iydydc9AMNW4IKfeTMKb+eE00LPrte3jub+fl
	KSjJBUeyR2fQJU341Ivu7A7tbo1WZ5pIsvk/GJEJCaL1Orw6mNe6eNvkgSHBbmHMxOt8I0cuLNC
	PJdsmOrIkloxs1N4lGc0md0gZMT5QnjBjvao89e57v0z2xkREc31VC8fm0tRq6Lr48feRREHDFB
	WC71dhEYMVRTks3+KjHyZojx7d1cGj3rIixrXYTCNbMwbS2JI8yiHQJwGZXr6fF9sHBVUAef1td
	rVllA==
X-Google-Smtp-Source: AGHT+IGCTRKOT74K0saRhZjnA8SssUcOet/loygSO0mcvZW4qeg4K5sLv0R2XFKB1yMWmNn38c4hpg==
X-Received: by 2002:a05:6000:22c9:b0:42b:2eb3:c910 with SMTP id ffacd0b85a97d-42cc1cd9466mr5763465f8f.3.1763820042951;
        Sat, 22 Nov 2025 06:00:42 -0800 (PST)
Received: from ?IPV6:2a06:5906:2618:cb00:9815:cfad:3c92:4b87? ([2a06:5906:2618:cb00:9815:cfad:3c92:4b87])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm16995503f8f.32.2025.11.22.06.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Nov 2025 06:00:42 -0800 (PST)
Message-ID: <2adb1d9e-9891-4318-bbd2-c6537af538c2@gmail.com>
Date: Sat, 22 Nov 2025 14:00:41 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] rust: i2c: Add basic I2C driver abstractions
To: Markus Probst <markus.probst@posteo.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20251116162104.171420-1-igor.korotin.linux@gmail.com>
 <25c70010f67e9f0760840e35cc722d3bb89fd703.camel@posteo.de>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <25c70010f67e9f0760840e35cc722d3bb89fd703.camel@posteo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Markus

On 11/17/2025 4:15 PM, Markus Probst wrote:
> add me to cc please.
> 
> My led driver currently relies on the i2c bindings.
> 
> Thanks
> - Markus Probst

Sure, no problem

Thanks
Igor


