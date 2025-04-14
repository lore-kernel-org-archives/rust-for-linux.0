Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFA81AF0AE
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 19:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658510; cv=none; b=bAUgGJbTLuM61/mssC1PM+ec2XvKEq2uL2F3T6GihfSq2vY3xm83VXUF9MgoRLBuHyspfp1Y/VXvvJ1ISxGImxhLRQ7gskBU9NMZisFp99S4as/wQQyLGAZa5C5K7ViswYu7k1c+40kUwdiVEBUfeuE5dikbmBLWuE4L+smYpRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658510; c=relaxed/simple;
	bh=/Hib1NrLXkBdePVarHQmEtILLBaeqJ7NDVhKDKehf8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BcsUwpIV9UhPRALkAm0uQQknrm2JC7V/7eifmBOT8zNkAuX03eln3y3p42m1OYEmkWKudZZi7TF+WmDaQQndUsDhN5Hdg6bUguIjeOKZeAdZQyvJVaAxaRJ60/k5PC831ZqS6xdD/C5EO1UNQ8vZ3dsVR7CPXf/Vh0DQEmkbNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fqSO1z9e; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fqSO1z9e"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso54514125e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 12:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658507; x=1745263307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdnDpkLQDueaCtpgfvGpaidsvIby3mC+Wvd04T7dy5g=;
        b=fqSO1z9e6mc5dgKqEsLXul2gM8KD/qOetoNx7X55bFR8x7/tb2tA70f7e4rF5cvhyH
         wiveppNURBIaDDJ9gURuZekMBNqKgHmWmlcdI8wN1aaMEBxjv1yhw3+u8ped3I1h6znT
         W9TuitqZ8DlgoZs4oKweJ/+4tHo2PCAEbG2ksBOq7lAEQYS6YLzBZlx/VrMPOPMo+z0r
         6aK/zAjDqSf8rCxFB+Y0b06VJtIdDkXKk3MA0h55W80PNRkrqJepLAYkwGxcF0oLIfh6
         RORtqE7t0kcGOkskKtaYBFhnbxvkrj2ag/FngBXYxWSfAXe9Tuu/qmWvkCtRCkGuVOIb
         sHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658507; x=1745263307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdnDpkLQDueaCtpgfvGpaidsvIby3mC+Wvd04T7dy5g=;
        b=eEgwk6+/CvmfjOze+2bmiQYj/Xn360gvhfnM+GjPjneAX5w9ums4T0T+KwyNkq3gIp
         tEX6SAG4F2CC7i5WmnkkKGXz9XsZiBALtGvBcGMk+QtjOLN8bDRIRrasRoIR0ofP2yCf
         S4bJ7FSt4tDiLfm8F5FXhigFtoqOAWidFd4WWkZV7IJqZ1AwekYqJ5Q1LzEGOx47C8pd
         QOh7Cd/hCsClLYxhIZjut/YaEpps8PxLzTRjr3XfAAMHxayxj6nj3KA6UB3vz1B4YGro
         x6YQp9nlHwSvwpka6YJyyFRYN+GiOtbCLmgPgPL7WiFVvMfkQ3OVj+GyF7SVwOOROm/S
         xfhA==
X-Forwarded-Encrypted: i=1; AJvYcCWFVyvxBvvvU/TwP4VeHgE+TdU3HX35M7vI24t8gnZYP9fMUN+MJ/hOYdvuhiFhH0UKbThzZAEqK2R9Te9qZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YweQ1/5aN09Kb7BrdwwSgUC2pag4i95wenKBl69egBOWcpNE9v2
	m4vinHnX5ZOWeGnh9mdX/BAVcgfvO15zTuypkFbO7ayWU0kevMOA
X-Gm-Gg: ASbGncuW5a+ZeLJ+7xtnYjKfKhMPIy2EQYTshbiwc9ZE61dm9ReZppXjcmGu6hXEgC1
	bJ9el2l4JKvP9DRrno4JdYWt7bvV3FzrQFMROT3mVT6gEi7cacHaoUKIQsBUXgzMpw5l2SGQoZ9
	5Q1DaiHSqsClQrW/2fV8v3JzWUPEFlb0NoY2k5QQKE49PDevlGObsaJle+lx2QXsSqRgjZO0S1C
	Vu5eRvuihw2zzVtre0t0MgzlsyI/pIyAgUVWTmrtVCgBsN3QMLeyIvSUN1MxVqslA+zr4U12J/Z
	0oz2dF6+yOQXx0U7yItRzeovw+2olGv0aAuly+cXNDDLqmGQZvF8PA==
X-Google-Smtp-Source: AGHT+IHrtPJf7tJJ5VJyh1jOHcx4HFwLVSxBmFMH5rzu041anN5yYzVbiM1Y436XhCJ6X/gw2IidJQ==
X-Received: by 2002:a05:600c:1c8e:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-43f3a95c43amr105045055e9.19.1744658506479;
        Mon, 14 Apr 2025 12:21:46 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206269c8sm193445625e9.16.2025.04.14.12.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 12:21:46 -0700 (PDT)
Message-ID: <38867e79-c0e3-4bcd-bdf9-3fb5b571d51e@gmail.com>
Date: Mon, 14 Apr 2025 21:21:42 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: `u64` by `u64` div/mod in DRM QR for arm32
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>
References: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Miguel,

On 14.04.25 8:14 PM, Miguel Ojeda wrote:
> Hi Jocelyn, Christian,
> 
> I started build-testing arm 32-bit within my other usual routine
> tests, and I hit:
> 
>     ld.lld: error: undefined symbol: __aeabi_uldivmod
>     >>> referenced by drm_panic_qr.rs:417 (drivers/gpu/drm/drm_panic_qr.rs:417)
>     >>> drivers/gpu/drm/drm_panic_qr.o:(<drm_panic_qr::SegmentIterator
> as core::iter::traits::iterator::Iterator>::next) in archive vmlinux.a
> 
> which comes from both these `u64` by `u64`:
> 
>     let out = (self.carry / pow) as u16;
>     self.carry = self.carry % pow;
> 
> Christian: I guess we can offer a set of `div64` functions using the C
> ones, at least for the time being, and eventually wire the actual
> operator with some support from upstream Rust. Or do you have
> something else in mind? (i.e. I think you have been discussing
> intrinsics lately)

I think using the C implementations is fine. Not sure how much the
FFI is going to matter for performance, but it should be rare enough
that is shouldn't matter (and hopefully we will get cross lang LTO 
or something similar at some point).

We could also just implement the intrinsic(s) ourselves, but then 
the u64 divisions would be implicit which is probably undesired.
We could also rename the intrinsics so they are only usable from 
specific crates. 

I think we need the opinion of the some arm people here.

CC Russell King and Linus Walleij.


I'm not sure what could be done in upstream rust to help here
and that would probably need be a very specific features for the
kernel.


Cheers
Chrisitan
