Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E8172639
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Jun 2025 04:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183550; cv=none; b=Piy6Tc0GBkvGyyOmaV4pId35BHiBSaTEQOC4G0S3AcnCgjolySoxHdyWhQ79lc0nz72Y+Iu7UgAzynjuVGmgKEFgBK5tUKFc5e3N30pIvBhGHnkpRDMYkWY1WwcO5EzNeJGidvN9Xg2pJhLowqfGItKWuXWXSi7lTMJULQn61VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183550; c=relaxed/simple;
	bh=o4abm83KhcX/5c/veDlyP/zoZnmewDi2a5Q046z8zEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGAkkPLtXt4JgzRP/7TbyFvXUezGj1x5dw7MYyX0jrAO1ZTmcV80EX9LB2qPZrBjm0FNffHghWKqDg3gFiYiTOsfbubG2LVGVDhrZWXtwoE9zGvixhihl3Yszcu3qrtICL2e8C9S81fkTkDAww5DGyiXOecbfYb4UeiESzDfc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPvErT3v; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPvErT3v"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234f17910d8so17387005ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Jun 2025 21:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749183548; x=1749788348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUTI80lWcRXNjZ88XXY8GFQIEPWXmof1Egz2/hSjiZw=;
        b=yPvErT3vW02iG73N1mkQvfpATCr37g2hAIizKFYP7/NXIO6T0SrW6tsc1ne/A/aEfa
         PI09n5HgojI6D0TmAh0A4r29ZIIgX9TuJNbEaDLi3iZ48DESaLqDKd3qFy4Y0N3/z435
         IhEQ6V3oFm97jK/nkkCCnoN5JTegNU3qE0WQoy8JR6EjrUrjWfJQz7ofZj0iA7jlMcTc
         RMn0Fq4QdX6266zgCO4zItNqSQyQ+ZJVVprlfH6IiKliNtje5kRxvvS2L/a7oS+URFuv
         xX4Xy6MMPfmWSR95x/Nu5MTjFMivccYZKzb3642NTYZBKf25y1pslKpwfl1rdU+iThOh
         9+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749183548; x=1749788348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUTI80lWcRXNjZ88XXY8GFQIEPWXmof1Egz2/hSjiZw=;
        b=ozm5axgmpVDV2PDlfa+j6rRtGjKURLxtWnoP2+ufsFaEItBjpfByMniCDe7EAevxnW
         gq1EFZK77TpLPtKF4mQTtr9mTp4YzNuElYYqV8s6vUgwWrEMGWt2g8CQj9UC6bDsP/Za
         PFrqISFmmIBkxZM+xhk6aBjj5XmrPRmibLnI1/5HevU454tX40aKJpCFepI+E7X5jkDW
         MTrO6XlGXoArntGmZJfxwSVIIVAy+UYPMt/Sly24L1LEl1GLYXA+twDGnUtuAF6iXXYW
         XFz4psA/PZ+nYjJkYHW8uhaTT6GvJCB4CcM17MmuWc5LIlNhHHlWBEjZIkzDWbMhroxm
         wrdg==
X-Forwarded-Encrypted: i=1; AJvYcCVwYZoNLRtQc80BkCN9sYR3Gr/Fopjfz9q17KySaeWyWZyZq0e8i5xbZGAIHcNG8ETlRtqLWjKkqH4PAcPCGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKJxdsLGlLMfiPjryflbZWsOrwmuVrK5JWf59w20luX2fTE88j
	nLPBRST4EwCjUb6OYl4urr/xKxmbtDYs8WUJtK4Rxp2Un9z1ZK2urp7LsUdxUJMrDsk=
X-Gm-Gg: ASbGncvtb+GxLWkKtmmWL1/xnGhTzNFEuZpnhvhrMEpdCGPi7b2Db1063fHKIKlFvLb
	ux+DZ1aROri6Kvbq1XIvbnetg4jve/NWxdqu/S6vm1vdoWlbnvMFukQtGcgKEXnfCl8yxiumyZ6
	eQ0B1ARp7dYNxGP8WMARSc8/eozvKtQ8PcDSVkDBKeP2uYHLdEuNaaBP4fJ0FEeuQZsP0fQQ02K
	K8zT/KnyxL4PzseH+muz4gtMNmE0PpL8UeqNr3C2PuHZJZrcLr53uz41N8URxOJ5wYHpNm3rgi8
	O+hAlS7kcocH7jW/q2nwR1j9VwqWXJtXcXpnQxB/ipHEBAYWwuNR
X-Google-Smtp-Source: AGHT+IGzgVo+9iJ8+pGbStrfqIojnnqwOZeq5s8p51j8fnc0ghBhaDbG4KoHtQPh1UGLy5Ce/aq75A==
X-Received: by 2002:a17:902:da8c:b0:235:2e0:aa9 with SMTP id d9443c01a7336-23601d24441mr27452635ad.14.1749183548029;
        Thu, 05 Jun 2025 21:19:08 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603a6723esm3349595ad.252.2025.06.05.21.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:19:07 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:49:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
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
Message-ID: <20250606041905.zgjb2vxpwbpjhlzs@vireshk-i7>
References: <HVTDJypFNQFfSQJmmYDSPU4o-irFnjmDN22RW3S0z5Kwe_hVk9kquZWElv-C2k6d5kOIiewhj_Xo2kAoTHbHgg==@protonmail.internalid>
 <cover.1747634382.git.viresh.kumar@linaro.org>
 <87qzzy3ric.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzzy3ric.fsf@kernel.org>

On 05-06-25, 21:41, Andreas Hindborg wrote:
> I was testing an unrelated patch and found this kunit failure in
> mainline today:
> 
> [19:45:34] # rust_doctest_kernel_cpumask_rs_0.location: rust/kernel/cpumask.rs:180
> [19:45:34] # rust_doctest_kernel_cpumask_rs_0: ASSERTION FAILED at rust/kernel/cpumask.rs:190
> 
> This is for arm64 defconfig. The test seems to passes on x86_64.

Posted a fix:

https://lore.kernel.org/all/8b5fc7889a7aacbd9f1f7412c99f02c736bde190.1749183428.git.viresh.kumar@linaro.org/

-- 
viresh
