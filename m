Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AE3254849
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 10:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966243; cv=none; b=ARx2dFkjX5FKnYAYHpCQi6P8RligG855uNZx5B+Jtq5naQ4jkd5wfUIdMrCFaYPHvQebJ+CLKcm90Su5BbYbOcYVTan+QfFGBRZvC0sf9lnfHpdgnsBSNL2TFHx+9QLcP1zIMpnwwYAaf5FKnAEPrDH3SX6QgmvA8i3yBx9EnS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966243; c=relaxed/simple;
	bh=SMvRzUudMwE9gh+QI3p78IKx2rZRmC3QOeEAGSMOXbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FENFYHb56gfg7cAHrstWHCbfFX0+dnrxw9w7eokbiwStKjqBfSfnRimzZND+2LvvnlCzUuCi9jxMM3pYJOk8hMvSMSIOk/Qe66ae/gAV6YxIpLIA99h3k4zWULpU8/OhLteJ5sVuqZmfAA7rZ+J4Guczjbol+WAlwP2jetqEJaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYPfLFKx; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYPfLFKx"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so3792460a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 02:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765966241; x=1766571041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xO3E6v+EYJi4XiIbsXeHvys7mPWX18qJ6xl10KMPnZ8=;
        b=KYPfLFKxICsP2RUSX3eGUynFtKyaQwNVF4f10XE7KEem7RUcmWf45tP0A/i3eA8ALd
         B+HkJXjXfdW+90Cn+MoCRVxecT201NLRjvZKekwKlWhBTcWagIUSqGGfEZVXfEt8y4+7
         4LVYpCSCXaCwaj5egZCxCVi9eu6rfQfAA98rIAkcsxOq3KEfPXyRD/GUE1KScbvE+x2V
         GQOvvuBwfHn2VMJE/wgkVtKchgivEoEwuMYBZGzNtwheZyIQCA35UCpikzUS1NAjDttg
         P2M+nDNVIpL6GNgAPc2W3xr13YP+V13DHYgNAoAJjXzkskcEziJGZ615XZDJI9SCrUTN
         xKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765966241; x=1766571041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xO3E6v+EYJi4XiIbsXeHvys7mPWX18qJ6xl10KMPnZ8=;
        b=gix4BvQtxrJN0OLOt3/13Dq/ztVLkoZig/InZuO0vxCGh6liktKQiWpyTW0feYrURI
         k5+ThuoZrMt6QK6YOfifS/wYQYd4Lfny6hsIiRtfEFRb48THZdPJkrW7nR9/aWi0nYKK
         K4O3+gf2wI1wyJFXfsX5pYrtGx67S4kWUuLSNgvpd/3vj9PF0rikhi0kDTmrUHu/axBN
         cIvY9OTWtk51j+psE8wwACsnlApS4gZJXKuH6D3ugQLi6xc0QZDRkTX67WoHvVg/lSr7
         ajhuJkm7pFHJXOvwXqmj1RQrBGDFR4LLRzfEkjjOWJCLHadMmOrLcbtqtIcM9hqDKd7Y
         xRnA==
X-Forwarded-Encrypted: i=1; AJvYcCW88vWe3KUiD8UNqa1YMZyVhrdvgbYpjSsD/zsrIj36MZckZXo/0T34GQuvS1e9WTowS4z+p9XCXInhBnZ/Ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGvKYjBJOaybbpIWI5nsEsz8/S8FtZVnZnjgrKJBSZ+5HEb7bP
	ag+QjdSj7+0IvyVrtwB7LDlx8+7dK0bliQhE3tB7eaWpmo2ID3nfalVq
X-Gm-Gg: AY/fxX4ILOcoYW/QbPPPbhFz1/QHy5ikLn6z6vc8DUB9vCUm5MzLJtl0yQ1J0enMNFy
	iSxtPIb4gdZccpDg1zgg9rSC3Dg8smoiqv592zHbzclkDq1b9wrOnPCbqcE5+Z0vX4P4eGHF61n
	uxf5uFL3rFFIHHOSY11RHU/u3MWbRdWpioPxiU+W6yQ0e4su6HTglgyp5cnUduu/fS9D1dpaF2/
	AghOO2lJ3Jy874FGQpP01cdIhVYSa+hh9Flius1nv5hhhOFfEIy4r/C0ceULoj0OxggjZpwZWYN
	0Df1BfDrUaiGr3wmOSSa4u74l9cibz/HjEPpIgUQ2QGfjw8IJF5kmm1c8bHXrAvEdwXosoTruvZ
	d9BEWLGixAjqdOwQ0OEk7njm6Eg9DiRoYA9cc7a/1dK4uFs0O53eQqxAf0RYq5r/kpF1a4/DJpp
	hrDDlngcAh5O2YfQXAAwYWz4IQND8ugF1gI9AGeoiaflcSU7n6Q+WNTkxr5vOT9dNiDBoOvDVF7
	Lzg
X-Google-Smtp-Source: AGHT+IEG8JLieGR++365pLcyjXKBpPQ05/7enLWig8JfwMbvY/InVaunD5JLpgX83zIDArSrsMhjGA==
X-Received: by 2002:a05:7022:6191:b0:119:e56c:189d with SMTP id a92af1059eb24-11f34ac157bmr15819602c88.5.1765966240957;
        Wed, 17 Dec 2025 02:10:40 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f43288340sm26393130c88.6.2025.12.17.02.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:10:40 -0800 (PST)
Message-ID: <bbc421e4-76f7-4dba-8228-23488b1b1310@gmail.com>
Date: Wed, 17 Dec 2025 02:10:39 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Christian Schrefl <chrisi.schrefl@gmail.com>,
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
 <6eaa65a1-e7dd-404c-b716-d4f7a0ce7f5c@gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <6eaa65a1-e7dd-404c-b716-d4f7a0ce7f5c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/15/25 04:17, Christian Schrefl wrote:
> On 12/14/25 8:34 AM, Rudraksha Gupta wrote:
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
>> Sorry about that, I should've specified in the original email. The CC resolves to armv7-alpine-linux-musleabihf-gcc.
>>
>> When both LLVM=1 and the CC=gcc are used, I can insmod the sample rust modules just fine. However, if I only use LLVM=1, my phone doesn't output anything over UART, and I assume that it fails to boot. Interestingly enough, if I just specify LLVM=1 (with no CC=gcc), and remove the rust related configs from the pmos.config fragment, then my phone boots and I can see logs over UART.
> Did you try other architectures / devices as well (especially can you reproduce it on qemu-arm)?
>
> Did you try a LLVM=1 build without rust enabled?

Seems like you've found the preliminary qemu-arm patches I posted, but 
for completeness sake for others, this is reproducible on qemu-arm:

https://gitlab.postmarketos.org/postmarketOS/pmbootstrap/-/issues/2635#note_521740


As Christian mentioned, and I also now seem to conclude, it seems to be 
a clang issue.


>>> The normal way of calling would be the latter anyway -- with the
>>> former you are setting a custom `CC` (either whatever you have there
>>> or the `gcc` default). By default, `LLVM=1` means `CC=clang`.
>>>
>>> So it could be that you are using a completely different compiler
>>> (even Clang vs. GCC, or different versions, and so on). Hard to say.
>>> And depending on that, you may end up with a very different kernel
>>> image. Even substantial Kconfig options may get changed etc.
>>>
>>> I would suggest comparing the kernel configuration of those two ways
>>> (attaching them here could also be nice to see what compilers you are
>>> using and so on).
>> postmarketOS uses kernel config fragments and tracks the latest linux-next:
>>
>> - https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/devices.config
>>
>> - https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/pmos.config
>>
>> - build recipe: https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD
>>
>>
>> The only thing that changed was whether CC=gcc was specified or not:
>>
>> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/commit/b9102ac5718b8d18acb6801a62e1cd4cc7edc0cb
>>
> I'm not familiar with pmbootstrap, what is required to reproduce this?
> Do I just need to use the edge channel with linux-next or is something special required?
>
> I might habe time to look into trying to reproduce it this week, but I'm not sure.
> I have a armv7 based asus-flo device to try it out. Its not very well supported, but
> It should be sufficient for this.

asus-flo would probably also encounter this. Currently it's a bit broken 
in pmbootstrap, but I've provided a general guide here on how to go 
about fixing it:

https://postmarketos.org/edge/2025/11/17/apq8064-kernel-removed/


Would love to help you setup the asus-flo, since it also seems that 
upstream's IOMMU is broken and likely other things as well. If you'd 
like to drop by in the Matrix chat, we'd love to help you there if needed.

