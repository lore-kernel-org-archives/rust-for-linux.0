Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3E91494C3
	for <rust-for-linux@vger.kernel.org>; Thu, 29 May 2025 05:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748494999; cv=none; b=jRcNN56zk3a9Pwz57IJPUVVlfp2jwTXvF/ljg87jpZbkA0xDPIyBSZFKbn3P+C2OJtBgchenEtI9Ajp1+s3vSTa/f4rnFYxLNXdNg3XIlc0LvIfrOiKkdKR9pUVblLHqgAvl9kQS9XrsawiTmy7BvaM3+odrhcV/DmcCDcTQubI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748494999; c=relaxed/simple;
	bh=UGl/ZySSb36hTdaeVYURkYFu56VLcQdFHCiCYGQ9NP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmUaI+D4D6jN3XGtnLowA4wEw/b0OpQgk2DN2WMqRSbcrMQ/A0Z4iFkwowA2s9LPhFhF/cNNzQrHkC7FIaELVFDzWCD83R7mQSnLxfP7Al3+iDXqXo/rfgpulxKAHY4nAg5K5IoTZ2Ma6d99kx9K/mxk1SjDNHNB0zwKlwHeIc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KSIVXhD0; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KSIVXhD0"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b26f01c638fso522704a12.1
        for <rust-for-linux@vger.kernel.org>; Wed, 28 May 2025 22:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748494996; x=1749099796; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hXUzyapC+nHSzY9vYq2BZ1sPf/W9lQog0j41wUW5fwQ=;
        b=KSIVXhD0TrWpctJMvsuAiZ6AdlV5dGYv1ol3GH2qiLssxZK6fVbE/ycUYbAxFxSqOP
         H4FSYDO46z53bPbHpihy0U6MRsxs/dymC7li+TJzyeaV2ZzK7ETWdd/LyJLs0TeOxqRz
         K+/AYInFX4QFoAyHBhJCvWz/7vaXWs0xj7NklrzSCpa2llpcyKK9wmfg1MepXx1z+8xj
         oJ/jJa2HG5/D0+09tMFLaaxaE1c/lRs9prHlvMyZRbHZbuUAky0/uE/kSom50MlHXf3b
         qU6BvnZCOIuuJBQDIHrq6iVtfdlouwirlDZ0RXcpFFX3JWCsnPbkqToWsHFfFg3wP4y8
         Pviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748494996; x=1749099796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXUzyapC+nHSzY9vYq2BZ1sPf/W9lQog0j41wUW5fwQ=;
        b=DOV5U6yJfj+Gm1Zd1bvDJnjPfFeavrpdIMQcY6GWAILTVFfHK4ZUO/IVb6Ykl3CEyx
         cM/JH/EBhxFV+72nRvFXY+KXut/l26O1GNDMyw3G+7geWzHX8mAhPg0o8F66jsaHBg9G
         KlGFyBjOruAp2yQislaTurDMwvfUDqYmX2s2tIzL4joiDfOoLPDEZIieCIh2ccFrZt3R
         moTKp9ZTPzlTz32XHml8m5GzPnHZLyOaKMO0n3n0vBmF+kkuuO1pRyCp4g2+lVAIbVBY
         qFXsgM0jVvFofdY8RyaIMXz0xQYD0ieDAs0wWwOk+PQlB2s3IiaYJ1l6RNjWWKPHhgfg
         TBhg==
X-Forwarded-Encrypted: i=1; AJvYcCVZYNJP4LQTzPAqt7CHV4Plmc4M3MBRDHqch0we3fYh1dQ8SLVLWBeGvnQ15aeknTakpTxN7ioi9J91ApdNiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwErl1kwBGw5YD16u/ImVo/XKWwM3VJVK0ayc6P1vQ993QhWG32
	SXNs7jK7dOeSNOFSf7D8D99kCTRewZhw/vsOvfXmpeWaU8Tcejmmc2niFiR+cNYGIME=
X-Gm-Gg: ASbGncstd/NzFzMSdQFqStfJ9JX9KCVEKsxk1VIEp8A5o/mtmOpxPL3A/jqPb+wQovq
	Ho/YwGHcdTkWoExyEl54NMLCznPi9y2LKfah1ifmykTJLqKMaD8opPHKYFOxU0ipl8KwBj02EEa
	XJdAekCGi+P3aWb8Crmkk41tqn8XQMJAmj9fhLGp8Bp+zkLTFRJwChd7kru4V4H0yRjs3wSIJlr
	VpSRCCcP4RG2Rm+c3VPGdqcpfqefZ2gLsU+tqTRoLMR2F2OjkEOMu7/xT2q9O7Z2km+9hncAqrp
	0MfVCONqo8Hx3P1csaJLP0hM4cQ9JReRWTz1Wzc20M8ywu5CreJ/Aj9pvUpZfCw=
X-Google-Smtp-Source: AGHT+IHmE5fBVErzq+nDLeIPGuGZs+OGjD6nPqya+VPXH7c56/1z1eUN/PtGQH+KHkU4G9x51sVhkQ==
X-Received: by 2002:a05:6a21:2986:b0:218:cf0:fadb with SMTP id adf61e73a8af0-2188c3c1213mr31783963637.37.1748494996621;
        Wed, 28 May 2025 22:03:16 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafc2asm472742b3a.114.2025.05.28.22.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 22:03:15 -0700 (PDT)
Date: Thu, 29 May 2025 10:33:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Linux PM <linux-pm@vger.kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: Re: [GIT PULL] cpufreq/arm updates for 6.16
Message-ID: <20250529050313.igzkpncndr7ssbwc@vireshk-i7>
References: <20250520061944.pl3mqw2clo2roe3s@vireshk-i7>
 <CAJZ5v0gBRQ87bFk3-MCOudgvGWb29O_ihfz0Lo2kGcVpfSu=nQ@mail.gmail.com>
 <CAJZ5v0iNwBhpmkwuo7Z_dGmLE5KQGONNRrt5kykXXKRoORTShA@mail.gmail.com>
 <aDb3JzdsrrLAxPlW@google.com>
 <CAJZ5v0iAU5oGvqvtoHAxOOUH5PkN5Q03bUqXWKR7DCdiLMELZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iAU5oGvqvtoHAxOOUH5PkN5Q03bUqXWKR7DCdiLMELZQ@mail.gmail.com>

On 28-05-25, 14:21, Rafael J. Wysocki wrote:
> OK, it should be fixed now, thanks!

Thanks Rafael.

-- 
viresh
