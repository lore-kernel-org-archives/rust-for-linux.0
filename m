Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8028A210185
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 12:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188644; cv=none; b=JG4WWOHoU84hDFPTbrEf444SQ17TViigJL8RnIumB5o772uRXuylq+EBGzlatWmmRtR5V40KkYvdBPX5fQVNF4+7sBg7gFEDuWr93640x/hQXFEkTPphOMg4RMsASXII91YYLDwtgzEVrosZWvWqT/1pNTgLojEolr47/J8p7ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188644; c=relaxed/simple;
	bh=mb6k8nKlpleQhAanhtj/9QJk/U2LnNkD9GZglwJtXV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dSSGgAEbBX85MRYrDus+WEBB3um/eD4YiQdnT2dV/t3oO0hgrYIYFNzhb744MYYFHvX00YoVtbt3DV0dMYjICI3Bv1o9wuoTrrqedjEdoFidDBfiTLsDmi1ZowrE5UxIsu7ttHVWoPGq9Nb49qSJ7sZlCSyWDV+NpjIHDjzS95s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6ufpCwE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6ufpCwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746188641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wIczffFaYHKPykcw3b0iM8vvrEkTn9lVPlgu8mIdn84=;
	b=c6ufpCwEmVCMAEBuLfwDdQXJZ11vrAYH2JaUjx20FNXcJP9kXBQVj2VliPQecfvytxQemf
	OYM/ul2kzYv8nbk7xDaxoGWGvfD8Z8x/1nBgQa5jkyP8iS/feVSPNTMojATtdX2/fa24wA
	mRMzTYo4hKFn9aYfhN2ewGtdInoyRek=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-NNgTTRAHOsO4edZbUpEsIA-1; Fri, 02 May 2025 08:23:58 -0400
X-MC-Unique: NNgTTRAHOsO4edZbUpEsIA-1
X-Mimecast-MFC-AGG-ID: NNgTTRAHOsO4edZbUpEsIA_1746188637
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so7840215e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 05:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188637; x=1746793437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wIczffFaYHKPykcw3b0iM8vvrEkTn9lVPlgu8mIdn84=;
        b=RiHQOu0Qe0OSxDGU+TLq/vU5vmdnbs9ot/QQPHRAe1gJgBUWoDv1lEZ1S/eaI760w8
         YhoU0/7OCPAiggmKGD7i+W/OUzRxuHQlfGl7PvwShzg7qdUSn0GgIUgiv5mHfPXnhUpo
         sy6K4WNsheSUwQWTtq7L5Z3pBHTLoDRTN9Hg6vbZ5D1ctdhLjQUP3pCPWD7rnRlOwNq0
         xgA8F7gTU3ggjUL/zZ61FfXLi/NEDC0bbCt6AWSvgM81sOPIN7PNOEhxCtBEd+Vyug7S
         s1cnffSww4ClWgTMpxGn+AU+Xyp81MWGAcCUhwdpZPqo0n/don0igcFpSaHybCCBiHia
         IARA==
X-Forwarded-Encrypted: i=1; AJvYcCXHc6zVPa74gdHgc04VmmeKUfTXQ8MtbWWXEhpLu1+0acmq9PVtXDDOdJz1Sg4qDBQikbOHLQqImBzDn4BrRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo2i3IQVBDYw4yrGCSqBqjqCgasKTJS/cUIFNsvs3K1Xot9Xga
	6+YUuL/LJjPYcnvuCrXEkYeyQFxBJqkZQZuEIBICv4BnBqYTYiyNfW4Q9v8D2IlF+M80z5fDEEV
	f07lDqdJbVDK0k8cOLmTn8iSyoLbQcMdnmnMgAlt3b7L41bJ2XFC7/6YDrSJc9Ra2
X-Gm-Gg: ASbGncu+YGkQLTW0cJ1RdS6mUJ9rRpkyW/GDNb453o4Y2YUdvPAC4x7I3SOD9cmhoke
	itwGXu7ZPdPUXYSDzRDi+sphdWn1s6qBKvBmRiu5pwRUdRODJvbaIOZIJOV3SomgcWr9ap9nVMT
	2hGEjbcZbkaQraLAOmhQfvEe5c3S19C7Fln6y6G4Leou+D0Qqw0mGEQRyJFgeRl6g6e4U1uvy9r
	tVM0wHoNFsCcbd1G/YEwx+tyJXV9bJvJYdCDDDP8XsyXUj4XIhOoFf/4niBfmIik55HrNzmotVP
	yk4nVGOFcXkpkOAn2gonbGCLGbisXe40SVWfBN91m8OvYZNI8s8=
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-441bbf34052mr18719425e9.26.1746188637010;
        Fri, 02 May 2025 05:23:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtBSWT/9rJ58YwwQsHRZD3aEJKNHkUCm3Vq3qVD5xLR8Kf9BbRNg4RYaf53PhVsYbqWhK/OA==
X-Received: by 2002:a05:600c:5022:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-441bbf34052mr18719135e9.26.1746188636561;
        Fri, 02 May 2025 05:23:56 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28718sm89479975e9.36.2025.05.02.05.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:23:56 -0700 (PDT)
Message-ID: <847a72c8-ea80-4aaa-b439-ab7649dcebd0@redhat.com>
Date: Fri, 2 May 2025 14:23:54 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250418165059.560503-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g1lhz7cFHZIBovaX871DJmgqyVv0o5sUjnTIx0te7No_1746188637
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/04/2025 18:48, Jocelyn Falempe wrote:
> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
> to use a simple fifo with decimal digits as u8 instead.
> This is slower but should compile on all architecture.

I applied it to drm-misc/drm-misc-next.

Thanks for the reviews.

-- 

Jocelyn
> 
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/drm_panic_qr.rs | 71 ++++++++++++++++++++++-----------
>   1 file changed, 48 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic_qr.rs b/drivers/gpu/drm/drm_panic_qr.rs
> index 6025a705530e..dd55b1cb764d 100644
> --- a/drivers/gpu/drm/drm_panic_qr.rs
> +++ b/drivers/gpu/drm/drm_panic_qr.rs
> @@ -366,8 +366,48 @@ fn iter(&self) -> SegmentIterator<'_> {
>           SegmentIterator {
>               segment: self,
>               offset: 0,
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
>           }
>       }
>   }
> @@ -375,8 +415,7 @@ fn iter(&self) -> SegmentIterator<'_> {
>   struct SegmentIterator<'a> {
>       segment: &'a Segment<'a>,
>       offset: usize,
> -    carry: u64,
> -    carry_len: usize,
> +    decfifo: DecFifo,
>   }
>   
>   impl Iterator for SegmentIterator<'_> {
> @@ -394,31 +433,17 @@ fn next(&mut self) -> Option<Self::Item> {
>                   }
>               }
>               Segment::Numeric(data) => {
> -                if self.carry_len < 3 && self.offset < data.len() {
> -                    // If there are less than 3 decimal digits in the carry,
> -                    // take the next 7 bytes of input, and add them to the carry.
> +                if self.decfifo.len < 3 && self.offset < data.len() {
> +                    // If there are less than 3 decimal digits in the fifo,
> +                    // take the next 7 bytes of input, and push them to the fifo.
>                       let mut buf = [0u8; 8];
>                       let len = 7.min(data.len() - self.offset);
>                       buf[..len].copy_from_slice(&data[self.offset..self.offset + len]);
>                       let chunk = u64::from_le_bytes(buf);
> -                    let pow = u64::pow(10, BYTES_TO_DIGITS[len] as u32);
> -                    self.carry = chunk + self.carry * pow;
> +                    self.decfifo.push(chunk, BYTES_TO_DIGITS[len]);
>                       self.offset += len;
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
>                   }
> +                self.decfifo.pop3()
>               }
>           }
>       }
> 
> base-commit: 74757ad1c105c8fc00b4cac0b7918fe3262cdb18

