Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B5B1990C7
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 08:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754642655; cv=none; b=hzCJStsheHzusPdHtZgh9Cfue5lPZgGRzF2IiX41vvnkrl+67Fl8FpF0FmGkgmMS2jfB41WkM0NGKAT27z/0yKSX452l8Xm1h62BZHJM2UmvG8CARGAtXP+q0O1gpDxBIr56ND8VV/FLxk+/RWhVCsApQSIkxwG9Kyh38LEknoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754642655; c=relaxed/simple;
	bh=z//reg+1a7bjQqqPmKD29ukgTSlnPg3SAH3xZgwP+Kg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnbRJANfJMwj4ES2IPJmZcLGa+qSO4DMw4lvklQycj+p6UYuqpxoacEnkYh5/qFml1NRF5a1A8E1WzQCI7UZ2xMjMivZ7WhDDbjj0/aEtokjF6L+34WRODWJI+k9FUb4jm68lJVhC18RcqwIJgYOEuQlr/khz5qy0XLPonfCprQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NovgkFnQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NovgkFnQ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55b827aba01so1800185e87.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Aug 2025 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754642652; x=1755247452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NZy8fhI/8Zr3Gwec6mDhhuy0wQFSAUjRoPFxbUdxxM=;
        b=NovgkFnQY2pMARVH5Q31+HDJPamkHn5jEiYTC42ttL+Cn8xOdZ1j5W2bFqaS3qg7QK
         SRny6f+9v4awOpCEZmXWTTryaq7Z1s5Hq6asTkUDsp/GwAMtw+sUIs3DyxDPpMUmWYN+
         cw8FdKjjg/GKj0djV1NH7eFF3IsIsM0P1unmP9dEEB1tlDOQLS83gNO9WDDxOf60HgGq
         /tdPeyUVZO/y+jaPgAjFG9+VTAMuSpyPsYaaEJJ1ASf9hUD0rOoiUjNVESwmT8WXHmpD
         MYBBD/NgWC5DocrIRReFqrUarNI2fj2JDIEdc8YW9U6VfF0V4q9y8ZQwvhIWB3Xkc388
         EoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754642652; x=1755247452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NZy8fhI/8Zr3Gwec6mDhhuy0wQFSAUjRoPFxbUdxxM=;
        b=oESXX1+0KnUWWa/xkIlZFzn2kkiUlyv+xgwqETCGT0Da9pSkBcApLYKRsk3d1MPgdI
         MRdjRjmzkQX5youaTat2aSQbJFXz3iYNSjOQZjv/5sHC2gzpXLHY/TfYaxl7ZUCaupFW
         zuTT/2GTRGbDsbJqIL6MVlqEkLyW8rQXaWmqhVCx70K6/UTkTRyhgyPYYjmcQM/gX85n
         Z/eredXzuanfL7KHKB1ejzFeYO5s4qahK2rIbj1AVCFMTnWlUV+gTi2aR9wQmVMgHOId
         Gt/znxPKoOjyAOU5hStjp9U8MyTVUrYCarljsAxIl49S6qL3KN2zAFV1FdTH/K+2Dt80
         djzw==
X-Gm-Message-State: AOJu0Yw1QSemz55lTyDd5Y1p8lgHo/wfsdVtmmBGwpeK28LNLT2DVVvm
	8JeZT+STTqP6/7DpdFYbcJPUCbst9Yd5XqHnEJkGbaGQWk1ah/dp5mT7
X-Gm-Gg: ASbGncvKH3cqqGvBYuJUmdJ8x9dcGLSfepXF/Nv73JgjSiqMjFnxYjnsJgZDUGXub+u
	P6aDMAUgpwGRUP1gAafbN8V6C6wSuFCC1iEv5EG6wBgLprEPRIwTh4qojLwoEkH+juJYUJSTwMC
	srCQgGkjMjCA2ywWY0hmE7tijoiKdK9u5vYKzRkA5NRUPl+jzFKSjZ/5hpQYA3UPqKAZZ4SBO/o
	RFqS/0PlX/mzog8jNPukEA+wXrv4YvEigSyVVPPCHRTuZR4CXq491WxGvTaYakB4VaB+YyiKPBV
	s85BshygUB7GOUXpHYG8B5I17XZi0V8VOu478U3DenYyIn+Ocb5qzjjXlsLTmnCV2V38l6J4IbO
	Z8/+qysdpOCLUm/2TLnKo6MaENexpETVpKef5iRvvq7FNrruzc06oiHdc704Nc0ZeR/K7GanyQi
	c=
X-Google-Smtp-Source: AGHT+IHh7xP2RpAKnaWxEyvZF0rkPfNDhJFuM/JOlbuDsRsOZA4nV8LMJSJTEGm7dS+wQxlVJcRQBA==
X-Received: by 2002:a05:6512:1042:b0:55a:e1f6:bd94 with SMTP id 2adb3069b0e04-55cc00da43dmr474430e87.14.1754642651897;
        Fri, 08 Aug 2025 01:44:11 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b9fa8c216sm1902181e87.25.2025.08.08.01.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 01:44:11 -0700 (PDT)
Message-ID: <72a1afda-1931-461d-b912-c404cbfaafab@gmail.com>
Date: Fri, 8 Aug 2025 11:44:10 +0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] rust: alloc: kvec: implement PageOwner for VVec
To: Danilo Krummrich <dakr@kernel.org>, lorenzo.stoakes@oracle.com,
 vbabka@suse.cz, Liam.Howlett@oracle.com, urezki@gmail.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org
References: <20250806205044.85085-1-dakr@kernel.org>
 <20250806205044.85085-7-dakr@kernel.org>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <20250806205044.85085-7-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/08/2025 23:50, Danilo Krummrich wrote:
> Implement the PageOwner trait for VVec; it allows to iterate and borrow
> the backing pages of a VVec. This, for instance, is useful in combination
> with VBox backing a scatterlist.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>

