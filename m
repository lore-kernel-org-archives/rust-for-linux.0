Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF124215198
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757425183; cv=none; b=m8NL2lEPhdZz8El8gbxUl2nd2Vt5ZbMgXGOPqJVC//IifauAgbid/Qu8NX4h1B02mi3VFsrbwo4obMfg4JbxO8o12lOuWKxV0FV4jhMnNEtc13+RkprTUCMGDu0ZYpXqHBml3XbGI70LbyTmvqQo9Qh9ke3tMK5iYENZBOFIqCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757425183; c=relaxed/simple;
	bh=S2xhixjFwQUQeXlIeA6ZaWxrR0UvwXu4bKCCoaCBlPM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RFdQ+/dwmqWAMrdpkxnwSRaSiANsP6p/6+o0r7EgoriZiLUoiu+uq4mwKtTPeyzpXw1P5cheopW/gr2zwvX1FDgw0vStdqrYqRGiVfn5ys6LOvgAgSsl9zXtT5sMzwS5T7uuzAHMm4A8pMwfbEFzqOZ6Bc99m8OCjP0K02paPiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1sJVlwBB; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1sJVlwBB"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b047a0345eeso432825166b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 06:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757425180; x=1758029980; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=S/cWSKApgCqU8gCN90/R56WkIagNeujRN6OKwQyz0bk=;
        b=1sJVlwBB+ix0ydnv3ZEeppi8D2Ipc+nyFtUUBhfHunrFbN9nQ8hn67YPuBnRSi1fjE
         UX8IXHm2zgeMim3GybYl2sRThPgSWCi5MXp5dFXKZA7oOkOg34zbVwFEszT+qYOEvRVn
         /CCUje9lK7RAb/bAKnfH8Rm/b8f/pxDjHPSV08OvZHaQ+TAMXmJzyg4j/LdlCaBVZeyR
         CVGMJi15hFXNijcjXiyD8ZmAj5D1QoEyXfQjvZS2sY5+rFbIXDp4AxAbqx/4PB1CuHIV
         6uDCyYlFCLgkVDY9gaYwd0nJxTFd86jCxviJCxmSvnm8M7U2OtN+AK1IqN1Kq2lBhTfM
         uckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757425180; x=1758029980;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/cWSKApgCqU8gCN90/R56WkIagNeujRN6OKwQyz0bk=;
        b=Wyv9NXuK+K7YrgntR2eTHwx7g2FNm259bVCz+3h3Po+FfNXLlLCrave3OndBCM/mIw
         RYBlRQCPEEP3I/YxrJQQ3ZNYReumcdLncTlSguMLqjOFeWRAZbkxIF0K9WrN+OjZtp/R
         gPfnYQTsPotdGK2Z5OU03KlOTzifFy410K1bTHW9sXNF8e9vEsAi1CvlyiBKZR2oe4TT
         OExTt+e46mpFPXmcf9soo9hSTPl1Rck1w3LvOfbY3QP/tFq5ANySUczvtAHawlrGqvYs
         JW+Vji+RL4KS1K95jPzCwMllXZVVdAcdogVqa4oM2oZ+yS/LsdRnnv5n7e8maB3IOBAZ
         ZaQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn5p1qyS8/WMqEBzLs8/JcOStE77Wist/czvkxInnqH4oFr5sSrttTDQa2IHE+Zg5mTUuXY7Sp5u2zmOGonA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Cp/dW5fhWe81RRq5eNLvmFyup9LN4OmOiE9vIeZr21v9X3cC
	RUoReTjatzvjpoHgbXx1zMpb5t0VARdBRX7fmXQtO78go93hQPGxIf857Ji4eFy2VanrXqWTZFM
	/OtBC9lbAdjKQ/tZwsA==
X-Google-Smtp-Source: AGHT+IFklFVheyARxR3qqSDXvhkKe8XA6XwiuCSVTGag3JTwA8+KX1InqMPhxPHUjqN8oInLSi0RtsKFDfniBqE=
X-Received: from ejcre10.prod.google.com ([2002:a17:907:a2ca:b0:b04:4fb2:458b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:d8d:b0:b04:33a1:7f11 with SMTP id a640c23a62f3a-b04b1459913mr1134074866b.26.1757425179999;
 Tue, 09 Sep 2025 06:39:39 -0700 (PDT)
Date: Tue, 9 Sep 2025 13:39:39 +0000
In-Reply-To: <20250909-vmbo-defer-v2-1-9835d7349089@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com> <20250909-vmbo-defer-v2-1-9835d7349089@google.com>
Message-ID: <aMAuGy6Rc55mkqCW@google.com>
Subject: Re: [PATCH v2 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 09, 2025 at 01:36:22PM +0000, Alice Ryhl wrote:
> When using GPUVM in immediate mode, it is necessary to call
> drm_gpuvm_unlink() from the fence signalling critical path. However,
> unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> 
> 1. drm_gpuvm_bo_put() often requires you to take resv locks, which you
>    can't do from the fence signalling critical path.
> 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often going
>    to be unsafe to call from the fence signalling critical path.
> 
> To solve these issues, add a deferred version of drm_gpuvm_unlink() that
> adds the vm_bo to a deferred cleanup list, and then clean it up later.
> 
> The new methods take the GEMs GPUVA lock internally rather than letting
> the caller do it because it also needs to perform an operation after
> releasing the mutex again. This is to prevent freeing the GEM while
> holding the mutex (more info as comments in the patch). This means that
> the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I'm not sure if we came to a conclusion on the gpuva defer stuff on v1,
but I found a less confusing way to implement the locking. Please check
it out.

Alice
