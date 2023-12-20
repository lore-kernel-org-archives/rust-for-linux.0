Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B280148788
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Dec 2023 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nB3EBojo"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-28b09aeca73so782969a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Dec 2023 09:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703093892; x=1703698692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OJfnlzMmojRmso0XSoHdLn6mdYRY64PxKa+xh+iIUPw=;
        b=nB3EBojoQBjBxOC1tB0e9QGrTSzJdxQf8n2m7AtNip+zHu486g3anHigrgTsYKUFy3
         mcsJn1cos3zLfPUbohBdAiydc/NqJ6ahtCTExu6CzVdMzolg0xmll6xMVSIUkin84QGO
         kObXx05eJwwpQX8oy26OCt0Y0XSqNA2Ijhs7V/ZurQt782ijdd+VFinhrFH0d1+Q6dNb
         a62FNz/5JIFvujaqUAjJwjNj0mt2ZRRoabCNGn+1KLxZigpJ1QfWMi60MhXPG9Ihv1Hv
         n5rBG+REj+1YqwVLJzeSqeVOBXAkmOV4e32fTtWNCG79n14a24Xh7WhSLB4ToyFdAy2n
         fIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703093892; x=1703698692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJfnlzMmojRmso0XSoHdLn6mdYRY64PxKa+xh+iIUPw=;
        b=pmcovyWYGMV8gXimbbitDaMjLVpsuYwJVWrSe8npPHYcA9dcWR2QB7KOand1VNGaYy
         Bf7B28BOE0BJq0YfgdHnBjR6tTm3nMLqloTnfDRFTbbJaqsH27lM1urkLIkUm+JDUNMz
         8+L9WW0xraYWg3ujaR7c5/duwEycpbs5o39GzLYGV7DioBHTUIshbadQgEHDi9VyXyDg
         D9PY943LgqM6DDGLMpwI3E6PUKNQdu/cRAj43pBV+aeLH3rt7LlmctzqeyM/rcMhcCIk
         zffjUwQ2Ogop14ah3WJAB2bHl8qKGoDNgW3CASJOZ905szquv66XvTJdixzJZHfa863K
         iarA==
X-Gm-Message-State: AOJu0Yyj7RV1LqLWnDuA2y1TgOV1aGsnKC6d8CBMzxIZpuTBVkm6QB5/
	S5HXbZrnsPzADCUupm4hhGI=
X-Google-Smtp-Source: AGHT+IFYuqn7x0AslChvjVKO6x0qHFVmJQ9BNoqLDI/HyJZL8bkJXbyFjvhGxNfQBK87tbrDy93HAA==
X-Received: by 2002:a17:90a:10d0:b0:28b:e961:c416 with SMTP id b16-20020a17090a10d000b0028be961c416mr153373pje.10.1703093891656;
        Wed, 20 Dec 2023 09:38:11 -0800 (PST)
Received: from [192.168.54.90] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id k10-20020a63f00a000000b005cd8044c6fesm64002pgh.23.2023.12.20.09.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 09:38:11 -0800 (PST)
Message-ID: <d23a3ff4-6d59-4565-a6a9-c6962107bd33@gmail.com>
Date: Wed, 20 Dec 2023 14:38:07 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: rust: Add rusttest info
Content-Language: en-US
To: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
Cc: David Gow <davidgow@google.com>
References: <20231212081313.226120-1-dirk.behme@de.bosch.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20231212081313.226120-1-dirk.behme@de.bosch.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/23 05:13, Dirk Behme wrote:
> Searching the Rust kernel documentation all existing Rust Make
> targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
> rust-analyzer) are explicitly documented with their Make commands.
> While the Make target rusttest is mentioned two times in the
> existing documentation, it's Make command is not explicitly
> documented, yet. Add a test section to document this.
> 
> While at it, add some info about the more important KUnit testing
> too.
> 
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
> [...]

Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
