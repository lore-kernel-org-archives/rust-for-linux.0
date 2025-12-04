Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7628233FE0E
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764852083; cv=none; b=b+o3VSlx2oGiwUFXCSYcb4WDMcXcMhJez7xvzXRj5bYl3Fa4bitMnCl4UaXRZNcHAdKZGpUQ5TGySp4ca0G7MILaY95zFnwU/2AAnS8uSKT6QYHkq4qgmeCNxLbqRdXBVT4FXK4c+6xWXoaHpWVav5+f/oMQPAU+IRy/bp7aUlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764852083; c=relaxed/simple;
	bh=hG1vkzaTsWHXNInLHudm3ZoCCm4Kfa85G6m2/cYZB8s=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ex+wrf1LYZy0H997NaFVF29LVw62VKIf3M7hTLTVqQccO59xOoWF1ays3ezYAYjHo46C5GVE/4I2vl9cd5mDyUCiAWuTvk2239St+6+Oqn+vbLnZFSQE87AD6+JBJ8HaOa07y3WsxRBtAx2VmZEqUHqnBr3hWRjkzGHWpvtWx+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF8j4nW5; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF8j4nW5"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64306a32ed2so677712d50.2
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764852080; x=1765456880; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CtmcVddWlIU7BT9xK5tcRrtmkn1+1JWSNY5cSjjYfUQ=;
        b=ZF8j4nW5FeoZMH2C2T3zN1Hqtemo6ZkiipW+rZFVG/Q1TExManR3uL+xpjWyxucqIV
         pqndw7fFWgyAyyJ3NZCh0H0Kv00vwZaL/NUJDU2VfoxDJjkKYAMex9nH7Bi1Gta8EFh9
         9cVHgjMzluYhiolo0/upiKcmlI35I9gsxhpYBd/UDLnFPwPCToYR68SiAiW9b8BVZucv
         TJ1/fjMedBr52yjSxeO5O2K/ZT/s0PuQ//08I2RZMXzHrwynE4j5ZCt773P+Baf5pKg5
         XMCxMd5RNUvonkqVpPHIFwuJDvoikj4Ouqvbutq7l3rMK6FHr5QVw4mEexOWvm9WCbZi
         4CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764852080; x=1765456880;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtmcVddWlIU7BT9xK5tcRrtmkn1+1JWSNY5cSjjYfUQ=;
        b=rghIK1jVG6pcgj8BOjR0DwOLLoj3QdWwUaoXdEo0iXosCcWpDooC2iPa634RQeyKch
         WactZJZYz3PUBwLIQnTSyi4FiYGTd4yfuRbR6gc5BKDVMq5q2BMu488kTa4ekCA6zDSR
         A3sUdISHJXkQC62xQoSPfQuUs/vEALelPm4jW82XWCo8u5lHnncXF9WdkFEBbfY+TwJ2
         cKVgrSzG+YQKTv73zth7tRuH0HVaKL5IX9GI3m25maQ1ppW6eNwYhLZx5sI7baabJQKV
         M7BA8jDNMm2chljhlbn/q2YW4ea+WN/j2hjZ2IH1bUihnsfPBsNDu1UsRpf9QsrWsZok
         ofig==
X-Forwarded-Encrypted: i=1; AJvYcCWRXG5hzvw7yCV10sEcfR7Mdp9jPNQ5KTBtuYcbH7pwFotQiHFQg72PzVuk0fOlliMvm8n/Y4A9mkxTcswHyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHnBVVywOKT5ghu0XGAXfSdvMEwwNSswlv7nScI0lIe11iUUdY
	bvL7mUFzMoD8uxcXRMniKrH2GsCqkkBJVS1RA+6CKvt6d7mUcSCwfxQs
X-Gm-Gg: ASbGnctJdMy/14o/pSRlMqW/X0mUUTfZIhbKOzt32P59tbSKKGfcM6VSB+DEdCHK9+y
	IrHJqL8iTOwFEpTi9jTuPv6RYBUPwuK7gfp4jZpzRWU9U6y3nH516WiIklmyXbq5DfBKxr29YXf
	nJNKcb8VtCnmNe0qG7H3hvNsDUC8PQJhMxyTwJ9UR8Z9QV/byC40ZlyaKF+4rXlk4xoEXDaqg9F
	YDpWFqCGu4VQQ+HqAqNBV2Bm00/OZXPI8RjnQDWBjUlLIBnCz9p1kyvMXMeb5twfcY41u1k65uF
	HWZDCYGjkYcQQDBAW30Py6uET+ttDLqeAXksX1JaOyY7ho7TPH0AsRadc/KXWz/fg+yeS/q3Lor
	3YWA5EdkgY0v8axc0mHFMoGCn4OU1KQGrcjStxv4vjfwqx0IUPYf3M1qAHqWSbE4IJtT1FFt9bd
	WDmE9WeykQrCu1bHbW0b5451n9KmsTc8JOndDGi5qV
X-Google-Smtp-Source: AGHT+IHJA60ZYQi9bh/oeg3T2d4XWf4TlPAq2CBo9e/gVJnloBN9DiCKQRpeQyWtcS1RPasu2wKg9g==
X-Received: by 2002:a05:690e:11c4:b0:640:caa5:57bd with SMTP id 956f58d0204a3-64436fe7dc6mr4661174d50.37.1764852080011;
        Thu, 04 Dec 2025 04:41:20 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b78e892sm4782487b3.44.2025.12.04.04.41.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 04:41:19 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <0c63bb4a-6aa0-412e-aad3-7ca3ecb1361f@gmail.com>
Date: Thu, 4 Dec 2025 20:41:10 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] rust: generate a fatal error if BINDGEN_TARGET is
 undefined
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Jonathan Corbet <corbet@lwn.net>, Jason Montleon <jmontleo@redhat.com>,
 Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor@kernel.org>,
 Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org
References: <20251204-gcc-rust-v5-v5-0-2d4f20d86c24@gmail.com>
 <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
Content-Language: en-US
In-Reply-To: <20251204-gcc-rust-v5-v5-2-2d4f20d86c24@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I noticed that RISC-V CI bjorn/dtb-warn-rv64 [^1] is failing somehow due 
to the error here. I'll look into it tomorrow.

[^1]: 
https://patchwork.kernel.org/project/linux-riscv/patch/20251204-gcc-rust-v5-v5-4-2d4f20d86c24@gmail.com/
