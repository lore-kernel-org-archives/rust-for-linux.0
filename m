Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8672E975E
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Oct 2026 03:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791172582; cv=none; b=lUi2cHMCOykwdcikw/kRR+74UjKVOGOOMgCOoIRFiYVj26VaAoTdSrVNtl6AbozFdf13KA+OI1gRbI7ZpgtwxM3mof0rEk2Nwt6aD723/8Ji/wuUXfWiZh03IAXMDTPq6LO4af7glJAJWOGwjadwfvmis1zk2OvKLzPgk8/MIFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791172582; c=relaxed/simple;
	bh=d9tN9DTYTvuWVcATgsyxcXj68fmoeMiRSaYaMZpJFYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGnqSwVhnGdfiPZ751BacSKdt/D7jvtOTdrIXFwA5NJ0df3JE7HpCZhxRyxz8voUxcqL5cZw1t1Uhvf/zVhGvwaB6qiFlLi0JlFqZLJPf+VP19QKDzqk/kE9b6HNLrGdJeXxhY69mpDh6rMU7dXpHhQhuTqT5tCuLlNFPXoFnK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZbeF0tJN; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZbeF0tJN"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c4a0870d2so768056eec.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Oct 2026 20:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791172579; x=1791777379; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Z6Qlp965hPUbBTzoATV44EgR0/hyg3NkRU9lRFO1Ok=;
        b=ZbeF0tJNqENSNUz7zCh1QeelddA7a5yrzQHKGvXsFn2h8jYjzn6hlYTL35fs4Dn08E
         /nwdaQpcmsbmeGBSKKu9snYlDbzwq1PYWX/WbAeyr79lymz/NA+reKZUO3IhhIzZ0CH5
         FsPjO/uVWUlyANiZ52GZgFIeM0+fHI5aKJd+N1+WRaN09bKzvgw/OZNCrkLhxgVxrarb
         tN/4/NPZTyLPTJxOEy1TL2rkNrT1MAUV6zlYXFLMoweL2qm3PmNhxMMGwUGvDzDRVAKT
         +WOXLqmT4g/evZlcLVoDshOavZs8ZFA/VofuI01bf2/Izy47ang+ZuKr8dUNbODii7NW
         aGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791172579; x=1791777379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3Z6Qlp965hPUbBTzoATV44EgR0/hyg3NkRU9lRFO1Ok=;
        b=MN87lNZ3IMO0TF0L02IwJ7se9HnAzTEIgwvZAi00dRceAAFpApA0LsCW+sWKJXfVSo
         Rwn5EScLGOBS9wVEh0qvyG70SWF0K5eetsy0xodMaPbUiPqVoWUGAx27lfr5JxpRIsv9
         ymdJFmZ9/kn467rw9lwOD06xiGKY4OKCZY1Scpnn83oNJezpPBS3O3IZSNR8KBgqsXrH
         dfH7rEiImH4atS7nWM7EGGxKEgaGwySmSfQiLqkvNnngf74ppkbERfHVkRdezwfAnMQt
         x57aytHyKblHukPeKYRrj7jUrHhJ7aRliJEiMwb9fnigE11bXKdIbRQytOXKSHUQw9zr
         u/aA==
X-Forwarded-Encrypted: i=1; AKwUvBxPzmmBkJK8V/48vtjzY1+haraun3L0uvYIZd09cbgxkuYSrbAI6/oq0gYxbzGbn98Mo4xkKXGQHysyOdhrcA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI5nXXmEKjMidewTiMyegcY9OdS6KXEvr5U4jgElh1pxwtaRTsj
	ZQ4cy/hQoJdfuhWZ8IciXFoH7NExqRYHssJFyGF9QQ7QteS0rKTl+vD4+U30bBKuqq4=
X-Gm-Gg: AYBFou0QCYFXG/gvsWiEF/jGrb332+ibX+fzaWoU8ckaSvgMHmC/sI6UEC4xIaSX6dt
	UqbhuX0FMHqYvVal4wlJ6GrwF5lIkRMBpXuPnH/ZZUGhcvthFnTKrOxIdaEj65v8ygMMhEo/LFy
	p08uGKoesgJDCZZ4atP42dovFkR0Kh6m/RuRuxXmSJ/bL1Cg6cNvN5Pl3Hh4/Fz6Hkk9vhYVDyh
	6AQcfWv5ly3kMOydA6ExdnwFJ9lqaqCGjyUf4GAJTwi4+Qd03G2aMh8GyKg4Wu4pOvdRn/wm2Kf
	Y+WOkoDx091egWyYJg3UApY/WCnloTAtmNevU4RuFv/a3RLJqoW8T5mHOW/FiWb17wjE1fkBjl0
	20z44TduAZdbK0SkdEKrxqKBsTrupfwg+0c3uLAnyxwURg3GIWISfOZdYRUqfnwp6momLswrD3R
	TuURdcD64M/nhESH72AP/tRaSp+FCTytwqgj8GaBbSNXHannCEC+bKliwF0DiDtIWPWbiSoI+Z
X-Received: by 2002:a05:7300:80c4:b0:328:3542:b73e with SMTP id 5a478bee46e88-34f150c28eamr16667594eec.15.1791172579370;
        Sun, 04 Oct 2026 20:56:19 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272bb9basm9311939eec.24.2026.10.04.20.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:56:18 -0700 (PDT)
Date: Mon, 5 Oct 2026 09:26:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	xuyiwen14@gmail.com, miguel.ojeda.sandonis@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] rust: cpufreq: reject NULL from cpufreq_cpu_get()
Message-ID: <asMf3xK5XiWdEiDA@vireshk-B250M-D3H>
References: <20260829161013.102967-1-mehmet.mkoseoglu@gmail.com>
 <20261001102213.45437-1-mehmet.mkoseoglu@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001102213.45437-1-mehmet.mkoseoglu@gmail.com>

On 01-10-26, 13:19, Mehmet Koseoglu wrote:
> cpufreq_cpu_get() returns either a referenced policy or NULL.
> PolicyCpu::from_cpu() passed its return value to from_err_ptr(), which
> rejects ERR_PTR values but accepts NULL.
> 
> If the lookup fails, Policy::from_raw_mut() therefore constructs a mutable
> reference from NULL. Dropping the resulting PolicyCpu then passes the
> invalid pointer to cpufreq_cpu_put(), causing an oops in kobject_put().
> 
> Reject NULL with NonNull before constructing the Policy reference. Return
> ENODEV instead.
> 
> A KUnit negative-control run reproduced the oops with the original
> conversion. The same test passed with this change. The reproducer is
> available on request.
> 
> Fixes: 6ebdd7c93177 ("rust: cpufreq: Extend abstractions for policy and driver ops")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
> Reviewed-by: Onur Özkan <work@onurozkan.dev>
> Reviewed-by: spidermana <xuyiwen14@gmail.com>

Applied. Thanks.

-- 
viresh
