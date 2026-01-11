Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330DC1339A4
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 21:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768168079; cv=none; b=BEOSFTf5OPg2dlQAonrGAtHGh8OWrCABugVsb9t+XBy960DzQppjFWIUOXSAz1zhhRiWg60zIHNqXz+WBAP2CaRKdbBajIZJUHYrVPSopzOjV4O/zMg9d6Cd73Td1Ak8rqsNg59CP41YMbtogx0mNcHtL7pP8YOkmSvkuIHQXAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768168079; c=relaxed/simple;
	bh=Hcc6haJcvMChzDXHBkIBzN/ZEjuxdlsnJS6aBn83rMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfXk6R9tKFKl5mQGxr/4Haas5spYqYpTdkXVCTr6esWEjzxGgaDfS3tVJX7ZNLyGVv+Vxa0sqC+YZ6ykM21243DfqUcAcj1Y05uczY7yJiDtaULwe67OjT8iRXe+5gMkregvQuQlwdwBSOzyAUlCFKZ0Jt9LmR9/vyw8U9nMt5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfdPft9g; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfdPft9g"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ee9fa419f5so790969137.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jan 2026 13:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768168075; x=1768772875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O+2gWstM/HyxPNL7mRybuJKtVgZIGjOSwpFyBi2YJ1c=;
        b=GfdPft9gl3xQ0uXKBX5LlgHx/P1+W/QXQ8W9Bk5Ykc9kPyL4f91g4N7APVN2o6K9At
         yx7mpYovjV9USlOsBpHM5eM8xPfTJFXAa8F7TXopnyuAecCcDL/MvAuEy+xdXrybM/fu
         +aZuC/qm00wJqNTzus1SOUR5ImZkZpg5w9z3hyruTMMqi1kUSvxHYkId9ULqpRBVx717
         f1A5mURwq39zhbNTQ1YtQzysqE1Rrv/07F6OTpuTxJHuJTnoVGewM6ya1oEsmXHQFZpA
         fnJJCtpc3cKYFrp+KJo6YI2TOsZ4LhrakADYmNuQsDf/L1g215JofvOLsY3qzCTa+2m9
         Ls4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768168075; x=1768772875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+2gWstM/HyxPNL7mRybuJKtVgZIGjOSwpFyBi2YJ1c=;
        b=ARI51VKOiZW6QzTBRLTOS9hoh0/PagR/9+vppJa0cKc0ljpFCrakzlXzmas1XVNfUf
         35yL2jtFB7+6EslO4u5mdR+xpblc/bLAZiL9cVRy2OkSI9mxA2uRW9lGK2qP+qwY/Acu
         x3mxrLpb1qapn/cR4pItM/wqQxLXirMY3xdEEb6sRPF8e/6x57YSdCOHQU7EnrMIw0gy
         DcD+dx4ms57q48H5+WTzlpRmv5t0edDebHgvIX91MBDkW1ve40YIARzSgqytP6Oa+Q8R
         xHtrEweKo93TjJgmQES0yx3Ou8tBqQ7mV4ohLBizENspSuP4NBVC7mI3BQ/MNx0/7ZGT
         fYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiUzvlc9hzejdFb3G/rL3aeQkIwvaX6OWQkzfDK3ZVt0jlX/B+u4cyPlCRaV7TElTGMQyi6z13sKBIg8Qrfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAjJPomfkRb78tH+gqjyu2b8XpOyKemnk5ysfcNR1FEzHJRAXx
	e/ss9m7VWbZNYXa8yjICG5/FgFhbCVwbZfk8DwlXBtbmugFWg2e49U7e
X-Gm-Gg: AY/fxX6+bTkTSkHs+nZv4qOUNxOREDroIwsE7QTORh1N0BWN3CP8xbv5beik943xaVS
	gQkUU/G1HeT4zISy5MT5161qN47unhZG4nRL67NVJGAJB8Q0mximPuTit2XAH3m5m83CjKOR3V7
	/I1hatmGkM+XndMYr8LI8AI1Fshyef7O5GoaQ5eKHxccZmXVkIxhQCqfz3P5KYC46NYJIMYIByE
	ar5Jx2PiML0nN5mc3Flk+jIX9XV2sHlAKAwMnKR9wWuiOSLlB26hmDi/nTcUmJH9SGxW/tGrr1R
	Wp9CMmnXJZBcQJflOCNDvT4AqX0MYrMNyHlPcpzPusEBPMAFlU6RFQ+W1D5gQOr/J8lPrbKbCOG
	Lg80RCfDzEUXchVNZ03e6JqnbLJsNP5mLlVtXeYSYPE28wTQ3vhgCFwNUgJ/dTvBZJsluy9X0cp
	2gPwQwTy+BLQQhmjz3N21GciTVxMyLA5+1ZyckCr9o7WpcbUY6wVbJED7p8wwM27LdyEEXiZDv
X-Google-Smtp-Source: AGHT+IEEYehPkZiKnQl/5kGTgWOJPrvUtSI8lKQuH2RFJUTTapZeRbZUz+fUsZYLVMBFyZRnXDSqOA==
X-Received: by 2002:a05:6102:5e98:b0:5ee:a03c:8774 with SMTP id ada2fe7eead31-5eea03c97e8mr5339901137.28.1768168074993;
        Sun, 11 Jan 2026 13:47:54 -0800 (PST)
Received: from ?IPV6:2804:d57:4e32:d200:d9b8:e236:f824:3578? ([2804:d57:4e32:d200:d9b8:e236:f824:3578])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ed082abc75sm14481849137.1.2026.01.11.13.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 13:47:53 -0800 (PST)
Message-ID: <444e63b3-8971-464d-ad22-c52eb1295b53@gmail.com>
Date: Sun, 11 Jan 2026 18:47:47 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] rust: add new macro for common bitflag operations
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 daniel.almeida@collabora.com, rust-for-linux@vger.kernel.org,
 felipe_life@live.com, linux-kernel@vger.kernel.org,
 Lyude Paul <lyude@redhat.com>
References: <20260111-feat-add-bitmask-macro-v8-1-3bc0a558ede0@gmail.com>
 <CANiq72mXjEQd45+U7=UOfmdiK6zX_MFnnTT2Z4-a3ENF888i9Q@mail.gmail.com>
Content-Language: en-US
From: Filipe Xavier <felipeaggger@gmail.com>
In-Reply-To: <CANiq72mXjEQd45+U7=UOfmdiK6zX_MFnnTT2Z4-a3ENF888i9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/11/26 5:06 PM, Miguel Ojeda wrote:

> On Sun, Jan 11, 2026 at 2:33 PM Filipe Xavier <felipeaggger@gmail.com> wrote:
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Common helper for declaring bitflag and bitmask types.
>> +///
>> +/// This macro takes as input:
> So I didn't mean to convert the first line to `//!`, but to add
> documentation to the module between the SPDX line and the
> documentation for the item.

Oh, sorry, I misunderstood. I thought it might be redundant; I'll adjust 
it in the next version.

> Please see how other files do it, e.g. `rust/kernel/slice.rs` and
> `rust/kernel/irq.rs` are similar cases (no `use` blocks between `//!`
> and the first item).
>
> But please wait a few days in case there is any other feedback --
> hopefully we are getting finally there.
>
> (By the way, in general, it is good to reply to the feedback messages
> you get, to confirm or not whether you applied a particular
> suggestion).
>
> Thanks for updating the docs and being persistent!
I am the one who is grateful for the feedback and patience.

Xavier

