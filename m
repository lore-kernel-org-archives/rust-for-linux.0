Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7834B4A0C
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 01:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707183585; cv=none; b=jKRWKHyOZTUs9TwFgFZSkwBWryRFCmoGWNwCNvZl+2q4ZgemyH7udX/IwG9vtVGvzcfCBCT8RZcVT/4SuVDRVhX6m3hlVfBFuNzEBqQnkhftF5MzY7xuVry0gxq0xghRq+DdBSq+ZEqwoSbTE11ejRfboWNIrtpQLfjbecOGQMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707183585; c=relaxed/simple;
	bh=1hm69XbTQsqAlIgsS/rY3axD4MELkVlwIaxE/MyU5Ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3UI97BxoGPgReuwvjCSicn6njvhVrz1ysrX/ZBzvJFNwsbG8+6kgIQawMYtBkBAPDJGfJmjEODTZLakKS2vhZCQ5JuwhyjxLqZp0A2pA2rNaMpkWS6LWE9hMYBuuJjERRhFja1QZKeFZ6ukLyb2rZO3FkbdGypefuGyWaroJY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDjXLR45; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDjXLR45"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-296c58a11d0so260682a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 17:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707183584; x=1707788384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gszvDCCvpwTCq0u4FAocRQz4uoP7UVwgN50bqMSEJN8=;
        b=UDjXLR458gva0QOij6hZNMpd1BOaAqI4hLCvyW5qaP4bODMkrEWn6VLazUPfJhh8r/
         lSXlSbDmYVotc67YiR0SilNMfuajcTotGWVdDJaT8tvBHw0suHl/Ap723zqUe/m/PFny
         uT6Ry/RYJtZJP9cfQOSd7B7OyNjiAnx4q6h4bKfpJdxynbYivmeqeEh2mapOZzbOWJPm
         RGwMu9cerIqOlnLIFDNof4W7D7uOn7SwFOLYe1Ern8uwqc3zxT+Ta7e9ZYLwkwAj+Y7G
         fEedO+x9LqL1FE7lLxrbbSdu5LPw2TwJnZKPOKEkOqqMHKtEvXTpDbbqEP1RxjIHTNMs
         OhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707183584; x=1707788384;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gszvDCCvpwTCq0u4FAocRQz4uoP7UVwgN50bqMSEJN8=;
        b=Op4UccsfZ9uX4+Y2TWoCNO5G7wgR4YqxRkkvxVA6BziB6gg3Vp2dD1TWl/tIQoDi+x
         PwLCC9JORA12eH3lEXEHPaQXvpw8S4cRnPOQBqocnhQYASIKSURTQi7ucpJkSItRUkXe
         yaRe5v4h1ll49ne9sTw+UQAGW5pZgezglPoV8OyS/tCC+65JhnG62jIS84zkL0wnE1FN
         t8UKHSeujAZMeyj7mR5NET4oqHc4N8Rmi2TbNaPX838KRh8HYruRy/sb4rbrVAdlKZd+
         sJnBVVxhhiTsrbBmSQXeyv+7zE/pjpl8ss1Ge5SIRiXFCX0ok8BshCyBZUIWv6A0ZXo5
         2PWQ==
X-Gm-Message-State: AOJu0YwdZppUiYex0GR5mga5xVd+39XfU2qxuu7Oku5G2mAHJybDLhAk
	DKwsHgtsS3Z096UqoSo3S1iJ8j3Io6b5zNsOtuENcg2FhTQb2ZG2by3v7tkr
X-Google-Smtp-Source: AGHT+IFY9/OQSLgnuw/XZ87DWWZ08RFoyfpValqxFZCWRq8dDH4vIfEdrIIKVCsrLCMPO+nezqirRg==
X-Received: by 2002:a17:90b:3ec3:b0:294:cc80:ea03 with SMTP id rm3-20020a17090b3ec300b00294cc80ea03mr1214226pjb.44.1707183583661;
        Mon, 05 Feb 2024 17:39:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXstvP1JWLic8ClLqHfSjypy2U7SF9JFZVuSnL1K9lZghRzGwAtnhlO7xftHUdx5ZA3NUlSWcaSBbWZkPs/+27Ur2aKbd6nFKK3jGTLZCjYqoJXsxDVkG9HVBOV4eS2MVsXOIj50ID7l8soBy9BorqQEjsM2cUyFepNyarfcoyqDShWk8z1HGMuf5t2
Received: from [192.168.54.105] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id rs16-20020a17090b2b9000b0028ce81d9f32sm157817pjb.16.2024.02.05.17.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 17:39:43 -0800 (PST)
Message-ID: <c5a8d670-2574-4d64-8928-d606968f360e@gmail.com>
Date: Mon, 5 Feb 2024 22:39:40 -0300
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
To: Thomas Bertschinger <tahbertschinger@gmail.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, rust-for-linux@vger.kernel.org
Cc: Alice Ryhl <aliceryhl@google.com>
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20240206012535.480193-1-tahbertschinger@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/24 22:25, Thomas Bertschinger wrote:
> [...]
>               // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
> +            /// # Safety
> +            /// This function must only be called once, during module initialization, because it
> +            /// may be freed after it returns.

The thing with this doc comment is that it's going to be hidden because
of the `#[doc(hidden)]` attribute. I think that it should either be a
common comment, placed elsewhere or removed.

> [...]
