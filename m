Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDA538757B
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 23:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768433009; cv=none; b=VcD/pPxkvPEh1cshB7TcoUDQdHMnfUHqdzu8vkrbPKthHlHy1VqqXX4M72FmPSy3pbQVrEfhBvHpiIcUNFEGp6vNswrZiAiLMjxIhfidfe2YsUKyjsGaGh+d8/Y1lS84CNN6ItyDUhIWYJsVwvHI01ShNtUcqOZv4YVhsROnQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768433009; c=relaxed/simple;
	bh=CWRh1mqzGd74sTVRy1BVS1j1Pdc2oQHYsaaSIcffke8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpZcq6BS7FhWB19gCD20eHFmp82sPAnzgwBxusBybWeDr4E03X1XwAsJbvUMZ9jEVD+ITHqWulZCpzBUMMsXQOC/p32oCux43Y1HeqCYI7Nf489E1Do/4zcbatSYgqwcc6VCnHHNpupcHhMECSGrhUNrOJmv+kG97MY5dZNtKjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-78fc174ada4so2495647b3.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 15:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432994; x=1769037794;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQkIGw10WYd18JYf2abTgmvRXHkfDdPrkiazjFeBx98=;
        b=Wmp9Jhh4nVeYKBoakjdG48Ab9L80YPfnVy3rvpaUCHTMlZqDN5YUsn8ohPEPxfuNiO
         weplD0dbvBFokzx02NP177WJPc38SvBjJvBRgZXRU9JbfoRvA+9SxP5qc6VwtG80hk+z
         CtK5uaCOyCuM9OOdEN8iuZTwe3psjU3Wu5KrS0bOzjkrM/x7PP+bNQM0Px6IPabeg9be
         nVHLIR54Ar9/oIU7HBGLAr4khxutu/2EDnO0y9V5uKgT2CM8iU30bRTnpBJYfpVMNGtO
         2vIuCMsEwKud3b8GeQRgURwnmeRanrDzpsmRdaBKWyW5XlXCj0u79S98zUJTSDRizEXn
         P2FA==
X-Forwarded-Encrypted: i=1; AJvYcCXd+EUocHHjYkIUQm0+EYgFkKbNFomsxgBt8iBmZmZyJ7w8BHmjd8bxKazCrlp8PnWQt4xD1cyflKXFkpvt2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSC2auHx0a7EVhsLISeXvtkuL012kLl+kiFkWN9kWPzJQSnpE5
	UuWtK75lOZHEj1C0kwhuGIXF4ky1NYUL0mzYh3fTRGLUgbWfP0RnuMY/
X-Gm-Gg: AY/fxX6Pj4aci11x8mA9lbJkXIfLHQvk0eIQc6gm0SAA6eGGkmN95qJWypevmOs0cd1
	0lPKIslbSKkGRyCvmTO3acjFLqmZMEWgOgJ8NTa10I509ksBLXZIGmNmfyq9sjrL46NaYEmzMHb
	lyHCQbQ2hQAgOje5yGIaO9TJoamrJZgvPxWQolV/cL8axVulBOrRok0NLi4Mgt3sYrLDC5jhx0h
	5YQ8/BFfhodJG1jOmstNZjfGz6qUEhNuhkoMR7DwxUL4ppqYa6hGGav5GTpAQa91HOEzLGybgrz
	giY30q7ZuumM8aW4e1YMWJ3qJJWM4IOIXJoHNfHblvM4QCr1BRDN6bFdPyI11S2epuKg5HVSdg1
	Dc8sTtC6ytcYVXrlKPvDe3d2mvx/0nBO1nopUzJHVd59/oARZBhE4sZjHwDuV3dfi/zVXmxNfGw
	n8BCOC0OSsRz5HC8HGLqYhyxeHA11hrXpvSYob
X-Received: by 2002:a05:690c:387:b0:78f:b044:edab with SMTP id 00721157ae682-793a1d183c9mr32488347b3.32.1768432994588;
        Wed, 14 Jan 2026 15:23:14 -0800 (PST)
Received: from [192.168.200.2] (104.244.95.48.16clouds.com. [104.244.95.48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790b1be88dcsm90437347b3.47.2026.01.14.15.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 15:23:13 -0800 (PST)
Message-ID: <f426f19d-a14c-4d9c-8587-2f7b4290024a@kylinos.cn>
Date: Thu, 15 Jan 2026 07:23:07 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/5] rtc: migrate driver data to RTC device
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Danilo Krummrich <dakr@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-2-sunke@kylinos.cn>
 <DFJ5VOQOFLJO.1YI2NXC3B8P7L@kernel.org>
 <c834ef20-2d4b-46aa-94ed-310c077a4495@kylinos.cn>
 <DFJ99UZAU51H.JP1VEERVR81W@kernel.org> <202601081401239bbfff9d@mail.local>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <202601081401239bbfff9d@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 22:01, Alexandre Belloni wrote:
> On 08/01/2026 14:52:08+0100, Danilo Krummrich wrote:
>> On Thu Jan 8, 2026 at 2:45 PM CET, Ke Sun wrote:
>>> On 1/8/26 19:12, Danilo Krummrich wrote:
>>>> On Wed Jan 7, 2026 at 3:37 PM CET, Ke Sun wrote:
>>>>> diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
>>>>> index baf1a8ca8b2b1..0f62ba9342e3e 100644
>>>>> --- a/drivers/rtc/dev.c
>>>>> +++ b/drivers/rtc/dev.c
>>>>> @@ -410,7 +410,7 @@ static long rtc_dev_ioctl(struct file *file,
>>>>>    		}
>>>>>    		default:
>>>>>    			if (rtc->ops->param_get)
>>>>> -				err = rtc->ops->param_get(rtc->dev.parent, &param);
>>>>> +				err = rtc->ops->param_get(&rtc->dev, &param);
>>>> It would make more sense to just pass a struct rtc_device than the embedded
>>>> struct device in the RTC callbacks.
>>> I considered passing struct rtc_device directly, but chose &rtc->dev
>>> to minimize changes to existing drivers, since most callbacks use
>>> dev_get_drvdata() on the device parameter.
>> No, you should not expose the embedded base device. For accessing the private
>> data you should add helpers like rtc_get_drvdata(). This is what other
>> subsystems do as well, e.g. [1].
>>
>> [1] https://elixir.bootlin.com/linux/v6.18.3/source/include/linux/i2c.h#L371
> This is not a correct example as i2c is a bus, just like amba is...
> Actually, I don't think the rework is necessary at all or this would
> mean we need to rewor most of our existing subsystems.
RTC ops callbacks receive struct device * as the first parameter. 
Traditionally this is rtc->dev.parent
(the physical bus device), but Rust drivers store driver data on 
rtc->dev itself, so callbacks need &rtc->dev
  to access it. We considered switching all callbacks to use rtc->dev 
directly, but that would require modifying
  182 RTC drivers and extensive testing/validation work. Instead, we 
propose an alternative approach:

- Added RTC_OPS_USE_RTC_DEV flag (currently stored in rtc->features bitmap)
- Created rtc_ops_dev() helper that returns &rtc->dev if flag is set, 
otherwise
    rtc->dev.parent. Default behavior (returning rtc->dev.parent) maintains
    backward compatibility
- Updated all rtc->ops->callback call sites to use rtc_ops_dev(rtc)

Best regard,
Ke Sun
>
>
