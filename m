Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245902BE652
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Oct 2025 10:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759315102; cv=none; b=j0jYHA6jK4NDb0XRRjMZg0p1+BDRSPQGYV5eMm2i/h9ZQ80BBeHN7V0/41PmyeA6rsSSLfIHdCHXrpcuEfnMSTzAS/1qGL8sito7bci8iG+BYhjL8vULqoZa1UN5cLAvDa/Q97COrbHqHhH9avG/5gwBxIr1kO2Wn85UYZ/Q6eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759315102; c=relaxed/simple;
	bh=6WpRzUY1xB9VvC/VEjbYbB5z3j3GxfQ6hBgggjbZ6EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uydSVFSXYoRfedONEnE4KHUzQvmEKTqWWgyn75xYeq7PdLN9nJp5Jy0zdRr6zpDKirIwaPslpmseYdmhXmKVGwa9oslg1GhMSeKJQIGBnv76UpExW5qwrI1z50KhF7YJzpWUBGHV2uPLn2WpdJRVrxUMRdE9nq7B2NJSgs7L2WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=y+Qrg6t2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="y+Qrg6t2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so6258520f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Oct 2025 03:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1759315097; x=1759919897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mF0RoLdx3iYd2wCJGbdBLKsyAovYaRReQN2weBYtMg=;
        b=y+Qrg6t2+x2XATp4qoY42IpRtEEqTMo+ykgdzwd5GUoPd95dWiV0NKZVydDwFCv5TT
         5EOiYYiElupqnYTbg6ahOFnzxnRnpRmyVQhpkIWiJkoI0XJhvBOZha9MoPxLBmEUAQih
         7OiC5JbiOch7qdXoOnM7o5KH/2vwFlbgnkUxlw0JCOkxpNjvfjSfrfsijG33waVj9rp3
         EgaXwCD6ivCBUpb3vb7ZrEuU4G4Ru5ovUfhZB/46618+I+TUP6BeITd5QuIeod+CqLG+
         f9HUHKzdome3ICyoaRlY59BztYhqNTuYCTW/d/swcoDc+wS3iLXDv3smiC/9tMSLOFLe
         p4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759315097; x=1759919897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mF0RoLdx3iYd2wCJGbdBLKsyAovYaRReQN2weBYtMg=;
        b=Lr505gQUset9blYkT1lKa5MF8qbjzhPN6y97c0Gn2utOUJXaI9lydbrNc7hx6i8+5J
         oieaVjzF5jHssXo4Ahq/aMywZ1g7SY4XzUoFMwN1B58uIDJjhkb5Qm24x27RqQghXrYh
         O9CN1UY2tty11vfqaKVuvs2Kec8BgEG10uAffVsnnQ7iAYpXbxOs+9+COU+utObTk9iV
         IhAguJJNdrD7Y5ak5rUltBhvjuUnX0pj1xhmYQdkkWgeiWSXaPErlOzlsylQVW2RfJV6
         W9LpPLN2J+RHT3Vom28djR1fb3S632dGoV4shgjo5HD5ixE4DEbX6B7uup9geyvze9jZ
         dtfA==
X-Forwarded-Encrypted: i=1; AJvYcCXQV+7lu0th4Uu3hSlQ5N9UtqvWhcf/CrBl0UzEZy8340A2Z+kn2F9CN32V2M49/vrbkKbua93PsAlYpz8p7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQfEzmUNGjGH5u/PxJkT9STKHPxAQSM5XLCY8RprpJe5hNJX0j
	fnPSfnZaneURjxtlLdzbwIDIuF1Q38cjGxI9DbnOQntuRv1kmQQaf9Y2c2ZnC0/C6rs=
X-Gm-Gg: ASbGncs7iziVLZOZZGM5ZjVAnA44PPaJF1XU6vV1+3onYJm0TnX8nWnyIUs7XHQZfRD
	EqCBtF9Nm7htktWzCunPVlkT+8vXS7V2CVBmhfM4G7c43+WXHSDMzvCk0Ytv2P9t7GQlo+ooA66
	dWbjk0/3s/PM1lPZ55pCsmSeih2XDMapqX9Qg4LebyKqa8ONdfNnLuzuoL5PARPLFFErRb6PZKv
	HEqpBfkdIMMsUOtANkRfMVFlB27As3Y2VnZEinXgqYeo65wafhJlW5msHxbQicB4w/O/B1bKQvo
	JorApQ/0vu93XgilHxd9e85AqIwv2mUUOtoWhsvjCyBhmzMRvGDwueIUPtllpNsMqd25NizD11v
	c6lblj2EXXAdVMxIawAU9q8nwl/gMS6O1J8+7Ev9+/Lmhpnch2SSHAtthJJXexGgEDOcLbmReOQ
	sPCpp03aVihKNeyvJwaWVpXAVYCTs=
X-Google-Smtp-Source: AGHT+IEaer9MYyjKdjU2yY0Pc7X/yiVBoIWcheLdIRRZJC17ULlWTNZ7OJDYC5pxYdi3TVVVua5g6A==
X-Received: by 2002:a05:6000:2086:b0:410:3a4f:1298 with SMTP id ffacd0b85a97d-425577f3522mr2447321f8f.15.1759315097237;
        Wed, 01 Oct 2025 03:38:17 -0700 (PDT)
Received: from airbuntu (host86-146-64-97.range86-146.btcentralplus.com. [86.146.64.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc7e2c6b3sm28297378f8f.54.2025.10.01.03.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 03:38:16 -0700 (PDT)
Date: Wed, 1 Oct 2025 11:38:15 +0100
From: Qais Yousef <qyousef@layalina.io>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	Jie Zhan <zhanjie9@hisilicon.com>, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Subject: Re: [PATCH v3 1/4] cpufreq: Make drivers using CPUFREQ_ETERNAL
 specify transition latency
Message-ID: <20251001103815.a57cc3wyasyhmrmt@airbuntu>
References: <5069803.31r3eYUQgx@rafael.j.wysocki>
 <2264949.irdbgypaU6@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2264949.irdbgypaU6@rafael.j.wysocki>

On 09/26/25 12:12, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Commit a755d0e2d41b ("cpufreq: Honour transition_latency over
> transition_delay_us") caused platforms where cpuinfo.transition_latency
> is CPUFREQ_ETERNAL to get a very large transition latency whereas
> previously it had been capped at 10 ms (and later at 2 ms).
> 
> This led to a user-observable regression between 6.6 and 6.12 as
> described by Shawn:
> 
> "The dbs sampling_rate was 10000 us on 6.6 and suddently becomes
>  6442450 us (4294967295 / 1000 * 1.5) on 6.12 for these platforms
>  because the default transition delay was dropped [...].
> 
>  It slows down dbs governor's reacting to CPU loading change
>  dramatically.  Also, as transition_delay_us is used by schedutil
>  governor as rate_limit_us, it shows a negative impact on device
>  idle power consumption, because the device gets slightly less time
>  in the lowest OPP."
> 
> Evidently, the expectation of the drivers using CPUFREQ_ETERNAL as
> cpuinfo.transition_latency was that it would be capped by the core,
> but they may as well return a default transition latency value instead
> of CPUFREQ_ETERNAL and the core need not do anything with it.
> 
> Accordingly, introduce CPUFREQ_DEFAULT_TRANSITION_LATENCY_NS and make
> all of the drivers in question use it instead of CPUFREQ_ETERNAL.  Also
> update the related Rust binding.
> 
> Fixes: a755d0e2d41b ("cpufreq: Honour transition_latency over transition_delay_us")
> Closes: https://lore.kernel.org/linux-pm/20250922125929.453444-1-shawnguo2@yeah.net/
> Reported-by: Shawn Guo <shawnguo@kernel.org>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Reviewed-by: Jie Zhan <zhanjie9@hisilicon.com>
> Cc: 6.6+ <stable@vger.kernel.org> # 6.6+
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

The whole series LGTM. I think this is clearer now without the CPUFREQ_ETERNAL.

Reviewed-by: Qais Yousef <qyousef@layalina.io>


Cheers

--
Qais Yousef
