Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982CC2459F8
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 11:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760959909; cv=none; b=oJmNYLl1DTT+lD55bNKBRgSf0CZr7hxcw1b9r4iTYQeliRi++m38pZ/m6T7lWrdRdfqKzqbthLhRddFOaZz33eFzhKksVSTMHwQGJpx74BuRYyBBJH3APieVSOhY6vcf8DEiDbtdhL8quGpvn5nbXR+UTPLaJoZTF6jtakCBV4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760959909; c=relaxed/simple;
	bh=xUL1IZfu6NSHyBPakjeeczS83pdOroPBsqx7VPP44vM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VNTjeGZ33rMjBplkWETGF1jQpXwCDGqYF9qiRR2dWsyPJ/C5re1in+Ek4+xu+lefTs542xgO6XzEl2AetUkb7xhatwV8h+95ebxMrgDHnM5CraLI0O8D5G7yxxcYAyBxE2LoYHg4+XX7MwgtDhYehPKM0LMkN+6rDH3jet/nZEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3cI9PGH0; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3cI9PGH0"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3ee888281c3so8375398f8f.3
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 04:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760959906; x=1761564706; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DMcqFZ5cAqBQM1biUtf3Krfxn1U/zGBC3gm6VwatmXg=;
        b=3cI9PGH0/F87DVw+3zkTuXopR91jijvohjU9W1/oXEP1r4XgTcKaB0BkI/GunPGKC6
         QgL2LjVjv9HdsewEnbvbeAsVpdB4drlMbj/CsOZ0iRPKfKZQMqyBa/mDo3PvB8+OQ2BN
         SIXPIy4r/h60hLB/hmbM/3A6EreftMTtQXB1tpL2Z4gcIvz2HcrSDG9t2sDEZmcQ2vTE
         3aSdvoo4rLiNLL7KNFhR64U+KHBzQUbz7TQ8/lTaiR7tievbqdRXvB81Shb0OqahdSHz
         M4EfxvMakd25HVbYvs1N6es3WcRcIC0LBx9N8hhQ2Ekubz0Ezmsb55s+lZCohlvJWTxf
         m/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959906; x=1761564706;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMcqFZ5cAqBQM1biUtf3Krfxn1U/zGBC3gm6VwatmXg=;
        b=vUzlJTc6O9FLvkS5nHDfInmsdt9/+Nxk3K7P2ON+9xBnROt+oJlp7UofDqEjxYOJGq
         z/SbASQ9XtwCwF71lylHaavbMM9UG8jhp9SiT4abnl1quMbeLhGRuVXMc9M4FNsIMYwD
         1p06zuc3zSk6KmlK7Wo/ZCtEXXodw5bJ8MoqBqxTfbOE2yz0syh6BhmQdJy59tPULe0L
         f5qeKonwegXqRDcLf/CY3ktqzDHSkGDZgTrf6T5RM/1gCevjMiILY6paubCA+vjRX3Pj
         6XuO0+w+T7wbZ37ZuDY0y5UC/dFDnlzeWZ/P3jy6kyHgPggrNp99MraZIyAR5DzYwgu9
         AGXw==
X-Forwarded-Encrypted: i=1; AJvYcCV4MPIiq/ZiTttYggmBJIAhqy7HkA2k8Kic0d/N0QulVQDKuS2c+zdA2DQm1W0UKkC1i3JuC9IYBkQ8h6CzHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSOfwNuHe0J72MwDJkyLMOCcle7kA8luUXWdeCfpps1tT8E3R+
	Fe4UNkVfxZ/cijghlALRDlZ2t0Vl5TsJt3Iem7Nh57P/NV8kjYrS1LWBQk6YVCUxDIygUIjz9L9
	xQDQ7BJ7N1lohUDsMAQ==
X-Google-Smtp-Source: AGHT+IH2Qofc6ndiBT2TBEJUwAKSdi714gdnYYSKwoeWjdLZfKMzLOYYEgFO9KCms/5i7YzVpY9EuZiKpgOsDG8=
X-Received: from wmbjx13.prod.google.com ([2002:a05:600c:578d:b0:46e:5611:ee71])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec6:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-4711787bfe8mr99039325e9.9.1760959906081;
 Mon, 20 Oct 2025 04:31:46 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:31:45 +0000
In-Reply-To: <20251006-vmbo-defer-v4-0-30cbd2c05adb@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251006-vmbo-defer-v4-0-30cbd2c05adb@google.com>
Message-ID: <aPYdoU-Fey8hBqJ_@google.com>
Subject: Re: [PATCH v4 0/2] Defer vm_bo cleanup in GPUVM with DRM_GPUVM_IMMEDIATE_MODE
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Oct 06, 2025 at 12:05:54PM +0000, Alice Ryhl wrote:
> There are two main ways that GPUVM might be used:
> 
> * staged mode, where VM_BIND ioctls update the GPUVM immediately so that
>   the GPUVM reflects the state of the VM *including* staged changes that
>   are not yet applied to the GPU's virtual address space.
> * immediate mode, where the GPUVM state is updated during run_job(),
>   i.e., in the DMA fence signalling critical path, to ensure that the
>   GPUVM and the GPU's virtual address space has the same state at all
>   times.
> 
> Currently, only Panthor uses GPUVM in immediate mode, but the Rust
> drivers Tyr and Nova will also use GPUVM in immediate mode, so it is
> worth to support both staged and immediate mode well in GPUVM. To use
> immediate mode, we must manage the vm_bos and vas during the fence
> signalling critical path.
> 
> The first part of that work was the introduction of a fence signalling
> safe mutex for the GEMs GPUVA list in commit e7fa80e2932c ("drm_gem: add
> mutex to drm_gem_object.gpuva").
> 
> This is series the second part of that work: Dropping a vm_bo object in
> the fence signalling critical path is problematic for two reasons:
> 
> * When using DRM_GPUVM_RESV_PROTECTED, you cannot remove the vm_bo from
>   the extobj/evicted lists during the fence signalling path.
> * Dropping a vm_bo could lead to the GEM object getting destroyed.
>   The requirement that GEM object cleanup is fence signalling safe is
>   dubious and likely to be violated in practice.
> 
> Panthor already has its own custom implementation of postponing vm_bo
> cleanup. Take inspiration from that by moving the logic into GPUVM, and
> adjust Panthor to use the new GPUVM logic.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Pushed to drm-rust-next.

I added this to drm-rust instead of drm-misc as a prerequisite for
another patch. If merge conflicts show up, we can do a backmerge.
