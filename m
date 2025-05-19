Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D73D1C700D
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 05:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747631543; cv=none; b=PrqnSAiYV4iRJawif2tKYpuXlnydw6OlLuvs85Q1MPghLxTgPQ5tob8/CPBrTyiSJlL+g22/zQBlo9QIscArvpoiNWj3Bd5rl6iT5ytP6WJue3lh+1LpaB5UwzLKj4Oz5Cke0gK/aCpu6o2IPe5iPlDuQyWPG/a+SfyYe1/ynu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747631543; c=relaxed/simple;
	bh=YREARJL98nMn8x0h6I7v+KTCGPwNBPRJT3dvhaSnBAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luEXJhPeCvoTgyucVIhA/N/6xblBtGoRwBhVTeweOo+pmEqnrpC50lchQmDmqOnTHWVcZ/fyDu+7rARvDl1I2BUSTNqxU4KNwjPGESYPWyi/VRtWmu+BOjfEbEWv5e6St1vQmXCIZcxdUA1krZx/cRPHXD9YhocGaPES1W+rZow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K1fJYvUo; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1fJYvUo"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b26ef4791a5so2539666a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 May 2025 22:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747631541; x=1748236341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gYGQbDlVIPyEa7xs1WPDKLP/YgeKrN15Sc6vhyvvkpU=;
        b=K1fJYvUosTAhlTY2ECMk9s9FMsopa4uxNMH9CI5vlUfpJaJOjZ4UP41a5Nolksv+Mu
         wZMcTBDwB0dMOZFxTIvNz0JjlXqFVe4haoYI1FM8EFMcRqRjytCW7VF7jMAgdnCGw+Zd
         J1NW8JjkzkGnvsIjljgwvVQTsKmu11SNzgWbA9A5BDAa3R+VvcPUbtV1yEV8fsmH8FEq
         zSIAy7Pbj4wFJ1xPDgtUzjQQ36G7ETv/N+LsSdiJq728PXu0SYiZa5h7bvtgz/e3bNi9
         YK7d2TBYuqqMvWU/4+UKkyvxyk6Mly7Yssk5Un1B7KzPIiP0K7GKWrnew2rCLr0DTqG5
         qaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747631541; x=1748236341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYGQbDlVIPyEa7xs1WPDKLP/YgeKrN15Sc6vhyvvkpU=;
        b=d7T9jInlZjSojfXob15pqLlyk0SM6X8JQNNrm8dYE4sLKhus0fHJ1Z1xGOwNTZMpEJ
         a6jdQtHx+52MOZR6QyOzXT8ouEFJuf1xffGovWJQCqyW9KRmek9DXnKObz5EZeBLaVHf
         jS3ivzRco1njlgvO6lozsLVQ1HuAdq+yzmQzJxn5adXRrHtnsRFfdcD6K2ebjUj1kv2G
         tJJ9Ymqy5nr/4enCGXJj8esNqkUYhS1cUTzNcQXYsnrrAAMKq40pbvFyJeZ26WJ6/Rns
         A/MQqLJkrSfPeK8HLZ8c20qdhqCuHPQbYyqOnKOy6AyyNcHwElgOpFFqr4om4edub54W
         eOOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUutq5oTgJ1NiXpPdIR9ngcHwzAHV4fDbji3Wx6FHnIRCaKGKnepIv5zmrIk54sJBcerfPO87QeCZLmFrquJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvq2M5Rvd6I7Cz6Y6wfFDn/LBVzveSNQL0F/x0PMhuFSLKAW11
	OvUg6/5b1DA3z99ZkBMfPV0Sv+fRH8bYr4GZBMSXArM6PtZXBTPxTv/OJJKZlDTX7gk=
X-Gm-Gg: ASbGncvzM+q8b32Kid/EwK6t9eGdMCIMP2Vou+jDxawne2J3uw3ca1yiU6xkaNognG6
	+ZAElTlEqKq6OCCXL0cnuMN5T1jlRfR2YaOgh5sNzdY2XPurJilvkeQKx4rAvBgM7cYivc2rkej
	A7qAsKTw7YFb4l0GJJIadOs7SYB77rVcBWejPUCv2UEfXYOc0OYPftRPqQ2ju0AXcNvL73hcNgb
	nGXMLS+rZhboEs8IKZRziJbDmBGPD4ZCBJhQTj5cPw1INvY7X8m0PfCKYPVAJ9pZDXTPrg1367R
	BOuhYbRFkwzkUbk0vkor18Ob+frIYTxKjMyUfKkRunExW++zwb/S
X-Google-Smtp-Source: AGHT+IEreJKmg3dlWZ4j347XsS/9PUGaSzSwWgE94zxhHw42bn9a5SbwwrfFutiaT9FgmTDVKLHP/A==
X-Received: by 2002:a05:6a20:6f8a:b0:218:c01:ddce with SMTP id adf61e73a8af0-2180c01de06mr16043557637.40.1747631541346;
        Sun, 18 May 2025 22:12:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8a199sm4560811a12.33.2025.05.18.22.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 22:12:19 -0700 (PDT)
Date: Mon, 19 May 2025 10:42:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Philip Li <philip.li@intel.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	kbuild test robot <lkp@intel.com>,
	Andrew Ballance <andrewjballance@gmail.com>, a.hindborg@kernel.org,
	alex.bennee@linaro.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	anisse@astier.eu, benno.lossin@proton.me, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, bqe@google.com, dakr@kernel.org,
	dakr@redhat.com, daniel.almeida@collabora.com, gary@garyguo.net,
	joakim.bech@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux@armlinux.org.uk, linux@rasmusvillemoes.dk,
	manos.pitsidianakis@linaro.org, mturquette@baylibre.com, nm@ti.com,
	ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org,
	robh@kernel.org, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
	tglx@linutronix.de, tmgross@umich.edu, vincent.guittot@linaro.org,
	vireshk@kernel.org, yury.norov@gmail.com
Subject: Re: [PATCH V11 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250519051217.clxqculya7zxl7rp@vireshk-i7>
References: <20250502070109.inpes2ou3rxx2fxp@vireshk-i7>
 <20250506101311.142475-1-andrewjballance@gmail.com>
 <CANiq72k3ozKkLMinTLQwvkyg9K=BeRxs1oYZSKhJHY-veEyZdg@mail.gmail.com>
 <CAKohponbEEP4_weUuKkOGLRj5-1oOsoL_Zu_7W_SxB61hjsSCw@mail.gmail.com>
 <aBwcWzc4zmPzAW5s@rli9-mobl>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBwcWzc4zmPzAW5s@rli9-mobl>

On 08-05-25, 10:52, Philip Li wrote:
> Sorry Viresh, there's coverage gap at the bot side. One is rust kconfig
> is not set as mandatory early on. Also the bot met build test slowness
> these days and is under recovering gradually. Thus I think the issue
> is not detected in time.
> 
> We will resolve both issues asap to provide better test coverage.

Thanks Philip, I can see the reports (with failures) now.

-- 
viresh
