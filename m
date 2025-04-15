Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E7D28BA9E
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721434; cv=none; b=Y4GuLTtX2YlKZWyXN8OFaIuqbtW5JWTDurT/7lRuctKN+WDwcpBtNmzzSU2qPcO/SMCdNml2x+vhfSGSx8R7JDPWXI78aNELpb4AqImEBF6MZRqcZMCU1ZUdv8gGWF3qvbltIX7pOn/w+L67iIlY70KUCjWggzJUjMbHyThZ5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721434; c=relaxed/simple;
	bh=iRdjU2vjAb0W69AnpWZVkZBqUo0EN3Ufoba15vdqHwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL+C6pQVdz45HhgyAxQkD0UwVSLFfpjGhbn8cBLm7BkWaW0QQFOv457/9ccAl63ENGzR039zPEIEZQmEG8dYwUqU2X1yopmYL5Z+443Zac56lctYWwRBLCYto/SrJdp3w1LkrkdFmYkPh0SFaVMp8NKrJL0/Pqk4QrsxAbt7IHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYx0xjJM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYx0xjJM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744721431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c5aGJd6gGys4y4yhW/3sEXMhbTbG/RttbuWB1PxTwu8=;
	b=KYx0xjJMXmTToRU1neFWCNOQtgQwIG1eBPAAHgj+/KyU12hBy3VFtRo/WqnWazPdI8A6VN
	DcV3VFgVD5oEDxGJpI5MSpTRrfjAZl3R/7P/6kpkHHEnIiXtq6XbPS+xlqv3ajj6XBH9Dq
	PXXDczNkzKeM2lnygUkgq8hqnBv/hlY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-jlgSStwkNVe8jx6gyLGRtQ-1; Tue, 15 Apr 2025 08:50:29 -0400
X-MC-Unique: jlgSStwkNVe8jx6gyLGRtQ-1
X-Mimecast-MFC-AGG-ID: jlgSStwkNVe8jx6gyLGRtQ_1744721429
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso31755685e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 05:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721429; x=1745326229;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5aGJd6gGys4y4yhW/3sEXMhbTbG/RttbuWB1PxTwu8=;
        b=rMH//qWxahR6fmtbTZIkvi3pRbSnU2YfxS/vNURYGqHVhhMiK2ts0ErvDoVKE8Zaw9
         3I7ctCnapxAhDy4Mocnp8C56MJcn4oqKReQn4WR1gndak9lAVwHm0Su0C34XcFo9BWmM
         28/ZDxK5SPWd18tK+0/Orj5NCA+fM/JE8ABY0Ptj4CuU0GAvhn5zz5J8UWdX6MdflCnD
         15bPIY4kKzj6INDTYMo8g2XT50Cz98zLhROIVkaCzII2bQNOuKYn834JL9YUfCtIATQ/
         K4MO6ECWfofms48fngnIZpF5GfIohW9T20E2vuxXHsXRBaVcwfb5WncEq/jXfAgpUevC
         fJKw==
X-Forwarded-Encrypted: i=1; AJvYcCXdHDadiDqYMbi/qYWa5I80iWu38sXExKNYWD8Qltpcd41A3ts5dEcl93txVpt1R4zeotUK+YX7lVgmdafmPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuDAUb/JfHlCuXtA8s0SqSczg+6oTrPy4ycjvhBqnQiZPIdSET
	ZW1RajbEiuAPd7Js7MYHteJFeAhmfkCmzRxkvPAcsgzCWh0Z70R80zU1Cbpu+8ac96erpDhPBX1
	NXM5BN/iKkYBHneiphNRSRBiGpis2car4wZ+XRf1BTdTqL4dmGFncP+n0tmR/pXIP
X-Gm-Gg: ASbGncuW6beeRzKnsu5dUiiJ8wLg0qnTrcVKiVuE8bEjEttXpB0lN9rdw/lAORz14gY
	shAl1HaptXc3O/L/5P5TO6dVhPXPeWl0o1rYYtDdiXFIfFZ2WeCiFf3u/LG0B6wq31NEFNJUTMu
	Rk2jRquKabNubJ4f2cQrSiGuIoTSOxENM5yW6JucTYeQ7ecefOlTv1cStqmBD86pKg9hXf5TGJ5
	zxZuidsoHoVWbXl3TNOLlVocRoRrCoKnkeRCYe70UP6zoyH3/JIOvLm+ETpy52TUlgXMsuppnA3
	nH7Lnuu18KStzUQr
X-Received: by 2002:a05:600c:1c03:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43f3a927654mr121649005e9.5.1744721428667;
        Tue, 15 Apr 2025 05:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFj25pgSIsqBjfz6Y9sBggCmIl9HsWKNdepNwC3fzn1uQR3G6mU8S+L8arQ4hueY0XNNLoU1A==
X-Received: by 2002:a05:600c:1c03:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43f3a927654mr121648805e9.5.1744721428360;
        Tue, 15 Apr 2025 05:50:28 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.109.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f23572c43sm213085085e9.25.2025.04.15.05.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:50:27 -0700 (PDT)
Message-ID: <5e0754a2-ba4e-454b-99cb-57c4ae99d020@redhat.com>
Date: Tue, 15 Apr 2025 14:50:26 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
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
 <1a03b57c-1b5f-405a-a22a-89cc82138c55@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <1a03b57c-1b5f-405a-a22a-89cc82138c55@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ks0QGjHEjcPgAkDvWQDINdGM3mZSp30OiLkLCDYXc7g_1744721429
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 11:14, Jocelyn Falempe wrote:
> For this case, the u64 divisor "pow" is a power of 10, so can have only 
> a limited number of values. (17, and 9 of them can be used as u32).
> Normally when the divisor is known at build time the compiler can 
> replace the division by a multiplication and some bit shift.
> 
> so for 32bits machine, the match can be rewritten with constants, a bit 
> like this:

If you add bindings to mul_u64_u64_shr from include/linux/math64.h, you 
can include the constants yourself:

pub struct MagicMul {
     mult: u64,
     shift: u32,
}

// Computed using the algorithm from Hacker's Delight, 2nd ed.
const DIV10: [MagicMul; 19] = [
     MagicMul { mult: 0x1, shift: 0 },
     MagicMul { mult: 0x6666666666666667u64, shift: 66 },
     MagicMul { mult: 0xA3D70A3D70A3D70Bu64, shift: 70 },
     MagicMul { mult: 0x20C49BA5E353F7CFu64, shift: 71 },
     MagicMul { mult: 0x346DC5D63886594Bu64, shift: 75 },
     MagicMul { mult: 0x29F16B11C6D1E109u64, shift: 78 },
     MagicMul { mult: 0x431BDE82D7B634DBu64, shift: 82 },
     MagicMul { mult: 0xD6BF94D5E57A42BDu64, shift: 87 },
     MagicMul { mult: 0x55E63B88C230E77Fu64, shift: 89 },
     MagicMul { mult: 0x112E0BE826D694B3u64, shift: 90 },
     MagicMul { mult: 0x036F9BFB3AF7B757u64, shift: 91 },
     MagicMul { mult: 0x00AFEBFF0BCB24ABu64, shift: 92 },
     MagicMul { mult: 0x232F33025BD42233u64, shift: 101 },
     MagicMul { mult: 0x384B84D092ED0385u64, shift: 105 },
     MagicMul { mult: 0x0B424DC35095CD81u64, shift: 106 },
     MagicMul { mult: 0x480EBE7B9D58566Du64, shift: 112 },
     MagicMul { mult: 0x39A5652FB1137857u64, shift: 115 },
     MagicMul { mult: 0x5C3BD5191B525A25u64, shift: 119 },
     MagicMul { mult: 0x12725DD1D243ABA1u64, shift: 120 },
];

const fn div10(val: u64, exp: u32) -> u64 {
     let MagicMul { mult, shift } = DIV10[exp as usize];
     mul_u64_u64_shr(val, mult, shift)
}

#[test]
fn test_div10() {
     assert_eq!(div10(12345678, 0), 12345678);
     assert_eq!(div10(12345678, 1), 1234567);
     assert_eq!(div10(12345678, 2), 123456);
     assert_eq!(div10(12345678, 3), 12345);
     assert_eq!(div10(12345678, 4), 1234);
     assert_eq!(div10(12345678, 5), 123);
     assert_eq!(div10(12345678, 6), 12);
     assert_eq!(div10(12345678, 7), 1);

     assert_eq!(div10(9876543298765432, 8), 98765432);
     assert_eq!(div10(9876543298765432, 9), 9876543);
     assert_eq!(div10(9876543298765432, 10), 987654);
     assert_eq!(div10(9876543298765432, 11), 98765);
     assert_eq!(div10(9876543298765432, 12), 9876);
     assert_eq!(div10(9876543298765432, 13), 987);
     assert_eq!(div10(9876543298765432, 14), 98);
     assert_eq!(div10(9876543298765432, 15), 9);

     assert_eq!(div10(12349876543298765432, 16), 1234);
     assert_eq!(div10(12349876543298765432, 17), 123);
     assert_eq!(div10(12349876543298765432, 18), 12);
}


I tried the test in userspace with this implementation of the
function:

#![feature(bigint_helper_methods)]
const fn mul_u64_u64_shr(m: u64, n: u64, s: u32) -> u64 {
     let (a, b) = m.widening_mul(n);
     if s == 0 {
         a
     } else if s < 64 {
         (a >> s) | (b << 64 - s)
     } else {
         b >> (s - 64)
     }
}


HTH,

Paolo

