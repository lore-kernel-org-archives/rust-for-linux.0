Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642EC18A934
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Oct 2024 19:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728243003; cv=none; b=XLo7n4S8nBjgtBFM0JXk6FHeCWu34ni8ZBMNXHhmUFsOhEvSxfmj1uAHpMMWB1bav49hKCyKTu7s8fE6nBIUR9E7n0jqqwiwTSGzGiRp8y5T0eTNd283Uhury0NWt9UenRNrpe1KF20r04szV2q2wncQJYjiORjGQ0W/r8ZbZUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728243003; c=relaxed/simple;
	bh=2gqcOflS/WCPg0Z5NAd3MeWor4EP0lLfiol6WGMf2Eg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmPZrOGjX/MaB0z3uVnL9CIuffvzX/kULgtjXkPi53KQxeLFlT+yVWgj+j7Pv7FMba/ljR3SKIJU7DHpAJGiOXmq6p8swtoH2vkxQy92Z4XaeUA20U3oGOEX66k883aAqRzaVKc0yIa749MFBr1AsMIvNYMC57bO+aAMEIvh9Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVhTFPI4; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVhTFPI4"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-84e844f7a18so934889241.1
        for <rust-for-linux@vger.kernel.org>; Sun, 06 Oct 2024 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728243001; x=1728847801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eagM7QfBTy+GDzcz3KTguuyp/U5NDJngk6EZaBkN/tA=;
        b=BVhTFPI4FlUEaW5kaIgc/t+faCarGCZ9EI2y7tIbyla40jo1r/Pzh6pXbPgLaCl6FB
         UEifSR9EkMYEwqEJ3afcydLV1blQ7FHEeFe4o14z0/KabSDKI1tKGJVC9VwPdsuP41gW
         gutRCrV1U9/GOTfK/crLdAmquslDLhkkSZ4XtOVYdFPInAZm/HSbUXR4X7DuPJxk6cHT
         gNmqyLmufbY+RFYAYyScgpy5UfZ9qkfR19Q7gFttp9G0IwOkPJSMsDIx4kXihsiGaYcR
         zoigavGNlqLuVTA5plQMcYBVV1xAOPkd9my64pLDjkCqS/dSP2Pboe43TdZwHwRQIXIP
         uIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728243001; x=1728847801;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eagM7QfBTy+GDzcz3KTguuyp/U5NDJngk6EZaBkN/tA=;
        b=hyqw2K2bfr9FOutdngD3Hzp355hXZNCM0Fi7kyk5SGs3FIDJdPWsVVcHSg0kjkal6s
         EIjb3wOH3l8gmR7/p2vY8kP2bmUxaBGIPw6/5gc7ilkfo7OHk9SGviWfrpEg4pU1ldIh
         13D4M9JaHFppVffPUA/aUyKOlyEOvbvVnSC0l/ckf6fyVnAmGSkYY94hChmQFnGc2+Ms
         HXOv4V3P4Yf2kHrBq6bkNXAxsdPOenKNzjhrLQUL6R5QUl02HD+HmRvdHHOEBaWuov1R
         k+DtQD6LXD4fr9J/6w74azNyQk3/y7Tj1BCHZ1zU5FUm+76GiMSlTsVlV9gGNElgEAC4
         1HbA==
X-Forwarded-Encrypted: i=1; AJvYcCXhf2GazhkCVylyxR1w4R0S/J4pssiLImIlztZm5xfWDJL/6c9hzx8+YnmIS/7IHhTy8rf80RlUh8WCQ/SvLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMTh5hV6Qr4R7UVa3Qs0vrjkqO9K6VWzssMwOQaj/9uEJ3/Ak3
	IjdFND7FQ4RaZoVM5X0GPUE58U/NvbgrwynQpLjLVB2jPtzGn0bO
X-Google-Smtp-Source: AGHT+IGpTKojvmmsj48cQ2bA9XgjYBqBOOxr39NkAJbp6/Nzoz4RUdEwpv0D0L7wvRpPaYAGUydGaA==
X-Received: by 2002:a05:6102:41a6:b0:4a3:a6f6:57d5 with SMTP id ada2fe7eead31-4a405766a1fmr6548611137.12.1728243001135;
        Sun, 06 Oct 2024 12:30:01 -0700 (PDT)
Received: from [192.168.1.102] ([152.206.141.234])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84f5c8b85b3sm732355241.27.2024.10.06.12.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 12:30:00 -0700 (PDT)
Message-ID: <d39bd39d-510e-4a4a-b883-e01e09583fe0@gmail.com>
Date: Sun, 6 Oct 2024 15:29:55 -0400
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] rust: Move unfit code out of `rust/kernel/types.rs`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org
References: <20240918225115.2309224-1-aliet.exposito@gmail.com>
 <CANiq72keixz_kVpUQMEFQcgewwrjcA_Od3E5-K9jF_UYFrg2aQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Aliet_Exp=C3=B3sito?= <aliet.exposito@gmail.com>
Autocrypt: addr=aliet.exposito@gmail.com; keydata=
 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
In-Reply-To: <CANiq72keixz_kVpUQMEFQcgewwrjcA_Od3E5-K9jF_UYFrg2aQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/10/24 15:48, Miguel Ojeda wrote:
> On Thu, Sep 19, 2024 at 12:51 AM Aliet Exposito Garcia
> <aliet.exposito@gmail.com> wrote:
>> Hello all,
>> These are the patches for a good first issue that Benno Lossin oppened
>> on https://github.com/Rust-for-Linux/linux/issues/1117
>> According to the issue description, the file `rust/kernel/types.rs` is a
>> rather non-descriptive, general file that contains code that might be
>> better suited elsewhere:
>>   - `ARef<T>` and `AlwaysRefCounted` should be in `rust/kernel/sync/aref.rs`
>>   - The `FromBytes` and `AsBytes` traits and implementations should be in
>>      `rust/kernel/transmute.rs`
> Applied to `rust-next` -- thanks everyone!
>
>      [ Rebased on top of the lints series and slightly reworded. - Miguel ]
>
>      [ Rebased on top of the lints series, slightly reworded and removed
>        unneeded `use AlwaysRefCounted` in example. - Miguel ]
>
> Aliet: please double-check that you are happy with the rebase.

Hello Miguel, yes, I have double-checked and I am happy with the rebase.


> Cheers,
> Miguel


I want to continue studying Rust so that little by little I can help in 
the Rust-for-Linux subsystem.


Thank you very much to everyone; you have an excellent community, very 
welcoming to beginners.

Best regards,

Aliet

