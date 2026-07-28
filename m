Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5111403B0A
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 08:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228468; cv=none; b=PBDfzxd/Cd1WkO8GT6yT42RuknSnglQZFH0IAxH9RPpJe6MkvN1yotlyiO5Wes1bOusYspVHwB0K5xNvnIO8ezJxeS+gxlxeR8k3aRmUmj8gS11TVBfSlsoJtqgu/4hiWynrhoqrcT5gelovYf8MHsC+hdrX0IMx64di1ZtINco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228468; c=relaxed/simple;
	bh=fGKlNxg9YLsPLBpDCSEKog+Wv6vCRO5W9ykgw0AMKyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPvQ9/gEkxRz2sv6BYjtf6ONH0zzzGpjKZZ9W7hPZrxPy7R4ke71cRrCXQlgko/rvQy6xPfZCVyBNPtbmEm2q4FyioPiQjOdizNEokcLlxheitgGC+1du+N2yTpGBT0vxdQgDQS3nSHVeDP3tzxfQUoGLplVtxV6ovzAJEiGeUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zKTbeQWE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zKTbeQWE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-845c92bc464so2979547b3a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 01:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228466; x=1785833266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tA6/MY5PF2Grnw4dPL2r7KgNhjVu2XUJf38B+92A4LY=;
        b=zKTbeQWEXCQO8FBPjqbHWwBLMwPhuvMQpnMgN6w+CcX44VAOvVGbxbIo2TDDW+sXn1
         s5EPDFcW+GzK1Z1PDH39P0iy4lx+HUUOrKj7rE49czAfMzl6L5jCH5v+ZThv+Zsa8teW
         BtAnv2mwZHEZBuJ58oSnuD8NQc//PK7+aMjKn2IC4zHDpuAOOr29ZjkhPc1FJyC9e0AC
         6toUtt7geTi0EQ9B8utmlsEaLljQ+kGs+zjQ7HNg1L0Nswx6k9mteg2VVCWJQ9zbGlaM
         hkm5TpXBBo8jU3VlvJx4IACetG79PqilfZx47m3+7qToDuz45QwV8GJYu+0UVykWnMC+
         MYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228466; x=1785833266;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tA6/MY5PF2Grnw4dPL2r7KgNhjVu2XUJf38B+92A4LY=;
        b=IcAWwwj0TBaf6DdhiMuGuKq3KEBIipbQEpFvsi9aS9w0TzD05i3cNHtf4vp9Z/JNV6
         lV0itAXO4E588bF5tVijaS4pal4CQDhRgIgYm3BH0Q968X+wsUAj0eN8X70iaI3e8Nk/
         BxewqWoj4afZeQ0cKMdwiWL4uAUjJWnBN3aXZhKs5PC0pb0/S4LX0ADWi8CXgAH45XXi
         P/aSR7Q4XvIPYqrx2+nNgxCupYVE4Etza4JoUocguz/AylggQvdc6C7vz2nqZeceHGBP
         pzAMhRd3PyJ9kcm/IHhQQ0s2JeuzbE60hLxTuAhE3XkWcaZO20N4f9CbcRhosE4bUkUB
         mbhg==
X-Forwarded-Encrypted: i=1; AHgh+RrC/6r0n1LmtTFs9JUdnLgXz4iZPKuaoY5bZWRbSghbckoYD4EPDiZ05ilOyQDHBHMU9Jh7pULo3/o89a5xbg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yziug+zXSHupvcxYoDfQCudRcHFKErWyCOz7qn0LaIoWZFCgUl9
	UojaRZA99gYXewp2m6U5KO5Gw7QtdsQXWWCT5tSJCvWvhZgdy9IH/gYYqLyHKAqviCw=
X-Gm-Gg: AR+sD11hB1jK/QodXQ0oMKOwzHIIrm3vX5cBuat7irWWAB25jo2S+aabtLGgKB/B+UG
	k21WeVaEtLn0I2Lk00qoEgeUFoOmwPtv3mt3CZ9O1xdDg0RSI9l9t4whIj+YhspT2OOqdQVlCPf
	elI9kDHuw7PGAVAwh1+6L/0mM3LYmajIC4gVfjEfz3DgRwM4tNw+y2n8PCjXNq+AG6l804GL0cD
	JHbN7bLlbzh7sEsJG3W307UZadHUmcSlLlwfi2tiUYOB5t8EKuklW9fEVE2aGVOQAyMyohrSkKG
	Ifq2zyy4dBrPGRAsCyFjpFBMI0Bcouo6wCGK06cm4fhlJLPb3wtosOierGOZXY6aSbf0ti/riH0
	Cnmnd4PcPYw6gjaardS2hH9r3oqP7SAHScb+5YxblFNsl29rFcxmj1Qo3M+Ftisu6lz5eGtfvj6
	8+6BLupiJaIpvi
X-Received: by 2002:a05:6a20:d808:b0:3c3:66c5:68d6 with SMTP id adf61e73a8af0-3c8aafbb717mr2008641637.9.1785228466130;
        Tue, 28 Jul 2026 01:47:46 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc579819sm34918375eec.20.2026.07.28.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:47:44 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:17:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu, 
	dzueck@uci.edu, ytan089@ucr.edu
Subject: Re: [PATCH v2] rust: cpufreq: Add CPUFREQ_TABLE_END as last table
 entry in TableBuilder::to_table
Message-ID: <qyjrkxlyqgn5wpfl456mdhwidouupghnaaznsisotri7bkqvl4@4xe5y46nzehh>
References: <4dcb9b9c756e413c13616e46cb27669bc5b32cf5.1784576749.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dcb9b9c756e413c13616e46cb27669bc5b32cf5.1784576749.git.pgovind2@uci.edu>

On 20-07-26, 20:50, Priya Bala Govindasamy wrote:
> The `TableBuilder::to_table` function adds `Hertz(c_ulong::MAX).as_khz()`
> as the last frequency entry in the frequency table.
> But the C API expects the last entry to have frequency set to
> `CPUFREQ_TABLE_END` which is `~1u` as per include/linux/cpufreq.h.
> 
> Fix this by setting the last frequency entry to `CPUFREQ_TABLE_END`
> instead of `Hertz(c_ulong::MAX).as_khz()`.
> 
> Fixes: 2207856ff0bc8d953d6e89bda70b8978c2de8bab ("rust: cpufreq: Add initial abstractions for cpufreq framework")
> Reported-by: Dylan Zueck<dzueck@uci.edu>
> Reported-by: Yuan Tan<ytan089@ucr.edu>
> Assisted-by: ChatGPT:gpt-5.6-terra
> Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
> 
> Changes in v2:
>  - Create `TableBuilder::push` method to add entries to the table
>    without converting the frequency to kHz.
>  - `TableBuilder::add` now internally uses `TableBuilder::push` to add
>    entries to the table after converting the frequency to kHz.
>  - Use the new `TableBuilder::push` method to add to the last table
>    entry.
>  - Link to v1: https://lore.kernel.org/rust-for-linux/cover.1783548374.git.pgovind2@uci.edu/T/#t
> ---
>  rust/kernel/cpufreq.rs | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Applied. Thanks.

-- 
viresh
