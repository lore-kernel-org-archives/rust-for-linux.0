Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F263E0C67
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 08:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228442; cv=none; b=GW7SoDWddvK4bTrVIIBGjCVb/iXFJsBrYiypGnoVevxWRQsS7sBpcjAncsp3gR4TN3qU4Kh3+4KPHi3Rujs3QGBIXobgPKUNQ48dq48x16b/63l9oK/i+DvdcuAvfIcKlHGnccw1v2e4iDVxhqF97sETdtxd+XKzcJ1zO6IgcUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228442; c=relaxed/simple;
	bh=ctjKkFPlSuVU2qeHE9Gy5zi4ZQOiPmU6J70mT4/ZarI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbdtI+Siv2ZPWwGif3oQQUREnxz8KzmH75wgj7JYYlkgk/4CvBwSA3dMTlczelcjTj0elcUpfZOhEq4I5mgYoMkAzoW2zZKzmakx7wHLcmRPB9Z5keGjBoTbZxjX33P2xzUcmYt0vlM7uskC1Gc2x4LzjuyLkTccNj4kmYfKqIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J8lZAsBq; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J8lZAsBq"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbb85186d43so1751282a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 28 Jul 2026 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228441; x=1785833241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zqi8cIj/t2mh1e51achfPCocTPBcrX0WCBo7rDCEZ0w=;
        b=J8lZAsBqCsaZmKToHleuuSI6QaAXIVVYTT/CIjUIRuCpsyjCjEcnCWNcCq17U3S9HR
         x7+r+QQBhhpSFUTatpqwXxvqfUiexBYWbXxEH+Q5WaQpZXQf+Fm6WCWa/uxxWQNUUR1q
         HBPF6S0BcerQCEEtT29FJO/WL+FQD+EUKLCFfbjKcL3wA0R5yXNmwyexyb8E3UZgCMhz
         QPw64Q8+vyAS5FNwwTVbH35HOflX0w05bYbEiJqtPvgsDG4n7NyGAmZG/WhZRvAvTkx/
         3eNajQ4F/VWohakFu5BCzomnbMkJ3iz+RznM5yXmXGAkb3AUp16Sor1SLZg7XUMd+xlP
         nv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228441; x=1785833241;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zqi8cIj/t2mh1e51achfPCocTPBcrX0WCBo7rDCEZ0w=;
        b=Fq0PS1XVvIxpcpXO10nqHeEmzbtQJXxyG55h8PBmF218tRG1KOPl6FouxNhBVCnU0l
         olw2bsY9CuoBOz5jyU1HWEoIF2HTD3MGmi8TINEhcyaJqm4sPJoN8QDG+mKkvc8lXvR5
         jMT5tWWAQURPZjMdWu2PY9pWMWMiiXJ9GbO8j8IRwlq7BrKTDZ+2Li3RDTHu642k9R3H
         Rk18d8UbjWGLHY8ViNfqiao/EDa3coSrqUyQKQeTZtlNnXwQ4enWBMvvHcHigMWzZfLK
         6XzBc84ObUy8E9VneSoUTybIBgUEmjU1unEKSt3wEOut/rehb3spRGRBIS701YVVvz8M
         uQWA==
X-Forwarded-Encrypted: i=1; AHgh+Rpe5s/pSgHyOfvdnXCYnVuJ+98WQ+jkvZj+apX5W10RFmfL3dzjM7i40xP8mhKTgZ34MY4EmjZCPHwyQWUOKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0U++Brrjld4VIbWzCjMriL2D3CNS1rUlOzqWXpmKNAJEfSt9P
	3YHG/avwqmJ+Jwjrl6/QvPShPKERNuX9SyM2Fp13ObbIPeMgL+xjAmtrX6bPaYdhfsE=
X-Gm-Gg: AR+sD12l5opNPBGXwiMe6Xw5g3gByTz3tNSmqWHW7VtqugqxoF+7dNMhcOei7uhvjxu
	gqcWObvBcIP4+egdISnK26wMXRgiSA450W8PqCcmoTvAeMemLw0Gw+UMxIM9dVTPBa+GuPSSm/r
	ML7BLdLTBhgaf8aTJWkoFJpGtHRfiGLLQ7UPPtaJaXkJvRXyNtgQIJYjfFd7ji5VPFt3YjlP5yA
	GIUKdKVPj+8WpuzvPXy2+bTexGGCzlXW3XqqzVdyaRXmlm9L71kayop+c/vVjLvIpYiJ7OuByk/
	+y7OMOGaXCIIh6Gf5BgG7KGF9AY9vodHCGjRczUNTU1ekIpS4rAo1P+uVm7SpVHN3/1omU64OXU
	85g0n92Ak3qGcdzhPdgOtZA/Zh/MyxU/eqLrUSTC5sVFOY77iSIWMHf4jn7WmCzgzEcuX8PgPwi
	jQ2GWbNAWU+EBF
X-Received: by 2002:a05:6a21:3204:b0:3c6:5673:2bd1 with SMTP id adf61e73a8af0-3c8ba5da101mr1810776637.42.1785228440488;
        Tue, 28 Jul 2026 01:47:20 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1290sm41201957eec.1.2026.07.28.01.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:47:18 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:17:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: rafael@kernel.org, ojeda@kernel.org, aliceryhl@google.com, 
	gary@garyguo.net, boqun@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-pm@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu, dzueck@uci.edu, 
	ytan089@ucr.edu
Subject: Re: [PATCH v3] rust: cpufreq: Fix temporary write in
 Registration::bios_limit_callback
Message-ID: <dwdbn7ea6evjhxtpobcg3cxgi3shb65ddsvk6xrqbujbq22hqz@5hxvifua2zyo>
References: <c38ed08b34af92e134f5aefc993d349bd1dd11ef.1784569723.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c38ed08b34af92e134f5aefc993d349bd1dd11ef.1784569723.git.pgovind2@uci.edu>

On 20-07-26, 18:00, Priya Bala Govindasamy wrote:
> In `Registration::bios_limit_callback`, the expression
> `&mut (unsafe { *limit })` creates a reference to a temporary copy
> of the value pointed to by `limit` on the stack.
> Therefore, writes made by `T::bios_limit` go to this temporary
> instead of the memory location pointed to by `limit`.
> 
> Additionally, `limit` may be uninitialized, such as when
> `Registration::bios_limit_callback` is invoked by `show_bios_limit`
> in drivers/cpufreq/cpufreq.c. Therefore creating a reference to 
> `limit` is unsound.
> 
> Fix this by changing the signature of `T::bios_limit` to return the limit
> value.
> `Registration::bios_limit_callback` can then update `limit` directly.
> 
> Fixes: c6af9a1191d042839e56abff69e8b0302d117988 ("rust: cpufreq: Extend abstractions for driver registration")
> Reported-by: Dylan Zueck<dzueck@uci.edu>
> Reported-by: Yuan Tan<ytan089@ucr.edu>
> Assisted-by: ChatGPT:gpt-5.4
> Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
> 
> changes in v3:
>  - Update documentation for `bios_limit`
>  - Use direct raw pointer assignment instead of non-dropping write for
>    `limit`
>  - v2 Link: https://lore.kernel.org/rust-for-linux/2fd4425697efb6d52459cd886115edd281bd5f44.1784155370.git.pgovind2@uci.edu/
>  - v1 Link: https://lore.kernel.org/rust-for-linux/cover.1783456063.git.pgovind2@uci.edu/T/#t
> ---

The above part which shouldn't be part of the commit (Changes in v3),
should be added here after the `---` line. Else git am picks this up
as well in commit log.

>  rust/kernel/cpufreq.rs | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh
