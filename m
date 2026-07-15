Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833CD3D9532
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105907; cv=none; b=c8dzwqcgjZ9J+rNiaWCsAYvZGouSKaiyhj/3ysczxhB01XW8TcgPAG+3LcoK4DhCZEPqbeVvSzzKf5vgk+MIqx2mkjNiUlljRrjrxJb22V7QwH7tB4ZeGE8+Mc8tIOtlaInjx0El9I+mkJECcQJeFo8RWlViXJNYwW2fiPT8puk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105907; c=relaxed/simple;
	bh=OFFG33vQhgFzNtMM8+ZEc1yIjErwJeaRKkvGlmr/540=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clCBUenyOUiWhLv5krueiIWdQXTd/Tjp8CpuTiz2GwSJik+oH8yNg+xCX9LhXRxynzMA80bfTw4qEIpkhk/kUhQpi4ls3yLArR2U7L8+54wvPrDl/J9OG4aYfPLYPCwNK6F+MEcXd1vRS7E4SNlpIxM/PX88Ac6fI00XuevfW90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cxt42wCB; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cxt42wCB"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso4075688a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 01:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784105904; x=1784710704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oWc1JQgdI1fGiAcrnlK/VAskM7Ax6+leAaYqZIOdLWM=;
        b=Cxt42wCB7/JDMDWKRcX5lQlzJdnXYOZJgmslMs/Sm8pMh/YZnj/el/WRsivvajYLxF
         c1KJOuumtuLEjWV+3xc2SL12ESWI7GlzuOzj0xPPJhqjltTeYjnQJy0ZpAVNfLolF6xq
         QdO78g7meGIizLB4UNxNmJW+sxVozaQuJ7VN7Q6cIjr7WwjGmN3qMJKydzo1iPVKCgBs
         9rb/FsUK5VaXhj0UKOAHKtPLqkRb7Q+M8X2+84rz0jklGttpipOiLh248FQnndrWSr2C
         AzmzWs0u25Vn3MQ9IMzJqR+euJx+ghORX5I8EEaK2e5vSSLVSe4UUakst+HUD8y4IIzz
         t3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105904; x=1784710704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oWc1JQgdI1fGiAcrnlK/VAskM7Ax6+leAaYqZIOdLWM=;
        b=Gy3VxU7I5Zjhu3SbihQ8ttni5WmJ+nrHJtQ7DrouvkFXm2OWAlgzxCv9c/nVxtH4Xb
         iwEKP0taao0v6IB7qhxQlkyS0OEspQzMFreGP93Ojo7Y+T6Sy0WZNL8o07g2M7STFFce
         UyUXdKidzDgfWXQ4hfeZAFdEU9ChTfafQlB7VeQdV/xU8uFBKL/PisoCcs4YzhkZFSZX
         do0gHz3pqUCr9639RsH7U7prmKcwbpVeYrerqNdBpoKhNH/a1Agh0yzneuEO62fHOsP1
         BOiI4+gMl9fYSysCjtyV14q41pxZvrmeXnTj7/BdgXwWpsMKtQmcraQ8Au/c94a9kRFL
         cBbA==
X-Forwarded-Encrypted: i=1; AHgh+RpBMa0reEn0HK5YlAlGejdfVpBr6pXAz3NzFQ4YGjxB7P3d5kYnDeeRIIEEn/6XRvcplHZuOS6gZxNDwwph8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt7Lp9+8WYtiK96pE2Mzv2lzOgqeQbyjVMpeFZ+BTm5M+xAY1U
	WJAAqjxJ3hmbkOhcLaXufJB2ked+5542uWxsV/snIzSXgYJbTim5MJYbzIxCn7ekLz0=
X-Gm-Gg: AfdE7clEhHOJnHSZJWQ8MLxcldbGESnp2ntNTs4j/9UQrmOa1ZfR1fxRWBrdH6vNN4S
	L1CBci8uSSqqAjzVVEpJwJKPV93Ex+HyHMUM8az52tbAqYvp3MtUkM4PIuNAh5CDWPYpYRACfFU
	0WZvnrAcSdlgWURUr8PygdWEsmeYEJ9MMd1D12m6LREFiCHc+uyMsuHJv8i+xKfJ5T/QyDQHq8Q
	NvD6Tfw3pPV14F2XY274jtdCHC22AT9WDfHAEcSThfKpliAl7jMeJmUFInaGUi1PNsvQi3F60mo
	ztj1zqOKD0rIp9MYKJHQmn6xM3L1RAYZQI+9C0h6cwFv6FP7Pf9Fdw/ZTRO1uO3H4gmq60cxu96
	/SVi0apJ4yFO6J8kyL2o8gEfBe0J/JaJnOKvsdpYXyNJbqKb6gS1vKbkzpC1HLe4wxFtPujirOX
	zkn5reXy1pcZGw
X-Received: by 2002:a05:6a21:4849:b0:3c3:791e:5e12 with SMTP id adf61e73a8af0-3c3791e6ccemr234718637.72.1784105903773;
        Wed, 15 Jul 2026 01:58:23 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm164351913c88.14.2026.07.15.01.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:58:22 -0700 (PDT)
Date: Wed, 15 Jul 2026 14:28:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Priya Bala Govindasamy <pgovind2@uci.edu>, rafael@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-pm@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu, dzueck@uci.edu, 
	ytan089@ucr.edu
Subject: Re: [PATCH 1/1] rust: cpufreq: Fix temporary write in
 Registration::bios_limit_callback
Message-ID: <vbi4qqhyyzl3bnewb2dhk2qscebu3s2nkunv4dmzy54wqf2z2x@3pewe2nm2hck>
References: <cover.1783456063.git.pgovind2@uci.edu>
 <f56e1010822963b2f8133c63de47645834281007.1783456063.git.pgovind2@uci.edu>
 <ouf2qqkiqgvn5yy6umr36ii5ltgacx3qthyhbol7ly3qn6lypv@pmkv27ngsbcf>
 <CAH5fLgjHWsVc-o_kv9=CBPVWqHJP_V2kRN97C9b+6aHt8agb2g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgjHWsVc-o_kv9=CBPVWqHJP_V2kRN97C9b+6aHt8agb2g@mail.gmail.com>

On 15-07-26, 10:06, Alice Ryhl wrote:
> Why not just use a return value like this?
> 
> /// Driver's `bios_limit` callback.
> ///
> /// Returns the limit.
> fn bios_limit(_policy: &mut Policy) -> Result<u32> {

Makes sense.

Priya, can you make the change as per this please ?

bios_limit_callback() can be adapted as:

unsafe extern "C" fn bios_limit_callback(cpu: c_int, limit: *mut c_uint) -> c_int {
        // SAFETY: The C API guarantees that `cpu` refers to a valid CPU number.
        let cpu_id = unsafe { CpuId::from_i32_unchecked(cpu) };

        from_result(|| {
            let mut policy = PolicyCpu::from_cpu(cpu_id)?;
            let val = T::bios_limit(&mut policy)?;

            // SAFETY: `limit` is guaranteed by the C code to be valid.
            unsafe { core::ptr::write(limit, val); }
            Ok(0)
        })
}

-- 
viresh
