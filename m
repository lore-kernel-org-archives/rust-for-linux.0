Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1642E611C
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947552; cv=none; b=YTuHHHm30T6bvniK1TRkqyUmOyKNosXHIBjZoF/fjHFKtrTGyO1jwrCsH+ZIBECkGBI8tRKtTrv9jtlTaYkM+e1b8FQx5DvfR4rVqEzHH8S8Xf3UTVGXluqq6Kb7o1wydaQCKDIGQMnZvGiQDrsmoR0xAm8WRknExzmgN7aQqkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947552; c=relaxed/simple;
	bh=esB0vfJ3Uw5riitYWBen1aiZyCTdvUgebVPq4nNPgTU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=g//yTLIvdwb4q/Ab+dX953Xl5I2QJ84p0M7RwQujSHrPqyeIDWRJCexGDpwcZ+rD1KBiur7QLkRJDEei4NIyx8yQ5ejZyDTopR6F1p0sM+h/WDjlGn/xKohDzH+5Vu9TchdIXEljqSQVeGYYrdEvPDY+d7e7c48u6j8Jg8a0e4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D62CpQ5C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D62CpQ5C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750947546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=283q34iA0wfQG7FDPPwFCBMleMjUx5hsae5q9eVpzXA=;
	b=D62CpQ5C+gCs/qwnDDwObM7oufJwrrmqErGDbTuknyNkSOjhpFpi4aqSSkfCo6ktbLRm9S
	fzzuEhEGGPYmnTDAEYUsQ0EGQD9oRzsBIgvuUPv2PzjQUJ08/yA6MexSwCqPW1vHgFMwiP
	xNnNAjqvr+Tk3vRh4i1YS/UCamNnfB4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-9UnilF7kMUKnrL_yYFeApQ-1; Thu, 26 Jun 2025 10:19:04 -0400
X-MC-Unique: 9UnilF7kMUKnrL_yYFeApQ-1
X-Mimecast-MFC-AGG-ID: 9UnilF7kMUKnrL_yYFeApQ_1750947544
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso6049685e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Jun 2025 07:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947544; x=1751552344;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=283q34iA0wfQG7FDPPwFCBMleMjUx5hsae5q9eVpzXA=;
        b=hKR+fc5Sb3GjqY03yOmtFVjwCdl2WPrEvhIQRG/EbyjMm5HjKGdsOGsRxkgaYRBHux
         e6OPBxSW5vJJpygVwEmXyXSAo+D35wBAQL9m9H+qCdOVNzX9+AepN2k2tSV/e+KCaoDo
         3F4uXh5y6IURwWCzWNElBCUgi7SSoxqDrCBOUDrHGIu0fgLM+qM6dU7K82pTz4GQvcQ0
         s0KlbMDrZmv0fy5T9yLMxdEXdEZMDq2QheuiTdrPhQ+TMH2M3nqBUM/tFXUJu+gllHAy
         grA6DBxTUvdjY/eRNvaxCeOyFNi226pxXYz8PSKvj4oXiYmPbJzMUqXoA2O7Om545aAw
         b3ww==
X-Forwarded-Encrypted: i=1; AJvYcCV6mS66IX5VBZspkPkwWfUf6SBEwUe5lZo6KxBMbNqMglc01Um28G5DTHZzsFTf0GFYRmsWHFd5UeZOYDx2Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyuN2t+dvySv4IjD6mXTS6HT3qQ8K674/BLTSOc8d/YC8wvJu+x
	Q0baA/kAdDegr4k3TxkbrJML8O1dYWbD9UVRwevzndUD7EvenABFspbf8lkCa7apKVOTeSiI2Oq
	PdQ76jvMxWuQUzDFQj/8hk4uGhzPWOZ6+wl5eCH5WcNpSxLRBVDajJ95hlP/QZAyByLIB
X-Gm-Gg: ASbGnctNB/fSNT8x6icwTwtEZK0BoSh2e/F5vQ3GIM0cHrd/YLsC0NpuHXNY3rxqPdt
	WaqhAkHWIk5uo+/tMC63CiCNMjvzV12L3i5fg+rXnTLJgQgR2P8u8yT3pnM4LnVqXuwbkLhfSvo
	FrfvJvd1ZF7mZqPQXKtP5HTpGMG/XisvgnbYYIgT2ga74IQFaMNMH08GBuGn9VxFWMCzZzgyUMq
	SRWVww26RSmO2iIE6r9T0A4AwMhqJ1PKBYsLUCUG8LIRvjV3Gns7QeNF2QUHnx8dbXit7jdmizm
	anZt02fv2AeumqgnQistcrdXc9lKqfG0DgQNc8oZiYZcGnsSLNDXIK0fFmVv4w==
X-Received: by 2002:a05:600c:35c9:b0:453:79cb:7c86 with SMTP id 5b1f17b1804b1-4538896ba75mr41350065e9.3.1750947543438;
        Thu, 26 Jun 2025 07:19:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHX3SUpCYk0Q1rtUXxdiwTxAC1uqwZZn+noU/tSvXGhBzHLk/17+Raj1JTfMd2KuovA5Hm6ZQ==
X-Received: by 2002:a05:600c:35c9:b0:453:79cb:7c86 with SMTP id 5b1f17b1804b1-4538896ba75mr41349375e9.3.1750947542873;
        Thu, 26 Jun 2025 07:19:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c463asm51664655e9.39.2025.06.26.07.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 07:19:02 -0700 (PDT)
Message-ID: <80d092a3-0210-48d8-97da-f9175260a5fc@redhat.com>
Date: Thu, 26 Jun 2025 16:19:00 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
From: Jocelyn Falempe <jfalempe@redhat.com>
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
 <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
In-Reply-To: <cbaf2819-84b3-4482-8d91-7d3d24625e4f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uph1eJm_nNrEBtAR_aA2c_EAdoMsoutR2tVaqyQDU-0_1750947544
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/06/2025 00:18, Jocelyn Falempe wrote:
> On 24/06/2025 20:55, Andrei Lalaev wrote:
>> On 18.04.25 18:48, Jocelyn Falempe wrote:
>>> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
>>> to use a simple fifo with decimal digits as u8 instead.
>>> This is slower but should compile on all architecture.
>>>
>>> Link: https://lore.kernel.org/dri-devel/ 
>>> CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>>>   1 file changed, 48 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/ 
>>> drm_panic_qr.rs
>>> index 6025a705530e..dd55b1cb764d 100644
>>> --- a/drivers/gpu/drm/drm_panic_qr.rs
>>> +++ b/drivers/gpu/drm/drm_panic_qr.rs
>>> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>>>           SegmentIterator {
>>>               segment: self,
>>>               offset: 0,
>>> -            carry: 0,
>>> -            carry_len: 0,
>>> +            decfifo: Default::default(),
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +/// Max fifo size is 17 (max push) + 2 (max remaining)
>>> +const MAX_FIFO_SIZE: usize = 19;
>>> +
>>> +/// A simple Decimal digit FIFO
>>> +#[derive(Default)]
>>> +struct DecFifo {
>>> +    decimals: [u8; MAX_FIFO_SIZE],
>>> +    len: usize,
>>> +}
>>> +
>>> +impl DecFifo {
>>> +    fn push(&mut self, data: u64, len: usize) {
>>> +        let mut chunk = data;
>>> +        for i in (0..self.len).rev() {
>>> +            self.decimals[i + len] = self.decimals[i];
>>> +        }
>>> +        for i in 0..len {
>>> +            self.decimals[i] = (chunk % 10) as u8;
>>> +            chunk /= 10;
>>> +        }
>>> +        self.len += len;
>>> +    }
>>> +
>>> +    /// Pop 3 decimal digits from the FIFO
>>> +    fn pop3(&mut self) -> Option<(u16, usize)> {
>>> +        if self.len == 0 {
>>> +            None
>>> +        } else {
>>> +            let poplen = 3.min(self.len);
>>> +            self.len -= poplen;
>>> +            let mut out = 0;
>>> +            let mut exp = 1;
>>> +            for i in 0..poplen {
>>> +                out += self.decimals[self.len + i] as u16 * exp;
>>> +                exp *= 10;
>>> +            }
>>> +            Some((out, NUM_CHARS_BITS[poplen]))
>>>           }
>>>       }
>>>   }
>>> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>>>   struct SegmentIterator<'a> {
>>>       segment: &'a Segment<'a>,
>>>       offset: usize,
>>> -    carry: u64,
>>> -    carry_len: usize,
>>> +    decfifo: DecFifo,
>>>   }
>>>   impl Iterator for SegmentIterator<'_> {
>>> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>>>                   }
>>>               }
>>>               Segment::Numeric(data) => {
>>> -                if self.carry_len < 3 && self.offset < data.len() {
>>> -                    // If there are less than 3 decimal digits in 
>>> the carry,
>>> -                    // take the next 7 bytes of input, and add them 
>>> to the carry.
>>> +                if self.decfifo.len < 3 && self.offset < data.len() {
>>> +                    // If there are less than 3 decimal digits in 
>>> the fifo,
>>> +                    // take the next 7 bytes of input, and push them 
>>> to the fifo.
>>>                       let mut buf = [0u8; 8];
>>>                       let len = 7.min(data.len() - self.offset);
>>>                       
>>> buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>>>                       let chunk = u64::from_le_bytes(buf);
>>> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as 
>>> u32);
>>> -                    self.carry = chunk + self.carry * pow;
>>> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>>>                       self.offset += len;
>>> -                    self.carry_len += BYTES_TO_DIGITS[len];
>>> -                }
>>> -                match self.carry_len {
>>> -                    0 => None,
>>> -                    len => {
>>> -                        // take the next 3 decimal digits of the carry
>>> -                        // and return 10bits of numeric data.
>>> -                        let out_len = 3.min(len);
>>> -                        self.carry_len -= out_len;
>>> -                        let pow = u64::pow(10, self.carry_len as u32);
>>> -                        let out = (self.carry / pow) as u16;
>>> -                        self.carry %= pow;
>>> -                        Some((out, NUM_CHARS_BITS[out_len]))
>>> -                    }
>>>                   }
>>> +                self.decfifo.pop3()
>>>               }
>>>           }
>>>       }
>>>
>>> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18
>>
>> Hi Jocelyn,
>>
>> Apologies for reviving this old thread, but I'm still encountering
>> the same issue with the latest master (78f4e737a53e).
>>
>> When compiling this module for ARM32 (multi_v7_defconfig),
>> I get the following error:
>>
>>      ld.lld: error: undefined symbol: __aeabi_uldivmod
>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ 
>> drm_panic_qr.rs:392)
>>      >>>               drivers/gpu/drm/drm_panic_qr.o: 
>> (<drm_panic_qr::SegmentIterator as 
>> core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ 
>> drm_panic_qr.rs:392)
>>      >>>               drivers/gpu/drm/drm_panic_qr.o: 
>> (<drm_panic_qr::SegmentIterator as 
>> core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>      >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/ 
>> drm_panic_qr.rs:392)
>>      >>>               drivers/gpu/drm/drm_panic_qr.o: 
>> (<drm_panic_qr::SegmentIterator as 
>> core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
>>      >>> referenced 14 more times
>>      >>> did you mean: __aeabi_uidivmod
>>      >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)
>>
>> Since no one else has reported this in two months, I’m wondering
>> if this might be a configuration issue on my end.
> 
> Ok, that's surprising, the lines 391 and 392 are:
> 
> self.decimals[i] = (chunk % 10) as u8;
> chunk /= 10;
> 
> So the compiler should be smart enough to do that without using a division.
> I will try to reproduce, and see if I can fix that.

I reproduced the issues, it looks like clang doesn't do the optimization 
on ARM32:

https://github.com/llvm/llvm-project/issues/37280

So I've made a quick test with the following changes, and it builds:


diff --git a/drivers/gpu/drm/drm_panic_qr.rs 
b/drivers/gpu/drm/drm_panic_qr.rs
index dd55b1cb764d..57bd3c6465bb 100644
--- a/drivers/gpu/drm/drm_panic_qr.rs
+++ b/drivers/gpu/drm/drm_panic_qr.rs
@@ -381,6 +381,20 @@ struct DecFifo {
      len: usize,
  }

+fn div10(val: u64) -> u64
+{
+    let val_h = val >> 32;
+    let val_l = val & 0xFFFFFFFF;
+    let b_h: u64 = 0x66666666;
+    let b_l: u64 = 0x66666667;
+
+    let tmp1 = val_h * b_l + ((val_l * b_l) >> 32);
+    let tmp2 = val_l * b_h + (tmp1 & 0xffffffff);
+    let tmp3 = val_h * b_h + (tmp1 >> 32) + (tmp2 >> 32);
+
+    tmp3 >> 2
+}
+
  impl DecFifo {
      fn push(&mut self, data: u64, len: usize) {
          let mut chunk = data;
@@ -389,7 +403,7 @@ fn push(&mut self, data: u64, len: usize) {
          }
          for i in 0..len {
              self.decimals[i] = (chunk % 10) as u8;
-            chunk /= 10;
+            chunk = div10(chunk);
          }
          self.len += len;
      }


Best regards,

-- 

Jocelyn

> 
> Best regards,
> 
>>
>> Thanks a lot!
>>
> 

