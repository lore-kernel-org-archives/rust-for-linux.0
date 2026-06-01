Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7383231326F
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306509; cv=none; b=ZBbra7hhL31bb87OQHvaKDf0DRyNN3PIg3zsLR9P15hv1z/veB/s5e0TktcED+jShmA7d+qXtrcT2kkUEWleO0NqC5BwKlO45WwJk3HTHy4johKo6I22tIprJ1SYM2Vkgfbva3CJwi6atJXW7Vge+SilHEdjcgmhd8xIPK/romA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306509; c=relaxed/simple;
	bh=ZiIEhhJBaK7s8fS7InwgeMADoozO9RyGFo5JhMTkZmQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=f9axi6bNy+3aAjFrWXVf6SsX9Pmumlv58VxvAGrog0YPoJ0j1XBV4kxlwHh2kbEaA8Z9X/1sc/YvLufaAAldi9XxVxaLSQrYiagpD6BNuuEkT/Nuw+arjDfBQ67tOtsTUg0ioBdFjy0W23Ls5Zt2AdUSHo8wG68ZzpXa2Ps4vI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eMSBWrmF; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eMSBWrmF"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-49045243094so124059825e9.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Jun 2026 02:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780306507; x=1780911307; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzoIJLJjC7gwyV4Qyenrvhg4O6REcPg+RlZKz2lhFlI=;
        b=eMSBWrmFH8igKPnVhTuy9TFZ1MlfEZ1SvOnBpPufcGLX7U+63ARm9qedbr+itY9xYO
         iXCgVrCE9QgHtkjmyrevu9ivak0fysiNZEGNaDm8nGasIata8mH0DMPFn4KgG/nOaeQ0
         kvAcQIUxOX78iJ9vpHLQIBwN4tFSlUINtsYIqZPkOptwHs+FXnxEkHNypmebi2C8htIh
         RDgrmnlZ3kGcfiS2K3C0eJ8WfZN6XkX7983VIgJ8w9kRW15JFFZa+664ZvmABbqt2I9R
         4Zn/BnRS4fCJBqNuqkqCtfmrx9JUR4HpUx9jx402IcQUmWgQUjMEJROv0F0A+PnNK5q+
         DMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780306507; x=1780911307;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzoIJLJjC7gwyV4Qyenrvhg4O6REcPg+RlZKz2lhFlI=;
        b=n1NtFKBZu+Xl5vjd2agEncFYJpl78eonKvbY2DjsWNLn0mFyfXf151mOE9bDPTo9ZF
         p8lvDeb5XefCQtgf+ICI1D7ghmNZ1hxyIKrxK8+K83mBPWKYktkPi0BO6faGQvZisVl2
         d4h/BCaeFVdcftbS+NuZHrryXaEvq59JxpbooCGB2GJ23XvvirseQDbSYy/xXPSgxG62
         yh1gd+akwnpZiX9CUlHQCrH8AD6bKYcjY916518awC/aN4Bff1+MsyasSsdt/yPCNTFX
         9D/lKZ9y1BtQc1ow614kYfhST71IXj2QviAe0SvZY+tHhA/y6a8dLCcejQLBqtD7tR6O
         3EYg==
X-Forwarded-Encrypted: i=1; AFNElJ/27HUaR1lSJw+ohC0ntOEu88d1QF7SZhKyf7GpKi+3oObl8SVYmpzIzA4Svfew8L1qacaC94hIUx7iNN941A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaeKL1lyRYEEPA8AlzBcd2j/8Zb9L7nf/HU/5FVuFWQrLzQlxI
	JMsIRlXJZib50qt+wpzO53YU0vN20HxYOTscw32DIolnL0hxGuYGRwXqAMbpvuEncOWrNrYiLKm
	tXiroTY/ou/QSEoPwZA==
X-Received: from wmog6.prod.google.com ([2002:a05:600c:3106:b0:488:890d:75d7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:430a:b0:490:482c:4391 with SMTP id 5b1f17b1804b1-490a2960885mr112155905e9.23.1780306506184;
 Mon, 01 Jun 2026 02:35:06 -0700 (PDT)
Date: Mon, 1 Jun 2026 09:35:04 +0000
In-Reply-To: <20260529000106.2257996-3-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260529000106.2257996-1-dakr@kernel.org> <20260529000106.2257996-3-dakr@kernel.org>
Message-ID: <ah1SSN8_dCEA4Osz@google.com>
Subject: Re: [PATCH v2 2/2] drm/tyr: use IoMem directly instead of Devres
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	deborah.brouwer@collabora.com, gary@garyguo.net, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Eliot Courtney <ecourtney@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="utf-8"

On Fri, May 29, 2026 at 02:00:54AM +0200, Danilo Krummrich wrote:
> Now that IoMem is lifetime-parameterized, use it directly in probe
> rather than wrapping it in Devres and Arc. The I/O memory mapping is
> only used during probe and not stored in driver data, so device-managed
> revocation is unnecessary.
> 
> This removes the Devres access(dev) pattern from issue_soft_reset(),
> GpuInfo::new(), and l2_power_on(), simplifying register access.
> 
> Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

> -pub(crate) type IoMem = kernel::io::mem::IoMem<'static, SZ_2M>;
> +pub(crate) type IoMem<'a> = kernel::io::mem::IoMem<'a, SZ_2M>;

It'd make more sense for me to put 'b or 'bound here.

>          let sram_regulator = Regulator::<regulator::Enabled>::get(pdev.as_ref(), c"sram")?;
>  
>          let request = pdev.io_request_by_index(0).ok_or(ENODEV)?;
> -        let iomem = Arc::new(request.iomap_sized::<SZ_2M>()?.into_devres()?, GFP_KERNEL)?;
> +        let iomem = request.iomap_sized::<SZ_2M>()?;
>  
>          issue_soft_reset(pdev.as_ref(), &iomem)?;
>          gpu::l2_power_on(pdev.as_ref(), &iomem)?;
>  
> -        let gpu_info = GpuInfo::new(pdev.as_ref(), &iomem)?;
> +        let gpu_info = GpuInfo::new(&iomem);


While this change is fine, I notice that we don't actually keep the
iomem alive past the probe method. I assume we're going to need that,
which leads to the question of whether we can store the iomem in the
places we need it.

As far as I can tell, we can store it in TyrPlatformDriverData but not
in TyrDrmDeviceData, is that right?

I guess it does make sense because the io memory goes away if the
underlying platform device (the bus) goes away, even if the drm device
still exists due to open fds from userspace.

Alice
