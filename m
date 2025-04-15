Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BBE27F74F
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708456; cv=none; b=AjhOw+c00gCLAknClvjljvEpYf06Rl+zJdXgFD+Eh2/Z3yqwOZeN/s0NgnkQNv5pO4FyV5oxVZvUmWesJdIUwxRnOKXY4vbaHNU9uP9+LelYUi/bA2u35C0tpeEHXyo+0Y/sWdQ3CfUtDImQ+J64hC9XY3gE4oiV0gFzkiIoW4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708456; c=relaxed/simple;
	bh=CusBDmFNUwyFXOPB2iTJoS8EwEw4JiUtaOKFml3GGEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=amK3tBuqVneHL6/9wnkNUM5n4HgbzTD3IECyxcZq99+Vj+ykGHtIbO27cSYOJwjSfSJhE/0uIn3t1c9i1BEHWjG5sF6P1q2ann2NP9k3QSe35A3nWweCu7C7N8kd6fL+M9I549bgv73ByzanHTMinesqMqYKq/ZjmT1wuhH87V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hV909Nht; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hV909Nht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744708452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JShcW0NlflHeSova8LlPPG5Fg8EFvz9JNx36jxV1izk=;
	b=hV909NhttgNFxlmUgEL0P9s7tqh+sHD3hLjvN033T6h7tiQRat5l01JzrmXJGnSnwnuWhd
	kU6PBwX/SSvTvXAHwnD0XjDyeS5HDg4ebkpiGWFDUrf8xwqOLcrYbpcFS++pNVZANmAMz9
	zLY2atdE+dwffw0vtDqWwqgMwcyEaaE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-AHg9pdpDNXmWvnCWK86E6Q-1; Tue, 15 Apr 2025 05:14:11 -0400
X-MC-Unique: AHg9pdpDNXmWvnCWK86E6Q-1
X-Mimecast-MFC-AGG-ID: AHg9pdpDNXmWvnCWK86E6Q_1744708450
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so42464145e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 02:14:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708450; x=1745313250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JShcW0NlflHeSova8LlPPG5Fg8EFvz9JNx36jxV1izk=;
        b=OlO+C3N2R5E/Eiol3jNx1frzlZ0BURznlO0hv69/d4ot+h2M3BZ30Y/3ZpHCqXcxmx
         0ENtRAGxlrvK2LzXaMkYOvMkCz/v7MvtPbIku43LyfNFywSbj96mF4MikgQn/p0x6UQK
         4TWdahUSSf+1Vie5Tt02UPMW4Z/n9O9LMJfUb5coNEdQ7r88rG4QjGw4cuVasm6yuAJI
         3kYIvCWFK2N9hWnO0Mw6AmrKzPQvhC5+RwM0qDlH8pkunggyDS9cja+c6p+0H3zSnd20
         68l2blx+4x5c9/lQnow1vIQHIavcK8A4SBA+2SJu4CeFhzuRsCOppfx8Vxp29ek9yrB2
         34CA==
X-Forwarded-Encrypted: i=1; AJvYcCUC3Jt0mQlraqcSuIy/UKngrcKJtiFtq17vJ29t5leAOWsxfn/HXTmIwWPGiU6RolDri43PtW7UZWtlJ52hfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxL2Xeqmz65mrPqeS0dKEzO3oPiHDn3nrwDm3l+unYp5WKhD4Ac
	86OLZWTSLHwo0l9JPBU5Pl0bF9unPrHIUul2MX0WHNWNdNaubikubHjz5AiPuXroekptkcU2lkC
	k8d/cTZKQBTdyqLSJze05UOXmYRQ8WVxEo03Lz5iQuVxWKycswq4Lm50BaDuzklP8
X-Gm-Gg: ASbGncvr/0Nc7QxRt6sf7tn4Cs3WxvdiDinVsvF3BJmvxCIBxGSfPbP6zaehpWmcQss
	z2bLGUwlwh4Wo2+ksmo1Of4wBbzgvbcJKIHw6FX4UeL6k1YZjuaOpt7niYwV/fAPCHV4HzxgtUs
	1jU7sOIFir6R3oXoK6eBOaCM0DRaP9oLjs1Ayrv/vZySda1aQOWjydCg0c5AaVEHRp6qmR0f6bW
	qwSZB+ZWf0dxKX9yg8M8uFX/Ts2KW5iZAlcAzHD/KKjCvUWqRs3T1HdEMOtDWNqSi6Bz7iyw8GV
	7Wufs15IPyUnE1lR6s6HHOsEXlL0fx1jUJW4XN8w2035J+bESIY=
X-Received: by 2002:a05:600c:a0b:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43f3a94c707mr121539035e9.11.1744708449846;
        Tue, 15 Apr 2025 02:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IER2bLz18Dd2QrnXzcffJp2/++mALwClLl9NZTgUP+3ai5VKvRqmsyvG3bjrFO1ABqJnqpLWw==
X-Received: by 2002:a05:600c:a0b:b0:43c:fceb:91f with SMTP id 5b1f17b1804b1-43f3a94c707mr121538555e9.11.1744708449206;
        Tue, 15 Apr 2025 02:14:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c817dsm199454825e9.23.2025.04.15.02.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:14:08 -0700 (PDT)
Message-ID: <1a03b57c-1b5f-405a-a22a-89cc82138c55@redhat.com>
Date: Tue, 15 Apr 2025 11:14:02 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linus Walleij <linus.walleij@linaro.org>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
 <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
 <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <Z_1mEHnzYjhz0Ldz@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0FApcWHwCNIoteFDByflOZS0r8Ym0UTbP0ufxNur-gI_1744708450
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/04/2025 21:46, Russell King (Oracle) wrote:
> On Mon, Apr 14, 2025 at 09:21:42PM +0200, Christian Schrefl wrote:
>> Hi Miguel,
>>
>> On 14.04.25 8:14 PM, Miguel Ojeda wrote:
>>> Hi Jocelyn, Christian,
>>>
>>> I started build-testing arm 32-bit within my other usual routine
>>> tests, and I hit:
>>>
>>>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>      >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
>>>      >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
>>> as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>
>>> which comes from both these `u64` by `u64`:
>>>
>>>      let out = (self.carry / pow) as u16;
>>>      self.carry = self.carry % pow;
>>>
>>> Christian: I guess we can offer a set of `div64` functions using the C
>>> ones, at least for the time being, and eventually wire the actual
>>> operator with some support from upstream Rust. Or do you have
>>> something else in mind? (i.e. I think you have been discussing
>>> intrinsics lately)
>>
>> I think using the C implementations is fine. Not sure how much the
>> FFI is going to matter for performance, but it should be rare enough
>> that is shouldn't matter (and hopefully we will get cross lang LTO
>> or something similar at some point).
>>
>> We could also just implement the intrinsic(s) ourselves, but then
>> the u64 divisions would be implicit which is probably undesired.
>> We could also rename the intrinsics so they are only usable from
>> specific crates.
>>
>> I think we need the opinion of the some arm people here.
>>
>> CC Russell King and Linus Walleij.
> 
> The kernel has had the general position that u64 by u64 division is
> silly and isn't supported. Several 32-bit architectures including
> 32-bit ARM don't support it.
> 

For this case, the u64 divisor "pow" is a power of 10, so can have only 
a limited number of values. (17, and 9 of them can be used as u32).
Normally when the divisor is known at build time the compiler can 
replace the division by a multiplication and some bit shift.

so for 32bits machine, the match can be rewritten with constants, a bit 
like this:

1..9 => {
      let out = (self.carry / u32::pow(10, self.carry_len));

10 => {
      let out = (self.carry / 10_000_000_000);
       ...
}

11 => {
      let out = (self.carry / 100_000_000_000);
     ...
}

Would that fix this problem?

Best Regards,

-- 

Jocelyn

