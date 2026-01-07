Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0342C72602
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 23:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767827921; cv=none; b=BetUYoHYuvxKmtJSUgapOm8VTsU+mVfYcs8Cg0PMi/mOzxkV3rncOCgx9Wkio1zWY+7jf9FlTSRPzNy9ZYN/YsCckdIk0LiVbMohshXzN4mRI7HK6ifXzddCt5MCMXk8KvGfAZW+3gZeHG41Ot7Lz6MDYgHGQFvqACvOI6J1rw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767827921; c=relaxed/simple;
	bh=3V8Rup40PO9Bzai89Z262iIf9xz/B60P11vnovI4XCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f6IfdnOjqkqDscb0/yjSTmZjeFvgzSJurfql0iAr/hsgjhZZqQ33MUHG1V4tcbLmQl2iOXDDfc2gnxgzpvarKKdUWIodrgmzdoiwzZYMIN6Ejz4WdI08FZSNTkGFNnDc12pYKXQ6v8bcJIeGXirtmqStvqHH3yJwZpsnJhZOP/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c708702dfso1817359a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 15:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767827917; x=1768432717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GlLwh9++9jd/IDcukFf1CLHtLH2QHDVOYSauRCwk2t4=;
        b=Y3h7AJ41tnnXpqmVYzGetIXDVSwU0PyJQK547YSCSimwLwTmTPlABI+r9LdaiaxTys
         7g0WrL10LIARcaOyiqvQ5LuRc34AXv91CNKIks1Jru78Bg3wCTx8zDAvbjB0G26UccfG
         KmEYMGiY+3W2LFQLe3xB7oXBIt5BGOtrpSgE3WlCbVL5j5jzrrMPqwY1WlOSReeDtle5
         Ad3Q0T7R8r+Ns51CAyMTAzGtUIciEM47NuolkLeqD/dtfQQjj7237liPUkkcBgla3KW/
         OO+PiBqWi5B5OALMeg68lJQ2EUjNfh3WV1nwUfHdwvXQvcLVy9CGE2VEllHslfrkVrOG
         0a6g==
X-Forwarded-Encrypted: i=1; AJvYcCXUosWEIDv+6jiiNny85dGVAMLvxupxpG+VEj19G+qs0LjBt+2VMRHm1WcsUcjzDopqCftOnLwH+GvIo4HwNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjOkuIw98JPO6y0v1CGoy4+pHJLi/ES7mduvEeIqVyOVYIkyqX
	iBmE//Bd9bAjiA0c7QNe5/oj/IR6lBaHpNKLiPZK98Zm3ygn8eCmV0Re
X-Gm-Gg: AY/fxX4ZxzEJQuHbBhhzJOjhn6Yx14CXF8j0m1uqVtO6nWsEXOcEkjnaCe+dexvjGd5
	vji99AB5sGf0BXlW0d9F4WbHvGOe+L8GumJhhsRcs0xZZQOM4iU3yws26GCb1frIH/eEXrorOGb
	Y/zoqQoJtIUe83BtP1/fY/dTo3aG2U5FPQihDgiRFacXCIn9DZAk81E5/+cNLp7ut50Zq1tRNek
	+sEq+WOtwBtONwXDqVxgVP3wtypynw7w/Fbz/+rK91Snltlao6BaqZLfCijQfPSTlskzu4BwLDr
	uPMz+OcmRogpSjiLFEW2LpcQiWhcApF9fs5KmchiA6F22XowoRTg2kKfryH33Byx6/RPOrf1sVH
	gqyH2gehzdvmaabMcqt9h+YS06BMLveCGqVHqpRFSnif8qxSw8c1b/Gn8OaylphLtXWfE
X-Google-Smtp-Source: AGHT+IF4DZ7OQlAZQ0zZ3j6/HWfrUCsHEdFnFn710jjTev06Am9MDt2cEH3V7H1laaoeCJGaQ3TjsQ==
X-Received: by 2002:a17:90b:5848:b0:34c:27ad:71e7 with SMTP id 98e67ed59e1d1-34f68cccd55mr3562459a91.35.1767827917244;
        Wed, 07 Jan 2026 15:18:37 -0800 (PST)
Received: from [192.168.200.2] ([2403:2c80:17::10:4008])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f8b0d7esm5968006a91.16.2026.01.07.15.18.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 15:18:36 -0800 (PST)
Message-ID: <a95aff4b-5dbf-4def-803a-d5aea84113a5@kylinos.cn>
Date: Thu, 8 Jan 2026 07:18:30 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <2026010757-fester-unissued-6e5f@gregkh>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <2026010757-fester-unissued-6e5f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 00:12, Greg KH wrote:
> On Wed, Jan 07, 2026 at 10:37:33PM +0800, Ke Sun wrote:
>> Unify RTC driver interface by storing driver data on the RTC device
>> instead of the parent device. Update RTC ops callbacks to pass the RTC
>> device itself rather than its parent. This change enables better
>> support for Rust RTC drivers that store data on the RTC device.
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>   drivers/rtc/dev.c       |  4 ++--
>>   drivers/rtc/interface.c | 18 +++++++++---------
>>   drivers/rtc/rtc-pl031.c |  9 ++-------
>>   3 files changed, 13 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
>> --- a/drivers/rtc/dev.c
>> +++ b/drivers/rtc/dev.c
>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>   		}
>>   		default:
>>   			if (rtc->ops->param_get)
>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
>> +				err = rtc->ops->param_get(&rtc->dev, &param);
>>   			else
>>   				err = -EINVAL;
>>   		}
>> @@ -440,7 +440,7 @@ static long rtc_dev_ioctl(struct file *file,
>>   
>>   		default:
>>   			if (rtc->ops->param_set)
>> -				err = rtc->ops->param_set(rtc->dev.parent, &param);
>> +				err = rtc->ops->param_set(&rtc->dev, &param);
>>   			else
>>   				err = -EINVAL;
>>   		}
>> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
>> index b8b298efd9a9c..783a3ec3bb93d 100644
>> --- a/drivers/rtc/interface.c
>> +++ b/drivers/rtc/interface.c
>> @@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
>>   		err = -EINVAL;
>>   	} else {
>>   		memset(tm, 0, sizeof(struct rtc_time));
>> -		err = rtc->ops->read_time(rtc->dev.parent, tm);
>> +		err = rtc->ops->read_time(&rtc->dev, tm);
>>   		if (err < 0) {
>>   			dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
>>   				err);
>> @@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
>>   	if (!rtc->ops)
>>   		err = -ENODEV;
>>   	else if (rtc->ops->set_time)
>> -		err = rtc->ops->set_time(rtc->dev.parent, tm);
>> +		err = rtc->ops->set_time(&rtc->dev, tm);
>>   	else
>>   		err = -EINVAL;
>>   
>> @@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
>>   		alarm->time.tm_wday = -1;
>>   		alarm->time.tm_yday = -1;
>>   		alarm->time.tm_isdst = -1;
>> -		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
>> +		err = rtc->ops->read_alarm(&rtc->dev, alarm);
>>   	}
>>   
>>   	mutex_unlock(&rtc->ops_lock);
>> @@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>>   	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
>>   		err = -EINVAL;
>>   	else
>> -		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
>> +		err = rtc->ops->set_alarm(&rtc->dev, alarm);
>>   
>>   	/*
>>   	 * Check for potential race described above. If the waiting for next
>> @@ -568,7 +568,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>>   	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>>   		err = -EINVAL;
>>   	else
>> -		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
>> +		err = rtc->ops->alarm_irq_enable(&rtc->dev, enabled);
>>   
>>   	mutex_unlock(&rtc->ops_lock);
>>   
>> @@ -618,7 +618,7 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>>   		rtc->uie_rtctimer.period = ktime_set(1, 0);
>>   		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
>>   		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
>> -			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
>> +			err = rtc->ops->alarm_irq_enable(&rtc->dev, 1);
>>   		if (err)
>>   			goto out;
>>   	} else {
>> @@ -874,7 +874,7 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
>>   	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>>   		return;
>>   
>> -	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
>> +	rtc->ops->alarm_irq_enable(&rtc->dev, false);
>>   	trace_rtc_alarm_irq_enable(0, 0);
>>   }
>>   
>> @@ -1076,7 +1076,7 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
>>   		return -EINVAL;
>>   
>>   	mutex_lock(&rtc->ops_lock);
>> -	ret = rtc->ops->read_offset(rtc->dev.parent, offset);
>> +	ret = rtc->ops->read_offset(&rtc->dev, offset);
>>   	mutex_unlock(&rtc->ops_lock);
>>   
>>   	trace_rtc_read_offset(*offset, ret);
>> @@ -1111,7 +1111,7 @@ int rtc_set_offset(struct rtc_device *rtc, long offset)
>>   		return -EINVAL;
>>   
>>   	mutex_lock(&rtc->ops_lock);
>> -	ret = rtc->ops->set_offset(rtc->dev.parent, offset);
>> +	ret = rtc->ops->set_offset(&rtc->dev, offset);
>>   	mutex_unlock(&rtc->ops_lock);
>>   
>>   	trace_rtc_set_offset(offset, ret);
>> diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
>> index eab39dfa4e5fe..a605034d44cb7 100644
>> --- a/drivers/rtc/rtc-pl031.c
>> +++ b/drivers/rtc/rtc-pl031.c
>> @@ -284,10 +284,6 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>>   
>>   static void pl031_remove(struct amba_device *adev)
>>   {
>> -	struct pl031_local *ldata = dev_get_drvdata(&adev->dev);
>> -
>> -	if (adev->irq[0])
>> -		free_irq(adev->irq[0], ldata);
>>   	amba_release_regions(adev);
>>   }
>>   
>> @@ -320,8 +316,6 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>   		goto out;
>>   	}
>>   
>> -	amba_set_drvdata(adev, ldata);
>> -
>>   	dev_dbg(&adev->dev, "designer ID = 0x%02x\n", amba_manf(adev));
>>   	dev_dbg(&adev->dev, "revision = 0x%01x\n", amba_rev(adev));
>>   
>> @@ -356,6 +350,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>   		ret = PTR_ERR(ldata->rtc);
>>   		goto out;
>>   	}
>> +	dev_set_drvdata(&ldata->rtc->dev, ldata);
>>   
>>   	if (!adev->irq[0])
>>   		clear_bit(RTC_FEATURE_ALARM, ldata->rtc->features);
>> @@ -369,7 +364,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>   		goto out;
>>   
>>   	if (adev->irq[0]) {
>> -		ret = request_irq(adev->irq[0], pl031_interrupt,
>> +		ret = devm_request_irq(&adev->dev, adev->irq[0], pl031_interrupt,
>>   				  vendor->irqflags, "rtc-pl031", ldata);
> Are you _SURE_ you can use devm for this?  it is a functional change,

Since ldata's lifecycle is now tied to the RTC device (stored via
dev_set_drvdata(&ldata->rtc->dev, ldata)), and the RTC device's lifecycle
is tied to the amba_device (via devm_rtc_allocate_device(&adev->dev)),
using devm_request_irq(&adev->dev, ...) allows us to remove the manual IRQ
release in pl031_remove, as the IRQ will be automatically released along
with the amba_device lifecycle.


Is this reasoning correct, or should I handle this differently?


thanks,

Ke Sun

> one that trips lots of people up.  I wouldn't make this change without
> at least saying why you are doing so in the changelog text, which I
> didn't see at all here.
>
> thanks,
>
> greg k-h
