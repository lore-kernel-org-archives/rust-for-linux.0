Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683FB20C488
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487614; cv=none; b=SfxdpriKTnvh5n2XBg79OQCMyMEp9LNfgr452AaxLm5bDH6ArzZ9+gc/0bCNZg7/68LYBcRlVpVY14ecxzHHgcMCj88eBgem81onFUOqP1uLMSc8wCVuZ2pMA7kR2HOWhU/mhTnHJJNTWnjAup12tuh4kAJzkeqRS9vq6IvehAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487614; c=relaxed/simple;
	bh=EbAVsutZ4/CI+HCfykwP2ZtRrEpwXEp3p1I/xrTWTc4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=au04vvrByILwttNmADCDFAZD5LYptYFpPrpGsa2ZqinABcBgC3EcaN/hyKyO16a1PfybzB0cYcCiVID/gaz0VkJ/3NKLeY/CygqCCVAIpbrISqB/ZKn8QMxZj2AIsCBukse4WKZJrFMyQktU3Sdnu4iqDxicWGuzgUBr8yL9A98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2EoRCqTa; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2EoRCqTa"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-429c5f1e9faso4691222f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Nov 2025 09:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763487610; x=1764092410; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oIKqnM89Ca9fsCwIEjPeKxSYjca9/TasXeedgFij2CE=;
        b=2EoRCqTa8p6rFcamgMxvd3XRYKYjK1FTrqG7Qu5tM8TUnWTQhWsQnw/x+fm7swa32m
         iFRVhPJv+REk8R2GxdwDkVnTY+c0t/UIg/eMO+lGQvbgtE6Pxsry6bOLF4uHurIsUL7b
         klNE9GEZuCrAb9iIFS6As9d2/Gmee4HSOnqxQJPJsyJIYs2Cic9ZjEuWh8EZpiIcRmTc
         2oh6/N6hpdjwl3QqTXrtJ9gaRXeK+xaNiRWhVCpkMazgW5AOJqPQRWAbLFpY4R3+fWzn
         VD+Gi1ebmxUHAwjWWlJrfgz8i4oABZrD5VQ9NQUgHEFhHYDYK3+vDDkVanwnopOw0m6R
         nN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487610; x=1764092410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIKqnM89Ca9fsCwIEjPeKxSYjca9/TasXeedgFij2CE=;
        b=a/KxgLGTp53VKwWZs0oyX3b7WqD0Fq3XaYMOk62FLqsaySfpyzwaESxrESH31WIIph
         vwwCx/DE6NtNPPQfKk1UKF5GH0uiQrShMeKpOcsVYpLYHr5vfr/BajSqwb97SKscT7W7
         zkES0pwNjHp8vxLmefe4i8hghtrOC3C7iA/RuoDLLs0Ddj7lCZFGDdcQHLCCJFnyPYv0
         Si/BVUvBAH+b/PB0OIDwM/U+W/5KqIXvpAjVTNz76kaPRVzp/axS0J1D+SDqe3ebitom
         DiY2sMM1uk0Up9nYSsZtTYROcO3j5fKQWRTB5Lo2GqwKzRmlvnNQ838m0ybZIafTak+W
         KrmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4MpOnJE5meiUGNDIhXGxrgJ55fKJBzUX35beSYR+oVF5qja7ILAlPk1dy+XRfz+YFt551KIT5SeWi/qnpmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUoAiBrCwz9h5eIs8+8fVnskKOwLTFfWVIdiL/l9uPc4Gd13Oj
	1Eg6dei6tU98HsCcLA7/wz02oTk4JwWej8iOCpaM1fP5XyaxI0j6PYIxtu6Sr3QJ/cpzg6dUMcz
	M7zhtCC1t6MjxHkUWhw==
X-Google-Smtp-Source: AGHT+IEHeik75eoi/A2H7+tYYancP1fMfuFhyBamntfcaIVcUJMOEBQ333aershlL0m0QVpCjbFszJns5o8eDfc=
X-Received: from wrdk18.prod.google.com ([2002:adf:b352:0:b0:429:de3f:8272])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4020:b0:429:ca7f:8d70 with SMTP id ffacd0b85a97d-42b593424dcmr17733431f8f.15.1763487609673;
 Tue, 18 Nov 2025 09:40:09 -0800 (PST)
Date: Tue, 18 Nov 2025 17:40:09 +0000
In-Reply-To: <20251118173250.2821388-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251118091818.152ba4fc0c8a6f3092a36fbc@linux-foundation.org> <20251118173250.2821388-1-aliceryhl@google.com>
Message-ID: <aRyveY9Kdea9rhwe@google.com>
Subject: Re: [PATCH] uaccess: gate _copy_[to|from]_user on !INLINE_COPY_FROM_USER
From: Alice Ryhl <aliceryhl@google.com>
To: akpm@linux-foundation.org
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, arnd@arndb.de, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	gary@garyguo.net, jhubbard@nvidia.com, linux-kernel@vger.kernel.org, 
	lossin@kernel.org, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, yury.norov@gmail.com
Content-Type: text/plain; charset="utf-8"

On Tue, Nov 18, 2025 at 05:32:50PM +0000, Alice Ryhl wrote:
> +#ifndef INLINE_COPY_FROM_USER
>  extern __must_check unsigned long
>  _copy_to_user(void __user *, const void *, unsigned long);
> +#endif

Err ... this one should be INLINE_COPY_TO_USER.

Alice
