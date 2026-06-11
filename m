Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E44A375ADD
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 08:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165024; cv=none; b=MfEGjWatnglMlWcfaeQesLIZZl9aybvMFvoFPhc/ENElbGWbcJPdBhyhxueXItpQbKK9imWlpIbBH2ny8vzYKtqWWJyGPlvjwfXg18ZGsL6Sloi27mOhS9oYjLX9rJryfvT7DqUQDri08QyRMONnQvLtO+2gktjaDBe9OfeLxKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165024; c=relaxed/simple;
	bh=LWyr+rdQinIp8FqIbGsaQbKMxNF65P8QliTxrl9xuoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rLQ1ep3NuykaHf5useGAU1U982DMwb53/HI2WdCRbeTdltpH5zH+NgdWtHlIvC+ucG6UD2XIPoOW9wmfCp5Qlurtzz3VfxS3Pp9dF6raZMLhds3ypQ9aW6IwrfwnhLsWQdL9eDToJQqwn82LoXmi26RPM+1+mEduys/3y9s9R8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EunLrFy/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EunLrFy/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490b93debc8so62058975e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 01:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781165021; x=1781769821; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zn3bOdZdUuKhUFaYqBi4NI8K8WLwOEN+61v6c7A6xo=;
        b=EunLrFy/Ciezgu3s1SEPiqjiTDePflZ6Wkaul6ZdjJ86iRsL4DvWcapD/lvS+0hWq3
         ADlBwzHzr37YeqVsSqHa4m+5P1jXDc3c8Pj3w0X3BdE8jscOA4IInMN7op7WKGknqRJn
         aFcwGHA1zMoHQJj+XqZKMiRstwuF7i+CLPuY2Ct622DvatqMTIUEiOWv8IJqlrow9ied
         OHOP3u8C5WAmXY9bsgtq59vEqDj/wDHTt9gYeS9pCvTNveoXVjg2lOhE28w7r2Bkhw0Q
         3ZFsEy/R9xsEqboLQccKfA3MZnw7q+Lh5ZZFd5xtPow/KBMGqbKJulYsOt8S+qu9goKD
         9KEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781165021; x=1781769821;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zn3bOdZdUuKhUFaYqBi4NI8K8WLwOEN+61v6c7A6xo=;
        b=APM0+JxQ1Z0FtxPUSKpopV5EsgMKSVgaDvFdELT2VIQHQXClgRC5fGYOBUBOSs0ang
         rJxdzX7G/Ey9Obx2exiLSDcgtIu7p/Iv1ZXHQCfAvh0V6rHBbBnIrRo6fQ3Xp2kp8nRz
         nMeiMXSPk5gGrrrIZghMvQXdzsvsXxWe0LCAW0sfy2uSE7eS+0oCQes7QhAnWtdPwepM
         C9HF3KjMAMloiYUUURuGhaNbPWS+umjgv72urfM6EUnoxYnTbbRn3S1TQSnL76XHcTDn
         TnlanGN8MBLIPs92WN1iaZ3TMNmyzn4D9Q+bs/hvuRxJsUwlTvaZHUP/XEHdAq1Z85dF
         eljA==
X-Forwarded-Encrypted: i=1; AFNElJ9qrgJMxboiDwGk2Vc9EzmTtpkVAKND45P5mkDs27l4iE9+XfRV9TPClE/IHhGtM0duGyO9ZRXbHJpaOaHuLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfK4ELvQleNz9MHs/HvEYc05UItBma6LOoAitu0fSIWpI2RU2r
	UMZ1ukKRDVsOVb/wPhHlxovhkvhkiIcCM2pjYuzMvh+ODkt745SqNoezjml8ahWTsDmIz1zvylr
	6BbHvFSmcFHV6TcvG7w==
X-Received: from wmgf12.prod.google.com ([2002:a05:600c:154c:b0:490:adcb:7374])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:e555:20b0:490:bd66:e523 with SMTP id 5b1f17b1804b1-490e560b322mr11403345e9.20.1781165020957;
 Thu, 11 Jun 2026 01:03:40 -0700 (PDT)
Date: Thu, 11 Jun 2026 08:03:39 +0000
In-Reply-To: <20260610-gpuvm_smcontext_lifetime_bound_v1-v1-1-531e7d2ee7b4@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260610-gpuvm_smcontext_lifetime_bound_v1-v1-1-531e7d2ee7b4@collabora.com>
Message-ID: <aipr26YVZZMVKIt_@google.com>
Subject: Re: [PATCH] rust: drm: gpuvm: add SmContext lifetime bound
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, laura.nao@collabora.com, 
	samitolvanen@google.com, boris.brezillon@collabora.com
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 10, 2026 at 05:04:31PM -0700, Deborah Brouwer wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> If a DriverGpuVm implementation is lifetime-parameterized, its
> SmContext<'ctx> type may depend on lifetimes carried by that driver
> implementation. In this case, SmContext<'ctx> is only valid if the
> driver implementation outlives 'ctx.
> 
> Add a Self: 'ctx bound to DriverGpuVm::SmContext<'ctx> to express that
> requirement. Then propagate the corresponding T: 'ctx bound to the GPUVM
> state machine helper types that store T::SmContext<'ctx>.
> 
> This allows drivers to provide lifetime-parameterized implementations of
> DriverGpuVm.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  rust/kernel/drm/gpuvm/mod.rs    | 4 +++-
>  rust/kernel/drm/gpuvm/sm_ops.rs | 4 ++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
> index ae58f6f667c1..1ec649fa50ea 100644
> --- a/rust/kernel/drm/gpuvm/mod.rs
> +++ b/rust/kernel/drm/gpuvm/mod.rs
> @@ -264,7 +264,9 @@ pub trait DriverGpuVm: Sized + Send {
>      type VmBoData;
>  
>      /// The private data passed to callbacks.
> -    type SmContext<'ctx>;
> +    type SmContext<'ctx>
> +    where
> +        Self: 'ctx;

This imposes the requirement that the GpuVm private data cannot contain
any references that expire during 'ctx. Since 'ctx represents the
duration of a call to sm_map() or sm_unmap(), this seems reasonable.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
