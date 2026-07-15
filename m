Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E9C3AD52A
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 05:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784093072; cv=none; b=Xk8V4xhgnRtI4vDeL1PqN8Bd+6tg92bFPu6zYBojpT5LGef5EvusAXPqJk+xBYPxD+ZRjsQd0Ty7RjPKd57SFOzY9sRuT9rkN+rPqZ4Guc8MolvvAGsyR1pR7p7c1P86NDV29mG/42kvinNg3+NJwB3CPToyy1mwAY8Yfk5O2d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784093072; c=relaxed/simple;
	bh=CDBhUD07VqoOrZ7JPoq0Co54wzQWjl/AWvxNjZvCjn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CYx1Be74MMjGMYw87i6YA67dFhIqsEua1ez31EiaVN1Cx8aObfIEs+DZueqPGZ6QuuZ5chTjM6lZ3zR2ImoiP1s48jRhPiSyvhDJuFOTNHHzu1IY8VSrkMY/NPIlMUbjH4dBEafbeGdJ4qRq4Nmo3TPBfRQ3PJNYPT+W+pucges=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IDdRAS/F; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDdRAS/F"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso3178159a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 22:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784093071; x=1784697871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qkAQWsDtozfXBoNsWKH68JrBdyZXkRqVk9vmTGGiMwc=;
        b=IDdRAS/FyIOpHGdC7Bh7AFXk1Db0dVrcpGHwh1mm+WRfjBXnMotngKUWUjAnO0/d5L
         3QId5jwnCUP0uW1ExLwSkwX9ClUhvuhZf/cMbN+IDRs96N3VWK/HDZhe+BcW2KzRa/V/
         +81evVE9n01rbmUrRXqcfd8leEcG1VYNKVmmQVvJHN7sgVq7rBsJNA89X5RUDRSwsyFB
         TqTcDCXzhq2oXr4UinOUDMQFerqxeeYlzayTYhA2VaN7hr22yNpA+HV5jvr+wbRuL4qj
         OvW/AQJq69ETfknpKxLoxPQpvu00vMaplYwXXfEumF8aelrPlXtkEokfFzxpgKoLzTA3
         OmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784093071; x=1784697871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qkAQWsDtozfXBoNsWKH68JrBdyZXkRqVk9vmTGGiMwc=;
        b=lPxa/Pu+lP7ruVO0mhOInDd0R/8ltEEmuQiE43G+WBFZcmKaga4WfYKavC5DpeihoI
         nnwUFXHst9hOlqXUK3ZvOhZz6oXjfFXa5NlWZ3y6fN2ENH3Vd6+zCRJgH5oPYjQvLzWm
         pojzAkZkZhyy+byJEN2JQgdixMUJwHAt1w270W+zwkrUe3KdDg+vrHleVZNgC+mgm6gI
         byRgwUZvTE7rc2GEmJvSA9bcDbM2oGjwsU45QWwsEgWRvpig0X3wtaHx2EWtSmdgRQPO
         a8bIvfj755eXcM7djhADhQUnsWyOACugTohz/i8zV6NuVS29W+/21s5KagOCGv17wHNc
         AAVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7+UcOZ3pLiMcWefUB3HP9WB1aDORq961TzV05foB54uqH6pryUzCkLuRjAGmDbnyDY81BSh+GhxJsK4WWBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ju3t7jJXKLVFzYYKr5bE1ko8BoAEhRdnFx4CcXwYSsR2jEPK
	RkIfQ6wrMcIe1CZ7BNQA/uICu+nzuLT1a5E0LZa9k4EQWcx02+IJnnJNZT5gNOizrLQ=
X-Gm-Gg: AfdE7cnO7Vb115RN4nT9FGEq4NY7Ca+azjX9hLSUD5Ig4LmirZV3zYIJKTPiqSSn6qp
	DK2KDkbYoJ/3NBRvQOTM9QRdrW4j6/MoAhf5OKjCSxMRVU9opIu0tZ6mifFt7y6hlnR7kFDPYm0
	GbTQnJQ0m60lhlkcq3xaJPP5yoylp2aOy62h1pMbPkUfHB68cPWw69EGu2KcvJoDFClduDugV1P
	PjDH5/rElA13cRaLPJrfWcI/PDSFHjdCT/LkL2s60cKMrncJwqocXIh4IN7E/glqCuglXx360Ru
	jTEd/ugVFcsQHBNSaa6HDU01Tk5n3uo4msNvMdTDsYNM7DfCElEPGRvPVe9PlCIg0lgyYjzkIvW
	L+9obB1xeJHNDHa/eKj2GjOdoiJZJ5MzU66lLAIgyaYfTvzoFrS0CH+VcdY4UVGFVKemBJKCZUu
	oC9N3B8nvolSMn
X-Received: by 2002:a05:6a20:9183:b0:3bf:d62f:44e1 with SMTP id adf61e73a8af0-3c36c35d250mr1712601637.53.1784093070581;
        Tue, 14 Jul 2026 22:24:30 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b987fc629sm48176784c88.0.2026.07.14.22.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:24:29 -0700 (PDT)
Date: Wed, 15 Jul 2026 10:54:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu, 
	dzueck@uci.edu, ytan089@ucr.edu
Subject: Re: [PATCH 1/1] rust: cpufreq: Add CPUFREQ_TABLE_END as last table
 entry in TableBuilder::to_table
Message-ID: <64v2tabszrjrgdi4ietcj5ndmlstbdudrhen3bvzypsermnikn@xjns562yfh6y>
References: <cover.1783548374.git.pgovind2@uci.edu>
 <833f1ca55f3709387804abe18e5759383ba7898b.1783548374.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <833f1ca55f3709387804abe18e5759383ba7898b.1783548374.git.pgovind2@uci.edu>

On 14-07-26, 20:29, Priya Bala Govindasamy wrote:
> The `TableBuilder::to_table` function adds `Hertz(c_ulong::MAX).as_khz()` 
> as the last frequency entry in the frequency table. 
> But the C API expects the last entry to have frequency set to 
> `CPUFREQ_TABLE_END` which is `~1u` as per include/linux/cpufreq.h.
> 
> Fix this by setting the last frequency entry to `CPUFREQ_TABLE_END` 
> instead of `Hertz(c_ulong::MAX).as_khz()`.
> 
> ---

Did you hand edit the patch ? The above line (---) shouldn't be here. Please fix
the commit properly and don't edit the patch once created.

> Fixes: 2207856ff0bc8d953d6e89bda70b8978c2de8bab ("rust: cpufreq: Add initial abstractions for cpufreq framework")
> Reported-by: Dylan Zueck<dzueck@uci.edu>
> Reported-by: Yuan Tan<ytan089@ucr.edu>
> Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
> Assisted-by: ChatGPT:gpt-5.4
> 
>  rust/kernel/cpufreq.rs | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index 58ac04c650a1..97ab97724931 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -377,8 +377,14 @@ pub fn add(&mut self, freq: Hertz, flags: u32, driver_data: u32) -> Result {
>      /// Consumes the [`TableBuilder`] and returns [`TableBox`].
>      pub fn to_table(mut self) -> Result<TableBox> {
>          // Add last entry to the table.
> -        self.add(Hertz(c_ulong::MAX), 0, 0)?;
> -
> +        self.entries.push(
> +            bindings::cpufreq_frequency_table {
> +                flags: 0,
> +                driver_data: 0,
> +                frequency: bindings::CPUFREQ_TABLE_END as u32,
> +            },
> +            GFP_KERNEL,
> +        )?;
>          TableBox::new(self.entries)
>      }
>  }

Maybe do something like this as well:

    fn push(&mut self, frequency: u32, flags: u32, driver_data: u32) -> Result {
        Ok(self.entries.push(
            bindings::cpufreq_frequency_table {
                frequency,
                flags,
                driver_data,
            },
            GFP_KERNEL,
        )?)
    }

    /// Adds a new entry to the table.
    pub fn add(&mut self, freq: Hertz, flags: u32, driver_data: u32) -> Result {
        self.push(freq.as_khz() as u32, flags, driver_data)
    }

-- 
viresh
