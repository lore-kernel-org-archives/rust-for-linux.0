Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6D11D63CD
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Jun 2025 08:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854164; cv=none; b=Y0tNdcCtb7Cpu8kHDHs+wYymDHwMRJEgjR8OOFFo8HIW/jX4T2QQd/YL+b+8isyzmbqi4WqvWB+wWH1z/M4hYF+54pIYGdeQwp3ob/hFKWxJt6CyLS1bYCFU1CkjMKUPRn8DXjTo83cDtZ2M4cvgzpkzCg5isYOt3VdWickPW1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854164; c=relaxed/simple;
	bh=n2B6TOi5zwmiCCw8hYrkqAjJXOSyifR5F4rFcj/vkJs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gNcPd1xlITG6XM1bZILUtCSJZxXATBRNjiEamnf3ygQVVav77STi1/51RkMR9TZukYhy0EXJVmkbaXOhhAXznfn+fMnH1uuOzsfLJc6ORzW+7Hk0jRnqyuAexqU/6UskKe3R4WKQYE9FP0zIMssJZRmN7TbXx2Uhd154GIcPIZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U4ueEOzI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U4ueEOzI"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451d5600a54so9433635e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Jun 2025 01:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748854161; x=1749458961; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ueucLa4g5UxYnhNyLx3PdzH6maubazXY/PAlY008Sxg=;
        b=U4ueEOzIRIXKSry4d0wELKdwl7ubv/gDhYAxqZ4bfrAMW6P8yB8h0jSlJyHlGSy8sX
         jz5VnOENKZVM0nFNqYLioPSrB9G2oBr4L09YcbloRxgzVFhIlZ3z4UfjqqhJyLLHVMOh
         HKIZrg4NWLU++mrpHo/Us2ZYCIQnee9V+GNuc+flqM5YJz6PQwpqp/sijKk/RzFQz2yA
         coAWFpo2c15kg8RMbSW9XWO8Y0s6edryn7cAAztwaGmLYrFYBxlNvs+Hpf5TaY4tYzb6
         HLn9ljm4+XhRbKBZN+6rfoYoB/uuFbZ8QMOoD4TcxEdFWeNgnfi1lJXpl1TqCWAclAx5
         1uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854161; x=1749458961;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ueucLa4g5UxYnhNyLx3PdzH6maubazXY/PAlY008Sxg=;
        b=GfZAPPG6pXaa4nS8AYQxATx/x7nA2cbnZLmq0YO68qeeIsPCx7S6mAH8h/K/BZBGws
         ei8djM8ih0OIMA+Vo962PJaQjdblXKsToEIxv+908J2plJi5oi0Fmn5AZ5cBMFKHmeP/
         2QCggGSO2OO0+BKTG7nsDyBDqxVTmjzhxTHtj/BytFNbtJy0Ed6K7buXxtv5xEsVYOA7
         mQGcUvr2YYAqVXMDSANUxSHbXOccqiwVk1Zdb37qbPVGsEiPt6PGiKhIQVyB2YRv1d3O
         eMoTMAx53B6LiPAfXdOrUWbGxVl7mWU9zeIngAJHGIOWlnXr4UDn0JyiHI8RAshOhlSq
         izsw==
X-Forwarded-Encrypted: i=1; AJvYcCX7ca8jAeusMrFLL37EoxGUhBUGOXo8BBmB7of8rNLNehsYRiIvRLTMe6je+GIeQurEl4HOnFVO20JCneQt8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw04lMFIAIxQTACDXyZeaLv2j5rgg9QL6lHTaSEKsL2v0U77puE
	uw1dkue4omgFWyFK39bN9GX8XS3M4WeleUPPqRBbm3sYQqU/cJRzYLLlAOCReE4PjtHS3V//znw
	qVO9+tcqU6Dat/VPc5Q==
X-Google-Smtp-Source: AGHT+IGwV2vrcxIo5Q2RpW+trCcHldsbodGUccT9zIzTeWyylvgZD3WOXAZ8PP5PISNdOCSjG3wsqrOl4ppFW6E=
X-Received: from wrqi6.prod.google.com ([2002:a5d:4386:0:b0:3a4:ef93:98fe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c8:b0:3a4:e56a:48c1 with SMTP id ffacd0b85a97d-3a4f7ab182bmr9525098f8f.55.1748854160649;
 Mon, 02 Jun 2025 01:49:20 -0700 (PDT)
Date: Mon, 2 Jun 2025 08:49:18 +0000
In-Reply-To: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250601-borrow_impls-v1-0-e1caeb428db4@nvidia.com>
Message-ID: <aD1ljiG3cFF1TS9P@google.com>
Subject: Re: [PATCH 0/4] rust: a few common Borrow/BorrowMut implementations
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jun 01, 2025 at 12:00:38PM +0900, Alexandre Courbot wrote:
> The Borrow trait has multiple uses, one of them being to store either an
> owned value or a reference to it inside a generic container. This series
> adds these implementations for `Box`, `Arc`, `Vec`, and `CString`. I
> came across the need for this while experimenting with the scatterlist
> abstraction series [1].
> 
> This series provides just the `Borrow` and `BorrowMut` implementations,
> but another common use of `Borrow` in the standard library is to use the
> borrowed type for key lookups in collections. For this to work, a few
> consistency traits (`Eq`, `Hash`, and `Ord`) need to be implemented. I
> am not sure whether we want this on kernel types as well, but please let
> me know if we do and I will add them in the next revision.
> 
> [1] https://lore.kernel.org/rust-for-linux/DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com/
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
