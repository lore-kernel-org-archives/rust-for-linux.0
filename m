Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746D635975
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 15:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950981; cv=none; b=o82vDy3siY/O62G38so425gwXzCh1ZrzQFwAoTMG68C02k2OaA1/3tqFblxGk3dU5WRoyFOyB0Dqnk2H2pj9EAPTQvYEM5ifs42YJszmEKkS/GgdU51thw7QMem0fQlJEK8s75i8bklXkF53Z7llbSST+bem+5e9kTHniH3iGTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950981; c=relaxed/simple;
	bh=9znENFBWpJKE1Q1Cxka1I7osJnjGaAfYOcZFp5dZK0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJQUnzxKwBo6HZjFjQ1GzNTH9PhOte1WSdocX0Z0HJnv8iAYpinD60wrA2A2MqMvFDn6J2sa3HddOy8VUhF1pIOkMBYnKVNbOuNg48zKS1Wfv/fbPU01PpQeldNVlFBDUbuyBy+ge1smiL71vCTKVN93vsHBW3Xf1savzzwG7hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RkafChEE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RkafChEE"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so11593355e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 08:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750950978; x=1751555778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYbv5E+bbRXfoXv2F6AaS7viJ98wzUfV0UPEECnLnoo=;
        b=RkafChEEmq2eVPwk0VS5Vxsb3jrFv+D0FEDyU0t0F2qZMqX+UAj8h881DobHqErck6
         1zUK+2F+xOKvVfJ4Eawipj/Em8iS7PyrY01v4TwOW20rdv2I2uqjZVVn1/+EXI6QbiPp
         UgfiA17VMuJ1XdDHcjL0cQsDWTbDHIhWynkDfulrgcFtaEZxKLDkuYQkXOoktpVffOni
         Ad9X3QZZdVNijKlFPl6e+R9kP2uHSQD6IBQ1k9KduRiA7DLxiER3SRLYam7DRmbGwA9m
         TVfy0uFvzvf6SiNjPKo4xptV6GALinZ0R4ha0SgTzQzTB55LVQkhHyHaR2jdKyPEHKCn
         XLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950978; x=1751555778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYbv5E+bbRXfoXv2F6AaS7viJ98wzUfV0UPEECnLnoo=;
        b=H9OXgPtj2sdA6pUx1YKaAGTVa2gjVvAJqm+gKOwiyoVkm49Im6qypbD8KHbeOqVPhp
         NaO/djDTHE8LnohjfWQ3piYna2XdZ6brdgyc/y3PlNkoVlWA2pjYf+qCDn/Fu815abYm
         1J055DgmvdE5v54aZdDkEzobbgvM6Y9uT2odwi4QccCKQeIMmOShlo5jJKyVnzOAW6CN
         03g3KoyGoTxDUyVlqI0Kkqd3CMpzn/r330Np/HnxvUTAAQjztkolnRwJxdAPh91Wkqyr
         kGTCotI5daeviXlmPhJ60IVW0ETu+C19V+hDAyMoySCMclljoOHXvq+LcdIghzgzlrAk
         nbCA==
X-Forwarded-Encrypted: i=1; AJvYcCUkYXmXPI94O/utBhAPpmmSmTG8XmRB/a5YiYEkVsL6aC3fhHMZYG65BO3PHPFzsf9hmDrjhqLkRwW+IQDpJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlDkjdsX1Xa2jG6JSmwBXbC7ym6ragct9NgavlEJ9oR1XZDOYi
	2itGPSOVhr15gWZoz4rXLLmqk3wnwH6wnqpr9RNhFKrXQMDt6RRNeiBK
X-Gm-Gg: ASbGncvHTnXR7P3QuLwM3LzAZBnSUOctNFTTAwXfJwrrR2Q3FFZLpGw8E2lNL6qzC0J
	KZjs0FJXnQp5ecKVFidvt7eO4R+K2CLz7VLB4TAOSmxrljn9k1+xRwN6tLOBOOMeOgsyDBvVr0i
	Ht136h6+a3erK/H2xYl7tU4AyD5UpZ1vFAowCEhlhOMB9aOyPef83SjWN/ePe0F2kNHX5IHE3HN
	/MUj/66c7u7jvlPYf8tbBB58L88qVyXS0zUw8S/LQLjVpMcQYJIolVbGPDD3ySdlSWJl1/PZtu+
	x9fQdW2AkOOZCpac9oL2L0c/hmuhCcD922UVwg1HDcAtOZs0yUzMqT1ZIC+Y/+oNtFMkdGs/rcr
	j/6NwqdONpXdsCxlgWJMVeGHxLE/3xBvyFYa2FvKrmv82g0KJuFeOUUdr+PAU84KSq2jAV16qP3
	4Fh6AOlUMZRKXpTgeTOybuQYzpsUjaqvNJe6PrRq5cJ8iF6FsbuhuUzuZU
X-Google-Smtp-Source: AGHT+IHkN6kst/2U0cI5ffj5ZypcrsRm6UjSAT4J4Pq42ykGcoxP+OW0hFReQqb4pCc9CMehOs7PNw==
X-Received: by 2002:a05:600c:5306:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-45381aaa03fmr73036515e9.8.1750950977009;
        Thu, 26 Jun 2025 08:16:17 -0700 (PDT)
Received: from ?IPV6:2a02:8388:e103:2700:ebc0:27a3:cde8:9846? (2a02-8388-e103-2700-ebc0-27a3-cde8-9846.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:ebc0:27a3:cde8:9846])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3a72dasm22725015e9.16.2025.06.26.08.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 08:16:16 -0700 (PDT)
Message-ID: <5f01c181-515e-4cff-bf8a-81c620886cd2@gmail.com>
Date: Thu, 26 Jun 2025 17:16:15 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Simona Vetter <simona@ffwll.ch>,
 Paolo Bonzini <pbonzini@redhat.com>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel@lists.freedesktop.org,
 rust-for-linux <rust-for-linux@vger.kernel.org>
References: <20250418165059.560503-1-jfalempe@redhat.com>
 <c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com>
 <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
 <80d092a3-0210-48d8-97da-f9175260a5fc@redhat.com>
Content-Language: en-US
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <80d092a3-0210-48d8-97da-f9175260a5fc@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.06.25 16:19, Jocelyn Falempe wrote:
> On 25/06/2025 00:18, Jocelyn Falempe wrote:
>> On 24/06/2025 20:55, Andrei Lalaev wrote:
>>> On 18.04.25 18:48, Jocelyn Falempe wrote:
>>>> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
>>>> to use a simple fifo with decimal digits as u8 instead.
>>>> This is slower but should compile on all architecture.
>>>>
>>>> Link: https://lore.kernel.org/dri-devel/ CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>>>>   1 file changed, 48 insertions(+), 23 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/ drm_panic_qr.rs
>>>> index 6025a705530e..dd55b1cb764d 100644
>>>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>>>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>>>> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>>>>           SegmentIterator {
>>>>               segment: self,
>>>>               offset: 0,
>>>> -            carry: 0,
>>>> -            carry_len: 0,
>>>> +            decfifo: Default::default(),
>>>> +        }
>>>> +    }
>>>> +}
>>>> +
>>>> +/// Max fifo size is 17 (max push) + 2 (max remaining)
>>>> +const MAX_FIFO_SIZE: usize = 19;
>>>> +
>>>> +/// A simple Decimal digit FIFO
>>>> +#[derive(Default)]
>>>> +struct DecFifo {
>>>> +    decimals: [u8; MAX_FIFO_SIZE],
>>>> +    len: usize,
>>>> +}
>>>> +
>>>> +impl DecFifo {
>>>> +    fn push(&mut self, data: u64, len: usize) {
>>>> +        let mut chunk = data;
>>>> +        for i in (0..self.len).rev() {
>>>> +            self.decimals[i + len] = self.decimals[i];
>>>> +        }
>>>> +        for i in 0..len {
>>>> +            self.decimals[i] = (chunk % 10) as u8;
>>>> +            chunk /= 10;
>>>> +        }
>>>> +        self.len += len;
>>>> +    }
>>>> +
>>>> +    /// Pop 3 decimal digits from the FIFO
>>>> +    fn pop3(&mut self) -> Option<(u16, usize)> {
>>>> +        if self.len == 0 {
>>>> +            None
>>>> +        } else {
>>>> +            let poplen = 3.min(self.len);
>>>> +            self.len -= poplen;
>>>> +            let mut out = 0;
>>>> +            let mut exp = 1;
>>>> +            for i in 0..poplen {
>>>> +                out += self.decimals[self.len + i] as u16 * exp;
>>>> +                exp *= 10;
>>>> +            }
>>>> +            Some((out, NUM_CHARS_BITS[poplen]))
>>>>           }
>>>>       }
>>>>   }
>>>> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>>>>   struct SegmentIterator<'a> {
>>>>       segment: &'a Segment<'a>,
>>>>       offset: usize,
>>>> -    carry: u64,
>>>> -    carry_len: usize,
>>>> +    decfifo: DecFifo,
>>>>   }
>>>>   impl Iterator for SegmentIterator<'_> {
>>>> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>>>>                   }
>>>>               }
>>>>               Segment::Numeric(data) => {
>>>> -                if self.carry_len < 3 && self.offset < data.len() {
>>>> -                    // If there are less than 3 decimal digits in the carry,
>>>> -                    // take the next 7 bytes of input, and add them to the carry.
>>>> +                if self.decfifo.len < 3 && self.offset < data.len() {
>>>> +                    // If there are less than 3 decimal digits in the fifo,
>>>> +                    // take the next 7 bytes of input, and push them to the fifo.
>>>>                       let mut buf = [0u8; 8];
>>>>                       let len = 7.min(data.len() - self.offset);
>>>>                       buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>>>>                       let chunk = u64::from_le_bytes(buf);
>>>> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
>>>> -                    self.carry = chunk + self.carry * pow;
>>>> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>>>>                       self.offset += len;
>>>> -                    self.carry_len += BYTES_TO_DIGITS[len];
>>>> -                }
>>>> -                match self.carry_len {
>>>> -                    0 => None,
>>>> -                    len => {
>>>> -                        // take the next 3 decimal digits of the carry
>>>> -                        // and return 10bits of numeric data.
>>>> -                        let out_len = 3.min(len);
>>>> -                        self.carry_len -= out_len;
>>>> -                        let pow = u64::pow(10, self.carry_len as u32);
>>>> -                        let out = (self.carry / pow) as u16;
>>>> -                        self.carry %= pow;
>>>> -                        Some((out, NUM_CHARS_BITS[out_len]))
>>>> -                    }
>>>>                   }
>>>> +                self.decfifo.pop3()
>>>>               }
>>>>           }
>>>>       }
>>>>
>>>> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
>>>
>>> Hi Jocelyn,
>>>
>>> Apologies for reviving this old thread, but I'm still encountering
>>> the same issue with the latest master (78f4e737a53e).
>>>
>>> When compiling this module for ARM32 (multi_v7_defconfig),
>>> I get the following error:
>>>
>>>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ drm_panic_qr.rs:392)
>>>      >>>               drivers/gpu/drm/drm_panic_qr.o: (<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ drm_panic_qr.rs:392)
>>>      >>>               drivers/gpu/drm/drm_panic_qr.o: (<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ drm_panic_qr.rs:392)
>>>      >>>               drivers/gpu/drm/drm_panic_qr.o: (<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>>      >>> referenced 14 more times
>>>      >>> did you mean: __aeabi_uidivmod
>>>      >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
>>>
>>> Since no one else has reported this in two months, I’m wondering
>>> if this might be a configuration issue on my end.
>>
>> Ok, that's surprising, the lines 391 and 392 are:
>>
>> self.decimals[i] = (chunk % 10) as u8;
>> chunk /= 10;
>>
>> So the compiler should be smart enough to do that without using a division.
>> I will try to reproduce, and see if I can fix that.
> 
> I reproduced the issues, it looks like clang doesn't do the optimization on ARM32:
> 
> https://github.com/llvm/llvm-project/issues/37280
> 
> So I've made a quick test with the following changes, and it builds:
> 
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index dd55b1cb764d..57bd3c6465bb 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -381,6 +381,20 @@ struct DecFifo {
>      len: usize,
>  }
> 
> +fn div10(val: u64) -> u64
> +{
> +    let val_h = val >> 32;
> +    let val_l = val & 0xFFFFFFFF;
> +    let b_h: u64 = 0x66666666;
> +    let b_l: u64 = 0x66666667;
> +
> +    let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
> +    let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
> +    let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
> +
> +    tmp3 >> 2
> +}
> +
>  impl DecFifo {
>      fn push(&mut self, data: u64, len: usize) {
>          let mut chunk = data;
> @@ -389,7 +403,7 @@ fn push(&mut self, data: u64, len: usize) {
>          }
>          for i in 0..len {
>              self.decimals[i] = (chunk % 10) as u8;
> -            chunk /= 10;
> +            chunk = div10(chunk);
>          }
>          self.len += len;
>      }
> 
> 
> Best regards,
> 

Compiles for me too on clang 20.1.6.

Thanks a lot!


-- 
Best regards,
Andrei Lalaev
