Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCBF27A93C
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Dec 2025 07:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765697675; cv=none; b=q0761WovTCJFnqrb++ib6S4qFicMZqrNpJq5phI5CfSvX7sV3NcLFgJEVWq05fIPMaK3gUuMisufQJgRoAK8PTVQy0500j2aAMbtZp0rP80zZiljrHihew5jsuJy2LqDzzgGtEThp1wP4Aek25LTgac4b+G3odAJ5M6gwT8/+LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765697675; c=relaxed/simple;
	bh=FVxIlAKuTuRT11DwsMiqIbBYGhbAiF+XA+LYL1zo2gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q4JJoOJ91F99r2i80W3/N9yluT0yMkd8rQFML3PQXoDnAfjrQyBrMbNCYiGYn9zLwxOShSeEdsXVwh8kap+lfoGcgq+Vnu/O5HdekxbaxT398zGqq7P4wCqHBvK4qFL6sC14CEiNjTaQdKgN1Rx1c476nShhgYBNnB26j3tMAOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caBgqtMT; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caBgqtMT"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bd1ce1b35e7so1735967a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Dec 2025 23:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765697673; x=1766302473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRn1RbbVVYNiiCpJThw73EOp5BTjJZAt0+REstZc+hw=;
        b=caBgqtMTulwlXhh93hcKSUs0xu7K8V4YRTW8YuUX6J/kRWXqYWZPzjyql5NblDdwJs
         ra3haBTSHmjT33HYkRrC4c3H96WFvWsjPSbA+zyXzybi+R+VYSXSJn89pdsHqdAOBh5U
         GPVZQ8iSCZBWNe1JOSMSAOY7ZXIrinbOI+emjqOYjQQXZHoBNMeLkFikQpYriTo1yB+T
         5pTsYgJQGvaHlmlKv4DKqrD+JAcjLG3fL2eNdC+GVsKYpw0Nm4oUA5SkmCFw+yyRk5CK
         ATtDMEL582xSfTXi0wnK4m20E6wWNYhGUojB0sdOz20K4bA3R3AqWvAwmCZjj0cht4R5
         jQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765697673; x=1766302473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRn1RbbVVYNiiCpJThw73EOp5BTjJZAt0+REstZc+hw=;
        b=p0FR2g/T7X+yZ5AwXo5nX3Whj/PO7MaodSMv4r6uYSh8OdWbhI+1d6v4l7tTOBXRH3
         XF3aQI0fwC+Qum73cR78TTom8rIQfxcmZCixqXS7E64Ime/KeVnKDqm9uJHNYqO/Pb4t
         XuSMCcgPDijv0xi8K5qYC6CsWsIDNs+u98j4X49gwUDEx0OQihMBtlKq4TaVFeqqGpKQ
         6iOPzuENhDOv7zAh2+f8E2HGkKefx7on9PS3HRny4zmFqj/VrRb52mO+p+ru1cFuWLFw
         mWxhE+hBztbInY7bU8iqI1tpVm5JTA3qEwRNNeYkuTXmonvExL/O5Hk4iPKojoe9F+pF
         9I3A==
X-Forwarded-Encrypted: i=1; AJvYcCX1Jcd5DxqZc8r5P/SANNwhzbg7GcCc0hZgeSis7GrKOHCmjVEdd/AKy+Zrn6+rocjZY/Px+Yu06JxfKAoUBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8892uVcGqW7jBUJJMe98bYGsIZjQ2bY/rTNR/Jd26Ug1agYEw
	jlXbIQkAWgv2Rk30H8zjy7mYNJBrf9Mp6g9vGCa4IMPreF4SaxM8wqA6yWj9yUHWJXs=
X-Gm-Gg: AY/fxX4ExwCocfPeRYSnOgM9gdfnUq/Ijvy4VRHXK2mGeD3njErRVV1uaHTtVtn9kKR
	G0XgBdMF6XDSpPeenb5+FRB4uv/axb5STlOA3Ujcq9OjIWdplOMd2QmZanMofdNcoY9EZe/smGO
	4yz9lptnUmgd+KQQk45/QBZyMPtM/NRHsmj2SgiUuj59O+O9fJ8etrvKgo9+piKj8UNbGarpVSQ
	V6mCYLK3tA3SQwDmTzNXwMzBQPYDih3m0Q3AX/U3TOqtpuqHXvinvjTiObet1PnxnCxBFt6SR+J
	uxwzPueoA32+7en0Pgy6CtsNZQy4S+1be67CUSl7Q4A1UAbB8OdlNrBwwU/cLeAK98Qm1RDC8gY
	2fuUOfb18ntKooEfL6RtVbVsPyZ7yxbxaQLw7fBNiBQhhsDtpqVVJ0hx6HD606B2Dar5tGIQk2+
	R/qBFaXVtPZ6gaFqfVJ/WVHTbpNlSlYfWS8iIDPp/qZpB/pRm9++hFn1NoaT1D2sQ0ow==
X-Google-Smtp-Source: AGHT+IHAPA/EnNsgzP0HIlYsXfOj/q3Xg73QhloxXAO45aDmZUzS7OcDiFy9ELh/3UzA7ijVRiMldg==
X-Received: by 2002:a05:701b:2704:b0:11a:61ef:8491 with SMTP id a92af1059eb24-11f34ac1593mr4017789c88.3.1765697673068;
        Sat, 13 Dec 2025 23:34:33 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e1bb2f4sm32890480c88.3.2025.12.13.23.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Dec 2025 23:34:32 -0800 (PST)
Message-ID: <66cba90e-c9b1-4356-a021-e8beeff0b88d@gmail.com>
Date: Sat, 13 Dec 2025 23:34:31 -0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <CANiq72kYjNrvyjVs0FOFvrzUf7QYe8i+NpBS6bMEzX8uJbwB+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/13/25 22:06, Miguel Ojeda wrote:
> On Sun, Dec 14, 2025 at 12:54 AM Rudraksha Gupta <guptarud@gmail.com> wrote:
>> - The kernel boots and outputs via UART when I build the kernel with the
>> following:
>>
>> make LLVM=1 ARCH="$arm" CC="${CC:-gcc}"
>>
>> - The kernel doesn't boot and there is no output via UART when I build
>> the kernel with the following:
>>
>> make LLVM=1 ARCH="$arm"
>>
>> The only difference being: CC="${CC:-gcc}". Is this expected?
> It depends on what that resolves to, i.e. your environment etc., i.e.
> that is resolved before Kbuild is called.

Sorry about that, I should've specified in the original email. The CC 
resolves to armv7-alpine-linux-musleabihf-gcc.

When both LLVM=1 and the CC=gcc are used, I can insmod the sample rust 
modules just fine. However, if I only use LLVM=1, my phone doesn't 
output anything over UART, and I assume that it fails to boot. 
Interestingly enough, if I just specify LLVM=1 (with no CC=gcc), and 
remove the rust related configs from the pmos.config fragment, then my 
phone boots and I can see logs over UART.


> The normal way of calling would be the latter anyway -- with the
> former you are setting a custom `CC` (either whatever you have there
> or the `gcc` default). By default, `LLVM=1` means `CC=clang`.
>
> So it could be that you are using a completely different compiler
> (even Clang vs. GCC, or different versions, and so on). Hard to say.
> And depending on that, you may end up with a very different kernel
> image. Even substantial Kconfig options may get changed etc.
>
> I would suggest comparing the kernel configuration of those two ways
> (attaching them here could also be nice to see what compilers you are
> using and so on).

postmarketOS uses kernel config fragments and tracks the latest linux-next:

- 
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/devices.config

- 
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/pmos.config

- build recipe: 
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/blob/master/device/testing/linux-next/APKBUILD


The only thing that changed was whether CC=gcc was specified or not:

https://gitlab.postmarketos.org/postmarketOS/pmaports/-/commit/b9102ac5718b8d18acb6801a62e1cd4cc7edc0cb

> Cc'ing Kbuild too so that they are in the loop.
>
> I hope that helps.

Thanks for your help! Always appreciate your presence. :)


> Cheers,
> Miguel
