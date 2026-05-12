Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC3A30C61F
	for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603450; cv=none; b=gMnf+STQLs0Inj9Ta5dulAf5+oJDjFj/TRjM3J3CYtvT/eyXD6629LtOMSPc1jAjBTZR5YM3Dr02zBUm1nqc9WUgz0ea3apJjlPdpxg4kUD+eAE0M/e5kIObTBz8ZdgW14UMnKhHQXypP5TXCyND+KkZjJpc8AkI7jhzot7Uo0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603450; c=relaxed/simple;
	bh=E45NsLo+6kvqVV/KKb2dKqlO/74CweDavS593hXMbP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJ50Po9kYleYvKdamc0s5QhsYcjs/BGxLY42shoiV4+XaykN2omgHA7AZLKQaDtMuPBJ0cao01ZPzhGJaJHgEEpn2/rzyimjaOfrIMhc5pVziQ2RoigLKuNF1RYm4+u+iWHi7hZcZMughw5t7hgY7EC8ztuvfZ4eZFjcJFupTTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bz9IPp9t; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bz9IPp9t"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ff5472f263so1754881eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 12 May 2026 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778603448; x=1779208248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=w5cj7voQXxv1O1JhfJ17HzUJkc0EkMptUyjXmf+q4tU=;
        b=bz9IPp9tcG+7gspPDbmHedT5wC0OUBTMsFbB/Q5w/6G9uZUul1daO7jDk9FskcypsC
         TcZCFLSoK8/38ZXKUpm0YxD/L3Fi8H8ddE57PCaBLIG4dSQdOgbZkzL2vR8w13X1/ziD
         PycjIZptd2+HsiN+kPXwjUBee0oss3tDzT/GsM3lsbiNhYo0LL7qHNnQiibUxs894p/H
         eqI6oDCjEGxzyMa02lmRpTe8kXFKat58wJ7bhve0xZtP5qxUM+JDwjnhDzduwo9vCY6h
         Wb9Wo84vim5pp9Wd7Nsm5rC2yOAAidlV1ChfPvsxTgVeP2ED/r234S9pH3QZqQ69jyKv
         DV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778603448; x=1779208248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5cj7voQXxv1O1JhfJ17HzUJkc0EkMptUyjXmf+q4tU=;
        b=b+RYdU4vyYwKYXDTRfnBl+Js08jDyfXqEuGfnalwMksEQfTy/gH6MCBl7+mpMMO800
         DK81Ja6eRGcf+tvGcDT5ftDGzQNCkyYyWRwhRv1NqZLJFM4J35N4CaPM2SvYy8VQhTCK
         enTDEB6ZL0YRlb8ieyJlKG0A/zfQYi31Ftnh1V4R9RjBgKEg6Fe5N5MHgOoha5c80aws
         pvIgN+uk9TB9IRfVbYC/WklF7L4WoE8vqIoIWykvNf9DsrrAkd0ueCvE2LT4lk5lhNYc
         c6aa+Gi7nQxOtE32BgVNL3hEIuE6lqcUGrftE8IiX6VSnwjHNkIsREtiHe2E5f9bGoK4
         6hXw==
X-Forwarded-Encrypted: i=1; AFNElJ9bVBzq8I3SiBEFipEIRdwKMH60ABJCcPrrqUj8OVl9me401PAmFJI4ek3/jDON8hE4kw9wMqo95FOedAE4Rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLFy+FlHm7cJY1YOleCCezvpVIcnNjCqdjz65Qn4irwQDBEdMW
	0b8rKXRC939ZBVMQlJ68dCxEGr+FkWcXEh9nxTGALl9ivNalS5h6+iQ1
X-Gm-Gg: Acq92OEJ4JX2s5I0wPhfxio0pbr4ZXO7MnDIc4n1AKTxeVdUDOvTX+VS2vYd1nm3UPo
	rvx+39wQOx3nldYq3IBjGuWs6zTyJfxOz+MKfV7ve5qLORNTwKrSGhssLxUrzjJ7GSGX2WVs1dq
	ZLbxcmgR14oCJs3VcZqmg7mgd1y4rS3uFseRmSXvspwlYMPy48+OQIb5JNdjj1Y3Sr9e7gHygLW
	cMlzuSTRim/Y3lI8iA9Jt1gF0Q4ifct8hxqZBjI9K7hGRJY5lSC7rqkGSbgjYyovmgt2Z28sUzU
	5WAhOfpXi0nUu/5Oy64h3wS43sYfaJn2Gjmj7uoizjajIEG56fNAv6I7WWGSne1T9gHCufSaw+3
	uOJQGDAfnvXv+amcXyCAqHO5/vgxVnLH4Wjq7dg6xf8Wx7FSmMxak7hTxHfMawj22nCBwoX5ei/
	M7ccDnsp906deC1uBY/3westvUTZla/bbdbxf81zQ4sea9R64GNZjbJTnZv5a/kvYMAtrQr382y
	O2LB/doPtw=
X-Received: by 2002:a05:7300:214f:b0:2ea:cd38:f921 with SMTP id 5a478bee46e88-2ffd7ce16bdmr2132706eec.26.1778603447566;
        Tue, 12 May 2026 09:30:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8884752ccsm17932722eec.17.2026.05.12.09.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 09:30:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9c2fa543-525a-4e43-9f73-7caf13b98039@roeck-us.net>
Date: Tue, 12 May 2026 09:30:45 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] rust: hwmon: add basic hwmon abstractions
To: Donjuanplatinum <donplat@barrensea.org>, ojeda@kernel.org
Cc: boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, rust-for-linux@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512155747.10136-1-donplat@barrensea.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260512155747.10136-1-donplat@barrensea.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/12/26 08:57, Donjuanplatinum wrote:
> Add a minimal Rust abstraction for the Hardware Monitoring (hwmon)
> subsystem.
> 
> Currently, this abstraction supports a Minimum Viable Product (MVP) scope:
> registering a single temperature sensor with the read-only `temp1_input`
> attribute. Support for multi-channel, additional sensor types, and
> writable attributes is deferred to future patches to keep this initial
> foundation reviewable.
> 
> The primary architectural challenge in wrapping hwmon is initializing
> `struct hwmon_chip_info`, which requires stable, self-referential
> pointers to nested NULL-terminated arrays. Instead of relying on complex
> macro generation for static allocation, this implementation leverages
> a single heap allocation (`KBox`). It safely wires the self-referential
> raw pointers using unaliased `&raw mut` during the allocation's
> exclusive ownership phase, and then securely seals it by pinning
> (`Pin::new_unchecked`).
> 
> For resource management, this implementation uses standard Rust RAII
> (calling `hwmon_device_unregister` in `Drop`) rather than `devm_`
> variants, ensuring natural drop ordering and avoiding complex C-side
> trampolines for generic types.
> 
> Signed-off-by: Donjuanplatinum <donplat@barrensea.org>

Sorry, rust support in the hardware monitoring subsystem will have to wait
for someone else to pick up maintainership.

Guenter

