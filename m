Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662FC139B;
	Tue, 21 Jan 2025 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455386; cv=none; b=XEUMtdeE8znKIjXhMU5Sbokzi2kWg1n2u//hL1NjDsQWjjcrQgOU5JP59CSJx+0AjGcsoW+0r+x5MkwF0c0z1qF4Yh6dQabXB4675y/qgpbND1/uaY8elvL4Dhvvca52IiLMIGwGcvFZ55cl4aHhsXnU95fEwq5HFnIHl9uoJzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455386; c=relaxed/simple;
	bh=ibQYsPi9EyTC+oeK1NXDVf4wVeXuPvCp+Ycl844c86o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fmDN6Hr44MiUehcsqN5HG7LGy4C4HiEYrHnSERRVnrNLY/GkUa+1Pk0CJMGHZZowQzuYzA0wEqf9XdYH3Ztn1agAcJVM7dNBnQopToQM2bjTXFbz3w0YN/NknRivXrV912QJXUXY5RIYVAUFLRpke+JKe3Rl1C0P+MayJke8GGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQ6EMDZk; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQ6EMDZk"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab322ecd75dso957313466b.0;
        Tue, 21 Jan 2025 02:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737455382; x=1738060182; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gOdqkQkzqgycBW7zwu9Px+LiQ3th56b8QJMvlIaBWZM=;
        b=bQ6EMDZkBrmqBRSWcNC5LnKbKmcODoTWbRWjCP2vAqpXaEnUl3h9/yqt0jpCQqxbHX
         2H0Qq7gaRKjog0+Wvq1pRzo1axXbFD4IspcarDXHbKuwAP1Qevq7ZNVQjMjLmDMW5RoW
         9C7bmxy5pkTaXFlm5ilxZrQ16PybLGy5VoajJopDNc3ohvv8j9sY3FRbx1H12p0mxOyR
         bRNKmj+fyHHO+QYmVPykCk+gK5tMYn83jGWTOdlxo6xBmf/RH0HobEzn5lXjdWF2arSM
         UgDjBtb8/ncdOy5K2v0UXq3yX1zHX48dW9i8xI77Dim0xZnPZfU5tegIEDMbughcRk1F
         4Uhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455382; x=1738060182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOdqkQkzqgycBW7zwu9Px+LiQ3th56b8QJMvlIaBWZM=;
        b=gA/my9NwTPCegaYRv8tibCYvywmN8Ly5FMi+ak81u1Nh61AY7gmOpCFq3r07/usrsS
         Td8SMCoXN5jOG5cWRFO1Kxv+GNltTVmMeKng2CXD7yVtwhEWIyZwGIKhckaaQbq08r68
         6J9DE5HnMnuQH41yNhMIG6urCytYIv/ZgGeSeGt8FYSduvyiZUGvdr4e70idKBgLOzEK
         YUTwzd5EQZHlNcH1OmZjq4JPiHb4PdjRX3+lDpTRG5uptvy6sk6cIlH75Suh59+MVEHs
         sDUQ8coaYRP5VPjoQ7b0RAkO8aQT0r6PIB1pzdbINpS8UXvI2hNo8/ELbVhKP0SqVo0Q
         gDzw==
X-Forwarded-Encrypted: i=1; AJvYcCVARN0sA+QoExbH4GkaoX+3jj9vSkzJLZZQas6lTyWJj9Cv9n3iw/Qaq3FJEoY88p+YIjvipytTO3kxPmG9npU=@vger.kernel.org, AJvYcCXo5vJYRKCwsw7SyveYeMKPa3sOliO+JO2SOblMUfN3SHWmQleor6K3x/vsiNQIVKdOGlgTpSimUN8AguI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLjXgDDfF5bEuRHlKRsToHogJ2vg7cl6xdcskxzYQq5cYZUU95
	Je7v3FbTfgGmwCCaGMy5uVFC2oDuqOgBAwWmAk6fowbH/QSDm3tX
X-Gm-Gg: ASbGncvLPqmqMqzlF8Qc9gW/7p2VIHkA6lqcFOlM/PnBuc6nFQpgynOY+dGk833kFYM
	+011fMpMIJZQIut+gQ0uVrwXgYDZ9RekA++B6X55tGkZDkbcrC6slQEK71ytwj/ctILNlBigg5Q
	79rvUS5JX4LC4SNgYeLk//wmPXN+9dDIKfeY2tLN/TeV3OPAcQdZW8QRwbPFJyiV7iQMeCAPuBq
	grZVQJlANBvol+5oFJCRixGqMSdxJUC/2qL9LiadwWoszCIBKOT6+Jl8oVn+uYpVdKsTAH9o69w
	HNoPYA==
X-Google-Smtp-Source: AGHT+IGLgY9IKvOY8jX07x3NRy7MilZujPWaXQHbG3+WgGMHLRkmR3H+gRBs1LRqReUDZ316EPnR1g==
X-Received: by 2002:a17:906:4fd5:b0:ab6:362a:3fd9 with SMTP id a640c23a62f3a-ab6362a56d9mr297566866b.1.1737455381528;
        Tue, 21 Jan 2025 02:29:41 -0800 (PST)
Received: from [10.27.99.142] ([193.170.124.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce13ccsm738332566b.50.2025.01.21.02.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 02:29:41 -0800 (PST)
Message-ID: <41cee8ac-f773-4e7b-8249-2de5d7807287@gmail.com>
Date: Tue, 21 Jan 2025 11:29:40 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <2025012034-rope-canned-43da@gregkh>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <2025012034-rope-canned-43da@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 20.01.25 6:46 AM, Greg Kroah-Hartman wrote:
> On Sun, Jan 19, 2025 at 11:11:12PM +0100, Christian Schrefl wrote:
>> This set is based on Greg's driver-core-next tree.
>>
>> Currently there is no good way to pass arbitrary data from the driver to
>> a miscdevice or to share data between individual handles to a miscdevice in rust.
> 
> Why would you want to do this?  A misc device instance should be "self
> contained" with the needed stuff to make it work.
> 
> Do you have an example of where this is needed as I can't figure out the
> goal here, sorry.

The main reason for needing this was that I could not figure out how to otherwise
use a Devres from the platfrom driver probe in the implementation of the miscdevice.
The reason to add this to MiscDeviceRegistration is to avoid race-conditions between
the fops and driver registration/deregistration.
(See the commit description of patch 2/3)

If there is a better or more intended way to achieve that please let me know.

> 
> thanks,
> 
> greg k-h

