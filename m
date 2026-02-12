Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B240335083
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 11:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770894052; cv=none; b=qhc0B5rUVCeZcAB7rlU27BNnkE8HFufejkAQX+0WSzFCoBnR0ltWr0++uxW90qXiOwcE9A8msYj+z7tFo67dSMNZxoBmoUtb7TEHeirFj7+d+6sy2NkR+5wvfq8y+Ni1jk9wfnhL42FfXJhd5MY3GVy2G1eJ7HeLVKMU+kzW5Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770894052; c=relaxed/simple;
	bh=0PbOUQa0WWBfipvr845H+TKj1+G5H/zYpDWnnPdpB88=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dqj66EMhhwSile7iMYSGen6vZLoe5nDWp17sMxrDQJRy+nlRbSTQ4sVTY9i0TRW2Brbq2/xRcEenLfYFI5pgdrhUVTTmH3u8suz5CUfa35A9Ela34ZkA6dq+K11pVcs8KzJjuZEWdA8HUojcZMtg+9e7f72aE/yhXmwy1lXGLTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RPtd3jtp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RPtd3jtp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770894049;
	bh=0PbOUQa0WWBfipvr845H+TKj1+G5H/zYpDWnnPdpB88=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RPtd3jtphp1DqPTRZ/Bfj35YdnxLdjFbtF1CM5AfzYGt8rjb0wrsLqkIArGCr4hYZ
	 Tqwoyj5WWI9B3qW7M5IuGIaXKhfDnvTRx9rDEi1gOCqziqvBwNq7HYQVxo9nUpvW2K
	 IqQR94CRVE6EZZvvUAf91zxofRpEXnOR8JjlEsiKefRI850CgD3Zvy5wWfy7IbEbk+
	 TPVR1vR/hFY7h42NVVCGXC8/WxbuP8Kw56MDje3/7uy4KxzGDAnL5VQQaUaRpfHaC7
	 ID0m7C6++0vMCo1aF1V0zmEjgQ08sWAgMGPeCYaNCLw7ox7qaYKPrXYKmDr+nK6yi6
	 JXagNI11lHEDg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74BE417E1144;
	Thu, 12 Feb 2026 12:00:49 +0100 (CET)
Date: Thu, 12 Feb 2026 12:00:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 10/12] drm/tyr: add a kernel buffer object
Message-ID: <20260212120043.36a560e9@fedora>
In-Reply-To: <20260212013713.304343-11-deborah.brouwer@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
	<20260212013713.304343-11-deborah.brouwer@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Feb 2026 17:37:11 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Introduce a buffer object type (KernelBo) for internal driver allocations
> that are managed by the kernel rather than userspace.
> 
> KernelBo wraps a GEM shmem object and automatically handles GPU virtual
> address space mapping during creation and unmapping on drop. This provides
> a safe and convenient way for the driver to both allocate and clean up
> internal buffers for kernel-managed resources.
> 
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  drivers/gpu/drm/tyr/gem.rs | 74 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 70 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index 111acf33993f..3807810be7ea 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -4,6 +4,8 @@
>  //! This module provides buffer object (BO) management functionality using
>  //! DRM's GEM subsystem with shmem backing.
>  
> +use core::ops::Range;
> +
>  use kernel::{
>      drm::{
>          gem,
> @@ -11,12 +13,22 @@
>          DeviceContext, //
>      },
>      prelude::*,
> -    sync::aref::ARef, //
> +    sync::{
> +        aref::ARef,
> +        Arc,
> +        ArcBorrow, //
> +    },
>  };
>  
> -use crate::driver::{
> -    TyrDrmDevice,
> -    TyrDrmDriver, //
> +use crate::{
> +    driver::{
> +        TyrDrmDevice,
> +        TyrDrmDriver, //
> +    },
> +    vm::{
> +        Vm,
> +        VmMapFlags, //
> +    },
>  };
>  
>  /// Tyr's DriverObject type for GEM objects.
> @@ -61,3 +73,57 @@ pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: &TyrDrmDevice<Ctx>) ->
>  
>      Ok(bo)
>  }
> +
> +/// A buffer object that is owned and managed by Tyr rather than userspace.
> +pub(crate) struct KernelBo {
> +    #[expect(dead_code)]
> +    pub(crate) bo: ARef<Bo>,
> +    vm: Arc<Vm>,
> +    va_range: Range<u64>,

Missing docs for all those fields.

> +}
> +
> +impl KernelBo {
> +    /// Creates a new kernel-owned buffer object and maps it into GPU VA space.
> +    #[expect(dead_code)]
> +    pub(crate) fn new<Ctx: DeviceContext>(
> +        ddev: &TyrDrmDevice<Ctx>,
> +        vm: ArcBorrow<'_, Vm>,
> +        size: u64,
> +        va: u64,

I'm already thinking about the next step (automatic VA-range
allocation), and I'd be tempted to go directly for:

enum KernelBoVaAlloc {
	Explicit(u64),
}

so we can easily extend it with

enum KernelBoVaAlloc {
	Auto,
	Explicit(u64),
}

when we have to.

> +        flags: VmMapFlags,
> +    ) -> Result<Self> {
> +        let bo = gem::shmem::Object::<BoData>::new(
> +            ddev,
> +            size as usize,
> +            shmem::ObjectConfig {
> +                map_wc: true,
> +                parent_resv_obj: None,
> +            },
> +            BoCreateArgs { flags: 0 },
> +        )?;
> +
> +        vm.map_bo_range(&bo, 0, size, va, flags)?;
> +
> +        Ok(KernelBo {
> +            bo,
> +            vm: vm.into(),
> +            va_range: va..(va + size),
> +        })
> +    }
> +}
> +
> +impl Drop for KernelBo {
> +    fn drop(&mut self) {
> +        let va = self.va_range.start;
> +        let size = self.va_range.end - self.va_range.start;
> +
> +        if let Err(e) = self.vm.unmap_range(va, size) {
> +            pr_err!(
> +                "Failed to unmap KernelBo range {:#x}..{:#x}: {:?}\n",
> +                self.va_range.start,
> +                self.va_range.end,
> +                e
> +            );
> +        }
> +    }
> +}

