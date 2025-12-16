Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB1327C1B
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765904599; cv=none; b=TZibSwag9AqaNVs65QXvaroYs4OmHlQRSlDIdXPx82D6EAFF8YaoNMLeGtHUj48ScbVWq8x9X639fPJoNxI6LSSuPxRenwWuMWMUbCh0KAN5g6CoibJVXkJu9fsi75nhkI9W1Ma7BQ4R9gRGto9qeRef3+Vjn+1C8/VZ/mWesLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765904599; c=relaxed/simple;
	bh=o28FZU2eyfE0k0nQhHK9fW9HlH9wMECsfQZDC0284vc=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=FnUm0D9U5Espn0PyowqWFciUI8OZORs3h4Hc27pO2glrU6KR4BwTV3VhClX/eNbSaKIMs0Pon7LFYReWLlvtRTaI8yOruDAnz467ay9TNoldhHVpa38oNjp3NUva5jCd07eQdXi6nohqJYCp/FLqXakWyLdrqQmuvHH7e0gy7fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot0lYiiw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot0lYiiw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so52320085e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Dec 2025 09:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904593; x=1766509393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdkr38QTJAPcpLAthn9VgGdaWuWTWa11kuD8ioY1nvw=;
        b=Ot0lYiiw/vEL0Khn1RZ0PCL+gUEcXW8FTVFnRa5HwDTvplv8MCVHx1KOtPZWqaoqQw
         IFURpcGRUmng8kUqma4mpuZZhmUVVcQgSub6PXPXjdU6LmEQ6lwbbxAohxyDdX5PiBzN
         L+lW38sm9zdCb8Nmdoj/DUunaXqRrmZNRRkgTcebK+H6AtH0Em8/hRmj+aOZw06ZlUN6
         j1v3N9fULGa3oLM8yNAvX1IOtwkwKK8a+ZGXIZiGnS6GX/4Oz+2aqo9+dC4ZvQqcnRwf
         igpJt6tfC+r3txSuO+BaJJK7GfMDGcW6lr/dm4eIpSwLZjGPfIRD2+lGfoH1+2PnzXp2
         KPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904593; x=1766509393;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdkr38QTJAPcpLAthn9VgGdaWuWTWa11kuD8ioY1nvw=;
        b=uiGPDS3qbfrFC46X1rSkk94eLU+6J9nLK4H2jCFMMt0Ah9QAKbHhUqgXs6m4xtjtEz
         v37q1enYZNiyxxuzb7CyilcLdPTo3NxIvT8u3Uymf7Lb299wSBQCkHHkUDH4gKs/YopN
         ukdEMn1tCvJdJqp9AHC57qAf9f3gJ84YHBlwqDjo1O8rfSqWXIwKRX3mSkGgsftk1iNc
         S71SSHNZMQ2CEA0pFqlAs7tUEr9KFmllDs+bwdl8jULicS6eEo1KzJ4uW7x8Ag0uAD/G
         7dBhmGMq+pEd6K3f1soueMgUDtzWeGxjzbzlEcdey7leKfJBJmS1sgiwWoj3mb3Sp59R
         B03Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4sq8c6uLTAIqkF8IPnKCpJhGfBRMGP9MD/0Kp6VJ62knza8oBaK3woHnwztpB1GSjFIptk2jgfXaHfECr7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7Hd2CS7jync559zMQm+m2YeUCTa4HhWCa4clraSKqci7sl2l
	u6RKT/82uIk2/uuWoLPCfLeYppv2GhJFJxkLA2yx7jD03SEk+Ba4giHv
X-Gm-Gg: AY/fxX5zvpBLtmwKYLUqPPcCzZ9549EiYFNMf2tO8r7OILrgXJ36E818PMut/Hjf4AH
	ax+lFpwULdqKDfG6yz8zz+aVvkaoQJke9DUetQZIlXespfs6HDKSse2el24HHtsrBYcbM3CHVJ/
	Lg5SUBJzkNYGnZqf948KErRT1xFPnwSQIUzEHXX4e3FxWaw6bFWDDFwFmaGovJXQTS3vvesonyf
	Q/46OpRmnHiGggi9es1TJns2OTFAwlptEsC2n9PdTQyoHlnBd/R3gz2MVJpBJ3nRRT7N+ENuqO1
	cyD1rfebu7AzH4Nt3LM7hwOde4uaN5EbE0LHAgx/ivZCzsRGDyZzPgucfm68Ry2S0CyYWuL0z+w
	OkbSbwtLXFfURcFr/vIXGZ+yKP1+4eCwe3x7j4nwsDbNc0cZsEXMinI31sGbcnTVMaL0DPpGqw1
	9QUI0tLuE7TJE6yTKTXrDffIE0WtfUPuwbccAOn05LFBySjcuV6a2eN0+G2p4PXuTViK6SWH70f
	0QHZp4HELMArNuS
X-Google-Smtp-Source: AGHT+IGoEuhivnEJtCF/1hKiY+Xym1qtv77KOIkHQZJWfAGgOE/Hr/PbK0AQK0NfWAZKiftyiU/j6Q==
X-Received: by 2002:a05:600c:4f90:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-47a8f8ab02bmr139278345e9.7.1765904593274;
        Tue, 16 Dec 2025 09:03:13 -0800 (PST)
Received: from [192.168.1.203] (ip-095-222-069-115.um34.pools.vodafone-ip.de. [95.222.69.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4310ada8477sm100861f8f.7.2025.12.16.09.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 09:03:12 -0800 (PST)
Message-ID: <266b9b35-aed1-4c2f-9fd1-4da349876ac5@gmail.com>
Date: Tue, 16 Dec 2025 18:03:11 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daniel.almeida@collabora.com
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, alex.gaynor@gmail.com,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, gary@garyguo.net, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 lossin@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu
References: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
Subject: Re: [PATCH 0/7] rust: add initial v4l2 support
Content-Language: en-US
From: Frederic Laing <frederic.laing.development@gmail.com>
In-Reply-To: <20250818-v4l2-v1-0-6887e772aac2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I’m new to contributing to the kernel and was reading through this 
thread. I would like to ask about the current status of this patch set. 
Is anyone still actively working on it?

If it’s unmaintained at the moment, I’d be happy to take over and work 
on addressing the review comments and resubmitting an updated version.

In case you're wondering why I am interested; I am currently working on 
camera software that utilizes the Microsoft Kinect 360 and V2 camera 
variants. Luckily there is already `drivers/media/usb/gspca/kinect.c` 
but it has some errors (like reporting invalid frame rates for color 
data) and design flaws that makes it impossible to stream depth and 
color data from a single device at the same time. I already got a new 
user space driver working in rust and would like to upstream it to the 
kernel to replace the older kinect driver written in C.

Thanks for your time,
Frederic Laing
