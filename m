Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51642338901
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965678; cv=none; b=U5AmNOE2zPheFYv/feqU4Xr0h2C4iHlQAbR56fK2e/+SFH74TCnYy7wQjW1Anq+xOndVBL4YvSu8sclu69hBe/s1PgEPzUz7klt/8Tz3l138kBgfMZWbRHQds1jDSCIBETbT5UKCQGapqCOm7dPd8oZFgVUnwY2xDP6hjLK1Mkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965678; c=relaxed/simple;
	bh=TX9PKbwuo+X5c/pt2dQLV/tFLg61cIkY/mvBpoTbQQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPriUfJweZ7oAPrHmExy28apaddKP1iPCfXyIn9/4jEDZBltSedqp6SPQ/4CMktG4ygOSTp0N4Lv3gcCZaPVW1v/9XgSDjNZFLzlBWd+5VF06aavKwNGTKvmP1G4ZfXuUMOGlQrdahQFpDcb7KjL5/LpFyC90aJb8NCfOEfwT+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8Vk4O7d; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8Vk4O7d"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29f1bc40b35so83254985ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 02:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765965674; x=1766570474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BnrbYc142rU4PJ4+bdzEv+GG1owi+xgePcJ4V/hmpW4=;
        b=Y8Vk4O7dKWAqkkLwskf49XdUCFSRpGOdqjQcSmTTbARj54lF0HjA9PiA8kE0chVcKv
         c/0i3aPcNnaQdz5r2fjq8O951ZEWxEfV+XnbPdHztWSy0fSCEI6gOE32XepjDpDce2sM
         gNhBEt6PHZU/D1liZmYVGr+ClB20Woy3vc9e3kNmZYu8bEAHQDPNC6qf+KEv+Gr+GjWq
         VJo6HwjU1htljpaqj/royssiGUGQcR1Wit9FnWf/p23em6BqGof0koFvj5ln5mpkQBEE
         6Zt8dhwF+o21DepfxH2JahP3re6Im/9r7hRl3XRD2pN9Q/ecGc/p9m03LuRMVdmxH82p
         FEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965674; x=1766570474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnrbYc142rU4PJ4+bdzEv+GG1owi+xgePcJ4V/hmpW4=;
        b=NiDoZaAV47wG/qo1GIz4S+J1Z48E2araQbS4niw7ceeQ2oFPHsC68dHJvZrcYngU2Y
         OE2GdovygiqxvGGgQ3ZPGt4pp51f6GQCt5eNFDKztVcjWrgfiU9c5hbuIoN59UhI8HK6
         OiiVlT+pGkBrWYcQQ32feKRDSRUesUS7oLxL2iKHSz0Az/R0hUp/mtPDKJ0OjGR11aOm
         IZQp2qhowoUdxqxKxAeLGDG6FTc0OxBzh/iZSnu9jfpLDf+GrpMK+WVlab8SPdqBidGf
         RzWQdRvvbX0+ggB7thhuFVl5Pm0gUMdA4ilvr6I7YXlUcStAx/COnH3uiZxiteb+yyFZ
         3b+w==
X-Forwarded-Encrypted: i=1; AJvYcCVHlE1K0IQU2Cugtd6hfaZoT/i1HcAcXdmN89D8bW6Nqo/8lHIGL4nrd7YuLofdSGxfJBgj4Vyz4KpAlf9EiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUyAm4qS0kUkPBfihItGrHOGZi1MdhyW95JvB7z86Gipqc/s+m
	H4RnTO+YUXyuI02LIc0yU7pLy9vwCQerne8o6TwIolqf3yls29iRckAr
X-Gm-Gg: AY/fxX67zzOcHcRKb/sZ9voPfmw1cFor/L0MPJcGyYvVG331QXJNc/3LU3Ehtve1nTz
	KU/ULQDMwsKItvOEr5VjEXcAYN83gdthjQLHK3zBLWCDSORYErioFIKufpBOVuR02wR5ZnBn3xl
	nRgnqa0lNXana5QonH84Yn6ugIBmjPrvLLIrifbYrjKsaZ096HwIfq6jUtbBcT+L4sJWLzdwaY7
	8s7Ja5c/6dpLynKVpYWXmIhMfakpXZf2EQP+Ok6ZReRj89/9zFKzWZXv4hQhtqjTtRe9CaXvHwk
	wiaQlZ37Y/Wmf513YnCe/SwrzgjNSTso5uy7znii/UEWxHkr+m9gqfvzLnUI7pIJyShs3prcwAg
	MOUD4EkNs4vRi56mXFLhhg16KPGw0sxZkSBBWZd97qU0bkYJUu3BI80PTzw06nMEnSIVDp03dkv
	fECjr6uNOcpf3ZCdGlii692/m1a3Bcv7+xUssjJXvELeZf7KjjsJhMe+6E3hl1twV4cw==
X-Google-Smtp-Source: AGHT+IHQwrAaQaZ6XAsRxYUc34aZYpqc/das4JLNgCdGwfbkhJl9an6tRUMXyRBfVTtZ0DT+E4HinA==
X-Received: by 2002:a05:7022:1715:b0:11d:f81b:b212 with SMTP id a92af1059eb24-11f34bc819amr10015101c88.17.1765965673857;
        Wed, 17 Dec 2025 02:01:13 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb28dsm61367679c88.2.2025.12.17.02.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:01:13 -0800 (PST)
Message-ID: <f14fec30-204a-48ed-b714-f420ea4594aa@gmail.com>
Date: Wed, 17 Dec 2025 02:01:12 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Danilo Krummrich <dakr@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Benno Lossin <lossin@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
 <66cba90e-c9b1-4356-a021-e8beeff0b88d@gmail.com>
 <20251215111941.6c7817cf.gary@garyguo.net>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20251215111941.6c7817cf.gary@garyguo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/15/25 03:19, Gary Guo wrote:
> On Sat, 13 Dec 2025 23:34:31 -0800
> Rudraksha Gupta <guptarud@gmail.com> wrote:
>
>> On 12/13/25 22:06, Miguel Ojeda wrote:
>>> On Sun, Dec 14, 2025 at 12:54 AM Rudraksha Gupta <guptarud@gmail.com> wrote:
>>>> - The kernel boots and outputs via UART when I build the kernel with the
>>>> following:
>>>>
>>>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>>>
>>>> - The kernel doesn't boot and there is no output via UART when I build
>>>> the kernel with the following:
>>>>
>>>> make LLVM=1 ARCH="$arm"
>>>>
>>>> The only difference being: CC="${CC:-gcc}". Is this expected?
>>> It depends on what that resolves to, i.e. your environment etc., i.e.
>>> that is resolved before Kbuild is called.
>> Sorry about that, I should've specified in the original email. The CC
>> resolves to armv7-alpine-linux-musleabihf-gcc.
>>
>> When both LLVM=1 and the CC=gcc are used, I can insmod the sample rust
>> modules just fine. However, if I only use LLVM=1, my phone doesn't
>> output anything over UART, and I assume that it fails to boot.
>> Interestingly enough, if I just specify LLVM=1 (with no CC=gcc), and
>> remove the rust related configs from the pmos.config fragment, then my
>> phone boots and I can see logs over UART.
> Which drivers have you enabled that use Rust? Just having core Rust
> infrastructure enabled shouldn't cause issues on its own, apart from
> slightly bigger kernel image.

Just these ones:

https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/pmos.config#L264


I'm starting to think this might be an clang issue. Ran this on qemu-arm 
and encountering similar issues:

https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635#note_521740

> If just enabling Rust but none of Rust drivers cause issue, I would start
> looking at
>
> 1) if there're any symbols somehow being overwritten by the Rust object
> files.

If I suspect it to be a clang issue now, is this still the best way to 
go about looking into the problem? This is a little bit out of my 
domain, but happy to learn.


> 2) if the size of kernel is pushed above a certain threshold that your
> bootloader/firmware is unhappy.

I believe lk2nd (fastboot bootloader) would complain if this were the 
case. I'm currently flashing lk2nd into the boot partition (to override 
the proprietary bootloader's defaults) and then flashing posmarketOS 
kernel and rootfs in data and system partitions.


>
> Best,
> Gary
