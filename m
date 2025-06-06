Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C6F139D1B
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Jun 2025 04:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183627; cv=none; b=VHu0TB/JpKXk2iwY75mEnInJJDMxfU1IUouZmhrGaDc2N0st8e8355E9OQTsam2dK82cLavVSrm6zu8Fx1qe8GmIgsoaQ54Bhejf6qBM1kV4X8r0gZuoYu1+hXhDGNGUbwDA6s0ML5ddt8ik4Ftp32rTIL6QQtXZvXG5kEy+rbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183627; c=relaxed/simple;
	bh=cBPVUZEqDCouVeRGB+TRMPGlVd7k9y+CujAOPGFklYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlDWnWmvnhiAPaBYkdqZzOn1VnSgHYwcH8u0Yvgkn4fOSVEZuTLnzRG4TZ4el2YwyUXgDRyWqITwDYZjprkLBvzztSCS/KAMMYmq/L/inN1CphTx8R6BwgPlIaki7w/XDwltBo2rtudLlyeGePmtyIqKpd5QdL/T3Vx2RlFJEPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L8Wi0j0i; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L8Wi0j0i"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso1593106a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Jun 2025 21:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749183624; x=1749788424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7TQ+3XX3FlrGS8OYKUYQhs5M06UIOQDCmX22nbGDmQ=;
        b=L8Wi0j0iij46YCZxAnh4eP82ssKergFuTF+qf3R/L+ApEtSE+Anb9VmYR7Lgb+1gLQ
         kvPoSY2eNoqqJ3WAeIkWb2aBB7rf04jys8tEdZ7s88UIxOofePP/mxbGATKgYcY1k6Lz
         Uid7lf98X5gC9eRTolqzhqrAEDclwwt0NuSws8e5m1Jbi+i4g1+VjeNLSRqZpVGCjWF2
         AFaGKbwGD/EFXowED4ExDejr7J1nnobHmKVo21UHsWDvXqFQj4ZhF0/UyS+7tzuRDxbf
         1zr2/UG+PU/LvLFycAT+1uRu4yBmqm6k/N3xzaTrI6AXQY6vsSJ2HNsX5Lap3PY2Q/ui
         Z3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749183624; x=1749788424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7TQ+3XX3FlrGS8OYKUYQhs5M06UIOQDCmX22nbGDmQ=;
        b=H4jvSlMjyGHZ32v8+I75jjZ+p/kGam0F7C/pl0CP8L1hIS7RGHW3b6+JCa85dlzTDZ
         b54uxtQ1/fuFy72DlW7bjnlwK0Zy+wAhgfr5IbZXAADzjv6cFiE/xjYmzq6cOYD6hlC3
         OwdIiASPYZ8CwbjkTTmIikeipLfSLjkQn0odqRgzpbn6T6AdjzPE12hbB21p3ybzDVjE
         FwF2PUlcBg1K4Gv3/PQJDGiAVr43hVS1CcpsZJym2gYP/24KPzwLmZFkKYA8NaaiGI2o
         QCYeKnk4357/1ir+H+8XMYEfrrpes1lF7M5L/4R0EF4f3N04UjFhFLHNJ5DBts9BLiLQ
         IqVw==
X-Forwarded-Encrypted: i=1; AJvYcCXFvIZL1YRe5hweXCrEGK15H9I+X2sJutoalMvptXWM+RXEWxsDeDWQgZMwICg27pG8eX2sfIGM61qYIvQRNQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy/6o09SqwDjVxjhKh474cTOJMpiSQ306EJdJDhjaXSKtgyZwr
	xouveJOEwNslGg8bIfVD/VUgwE8Ce2YIZacpO7/s/dKJ+fFOYu0BEiixq1TJAnqz8wQ=
X-Gm-Gg: ASbGncuIhPfQDdbd6wq07ENEGIoZ9LUL2VPvckbYM+u545z5E7WHnkSlVnP2zsuCJMb
	eQoouFEaf9d0fk7t0tun2rud3TobR2Jkl6XxYI53dSzr3tyFiqH7iqcL3f5E02ZQjQi06far5kX
	HGvhVsvcjZjGdh5643kFoe3t6pHQ5iDnYgtqlgYXYv++5rmvBCtcUeUxAaDFuG5u6c44FUjCBej
	4uObk4oUIGzqjiQ3CfTjfLiTrR4iUioxs974xggvMYFWhzGVc7IJJ/l59IRi6oVCQjQ8m14kY8l
	2FVL0ouw/O1bWg1Ph6+fiiECHcr03xSjafEtPKDjx+kL5o22ZARz
X-Google-Smtp-Source: AGHT+IHFJsnesAwLkWRA6zdkndEn9SX9qS0GFQhYN/5iMboGyQM1Gp0sj8pgSAH/JFC5Su+szK4MWw==
X-Received: by 2002:a17:902:e88a:b0:235:ec11:f0ee with SMTP id d9443c01a7336-23601cf96d6mr29339135ad.14.1749183624573;
        Thu, 05 Jun 2025 21:20:24 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313286fa44bsm908620a91.0.2025.06.05.21.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:20:23 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:50:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Andrew Ballance <andrewjballance@gmail.com>,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250606042020.ytpvgd43auymf65b@vireshk-i7>
References: <HVTDJypFNQFfSQJmmYDSPU4o-irFnjmDN22RW3S0z5Kwe_hVk9kquZWElv-C2k6d5kOIiewhj_Xo2kAoTHbHgg==@protonmail.internalid>
 <cover.1747634382.git.viresh.kumar@linaro.org>
 <87qzzy3ric.fsf@kernel.org>
 <aEH6GzCTgXZSneHt@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEH6GzCTgXZSneHt@tardis.local>

On 05-06-25, 13:12, Boqun Feng wrote:
> I assume you run it in a VM? How many vcpus are you using? I've checked
> the code, cpumask_{set,test}() can set or set bits out of nr_cpu_ids
> without triggering warning if CONFIG_DEBUG_PER_CPU_MAPS=n, but
> cpumask_weight() only examine nr_cpu_ids bits. So if you run with
> nr_cpu_ids < 4, the test case may fail.

Ahh, thanks for that. It was really helpful.

-- 
viresh
