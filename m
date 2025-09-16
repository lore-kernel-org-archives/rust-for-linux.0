Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3974292B2E
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758062381; cv=none; b=PAGPAWlZMLsxPtHyh66RHFq4RhNAlzRcsAhA+iaaqb/uZTrQo6iWvrjG8+VLecYg1b1WV1eOWEHhlgbzSx9tbSqGCDdgag3R7sixKcnRjtYGy5JbEEYHlrq6O1mPO/1whi3e2saDV+o3E6665OfG4MdA+FLCuxZzs2l6g+zTj1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758062381; c=relaxed/simple;
	bh=k0SOfZoXTL+6XpT7LDFJn/Tq3Mu6JeeevxzxgIaMsmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4ht0uWQCYEadwGVafYuoR5yzb1MIMFP5ohVBikJrQH94z6oxh6eIy+bI4cB+S0Ub2WMo/GEUgfBMPFbfqurlOngiJlUltJkmCqef3VvxUIlsNRMimW0JLAUbjN83koHn2+XkFc4TxGsOO7GZUGt6QKwivi7WPQ8Ft+coPGsyis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BkAA8D/1; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BkAA8D/1"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-82946485d12so279762285a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 15:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758062379; x=1758667179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ywdaVb62eCR3TvAc/4+sZpZzoYKTPBN8q6oGAifJQEA=;
        b=BkAA8D/1/6NCcFJlQD8q6QQQHj1raguXwPyrIhw4GIJc0ZO1z+tfSWboWr2QU0rGLE
         NxgxmMth1RzQF9hnJP5SxRc8XH1VcPypk9OTPa81T3CU/HdKfAytIe1/xgFT9XgqQx2U
         DStqeNofIvkJqE/Y5KjU5n3gz683riqFw3Q4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758062379; x=1758667179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ywdaVb62eCR3TvAc/4+sZpZzoYKTPBN8q6oGAifJQEA=;
        b=cTi8ZzWCO75xMzDheD2SUX/S/5QDWB4Nn4FaboxJZ9eMjEMFv/Q5gwTIhJzUQv4qaS
         3ffPlgIDA/VpMmaVLQYmAHHO9bqaSPNE4zN0U+tVfZvR8Slb4fC26f0iJiueaQFcaYNG
         E2q5EfSFmmcEWRd7EUiVLVl6XqgEhOV55BHhjaDYuAfKZwDQe7e9lPUtIEmsScYXHjOG
         u5n2g8UydtfZyg59/fxcODWtl7NguISJTkscmLLjPTRF9PTI/FiWLYPuubnmcjlaPVYq
         6z8tq2TEMs57831/SA86zH0E0w+E7XVpZkNeaRBVIwssohWkpzW+iPjPd9d9Ax7kZJIE
         Pmcg==
X-Forwarded-Encrypted: i=1; AJvYcCXqunSbtE9cQo7VA4GzFS224v/EcvR8ujQ1NeVsVJulUv0xWc9HLfo3/bZDsC3aIPhwIXRS4PJXRVMMQauK3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw546KeZeWJozEA2Zg+3m9OjH0gy1ui7+KS5jTqBUHI9P6GkFa/
	rS0kZ5jT8HNYKLILTuXXYqhdZtFKVN9oXjnjbR1dSErdD9knyUue+ajq3kEoJc0c+NE=
X-Gm-Gg: ASbGncuFTh7DJskIA6heidt7F1wBDVD+ZEX7ZUZw0FoLRnW1l377/rTdn+oQyn5kSY9
	9K8ES26bShFFQSNtHbr9crf7BAYAhi3RQCCc7apjWyL2UEpLs4M2D1bi4KD8YeKLKiM3cUPf9tK
	JF/dUqUbfKbTRM6ZaOGy+cQ/M7Z7MIciy1kc9LJEcS8ehTynPXZD1/qBXAOYPsNwNnj4d85UoTQ
	5kJswEJ4NRW7LO1X40epHT4ulsStHTjFPD4a7QQoi1kW9qBNM247spX56uqgrilPj7LkQIk8aGp
	lb/DKT6y7bePiyCSQGIw8e4azHoQljUz7akGc3QIloI3CYm8Z5hwVf5SZ7VagWy9B1Wk2cQ7OwO
	BrkTI+Vgt0KEeRWup5GGloFGStjlBA3Mv004wB+7tYVnnZXo/injDT/UhGGJtCSl7EMiAD8tGqW
	XHGAOfzGq7cT6jAMBlcmMa4DS/tXO4q0TLaq0vdituBe4=
X-Google-Smtp-Source: AGHT+IESNgABLBfvwr4hM4tLIKI9UIhpBPnDVjoN9Ta2vfOV0RzKOw0gmHxxKYKx1UMzPUGBzABwLQ==
X-Received: by 2002:a05:620a:450e:b0:811:1212:1b6e with SMTP id af79cd13be357-8311390c126mr173485a.50.1758062378651;
        Tue, 16 Sep 2025 15:39:38 -0700 (PDT)
Received: from [192.168.226.35] (207-181-222-53.s5939.c3-0.hnc-cbr1.chi-hnc.il.cable.rcncustomer.com. [207.181.222.53])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b639cb2562sm87328371cf.13.2025.09.16.15.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 15:39:38 -0700 (PDT)
Message-ID: <f18854b2-f9c8-44a3-a09d-3b2ddbcb971a@linuxfoundation.org>
Date: Tue, 16 Sep 2025 16:39:37 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kselftest and cargo
To: Jarkko Sakkinen <jarkko@kernel.org>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>
Cc: linux-integrity@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <aMlqouOSU8XN7V5H@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aMlqouOSU8XN7V5H@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/25 07:48, Jarkko Sakkinen wrote:
> Hi,
> 
> The pre-existing kselftest for TPM2 is derived works of my earlier Python
> based rudimentary TPM2 stack called 'tpm2-scripts'.
> 
> In order to get more coverage and more mainintainable and extensible test
> suite I'd like to eventually rewrite the tests with bash and tpm2sh, which
> is a TPM2 cli written with Rust and based on my new TPM2 stack [1] [2].
> 
> Given linux-rust work, would it be acceptable to require cargo to install
> a runner for kselftest? I'm finishing off now 0.11 version of the tool,
> which will take some time (versions before that are honestly quite bad,
> don't try them) but after that this would be something I'd like to
> put together.

Probably fine - how does this impact kselftest default run?

> 
> NOTE: while tpm2-protocol itself is Apache/MIT, tpm2sh is GPL3 licensed
> command-line program (for what it is worth).
> 
> [1] https://github.com/puavo-org/tpm2sh
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/tpm2-protocol.git/about/
> 
> BR, Jarkko
> 
> 

thanks,
-- Shuah
