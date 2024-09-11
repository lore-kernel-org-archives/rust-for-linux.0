Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA0192D74
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Sep 2024 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726071005; cv=none; b=SkmJkWD8rO1+IVI9LeSl3zqoPdZh+LIFnM9hMJd8gz446ZbiZ1+bh15r4Vhq0S0JRJKGbA7LsWhptUXTwUBszWhg7T/5OvY1/dmjlWNDD3pOLu0nzUGAVDbzEMTbfPkYOniFLKLZDZDu22r0qI5mAtwndG38fjmb7ZGbgtYI0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726071005; c=relaxed/simple;
	bh=EyC1asarizN+wlHGUbEl5egryrMctUQ9CjTYigbQumg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q3zZ4oF/0/S+PhcAOIJePTfzt4/1pXTMk/nVjh3Bw9zwG3eFXCL9Leg6gkQFP1/lbjcCSFvGJYaXWcq7dnK6DbdZKsAn9kdWhtfh4SNd0+W3xHm7znK35dsSoLHNiYYbI3L0+kWWK8gpZaDUVsh9S5n919SPrbiIDZDdU1CqPj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=hx3SbFYp; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="hx3SbFYp"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2053525bd90so599055ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Sep 2024 09:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1726071003; x=1726675803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7UT67gV1cwJybIxBArzSTyhlTWk6LFWkBtDrmyARac=;
        b=hx3SbFYpKbxVhdF7hZdOkiAzeCAYdMtfQheuJ/LRRFWCQUa+9mTAVrp7tH+rnCGt0k
         dsqnuhVwotmn+YP7sayfa7aJ7RBFV0RuaT9cuGh+8WKMbCQ+n4+eGg7xVBbcwjvjuHin
         5FIA5nLt2xK+Ft5OQ9p+mjYWmeqOtCDw6EI+rZFrKvbVMLrhWwrryQAeUi3jpU0qq//q
         HN/UYaTw0iiB2cvw6baNv7Ic7Pl1sMrvJ7RQpdUwotjdWjZkuWDEeHj8BpoHyXi+c/Gl
         qPQrRFC7N8GjAJvGAdyJC820dEjakrIZwj3qSwHo1eFBOE6HuXv2hDjZZM4J9eYV4mlq
         /XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726071003; x=1726675803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7UT67gV1cwJybIxBArzSTyhlTWk6LFWkBtDrmyARac=;
        b=ei3kiUo/Rz7LGfq+sRuRkTErN4ea3FfHMaCY3rWtihK48Y9Y3qTKPRYutIw/AmZZ7S
         OTRNYgtFvOWnQMSvxoGRfNs/mmTUF3gCOGjOBwyym5JMMb714gLzVJmfZ8PXkq9FCRGv
         o+o593Zg7xXKlJBuZpZVwg29kBIUqbMbwjyHKpClRsz7cfVqA1e3uwUp2fPBpYj0MdLi
         ur2aNIvw+R3MUVdUit/pHjpoxb/RaHZdVlVU42KRMuMVWzrxrSiyAvA5kkbGae10U/5a
         cW6vmpVwKXl6IZziSCWeByM5GgY9x5uKLfxrtlsHx++rwk5DkbgNmmaljooPMHewS350
         SARQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEmBOiRAgF2o15Al+UkEoZ7o32a2QZxWWPQdGxMFDGJpeGihpLVYLFkqp5YdRgY6wkCd8RYn/438+MXY+nhA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79o8ZfX00sTnlZ6G147MHrKsdtlqZoZTfiQG7ZbiRkzFOelv9
	WiJzCYrdyJpy89lC5rxDxYbEn/tgNw/sjZfdACsU9ixeZ0NQer19+EV1JjJWuOEZGdbMfcZGYJo
	rcV9E
X-Google-Smtp-Source: AGHT+IHxqgzZVxYEvY9qL7CLZSUAdKuf7UAGYqozKhceMgYQsh8xQE8qJwCqlU3Otnp7XWn00TTRiw==
X-Received: by 2002:a17:902:e546:b0:1fb:90e1:c8c5 with SMTP id d9443c01a7336-2074c643e20mr54026305ad.33.1726071003325;
        Wed, 11 Sep 2024 09:10:03 -0700 (PDT)
Received: from [172.16.118.100] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076ae3fe19sm1602505ad.0.2024.09.11.09.09.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 09:10:03 -0700 (PDT)
Message-ID: <ef948bc7-aa2b-4b45-8e6f-32c28b7d6684@beagleboard.org>
Date: Wed, 11 Sep 2024 21:39:52 +0530
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] addon_boards: Add addon_boards plumbing
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: fabien.parent@linaro.org, d-gole@ti.com, lorforlinux@beagleboard.org,
 jkridner@beagleboard.org, robertcnelson@beagleboard.org,
 Andrew Davis <afd@ti.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240911-mikrobus-dt-v1-0-3ded4dc879e7@beagleboard.org>
 <20240911-mikrobus-dt-v1-6-3ded4dc879e7@beagleboard.org>
 <2024091147-graveness-manmade-d070@gregkh>
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <2024091147-graveness-manmade-d070@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/24 20:30, Greg Kroah-Hartman wrote:

> On Wed, Sep 11, 2024 at 07:57:23PM +0530, Ayush Singh wrote:
>> A directory to store and build addon_board overlays like mikroBUS,
>> Groove, etc. The overlays present here should be completely independent
>> of the underlying connector.
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>>   Kbuild                         |  1 +
>>   Kconfig                        |  2 ++
>>   MAINTAINERS                    |  1 +
>>   addon_boards/Kconfig           | 16 ++++++++++++++++
>>   addon_boards/Makefile          |  3 +++
>>   addon_boards/mikrobus/Makefile |  1 +
>>   6 files changed, 24 insertions(+)
> Ah, here's where you add this.
>
> It should be below drivers/ right?  But what's wrong with drivers/soc/?
> Why is this so special?  Why not just under
> drivers/microbus/addon_boards/ ?  Why is this tiny bus/device so
> different from everything else out there?
>
> thanks,
>
> greg k-h


Well, it can go under drivers for mikrobus, but there will be other 
addon board connectors which will not need any kind of driver. In fact, 
the original patch series this is based on [0] did not have any driver 
for the connector.


As for bus, see my reply to the other patch in the series [1]. 
Basically, while the name of the standard itself is "mikroBUS", it is 
not really a "bus" in Linux sense.


[0]: 
https://lore.kernel.org/linux-arm-kernel/20240702164403.29067-1-afd@ti.com/

[1]: 
https://lore.kernel.org/all/ecd1fff8-9c15-496a-982f-36e6c58e906a@gmail.com/

