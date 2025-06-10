Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8707E151985
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 00:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749517046; cv=none; b=AYZ7pXT4RfyTVaMDrzSYJq098QMt+gDujzx+i92jd4rcy5+Xng6GiPHTwglJroSijac8ZabaA9M85MDZcAXwBx9UCEtL+BK7IzGZb6e1L+nLVybBbRFLS0dqDu/afJEQPxXBvqDbuymKJ3oGsgjTD7/rbaCIYdxWy29KgK5FTPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749517046; c=relaxed/simple;
	bh=p/XSuCXGPS17CXVAw4xGn4f5MNxiAyBtMTSqDEOx0Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QV+E2gw82HWRqbo6fgItpkHWXMJHXYyCxMflTsNhMHvD5IEvCgRfKNFEHZ65JLX83Y7CqH5PziasU2AFZATMgljcw+vQEa0Kh/5pXvTJdY+ta4EJi39/+h+/MQiwX0GEW7+WIF3YndCeKuS0BTZQDXICaRQhJCVmlltzayAuXRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VF3IiZpN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VF3IiZpN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235d6de331fso57700075ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Jun 2025 17:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749517044; x=1750121844; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1rQwYkfS8VPR2HtcdFz5xQMJ3QnFjshutUNq6gvzdg=;
        b=VF3IiZpNvMTJUqVh9zt8gej3e418SoXcYMYjnpSL8WMH0T5gzjlJ1E15IclwSg/Gu8
         usza/+6sciwnszxi1CrMpMJFdGhkoORyZCgu7FqmP4vs+YWJazErjeAZ/tIs9LcvQVKu
         Rh9zYVRAjNHRf+1g5t7Dzw3EGdG5q2Re5ASeUJzLhDx1duJ/z6TtWZUiIaP9Q7zAGt1I
         r1hfyGUb4VNxCVDCZ/DmCJVPaQ6pyAG5GXf470FMPLT8qcMssbq0/1fmmU8QibZFdafs
         oNFKrkw8+Xe88bcysKGalbErpkWv95o4KglkZY9DhN6ZjQBDM4f/0YjPGEojJIMdsIa0
         5UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749517044; x=1750121844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1rQwYkfS8VPR2HtcdFz5xQMJ3QnFjshutUNq6gvzdg=;
        b=QgYQKnOPtK+uC4tM1Gyj+/TyPa+HthzPcZ5pxWXjQH+TNSav5RB7+AoNzhF7Bv5xnc
         z1s6ALE3an2LF/C8fQFXMqYhhfFBf0hpYGvcfLYxy8FZxweOA71KqBqmeoi0xwkf9sl7
         nUlyjngFQlcO3d8INPY16ZXqDqCT27HJkGd+/lormv7nU9338w7W/FTmOf+g61mUqkbU
         cms2MQ6Va7ps5+P7cLPLa1XrPY8uF3YsoMhWksigCeWFulWTeOMayZ/2zAF3ScHykxVJ
         G9ObnJS8C9krC1IbYTkY65pNXfnBPJk1yx3DLjBJe8chSpRibTYp6JA2q7W92P6LMRRt
         SL7g==
X-Forwarded-Encrypted: i=1; AJvYcCVPUfjYF0j0g3sGmpzlwGv99Xkns+lCCwDPvY3FT1CmFpx/Hc1gNpvCLeTz0HR6QqmXJrKQBPpkOumAoro8kA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIzhbrxpC7sQG7wMSohrlVvEAhUyrEYVzFdtgFo+W93k+WV+et
	IRr4rffCHtIMQ9Q63aNUHvu78ZpiB8K/IIVg05vHUoXzLqZ4lzWpAOXjzeQ3N2cymAw=
X-Gm-Gg: ASbGncvatxUPW9j+ubgUiVYv4KbkZkxwczu8hqMQlAq/pGvnUbNtllK8cVqDjsHP9BL
	3O3MAyBMRBM7wt/qRGNfWscJAeNa8rry6Tr/KCKH/tN93xb1/l75qe6Fu2RmLsToSXjQMsgGRwd
	NmRUR+J5LIuQExYEdvUhIwcZ2J0j+TItjTBLsKr7zwNTAU+3QhMTlFd57SKShE0AEnUAvyUKmGj
	L/0dNl6vxOZChGgsRmETRtvuzCw6KrzSZWKPOe9BJLM9wy8L3Fwi0L6TFePkW0TqEYYz2KH3pVb
	DbiXDBviwpfyeXjg4LWLwem0fAC/7ev6rxIHvUHkJcTcqWflzZmICrNU2yJ9X68=
X-Google-Smtp-Source: AGHT+IEdl8eeFf7aJp3yaKtzoKAh6ceNn/qekzHSRC0NuzHU4sIrFSD+owbOXJVQKsMXXNVfTFyxWg==
X-Received: by 2002:a17:903:2c9:b0:234:d778:13fa with SMTP id d9443c01a7336-23601d13585mr206171875ad.26.1749517043866;
        Mon, 09 Jun 2025 17:57:23 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236037ae33dsm60076015ad.206.2025.06.09.17.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 17:57:23 -0700 (PDT)
Date: Tue, 10 Jun 2025 06:27:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: rafael@kernel.org, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, mcgrof@kernel.org, russ.weight@linux.dev,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	leitao@debian.org, gregkh@linuxfoundation.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org,
	fujita.tomonori@gmail.com, tamird@gmail.com,
	igor.korotin.linux@gmail.com, walmeida@microsoft.com,
	anisse@astier.eu, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: module: remove deprecated author key
Message-ID: <20250610005717.kd32qk7jvrioyds3@vireshk-i7>
References: <20250609122200.179307-1-trintaeoitogc@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609122200.179307-1-trintaeoitogc@gmail.com>

On 09-06-25, 09:22, Guilherme Giacomo Simoes wrote:
> Commit 38559da6afb2 ("rust: module: introduce `authors` key") introduced
> a new `authors` key to support multiple module authors, while keeping
> the old `author` key for backward compatibility.
> 
> Now that all in-tree modules have migrated to `authors`, remove:
> 1. The deprecated `author` key support from the module macro
> 2. Legacy `author` entries from remaining modules
> 
> Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs        | 2 +-
 
> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index 94ed81644fe1..bdf4b844de42 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -220,7 +220,7 @@ fn probe(
>  module_platform_driver! {
>      type: CPUFreqDTDriver,
>      name: "cpufreq-dt",
> -    author: "Viresh Kumar <viresh.kumar@linaro.org>",
> +    authors: ["Viresh Kumar <viresh.kumar@linaro.org>"],
>      description: "Generic CPUFreq DT driver",
>      license: "GPL v2",
>  }

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
