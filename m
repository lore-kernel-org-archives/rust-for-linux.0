Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61E3379EE2
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 06:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784095904; cv=none; b=Ng3ayO32P5edBpDmrnQTBdmT3GH4TqLlvBGhZAPFRm/MR7murl0MjYYE/OvW/5kJhM48vKqPVMGvOTOrEgxrgt7pZ+/uPtwuKd7rsobS/6bXEv2Uw0GES46Na22/unTR6z5X8nr0iANKPzEkicB2aem6tX1Ric+H9bRDYSUtu94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784095904; c=relaxed/simple;
	bh=5jEtSCjFGINh8jZTvok+8s30ii9/i+UPEHsVez/292o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFG0h6hWnmkaZLa+5AeB3+StU5CgYQUw4V+pT9tI2FY+mquPKFdFpuPB9nTdTscYk5x063rOAXme8m5bJFkiZfO16Bo8pfpMFVmJy1GoUWjvsN0Cy/pwO8qvTl2r89KcR4Huf/LBk31XQHJ60RGpzcGorwDPDqD66pyVE+0OXP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VwFdpM03; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VwFdpM03"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38759bcd877so4417358a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 23:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784095903; x=1784700703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xAmPTM8zhZyttGnxHW8eJEUF0vL7fUh/w5+5tabBlR8=;
        b=VwFdpM03UslmD9LR2mE+W8nrGYwHl2HT0IFOhPX5O7Ug+dXqlmznteUgqk4JXhIBM3
         skuqB/CkprcGTWVyjA6ci51bwv+jyrqHOgj+qntSSRZiBwBIBf8dPMe+RkQxsznBLgda
         6eg+Wwb6W3hb1eu8HoF7ROfxNuawu4taI34hV0t9TcKr6djxS1nocofaDGZQZ0bZW4Tk
         6UWofOGlwHDAJQXrGz+2iW5YFziMwAWQF8V7vmNJOecqt/FQ2AtiukOTq0SMiYvjBsrn
         yIma+OVNLTWWMvMuFgoPNR3JMF5b8eGX54TJVSd60w8lhBXqTGtyppZN3ES/Fs2I0kwp
         wP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784095903; x=1784700703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xAmPTM8zhZyttGnxHW8eJEUF0vL7fUh/w5+5tabBlR8=;
        b=ax5htbc0K6LdMqeSZaobOwKPMAjyJtYKL+DBxgfx7SDf/70O8ESkL6rNmyY2Aaaebi
         qTTgvT5xr2/cAqb7v6FjllYPegofj696U46T2cJGJIu4ErZuxytQAgy2ozcpAbjCYoDM
         20QH1nLMREkD5/iOLl3EniYd0srOSMrLKf417SxzO1d2O0ubPL2b3qaqkIdRRtaMSAIM
         A/9xy4lSrdzdIwBwhXFDmXaQswFmMXfuCLYgdQJp0uEbIzLRj4aNusv5lKW3qSbBFRBE
         la305F1bNRFMTyh9zP9dXOJjYAk2SgZLl8Jy37DN1vWrjggpmL+nfZ6C+sHv/Zp4yzYC
         SPXg==
X-Forwarded-Encrypted: i=1; AHgh+RomMcUQmVn8kUsyvImk+5C00Y46brYyPth7KHXaMJhkIj8pDHn8fMH0VsYF5Ltp7wfWM91PVRuGoQpH0Yqp1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaIhuSikpkXkyPLEfRtlmmDVEaq6rvESxXNzBxUSr4ONGUihR3
	hL3wgrLDMZRlW/1TjfU9jgkMwH33yyubGJwoMs/k7DCo+KnemgV/y86Af4+gdFZnyf4=
X-Gm-Gg: AfdE7clqZ8cX4irjp3qd3LVyCEOpu9nZRyfx6YFdIL3jIMaKidx2gqTNdwuYFgxyMkJ
	5qLDg9qBxahVzbDjjQ6SrDKMLKmnh+csr2J455sGdPe+SZt7BYZNsaZrpsk/pi2rn5iyZqNTjv2
	QSKpKWPpWyCD1tROThJBGVFUdsf4N0264tbbcjrylYWRAuibvV5GwY6kw4StJqrgikIK39yoBb0
	30c1/ZAAYwWPjy6TIFu1n5L+aWBjsgO3TT1c6jG5NhHaBZcWxyJcxHzopw0VeV70sT4xiVeNfea
	k/fx/5l8iTEjXkZkEA/DUtk+F34XUgHrgEROBvygRSXWDrHWHhrlKziAX38asB0CS7dKKqbW2aZ
	pir6IlPf4i7rNmHORZCZOP2wjkcQRrLpv5DlclFVZ7jbolAG7Mxr14CNINvgeGuOhbneJV5oum6
	e1cCFU2gEB6FRA
X-Received: by 2002:a17:90b:2650:b0:37f:ef32:d444 with SMTP id 98e67ed59e1d1-38e29ff9805mr1337073a91.1.1784095902763;
        Tue, 14 Jul 2026 23:11:42 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm93198720eec.0.2026.07.14.23.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:11:41 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:41:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Priya Bala Govindasamy <pgovind2@uci.edu>
Cc: rafael@kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, ardalan@uci.edu, zhiyunq@cs.ucr.edu, 
	dzueck@uci.edu, ytan089@ucr.edu
Subject: Re: [PATCH 1/1] rust: cpufreq: Fix temporary write in
 Registration::bios_limit_callback
Message-ID: <ouf2qqkiqgvn5yy6umr36ii5ltgacx3qthyhbol7ly3qn6lypv@pmkv27ngsbcf>
References: <cover.1783456063.git.pgovind2@uci.edu>
 <f56e1010822963b2f8133c63de47645834281007.1783456063.git.pgovind2@uci.edu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f56e1010822963b2f8133c63de47645834281007.1783456063.git.pgovind2@uci.edu>

On 14-07-26, 20:30, Priya Bala Govindasamy wrote:
> Writes made by `T::bios_limit` go to a temporary on the stack instead of the 
> limit pointer passed by C. 
> Fix by creating a mutable reference to the actual memory location of
> the limit pointer.
> 
> Additionally there is a creation of a reference from the 
> uninitialized limit pointer which is unsound. 
> Fix by initializing the limit pointer to 0 before 
> calling `T::bios_limit`.
> 
> ---
> Fixes: c6af9a1191d042839e56abff69e8b0302d117988 ("rust: cpufreq: Extend abstractions for driver registration")
> Reported-by: Dylan Zueck<dzueck@uci.edu>
> Reported-by: Yuan Tan<ytan089@ucr.edu>
> Signed-off-by: Priya Bala Govindasamy<pgovind2@uci.edu>
> Assisted-by: ChatGPT:gpt-5.4
> 
>  rust/kernel/cpufreq.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index 58ac04c650a1..0f9385d41b64 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1349,12 +1349,12 @@ impl<T: Driver> Registration<T> {
>      unsafe extern "C" fn bios_limit_callback(cpu: c_int, limit: *mut c_uint) -> c_int {
>          // SAFETY: The C API guarantees that `cpu` refers to a valid CPU number.
>          let cpu_id = unsafe { CpuId::from_i32_unchecked(cpu) };
> -
> +        unsafe { core::ptr::write(limit, 0); }

Maybe add a comment over this on why this is done ?

Miguel, can we get around this somehow ? The driver is supposed to fill the
`limit` field and not use the uninitialized value.

>          from_result(|| {
>              let mut policy = PolicyCpu::from_cpu(cpu_id)?;
>  
>              // SAFETY: `limit` is guaranteed by the C code to be valid.
> -            T::bios_limit(&mut policy, &mut (unsafe { *limit })).map(|()| 0)
> +            T::bios_limit(&mut policy, unsafe { &mut *limit }).map(|()| 0)
>          })
>      }

-- 
viresh
