Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC17C22D4DE
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Sep 2025 18:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758997260; cv=none; b=a7P5uZp7VPXmbqTniiL7Fp5MHreQpOw7rsSbB54UE4P3EsTLVF+rb/gXd8wYJCC7tsFS6y2aZ8jhVV1fAWbBhWzEj7Rprori3rKKQrurkWqOI39QS2yVgJqbLsZhFB3vKtOhZB6DWHNIMKDIZMsyhdN4smI59/d8UiCJOcDGPlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758997260; c=relaxed/simple;
	bh=ZZsUqsXlT+NxuLRa0wHvGFSehTMZVHpC3xtckn2HDG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVuFzwj6igmakAa1QPpk5Ep4GHiGngMbUR2p9wJ9wZzErUoYlIjZT/U1BktmsrxnJKHiyWmvLVV8DoX121LG3OVQ1aZP0ZlrxDOCzlBjMP0hJGORKe6b+RwSlEaZIA/2kqSUtHWcf1CTMHGuOmtYwtfNtw1GdW+hn2iOkOcmfWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh8CVj6V; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh8CVj6V"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so1580549f8f.1
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Sep 2025 11:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758997257; x=1759602057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiTGFZwhz927PRv0PGaGJg7Lawc0Y6HmusWqcFMWBM4=;
        b=jh8CVj6VciDNgdMg7TjOEkX77wode/Z6L/VUCMS9qMBqLQqEqR1MR67B/yEwzE0m4y
         UEmErRoyQH6Eir6z3AW69/0d6/BflBpErrmO5OeF3He5UdKYBc5KJF2rEGcbwudYgjGO
         e07npljPffC59CUgc48OdnPdW0gInNF7XFQ2vgbyV1xvv7TcOOURT0x6aSNHtf9hinXV
         e++HYZqc9S8sMBCUcwU5JpFb2oVwaWIWt77lrUV7V37Dwktnoa61Unlsz0yjNpdYSXd7
         5O6MEBBZaS4MduWYQbuvKs2icRwJ+xwcKCYKHrLKiCqapEnqQAr5c75SPqhFl146xHRM
         2lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758997257; x=1759602057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UiTGFZwhz927PRv0PGaGJg7Lawc0Y6HmusWqcFMWBM4=;
        b=JmvkM3E5rx+OuK2qvLCrMH6x9Hkt0iODsNOBQUfQK2d9Eza1cIFPnX+5Tf5A9CkDrR
         +fe1sxcfraO0FUdCSOZqu6pSkYLGSa/YKPvtw6MiX3+a/dAUQl0q86135w7ighG/LKjl
         DgYG7DaSU9exnRN4+VZimaSvSfcQyVDnqzwEPMMXarzhOl29E73rrctr2lggfB3rzOfb
         rBnuDX4RbVReksgpa8rpQ8Ghf3VSuj2x115BtsIZG2bRidr3kvXCfgOinlEoOkxesn8i
         GH74U+l3PewsFNK3budD0dph6U0fQpdXZbJ76Ov31Ln1gdxGE3FMZ+XQ1vXuN63aBAy7
         Nwtg==
X-Forwarded-Encrypted: i=1; AJvYcCVatilCF93SmhvLyo7ZaDNPSy0FLILZu+RV9fjiO8cIT3Gz8oivHC40JVqAAE+xdy54kGrcQL4RiO0ZxEivCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKrqfBW9208tqWnoT5e7V5an1UvQhgDwBsMVuZo+RyQwdhiV/l
	B5JrTtNXfbMQlMCWdUNfnNGCjg0p7+BZvRARqANdazH83sP5hDZFAZtc
X-Gm-Gg: ASbGncui/5yPiI9cBssav2Eo7Lr0KPkGy97BFgsnhuYzKZYeyjC5tELFgM1HrNTJmtK
	fCwrRexwuiICRqc8wG7Gk3GZ6cFmcIPenFk42pjP0sIOEOwcdCbrV1PM2ny4KytryBklpqT03UT
	7WQgTm4+htjUECBj35qgrvnTjp5ezZNksT7Weo8nDDOG8Alk4xkRomzJ4SICxAIT7+zqA3Y4BBH
	6JYtM/7Vt73DL4Tu4kpLLN3nLbvWEQ700lTkwStvn2mnwvZzrH/JzYrVQG4gbA6ONpL8a0DNHL6
	JiSzVxTTIqsk976+4z2bZPa8VKRmoRuv0o52ngnRHutVI+kCBVoTKt3FtMVW3bWlFybUXf37iiC
	KIYCBGV5naOmjpxmZyKrCywZ8mhBk6wYuwMXJ1XiBQWh5K6MIG87PfJK4KilKrM8tx57M62xrkg
	SmBdebdqFS8PAqLqoqxjk=
X-Google-Smtp-Source: AGHT+IEtiFdCtMagiN2PlJIlHgX907vHybIZWjwyy/+2hiQWsMBj67930e8VQK2WHaA903g/oabW4w==
X-Received: by 2002:a05:6000:40df:b0:3ea:c893:95a7 with SMTP id ffacd0b85a97d-40e4adce88amr9868281f8f.31.1758997256826;
        Sat, 27 Sep 2025 11:20:56 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:a8dc:c580:efa:e675? ([2a02:c7c:8b21:7400:a8dc:c580:efa:e675])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5603356sm11601993f8f.30.2025.09.27.11.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 11:20:56 -0700 (PDT)
Message-ID: <10637103-7e15-406a-8e9c-0eee3c5c4922@gmail.com>
Date: Sat, 27 Sep 2025 19:20:52 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] samples: rust: add Rust I2C sample driver
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
References: <20250911154717.96637-1-igor.korotin.linux@gmail.com>
 <20250911155048.97364-1-igor.korotin.linux@gmail.com>
 <DCQ9K980YX1W.HZIQI6S5MST9@kernel.org>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <DCQ9K980YX1W.HZIQI6S5MST9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Danilo

On 9/11/2025 9:46 PM, Danilo Krummrich wrote:
> On Thu Sep 11, 2025 at 5:50 PM CEST, Igor Korotin wrote:
>> +// NOTE: The code below is expanded macro module_i2c_driver. It is not used here
>> +//       because we need to manually create an I2C client in `init()`. The macro
>> +//       hides `init()`, so to demo client creation on adapter SAMPLE_I2C_ADAPTER_INDEX
>> +//       we expand it by hand.
>> +type Ops<T> = kernel::i2c::Adapter<T>;
> 
> Not a huge fan of this type alias, but up to you. :)

I literally just unwrapped module_driver! macro to get to the init 
function.
This type was part of that macro. I do not see it necessary, so I'll 
remove it
in the next drop.
  >> +
>> +                i2c::Registration::new(adapter.as_ref(), &BOARD_INFO)
> 
> Does i2c_new_client_device() grab a reference count of the adapter? If not, you
> have to store an ARef<I2cAdapter> within your i2c::Registration as well.

Well, as far as I traced the C code, `adapter->dev` is a 
`client->dev->parent`. Inside of the i2c_new_client_device the new 
created client device is being registered and as part of this 
registration device's parent reference count is being incremented.

A big thanks for the review and comments.

Regards
Igor
