Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177081F91C7
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 04:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755145588; cv=none; b=btA4LCqVtF30PxVWBQWzvhBVl6WM99jskuAqotYjbdbX+FQLwtytpxeBSdCCNsWIyMHNhVD0wcYb828RlOqbnl7qzZVA0B6X34BZed3Y6H/DO1MU4UzfKsAj5kOsysevGKC9uFMDKAX5TTAIBydP1uZBtbM+ZuWkmnxqQHppkZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755145588; c=relaxed/simple;
	bh=M+zbR6R1Nm/4pCp0B7gheJGuNDaXY/XrNqF/Pyj8bmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xgynju76i+cXpeQ7zV3KlBpkSucF0pjYKSa+gSacgI9Gph0XqIaOmFctB6H/bnY+bFaN7fzI0cDYvCCCRBO/cRv0PtBwxt4OaMsnZP2uyKWRcR9JbDJ369/MeS+zPvigx9fOFLAZJABEWOtRQntHZg9IDbH4IBNtl/nK+hr/Sms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zJzVGlIh; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zJzVGlIh"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e2eb6ce24so524088b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 21:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755145586; x=1755750386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Y4+VbSY2gENC6vjJLIhD6H5q5HP7szxm2F2pf2ubmU=;
        b=zJzVGlIhOOZynWHY+t7mRu8y3SWCOAPEcC0ucyRK12R+yWvC05JlQ3kKWYyoFTS4W0
         3Rtv6Iiq4omT8z/bs3GsfWgiDZWRllOvEorxYQyaqYSZBST4JzvcdF7Tkc/HRTy7OqrE
         cPY4tIZwxUWgmIyA9MTBZzOtualAg954lX8N8/6lEkkHfECN1oGAdT4s9WxkGVzE0mam
         1Q8xRe9atpVbOcHoWfEUaMpqA/ouqwq+KvMxpzJu8Ys4nAF5e2i63sW0JRvZZohyarRd
         8gfz8Sa84PUTu8vHnHURHgz1Uf6j93ow6VqxmC9hILfGqwi3SSD1FxJKh8YMCsJvizhd
         7pVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755145586; x=1755750386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Y4+VbSY2gENC6vjJLIhD6H5q5HP7szxm2F2pf2ubmU=;
        b=cy1pyHfTevJGpMhWYban5a3+h/lb3ZKg3pJ0ya0ebkcTVhOp9MoR6EiZJtchSJDI2L
         mYudcmiTE/wQt2oQyV4VnCHUuf/TruC65O7eWkovsXol7C0NVMKfwHcu0ykkO8wUqVYf
         kGHWZYldsG/toxbuwpZplnzhmz1y0zgFXUx6PAMS/zhcRJSR2+1D7yEXHVJ/L/5fulet
         ocMx5VPaVE2tzoA0+2b2b/wIDKnQ/xXEeSWNs4PDNkpxoOpy9+YtUKgKvPwZT7WD+2WN
         u+pWWsKA5+4Fnq6djemUTL3bWjbSKCWgDSHozeBbxHaFOm3c97JGkIU1s7Uht5xwWP9f
         gliQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3fnX5ZM4IUDUcGo+OYFXe4xMtXkVMrMRvzyIjH6iPdakjR2VJZsJ3ZaUw1SrY1rB5QrrS0w60JrpelDUmZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgZubmCnhTrbIzWE9fCxHxDCbOld6a3azR+pDsW0D55Na+Y0Ze
	Cym1PwuGwwyVR5KlysMCLUftfO1kHb8NGH5MwdAXgLIlg74lp2rtj7+XlohjQ3MYpRM=
X-Gm-Gg: ASbGnctgbrwmSRQ/Y9QJ61FS75DFWcPRCDIilXPuNm1GJE71h2DSEXpvWy30Dm0MCx+
	f3kwC3upZ34SE/JUnXBI/DnUvNo3ITprfmgEtFzQ6Su+LvH43PQgDHOiRAMkrb7tjFOo6a5zqig
	9HtjViqOjasLlKFeGMHBSgM0IPmDPgRyUxO8pYuYAa2wIPn12/zrvPQSX8OMavVCNA98Huzq79Q
	z0rawVyUExIxmYw2pKG4Pd/8NORp0jPSgFC6Xb80bXs+2g+02injob3FgReLZzkrhzsB7/oFkox
	6vO+6ytMZTltpEbsBreG9siSDF6KmDz2jAjYnMEUMn4jWg1UcBq1BZ06b9sgLJ/xnhg0+vMu79x
	pilcc7pdUJV7miPXjTXfu1SN2B3IlhQtwd+g=
X-Google-Smtp-Source: AGHT+IHTIvSY9FFJNBppNNZLO9sn/8s0tAcL4Le93FVv9JRJ529BpdCYJLpwI72ZJr0ZEnJN7dNv2g==
X-Received: by 2002:a05:6a00:1304:b0:740:aa31:fe66 with SMTP id d2e1a72fcca58-76e2f8cf708mr2713273b3a.4.1755145585869;
        Wed, 13 Aug 2025 21:26:25 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e2037acf2sm3493102b3a.112.2025.08.13.21.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:26:25 -0700 (PDT)
Date: Thu, 14 Aug 2025 09:56:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Baptiste Lepers <baptiste.lepers@gmail.com>
Cc: stable@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: cpumask: Mark CpumaskVar as transparent
Message-ID: <20250814042622.t2qx6mlelntxi77b@vireshk-i7>
References: <20250812144215.64809-1-baptiste.lepers@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812144215.64809-1-baptiste.lepers@gmail.com>

On 12-08-25, 16:42, Baptiste Lepers wrote:
> Unsafe code in CpumaskVar's methods assumes that the type has the same
> layout as `bindings::cpumask_var_t`. This is not guaranteed by
> the default struct representation in Rust, but requires specifying the
> `transparent` representation.
> 
> Fixes: 8961b8cb3099a ("rust: cpumask: Add initial abstractions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Baptiste Lepers <baptiste.lepers@gmail.com>
> ---
>  rust/kernel/cpumask.rs | 1 +
>  1 file changed, 1 insertion(+)

Applied. Thanks.

-- 
viresh
