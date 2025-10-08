Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF3E26D4C3
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928396; cv=none; b=eN2dw9MfHcRa0fwbByvxOiA4dwJij7iRjOCHbPM6CRwk0ieIh9bpyzsHHsckbNurMQEBCEyyOjbTTN7bkm4QZ/50GdIHUEnpwM6jorinoEHdTI5ZZz5IifIMMY9/2YmzOz0rSz863OQF1UfkbMPeEabNUgIJNh1gWQEdUQshOOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928396; c=relaxed/simple;
	bh=rpvnoiwVgRwtp5vtftIIzY6dMvIEVla5by01D+997ns=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q1xHjhFzHRBp+qYyf9UqI5nalhonH37PDbBDFMz09aIYeNmoRhSABlbHjCqJpj94eVTMZE+UaSsixBDiuTyaNA7WSuIPCDq9w7yzBbbs5avgG5VjXvs0km9ZOgsa4XbUWXNZa4/pfkNfN6vVc7nwzXvasQHZmfDXTtoCFIQ3+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dpRejHo/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dpRejHo/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e502a37cdso45449935e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 05:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759928393; x=1760533193; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=R/gB/5AyaPSdIrAxreQ3UUV2P7u+LQ2v1uTWQNbCwJQ=;
        b=dpRejHo/mzII+Oob0KBLVp4UFi/iy+ErDgbo+ic76LeBOdDXnMS2W1MWoMfOitj9wg
         HC7MnjTNSqoGco4KuhjfxCTmZm6AhQv5Xm6C0piTXPeNPF6+HzOOZ+sc6+ucD5h+F6s2
         nmltKcy4Eklg8XefgQAvQhf9M0LscTIJjmRgoQ3Ied9q9YzSUefhhFrX3uzvQPOv0Hu8
         lzE2CPlXyFykkE0UnTfadBla4OE+x6Wz4yxtUMCfuWdExOsr2pCNhlD/P7Dad8SykF0z
         4WjgR9mKOUcY/7aUWE39ZWu3m8HqWR3llgku8HvP0ExosKr1ehicjPcMNDWakd3pXBt+
         3Rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759928393; x=1760533193;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/gB/5AyaPSdIrAxreQ3UUV2P7u+LQ2v1uTWQNbCwJQ=;
        b=pXuxQ1EKbA1GKh2Njpyw+sc7a2IsHNNNWOZusfzLWlYd0NE6+BFYQudIgVX+Q7xa36
         WzY1QzCRfMY3Bsa/RL+2DHiNdAfW7sDPAF9YFw24GbB9pRPipqddSE6CEsYXzC1I8u18
         yyJqWY9EbPUiMKle9xuGQx5HuV79+Wh+Zt6M2Qdd0PSxbl0H1ZcUoVGe05sWjqHdWTpn
         b//TkGSE2v6/VkVOK1PWnuUYA9/EcMV37ncNAYENoM9YD6kNXSVtqcYZAc+QS8BWS8mL
         KhBP61KWC4x7+p8U0vvCccWAU6LkGQvYVWjhD+oEain4V2gT4EqmEYrNyYhQJEUxT9tq
         dYww==
X-Forwarded-Encrypted: i=1; AJvYcCVSnzW+BwbpwicYn/eeMu0nJIQMOn2hECPWVQ7JLFmw7YIttxEvDNWcWuKcASk2Ju1WGLShmtBHX3w3rwTqMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRX4izcP9NMGRYL7zvl5wGfISZ9a3jR+0qUXZ1OVFdncBncIdO
	0rydhqAGgX/vUd2Sb3VeMdAta7NVpCJ4WP2IILOHpyLRjrwdsJuSf16pFOeALDvNJUGbY5SL2Lk
	Vtll3FrSuEFK+5sn0bg==
X-Google-Smtp-Source: AGHT+IHzaS5ipgkkAY1+ObaRaQ9zgsFXNgdU7+XqYJiEUNYrRwbKTaDYoUOFMMqh18xBSjuEhXUBg0G2wiNXGC0=
X-Received: from wmvw6.prod.google.com ([2002:a05:600d:42c6:b0:46f:aa50:d703])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8718:b0:46e:731b:db0f with SMTP id 5b1f17b1804b1-46fa9b08f09mr20915055e9.28.1759928392960;
 Wed, 08 Oct 2025 05:59:52 -0700 (PDT)
Date: Wed, 8 Oct 2025 12:59:51 +0000
In-Reply-To: <20250908160224.376634-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250908160224.376634-1-marco.crivellari@suse.com> <20250908160224.376634-2-marco.crivellari@suse.com>
Message-ID: <aOZgR7X5ZyXZh_jc@google.com>
Subject: Re: [PATCH v2 1/2] rust: replace use of system_unbound_wq with system_dfl_wq
From: Alice Ryhl <aliceryhl@google.com>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Sep 08, 2025 at 06:02:23PM +0200, Marco Crivellari wrote:
> Currently if a user enqueue a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistentcy cannot be addressed without refactoring the API.
> 
> system_unbound_wq should be the default workqueue so as not to enforce
> locality constraints for random work whenever it's not required.
> 
> Adding system_dfl_wq to encourage its use when unbound work should be used.
> 
> The old system_unbound_wq will be kept for a few release cycles.
> 
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  rust/kernel/workqueue.rs | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index f98bd02b838f..01e331a1f11b 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -667,11 +667,18 @@ pub fn system_long() -> &'static Queue {
>  /// Workers are not bound to any specific CPU, not concurrency managed, and all queued work items
>  /// are executed immediately as long as `max_active` limit is not reached and resources are
>  /// available.
> +///
> +/// Note: `system_unbound_wq` will be removed in a future release cycle. Use [`system_dfl_wq`] instead.
>  pub fn system_unbound() -> &'static Queue {
>      // SAFETY: `system_unbound_wq` is a C global, always available.
>      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
>  }
>  
> +pub fn system_dfl() -> &'static Queue {
> +    // SAFETY: `system_dfl_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> +}

Please add documentation to the new methods, similar to the
documentation that existing methods already have.

Alice
