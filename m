Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9D824886F
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Jun 2025 03:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749784097; cv=none; b=NrE/4tX7exo+xddfkts+EsDKmoS9nb3SA2shbU3fm3LsWEDcTI8TnSug7IBp1pxSOjJ4PMwAZMyReAjyeGKCbdHAHgONgHbrwEo5f26/Fl78oKxwkWI18d0lOpCJHMw6YUxwQyn0TaKvWYoN8f1YOBRWRGPUAMofglEdCJZ9ynE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749784097; c=relaxed/simple;
	bh=F/cPlJRxdRgqrcVVwCfuopWvR2TZ7HOAdOh3IpnzUjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FULUXqfCnNbx9643WEBNnwNOvRnKRi6IWX9F8MGurS1YO+AmPYwWw/G7A8+uxNzfQCbwDEL0VmJC8VNDxOdAXjwj/06i6GrmG3W2FmhXYVEQqmrE1a6AGmG+6BNIu6UEoSBHTT0lXi3aSAW+BbJej9TBzBO6T66EL+MtBBK1UiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CaQGbVll; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CaQGbVll"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2352e3db62cso15132555ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 20:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749784095; x=1750388895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WIYd06ooslrA2HtyvTs732OcgY4BnneKr/vzwTUEOyE=;
        b=CaQGbVllxnKlBeCX28izrqY4icgwAw03huMMQ1F02/WLRvPxK1dV0VOklAhushOTlM
         OTe8n0rox2Mxry+uHPq2IzEedzJ2XQ7KBkkiq9pB6pBwZ+s6RRrHqhDHL2yfrlQeihkA
         0PCDcXf0HpMCjUx1YLrNIqHQCpmIVxiXM23w8f/AiXMFLuCye3Zx5Ss8BDRiGz7U6p8M
         Bu6bhZS8uA/6f7b2fdInJGaAyBVyzS9jYupId6JtNFgJ1zoks95w8UeFf3XPV1erac8m
         EXPCWubTWDhVEjVxH1GMngJH24zICCTdUFQx8+DdM2lqtkMUNDO/UyIYWrjJa81cB/Em
         6DXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749784095; x=1750388895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIYd06ooslrA2HtyvTs732OcgY4BnneKr/vzwTUEOyE=;
        b=tDC4VLyL9wLmi9jjvbzzt488kh7EitTSoPQYJJZU/Quu48uNDKfFe+r3ZMPsP23t/A
         nLRK8l7utGt9NYymUJzP1dv1tBT7fRyB5K/iBA9Ukhhq1/iwn3TsJXU/T3gFfovZVnbI
         9TGyFybs901XE6S1OrZw5yDXOvakV8YgiVTF+Mz/6hRw3vJYTqzuxG5Oogar3HKuIB7e
         71j8be8PUDfxX4v2bf+V5okVd6H3UkodeZL3WRMN0vKrMNEz144er7mpWBTvVtRiGIUi
         W0vAblWbgmwWf/20QJeHTHoS4ap236zrJoSmsXOXJz1C2D3EcaqYxH4kmGf9SjXZzpND
         BM8g==
X-Forwarded-Encrypted: i=1; AJvYcCV30Ob2yqEv9OOsAA6So+AGuuX18RMlhyvjhLJ2bjQwWpghaRlDggPhngh5xdMS0PAflkKvKCctK8It8rkGFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNpoFrm0AzCq4KfUkCHDneJvPeqicyCkc3GSMCRwW6q9r36gRE
	/bR7HpKWXqrKdWrPu0Cr8Su6vXusCvvPEF1ds4jdXavyJlUhPWvx/tZO0djGUKM+pOg=
X-Gm-Gg: ASbGncukDtlWck5JRAZdXYWkY0oc40ASHDFqlVkXDWylbvxeP9k1lntvynVnFjLT08F
	v/O97RR8a307wqpNa4SfsZyguLNP6WoefUegRAf2WgSVl4LxtHFQnBwf5Bvl/N2W90/l8RHiWmV
	iA2+X7KCvsFMeJNRGjT6vILnIIQnF1nJgCny38P34O8RNqv/SNiXNb/E5h6nMz/DxH8hklYy9Fe
	rs5fCNEtiu0MctoeatcTkkQYo/YgdXMgKIJH3SHJUPUd386vcwciIaqCcZzUCs6DiyA5Kp45gP0
	5Jy2+L9At8mKDfhhhSfdOdhdCjj0U+4Ki66UTIZnatFZE/F+vAZVKCtXx/NsxQnOaHulu9cgwQ=
	=
X-Google-Smtp-Source: AGHT+IF8Y0wgnlnJ7uFcWUJUQNglN2V/OKcklcaqSOverj9hfKklxcYvgBJpD9CVwi+TFZv3FW4+8A==
X-Received: by 2002:a17:903:1210:b0:220:ea90:191e with SMTP id d9443c01a7336-2365d8910f0mr21711975ad.4.1749784094946;
        Thu, 12 Jun 2025 20:08:14 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de782f1sm4555785ad.134.2025.06.12.20.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:08:14 -0700 (PDT)
Date: Fri, 13 Jun 2025 08:38:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust : Update the bios_limit_callback to use the C
 FFI types #1170
Message-ID: <20250613030811.ytegbtlw6rgwtjgr@vireshk-i7>
References: <20250612104127.10299-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612104127.10299-1-abhinav.ogl@gmail.com>

Hi Abhinav,

Thanks for looking into this..

On 12-06-25, 16:11, Abhinav Ananthu wrote:
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index b0a9c6182aec..e97607ed86c2 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1277,7 +1277,7 @@ extern "C" fn update_limits_callback(ptr: *mut bindings::cpufreq_policy) {
>      /// Driver's `bios_limit` callback.
>      ///
>      /// SAFETY: Called from C. Inputs must be valid pointers.
> -    extern "C" fn bios_limit_callback(cpu: i32, limit: *mut u32) -> kernel::ffi::c_int {
> +    extern "C" fn bios_limit_callback(cpu: c_int, limit: *mut c_uint) -> c_int {
>          from_result(|| {
>              let mut policy = PolicyCpu::from_cpu(cpu as u32)?;

There are a couple of more FFI callbacks which use `u32`, `usize`,
etc.. Can you please fix them all, basically all callbacks with `unsafe
extern "C"`.

Also please rebase over linux-next/master, there are few recent
updates available there.

-- 
viresh
