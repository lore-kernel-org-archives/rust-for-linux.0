Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69AF3191BA
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 16:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758040012; cv=none; b=Z2QoWPu0czUBCRmour9ZvxIySpmjIjnV/VlDOyJrWtMFSGOWYfTovdmPjjIi7iVhpxCYtwmZDA3LtiFKXtCB419F0Ldeeza6y3jwJZ3a5upZ7w4nH+cftixaTUeENxp90om/SE0vlxkpRyObVXCkw6rZLQC/FeMpA1k4FA8PrLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758040012; c=relaxed/simple;
	bh=PxBeY2ICmRxL7V6JGWbT7z+W48PkV2S3brfnG0Ta/Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKQpbbJv/tdWefA5FDYBTBEFawbEJou5DBywq4LGltPrszCkahlCRiz372diUehlT8/J3MT5Jzuhh/sR8AcYvkfxciJcoM7mf4wW/QJXx28M4iH0e8+j28XDUVc+/dDdxkMFfjAtnzbB2ElM0gk+2c+0bM4d5oA54sTVtjeJjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x4wMjvyf; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x4wMjvyf"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-772301f8a4cso7222639b3a.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Sep 2025 09:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758040010; x=1758644810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s4w1twc2Jux9/iX+9+EawZxCflWASdrv9dd1/gUc0LA=;
        b=x4wMjvyfpQsM54v6xctYOf/ZA6gD/PaXfUUnF13LhaC/AE9frmq2pERUCFTbcL64MK
         3MVk5LFpY+DSoi5c5VB5u9sd2qh+j3GuZ6dKxDRCPSlnW5efp90fvPg6f9TFZER5qzEY
         NSsQnmYj/0cltUR8/4fSZrJoQL2M9OS4eCk9FwNb/FK2K0ePYoluD9YeUzHHAPOTgRDt
         jlKUkyDwatQfCELkiRrRNt2WJiDHS6zcKuS8lhQwVLqoOGFgZZGTeEmS4p7oFKPEJlX8
         PgT1Jr9YN4v5eq18amIDsAZMaIsuJDNf1IDG8he3x2580UhztMvFZMuNY2Kj6XrfGeDD
         hk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758040010; x=1758644810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4w1twc2Jux9/iX+9+EawZxCflWASdrv9dd1/gUc0LA=;
        b=twZ/2cwc+4Y48HRoLi5ZhMqytPXj+EC1jEf59BQj2HkIRSubChqAQ4lU9OrYdavXE4
         dL1RJqD2fo4Sa/9S0O0xglMbaZlu/7dKIPBKmWj9OD8jxPuIf5yfwiQTsAOMqI39Om3I
         2y8aVQ2JAosnRv2LyKmC2NM+KzBfS+H7jt2eTZdhuEaott4dWf6D2LGEhCypcxoyv3WY
         4Y4FHJxV7cic9fIqf2tzx5Y3mGZqGLD/oMJFq9NG7MlcU5VbyjZMhKs5wTqxfvUwuASo
         0fVsMs7Lamo6MFP8hiMLbvbi2rgVhuv2/iqTyFL4RouSImFbiXQjUXcA3NKkWjJZEqtu
         JWKg==
X-Gm-Message-State: AOJu0Yw55SktIO4YUqUvlQrk2Sy3p1wvjzNz1WfMHppVYYDzEBge5c3h
	Gv/tEE/7xRmRpNADf30FKoNN4LgNkcyFwX1Pi9vh+zuCi45eohZIvwS4fKmgIMdPSJa5hZFVxdZ
	ErQSTqmYeQTCxQj/lZCVfh/HweSmZzZ6tqX3LU+oYEq82BN+m8yrAi1E=
X-Gm-Gg: ASbGncuqzsrvLf98BNsHoWzsS5PA+wMSSviPQQaCvLtjZF5gFVjpRkj9ZcSCZE2E1UI
	vBT8FpLLadGe2aBEejo5HEmU1vOOiq82r8HMt0+VyI96UN3d2bRcOPi9F3NQVq2ppy1r0dzgvZO
	pYDdAwF/2uYMDZqVKLxkGXrPNAPPI+kJ+B0kJvZRNW90cC3WWrIOXQ9I014VjDA6OzdaQ+UfMBz
	ZqZ197G16IEZ6jHbXzczdS8JYzXZmdH9muOIX2n1OryAP+HspT+wmLWiOblDMabJC5qSHI=
X-Google-Smtp-Source: AGHT+IHuTUY+Teyoa1eWvti9PIr/otK14LfkQmbXX52ZUETrjjVY6olQ+9HFTHWNNqsEYSy8wzDykuGz9e1hPuCuCPc=
X-Received: by 2002:a05:6a20:c28a:b0:262:4378:9df2 with SMTP id
 adf61e73a8af0-26243789f89mr10527030637.44.1758040009637; Tue, 16 Sep 2025
 09:26:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
In-Reply-To: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Sep 2025 21:56:38 +0530
X-Gm-Features: AS18NWDfejtlQ9zlS_9kzf9pQW6YsiN2lV16eZmPLVxyOpZY0K_VUANrsx-p3cc
Message-ID: <CA+G9fYs4JB0ngq+aryXHVQSq-f05cb4agCfyM9zN0SgprQf0_A@mail.gmail.com>
Subject: Re: next-20250915: error[E0425]: cannot find function
 `atomic_read_acquire` in crate `bindings`
To: rust-for-linux@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Sept 2025 at 11:17, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The following build warnings / errors noticed on the arm arm64 and x86_64
> with rust config build on the Linux next-20250915 tag.
>
> First seen on next-20250915
> Good: next-20250912
> Bad: next-20250915
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> * arm, build
>   - rustclang-lkftconfig-kselftest
>   - rustgcc-lkftconfig-kselftest
>
> * arm64, build
>   - rustclang-lkftconfig-kselftest
>   - rustgcc-lkftconfig-kselftest
>
> * x86_64, build
>   - rustgcc-lkftconfig-kselftest
>   - rustclang-nightly-lkftconfig-kselftest
>
> Build regression: next-20250915: error[E0425]: cannot find function
> `atomic_read_acquire` in crate `bindings`

Anders bisected this build regressions and found,

# first bad commit:
 [eb57133305f61b612252382d0c1478bba7f57b67]
 rust: sync: Add basic atomic operation mapping framework

>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Build log
> error[E0425]: cannot find function `atomic_read_acquire` in crate `bindings`
>    --> rust/kernel/sync/atomic/internal.rs:124:37
>     |
> 124 |                   $unsafe { bindings::[< $ctype _ $func >]($($c_arg,)*) }
>     |                                       ^^^^^^^^^^^^^^^^^^^^ not
> found in `bindings`
> ...
> 201 | / declare_and_impl_atomic_methods!(
> 202 | |     /// Basic atomic operations
> 203 | |     pub trait AtomicBasicOps {
> 204 | |         /// Atomic read (load).
> ...   |
> 216 | | );
>     | |_- in this macro invocation
>     |
>     = note: this error originates in the macro `impl_atomic_method`
> which comes from the expansion of the macro
> `declare_and_impl_atomic_methods` (in Nightly builds, run with -Z
> macro-backtrace for more info)
> error: aborting due to 34 previous errors
>
> For more information about this error, try `rustc --explain E0425`.
> make[3]: *** [rust/Makefile:553: rust/kernel.o] Error 1
>
>
> ## Source
> * Kernel version: 6.17.0-rc6
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: 6.17.0-rc6-next-20250915
> * Git commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> * Architectures: arm, arm64 and x86_64
> * Toolchains: gcc (Debian 15.2.0-3) 15.2.0
> * Kconfigs: rust config
>
> ## Build
> * Build log: https://qa-reports.linaro.org/api/testruns/29894207/log_file/
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250915/build/rustgcc-lkftconfig-kselftest/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32l4UDzp0FMtS73JeG3kWpcoQrm
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UDzp0FMtS73JeG3kWpcoQrm/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UDzp0FMtS73JeG3kWpcoQrm/config
>
> --
> Linaro LKFT

- Naresh
