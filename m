Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BD537A3AE
	for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 13:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744624; cv=none; b=OeR/raudnWt65ulCfj8z+Lrd6QEgIbCdjaq/a0CFvw2uGYPjCkP0mPh36IXnO82SJfv2/229GQHZBi6HB8nq6ftNZviE6FcuNNMC5rF9YZfSF3dJCpaVZQZpzDW5mVmso/ixCIIAanLRaVkGN4cHUJdjknaA3pehAIQmxg6ASD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744624; c=relaxed/simple;
	bh=XAiQr+jGnheKZ1tgA1Js6rDEGPhY+PyDqsXquwJDDlQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GvBCqbJ0wcHM3n6zvZmUtZm2RXj5yqvo4Z0cygvMXpCR4IJESuxIAJZZ2sw5vNURuRLSbX4T2/GNUcXaJ5PCgzEvjj3p4hTUp40leJ7oN7T5WmF27y8Dl+PeAWT/DaJuJ1osEzuwfimKQX58WVuaVCbLjd/Po21RbQgetGu/MD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eFnj/NyK; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eFnj/NyK"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-42705afbf19so635274f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 29 Oct 2025 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761744621; x=1762349421; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G+jkmZcj3HUEZi+Sjllu9kx74GuuJMF2+KACWEHB+D4=;
        b=eFnj/NyKmef1YA3kcE8GpCIKp7s46GSRFY7ithna/lls4Zc5s90gCXT7N9g7LqTi8S
         pcFFJHbJ8vcDkcR7dN5go3aCcjsPaIiLpAGbisvwgrCET7iV9Qpn65lpabGcslqiK/1J
         3mCsXTsbzd59NL/M481i+fu1//X0NqEBmo1mnxwnMISMlsjp0MY/OT3QZF4rEVV3V8s2
         Yg+f/ZQShx34PvYOWJbxHJZntnp/SupkqtUQh8L/fxWeFXcUY9FqYeORosKrEMnR2QD2
         poL3pcuCvdtfod9jmBFROCT9qcjdRADnPgZvBsT3tUwjpMUUaxtqAR+9rJiI5wRbcHjG
         GqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744621; x=1762349421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G+jkmZcj3HUEZi+Sjllu9kx74GuuJMF2+KACWEHB+D4=;
        b=a1bmSiicT6ogjrbj2d2YiGPQX1JOaObPc2OwJ05aFXcXQWYfsyPIFXcDnm9Plzw9n9
         rIAZ2pVVkMGGJzGmBi/XCnQRyDeLZBlQlDG4CrFA2AkQPvGhiAqgycPAINLjoOFwY5FB
         R07eqGE/wen26GmxP7rnlj7xFD5c9vJ0xPvFEKruArQ5JVpwOUOw3of9gvqykXfZOc4c
         YQwraCS5fZ2MnRVRVz1+vwLID7g+l2KlgF0+WNHGvciyAKEowulJEtf50r5ym3FOt18t
         zHhYqG/NjMVMlz8t90xK8yrHf3r3lg1MIn7hyjGAtRDWbGavBZrRn8Z457QwwqIjKSgT
         EivA==
X-Forwarded-Encrypted: i=1; AJvYcCW1xnvflr4VhdvE324mIiLe5dUlehYqQak0hC3u7qy6Cs8NxP/RUUWJJIL0RU02jsuqTyIrRMS+p+1p5O+glw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTf7Su8akheaebqkhO5gRn/yZIMVgk+ZMhkyjZ1rbF9V3lzhIB
	XGBQliSsDrZPMMlQ4pdDen4EIVvdTGNWhJIRFod0FjywcfwSGvHOvjpCIuvmFaPNby7jCx2EfE9
	bOdRTOJ2p11jmqDMBtg==
X-Google-Smtp-Source: AGHT+IHBKG0u5aNOSWsmxchg/0MNcEsoaAoFQnmmwSiUY0vNrmEbu+TNSgWAVSRyc526QNDKIX3sEW3dHsMsLOA=
X-Received: from wmfu17.prod.google.com ([2002:a05:600c:1391:b0:477:1022:3342])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2313:b0:425:6fb5:2add with SMTP id ffacd0b85a97d-429a81eb864mr5926206f8f.19.1761744621237;
 Wed, 29 Oct 2025 06:30:21 -0700 (PDT)
Date: Wed, 29 Oct 2025 13:30:20 +0000
In-Reply-To: <20251028104433.334886-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251028104433.334886-1-dakr@kernel.org>
Message-ID: <aQIW7K4f1iciJRk8@google.com>
Subject: Re: [PATCH] MAINTAINERS: add Tyr to DRM DRIVERS AND COMMON
 INFRASTRUCTURE [RUST]
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Oct 28, 2025 at 11:44:27AM +0100, Danilo Krummrich wrote:
> Commit cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali
> GPUs") introduced the Tyr driver for ARM Mali GPUs, which is maintained
> through the drm-rust tree, hence add it to the corresponding entry in
> MAINTAINERS.
> 
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-next.

