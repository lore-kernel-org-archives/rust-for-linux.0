Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D8C1BC2D
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 21:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707254930; cv=none; b=Kfklm2kv3nO9JYFHmd+iSOuVgQr7vw3s6ow39pn1867jXhvCKw31HOmp1EX8RQMPXAACVA8zV2S7V5P0DLsOXOKYVPhILkI3zHtFadI7vTK+tqzbeDFHEcnnwCg+51F9Do5V2O2mF5+B/SJ44YmKTHu9HJQrwyGg+3DCiuNqsbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707254930; c=relaxed/simple;
	bh=W1e5XpgpoDYff5CEV30DQ7/zd1uv7h2My++l8yXCpDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SOaxcZPf/U/qNDrDSGP5SG3DiP/JPt36rIyOPglk3DWyjvzBF3znh93Y+znKtmGwJWKZrHCBxSl2rSoVkTyFqGiN7yhXjgAUBXc+reCI93D3WBRzpxDb4AVaEp18eEQJrvUG0Eh0+SG6ausoeP4tPxdnqtqPFYXgVGLx2ne0f8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VacH31y7; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VacH31y7"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d944e8f367so48878505ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 13:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707254928; x=1707859728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Pxk4ckTSL8kGpPY8enAl8Y/oJzt46ESbsZRXfKy/KY=;
        b=VacH31y7cG57h2OWSSN8wfKbIG7TBX2CqXumZXELStBdshud8ulefJ1irOAMqP1pb5
         LrOKjrt7TqGFbUjwTQHqSPFnOckm0KW6VNZgqtASndVRZkNWsSiJ9I7Eiu9cXD4jWqzm
         Gkhv+dwn+a314aakLTQ7ZqOrm0vVYAfdjh+CUNHkNV0qW8wltum9gqd/TXkC9/Lzpobf
         36Yw8PD38HKEqD0u24/bgUfEAxOhzrujhXGOeipVPF697+bQE6qo4ltNBA07L5Q30W2M
         4vq1QrZPTsN5wbr/WxUuiep0Sdrth9hokhz+b4sWhQvA4QHI3gK65pyV4EjZZO5gNdMm
         1gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707254928; x=1707859728;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Pxk4ckTSL8kGpPY8enAl8Y/oJzt46ESbsZRXfKy/KY=;
        b=KfTQGObRKIy5Jjd06ephJdTrVQPs2oaHcMLHu8Nd6hW5cAZrmBH5hEwiVpueKe3H4C
         NbmRT/HklHITbv7Hh9VxSUZsI0Oxr+uvGhegqLx4ZFdkJzl8EyMaNY4WTPspPjKb//+e
         P5rsIoRPCRgjDM4fzNhu3nU6dz/bJcu4dQLVrMcUTNtnBsHxnMQc9ym89xW3uRw3Nk+s
         DzfQlNI1jZO4X9aaYCfs/lcKUkmEKsu428O9pgFTzKaTGOkd4LiPodetWwucK11KJqVx
         9jdAmNxk3axiv0PSt0f/GVH8/bpDySZ8bx1m9o8rv4AVQCbNP5tj1i7rpVVhHAG5MwsZ
         N+gg==
X-Forwarded-Encrypted: i=1; AJvYcCWFCrSMq/rkJT8ll1sbJjYrSfEEEf23FEl9Otissunn/a6A72MKHyBQfRj0X4DhUe7NzFqkElNn0mC9T7hoBdpsQq0ZpHiG92IVDHt/AQ0=
X-Gm-Message-State: AOJu0Yzsn0M0oITp4YN4K0ewqnqW+ajHvhvovTAvOkQbCD2gi7dozOyt
	//nQ94X2aZXeqv1+ngRlNic3lnYuoBUmxJEt80VhywiIhDC8kdRJffBmYPLK
X-Google-Smtp-Source: AGHT+IFOiKTOqplHBBQbRVUHOQhvhWj+mTC726W+oXHGHRg2SA90fBvyLkOiyHyc17VnqLevengGUw==
X-Received: by 2002:a17:903:244a:b0:1d9:1cb5:558b with SMTP id l10-20020a170903244a00b001d91cb5558bmr2908337pls.15.1707254927977;
        Tue, 06 Feb 2024 13:28:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW2j7GTDXBfyQsH501a45AipRbjdbm3QpVZtytxFYZ3DdvyOwbOgtSDIOOBZo9ztmBQYX+eORFSiKPWJHK1jFmFVTuv3dYUA3N4GBDv4yyJODGMRHHmjQYdD2SskEz7OniXVAYGoSZbFo3oIqRWxIUojv+L4jPjP1NnEYKKiWxboD2FBWcRLThSGGDFVPDshLIVdBEiKJZiPyIdr8JujnVR3nmsWs/aZkD1BPTfoekddCQ=
Received: from [192.168.54.105] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id kk4-20020a170903070400b001d94871ba92sm2331196plb.239.2024.02.06.13.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 13:28:47 -0800 (PST)
Message-ID: <0e8d2b80-d2e0-4089-b6af-731fd5048eff@gmail.com>
Date: Tue, 6 Feb 2024 18:28:44 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: place generated init_module() function in
 .init.text
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>, Greg KH
 <greg@kroah.com>, ojeda@kernel.org, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, rust-for-linux@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <2024020646-browbeat-cozily-0bf2@gregkh>
 <CANiq72m8V2nycL=P8yT3M=e6Nek0w45zBK48Aqbt39Kpt+bwTA@mail.gmail.com>
 <20240206144959.GE296718@fedora-laptop>
 <92bd88e8-c585-4046-b787-0e041bb3534e@gmail.com>
 <CANiq72n039-rbejfxgsXz70Q+zA3dewfU=6b+umhMMEsYHeZnA@mail.gmail.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <CANiq72n039-rbejfxgsXz70Q+zA3dewfU=6b+umhMMEsYHeZnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/6/24 14:19, Miguel Ojeda wrote:
> On Tue, Feb 6, 2024 at 5:07 PM Martin Rodriguez Reboredo
> <yakoyoku@gmail.com> wrote:
>>
>> Un/loading modules using `modprobe` to do troubleshooting per the
>> manpage on the `-r` flag, although that case is very rare by itself. I
>> don't know of any other case besides it.
> 
> I am not sure I follow -- if you reload the module, the functions will
> be reloaded too.

Ah, I've said the only case that I knew but I've overlooked that detail.
@_@
