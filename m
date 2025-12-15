Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B95E139D0A
	for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765801052; cv=none; b=jw7SMLpOdB13H4/VVh4tqER8QkSStiQZu8thQR1qmB4/jhebs7wVZOZ+H8NU3H9LX3U60BZn2aCxPxxaEVJ2Z6of6VRWI2STdfx+KNnWWnMqcc21xVWK3KNzCwMt1dmNF/lv3Yk12QgkifAngD3pg0LeTFurGY+PjtBXdEnO8jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765801052; c=relaxed/simple;
	bh=4NKbKdXoF69O/v3F5VX0MeyVaX0UZZffHXaLhbOZxUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgekpkAYBVZgkbH3/jfKHxHAesXk37YDeETpCIFW117NA9OBMU45+dyd1doDXKwkdGINUNosgrdQSxlDlJqtLx64pRsQ2vT95EEyaZQH+dbqa7ZDKDQxFnzC1ZUOxXfcHl+ZQ0n65pKLu/16uqW5bUw4Dfiqq4C0hr7P8OkD+nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWRiQcfl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWRiQcfl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso14844095e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 15 Dec 2025 04:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765801049; x=1766405849; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+wBMpDpYfgZrWAcGGwblbnMJhhVgVNGie/vmA06QjKI=;
        b=DWRiQcflQY/oPlKMIYHDcV5tMQtzPx7/KaR4eLP/96j5+/NwrE9KgsatQG2fGd7qoS
         GSO9C6YTu+ZgHMY4v5QzGiO1wS0nNTvmeGpYJkgyRi2OT+ZWHHCPRWQuxSARylxch+1f
         Y4UU+YyGzs7fBGZaFH7SX5MGqOz8ig5IM7bqqDYN6ZKaqCaJtxV8CT1FDJQUvqutsJHN
         yWMt5QbvXVqdl58zvi208tU9I0K2qD0CnaJ8/6xHWEp1T6QUHiUdfMUKV6drZvaxCbDO
         JWZ3TXbgaPBVBS/Bz+vRYGz8eXT/QgBy+bbe+h17QtI336kpwE8uRI0y7pGH6KWtGLrS
         E0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765801049; x=1766405849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+wBMpDpYfgZrWAcGGwblbnMJhhVgVNGie/vmA06QjKI=;
        b=cq0hs04dP6OKGQrjiJ5cQYwlfK+tI0IBtmrfW/g5oHbMLep6obNh5Hnj8gRA8O7XKu
         +h3nf9F6oQS2tQqdPcXGV9NiOdbyOJleBuVLrZ/v+wrgbb218Mg5XXvi044nM3VDUn6u
         MaGrCY7KoAc0qiJTBvnaqfsx2gTeUhGmZI3468eUBuslL+n3rhr9k2JFyQxRxq/D7N1M
         9E03WHrsPDKbQfJjJoM6KKapX0IkvgFTDCIbv64yn/+gm3YYUl4iHhGig5a2tnC6te0R
         JYBFwMhwiELQTFnyMk3oMdSjabezHbT+lPvbNF4EHzLMZusxjf0UrkTYhCyRObTsOdG5
         WTxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGhIACHjzGO9TToVguRCQA13kahsCS2Em6W4GnkHOVCUDELdZ2tyHEv0q8+KJpWiEynoiGdFE4BXA/sPM+MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDbY1bIN5pEd+qOTB9yp+KtmQEl7wDgpAjbADU8p5JE6f8+qBJ
	0CKorGQ4jhNttd6UL9AMOViNJ4hvulBqsZBDIrDklhrYk2z6HNUcwVY2
X-Gm-Gg: AY/fxX5cUcgsvloXA5vMEjHxoGhRDwU+btmU2sVeglG8SJuRGirRNjSWlAHmDW1X+c/
	i8CUAlIevaz+yGS4jYbNUDa9gh+zzBIBFPntQkyH3ay3oroijf0g91QXdZSZFce/tdVpXzaHM+q
	ewtMIe8e5HLVahlSNb3OL4IpTVd/IPtYZaYMI48B28snMziUV6Se9MH22rsdOXJpkqWrVJfVxan
	jyt0icnBdxeww/6JiyW8Jm4QFFDX8ROmZj6YBtY4nOnAzk23HXD3c0h2Ad8Y7niGrPn559s8+Sg
	xDyxb04koogpvDsmmBdWs48D0e0zNIJbDfnpBle2VIYztxgwXDG8Hcgo70tS6D+KWwZDB/gWXV7
	HTFJzIMoFTCZ6VBCZbAGiQuIcHCIxONv+aw4aYsJp1Tqjxf49kiVd6yKxEkltzVDoED70E+1KM7
	O9Y9W/QgRexP+aR+BVB5kJAo6H
X-Google-Smtp-Source: AGHT+IH9JDOpbPuun7nC0jCId5lX3+h1bjNa1HYOaTMS/gGx6qZw9KBRSpCqvSuozGy7V76BmE+n+g==
X-Received: by 2002:a05:600c:8b67:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-47a8f8a6d83mr87606615e9.3.1765801048597;
        Mon, 15 Dec 2025 04:17:28 -0800 (PST)
Received: from ?IPV6:2001:871:22a:3342::1ad1? ([2001:871:22a:3342::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm14277633f8f.38.2025.12.15.04.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 04:17:28 -0800 (PST)
Message-ID: <6eaa65a1-e7dd-404c-b716-d4f7a0ce7f5c@gmail.com>
Date: Mon, 15 Dec 2025 13:17:26 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Rudraksha Gupta <guptarud@gmail.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
 <66cba90e-c9b1-4356-a021-e8beeff0b88d@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <66cba90e-c9b1-4356-a021-e8beeff0b88d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/14/25 8:34 AM, Rudraksha Gupta wrote:
> On 12/13/25 22:06, Miguel Ojeda wrote:
>> On Sun, Dec 14, 2025 at 12:54 AM Rudraksha Gupta <guptarud@gmail.com> wrote:
>>> - The kernel boots and outputs via UART when I build the kernel with the
>>> following:
>>>
>>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>>
>>> - The kernel doesn't boot and there is no output via UART when I build
>>> the kernel with the following:
>>>
>>> make LLVM=1 ARCH="$arm"
>>>
>>> The only difference being: CC="${CC:-gcc}". Is this expected?
>> It depends on what that resolves to, i.e. your environment etc., i.e.
>> that is resolved before Kbuild is called.
> 
> Sorry about that, I should've specified in the original email. The CC resolves to armv7-alpine-linux-musleabihf-gcc.
> 
> When both LLVM=1 and the CC=gcc are used, I can insmod the sample rust modules just fine. However, if I only use LLVM=1, my phone doesn't output anything over UART, and I assume that it fails to boot. Interestingly enough, if I just specify LLVM=1 (with no CC=gcc), and remove the rust related configs from the pmos.config fragment, then my phone boots and I can see logs over UART.

Did you try other architectures / devices as well (especially can you reproduce it on qemu-arm)?

Did you try a LLVM=1 build without rust enabled?

> 
>> The normal way of calling would be the latter anyway -- with the
>> former you are setting a custom `CC` (either whatever you have there
>> or the `gcc` default). By default, `LLVM=1` means `CC=clang`.
>>
>> So it could be that you are using a completely different compiler
>> (even Clang vs. GCC, or different versions, and so on). Hard to say.
>> And depending on that, you may end up with a very different kernel
>> image. Even substantial Kconfig options may get changed etc.
>>
>> I would suggest comparing the kernel configuration of those two ways
>> (attaching them here could also be nice to see what compilers you are
>> using and so on).
> 
> postmarketOS uses kernel config fragments and tracks the latest linux-next:
> 
> - https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/devices.config
> 
> - https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/pmos.config
> 
> - build recipe: https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD
> 
> 
> The only thing that changed was whether CC=gcc was specified or not:
> 
> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/commit/b9102ac5718b8d18acb6801a62e1cd4cc7edc0cb
> 

I'm not familiar with pmbootstrap, what is required to reproduce this?
Do I just need to use the edge channel with linux-next or is something special required?

I might habe time to look into trying to reproduce it this week, but I'm not sure.
I have a armv7 based asus-flo device to try it out. Its not very well supported, but
It should be sufficient for this.

Cheers,
Christian

