Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776E407573
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 08:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768896109; cv=none; b=MOmI8w9YVI+HFuzAfhOaehnr9IQf3jkJpEpKgS4806rd/2R7vSyocjwM2c6INFfC7sVHxXSEflo8xEidff2bqOqAVKWmgKbraeGo/DejZuvmVOzrdBrb4zXoUrXyHadpXXOlBcchJyy9xX/Ehli8+tCkV4LA5usTKSSnkA/brVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768896109; c=relaxed/simple;
	bh=0vtMIkWvFv38BtB2UgJNGiK8/4dNFQkMGCAxXn5LHe4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0OMylMvwdFaXFNQu7IHBznK309rYtmdWL/FM0Hv0SLMkg4tFIqDVYdPcSfxzcjWGIrrie/AC/kZfk+2Od56bq9DSzZBIhr5p0dxwlDlh1uFfJ/35ozEZDSMaFOh33+XKeRsUYV6i2UcUAL19RUCFfExkjMvkja90dmZqdkDTXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oen+uj12; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oen+uj12"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a0fe77d141so33393665ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 00:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768896106; x=1769500906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABvBbtXQdnWyWjUicvGm8YHeqIfqX8LGFS6NrmCUBwM=;
        b=Oen+uj12t/T5JZ29/CrMYuuYa5z6h9R2CCb/bUnXmPWHf+DeHkqWY+jiKP8gyz6DIZ
         OjnDuoSK9qGef1YVd2BjbIwtcILL2qGSzzLdr8yYSej1a5xEr9NFX7TX7Od6NxM3W9S+
         F8Lcmg5pkazJS+jQVmf6WPY3X/8kV8rjpIDxEiFlHzn8/xSVjDjRjkADaw6woy+8m8CN
         Z57iY3C/ha3Wu6Fwy2+g89hhhSVnA5ASLfm1sk/Hjp4QWhtyqvPz9qxYQTA1FS+HRywL
         4FKCmRWGkO45VFyuTVSZiDfzIN0iPKHnW6rG/M8sbH6THwrgh6RnHsaBG/73rX8AxD6M
         GUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768896106; x=1769500906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABvBbtXQdnWyWjUicvGm8YHeqIfqX8LGFS6NrmCUBwM=;
        b=rD7bioIZ5ve04I8cYqtd04+PLkJb9FYpJiE4SA/jje47RgCvK6MUwo+EibfJEeE7mD
         tBxcd/sgSQ4bmshvaUolo8G2TNeRLoB5EHrxUSD3JK4+KzkQpxlZFUv9YCPeHm3s2ixT
         QBOUi541Vl1jJo7sVrFjgHYmnjFVzzoJk8xJldjSGifQy67Fc86NhrsravYcxg72ULYF
         HwZl9P+5p01cx4PZsQgjOh++3Pw7b1l1Fd/qYTcCadsPcDSxKZi3vT1dQn/+bA4gda5a
         zngvcqKwSAO3LD9qyG9l6hIrTOyR37z9NNolxHDwmTI9Mh2q+Uqd7Mke9zGbpCQrB00K
         4pEw==
X-Forwarded-Encrypted: i=1; AJvYcCXYwC40t9xfBEieP2boxSRihjGZt5kj8oz+9ht3lxnBUKDoA0iEJ39bBK+Q8LbgMzx+++Q2EhiM5AlwDUF6CQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYu4PCsGuSi9vk7I9GDTv9Pz7saz3nRbiUgSsq+UVtrExFEYjA
	jJK5Ir9jU1rgIeEZb7lXaZCA2X48+5Ne26gHIGH9rlLAP5jikwHAA3g0
X-Gm-Gg: AZuq6aJnIF4tCl+NPUUJ5Kz8G9LqdQiWB7ZiOAE1bK9Qv3wEiA+ejuLI2kSvT6O62Zr
	cG2gjLzykR5S8KLhI3F4cXZr28hkIWHbe2pGsUr547w8pmjwb57tPWzFRZJAsswMD3gZB6wJCfQ
	XSXaTYYGqTOL6Krgu/qLIF/WskWO0OwRzwHOUaBNweVm66tFz5MlGCxXEaD94l8EYt+yLaFYJd8
	T6A1EV+4xAs6n9bNtD7d77w3VzthST0e+qG3gT54bpCufpM7hZE/efnjetvS7ArimKcqte36T+7
	2+0QbqC8uypm9+wrWAj/hJ8BWdTyjl17pGBwwlAoVLZmVA++sBHUomUp+iRCWCBxa/Kqk8pyHe7
	OWNH2+TAq5Y//R/2ll58i5uC9pOyvgkEuHUXMxs0psQWueU4JGEq3jVxHSmW+MlodlVjV
X-Received: by 2002:a17:902:d488:b0:295:7b89:cb8f with SMTP id d9443c01a7336-2a717413b94mr107094885ad.0.1768896105606;
        Tue, 20 Jan 2026 00:01:45 -0800 (PST)
Received: from [10.0.10.3] ([2403:2c80:17::10:4008])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941c56bsm116454455ad.92.2026.01.20.00.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 00:01:45 -0800 (PST)
Message-ID: <77d373dc-c5f2-4dca-b0d2-b5cee6a21b3b@gmail.com>
Date: Tue, 20 Jan 2026 16:01:40 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
To: Danilo Krummrich <dakr@kernel.org>, Ke Sun <sunke@kylinos.cn>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
 <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <DFSN0O9RRVD6.1LCI38JKGO1R0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/19/26 22:32, Danilo Krummrich wrote:
> On Fri Jan 16, 2026 at 5:21 PM CET, Ke Sun wrote:
>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>> index baf1a8ca8b2b1..eddcc5a69db3b 100644
>> --- a/drivers/rtc/dev.c
>> +++ b/drivers/rtc/dev.c
>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>   		}
>>   		default:
>>   			if (rtc->ops->param_get)
>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
>> +				err = rtc->ops->param_get(rtc_ops_dev(rtc), &param);
>>   			else
>>   				err = -EINVAL;
>>   		}
> <snip>
>
>> +/**
>> + * rtc_ops_dev - Get the device pointer for RTC ops callbacks
>> + * @rtc: RTC device
>> + *
>> + * Returns &rtc->dev if RTC_OPS_USE_RTC_DEV flag is set,
>> + * otherwise returns rtc->dev.parent.
>> + */
>> +static inline struct device *rtc_ops_dev(struct rtc_device *rtc)
>> +{
>> +	if (test_bit(RTC_OPS_USE_RTC_DEV, &rtc->flags))
>> +		return &rtc->dev;
>> +	return rtc->dev.parent;
>> +}
> I understand that the idea is to gradually convert all drivers to use the RTC
> device, rather than it's parent device in RTC device callbacks.
>
> My main concern is that once that has been achieved it's still not what we want
> to have eventually, i.e. RTC device callbacks should ideally take a struct
> rtc_device as argument and not the embedded base struct device.
>
> I.e. we'd kick off a conversion process that won't reach the actual desired
> state.
Hi Danilo,

This is indeed an intermediate step.

Full cleanup is in progress, but it's large and untested. I'm working on a
complete cleanup involving ~190+ files across arch/, drivers/rtc/, and
drivers/virtio/. Most changes are straightforward interface replacements,
but some drivers need additional modifications. Given the scale, I haven't
fully tested everything and can't guarantee correctness yet.

The intermediate step enables gradual migration, allowing us to:
- Clean up and test each rtc driver incrementally
- Ensure correctness through gradual changes
- Avoid breaking existing functionality

Once all cleanup is complete and tested, changing all rtc_class_ops
callbacks to use struct rtc_device * will be much simpler and safer.

Currently there seem to be only these two approaches. I'm still waiting
for Alexandre's suggestion on how to proceed specifically, but haven't
received a response yet.

Best regard,
Ke Sun
