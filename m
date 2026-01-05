Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AB430DD21
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Jan 2026 05:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767589301; cv=none; b=QqsqLCsqsU/qnpEc4sgXDUjQ1ew2/krUXoEjdTmf53ozhFdgYxweA0B4pgbDp55KNJDb8pKnC5HcVVWWW6WDr8U7U3kwNeq2VDVmA+Ep7sIypBanAK6g+QG66+x3sjI76Z2XzNkDqSHYohQu29Ps4NpPL7KvaQkDP1wDMjGjZDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767589301; c=relaxed/simple;
	bh=bOgzM3bvThcr/PL1q+HHJz7YTcppqCfwWatkCNSbNko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VD5vs9hxjJ8igYPBU/2EXTpOVl3qC2ZzvsRZxKHb9vo96qbQqpq7ia2iuTNjor0f3Gr4yBsK79Kn2VncumRu44W3LNnz5Xv1cJ0937vNMWarD3J9ukKG0LA3mxXhB7zsW+VHVjnP6MYQLGBLCJRZ2EAf+DVYRCkeKepPETOq+8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LpocV50H; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LpocV50H"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so8308268b3a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 21:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767589298; x=1768194098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aZKO0eB3ugHv1XJFcKwPh1TEGqr93QeMnjxj+W7yaoY=;
        b=LpocV50HToVX1UqIqzGzoojy0jKyFSmnJwDn+4qd9bIUUOJjtQqBZS776rm5IMFRkT
         Cmbxk1oeFTUGWn1Xmk7xIzcq0TsRd9x1YmcrUYGuM+axC3+V1RruXTQoSBENuSR8D6qu
         j7PZj6u3jHj6sCDF9S9UgHN1CP50PYzMNoHWYvx8tKzWxjEVRXS+1RomcDx8NeycWYlr
         /jhbYTzbK49y/EL+42NLLhnHThICbwPYIShvceeKKOTDus7YBev8l1aea/momv0Zp8kE
         nj029jIR3ZMiTZhCc/U4RChmgz6RLa5sZbWxpfCtXdr0f1p7iRb7zPThM2QRjRZ/9Ae8
         C8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767589298; x=1768194098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZKO0eB3ugHv1XJFcKwPh1TEGqr93QeMnjxj+W7yaoY=;
        b=QqzisSaUz3fVvYY7Y0gKK+YrSNfUljqlD1RoY0I4KJpcLyjCGAB1+M9cVJrIPOAMXl
         yr35dsuoWkv8zpfUxTltpL7NxWMMteCrZIa2Igdo1tr9/oqnjuDI3X//bU/PmYMydVXq
         1xxbAlMGfrhDtegIdkmc0XMlKB5YJQmyeUl+WkdyTdaeVFF8/ec/qHw9uukfosxX/b3o
         ZEBbxELPra23GNp/Q/iLqch4COe8IHCD8Ve7KrnBHWXiZ3MI6D9rJ9sP3ZEvqnlm8I4m
         V7C0Yvfr549fNuDBhRZG3hHJz0wStDM1ayVITQbx4NEx7Oqm8hHLCk8iO/S3YDyPuNV1
         /ZTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKOQDEq+ESFdWUGtMdx2l+8jW+qeWkG8X3i+SDY5T45KXn0e/YWwSLqUsTOLaxa7bDfzfEuYQF0LNd43z48A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDEjwUgjbv0ltU30cHWXxJBOdDxZ7LNeayou5sY2uDLbVm9YXu
	+ciN+aQlf35aqtMQ3DG48E3MtfmpfOI026ayIVRKLwP+dJw4J2jn+wmvyUTnAradDJs=
X-Gm-Gg: AY/fxX5ZV6J/A/+NDFG/qE5211qkU4/BNuehGznMlpHKwfnvlaXjtr2dR++WHvZQR6Y
	099PqyDt82kA3JRHgqsBOtVcNCXV1BTXvTkL9QF9zBXipjCH6F+8oLq79P0YFXntZ/3JKi45gcx
	N2JqmdbztamRsgjuGjxCjeMD8XYx2T22+WdBOv2+2NZtYtgnOZwNf6iGXbVoRHOgZNtrMa3b0OS
	yE3ovMmXxT/64iXoMnYcZS1VlFCkrQX9tO35sEMlhM/UbvBlfoc30KvwV3BfK4xU11ScL8fAZBG
	KK1rCXXTFgYQn1TBmdurjYecopH4VbNhC8ZVswtBwNuERRlS1T5aexcexa0BgAv9KQVD5K6zAW6
	c0Aj41zdCCztaK1oyZGgDEEojvhTWj+iT+7moOkA/v+XgoMKSJ33vA0Jni8jRHoNtlDgghzepyF
	MbdRmMnCi9Pr4=
X-Google-Smtp-Source: AGHT+IERB4/fG8UikeszTNDBmlG8rNFg2rlgQaYzzWQKOuSq+0vtIqjVkr9KgjSkflu3ZWHVKiRaDA==
X-Received: by 2002:a05:6a20:4325:b0:35e:5bcd:8310 with SMTP id adf61e73a8af0-376a7fe52f8mr41359422637.32.1767589297954;
        Sun, 04 Jan 2026 21:01:37 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f476ec31dsm4911064a91.3.2026.01.04.21.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 21:01:37 -0800 (PST)
Date: Mon, 5 Jan 2026 10:31:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] rust: cpufreq: replace `kernel::c_str!` with C-Strings
Message-ID: <62mbftgf5cvvaelbtnwjclimyzi7lpmxxlu5uqfzqrkzja3efn@fgijwgonqsp3>
References: <20251222-cstr-cpufreq-v1-1-2d99dfc88cbb@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-cstr-cpufreq-v1-1-2d99dfc88cbb@gmail.com>

On 22-12-25, 13:29, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
> 
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  drivers/cpufreq/rcpufreq_dt.rs | 5 ++---
>  rust/kernel/cpufreq.rs         | 3 +--
>  2 files changed, 3 insertions(+), 5 deletions(-)

Applied. Thanks.

-- 
viresh
