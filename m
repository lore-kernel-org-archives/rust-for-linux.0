Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53CE2D7DC4
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 23:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767828937; cv=none; b=JHJJLydqKMm15fxpMSN6qSfUAMNN0c84iFk+j8bL/7W54KPxzDGBHdN+ueIADWU1Hi5A1GUz2zd5kMP+QmFJ6eu18yn3Kg60JQRZP8JxrtjEbtG/mO9M0KuUN/D6GMZj9b4qLhZHpHAws+MCYnwdcH537O+Ecq+sNY9AkWPvVpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767828937; c=relaxed/simple;
	bh=mzO2goGm6PS6IpL178MXBE6X5B2+d20zdttar6IAt2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJDGn9Kq5hszkN5yoD6CkImtwdH3exa4GikwTFgEGmOLdyo2n2TpLi7tOQb9bJle+c7/XZzlOiQEvaDg4BjoxMpfiTIaa8XaDF9YbdhHTq57d2wXyRsCPC7WzGBC8I5yXDgGVHdf1f8tFM4XtJVqYZrdFUkrz9NHoI3QddNDSMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1618161b3a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 15:35:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767828934; x=1768433734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A7SmvBKhefSRY5v6j0S35kFBdyQUA9WZzMSifi1qiZ8=;
        b=xJe9dvHmHik33LE/Jd42DHWE6p6GKhQ9G/GHxkHku8FNb8V7cEa92d2hPpMf89EDI4
         0Pj1G4pCTXEKZ6Y7uY4QN1RCi6HGL9PkF06WShzZBZJfCb89AzgBzS7l+AXwx8PQXITv
         cMY8h7+CeE9+lS+u7TFcEug0mTlvBF4MMbRwcgDZTxTGepNGg5MZzshmMu3FFbI1cXKr
         Q6IXuwhCfw54TMDK+t97HLlZpwU8V2F9Ug3XRVZl315EvmNcwWxwGtp3fqVFZaWXAsOO
         w3N5suanQzQ0l0VnHOrCArpd5bRu9dvQMJm4thmfmxhnan+ZdsZe4ZfvQNG7Kg8x8Sj5
         fLOg==
X-Forwarded-Encrypted: i=1; AJvYcCUqlIlZmUBXFKIIWxkjkzFNXBECMsfEx5DQWfakjia8AS0qJBpOzh7A09pv2t3fnrd0WMWif/qMwf1oi6bO7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJJSvJP1kbD4UZJmkwRn8G8N9aIRpks0e73YZtnhkiZhu8EpUm
	z27zVTwny0wuWkp8k5iaJggwnqKmVHyuOXeYMZFgkJ4tN+jgv/tqJF1Y
X-Gm-Gg: AY/fxX4TE0XvqOegpkcK4VMCzWl4MS87OMXv2hNI/N9NYcIXWrZ/r42sdYr0vgDdIKT
	zDNSZYd6bTms2QNHik29szT2fC6z90dlbXMdgqX8GV0Ec4ORF2HAN/CGBm3XloLqK2DMFJ2C0mi
	HF9/M1AUe/dQ2tPDCTmVeTF7KODwA1TbflILodqkpzNSdaF10WbWQ5W6TgMCyfNazYzrj9o2Gjy
	y+nwsQkT6+DOLGXSyaxNPocVpdvRhcxXtP6FIlA3miI8tgC+C7y4RTouPRcjs3YClrH1L9V8otZ
	KdO2Qz2lY+y0bKdFvMdZpsHICOvLalwpdyTk3/+xqtXarLCiXv8UwWb8IoeymFAZHn5B+Eiew7p
	psb+8G6ksqXwy6aK2TylYc7HwLdh30SektZx+snSltmzQ14Ng44cEaL48WpHvkIktOVKRX7F9NX
	1s0/s=
X-Google-Smtp-Source: AGHT+IHfHxn4Rl9WabCLXJcjqoeGquyMm3u4gU382wmWog6fhnrOswHl/vsrPJ9gkMQKesE89PQr+g==
X-Received: by 2002:a05:6a20:94cb:b0:340:c6cd:5452 with SMTP id adf61e73a8af0-3898f8f47aamr3883904637.30.1767828934087;
        Wed, 07 Jan 2026 15:35:34 -0800 (PST)
Received: from [192.168.200.2] ([2403:2c80:17::10:4008])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29521sm6061183a12.23.2026.01.07.15.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 15:35:33 -0800 (PST)
Message-ID: <a2bf4177-2962-4c43-9ac0-ccbe84cb3edf@kylinos.cn>
Date: Thu, 8 Jan 2026 07:35:27 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/5] rust: add device wakeup capability support
To: Greg KH <greg@kroah.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-rtc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-4-sunke@kylinos.cn>
 <2026010701-rendering-upheaval-e056@gregkh>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <2026010701-rendering-upheaval-e056@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/7/26 22:57, Greg KH wrote:
> On Wed, Jan 07, 2026 at 10:37:35PM +0800, Ke Sun wrote:
>> Add Rust bindings and wrappers for device wakeup functionality,
>> including devm_device_init_wakeup() and dev_pm_set_wake_irq().
>>
>> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>> ---
>>   rust/bindings/bindings_helper.h |  2 ++
>>   rust/helpers/device.c           |  7 +++++++
>>   rust/kernel/device.rs           | 17 ++++++++++++++++-
>>   rust/kernel/irq/request.rs      |  7 +++++++
>>   4 files changed, 32 insertions(+), 1 deletion(-)
>>
>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
>> index fa697287cf71b..d6c2b06ac4107 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -88,6 +88,8 @@
>>   #include <linux/workqueue.h>
>>   #include <linux/xarray.h>
>>   #include <trace/events/rust_sample.h>
>> +#include <linux/pm_wakeup.h>
>> +#include <linux/pm_wakeirq.h>
> Aren't these sorted?
>
>>   /*
>>    * The driver-core Rust code needs to know about some C driver-core private
>> diff --git a/rust/helpers/device.c b/rust/helpers/device.c
>> index 9a4316bafedfb..cae26edd83696 100644
>> --- a/rust/helpers/device.c
>> +++ b/rust/helpers/device.c
>> @@ -1,6 +1,8 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   
>>   #include <linux/device.h>
>> +#include <linux/pm_wakeup.h>
>> +#include <linux/pm_wakeirq.h>
> Why are both of these needed for just one function call?
Hi Greg,

You're absolutely right. `#include <linux/pm_wakeirq.h>` is not needed in

device.c - that was my mistake. I'll also sort the includes in 
bindings_helper.h

alphabetically.


I will address both issues in the next version.

Thanks,
Ke Sun
>
> thanks,
>
> greg k-h
