Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6103521D3CC
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 00:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766361636; cv=none; b=UV2P7WJ79n2NT0rzrJYMYovV74IS+hmPHIJ6hiXOktNeSZqjkzMfmK9DEAw1K2Kltqb8ugvyZUcFxOD2q172LuK9vjnfq/oNL633B1DGLt3V1oLbh2IY66V7rl7xsIsxUoMJnOluaK3B3hRjDE5D6GL3QkAd0q5d/26L3szQzDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766361636; c=relaxed/simple;
	bh=U/EAyuONJ8CIVnN7Iyst3zvFlXpCRkIF1q3en+mKzaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7gN58rSLsOQqhOG4sX3AKTK9wwi+o6FXgQekK/5klSGbM8tA5i1fZnQ+yGprDuVuoJIyfHwLDHMaEKQJ7HPTxPnM1FIitLoHOffZ+UpUefnPUpgpS7vGQ5g2w1+f0JIyDZankTL1TH/Hym0MoL/uHoPWW44c3hRlQTzqJwGQH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIRi3utt; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIRi3utt"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso2940388a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Dec 2025 16:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766361632; x=1766966432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MM7RV4MA6+k2V8r5oWFH+eAF8D28f9bxG2QTbSEjJLk=;
        b=cIRi3uttWMXIHu+yYduJb3MS0jAi5HuURU855VGKLf//MYRp1BPUH7/Y9vr8laqbQ3
         19hKJXx3tB77J9mmIJju/alj/pqfUFJGsb6zsIlK/cNaPDchTdBSYVn27Fs+otlk26UA
         zFxhTlBdIrrC16sSCpn3aJLEUrW0TiJcxhD/ly11iBonNyYvndSDPl63wckh5JTXi18A
         ZGGH9vbcG3pLdwWllpH8YKwUsAwm1+B7ch9hqhFenH9tU8OZhC3koaFAtbGyoKSeAGi6
         t0m6dRcR4QqB6k4OwzSQOkth0Zutq7iATsNKx3PuouEl0LJhDnVGcXBS5MOp3JAXN6xV
         X3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766361632; x=1766966432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MM7RV4MA6+k2V8r5oWFH+eAF8D28f9bxG2QTbSEjJLk=;
        b=kedLx02VAW1Ps/2bwA5gvmaQKI8duYaDxPqC1Z8uuDTpsLqzSq79LBNGwzzjqORq1p
         mt40yPV0g5CgsY+a08i2unh3WTHn3ApjH5YipL0QID1tL0qHaAR4/qtI61ntHIdWTOel
         6XRe0gqi15Pvo+c0J99hKp9a5Yh62NB1T1+zDTOPKPXYpnId0xiqAFNaoXPmdOqslMCX
         69RddQWX+LI6s5BsA8fWdHJabkf4ogHLcyq9tMkZup2X13e36p7TJva4H0WHyQ+Lno9j
         piD+DtnD2vrskGfokQh5ViHPRpClHPDtTXanitA+2jvFLFEiXlZbbZQnwy+DulaYYn+9
         speA==
X-Forwarded-Encrypted: i=1; AJvYcCVBpJAmMgJrVxTnt/ljmiYIYRwYr1ej1yea4s54BJ4A/lro5OS8QynGaLNt5APjd0k7ykfhzGqazTgZg6iQrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqg3roJBxW8HvfiYyfl4qCimwpqK2RlVGYUHQcpMNag/DRbDAJ
	LdcBoJ7SdVHMS38/UgsAAwCbReQVNPVE4ZXWTp0hHzyeEzDsH1Stk7l3
X-Gm-Gg: AY/fxX7u0wUnX0nIT5Z1DAUCzIXIn3L12QnfL5wN+BE4liolF1ABF67+JDDojfrFPO3
	yXObQ08J84ELjABE6ki+bnEuqkHx9VA6ofOOaVYEdR6WWJ/7tYFMLa42EuiTt2T1PzzLZF5iivT
	C2dQQ3yeyhuJwa8SXTq1H/nzIZIZRKo/vzH8ilWGtBkHWrjkNRtGFs767p1NCyYPrB9tD21Dc3H
	r4m6y1Hk+mkEH+rmC3q7derVADCYVlaedBWtk/p8oE45qENS5+mWZrX82QsD28SgnwgmVcbuYNq
	qwlL5ivwaWVopfRR7whdd5BEierZsg/y03thHgRqrK+oPrLDlqag2N0jy2IT+075ab09kWdlp4L
	L3PY0Od9VkTRvtjl9/uLwudEZfo2d3yaXp13ljeUGz/lDpw/V2IsdWgJE21T8XqgGMrdK8vd4vw
	SykDxfypDL0KyAjQnoEmlYgdGLqhJbW9gixxanSSwLQcih2b/fS96ZseNeTVbSFiTIEQ==
X-Google-Smtp-Source: AGHT+IHWxQn5FbGuPZ3qckSgTAqf30C61kqhNqlZJurZtR2onEq7xRmHaWycfSAgCm0Rr0YlSZPrjQ==
X-Received: by 2002:a05:7300:ac90:b0:2b0:310c:529 with SMTP id 5a478bee46e88-2b05ec050d0mr9843513eec.14.1766361632052;
        Sun, 21 Dec 2025 16:00:32 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm25703154eec.2.2025.12.21.16.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 16:00:31 -0800 (PST)
Message-ID: <aa453636-dcbc-4ac1-8733-d9d992de82ce@gmail.com>
Date: Sun, 21 Dec 2025 16:00:30 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Christian Schrefl <chrisi.schrefl@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 llvm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
 <1910f4b6-db74-4c86-9010-28ab4462c5a7@gmail.com>
 <20251219211147.GA1407372@ax162>
 <0169d4f7-1a31-4ec6-a456-a6dfe2d99886@gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <0169d4f7-1a31-4ec6-a456-a6dfe2d99886@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,


So it seems that the boot.img size was getting too large for lk2nd (the 
bootloader) to handle and was giving these errors as described. Seems 
like lk2nd can't handle ~21 MB boot.img.


After removing networking from the Linux kernel (as it was the simplest 
way to massively reduce the Linux kernel size) as well as building the 
rust modules into the kernel itself, it seems to boot fine now:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.18.0 (root@9e6cbc09906e) (Alpine clang 
version 20.1.8, LLD 20.1.8) #4 SMP PREEMPT Sun Dec 21 23:44:57 UTC 2025
[    0.000000] CPU: ARMv7 Processor [511f04d4] revision 4 (ARMv7), 
cr=10c5787d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction 
cache
[    0.000000] OF: fdt: Machine model: Samsung Galaxy Express SGH-I437

[ ... ]


[    1.487035] rust_minimal: Rust minimal sample (init)
[    1.487297] rust_minimal: Am I built-in? true
[    1.492632] rust_print: Rust printing macros sample (init)
[    1.496873] rust_print: Emergency message (level 0) without args
[    1.502244] rust_print: Alert message (level 1) without args
[    1.508439] rust_print: Critical message (level 2) without args
[    1.514025] rust_print: Error message (level 3) without args
[    1.519702] rust_print: Warning message (level 4) without args
[    1.525592] rust_print: Notice message (level 5) without args
[    1.531239] rust_print: Info message (level 6) without args
[    1.537037] rust_print: A line that is continued without args
[    1.542440] rust_print: Emergency message (level 0) with args
[    1.548348] rust_print: Alert message (level 1) with args
[    1.554069] rust_print: Critical message (level 2) with args
[    1.559470] rust_print: Error message (level 3) with args
[    1.565177] rust_print: Warning message (level 4) with args
[    1.570458] rust_print: Notice message (level 5) with args
[    1.575829] rust_print: Info message (level 6) with args
[    1.581444] rust_print: A line that is continued with args
[    1.586893] rust_print: 1
[    1.586925] rust_print: "hello, world"
[    1.592188] rust_print: [../samples/rust/rust_print_main.rs:35:5] c = 
"hello, world"
[    1.598511] rust_print: Arc<dyn Display> says 42
[    1.598542] rust_print: Arc<dyn Display> says hello, world
[    1.606445] rust_print: "hello, world"


[ ... ]

Welcome to postmarketOS
Kernel 6.18.0 on an armv7l (/dev/ttyMSM0)
samsung-expressatt login: user
Password:
login: can't set groups: Function not implemented


Sorry for wasting everyone's time. I appreciate the helpful responses :)


Thanks,

Rudraksha

