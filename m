Received: from mail-yx1-f66.google.com (mail-yx1-f66.google.com [74.125.224.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F9E318ED8
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768580690; cv=none; b=AjIp0b9srmjvWsIFXIXdJ/MF35Hl7XdAokcLZSvXqQUPf/P/RCJPqa6NDBAXd/ea/+CqvRDFidFHeIJkr3outZnNNuvBn/PIpTqKPPO2haQNdJOcjymMHkERnKRBtHKvBGM+Snfv9A7fAimH4i81KUIt8H5+1quQAL2KNU+D8RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768580690; c=relaxed/simple;
	bh=PDDAxwDSM+4JQfaCZzPgYZV2nW1f9nBlLbs9jHQ1J7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMxTajsCN2nn/25dZZ4zxqTSvqAIlbUiA3lxXACA6k7x1NkbwYdKBOxCyk4l8/R6n/B5ucpjkQRBoKHLv609PVj3y5gQUO+aWCNlYOoavfl6XgTivOeyaPZZlSAjfsI36Ck31CiCF9ED9k1Ohrc0GtYx5N0ErOZgX6g4uglyhqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f66.google.com with SMTP id 956f58d0204a3-6466d8fd383so2106103d50.2
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jan 2026 08:24:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768580687; x=1769185487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OW0hkFl/IcPdxAHAQx0RE13EVG92O9eXPl2jCuiOLWw=;
        b=vgQzQE8dlYPgRTXCS6OqJRhMmE9QSjJ+/ggm6uktZXsvpU+GxGYw2y2591ISj51qtm
         d+CVRPOFh2F7hSEwMNtOBghuQ1nlJBVl42aW+VnwWDiEWKGeYeVR9Bl14/IacOODzVn2
         m2AY0fP0c7b273vG2NUGGF/caLxC/0RPFxJl77lU5cKgipzRRmSg0i+FN+Q8lpTkL01+
         rTxHzoIkCLxFx9sncn5B1C7Os9l1AiVWIgzyEvLs16uMhypyr3ApVeWMNp3sus73s2+Z
         MVpD6btKnpFIepxWm7ITiPTUBLdM+HHjzrKUdf+YJ6L6JekLjapq5VuTdQNsXoXMs/ET
         ZvSw==
X-Forwarded-Encrypted: i=1; AJvYcCWi285RLr7Y6UMiHGawIECMmkygkW9Y0yHW1fy9M36dCc6u0U4DQ8oV1WZqz+eW+4+QtMFhPtMOJkpiwHjqWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZpgsuJhONWTwdz4IWZUE4RNu5ZaUEmCNK1rqOLfW2SOgeI7eq
	g1MAq0PtNO2lDFiw8gKnpHb/lFnkyCGa3FASJZdirOIu3Kgs251aWbjv
X-Gm-Gg: AY/fxX6b7HxqKppZwDPWj7Le3gwfxZpw06LT4HquRfjNqbEtzu3lhyqntzfnkJaOxux
	aI3xgVHIzCYl/pQNLa1SMLfVNfNlEWZPKq5E/+kkb10QpENsLCCAmH3zvBRTze88aA715sevWgE
	9c7SKD4j2cZ+LlVW5wpXQzTjixyvbQhy5bgtnE5NGcxxlTvA/v6eoLiXgjTlT4+2F7GIs5j04dx
	hyEn6UveC+3n1Vq+7bsR1jU42zUXzd64BImEQ2iIlSHp0vk38kXrhkSGan/reD7ftwk4tuXqiJ2
	6WPLexxGM4/K1Fti+JevVlKQud9qJn4/Zp2NFTQrudq3Q0n1Zls4mo8NMzLdEPbn6NLKSMmx1F6
	h34wx12psEIRNHAr4YVcIv2B69NMUNXbf38DDJ8f+uwxL2ORHmoN4QoTB4/+VOV6Gv/vZulr1e8
	dpOBN6uepphbF/oS9JEZRYgCd+cb4tNYLY/yJM
X-Received: by 2002:a05:690e:418b:b0:644:b4b7:35d9 with SMTP id 956f58d0204a3-649165082e6mr2862966d50.92.1768580686510;
        Fri, 16 Jan 2026 08:24:46 -0800 (PST)
Received: from [192.168.200.2] (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649170be5desm1345376d50.19.2026.01.16.08.24.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 08:24:46 -0800 (PST)
Message-ID: <01b095e5-7d68-44ed-9aee-3352deb42a17@kylinos.cn>
Date: Sat, 17 Jan 2026 00:24:38 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] rtc: add device selector for rtc_class_ops
 callbacks
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Alvin Sun <sk.alvin.x@gmail.com>
References: <20260116162203.296844-1-sunke@kylinos.cn>
 <20260116162203.296844-2-sunke@kylinos.cn>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <20260116162203.296844-2-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexandre,

I have an alternative solution based on our previous v2 discussion [1]. I've
completed modifications for most of the drivers and am currently doing a 
manual
review. If you're interested, I can share it for discussion.

[1] 
https://lore.kernel.org/rust-for-linux/7c6af8a1-9c5e-46b1-8c17-8ffd443fa6aa@kylinos.cn/

Best regards,
Ke Sun

On 1/17/26 00:21, Ke Sun wrote:
> Add rtc_ops_dev() helper to allow drivers to choose whether
> rtc_class_ops callbacks receive rtc->dev or rtc->dev.parent. This
> enables Rust RTC drivers to store driver data on the RTC device.
>
> The helper checks RTC_OPS_USE_RTC_DEV flag: if set, returns &rtc->dev;
> otherwise returns rtc->dev.parent.
>
> Update all rtc_class_ops callback invocations to use rtc_ops_dev(rtc)
> instead of directly accessing rtc->dev.parent.
>
> Maintains backward compatibility for existing C drivers.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>   drivers/rtc/dev.c       |  6 +++---
>   drivers/rtc/interface.c | 18 +++++++++---------
>   drivers/rtc/proc.c      |  2 +-
>   include/linux/rtc.h     | 15 +++++++++++++++
>   4 files changed, 28 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> index baf1a8ca8b2b1..eddcc5a69db3b 100644
> --- a/drivers/rtc/dev.c
> +++ b/drivers/rtc/dev.c
> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>   		}
>   		default:
>   			if (rtc->ops->param_get)
> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
> +				err = rtc->ops->param_get(rtc_ops_dev(rtc), &param);
>   			else
>   				err = -EINVAL;
>   		}
> @@ -440,7 +440,7 @@ static long rtc_dev_ioctl(struct file *file,
>   
>   		default:
>   			if (rtc->ops->param_set)
> -				err = rtc->ops->param_set(rtc->dev.parent, &param);
> +				err = rtc->ops->param_set(rtc_ops_dev(rtc), &param);
>   			else
>   				err = -EINVAL;
>   		}
> @@ -450,7 +450,7 @@ static long rtc_dev_ioctl(struct file *file,
>   	default:
>   		/* Finally try the driver's ioctl interface */
>   		if (ops->ioctl) {
> -			err = ops->ioctl(rtc->dev.parent, cmd, arg);
> +			err = ops->ioctl(rtc_ops_dev(rtc), cmd, arg);
>   			if (err == -ENOIOCTLCMD)
>   				err = -ENOTTY;
>   		} else {
> diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
> index b8b298efd9a9c..4c81130fb0394 100644
> --- a/drivers/rtc/interface.c
> +++ b/drivers/rtc/interface.c
> @@ -91,7 +91,7 @@ static int __rtc_read_time(struct rtc_device *rtc, struct rtc_time *tm)
>   		err = -EINVAL;
>   	} else {
>   		memset(tm, 0, sizeof(struct rtc_time));
> -		err = rtc->ops->read_time(rtc->dev.parent, tm);
> +		err = rtc->ops->read_time(rtc_ops_dev(rtc), tm);
>   		if (err < 0) {
>   			dev_dbg(&rtc->dev, "read_time: fail to read: %d\n",
>   				err);
> @@ -155,7 +155,7 @@ int rtc_set_time(struct rtc_device *rtc, struct rtc_time *tm)
>   	if (!rtc->ops)
>   		err = -ENODEV;
>   	else if (rtc->ops->set_time)
> -		err = rtc->ops->set_time(rtc->dev.parent, tm);
> +		err = rtc->ops->set_time(rtc_ops_dev(rtc), tm);
>   	else
>   		err = -EINVAL;
>   
> @@ -200,7 +200,7 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
>   		alarm->time.tm_wday = -1;
>   		alarm->time.tm_yday = -1;
>   		alarm->time.tm_isdst = -1;
> -		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
> +		err = rtc->ops->read_alarm(rtc_ops_dev(rtc), alarm);
>   	}
>   
>   	mutex_unlock(&rtc->ops_lock);
> @@ -441,7 +441,7 @@ static int __rtc_set_alarm(struct rtc_device *rtc, struct rtc_wkalrm *alarm)
>   	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features))
>   		err = -EINVAL;
>   	else
> -		err = rtc->ops->set_alarm(rtc->dev.parent, alarm);
> +		err = rtc->ops->set_alarm(rtc_ops_dev(rtc), alarm);
>   
>   	/*
>   	 * Check for potential race described above. If the waiting for next
> @@ -568,7 +568,7 @@ int rtc_alarm_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>   	else if (!test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>   		err = -EINVAL;
>   	else
> -		err = rtc->ops->alarm_irq_enable(rtc->dev.parent, enabled);
> +		err = rtc->ops->alarm_irq_enable(rtc_ops_dev(rtc), enabled);
>   
>   	mutex_unlock(&rtc->ops_lock);
>   
> @@ -618,7 +618,7 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
>   		rtc->uie_rtctimer.period = ktime_set(1, 0);
>   		err = rtc_timer_enqueue(rtc, &rtc->uie_rtctimer);
>   		if (!err && rtc->ops && rtc->ops->alarm_irq_enable)
> -			err = rtc->ops->alarm_irq_enable(rtc->dev.parent, 1);
> +			err = rtc->ops->alarm_irq_enable(rtc_ops_dev(rtc), 1);
>   		if (err)
>   			goto out;
>   	} else {
> @@ -874,7 +874,7 @@ static void rtc_alarm_disable(struct rtc_device *rtc)
>   	if (!rtc->ops || !test_bit(RTC_FEATURE_ALARM, rtc->features) || !rtc->ops->alarm_irq_enable)
>   		return;
>   
> -	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
> +	rtc->ops->alarm_irq_enable(rtc_ops_dev(rtc), false);
>   	trace_rtc_alarm_irq_enable(0, 0);
>   }
>   
> @@ -1076,7 +1076,7 @@ int rtc_read_offset(struct rtc_device *rtc, long *offset)
>   		return -EINVAL;
>   
>   	mutex_lock(&rtc->ops_lock);
> -	ret = rtc->ops->read_offset(rtc->dev.parent, offset);
> +	ret = rtc->ops->read_offset(rtc_ops_dev(rtc), offset);
>   	mutex_unlock(&rtc->ops_lock);
>   
>   	trace_rtc_read_offset(*offset, ret);
> @@ -1111,7 +1111,7 @@ int rtc_set_offset(struct rtc_device *rtc, long offset)
>   		return -EINVAL;
>   
>   	mutex_lock(&rtc->ops_lock);
> -	ret = rtc->ops->set_offset(rtc->dev.parent, offset);
> +	ret = rtc->ops->set_offset(rtc_ops_dev(rtc), offset);
>   	mutex_unlock(&rtc->ops_lock);
>   
>   	trace_rtc_set_offset(offset, ret);
> diff --git a/drivers/rtc/proc.c b/drivers/rtc/proc.c
> index cbcdbb19d848e..bf688079d0fbb 100644
> --- a/drivers/rtc/proc.c
> +++ b/drivers/rtc/proc.c
> @@ -73,7 +73,7 @@ static int rtc_proc_show(struct seq_file *seq, void *offset)
>   	seq_printf(seq, "24hr\t\t: yes\n");
>   
>   	if (ops->proc)
> -		ops->proc(rtc->dev.parent, seq);
> +		ops->proc(rtc_ops_dev(rtc), seq);
>   
>   	return 0;
>   }
> diff --git a/include/linux/rtc.h b/include/linux/rtc.h
> index 95da051fb155d..1dd4a45d0186e 100644
> --- a/include/linux/rtc.h
> +++ b/include/linux/rtc.h
> @@ -83,6 +83,7 @@ struct rtc_timer {
>   /* flags */
>   #define RTC_DEV_BUSY 0
>   #define RTC_NO_CDEV  1
> +#define RTC_OPS_USE_RTC_DEV 2
>   
>   struct rtc_device {
>   	struct device dev;
> @@ -167,6 +168,20 @@ struct rtc_device {
>   #define rtc_lock(d) mutex_lock(&d->ops_lock)
>   #define rtc_unlock(d) mutex_unlock(&d->ops_lock)
>   
> +/**
> + * rtc_ops_dev - Get the device pointer for RTC ops callbacks
> + * @rtc: RTC device
> + *
> + * Returns &rtc->dev if RTC_OPS_USE_RTC_DEV flag is set,
> + * otherwise returns rtc->dev.parent.
> + */
> +static inline struct device *rtc_ops_dev(struct rtc_device *rtc)
> +{
> +	if (test_bit(RTC_OPS_USE_RTC_DEV, &rtc->flags))
> +		return &rtc->dev;
> +	return rtc->dev.parent;
> +}
> +
>   /* useful timestamps */
>   #define RTC_TIMESTAMP_BEGIN_0000	-62167219200ULL /* 0000-01-01 00:00:00 */
>   #define RTC_TIMESTAMP_BEGIN_1900	-2208988800LL /* 1900-01-01 00:00:00 */
