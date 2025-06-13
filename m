Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D5620DD40
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 03:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749784505; cv=none; b=W5aRTmpIwEtnLPRo0h/GueFtTtw555sqJBoPhPyuHNAcyOP3ZQvqdg9yHUNkLuxy9xLk1ssbJQyVx89+R/0rr9USfCOl31g85Nil1snN0qGvRkzRGqepqziHCujJLc99Xsh+SKspdLnZw2hvdhlI6rxB2h078VKiIvuqNhQZB8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749784505; c=relaxed/simple;
	bh=+VELiVMiblS9EMdhSadQrydZV1qKRILumoaWZaqOpCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FR3uJKp/Yn5PrSnVUnNaxnG/Tex3rHlf3i4gi3oaQ9OS48YclvCIPRpAzS7ycM07vmpB1d/QfSXADUqO+AqwbNQIVX59Lp/NCZ0OvtDQpb7qCT90illZkOwVL2gJWmOWw16B0u8K5s99NaZCw/H6nPXpOpwSzbCHBcHin6V6nls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVzd5mlO; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVzd5mlO"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1359146b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 20:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749784503; x=1750389303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRGAb5FL87rEahmY3tAqLef0mLJKpmszE0WMQvG4V6Q=;
        b=rVzd5mlOTEQM9utNVwI+11xON24dhrbsL+bLRKi6y3j1HGV+cTmlOpVjXxZPE2G4FL
         odbVzHRgme6jffwZpPBPgixUBuJv+1Nqx6HvLlVAVasfA1Pr6rFm84maW6mUZncQyPKw
         wGBg1yNz+MaD66/Z7QYpL00zA1IkqbTyO5EALNimivx4kx319x5+LTG+Rca3EVSRWdIB
         13b57KNvOksVlJgKV4URagIdGl6ZJgx4iY7N141+OwYqn+62SeIBKm5Fg4F4cUDBxY0w
         3KyP7pneQMapp5vYEtDKVHYJNiB1HCqd3qSEadMSsZsaS/WHu7mIS7CQgN8gfD1D2Fzb
         JMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749784503; x=1750389303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRGAb5FL87rEahmY3tAqLef0mLJKpmszE0WMQvG4V6Q=;
        b=l1UAZUSe6vJOtp0PltWClANeqHv2BL2hI7AqWqX3gmm1c1/yUwhAz+4mPMM982rwIa
         FB3fIrKi2cckkS2VWFKv0zcCxTiwrwxiFZCzaICypB5XdqsGnDPcE8PAOcTMHYpGSQIo
         +OUAtsaNnYyGKUFK4WLChVoO2I7W/yeg0LMuT5YiWavopY9vjr+PuzTuWP2YDCOnu8O6
         f2zwmRimt8T2kdJKta4Q1zMWUzgoQuxt22LKTon9I0vqD1wzIeOP2Wc64hm88DiuEdfv
         j5Um/EhKQXhGR+fuDgZvDSwbqGrlVlOIDOJlVGMN0MGUIDZv+eSC8Bi1Il0QeXzccjQY
         RTgw==
X-Forwarded-Encrypted: i=1; AJvYcCXebyhZY60o0N5yYOGaJm/UFaU30WUz4qZEejy3gRwhWSIVvEaKSBJ89FF5vxE7y59eaNcjgX+eFF3HCwzIAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySKP7aAFCuPp5QNvPlW7Wj/txRy3a+gpzFYHDG4q+l4QkWfG8W
	jkRHT7Sd+zP3Vu5K5YssQtgKIAX9/JOwEGAt/V1SmSiajdKesMdJyc/eLDTsmPqqtjw=
X-Gm-Gg: ASbGncsj0ac9G4faHQSKx1Jy8ggNiEAO2BIThDO61t/jKcTFoDWqNVqCoC6AJe7+7kN
	GI2OyLtcFLPjSA01rZPiWzSZLrbLoQiTuhc5YDOYMgp4x1gMW2duMUw7VODE75L67bESXOzEJtP
	rFegvWJQL01bycLSb2HvEl4/MlaxxowHzjlG3/2VgqR6+ogBD+6pBEHHlckZRgPxaewFzCUWNRj
	dfOivHIQIGCBaVtu1J4/0vqZqA2Fof/Rb9P/R8QtJZZEm2xtwGgLiWZ9feC2zGGVNL/HhkAoBkW
	HZ++NJqIuXnpcyalr3jc6+oWMi1TK//DujSe0SGJVswS936Ry46QsDD1Hq0uMfM=
X-Google-Smtp-Source: AGHT+IEnho9SIZwX8QrGlyPV8bXYV4SYO9jr621hoxecz+TswlMYKxI8v4iYpnb5LWfEM/IZI9aNhQ==
X-Received: by 2002:a05:6a21:9ccb:b0:21f:51ea:5c57 with SMTP id adf61e73a8af0-21facbd7410mr1977131637.16.1749784503419;
        Thu, 12 Jun 2025 20:15:03 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe168b971sm568935a12.58.2025.06.12.20.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:15:02 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:44:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 2/4] rust: devres: replace Devres::new_foreign_owned()
Message-ID: <20250613031459.dmg3bgif62oyaagv@vireshk-i7>
References: <20250612145145.12143-1-dakr@kernel.org>
 <20250612145145.12143-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612145145.12143-3-dakr@kernel.org>

On 12-06-25, 16:51, Danilo Krummrich wrote:
> Replace Devres::new_foreign_owned() with
> devres::register_foreign_boxed().
> 
> The current implementation of Devres::new_foreign_owned() creates a full
> Devres container instance, including the internal Revocable and
> completion.
> 
> However, none of that is necessary for the intended use of giving full
> ownership of an object to devres and getting it dropped once the given
> device is unbound.
> 
> Hence, implement devres::register_foreign_boxed(), which is limited to
> consume the given data, wrap it in a KBox and drop the KBox once the
> given device is unbound, without any other synchronization.
> 
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/cpufreq.rs    |  8 ++---

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
