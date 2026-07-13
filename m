Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5930835839E
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783956948; cv=none; b=PDBuC1pdZ/ZX+tmExENlizvuMFJ7pU7J5JpyNVdYa697f4Es59iio02Ir3pFq2AGM/IdaN2rpiFHN0bxwPUx230TLenzBzuQN0WVw2bjccdZVWXEbVWWuiKWogK152m5RnG2X4zm9MOAx7B5eLPssjC+2AdsvNDC11UyMeUftuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783956948; c=relaxed/simple;
	bh=/+VDDljuUJgrqVoL7d8VkVrTcvD3lziVLdeX6XyuqXE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Eu1qHVj00etwcEQPZexH11e/wmfFYHkbpA6NVJFGzCXAK9Xh3OdIoLLkC2uFHJNEZW356UFrj65+A1cU4MCxutxvvoLkjpZSM49/sX2h65tYeoc1wrg5OZMQv97+NEtb5d0k846z7JW6lMPdQ3ZG2hs5Oe8hLmfHUmYuM6TeLD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JB1TDuKm; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JB1TDuKm"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-695f710d929so3819392a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 08:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783956943; x=1784561743; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UZgc/vupwsueMqB4x7/Q5vvpLkG8Vv1Z1ubKbDy/+14=;
        b=JB1TDuKmy9yrGojKdJaeJ5xcFyhwmxdHuV1LxT+M9XFbR6pCj+/5bbSvoykOi38mHd
         ZbEXKeaUtt2nlQoScgcBBf5tkX55KQH3tVsk215E9OEfNAB4XgkQ71U96U3qlhn706we
         QkXNBwZeZ4CT77yxHMDW3KKF8ZHnaOZ6JB4br0N0rgpK0vdl2uyR+e6GhzKJmK2b2wST
         oLbW33BpNAFTnhKhdu4VSQkXRIw0CC41UiXwE80TnvtgO5zFxm4NoenPwsSFnMrssm49
         jg+N9ZBDEnJua86v4dQnw5mFDdwqvMCkpwi6PN6qbBZ1hs2Zklf2YHAbcEKt5rcL+fqE
         08zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783956943; x=1784561743;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UZgc/vupwsueMqB4x7/Q5vvpLkG8Vv1Z1ubKbDy/+14=;
        b=PxYda/yAjx8tEGRgcaNw9O2PULMdHPPS0+G76oYRdM4NHo1NguK/SsJBAsL2zmEk4Q
         TPAE/rmq0+m1ad7WKLm3e38VfpwlE4OzjcQoVNgM2HdWQeAno5bMwJPdVvMB1sgq7nJq
         QlwcWUjD0aa+LUaqzGfYJFP1JwxitVl2Z4owjsJwOewcprwxh+P8NAb5lSFwk5xm1iNZ
         ezmBYhnZNR8O+UxwgwxZdPnr2uuatY/EcR2BzU3JePv4umizFTn5dRDeoH6ZjFaFDmB4
         9MFl6J4rmg0UljU5ddUqlpKnAb1SSo6BPgeGhYt7shPF3gCECD0ALkRHOQrve9AQIPWP
         S0tw==
X-Forwarded-Encrypted: i=1; AHgh+RrEl56lFm2FW1jfMypq74MUqA6+EDPFUfb1loZUQmoa9DryeGScvx1HMfs2EerMQjx8hsBIgYe247shgRguWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzApg/Y3qgwm1UvvndrDx454taqzDSJ4mmXJs+qgwVoGR6b1HHi
	PIguGCYTXbUqGPmW61OeJZC4Uj49s+FL6KfT+aUGgk0iH9+QvvXWiGrYz2tNBNvhrR/Ftq1Te0j
	k4P0VQrlUg+iJH8GRnA==
X-Received: from edbif2.prod.google.com ([2002:a05:6402:5d82:b0:698:bf45:cd4f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2686:b0:698:87ac:33c2 with SMTP id 4fb4d7f45d1cf-69c5ef830e2mr4273388a12.9.1783956942642;
 Mon, 13 Jul 2026 08:35:42 -0700 (PDT)
Date: Mon, 13 Jul 2026 15:35:41 +0000
In-Reply-To: <tencent_4426892E62B77DEA2AE898E899A871940005@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260707160200.2798072-1-1479826151@qq.com> <tencent_4426892E62B77DEA2AE898E899A871940005@qq.com>
Message-ID: <alUFzVNxNHlmZbMJ@google.com>
Subject: Re: [PATCH v2] rust: drm: fix GEM object pointer safety docs
From: Alice Ryhl <aliceryhl@google.com>
To: Yilin Chen <1479826151@qq.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 07, 2026 at 04:33:33PM +0000, Yilin Chen wrote:
> IntoGEMObject::from_raw() receives a pointer to struct drm_gem_object,
> not a pointer to Self. The previous documentation used Self even though
> the function argument is the embedded GEM object pointer.
> 
> However, the pointer must not be any arbitrary valid drm_gem_object. The
> implementations recover Self with container_of(), so the GEM object must
> be embedded in a valid Self instance. This patch documents that requirement
> explicitly.
> 
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yilin Chen <1479826151@qq.com>

Merged into drm-rust-next. Thanks!
