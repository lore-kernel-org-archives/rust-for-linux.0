Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A931BEF7E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791322; cv=none; b=LfpkdKdqv9T1y7AZO0TGxJXCbJr2lInPQhnwzGsqYJvKW9LX8oAfPKZtW9HRrcTrpPTSULtk/P6VeKE0XmholvhoaRo7QaFF9mL8aVsn2zF01scxUIrD6PQGlOGXlyi+DfBbnLQtAlG74Quk6vPA8+ITnCNXgkAzQ9qPnF+UgtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791322; c=relaxed/simple;
	bh=03rdREah2yEV1cVSPr16eDPYs0gq0neG9k07BZmZ6o8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Eiyjssh2CyMKPxfAYdi7emuPqdSRvUucCA7woDAm+G5W8PAxUDGRJhq6Hp5kxMO9B6Rg2wZiONpY2sgFQFOy1AiWc4s85Cqqo+wsUql5OgKsrKtFxLkHjkj9m78uMrorqzknn/3NFd6AQkdCLd3nYpuT+Ni2xWToaifavuEn3C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4lTn0Pj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4lTn0Pj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so1170185e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Jun 2025 11:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750791318; x=1751396118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5HOnEqbfaG+usT0a1s6iYTXFudLyxm3y/7fXes5KIcs=;
        b=N4lTn0PjXWjilsYapvxIyfAV/haGkfSP4YZTAjaB7uIKpJKXQi3mOSwF+Nh7o0/dfr
         UgkB9mVVl1XUY3mkqkqYOhtNLBDHyOt/rDDh1O8UDcP/9Ua9rcAPrv398pG/nn+RC1Gz
         oonICjhZ4XL5KZO2uNrzqMWjU6dbnus3pMYcDBthO7n5J/D8k2ITpUxVjPPqE8TaFWk+
         HD6C6iZxIrmh6EGbQtoZnwfKaqixONuQofCJE2oEBZJ8pTPuq+wfyE1dJCMpSSKQcuOO
         2CZvWKK6NqQkGKsdURhzixrFeOJ6Rtq6AoAG5mY7Kf1zqFSUTdZd8YB2T8hBeyO/v1X/
         WsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791318; x=1751396118;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5HOnEqbfaG+usT0a1s6iYTXFudLyxm3y/7fXes5KIcs=;
        b=h6tqzUJQHagNq/zCQDToxdJp8PoEa+kWuQbMt+ZoxlXV+fsrIZXyNo4jd1UOqbJ4y/
         Y0JDq2anH+A7mvGzcUctUgSikGE5KP1rchCVjdW8y4R2pZs8Xaa+NkQP+1Y1HIBzgGAM
         4jjVgnfKOvDjulBiTfHZ/bblfywVlqEdmfNE8iRZvlFOx0bBpHrs8TsKWb4zhpgvqKEQ
         1rLHfSJwwcDsw2/DS2VZuP85g0N2bXcrTHMrm5jY9USSK8hBbJ0m4j69sPBOz6eEroMd
         RAriiKyNgOJWHI3lKNeOUFM3iftjCOKGJvHgVitsgEOwXeGs+0C4ZXOSdWa299+FtcdL
         NxhA==
X-Forwarded-Encrypted: i=1; AJvYcCXwuyZcYnsr6Njwj9xDd+HCHWTqWg+xtjSSMKd3MyIDwKA5OxIhpCR4K2nlkLJXvJnaegeEXuF1sdY2y7vEZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYYQ2W8bSySwGX6c31+8yazn8wSKnVeaDuoM65VvXa2X/qMgO
	Umi3H8JXomk6Oj1Unz9GxcL/uQySrTlClEEpUds0HVozPydpRkDchdopuqDsV3Nq7JCu+KG/
X-Gm-Gg: ASbGncvSGCjPYOK3J9p0wh689NjSkZNCl4baIIQ5ESie6OnnA1HDq5jRMHEyoWuFgvI
	kGNVkuMDRcXEWjKVvTT9UJVeAn318JhMy68aFHT8YfQL0q06AqTvx+m+boWu3v0t7s+55tIVKjf
	JE235d6apMfgLZpr6n2Hg+r2GHotiFhk5bdZYmGtdZdnWx27Vvmc7AuaxEOPmN7Ih29caY3xhf9
	MPGdfSlT1ZWOREVHrt3CPHYzI3mPEp+Lx442/P9oQSzwtoXADP3+P5AlXiyKFFKrEuGkr/7ghje
	AUCEUZH5NvhXLXzqVI1RVcIXql/LWPuhJpFHeIm5pkYdgeinQUPK/exfpJFtisdpKC6vjBjjvfZ
	Zc983AhWAOAQSKjFnganfUyYhz2wIcRFZL4YTvPjdniP4L9iGLajFi5Is6nHQChe2kNLEDR0LjY
	dLD2Goj+nfiimSKmpOLcShN+dTqrbKxBHyiPId647UvHSa5g==
X-Google-Smtp-Source: AGHT+IHuRDhw6LNCJ4OejonKx4egSddQ5nzG9XYg2236H0JRfL7fwXed/J43zaU7m7WIujs3FcbfQA==
X-Received: by 2002:a05:600c:8214:b0:453:69dc:2621 with SMTP id 5b1f17b1804b1-45381bbcd22mr387435e9.12.1750791318115;
        Tue, 24 Jun 2025 11:55:18 -0700 (PDT)
Received: from ?IPV6:2a02:8388:e103:2700:ebc0:27a3:cde8:9846? (2a02-8388-e103-2700-ebc0-27a3-cde8-9846.cable.dynamic.v6.surfer.at. [2a02:8388:e103:2700:ebc0:27a3:cde8:9846])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a5fsm184027565e9.34.2025.06.24.11.55.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 11:55:17 -0700 (PDT)
Message-ID: <c0a2771c-f3f5-4d4c-aa82-d673b3c5cb46@gmail.com>
Date: Tue, 24 Jun 2025 20:55:16 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Jocelyn Falempe <jfalempe@redhat.com>
References: <20250418165059.560503-1-jfalempe@redhat.com>
Content-Language: en-US
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
From: Andrei Lalaev <andrey.lalaev@gmail.com>
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.04.25 18:48, Jocelyn Falempe wrote:
> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
> to use a simple fifo with decimal digits as u8 instead.
> This is slower but should compile on all architecture.
> 
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 6025a705530e..dd55b1cb764d 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>          SegmentIterator {
>              segment: self,
>              offset: 0,
> -            carry: 0,
> -            carry_len: 0,
> +            decfifo: Default::default(),
> +        }
> +    }
> +}
> +
> +/// Max fifo size is 17 (max push) + 2 (max remaining)
> +const MAX_FIFO_SIZE: usize = 19;
> +
> +/// A simple Decimal digit FIFO
> +#[derive(Default)]
> +struct DecFifo {
> +    decimals: [u8; MAX_FIFO_SIZE],
> +    len: usize,
> +}
> +
> +impl DecFifo {
> +    fn push(&mut self, data: u64, len: usize) {
> +        let mut chunk = data;
> +        for i in (0..self.len).rev() {
> +            self.decimals[i + len] = self.decimals[i];
> +        }
> +        for i in 0..len {
> +            self.decimals[i] = (chunk % 10) as u8;
> +            chunk /= 10;
> +        }
> +        self.len += len;
> +    }
> +
> +    /// Pop 3 decimal digits from the FIFO
> +    fn pop3(&mut self) -> Option<(u16, usize)> {
> +        if self.len == 0 {
> +            None
> +        } else {
> +            let poplen = 3.min(self.len);
> +            self.len -= poplen;
> +            let mut out = 0;
> +            let mut exp = 1;
> +            for i in 0..poplen {
> +                out += self.decimals[self.len + i] as u16 * exp;
> +                exp *= 10;
> +            }
> +            Some((out, NUM_CHARS_BITS[poplen]))
>          }
>      }
>  }
> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>  struct SegmentIterator<'a> {
>      segment: &'a Segment<'a>,
>      offset: usize,
> -    carry: u64,
> -    carry_len: usize,
> +    decfifo: DecFifo,
>  }
>  
>  impl Iterator for SegmentIterator<'_> {
> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>                  }
>              }
>              Segment::Numeric(data) => {
> -                if self.carry_len < 3 && self.offset < data.len() {
> -                    // If there are less than 3 decimal digits in the carry,
> -                    // take the next 7 bytes of input, and add them to the carry.
> +                if self.decfifo.len < 3 && self.offset < data.len() {
> +                    // If there are less than 3 decimal digits in the fifo,
> +                    // take the next 7 bytes of input, and push them to the fifo.
>                      let mut buf = [0u8; 8];
>                      let len = 7.min(data.len() - self.offset);
>                      buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>                      let chunk = u64::from_le_bytes(buf);
> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
> -                    self.carry = chunk + self.carry * pow;
> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>                      self.offset += len;
> -                    self.carry_len += BYTES_TO_DIGITS[len];
> -                }
> -                match self.carry_len {
> -                    0 => None,
> -                    len => {
> -                        // take the next 3 decimal digits of the carry
> -                        // and return 10bits of numeric data.
> -                        let out_len = 3.min(len);
> -                        self.carry_len -= out_len;
> -                        let pow = u64::pow(10, self.carry_len as u32);
> -                        let out = (self.carry / pow) as u16;
> -                        self.carry %= pow;
> -                        Some((out, NUM_CHARS_BITS[out_len]))
> -                    }
>                  }
> +                self.decfifo.pop3()
>              }
>          }
>      }
> 
> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18

Hi Jocelyn,

Apologies for reviving this old thread, but I'm still encountering
the same issue with the latest master (78f4e737a53e).

When compiling this module for ARM32 (multi_v7_defconfig),
I get the following error:

    ld.lld: error: undefined symbol: __aeabi_uldivmod
    >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
    >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
    >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
    >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
    >>> referenced by drm_panic_qr.rs:392 (drivers/gpu/drm/drm_panic_qr.rs:392)
    >>>               drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
    >>> referenced 14 more times
    >>> did you mean: __aeabi_uidivmod
    >>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

Since no one else has reported this in two months, I’m wondering
if this might be a configuration issue on my end.

Thanks a lot!

-- 
Best regards,
Andrei Lalaev
