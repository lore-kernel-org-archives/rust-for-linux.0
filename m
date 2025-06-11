Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5018176FB0
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Jun 2025 02:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608890; cv=none; b=oOgC93CXk1V/3u+TU/iYKUgJ1m5yp6UIkqYRbSPGn0OE3+P4ALPACdxvxijpb+WG0Mq1lj60sLGNvbPNVf1Qk/sLBZYhq01WXy3cZyGlrdEQTINI4cky9sDgZNAy4wZDs02+LNXHV+h1Rbw+I//4zTOSVKLI5C7Pts2veZAptls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608890; c=relaxed/simple;
	bh=AnULbAtcLIUrq9avMFu81YCrGIdaNXhNJ9b2KpzWZvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hGNRrMRqsntG2hD9MuQEGaTVPSQq46Bk9an+U2jVmy9JW6Cx0wuBrP8y8lJgVdcOM8Q6wasdTgzkrr4oP/5quFqJbI9Yzb2i5h09Pyc38cbHtv7agXWgvn4XQnnXJ5bG9EUR5YapZwXVb1gAjnvJzhwOIYrsE3yiz0pr57iP1Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SZt1GoJr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SZt1GoJr"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2360ff7ac1bso28931475ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 19:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749608887; x=1750213687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XgglyoLohjdEepoRUFmQl+JC9QjRDgCZ11XCQ6gDAFI=;
        b=SZt1GoJry1bQv8AJkCe0Pg7TwoQahwPOOjUFY4sO5pBd3uOuRavKvHZ0HbqLN3yiCP
         OCy2XiBgZnrhmSiu44EOv22JkXEx1dxmRpZXX8pFv5+mGh/IEddGjv71mpD1zBVSBo3W
         jdQN8wM63W/Wxka2S+CNOdHCh210NnTdX6KgHnhqUYEF1ONRi4Bus6EZJU2VlMUlPYK4
         LQ6sHLSQgeYyDVzEvIICuH2uG74WQ1QedYd6rWsSCWMr+32/BgCEkC+ixTIoUov+tapE
         rRRg/Pj1n8vEFvbSYiXMgj6pxH4iPCbwxQEy4jZMpRL7MjbMHrhb0y8qHU4B5+7RqlBB
         Xonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749608887; x=1750213687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgglyoLohjdEepoRUFmQl+JC9QjRDgCZ11XCQ6gDAFI=;
        b=G+eOMtPw9rleaE0olVEKS7WoIMIziKX8ag8bvWTKw+WMwYdinJa+rW4eOJZxUcxzyv
         r6kqVuxidYlOcjZmzqca8zEzeRz3XALyF3SXdxtoAULjlK2k6aQKJ8d8yL0c3KJbfjQz
         P461O73R+j1JjotIXpyWLTMuwvJPRJVEQZ1o4ToqnV1UvfvXmjFsOUIE688b1O34EBh6
         SfT1hFIuGcOxzAuxHCSeDlK4WB+rPM2C2sWnTlOXO7kvNhCb3C5gab3yAdqqhVpxUeGY
         +hB6wR0yw07nlnd7CfehXZcm0lCuYzpFk8qi0aAAcvicDp3fdD3E7I5qlLQzqVDtrTi5
         nmWg==
X-Forwarded-Encrypted: i=1; AJvYcCWOqTiKGmA3JhM+GjzcelvQSKiN70Ttv+puqO+YJYLnUZdUdiO+/FplnbauA6uxCu7sAYyvt5x6yHaq9Efpxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzPS19lLuevV98plg2eMpDWCxfXvk5FkfP5O6gRIyvXdSa9qnU
	W1/fjl0Lgkmm3hfbyGvG9GZrfBZ5mQv5YAzLi+hGApv1KXCg4fyDnv4Qn9cLU9peXjQ=
X-Gm-Gg: ASbGncsh51drl72y8sqEKmv5qnHB4v4p4IHTmdi3N6DRE5N0IxpcId6cYxI7XXGfB5M
	CqUoB3lezjryQrOnKBGJrn6EFmewITlPgVSPJ9OxtfsDdOLUXeYqbAhsxIBR6EEnXmz3RwYLsTe
	CKG4b3AyTJITiaDoDkQvDzBggPQ8JDEa27TZc2apQsHxnLMJUVQxsecZVnh1aUN474U4UXzUbbU
	IaColKFfB/+HTvJMs3aXsjJzpa3iDMNjWixKNQubVpJcvjWERBP5ao91bT5pxkYxx5hmgifXnq+
	U0iWspFABxIEJHBdWBqbSX6LngnvWjIzFbRsnQLaxfjGImPWxfuk3xwMPuQxjlE=
X-Google-Smtp-Source: AGHT+IEQS7K1hjEyHUsdIhFSDd8II2iLFlLrogG3kQuaeeLvImbJEameFDLvv1JLzyOrih7+opX37g==
X-Received: by 2002:a17:903:28e:b0:234:f825:b2c3 with SMTP id d9443c01a7336-23641abe9c8mr19453495ad.17.1749608887195;
        Tue, 10 Jun 2025 19:28:07 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fc6ebsm77109545ad.98.2025.06.10.19.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:28:06 -0700 (PDT)
Date: Wed, 11 Jun 2025 07:58:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] rust: cpu: Add CpuId::current() to retrieve
 current CPU ID
Message-ID: <20250611022804.vr4sponkwsa3qwo3@vireshk-i7>
References: <cover.1749554685.git.viresh.kumar@linaro.org>
 <a2e12436661fca452de5c417242328ed6f413511.1749554685.git.viresh.kumar@linaro.org>
 <aEiiQSTe-U1q0fOL@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEiiQSTe-U1q0fOL@tardis.local>

On 10-06-25, 14:23, Boqun Feng wrote:
> I would also add "or the users could use a stale (yet valid) CPU ID",
> because there are such usages in kernel arleady, e.g.
> kvm_pmu_probe_armpmu() in arch/arm64/kvm/pmu-emul.c.

Done.

> With that, feel free to add:
> 
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Thanks Boqun. I have queued this series for linux-next to get some
testing while the reviews are going on. It would be nice if I can get
some reviews on the other patches, especially the one that adds the
`CpuId` abstraction.

-- 
viresh
