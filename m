Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B1D4D1252
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879942; cv=none; b=fTUn+BggH7L5oci445Ic5jDP3VqK0HgAx09tEVe1JASsVPtbgfLatNRP2SXgVZSZg9ntkIRs2aaxyV0QuOWW6DVtBFwx/4yMD/0MKqN3eQ7RXh/31q+zwj6CZnVAczpIamtXQHBDrW5RT4wnecNLoo73m5Ix6HFkCmu4co93bM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879942; c=relaxed/simple;
	bh=GrmvpqiziF56Q0Dk05a0FV54bdVuh4XlxV7dyFtow+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwxepPUrInOHYPn4YnWB5O7g4dDTyLqCIjT8/dA0wWKzim2fSQXSRMEQdiWVQ1A5fUMPQ+B7q4eU4cXtS8BHiTCK/gidfIPYavJq7P0j4AuntS5s8j/r0qR0sGQ4y2zSP5//5sXElk4FiWHlCkzdYFuivs4yFXTJ2NXDEOd27j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aab7623f42so2788070b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 05:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879937; x=1768484737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1e5OPUc4ALFm6BKAa3GGC2+rxUwWfa6AC5HZABAAJgY=;
        b=bE4pnvOsDdNnkjLFQTimopuaRAqZmJaV1EjuO4JDWyDsPdroyNppEdhJYMLA2urohl
         WSLqHlX1pAvRrJ84aroYc2bRGtXM6+3YWLxNEHf6ZZQklWIoVkSFJmh6kCSFfu7ptZd0
         rM9ZuAJ4MmXq3m6yoBXfq7Bxj6XZiiq9BXrqIKaQJZsNSy6zo9ABISXgTI1JSz4Gt93K
         hFf6FKjAk3ZiGcZ+N/oRJRLQWOqlrw3h0KvtARhSKMcqdtLukyUz32+r39JGdWjIQvFy
         GriTF5lYW7+LGqBYdQt+PJyL2oJaysM7BKB6KOoqy7j4ZQbj6tmQLo/vIJeXrNPZ+DJs
         GlCg==
X-Forwarded-Encrypted: i=1; AJvYcCVNm+TxZKTO2QD6BFs5PsZYLhgn3jdmmfXZVt1byJ+ZCylY3m3Lydl3Kbio7tockKRIAJfqLGH1vANy4zBCgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8HuKDTspqeeoELXZXptCgUd6K5y+ftayvpF+hFCjsRcjRX1PL
	85BDNhLfIwzhR9TROyjVg9iOA1LiYhc248ptTbvaZjBrDg3Zbwn872aB
X-Gm-Gg: AY/fxX652o0YZHblI3M4pRiqf7GnGhwa/Zzo/knW9M2JVNza4o79vZiWV14DLK9X1XT
	r0WB1o0GfWqWUNQVcrMguHykEFxc3Csn3Hrh+81JUxUcxf/3MvalIPlgJmrievEBuGbE4npc5su
	rZ6mEQHoY3MX1GVvz6778NPKq32AK83IASr1O87WTMmR6fgCB6mrynxMLLnhib5QR76S87lM3vh
	k4yNg2B/w5oiagE4N2CylnZIZiYA+A0A6DDsX/EZnIKj0R2cQen5eLckqJy6hZ/6sjmQsWiUUDG
	sYmWRDdUGc+OR1IGwhGkbgLwjHBrYijY2n3VqUZ+iB0iOirttgXnjicVCApa7GzYIxuB8rK5hWo
	iv5nscpHti7z+9r0ewgJD1udiPzUmdu5FUoZ0wIOHeLH5X0xj0k1C8Pay+2OO+giEai1i/ptbnS
	8DFsg7wJQ/VadiZWdvmHNmyEaF8pq5WMMuoK3vhKSa/+p81i0=
X-Google-Smtp-Source: AGHT+IErqk5YtJqJoDcrNKDl/R4uJ3+oA5O9puPvRka960BgDpPlxRbK+hoKFRMiLIiXbpB3Oaqj5A==
X-Received: by 2002:a05:6a00:801b:b0:7ff:9f67:d47b with SMTP id d2e1a72fcca58-81b7d95cfb7mr6092802b3a.8.1767879936835;
        Thu, 08 Jan 2026 05:45:36 -0800 (PST)
Received: from [192.168.200.2] (61-221-120-114.hinet-ip.hinet.net. [61.221.120.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm7938637b3a.0.2026.01.08.05.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:45:36 -0800 (PST)
Message-ID: <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
Date: Thu, 8 Jan 2026 21:45:30 +0800
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
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/8/26 19:12, Danilo Krummrich wrote:
> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
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
> It would make more sense to just pass a struct rtc_device than the embedded
> struct device in the RTC callbacks.
I considered passing struct rtc_device directly, but chose &rtc->dev
to minimize changes to existing drivers, since most callbacks use
dev_get_drvdata() on the device parameter.
>
>> @@ -369,7 +364,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
>>   		goto out;
>>   
>>   	if (adev->irq[0]) {
>> -		ret = request_irq(adev->irq[0], pl031_interrupt,
>> +		ret = devm_request_irq(&adev->dev, adev->irq[0], pl031_interrupt,
>>   				  vendor->irqflags, "rtc-pl031", ldata);
> As Greg already mentioned that change should be a separate patch.
>
> You also have to be careful with the devres order when using devm_request_irq().
>
> In your case, you pass ldata, so you have to ensure that ldata (and its
> contents) remain valid until the devres callback frees the IRQ request.

I'll only start modifying other RTC drivers after I have a clear

understanding of all the details, and I'll minimize any functional

changes.


These C RTC refactoring patches will be sent as a new patch series

to the RTC mailing list.


Best regards,
Ke Sun
