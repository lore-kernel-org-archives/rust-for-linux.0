Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA51AC437
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 09:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727344125; cv=none; b=GZkRhQpzA3T/2Ww0yrvC/O0oAX5wHWF2aQgyTGAVvuLgZmhnzfb0u7XMBFKjXDsQybH3zltF0Wul8Wyu02qdwEmzRuUrDXDDjx6qg1jEBT3xZ7u5/h2GrX1VsROQ3WOqQfImW1gz+953pOmGWDcfM6FxqBxim7hiWZOZs/RYXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727344125; c=relaxed/simple;
	bh=KWYOEyZVojM+xzX1znoWGaX+B8Yit99GK8+kjVrKwI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bw2xX6OUiHa1ftPURqna8A8FtsLFSp0yFnJDj6flLHUS2pZxBGfqTi2JnPHJ+Aey15BbLKDVoQnMJZYKYIGhMWMWQRQd4coIlrPlfp62P/8gQ6ExHlo4ei/Fac6BgftH2out0eA1imNylna++2bG6k0tp81IkYQWDsS3GUxWkJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NvMXDfci; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NvMXDfci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727344122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VMXry1vusU7aXTZZMihQhOCF0i8Tmy+n1iWiG5OG1ZQ=;
	b=NvMXDfciCdyIKz0mkKVgCuOFXxpeD2EqGH80mmkbMbLzgxHVFLJ4GvUy6Z0gk2L71UOoTg
	KII0X+ENyBki6EBJlmNcSgXRrZFSLq3rvcHZtBEi8wPe9TYUF9lLACJ2p0WhvuXfhvdmVq
	HMi/sumcYVU9faX1X6mhtlrja6qy5F8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-yx1SJJTQOCO87KucucuTug-1; Thu, 26 Sep 2024 05:48:40 -0400
X-MC-Unique: yx1SJJTQOCO87KucucuTug-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42cb940cd67so7316255e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Sep 2024 02:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727344119; x=1727948919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMXry1vusU7aXTZZMihQhOCF0i8Tmy+n1iWiG5OG1ZQ=;
        b=Muu7WuTXJazWgrKwpL/Ci3rlveIQ18oTMSxvUk6tXKm+fT/+7GrgW+7utwpTAEbkKm
         pO0Acn9j7yo/SBZCL99xcRvZuj0Yzwx3BHi6Fi+ESLXKbOVpKeDznNJkfa3fEiN8X9U3
         +q2jbEKm8EX/nfEpuUkWjFhX2qKG86xwOCeBdZS9jcfPeV2s72tjtCQ/mll4BXU0uM5y
         CwEkBBFeLdol9lFk2IAQAsoc02ei9f5rARgK5ETctxUVf9WZMSci5CROf1X/JZkJK044
         kOwFs2KSShWDdjkE8WnJmATSa15F6JjD8xfh9qZVx2ifHBUqOYmkpbDMqaTX2NR+6sm3
         5ctQ==
X-Gm-Message-State: AOJu0Yx29yBCBoxaJcNKpda1mjCTf9czsBbeMxB1MESecraIUipsfrz+
	sRCJf9VKrEK/HmTRWUCLHe+dpHi3UtNH++Ocrn+zgEcWL83eMpoowWmS9eDxqT00XDFP+ueBuGI
	6HyUM4eiY2J9CeWB5lt/OMh82duIcP2WE+QCzHXmNaNtmyqnq6JVw+GhTl3DLiG4+
X-Received: by 2002:a05:600c:1e03:b0:42c:c8be:4215 with SMTP id 5b1f17b1804b1-42e9610252bmr48167015e9.4.1727344119607;
        Thu, 26 Sep 2024 02:48:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRS+J/sZ/G5fv+a83nDaWz8bDo11SuUZe7AY0abL26WrXIAWVD2hvX7wGRR149+SRI0o61tw==
X-Received: by 2002:a05:600c:1e03:b0:42c:c8be:4215 with SMTP id 5b1f17b1804b1-42e9610252bmr48166795e9.4.1727344119177;
        Thu, 26 Sep 2024 02:48:39 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b089:3810:f39e:a72d:6cbc:c72b? ([2a0d:3341:b089:3810:f39e:a72d:6cbc:c72b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a1f2e6sm41966895e9.43.2024.09.26.02.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 02:48:38 -0700 (PDT)
Message-ID: <1ef277af-3d66-4b8f-a6d9-e2066f40bbe3@redhat.com>
Date: Thu, 26 Sep 2024 11:48:37 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: phy: qt2025: Fix warning: unused import
 DeviceId
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu,
 aliceryhl@google.com, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 kernel test robot <lkp@intel.com>
References: <20240921062550.213839-1-fujita.tomonori@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240921062550.213839-1-fujita.tomonori@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/24 08:25, FUJITA Tomonori wrote:
> Fix the following warning when the driver is compiled as built-in:
> 
>        warning: unused import: `DeviceId`
>        --> drivers/net/phy/qt2025.rs:18:5
>        |
>     18 |     DeviceId, Driver,
>        |     ^^^^^^^^
>        |
>        = note: `#[warn(unused_imports)]` on by default
> 
> device_table in module_phy_driver macro is defined only when the
> driver is built as a module. Use phy::DeviceId in the macro instead of
> importing `DeviceId` since `phy` is always used.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409190717.i135rfVo-lkp@intel.com/
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Please additionally include a suitable fixes tag in the tag area, thanks!

Paolo

