Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E241F561D
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Jul 2025 04:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752468863; cv=none; b=kEkHBzIdmn9elDI67gNfDMPD57OeYFoeLNKMxuSWxXMGlYa/eHsDkDdJjMiCrVlFSAQcuwiPhK0TNmEjxVNNac4oKhW/N3hgKsh23RxIwzeLyr8i+K57ZgU86F19rfd3nep7m3bW6PCc17NNzU3OiR+tsAWrR4PWHPQTvr/GFZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752468863; c=relaxed/simple;
	bh=Vj3Ms133PDQIC7qPLBpWIxn/XUEv2EyDcAobH4/it94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KI8QbQiQkdCsLUXgNkojbcm2+24VnuShgU3BoYOM3NCS5d5161zMjR+K6LUqFw+nDWgfAjhojWsfwLlAMxy00UDfFz3fAlh1/BK4NTtI+QTAn+79rzOgRFrR2546rZA3Xdq4VObRaj+PPAlQFIN37QdwY+fzsN+TB7eQFXw939c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xCHamEeG; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xCHamEeG"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-748d982e92cso2437467b3a.1
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Jul 2025 21:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752468861; x=1753073661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IPg29/PBDnti2HUtmerkQVekf3ugG0dCwGFEPAPIzJc=;
        b=xCHamEeGXu5ktAYDbFjCIsuyKeBP6TCKQGRjw0DZUuBjwRgeGY6g487wKyS/8nKq3o
         aZUnEUkvSuppzq1ERpupPr68hoYj4iQ59UD40OtdI7HbfFv8T1gy9VoAgvW4FpeOQCdR
         qxQB+lSrJvVm+wwhIvDX9jVzjkBtGYjs2pBBQ9WT845be5STYe+YKvc7IGn+uodW6Gtn
         CBqbpdFaBMoVQDD6qRkYpB9YyBKRhxsrg7hMqferEuIWITx0+vLYLQ4fxwnLAjzgVOov
         jaSh38KC0QjOd6rwC8wVoj16Aln/a0KHRI/mOtiD8AG1ZoTM7vbce1wAnltrATadQWoX
         vtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752468861; x=1753073661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPg29/PBDnti2HUtmerkQVekf3ugG0dCwGFEPAPIzJc=;
        b=Zi99UkbiRz7ckCTCySyx+qvQZd8c/jOrv5RJVA1SYyexC9709Hs5DOV5I76/EyNV7J
         iqblrEuemmGYkDeKmv7FTI1vsUCQvjceLugFMteSjpMxc9ZcIYdIIXiut7DYNY7En2cK
         8tb5AuRczeBX1GXP70phiUHSUuvNX8IAki/YZOcxqgJUlLOHpoQC4opSHscMpLleqyZE
         XnC38kd2Y92a1nNVSN0KyLZNZAzW1ATYjQADS3HeJRD1wfTHpYWQQwGSS9pc72dYvokj
         LHfzsQ/j4NVcSXsRF0cBsPTeXxtZkAj+9978Aq7B/egUnsatCS9HUlQ8tohNj/SiXDzn
         TOjA==
X-Forwarded-Encrypted: i=1; AJvYcCXtOA9kpzwsJcvk6DJMDrYsoYMdsrsHCFdn4OmYoLuysaueArVhnoK3mwoExxM04GVTo98etZJVtJqOJk9YoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb929Oz+Ia2G3iBjwl3LLZrXeCz28d76zwOynmQhxRzVBjrNYP
	gvWGJu5QcAhX+AbkY3qVpGjd81TPzua8i4idwMkWRuyBKZ3+XHlLFHfyJtFr3ketrcU=
X-Gm-Gg: ASbGncvNtkuhRLQEzz/PUTXYgMz8/kXZSZB3kCWXXgjjuqg16F7NvfW8ymaaJyXoYjG
	0RSSwHG4oL51uh1Eei/3Fe8IDdFY2niZkoHBnZnl6kDsk+qF0Rxxn8sazz6d9mZSf782AVW3ipY
	+NVfeyX6IlOSkqXWtotfwL+ao0VkxJAwrbmMCXZ+vHXeJryWRxVtYVxkco91oiWSPnGfH8zIKD6
	JLr4BlkeK5S9kjXM+1iDIeR5TPdxzqkwimdASg75/pSMbB/T/W2Wc8KNg1kbOJi8P+0BS8HDTBX
	ULICLGvdxVkbiH/ewX0XcGm+/OLWXFvuCAW/hHUXHJMPIbz50vrDs0Bm9VLBdUKtz3cK7mCoKPJ
	2hpaOn+uIKvvS6eQ8L49M1WI=
X-Google-Smtp-Source: AGHT+IHbYBmdgephsncHVhQrNUohh1VKP9haNH16TwtXBK9MSBGkTvBfTqJiWE27Qm988lISPBMrRg==
X-Received: by 2002:a05:6a20:158f:b0:222:d191:5bbd with SMTP id adf61e73a8af0-23120e028e2mr16266952637.39.1752468861555;
        Sun, 13 Jul 2025 21:54:21 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe6f282esm9143383a12.54.2025.07.13.21.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 21:54:20 -0700 (PDT)
Date: Mon, 14 Jul 2025 10:24:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ritvik Gupta <ritvikfoss@gmail.com>
Cc: yury.norov@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org,
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: cpumask: Replace `MaybeUninit` and
 `mem::zeroed` with `Opaque` APIs
Message-ID: <20250714045418.4ajeuetnjor4nhau@vireshk-i7>
References: <20250713190244.143286-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713190244.143286-1-ritvikfoss@gmail.com>

On 14-07-25, 00:32, Ritvik Gupta wrote:
> Replace the following unsafe initializations:
> 1. `MaybeUninit::uninit().assume_init()` with `Opaque::uninit()`
> 2. `core::mem::zeroed()` with `Opaque::zeroed()`
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1178
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgj0OoCn56OkNUmiPQ=RAVa_VmS-yMZ4TNBSpGPNtZ5D0A@mail.gmail.com/
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
