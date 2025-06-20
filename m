Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28535283C9F
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Jun 2025 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412614; cv=none; b=ama230HdVVaCGrFj42/3ycqZ/opBJ561x1tUBPfRpszud2Nyqk7KLHXhDowTDByf/VxEtWBe/ApU94Cd/JQMlQ3UZj08eV3SrkYcEHgNFCzz7nwierz1ot6K/56QVtfMPmeZUYMKkCE8R1nWh9jWxoT0Etcw3D3ITbZ7wdggXwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412614; c=relaxed/simple;
	bh=CUC8O2VwMALRnRhIMKIyIO0HIrPO1m4KYTOieiWxaKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9/QmZ57q0Da+c5LoVpcaE5PhuotDa2YCpYpYtAuwjA5iHP+Ar+p+/8jTk86E6dg8p8VNG7tqe4evFHy5t9ExWln1Mgyk/ftSSeMVThU27HxylcLW2Qd6MTDcXFKgsXI3NxFITmb/ySmmWcgeSpMT+00o3SdB9+7s3NdMhkux3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kaenU0K5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kaenU0K5"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2363e973db1so11225145ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Jun 2025 02:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750412612; x=1751017412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wE7pUg075HF0iK/42gsiTO9zjRo3RhObajlGQz8mgyY=;
        b=kaenU0K5xwreuuRH9D1/lqNy1Tdbx6jkH5EMXMmIm9A7s4LBp/4URb8+2AZ0ZIoiD1
         XJupMph/R78jG53xs5I1ClWkm50WqmnyGqRidkCFQMYBJbVkQj0+OOp5l1xtjMRWX0JF
         6PTowu8kd3YXoxalE5wPZtOTTkD0DFEtsjNJ/ZueuXhrB7Oov1F7RiHZKRu0viJswSWS
         HGCPkN5wJJ9v416Lb26UCXeLyEJvUwHDpBBAXNCcQXtKXAxQoWeX8vURILK8yq/JbkCa
         lyWimYG4wgtGN20+wRcjm2utXV4tl0FJKc/jrdteOaa5JypA0BZc3biQPGzu1LY34Dhf
         MOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750412612; x=1751017412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE7pUg075HF0iK/42gsiTO9zjRo3RhObajlGQz8mgyY=;
        b=fkfzbE8jzqLQJygaoYVBAjNGFycQswBTifu0vULvMy+oVXEEISKVFVzOD97ZI10BzS
         8uaPtUb1pYY/1vJvAW7TrtSrSyrB1oLGG0o/rqdgXGDRNSxI/YhbwwDIQM+14BSlSu0/
         GzQpaf8Z1P4DDcoQXngDmhkpPgNifP5foWiav7xJ6La2P3ljezQtdb+kG9b4/nR5i8aD
         Ca2oCIKAkRBhwgRtvA6E4rFhIVG94ubHDUyKKWcBjdehXzUiNKwl97RJEgpkOzKlOzZx
         VLBs/x3rvEfR+ODn8c02noIvkDygoouOUdbt7852iRgjM6zQm7iNx/XCCx9leUx12sC6
         x3zA==
X-Forwarded-Encrypted: i=1; AJvYcCWFWUnebdH1YYkL/4XP9RG6G02XISrP+Por+pgyIhdABeF4dskg1LmG1F+8bcxP+J4cB7dXTTnUhyOpRxNYCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyneSC1deuaOxYO1GLbBgwQX0YtSK5Lq9BpOOx59IV1AFJakD5/
	qSpuB4Ju1bwaIJjrvyRKGgkQ3N2FAWbLGUZWs0+lPRk9pNJywa8HmwUGtX9YDVveQXY=
X-Gm-Gg: ASbGncuZouWl8nBVvqASZrk93ftqkZXIlvrO1DldaE0OI+qVyawpMJqA7mPrRStqPcd
	XV85PWU234eX/HHwiMUFg88gZgU5U+p0NbGnwfdytv9yjajw9LzC5JfcKTS7YwjVdoEnu4CDVsw
	Pa7CrUNpMajArbcWjNsv0nMR0yMGNYjgSTlETSLr85matTE0uL9nGNHqktA8upUZTNfxgkNcH3M
	rxhC6GMf83PGP50A53gUiSroSSrOMRrrSJlR5aAnS43Z/L3pg44DT1aJDpU2s5kOmi026qgYqK3
	xrL34oFy9Fzd2Of9adWnJxKC3VxGwpGYwGbBdLHEcPAqiHALi+HWRB+TLpOYbqqBi1Ljt7ZJQw=
	=
X-Google-Smtp-Source: AGHT+IGYtaGOuL8gI+YuufgD5d5TBG2eLVkJT8YBCXNPrn8oqs8NULxbod37t1rWLg/LGuPoK+SXRQ==
X-Received: by 2002:a17:903:19cb:b0:231:ad5a:fe9c with SMTP id d9443c01a7336-237db06e6e4mr28537095ad.15.1750412612490;
        Fri, 20 Jun 2025 02:43:32 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d869c5a1sm13860205ad.192.2025.06.20.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:43:32 -0700 (PDT)
Date: Fri, 20 Jun 2025 15:13:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: cpufreq: use c_ types from kernel prelude
Message-ID: <20250620094330.m3batzq7oknwk4lz@vireshk-i7>
References: <20250620085229.18250-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620085229.18250-1-abhinav.ogl@gmail.com>

On 20-06-25, 14:22, Abhinav Ananthu wrote:
> Update cpufreq FFI callback signatures to use `c_int` from the `kernel::prelude`,
> rather than accessing it explicitly through `kernel::ffi::c_int`.
> 
> Although these types are defined in the `ffi` crate, they are re-exported
> via `kernel::prelude`. This aligns with the Rust-for-Linux coding
> guidelines and ensures proper C ABI compatibility across platforms.
> 
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  rust/kernel/cpufreq.rs | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Applied. Thanks.

-- 
viresh
