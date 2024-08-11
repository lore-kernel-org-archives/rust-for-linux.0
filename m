Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2BE3D969
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Aug 2024 23:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723419416; cv=none; b=rqvdFF5JGg9c/3eu1dFvxO2+IJd2RnIFmEiNyL5jGGfKmjC8oKqLhTgtBYRxJMq/iSHM4abKltRmMRr5FbEmXHBpKFnovr/PuxfpVTGjas+iUtPap5QvJ0WeiDUhxo/cxpGChuhxKzF2GYzrWID+DIWDuquXzj0U43H87RHWc9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723419416; c=relaxed/simple;
	bh=jJik5mBjweL3zeBsn9GrnT0qvWZxBXOstNtni+DjEVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWaV0kzWbawVC8wh2bac7dkQZM5zk4LW89YOWNgC911E4BxxcxcEUKguXhcjzwpcUPlKInnuu66QxBVJeYgNFoiU8QX9YlRDGzjrRdLIwn+MFZfaDn2T6cs5oU3CiU50uPDZRQUnuGE4hBdmGTTVLQGiOeRD+dv6Rl0hX9tPrZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Me3s1RBb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Me3s1RBb"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2d21a652107so187830a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Aug 2024 16:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723419414; x=1724024214; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/o6QQklAMDDZPvFb9yHs8DL9r8gNwt2hVWkEfNGtW8M=;
        b=Me3s1RBbq/W3b+mT8KMprLwXlFHJjfAhTwyWmw6LGfz0Nb6upydLrSaQqz4dgxcjiX
         dxr8b7aAS48nB6dQbrxCjQ7N6H5GT+9FobvEdh/0hMLilPXmOCoA7i2deuEn0j4NRNoK
         90QFT52veFvtG9H2awhoflwNjF34gURaz65+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723419414; x=1724024214;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/o6QQklAMDDZPvFb9yHs8DL9r8gNwt2hVWkEfNGtW8M=;
        b=lEQI8naphwqs+a+VcbWKL2SB4/15Ltve3jwmARmCqWt8GYEcn0ix0GBCJx8Hepl+JJ
         B3IC+pcVTn7Q/D10yHlkVhCvcuV/YiXglmVcJ7cGfe9pE7WK25StXBohT6Auqf4+jCXh
         M4VnAAh3YmK8cwBBEUfToRGPSmUuhwFzkVDbmcyk1NF8bemAj71GneTosrWQZFguCugB
         W+Qdg0D94OCy9YgfsGUOXKAKjCEEXI34DzL090ghUKTn5NiMvUsRY/NB/YI5Y3cF2xI0
         8vYSMLJfL0Bh8e98yQBq0+XekEmc+5muaQfQg2tvqF4o/3cmj/9m63Z544ttiBn9Lx8M
         K2Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVcatn7RpN1A76rgVsic+ugACi5UNQFwALzm4Q7Fj40V7dq8ZL3PaTLhbENh7lsXNh8geiggawgglK0ZMiT64d2Gjj4Oi5OICm5vs/sHBo=
X-Gm-Message-State: AOJu0Yzae7GaDSMDty0wliKrMUiLx0DjDI7ao8x/Qt4YvQYcjTCpRZYZ
	gYFCTmWMYJokr6O+G/jdd5pSaR7BH1DOhMQL9DCa4rE+UWtK+ZqVJLNO21tenxU=
X-Google-Smtp-Source: AGHT+IE8vpXF6yYoRRIs3j0MzPmM2wt2DL1913U6epAdVdcSZnLFNeXmzAhsKHWMRz/AyXkdKABfpA==
X-Received: by 2002:a17:903:2445:b0:1fc:52f4:9486 with SMTP id d9443c01a7336-200ae5daa64mr60718415ad.10.1723419413833;
        Sun, 11 Aug 2024 16:36:53 -0700 (PDT)
Received: from [172.31.140.29] (softbank126051159161.bbtec.net. [126.51.159.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb903b09sm26740135ad.95.2024.08.11.16.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Aug 2024 16:36:53 -0700 (PDT)
Message-ID: <4542b8cb-414c-49e3-8509-6975976ce3a6@linuxfoundation.org>
Date: Sun, 11 Aug 2024 17:36:50 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] selftests: rust: config: add trailing newline
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Anders Roxell <anders.roxell@linaro.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 shuah@kernel.org, rust-for-linux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240802124536.2905797-1-anders.roxell@linaro.org>
 <CANiq72kM1RsZCrK-3gFZufgeZQRvOBAbO=DwRHpukX5W=T=UAg@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CANiq72kM1RsZCrK-3gFZufgeZQRvOBAbO=DwRHpukX5W=T=UAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/10/24 04:33, Miguel Ojeda wrote:
> On Fri, Aug 2, 2024 at 2:45 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>>
>> If adding multiple config files to the merge_config.sh script and
>> rust/config is the fist one, then the last config fragment in this file
>> and the first config fragment in the second file wont be set, since
>> there isn't a newline in this file, so those two fragements end up at
>> the same row like:
>> CONFIG_SAMPLE_RUST_PRINT=mCONFIG_FRAGMENT=y
>>
>> And non of those will be enabled when running 'olddefconfig' after.
>>
>> Fixing the issue by adding a newline to the file.
> 
> Could `merge_config.sh` be improved too?
> 
> Shuah, if you plan to pick this:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Thanks!
> 
> Cheers,
> Miguel

Applied to linux-kselftest next for Linux 6.12-rc1.

thanks,
-- Shuah
