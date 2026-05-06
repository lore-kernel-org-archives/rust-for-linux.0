Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7B631AA94
	for <rust-for-linux@vger.kernel.org>; Wed,  6 May 2026 19:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778096699; cv=none; b=XIxJG8yV7Da7gBc3/vQNlnCgLAE/MIJZLDgyHkg6N3+uvuMzpdZinvdmHqaEtGxzCBLyi12uFNu++fBV7hpPpc+1aBtHts0VPHs37pu9+kwSONfKVjcYNIgHpUQjoN39rm/pRUNnOFQBWyiMGaZywtASyozYX9ZnqPEojF+2jxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778096699; c=relaxed/simple;
	bh=JqGLpdLb1snUOwfA8YpmEoiA3kJOIkemImw8Vx+HEYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4gHF/9BfYYYP4GxKi00JUQ2WyF0Fzndz9AahCak7xhTY9bRo3Pwnjx5Qnc3vqCb7zB2HMKje5LW/+wmp6fx3VoNVlGPr8rKt2V6GFf1i5IGCkXkr8M+eIyPbkOYyP5jC7vQH0zdIVNzdiCUQbivshEyI8uLXRuKJbiHoAWzm6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TPcrVRgr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TPcrVRgr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891b0786beso432145e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 06 May 2026 12:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778096697; x=1778701497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JqGLpdLb1snUOwfA8YpmEoiA3kJOIkemImw8Vx+HEYI=;
        b=TPcrVRgrQMVeUMCwOBfBsqipaLdXeSwBqVF+Yn50WCStqGRCd++wYEed6t8Lkx5aLK
         MBj8pQ2zK6lGizkdP8aI7HYklEyyZrgwKf7nTATr/ScKh0zdpjHSZgLOYjxBMhDz8rrF
         W3n8TVmqzKhg13HxTltxestQ3/LVYEZ204uofb1ooGgaa8+ZUe5w9JNUssQ/7zrixikX
         JKMm2QbCAg1CDRbidhiMdIJBdZEmdTWcIYcFEfquKB2bhvGB+dy7gzKnafGQey0HPBxN
         bZt+6TBlkg0SP7zLn0cUICFwcViH9g7soI2NN7RKfksgARI0B00l81TJw8zaz4JwDnPF
         Xl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778096697; x=1778701497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqGLpdLb1snUOwfA8YpmEoiA3kJOIkemImw8Vx+HEYI=;
        b=G6J3m8G7X86Bm2T6upMiK0rdl2L7a6zu54zXLeGLXY6bfjF/wMmZO/arwvW+LoumEG
         wDMLVtVkHS4Ej3+ZJT9JdH63DmOlcdS1RExYuQ4t+lW9jbkZucDtQNa3IDVUquaq0vKf
         OqOAPIYuGhmHmwpa8vfhSu1Wbg8U+/pC1l1U9PCpnmQ00Rl0g3qBv7IDZBEK+yvNn4fh
         lhDwsOyIL71JULkz/Kp8OoFkQXXPJ1KXqwjupk3+BvfbJ7Bol2GiyGY47Pzphj7Fq7Is
         Zjt4LZmLoi5PydnJbSnkkKLCGpCKyQeubAc6PmK+hAE99LJ6R6H88gTPiiOpvHWPrLDC
         t/yg==
X-Forwarded-Encrypted: i=1; AFNElJ/5gCThTkeNBPi8UTponXT0jLpKPZAA5NAZSWSrcppKRTZ13aJE2vlkAJN+xVOrqcdY2sjPWxE6fEjvPOiFmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV3B4BmV3vpik4zXbilcu9PCCG+vdBSq3wuUPwACE9FG2wS5Zs
	bLd82Bm6KeU2XdFgKMbtElBSNF8/UO1TRinD0nQdpUS5KEeAZUSAgF+B
X-Gm-Gg: AeBDietcDtfhm7fGWFI9hJhgvtz5ofOZ5mbdIRL9iYFxBt66fV2y9NuPN6jZjKVUbjk
	Mu45NDc8kaU89SdNa5XRNmXB9q3ykI6yPkwnTjdhe8tp16Zg9deYPGrVPLQ+VwBGWVJuRywJa+K
	Y8FGgsm4nG+3zDRPSFdHhtsDSBMlaOL4IgsuXtOPGO6luFZe8Z06/N/PA3sKgC0IEJWlsZ01SK3
	h3yor4pxsN5yh+9nW/nV0+RCLiemNYR3fQGTPm5hbM+fNBuM6j0aDTFEx+2SasAni7u1hiX9ykB
	pzKk/7rGd/WxNwV0K+6xX6dRabodci6n//AHpPGE5d83Cv3O+QvvG4B554nteG3cwXKp96anglB
	Cw+r7irNetJ8uEaI3g5KcEKjjqwZBVeUWm0+g/1NYNnVcbIyMX17WBps2LR+eWFRp/hx987D9yV
	d/Q1rCH/LwRtUbWTn8R+o6adMJeoBdn1ZzTkd7SVexbirAVgg1M9lo0UIh6VJyFavKGIwMdnEDj
	jxCcZrAR93MKr6PcG7BpyqhPt1m84+axMMihXc=
X-Received: by 2002:a05:6000:454b:b0:452:6aaf:76cb with SMTP id ffacd0b85a97d-4526aaf7700mr2060260f8f.1.1778096696657;
        Wed, 06 May 2026 12:44:56 -0700 (PDT)
Received: from ?IPV6:2a06:5906:2639:e200:6958:e55d:575e:c24c? ([2a06:5906:2639:e200:6958:e55d:575e:c24c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03d4csm15073323f8f.22.2026.05.06.12.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 12:44:56 -0700 (PDT)
Message-ID: <ae4df358-4f61-429d-b8be-2f63823f05b3@gmail.com>
Date: Wed, 6 May 2026 20:44:57 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/4] i2c: rust: add smbus_read_byte_data and
 smbus_read_word_data
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>,
 Igor Korotin <igor.korotin@linux.dev>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org,
 rust-for-linux@vger.kernel.org, devicetree@vger.kernel.org,
 branstj@gmail.com, lars@metafoo.de, ojeda@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
References: <20260429132234.30514-1-muchamadcoirulanwar@gmail.com>
 <20260429132234.30514-2-muchamadcoirulanwar@gmail.com>
 <5f126a59-9f03-44e3-b4cd-27f70bd9840b@linux.dev>
 <CAO26r3R_TxwMwLoJMqjAG0pd2P__V-WmGkTcrZFt6CQwa2y1cA@mail.gmail.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <CAO26r3R_TxwMwLoJMqjAG0pd2P__V-WmGkTcrZFt6CQwa2y1cA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/2026 8:46 AM, Muchamad Coirul Anwar wrote:
> Quick question on logistics: would you prefer the Io trait patches as
> a separate series, or bundled as prerequisites in my v3 for the AS5600
> driver?

Bundled patch is pretty fine by me

Thanks
Igor
