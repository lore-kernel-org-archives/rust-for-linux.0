Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E171DFE22
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Aug 2025 05:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756444814; cv=none; b=clLA22qUyLzQuKKJ0S6kSGvIBhp8o3YYhkAKZSWn3fAHivImKwRBLshE/eBCbNysqmN+PcJNNTS4DnaBZ+N39niX+57QejBzKPaEO2KhHA0ASDZK/RzsDVGkCwjJnrVE/8AufBFa0wtMpOutumcFa5swc75o1uFQtwM+yqAh5AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756444814; c=relaxed/simple;
	bh=1Zqk+4vnIkwWqVkrcUdNeo1ti71o+27E8x4Bps+lroU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ab107dlTGXqnYhJqpPu7qO1zhCxGD4D1MncONIaQDS7nmZ+uqzLRIQPIT3OS7nd0r6hVNYau+IWIkdGyiBAVjClZIMwrI4z4svdLCQZOeYrWcTgbkgOw5u0/c3hMailtskmlbmLyXUlx9ZdZjJmnhZmHk1gtuIOLmA8TMQ72WC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KRushieB; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KRushieB"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so1590975b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Aug 2025 22:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756444812; x=1757049612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JvfbFYwUN2Wv0aTFajklPrgWujcFzYTBTym5k6QlzSg=;
        b=KRushieBvuQ2YCbTp1mphqQqsbg79KPUVp7r6NeFCAGtZ7JngH+R+Yno+n36tX+Tyu
         4NIjqboAJOpgmzlV2iD8ge9KDzcNQqK8E4G1weM5vOtAtbPfm4Ckwl4n6o6DsM84X5uc
         4qOK6JRE7dGcA8R7JxKEqFXtcAWh2MHl4w9R2f2NYkbTMsMYhAN5FChx3P3RTjfkuU3G
         V3DhIuIKqP+EkwphVK3cHQE1CoNnu3RtoJvOBQ2QaM4XUDd96/9KCaBYQn8Nhvvbvi6R
         qM3dMrkw5Y9yN/IPgYM+am49SywlxHHCSKcvDHXV7jL8MSxkrJqh+aWTwcs+dGlaa4VO
         84tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756444812; x=1757049612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvfbFYwUN2Wv0aTFajklPrgWujcFzYTBTym5k6QlzSg=;
        b=UI75x5AAfvJZDrGaLd2m8gqVnI4re/IyZOEcoc7W2UYaYek+knVYNswogrd8LqSta2
         uzTz3Qk8DwoW2OzixQGW3pi6iWibSi9pAturHGi8c8GLmmrm8Ohk7BD70m/nLtPXeHza
         1zB600ijb0ewHZuu5nSKl1AuRmaYsg86YDazkVgKc5W3L9B/BjIxN2e73HRs+qIKofmw
         h68en+Q3q2MinBoWAFUwKSYXd415fLt9ee9f03MJaUlFVZY5FQK5kx4wnKexal/d/nh+
         ND0ZE0sw90wtvCjr2HU7kB8zJJsfBzYq09Myq5x3btmYvMEmXDMayb4WYt2nBY9euPJC
         3pbw==
X-Forwarded-Encrypted: i=1; AJvYcCU956nrvfQzoyhUP8QZLlpB+dyxiExKAEtrg7EBuQBIsJQsmuwSF96i7l7+MFEUUJpxquDQerYWHpGaWZlo6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5PD8SlKU9/uxyelUYNMivlkG6zd8F0RCx59ngpVTMjs/w7EMp
	mNWkz1u7e0S6uAxFQiFVbTx51zBP+9KPvK0GMiEdVA3NcxGg5PN6I0f3wAIn+YpFMLk=
X-Gm-Gg: ASbGncvMH4WhrF6zCKxAgVGC69AGBlUY/LKio9k+AV6rz0mX72pN8nk0n0b003tMXy5
	QElKYk8bOJHGNLXfONw1nTp1NBZaXWETgICObGw0m01t+rfAMhuAel1bScM/CLyv82kJfp97qPi
	XTrFuqxK/CGzsDTahyiunibvSwOpUIh4wbnBRMcaENW5J77ieLSRKWETqf7DytVkB6QXWN7B1cZ
	wibtJ+wwwJ/Tut1f8rM0T7WrubHzTwXgcPgjbwyVykv+oXYCwm6+lLRogO7wKUa/urRL/BwSyiO
	mLRwq4to3tA+FY/MoUVrRiqJ1D8o9SdKrW+qj8p3QORThAutLN7VYipz5MSk1ktiN1EDKxXmkvD
	8/iRFPdn1ue0kdIjjJF2sa/9YBqftFUfhpZ0=
X-Google-Smtp-Source: AGHT+IF9rXnIKgqvJMpaMTUtFPVV7KQF3OFqGDqAWPTMUUDPlHpYvFwpf3iklNWoMxNux/mqBvASRw==
X-Received: by 2002:a05:6a20:7286:b0:243:ae10:2433 with SMTP id adf61e73a8af0-243ae1026c0mr8924481637.40.1756444812495;
        Thu, 28 Aug 2025 22:20:12 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd308f90dsm1046614a12.40.2025.08.28.22.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:20:11 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:50:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mitchell Levy <levymitchell0@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Tyler Hicks <code@tyhicks.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 4/7] rust: cpumask: Add getters for globally defined
 cpumasks
Message-ID: <20250829052009.glitgqzv22zf7c4a@vireshk-i7>
References: <20250828-rust-percpu-v3-0-4dd92e1e7904@gmail.com>
 <20250828-rust-percpu-v3-4-4dd92e1e7904@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-rust-percpu-v3-4-4dd92e1e7904@gmail.com>

On 28-08-25, 12:00, Mitchell Levy wrote:
> Add getters for the global cpumasks documented in
> `include/linux/cpumask.h`, specifically:
> - cpu_possible_mask
> - cpu_online_mask
> - cpu_enabled_mask
> - cpu_present_mask
> - cpu_active_mask
> 
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> ---
>  rust/kernel/cpumask.rs | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
