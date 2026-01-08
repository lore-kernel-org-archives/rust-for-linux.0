Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666654D3DB8
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880876; cv=none; b=MT85u7iUTNFg/h+jaoGAYSxmdPLbPkMTTsfgt8QayZUYmcOQFRTC4+bxAGrdZKh+fgPbAHwvSB9U4HJaHatBq164zNIKjcsB1j/MtOz6OcS+PeYnSwlszc4Gn8w2N4r/3xkbDJXztL2qhgk2HP99++Q25gv178Y20ngz74FL+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880876; c=relaxed/simple;
	bh=DcZvH2zgvGci8yXM45Wi3orScuxbe1NN6toZCcJtVvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RI5plkZVyM7BBsfv3kIwcfnWZRMMlDuV6yUAsxBashOTX0foSS4OfWSCui+dW3dE7ayZLwV9hcU9O0APVTgQPKD9WY6whA7v4qjUZ4DPkOwfWHQ/nez/I1AX0rCmIC3io2Jw5bASnN8esUKii5TTydtH2/BD5WPiO+boBc1ZUns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78f89501423so21568787b3.1
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 06:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880873; x=1768485673;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mu9j1d0zwqXTX3kF5q/ih9Y7OvIi2+noGJOfEuGy4tE=;
        b=aGWXpCMU7G9q12VmErOzt39KcMf+9TzOTnKrkcF5FDDQDXFHa9K6KRWK78HRGu+TT6
         W+YT9ffM9J8bFy2GruvLpipmWB2SzpdN5Nw5XBB1yQSCmx7F31FH2ul/Yqahup2YwZhM
         vw8u7Va8c8+ZnuSh/A/9ZrHtUJyX7tknYnh+bDQN23/oHr4PclSdPnm4mpubDWKPXxAY
         s37TueHtXfffG8FZqP7PlDRJ15CkLXXxRB1rD99s00BvMDTSgQ1M+jGUgyGA9KbxR08e
         q3APRMjPZLl0Th9p/V9xqIlueYmn7lM8dAzBGgLWfVoRuERPzBOPVJU6u8CXGkACtnii
         x90Q==
X-Forwarded-Encrypted: i=1; AJvYcCVx/cNtwhzKQUe52lby0Pu3teSYgIZ8k0t/nf49fjFwqOb6jRGqeHMw2pnSYJSd9O7s5fMvVTnuIjyGV7rzQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYUCuYbOsBN43M/ad4NWhfE06Umv4rrf3tqG6CPghAxPfkJQg0
	mP6Chyzkg2tPjewhdYixZ6LTeZT2mKrHNWCWySVn/gT7AYzRJOfSl/3C
X-Gm-Gg: AY/fxX4hLmWyyj6RzFJxk/VkOkmq/j5G/3+hhAoUx2Q1A/u9CH69NkkZqfiwhFULcw5
	hAYj+aOkqfExdWke3Sg68uC60w5e1yav47PAkAztF/NdAcn/y194l9M3tsqGpTjXluYpu9+gUAP
	M2RwPJ+clkDE8jZ/6IZRdkZhbuPZCSbZSo37WR+iGOzE20v8flyK19hQkDVIHNJALAEth+S/hP7
	kTo1XzBkwk5lZx1YMAzS0UXomCrjoeX9eWb9yIoc4IdImrnT++na/B5+e4mv7+BAYrZh+kC30Ec
	h8zIh14Wl+R5nDtT8+TAGvI/0/y3rT8WnWKxKiZwIRO5x4cM95V8zfQ1QQlLPnOm6cskV4487Bx
	WBRsov+E3BzUNsxn43Tr/QFE6g/XP8n/QjZQSxLF3rq9YHZLnRpw4xkAUab+o26x2Whea
X-Google-Smtp-Source: AGHT+IH5K5445Kfqgo7jjV/P54c8sg1GX76ZF62YaOnIOUkJdYPeiSk+pPewMd1dXlbX7RqQcb5RdA==
X-Received: by 2002:a05:690e:11cb:b0:644:4eec:22a with SMTP id 956f58d0204a3-647165d5dc6mr5422074d50.2.1767880873045;
        Thu, 08 Jan 2026 06:01:13 -0800 (PST)
Received: from [192.168.200.2] ([2a11:8080:200::1:10a2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6a0538sm29724197b3.38.2026.01.08.06.01.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 06:01:12 -0800 (PST)
Message-ID: <3a4b0edf-b14e-4059-9f79-1541584fdd2d@kylinos.cn>
Date: Thu, 8 Jan 2026 22:01:04 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
 <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
 <DFJ99UZAU51H.JP1VEERVR81W@kernel.org>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <DFJ99UZAU51H.JP1VEERVR81W@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/8/26 21:52, Danilo Krummrich wrote:
> On Thu Jan 8, 2026 at 2:45 PM CET, Ke Sun wrote:
>> On 1/8/26 19:12, Danilo Krummrich wrote:
>>> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
>>>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>>>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
>>>> --- a/drivers/rtc/dev.c
>>>> +++ b/drivers/rtc/dev.c
>>>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>>>    		}
>>>>    		default:
>>>>    			if (rtc->ops->param_get)
>>>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
>>>> +				err = rtc->ops->param_get(&rtc->dev, &param);
>>> It would make more sense to just pass a struct rtc_device than the embedded
>>> struct device in the RTC callbacks.
>> I considered passing struct rtc_device directly, but chose &rtc->dev
>> to minimize changes to existing drivers, since most callbacks use
>> dev_get_drvdata() on the device parameter.
> No, you should not expose the embedded base device. For accessing the private
> data you should add helpers like rtc_get_drvdata(). This is what other
> subsystems do as well, e.g. [1].
>
> [1] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/i2c.h#L371
Yes, that's the right approach. I'll use it in the new patch series.

Best regards,
Ke Sun
