Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C3C7CF18
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Mar 2024 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711622466; cv=none; b=mq+fVw0xJdqMbunHPfjkCsfMvvR7DfZqbFU3t72Zl00/sh5UmgB2ShvRlid8L+B/FyGfSMOMqBJek32RDGk4wOqfP7w2L/obBaTZJXaM7FRq8iaONA5uFt+9BbL6u9Y6PtDAAl4pPHWDoDqMV4mMQK6Km5iBNVdUAWaBxNx1eKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711622466; c=relaxed/simple;
	bh=7UqQtO6AX78Yf+yXHnW/aauK7Iy2tU6we+RvjolmzR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1eZlkWfdd8PGzT9MoMzty7VHvGnECsWApu5vwSrLuax7kMLyO+0YaeqHsRJp7mFNEvQghRyhd9OezI5BXm3CSTfM67GFR32fX7B5NIruagOaI1GDNUo9kSuVqBxshikAa+OZYktCn6oZfCo5K5dAG/fueDZgCVX6VkSeR+i4RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e8i1iljo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e8i1iljo"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29de4e12d12so611411a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Mar 2024 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711622463; x=1712227263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F3uwvPOspY5KUiXZXkOUoLBDTxe/dXc0SwrK9JE3nLk=;
        b=e8i1iljoMtSsbS+pYI2Ni97yMbFrbjIw0fil112bSbfdtHBdc0IQ5v6R7g4mCJUzW0
         l585DKOnDuqNDKInj3Y750scP2qe+ia61gh62bVLZkl6Y57rYiSrIyisgIIdKCFETN//
         BVSZkBrRL6reaAhXhmVkerhPHnh5p5zh+6/nvGGcKPjsRKAKx0Sxbz0yQ/ghBZqOZYKU
         PSXbG8FS0Kud/J+jdEJCUciibbZCunM+bavUAZRyl3Vu7yrB+9Bc2BUJEPAYoEW/UyjI
         hOOs+V3SLt3x7QD2899fD8fuYeXYc9wGiBF6a+D+tS0MU3kAkSETCxq1d02DDJ71xl88
         7h5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711622463; x=1712227263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3uwvPOspY5KUiXZXkOUoLBDTxe/dXc0SwrK9JE3nLk=;
        b=lblQ+GGrjpXa4hz5A9x2IzPST4E+NQ2M9afZN5hx0sr8AnU4l0V6qSk5R4zY49W8S+
         NxgHdI1V792dhU9Aw0qvMI2mejKhOJtPr8A6IfpZrdOOu90gARmAOvleAA7yyRPA1B/2
         CRWpJV5xVe4f7+YE97KxA5IyPO65H+4Qddky/dYRReYAEkf3PAPGkxreFS3bAMknns1Y
         b/Uc9tCXJSXhCnnA9N/VaJlC62952+EEMnwwk3itZWw/u+Sjm1NYggAEd27pi7VTQYXH
         R4qFatYOHgrtSVy8stPs21AT+brcZwUkzvZ0IUwYhlI+q0b/8Dwl4xwYNwX2NFL4P43B
         SJ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNNFFyWKKBsCvVnDGIXOTPJrk2OAPXFhYtNCymdRMdCCUj/qmPAL3QuwYcPobMcJxYGexweg6l+CeaP85noVrBwC2ItYzcIMs5fvfQQHI=
X-Gm-Message-State: AOJu0YzAO0vCRG1YJIP6jggRKz2ujbWLa/odrfhg+L89XvVyE6yGttXg
	hXqs2q/+AnoSaH9fSqeFDUZfddQzT4fHTF6Q83HDy1XbYSxSGPouHGYzEqWImqs=
X-Google-Smtp-Source: AGHT+IGSuS0BxSik6qWO6n2bwdK9HE0aOab2An/EN2Y5leCtk2Vuy9M7rVXeGPfNTGRl+unV4+PHAA==
X-Received: by 2002:a17:90b:46d2:b0:2a0:2b14:6d8d with SMTP id jx18-20020a17090b46d200b002a02b146d8dmr2202359pjb.1.1711622463100;
        Thu, 28 Mar 2024 03:41:03 -0700 (PDT)
Received: from localhost ([122.172.85.206])
        by smtp.gmail.com with ESMTPSA id v12-20020a17090abb8c00b0029c13f9bd7fsm3190478pjr.34.2024.03.28.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 03:41:02 -0700 (PDT)
Date: Thu, 28 Mar 2024 16:11:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com,
	Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 4/8] rust: add driver abstraction
Message-ID: <20240328104100.3dq3k2rcmsxtwoe3@vireshk-i7>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-5-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174924.95899-5-dakr@redhat.com>

On 25-03-24, 18:49, Danilo Krummrich wrote:
> +/// Declares a kernel module that exposes a single driver.
> +///
> +/// It is meant to be used as a helper by other subsystems so they can more easily expose their own
> +/// macros.
> +#[macro_export]
> +macro_rules! module_driver {
> +    (<$gen_type:ident>, $driver_ops:ty, { type: $type:ty, $($f:tt)* }) => {
> +        type Ops<$gen_type> = $driver_ops;
> +        type ModuleType = $crate::driver::Module<Ops<$type>>;
> +        $crate::prelude::module! {
> +            type: ModuleType,
> +            $($f)*
> +        }
> +    }
> +}

Not a problem with this series but with the internal implementation in
rust/macros/module.rs I guess.

The "name" field for the "module_driver" currently doesn't support the
'-' symbol. That's the right thing to do for function names, init
sections, etc, but this also translates to device names and they are
allowed by the kernel to have a '-'.

-- 
viresh
