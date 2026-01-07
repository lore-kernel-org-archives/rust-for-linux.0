Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4B34C9B5
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 14:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796902; cv=none; b=e6cMHa4g+T28RmSCvI9sivee8UUdlwQuWlb5I2SJa9wIYhjuDZa9k/oXpNkHNKeXD1pgIsjg7BkUfKtYjifBo59ezv4/1Cxg3+3n3lu/V1mx21hrqkud77uSNh3ZxL5G2/tkLsQbRRd93wd2pBKqyQZh8UVY+VHqDN3dDFbxNOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796902; c=relaxed/simple;
	bh=f3CVlNdV7O0N8PN9jVFl8HXXj3xKzcKDJzdUeG+9Sso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpPczCbWSz1vw3sY133tc9CjfoeGiyXTPXSpoDQOpOKUh7I/2oHblrauAsD+V1k54J5UgtSEwDh8IJrlTB89tPEr9aYjzzAdg/6Qkzj2dzKWV6hgh0QLLr7t4DL7ElgaK03bane7jyxqTm6VReWSAvY4+JO1V1IpWFyPQuuzF5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34ccbf37205so1412109a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 06:41:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796901; x=1768401701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3KixXfgxdOJGLB9Vmic3Vi3FewjC62X5+HRr7HPr5kE=;
        b=Yug3QMEZfQvcXTp+/6sZ21a9/pBF1/os0nHrtbM4Reo9YNxNG0Gt7yq8+TVHtA4MuY
         quKgT2V4F5mHzQ1aZXFrw4rFYejRJU0VoJ1SJOwMsd8bnoo9Gb/dS9yYcNLR1fUlHPkR
         +r9ofkYbpJy9TvsRSZSKJmVWAFZEmEWPlSOcFgpNX+aSQDWDgL4LYDXsWt3kzq7YG4io
         65lTvi7iof3YGNPL3DSdR4IB21ZmJ9R7kx3p75EEeqDPys2OsaN/bsJxiYQlRJK4SvVw
         OAf+7uCxwK0lUzWkrT035BuE0eFOah7zqTAPDvHRN1cXQdYY7Vt/3qjVAwdjnEXwaYO3
         cS3g==
X-Forwarded-Encrypted: i=1; AJvYcCWcmffqz3ixVShRi4Wwuu2V9SmORGgaH9EgIFX/vS+/RsQGCuYaISrmM+HrJNXuYs5PYRbgFgAQHnXV2QAJ+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa9BY1/iHM9ihdLcFX3bYOSQlTRKZ/jcJaA99d9tA5nNecIcoU
	TT0i5vdJTNlvsIn/q+mRrxY+K/IVA7lrfQvDqFX8UqfdOAlqeVS/NYO6
X-Gm-Gg: AY/fxX6/u/jCxiD1koJI2ueiRGa0GgwwDn79tIjZQKi0XBtuasMeFy53Etk0A3StpEg
	eW3C6QU+1M939R4Iow0rpUQ5nmFyHcIkpuAAEm5g2krjIwriuvR9rsaJaeP7+oUJOxqgrN9Seak
	CS5bW3pWlmL7w1SB46VDIXxWeOO/O/cBiFTwSnIpZe0FEIZIJG/oWwSJcK8PIbJyPn+m/mkmbg5
	STOIOMoH4mMyAv1NMg0IV4x3pXRmzw2xgxH6CO8T91GhzExArfcS6x078nYN5ICM64UVavtg52n
	iva9CbgMFVYarbe8VOG4eRI6fH/WRUU5vcFXNGwiHyxNlTwJ71TI8VioF20oRBy2byXxH0Ky2k0
	ZPkc4rJArPsx00oVOCUeUWcRhg80HmCwfbmYgXDoTxS8w3WgeaTLdQjdexUyzJW4yl8/COb1b8O
	TQx/I=
X-Google-Smtp-Source: AGHT+IG9hyvBNO1C3WgBuasgWUwUyxW56mpud+6G3upT824GAHTuWtZ42PAYcPo0dccAsi+Rk97R9A==
X-Received: by 2002:a17:90b:5643:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-34f68cf39e6mr2612196a91.37.1767796900579;
        Wed, 07 Jan 2026 06:41:40 -0800 (PST)
Received: from [192.168.200.2] ([2a11:8080:200::2:20a2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa947ecsm5323477a91.6.2026.01.07.06.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 06:41:38 -0800 (PST)
Message-ID: <f81367d3-9422-4cb9-9df6-3cd0f327507d@kylinos.cn>
Date: Wed, 7 Jan 2026 22:41:29 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <20260107143738.3021892-2-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This is merely a technical validation. If confirmed viable, I will 
update other RTC drivers.


Best regards,

Ke Sun

On 1/7/26 22:37, Ke Sun wrote:
> Unify RTC driver interface by storing driver data on the RTC device
> instead of the parent device. Update RTC ops callbacks to pass the RTC
> device itself rather than its parent. This change enables better
> support for Rust RTC drivers that store data on the RTC device.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>   drivers/rtc/dev.c       |  4 ++--
>   drivers/rtc/interface.c | 18 +++++++++---------
>   drivers/rtc/rtc-pl031.c |  9 ++-------
>   3 files changed, 13 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> index baf1a8ca8b2b1..0f62ba9342e3e 100644
> --- a/drivers/rtc/dev.c
> +++ b/drivers/rtc/dev.c
> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>   		}
>   		default:
>   			if (rtc->ops->param_get)
> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
> +				err = rtc->ops->param_get(&rtc->dev, &param);
>   			else
>   				err = -EINVAL;
>   		}
> @@ -440,7 +440,7 @@ static long rtc_dev_ioctl(struct file *file,
>   
>   		default:
>   			if (rtc->ops->param_set)
> -				err = rtc->ops->param_set(rtc->dev.parent, &param);
> +				err = rtc->ops->param_set(&rtc->dev, &param);
>   			else
>   				err = -EINVAL;
>   		}
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index b8b298efd9a9c..783a3ec3bb93d 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
>   		err = -EINVAL;
>   	} else {
>   		memset(tm, 0, sizeof(struct rtc_time));
> -		err = rtc->ops->read_time(rtc->dev.parent, tm);
> +		err = rtc->ops->read_time(&rtc->dev, tm);
>   		if (err < 0) {
>   			dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
>   				err);
> @@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
>   	if (!rtc->ops)
>   		err = -ENODEV;
>   	else if (rtc->ops->set_time)
> -		err = rtc->ops->set_time(rtc->dev.parent, tm);
> +		err = rtc->ops->set_time(&rtc->dev, tm);
>   	else
>   		err = -EINVAL;
>   
> @@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
>   		alarm->time.tm_wday = -1;
>   		alarm->time.tm_yday = -1;
>   		alarm->time.tm_isdst = -1;
> -		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
> +		err = rtc->ops->read_alarm(&rtc->dev, alarm);
>   	}
>   
>   	mutex_unlock(&rtc->ops_lock);
> @@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>   	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
>   		err = -EINVAL;
>   	else
> -		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
> +		err = rtc->ops->set_alarm(&rtc->dev, alarm);
>   
>   	/*
>   	 * Check for potential race described above. If the waiting for next
> @@ -568,7 +568,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>   	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>   		err = -EINVAL;
>   	else
> -		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
> +		err = rtc->ops->alarm_irq_enable(&rtc->dev, enabled);
>   
>   	mutex_unlock(&rtc->ops_lock);
>   
> @@ -618,7 +618,7 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>   		rtc->uie_rtctimer.period = ktime_set(1, 0);
>   		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
>   		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
> -			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
> +			err = rtc->ops->alarm_irq_enable(&rtc->dev, 1);
>   		if (err)
>   			goto out;
>   	} else {
> @@ -874,7 +874,7 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
>   	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>   		return;
>   
> -	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
> +	rtc->ops->alarm_irq_enable(&rtc->dev, false);
>   	trace_rtc_alarm_irq_enable(0, 0);
>   }
>   
> @@ -1076,7 +1076,7 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
>   		return -EINVAL;
>   
>   	mutex_lock(&rtc->ops_lock);
> -	ret = rtc->ops->read_offset(rtc->dev.parent, offset);
> +	ret = rtc->ops->read_offset(&rtc->dev, offset);
>   	mutex_unlock(&rtc->ops_lock);
>   
>   	trace_rtc_read_offset(*offset, ret);
> @@ -1111,7 +1111,7 @@ int rtc_set_offset(struct rtc_device *rtc, long offset)
>   		return -EINVAL;
>   
>   	mutex_lock(&rtc->ops_lock);
> -	ret = rtc->ops->set_offset(rtc->dev.parent, offset);
> +	ret = rtc->ops->set_offset(&rtc->dev, offset);
>   	mutex_unlock(&rtc->ops_lock);
>   
>   	trace_rtc_set_offset(offset, ret);
> diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
> index eab39dfa4e5fe..a605034d44cb7 100644
> --- a/drivers/rtc/rtc-pl031.c
> +++ b/drivers/rtc/rtc-pl031.c
> @@ -284,10 +284,6 @@ static int pl031_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
>   
>   static void pl031_remove(struct amba_device *adev)
>   {
> -	struct pl031_local *ldata = dev_get_drvdata(&adev->dev);
> -
> -	if (adev->irq[0])
> -		free_irq(adev->irq[0], ldata);
>   	amba_release_regions(adev);
>   }
>   
> @@ -320,8 +316,6 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>   		goto out;
>   	}
>   
> -	amba_set_drvdata(adev, ldata);
> -
>   	dev_dbg(&adev->dev, "designer ID = 0x%02x\n", amba_manf(adev));
>   	dev_dbg(&adev->dev, "revision = 0x%01x\n", amba_rev(adev));
>   
> @@ -356,6 +350,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>   		ret = PTR_ERR(ldata->rtc);
>   		goto out;
>   	}
> +	dev_set_drvdata(&ldata->rtc->dev, ldata);
>   
>   	if (!adev->irq[0])
>   		clear_bit(RTC_FEATURE_ALARM, ldata->rtc->features);
> @@ -369,7 +364,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>   		goto out;
>   
>   	if (adev->irq[0]) {
> -		ret = request_irq(adev->irq[0], pl031_interrupt,
> +		ret = devm_request_irq(&adev->dev, adev->irq[0], pl031_interrupt,
>   				  vendor->irqflags, "rtc-pl031", ldata);
>   		if (ret)
>   			goto out;
