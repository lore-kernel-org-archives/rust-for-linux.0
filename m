Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46F7366816
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 08:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340437; cv=none; b=j9T3m8KhWIAzjeiJk/VDY0Rd0PjeVMNTg9v/RLOueORh+6kduxKKBM7G3MuhPWo7MhmV8X/XPxhHUlIhYiK2Ebr+j7Q8/7tAvPXKteKUPu18FN8kjhFGcxyTQe2+aeCT9mkzg878EAK0XbGFvU/COUrQ4bA+LYniAFgbJtlLCG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340437; c=relaxed/simple;
	bh=sRfq9wJk0/MXbTZzaFK1SbHdbY4bWli4oNxRjSHJkJo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uGbRvcTIVW1HisASBikNhfQwNHCoBGyJnWZeOL0yPVFBCkt6tTJ7I+5HsQewoDv6h/8NeggjXIiFUWyll9ULwv6qviDLzO1AE6qpaDVeFrvGmQ8755NRKEqD/gKebiLdkY2WRVIJu0Aj0aBxkQD8fi46iadtb9vVWDIGZq8/bQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T0l5Qq/p; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T0l5Qq/p"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48532df52c5so15167045e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Mar 2026 01:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774340430; x=1774945230; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmKn3DTyzERwdlhCSakIzT6UnoUWWIujEFwhVV176J8=;
        b=T0l5Qq/pilKJvFuS4rdx+qa2ksp/WxiKN9ReJegv1TpphrqppSwDml44VbTFsUfLsX
         l0muCeVZH+IZd+E/FGrSqDilxaXQb6uYnQI24UXWaJtE3/m4Y2AChqs0Ai6G1e96MHfF
         Gn0OPho0MzeQSUB0In94zntEPxDkMmOwYJLLXuzV2FSUWdL2JTv+7cbJqH5AFzCi2FKK
         oKbfm3U60PSj6czc1FOOipHVmA61fOjYXgiJEg6OObEfzgW4shwl10QRxtC/H0oiaVBP
         734hk6U9vUIRVA0u5pcvaRzJBNO3IT1+/4KbgwwZsYXf0Zzj+82gNIAkWKWNs71DQXMt
         z6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774340430; x=1774945230;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rmKn3DTyzERwdlhCSakIzT6UnoUWWIujEFwhVV176J8=;
        b=Ly6+C0mI4OyAxwv4+PkNmS4KwZnADUNq3GOtHlWaHFgksMFoFHud+AIcuhu31L2dBv
         QFaOQE+20fFuNLRSthSaBCWQZaYvYnz6Bph728LbULTN+UyFB10v1Pw7tSAZ0Gx32Euk
         4e6hWYgDXa2udMl/yRavJHA2WuACNcI3mT7wHubA4+5GJDYpekMYRG0aALYPinTKo3r1
         RTbACDTCdQb15+R3vQoIvQOMfT7pX8cE9Pv/8esYvjZXxvOrsYyaqicXJwc/nuVnvL8y
         Pv3VdKfBEjairQDNH7u/j3jZZZybdjxuiUZ/e7hRoy/sm6wDo8uODenvDq9xLjxxOD3N
         CKIA==
X-Forwarded-Encrypted: i=1; AJvYcCVmrFiHQ07LJ7nGXEn++TGOC4OuQ4gJ2Z+EVrf9McsSLf+EUNJd5pO5JYwlcT5iVZ3qFT4xGBwSbQMr4OV4OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNcNod6LvBFfrH/ilkmNACcEhSsnkdIuiZQRPRFDmn+viclgaU
	bbQMz6euU0SaD71f021qYDo509VknzrFXyfNstCuuqCVO8uheTHVoRN2GXdw+Y+hgXeA5bwx59o
	fqKHzSB1FGgejsanllg==
X-Received: from wmsu11-n1.prod.google.com ([2002:a05:600c:c3cb:10b0:487:1c3:7963])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1615:b0:487:18c:7acf with SMTP id 5b1f17b1804b1-487018c7d7fmr119524405e9.25.1774340429538;
 Tue, 24 Mar 2026 01:20:29 -0700 (PDT)
Date: Tue, 24 Mar 2026 08:20:27 +0000
In-Reply-To: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260323-aref-workitem-v3-0-f59729b812aa@collabora.com>
Message-ID: <acJJS-vz6YHDw-iC@google.com>
Subject: Re: [PATCH v3 0/4] rust: Add ARef support for work items
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, Tejun Heo <tj@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 23, 2026 at 08:26:58PM -0300, Daniel Almeida wrote:
> This series adds ARef<T> support for both regular and delayed work items.
> 
> - Patches 1 and 3 actually implement the support in workqueue.rs
> - Patches 2 and 4 adds a corresponding implementation in drm::Device that
>   dispatches the calls to the underlying T::Data.
> 
> This was tested on Tyr, and is actually needed in order to obtain a
> &drm::Device when handling work items. This is then needed in order to
> allocate GEM objects inside the work handler that processes the tiler OOM
> (out of memory) events. The current series sets the stage so that the above
> is possible in the future.
> 
> ---
> Changes in v3:
> - Rebase on rust-drm
> - Pick up tags
> - Fix import style for drm/device.rs changes
> - Link to v2: https://lore.kernel.org/r/20260204-aref-workitem-v2-0-bec25b012d2a@collabora.com

Thanks!

Tejun, is this something you could pick up? If so, please go ahead. It
looks good from Rust perspective. We can also pick it up through drm if
you prefer (in that case please provide an Acked-by).

Alice
