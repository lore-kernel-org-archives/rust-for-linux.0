Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF3F1CF94
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Jan 2024 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmM9KE4p"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d4c767d3a8so11520905ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Jan 2024 11:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704311337; x=1704916137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fYNlmcYDq/FKhPwEn2SwuZOt+/yZ/VgX2d6EWJs2bUI=;
        b=WmM9KE4p08MClefotP7WBR/ZW8MQOW4WmWoAXSEGT+Og2LnQ6b0l21el6wiN8hUR+x
         7pgz7W9DkYmwV0A8VKr69PAN+uGMpI84jAz5ddPszR2X7rBQXMxEhygNB3POqk5NNUnW
         JmXpwiHYnCa+JjMuOGTcltA2cjQFVOaCwNtwjTALeDut4fWlcGSNoFh5C/rtQsE8TYld
         KFkRet+3xO+VM7kFp7YhcgwH7EMvL/bpGHRJgWsdrpKqUpKrr+C0O6afGhNdFlj/iysS
         tHlj0czNm6oDCYujrU8oFcxlxiMvW45eAY2HN7ETdZIxYOdZ3y94eKnm7j30GQSvZE3L
         CF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704311337; x=1704916137;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fYNlmcYDq/FKhPwEn2SwuZOt+/yZ/VgX2d6EWJs2bUI=;
        b=kahNo1IBI7AtwZUnVSBU7slIOk0PjWeYIJ5LXv30RrC5PeqGzChsboR4unbXKeU5W5
         deuJzVOxmYLmE/HkVVt9WpK1s/z3Ka5mouyEXUrsCivQ5cb+jTvTFliAqqLoisNGR2tB
         o2wsnBV0r2J62l/HONTC+gjuNQaOReIzFdig1Qd8EBv4SDbLBthOeplv4UzDr4dcfe7U
         WMY72BTOv4aLFsh7AF6k9VP6VV1ro4BJ5yGFFC5KWLiW+xq7vtm0aqIHAMAOXmy6OsBT
         2HE+h+S6SX3DdJZYDPwDKjiA2LY4ujZe3jFfub52hpMoG8Zc7SII07f7SiLgVDd02rzK
         cfCQ==
X-Gm-Message-State: AOJu0YxzUsYcxNTJqwwf0cSvZA2Lc5MiHIbE4zEKYbE8xDIxfKpq9MHN
	9VFK/WWzf3WM3UpSNp7m2lwq/5pSCg6T4g==
X-Google-Smtp-Source: AGHT+IHxsuacKYe8ZIsqoK4a7KRw1Cw0SNMSRg+XQygQF07KrzN0dPc4EPcCwPxtFH+TDqWSQx9BmA==
X-Received: by 2002:a17:902:c40d:b0:1d4:a8f2:40fc with SMTP id k13-20020a170902c40d00b001d4a8f240fcmr3896733plk.45.1704311337500;
        Wed, 03 Jan 2024 11:48:57 -0800 (PST)
Received: from [192.168.54.105] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id x5-20020a170902ec8500b001d04d730687sm24051045plg.103.2024.01.03.11.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 11:48:56 -0800 (PST)
Message-ID: <2504bd38-0e03-489d-8b2c-ce156487126b@gmail.com>
Date: Wed, 3 Jan 2024 16:48:53 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mixed C/Rust module?
Content-Language: en-US
To: Kent Overstreet <kent.overstreet@linux.dev>,
 rust-for-linux@vger.kernel.org
References: <jz4dal5qawwz6i4hle7v5emgvyvc742fshnebnkufk5ywcg236@fcotiyv4bbdn>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <jz4dal5qawwz6i4hle7v5emgvyvc742fshnebnkufk5ywcg236@fcotiyv4bbdn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/24 16:20, Kent Overstreet wrote:
> Has the build support for this landed? I'm not seeing any examples in
> the kernel source tree yet :)
> 

There's my patch series [1] that address this issue too and it contains
an example of USB bindings that get compiled into the `usb` module, but
I did not work on it and there might be some dependency issues pointed
out by Masahiro-san. I'll probably change the USB bindings to PHY or
something else though. Also there are a pair of Zulip threads that
dabble on the topic, you can check them out too.

Link: https://lore.kernel.org/rust-for-linux/20231104211213.225891-1-yakoyoku@gmail.com/T/#u [1]
