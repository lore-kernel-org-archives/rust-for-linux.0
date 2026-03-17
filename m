Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3E83446B7
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 06:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730204; cv=none; b=CunoA1tWtg+oSaJrCVinBL57FdiHZB4LFvoxgqEmwlFaMBm4ulj6yjPyOI/0Q/sptrFzClm2o1SHUFVqQuopLfwWlwFCSVMIpGMG6pA6jxcVVtj8ybW2b6PKcLGIRzZZHela77NXdahlWvax0cKE+fZSde/oUQePNHVYNap/pxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730204; c=relaxed/simple;
	bh=gkJ+po5fQzbwv+veCId4gGGL4Xp4wQrz+F+leY/d2+c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Syb0dkdOlDCwFYenHM9gDzGekqz+MTmRjFCNLnlqdM+THI/yYvW2Uy1we9X55Cl8ozWzJRCVLLRQxRWvagFU4Dmt0ggrkkxpyeczJCru0qF2ESyyzwWRW8xRwCGUFG2fGM4d59jiNHSdTfFP96CkgtozOfm+vPJnrH/CldrRxzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S0FNY1O2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S0FNY1O2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4853a9467c5so29962835e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 23:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773730201; x=1774335001; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxvRr8+lOBB6LohtXEdeEzhkagUanjKQw+ztADkvzGQ=;
        b=S0FNY1O2/KusRtY/z47P/iS8i0Dv3+/KwL3jcxNPOckzcbZBUx8bs8Ib4bqwec2B0r
         /9wsSewIDAOwBX7lQc5wEKUhHg0iYfk7qciFYNGDp4JnrWKdKyKtTuxfky1ZASsYdKR1
         TiRSq+8Cm1mz/vTrYVE+R18O3qX3VrRH8zKnrp7ZKz33HQa/Ljc0SGrh4ftZIknVWau5
         Tm72r452bRiy8NgwtPvOdAF83N2S++2o7aH5Yc/o3LNFhAfec931BXye9tEiK6HNKpAy
         pmc4qlmddFBFH5Fc4hHptPvZnDinVLO+nwCk4MatV20b6OUJjIi1wCp+o/LqZm95y4et
         GpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730201; x=1774335001;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxvRr8+lOBB6LohtXEdeEzhkagUanjKQw+ztADkvzGQ=;
        b=r3YrDPJ0FBxFdS9J7ZyaeGqHipIjQXqPlhHH7GbDa/NnVlgc4q4mBHzVon4Os3Wrdh
         /w2U4DU13BY7iXmB97ISukUrSy7D+UJ46bb/aYx4V1bFhSaSiCckkHzf4ZWHPIfTvhen
         Pw4lEUFtKKmix9rIkX04VxpzjXR6m5fLbGsVQeB1soJtV44LVwxny3gL+uStXVpizMq/
         E21uxpDc1HsYQHz8AN/eweV2l60qvaNHxqcFd0DKc4J2Pwoq70fH8WfctGFICvzIor0o
         2TpYN7VYLdRzDIc3KUmJaxxy8sksMaKqxWOIHFiV1jnyIi4vuldemwvd5HY3gHb7so60
         sFtg==
X-Forwarded-Encrypted: i=1; AJvYcCW/zAMaa3wTjP0whjVHuji7cKae4MjM4rT2TGsZQOV1D6V1KQSJIMySWKP/wSNVsK7NqT36n7Oujm1TzIkBXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ulFpxvu6ACXyBV6dV4GzyQhv3rbkuCOpcyBAGmemy9lWGBDY
	dBWtotO8zTd9nidBwHbCqkI1DWGSB+8TBpiO6b1HKBS+bHj8Ega/HxinM/PNL0pcD8wVPj2BwO7
	Jjf4cCZBVivssKF3sUQ==
X-Received: from wmop12.prod.google.com ([2002:a05:600c:468c:b0:485:40d2:1eb1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8519:b0:485:5812:bb9e with SMTP id 5b1f17b1804b1-4855812bbddmr300430745e9.0.1773730201517;
 Mon, 16 Mar 2026 23:50:01 -0700 (PDT)
Date: Tue, 17 Mar 2026 06:50:00 +0000
In-Reply-To: <20260303162314.94363-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org> <20260303162314.94363-3-dakr@kernel.org>
Message-ID: <abj5mOYQAY290nqY@google.com>
Subject: Re: [PATCH 2/8] rust: dma: add generalized container for types other
 than slices
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, driver-core@lists.linux.dev, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 03, 2026 at 05:22:53PM +0100, Danilo Krummrich wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Currently, `CoherentAllocation` is concecptually a DMA coherent container
> of a slice of `[T]` of runtime-checked length. Generalize it by creating
> `dma::Coherent<T>` which can hold any value of `T`.
> `Coherent::alloc_with_attrs` is implemented but not yet exposed, as I
> believe we should not expose the way to obtain an uninitialized coherent
> region.
> 
> `Coherent<[T]>` provides a `len` method instead of the previous `count()`
> method to be consistent with methods on slices.
> 
> The existing type is re-defined as a type alias of `Coherent<[T]>` to ease
> transition. Methods in use are not yet removed.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I see you have both `size()` and `len()`. I think it would be clearer to
rename `size()` to `len_bytes()`.

Otherwise LGTM.
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

