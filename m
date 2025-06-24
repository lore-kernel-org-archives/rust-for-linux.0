Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131583D3B8
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 22:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750803522; cv=none; b=fdwjZX9Iv47R5wlR4U3jG2UV0EE9xM8fWI4c37CTh48A3tFgz2+Kf91yOu1F8aJvekqjG5A+M34ccM7rsmcAIl4+yd9WJRoNQFp0s2fjtFU9uFdfXwZ79QDl8IB6+JT6U5D20m5B5iuhv17BaPLSK8OlkGtPn8+UEidYcCGorq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750803522; c=relaxed/simple;
	bh=1/DVAKK6xdfcQI9+1DfxHV9G9oL3l6b8ZsGmG5gMuMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQeL6eNqm3PIstLYuhYBAwoK/RTctDjsoyI6R2FlNDoyUnpbCK2Fpx/Smd8j11pi3EkZ4pavJJHFJ5mF3PEYlcVR7hz91535ycJTy0+vcmcWGWwb11kw64AaDfmbUCv6pIFbgaFXT0orr6p1uqkdCiDPjDaA9zG7uiDW2zepa/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qe1E4Ia1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qe1E4Ia1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750803519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bxAjegPK/mrUwx8jrxPfkMyNj9EiwAEec1B10qnRZac=;
	b=Qe1E4Ia1WaF83pcJRxzvyJDbixNdwO1MnGXjolc83BXWG7hRGseSVjgDftP3xod7GsjJSi
	zITcqMwNd8nbG3q+l2rxpX61xuH2nmR5OqJkdIkwrp1PsdHWMLovHtcJFYUf6Kv4VrIA1j
	edMMNavAAsPc+BuSOEImi0yw5ZA7ZeI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-bqRfvAm0OHWZnYfoF-BrLA-1; Tue, 24 Jun 2025 18:18:38 -0400
X-MC-Unique: bqRfvAm0OHWZnYfoF-BrLA-1
X-Mimecast-MFC-AGG-ID: bqRfvAm0OHWZnYfoF-BrLA_1750803517
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f7ebfd00so491327f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 15:18:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750803517; x=1751408317;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxAjegPK/mrUwx8jrxPfkMyNj9EiwAEec1B10qnRZac=;
        b=erMbIB7CBnePd1S0gAII5/9bGzEOtrnqYLJKh2b/M3gW8mHRk8+PlL963F32WHqXgN
         vs8SnAF4khsbdnJsCQySMUPUbeHY6T5ZgVtfwJF/J9qi7b2TA6Yxdjzy7eiNXIG0Ms+o
         bMC5UN6Hi1zJZtTUKoNBfdRZ5XTzAgoS+QlGQViROnTYY2RdrrS2/l3naXhL3bdhhB2F
         pZS2SFvSZzNK9qY0+g9cZ+h/YFh1ZLJMJIVcDrRJXFFJ3nFLJtqRYbLewIsQGFi1/nqV
         fIGIx3HercV0kK8PwjbEKxV0+HgkJLSjyb7n+mh/qpvl92v+h/Dw+0rLCGv/qqHR09Tw
         7VGw==
X-Forwarded-Encrypted: i=1; AJvYcCUlRU8zIFCgWP3QfrbGz7VC2aWSViFbbM31x0UuWtd3dHaBcblwGjXZEkmDD/fCjFwiu85NDEbfA+wO2JkpIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNCZWo33DvV4TwBUQ9Wy4FlIAneeRdhNLFU8ErDA19iMOo50HZ
	1WufwAVz6Q1JwGj/QCHOFxp5L3S/C7/JZBTbqB/ISm/0pVSz52+GAByK6lJsiuk65c3OnhnAYNr
	N5I8/2I1HQs7FqDUYC2Zd8XjJYQW7rZyKRgLwc7LM7OrVs0LbhpA5yIBKvJrVj9uVU9KF
X-Gm-Gg: ASbGncuBcGksTpKbQzjyBTab1ZL7trCAOqzWn/g7K6Ciws0VOEOEfUBqdueZiDIKxhy
	74eMLYZXC0gYQVh/1Ne8ZPBPYlLnycCqbHEK46uU/QuiCxA3zs2n5ow19mYddN73CzkAeZaqWFv
	clR90hSYMyJbYuHICEKXpzdbeHQIGl5Y5OOskshKbUpN+MOe0D9ObSno0QEkhBnA1eAekKuJWP+
	oANYmf3Xb6rcjrVYK03hEKytpDSilyar5FQZIK6r79Yine6mwyC8TW1Xdog9gIjRTpqwAyYRYL6
	XD0GEz0Fs9xfoas1iLOsqk5glGCYyadE84LGqa4NBiZL1t90vH0Mpa0TVDOe8w==
X-Received: by 2002:a05:6000:4a04:b0:3a4:fc52:f5d4 with SMTP id ffacd0b85a97d-3a6ed66e660mr259026f8f.47.1750803517057;
        Tue, 24 Jun 2025 15:18:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgaiZu6Jnvv4KZOV08AX5p0ZetFt8VZ3DH1c9WqbbWm4WIsdHnH3J35vd6e6Y8A8S4HPKSng==
X-Received: by 2002:a05:6000:4a04:b0:3a4:fc52:f5d4 with SMTP id ffacd0b85a97d-3a6ed66e660mr259010f8f.47.1750803516581;
        Tue, 24 Jun 2025 15:18:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm1501705e9.33.2025.06.24.15.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 15:18:36 -0700 (PDT)
Message-ID: <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
Date: Wed, 25 Jun 2025 00:18:29 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Andrei Lalaev <andrey.lalaev@gmail.com>
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
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vycFY1pC2LGKAPq3eYCcouAU1pNueh3g9fPmwuLu4FM_1750803517
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/06/2025 20:55, Andrei Lalaev wrote:
> On 18.04.25 18:48, Jocelyn Falempe wrote:
>> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
>> to use a simple fifo with decimal digits as u8 instead.
>> This is slower but should compile on all architecture.
>>
>> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>>   1 file changed, 48 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
>> index 6025a705530e..dd55b1cb764d 100644
>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>>           SegmentIterator {
>>               segment: self,
>>               offset: 0,
>> -            carry: 0,
>> -            carry_len: 0,
>> +            decfifo: Default::default(),
>> +        }
>> +    }
>> +}
>> +
>> +/// Max fifo size is 17 (max push) + 2 (max remaining)
>> +const MAX_FIFO_SIZE: usize = 19;
>> +
>> +/// A simple Decimal digit FIFO
>> +#[derive(Default)]
>> +struct DecFifo {
>> +    decimals: [u8; MAX_FIFO_SIZE],
>> +    len: usize,
>> +}
>> +
>> +impl DecFifo {
>> +    fn push(&mut self, data: u64, len: usize) {
>> +        let mut chunk = data;
>> +        for i in (0..self.len).rev() {
>> +            self.decimals[i + len] = self.decimals[i];
>> +        }
>> +        for i in 0..len {
>> +            self.decimals[i] = (chunk % 10) as u8;
>> +            chunk /= 10;
>> +        }
>> +        self.len += len;
>> +    }
>> +
>> +    /// Pop 3 decimal digits from the FIFO
>> +    fn pop3(&mut self) -> Option<(u16, usize)> {
>> +        if self.len == 0 {
>> +            None
>> +        } else {
>> +            let poplen = 3.min(self.len);
>> +            self.len -= poplen;
>> +            let mut out = 0;
>> +            let mut exp = 1;
>> +            for i in 0..poplen {
>> +                out += self.decimals[self.len + i] as u16 * exp;
>> +                exp *= 10;
>> +            }
>> +            Some((out, NUM_CHARS_BITS[poplen]))
>>           }
>>       }
>>   }
>> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>>   struct SegmentIterator<'a> {
>>       segment: &'a Segment<'a>,
>>       offset: usize,
>> -    carry: u64,
>> -    carry_len: usize,
>> +    decfifo: DecFifo,
>>   }
>>   
>>   impl Iterator for SegmentIterator<'_> {
>> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>>                   }
>>               }
>>               Segment::Numeric(data) => {
>> -                if self.carry_len < 3 && self.offset < data.len() {
>> -                    // If there are less than 3 decimal digits in the carry,
>> -                    // take the next 7 bytes of input, and add them to the carry.
>> +                if self.decfifo.len < 3 && self.offset < data.len() {
>> +                    // If there are less than 3 decimal digits in the fifo,
>> +                    // take the next 7 bytes of input, and push them to the fifo.
>>                       let mut buf = [0u8; 8];
>>                       let len = 7.min(data.len() - self.offset);
>>                       buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>>                       let chunk = u64::from_le_bytes(buf);
>> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
>> -                    self.carry = chunk + self.carry * pow;
>> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>>                       self.offset += len;
>> -                    self.carry_len += BYTES_TO_DIGITS[len];
>> -                }
>> -                match self.carry_len {
>> -                    0 => None,
>> -                    len => {
>> -                        // take the next 3 decimal digits of the carry
>> -                        // and return 10bits of numeric data.
>> -                        let out_len = 3.min(len);
>> -                        self.carry_len -= out_len;
>> -                        let pow = u64::pow(10, self.carry_len as u32);
>> -                        let out = (self.carry / pow) as u16;
>> -                        self.carry %= pow;
>> -                        Some((out, NUM_CHARS_BITS[out_len]))
>> -                    }
>>                   }
>> +                self.decfifo.pop3()
>>               }
>>           }
>>       }
>>
>> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
> 
> Hi Jocelyn,
> 
> Apologies for reviving this old thread, but I'm still encountering
> the same issue with the latest master (78f4e737a53e).
> 
> When compiling this module for ARM32 (multi_v7_defconfig),
> I get the following error:
> 
>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
>      >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
>      >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
>      >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>      >>> referenced 14 more times
>      >>> did you mean: __aeabi_uidivmod
>      >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
> 
> Since no one else has reported this in two months, I’m wondering
> if this might be a configuration issue on my end.

Ok, that's surprising, the lines 391 and 392 are:

self.decimals[i] = (chunk % 10) as u8;
chunk /= 10;

So the compiler should be smart enough to do that without using a division.
I will try to reproduce, and see if I can fix that.

Best regards,

> 
> Thanks a lot!
> 

