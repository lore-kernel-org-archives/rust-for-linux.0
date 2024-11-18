Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0045015D5B7
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731965001; cv=none; b=JI5xRvwSnrZGczTEvA5kaAdyJVTjnDktyaEIduzg/sQyHFdoRDzbUfbVG2yFjTAvgZvWG81GfkR9X4p78bfUoJ1zjhH35H3rraMh4eF3IimbyDR001S5CXhqLruflOmungreNiPG4UnWeaY2AiMbEyl411wkZjOUP6+2D2RLLK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731965001; c=relaxed/simple;
	bh=zQrZapCNTmA++R+1yxOgnkiRv1lT4Ubz58S6wkr4b1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q5tyRYKIB3N45YqEf1A8gTizePvxbYiWYzY7RmTtX0KXXbAF5BB0rNPf0UW+WM65QKKU+u77XRIuwFzXMzSRBCxNIoXkKrhzyLJSyhYsYAeQF0xYblJFfq/jHuus81iOLZMeywBG6oNhIz9PxfrAyJt+7i9PLiFx0t4qP1y1eB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IfJRWo4k; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IfJRWo4k"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-83a9cd37a11so9141439f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 13:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731964997; x=1732569797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyDvAGYi5T8+sdcs8eDCmKmBYh7FKG7ipAEEuipY0ik=;
        b=IfJRWo4k4IMtT/AVf2rNS+je8YjkQz9Cr5xXZhJgpQqDtqDA1AAiPwkj++dU8f5v4X
         aN/vuh2S6K9mNIrDL0eLYWJSM3HLvQ2VW9H6dnfZNQo5zviRGbqsFLH1A8Lh8eyc7klp
         JCRRpkFuskz+BiBkN6TddI0QQv8a0+vvJDEgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731964997; x=1732569797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyDvAGYi5T8+sdcs8eDCmKmBYh7FKG7ipAEEuipY0ik=;
        b=UDNp4ubanOMREdZHHb2LXQPyjg2x9isyLmE6mTjqJ4+6DH8QB3aylo5EatevktQAcw
         BwXT8BkriAx0vg4OBoJaNtvClxEXTfZI8mrCsvXzmoNXLxhkIuaUiGqaYIZoyswaF8/s
         LaI33OLZVc4mcLTYgMOCYs6l28KCP9XOB9UQGbKfeBf8jszXES/V5x+6BBmDaSvmdCfS
         +ne9qQxiMmccZo+HtOob6uuXd8VCBtZ9Rb3z9O7sR51mNPwD87skSV6YWvrrY6RK2oMT
         LiTHGh6zeKqt3/WUjBxJSFUvChIVSqwB3h3PfjGYhlrMn0NsXgyb/duI3LAIW2pbQkH1
         3WXg==
X-Forwarded-Encrypted: i=1; AJvYcCXaZ6seblTlIW+KK6MOacwn3sWjXF+ilZKO5WE+w50xNzsclcE+/Yrc0AzHmSe+7P3RFhkumLoipVeEvggWBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lUkILBejsHaqRPgV6WX2KisPkKCPvdP/pLzV1+7P31gpm1Rq
	STLusheUetX+UurQWDn24Mdw4DDwWhDuOHGwA1cUrlIN4oBsoyKVnJNhQCPeI0g=
X-Google-Smtp-Source: AGHT+IGftuaEBzutGH+8Aquw3I/5OGKpN71hV5gOnkYelzzleuOKQUzkqND82BIARdwSZ5YNDjxkDQ==
X-Received: by 2002:a05:6602:1614:b0:83a:7a19:1de0 with SMTP id ca18e2360f4ac-83e6c315b31mr1545981939f.14.1731964997144;
        Mon, 18 Nov 2024 13:23:17 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e06d6eb863sm2310326173.30.2024.11.18.13.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 13:23:16 -0800 (PST)
Message-ID: <c7f483b0-31de-4098-9416-18dfd0944550@linuxfoundation.org>
Date: Mon, 18 Nov 2024 14:23:15 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: qt2025: simplify Result<()> in probe
 return
To: Manas <manas18244@iiitd.ac.in>, Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Trevor Gross <tmgross@umich.edu>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Anup Sharma <anupnewsmail@gmail.com>, netdev@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241118-simplify-result-qt2025-v1-1-f2d9cef17fca@iiitd.ac.in>
 <2f3b1fc2-70b1-4ffe-b41c-09b52ce21277@lunn.ch>
 <otjcobbaclrdv4uz3oikh5gdtusvxdoczopgfnf6erz5kdlsto@mgpf4mne3uqb>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <otjcobbaclrdv4uz3oikh5gdtusvxdoczopgfnf6erz5kdlsto@mgpf4mne3uqb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/24 07:28, Manas wrote:
> On 18.11.2024 15:15, Andrew Lunn wrote:
>> On Mon, Nov 18, 2024 at 06:39:34PM +0530, Manas via B4 Relay wrote:
>>> From: Manas <manas18244@iiitd.ac.in>
>>>
>>> probe returns a `Result<()>` type, which can be simplified as `Result`,
>>> due to default type parameters being unit `()` and `Error` types. This
>>> maintains a consistent usage of `Result` throughout codebase.
>>>
>>> Signed-off-by: Manas <manas18244@iiitd.ac.in>
>>
>> Miguel has already pointed out, this is probably not sufficient for a
>> signed-off-by: You need a real name here, in order to keep the lawyers happy.
>>
> Hi Andrew, I did clarify that "Manas" is my real name, (as in what the official
> documents have). It is not a pseudonym. I am unsure if I am missing something
> here.
> 

Using your full name in your Signed-off-by clearly identifies the author.
I would recommend going that route.

thanks,
-- Shuah
