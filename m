Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B85195FE8
	for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761487662; cv=none; b=jruX1MeB/fN/924jmYRKVjYn+OJ9MRQOojm0dRzofpy56hWRwJOz6Y25WJaFMbqDPxn9+XYNEq//A4QxbpJ+y/tJ3g/7NjhFAQvAZPB9W3wqIuchIDiRKAtsqlviw3cLu6JR2kkz9uEKnlIGVq+AbhdKQJgDPucakSHPdoJ4ssc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761487662; c=relaxed/simple;
	bh=xV+XpmnZgH8yNaL91zacwH06Flk8Wj030SwiGCT4dKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r1IyT5KfijRJS9K3SCVZGrtso+09/x8kwqJTuE5I07jPGXN43hCoej9yLofUn7TaQAkHArXqqcdE/NikruiXL4I2NHmcm3ijmbidQCCADAQs4F2QsCQ6H0QJi44bGhjG/m/aKEhRRzRqM5PVyrVkmVYOWSef7wgMCVW0B5guZRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aonuQDI0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aonuQDI0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so3863713f8f.3
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Oct 2025 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761487659; x=1762092459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8pCXYGSUFQt2/UInKtJObjyURuskXIyH1nb5zEIddY=;
        b=aonuQDI0TgZQwhfKrL7e50L5mjOvZfbPAND5KyAE5OEUeVJzEsm0w6JGdZpureIOof
         k9nAwovrwHQqXF/TBq5aKs0VJe/pZrIOSvWA8LfU1diXpmluyfVhiaCcncdLiaMkkevh
         Uq8OBu8/XTkbtHZidAQUh/XNEIGFn2tl8iWjnphqcnFy0JWLT3afucNGdbaOAOOFkjnW
         ZNXz8pGDM7rrYBwqKwPIi6UueTcVEML0Y2GdvJJZfKX6o7afw5KQSxisSPLWmVsHlwTD
         yHPdXhmeqdwDn83m3P0Uos47txevkvAQQSQ8o54a74J7lyBul8R+TNO5N38HBawKGsso
         azLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761487659; x=1762092459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8pCXYGSUFQt2/UInKtJObjyURuskXIyH1nb5zEIddY=;
        b=eJKnLbg2Kk2nGrwE1/FTXL6+hmyPXna0RfwNpKa7YIOaN7a2rcCBhvbrPH7aQCqQ1I
         sHldKykDQqJrNWoRqWcCpqrQVHwqn7Enqwf4nfJNtk6u/gSjXaGvSvWOn/reqXmr1Hg6
         CW3cZuqrs6EOQxCHd5UlY/e/RuR5W6mpPBT29iocWu6OITlrTec0rOM/eMXx8P5cQkOW
         1Vn9+yJ1Iy+dvQ+cnP8wxQ6+yqPQjjGLR0QXlHfL7cHDeDTRFB1dr/cmd3lSt0VpXHkM
         BczInDBQrdXBWi93/lK/EnzTMer8iDdBKmhMEeoQBq9j3y2y8NEK2mnY9C90KpeetrDi
         XKkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVppULlSJQwGgIhypbLQFk2Iob9Jrv7uKEm8urJXdA/Vj9+Qw0Y0bNkT1lLlyB/20KV+AC4SsRBRFMnT1PhwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm/LEWfwGQ5S7DO2wbq3fdm83EFOGDrAYcyIyX+mqkPXbHH07v
	zt5d/t4APqAx01Dngie0pD/gFOm5lXW9o+hJgJ65ob8iVnAhwX78MxnR
X-Gm-Gg: ASbGncsIO5r7CeCX5LC9PlnpFgKUbG7lp4sAaUDur0v1hHbjbOEGuj6i/8PD5ASF3r6
	i/cAPcuOd2E+GKPTtUjiegq4KwICnNHpb+dSzNBa+q4ByB88E4MoyZ07kl/jf0vDe3I07wL3tO8
	h2GXZSGYeHFGtkokOx7VMrSuYE4CLH+ynVxQrYwiePrI3347+oREjhmRpTAz69GGtPWRLcb+d6S
	278vkHP+lARo2nL+HcAAb6hx6qC3TkbU/HevqreS3Gn7f/E4QM4VgJNKr2paIJEhAALO5jewAzV
	r2+neP2d2MhJGCJIK/NPpfZUFIbXM7n6Q+JqArGRl8llkXpsu554rF50Fuuua9p3JgJci/BISzW
	DO4MED1CYPD44rT+dXO+DUSFD0mLBTJKgdiexIj3Wf4pROSHoTCFAlyM+br3ek9S5oziXolZDHY
	k5md1ZOwmMNJTHAqnOmUb0apcqwf2Qc56XfqEZ2t9e8A+pDcBubm+Jn5OAin9mB4lty+dIuw7MT
	Qj9nmXvxiE=
X-Google-Smtp-Source: AGHT+IFSKeLMco2N3/sQiKLLR53sAgo1iuWmLMfoyaprsHJcZcPb9bsUpnpcl40HUr99KJOpcP8P7A==
X-Received: by 2002:a5d:588c:0:b0:427:83d:34b6 with SMTP id ffacd0b85a97d-427083d3c88mr27387967f8f.42.1761487658641;
        Sun, 26 Oct 2025 07:07:38 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7? ([2a02:c7c:8b21:7400:c9e:bafa:eeb1:89f7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb7dcsm9141661f8f.11.2025.10.26.07.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 07:07:38 -0700 (PDT)
Message-ID: <1b4070f8-a629-4487-8255-297918401723@gmail.com>
Date: Sun, 26 Oct 2025 14:07:36 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] rust: i2c: Add basic I2C driver abstractions
To: Danilo Krummrich <dakr@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Alex Hung <alex.hung@amd.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Xiangfei Ding <dingxiangfei2009@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20251005102226.41876-1-igor.korotin.linux@gmail.com>
 <4d6d737e-6e9d-4d33-8402-940947170872@gmail.com>
 <8b0718a3-bf3f-4037-be2e-540ba1879405@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <8b0718a3-bf3f-4037-be2e-540ba1879405@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/26/2025 10:52 AM, Danilo Krummrich wrote:
> On 10/26/25 10:38 AM, Igor Korotin wrote:
>> Just checking if there’s any feedback or if it’s still pending review.
>> Thanks!
> 
> One note, if taken through the I2C tree, this patch series will have a conflict
> with [1] from the driver-core tree.
> 
> Igor, Wolfram: If you rather want to avoid the conflict, I can also take this
> initial series through the driver-core tree.

I'm fine with either option. I can rebase and update the series based on 
[1] if needed.
> Thanks,
> Danilo
> 
> [1] https://lore.kernel.org/all/20251016125544.15559-1-dakr@kernel.org/
Thanks
Igor
