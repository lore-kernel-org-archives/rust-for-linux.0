Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B624E394469
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 08:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194099; cv=none; b=SIkjyIRhy4ZGZUmecd862+koJfUBwwKoEsP3ean7chM6iCTQmDM8mXW/mc2lEX36dwdVmYRAzYGBSk/Xh0rLfLQ/rrBfdWr1OoCH/8GuHOBYGprRBoFCEZH6gv8cee9N+b6LcOotgacnzjmSCwUCiHHrABSeIHPnQpBaM22EUkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194099; c=relaxed/simple;
	bh=S539VUjPKJOISaRuCvVzZgVIORN48iX4j7g9m1M/SUA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BPf6W7pzLFzAwUuYScr//snNdwXluioPTj+ARRCbSb6yItq0ibdnj418+I8NQVqoTCFCbrfBomlR6i6ImQeU9mqA28pq7g++e5u34cvswAp0J9xoQ+bDQd5PfM8Pkx4kvma5sGahFILyJyrA+LkCqUgQ6Pez61iAXzU1+dIdEgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gnviAn8V; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gnviAn8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770194097;
	bh=S539VUjPKJOISaRuCvVzZgVIORN48iX4j7g9m1M/SUA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gnviAn8VOpCQvAbz+CFRxQypz7qvcpfjOb2G2wJRWOh/+lMebqB5hk83JLnqsQJ1S
	 zWnIzMxhynU9qrALblyY56qJ/2A+PAGpZLX+uyw8UtzOynUioZf3UmBdjiMri6KXzN
	 eFO8yHoYxzP5ZaDzJLz8Y4hWql0BJUJBCmHSv1JvJL9oSPZDZFoGH38Xmd6W9Hjqnp
	 a1kGqR8zY1r2P29KKmhLcTchLYj/bPc5emTgX2Z/cCCDUJrNInZ39T+++IRq87Lr9P
	 B+lhlY++yuvP4guImejnwA0WodXh0P1Dbi37G1Vt8UREoI0H9IUnvo9zXV9xvw7Q8J
	 WeuPWB75z966w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BEDE117E0E90;
	Wed,  4 Feb 2026 09:34:56 +0100 (CET)
Date: Wed, 4 Feb 2026 09:34:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 daniel.almeida@collabora.com, aliceryhl@google.com
Subject: Re: [PATCH] drm/tyr: Use vertical style for imports
Message-ID: <20260204093453.1b5130d0@fedora>
In-Reply-To: <20260204013331.427210-1-deborah.brouwer@collabora.com>
References: <20260204013331.427210-1-deborah.brouwer@collabora.com>
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

On Tue,  3 Feb 2026 17:33:31 -0800
Deborah Brouwer <deborah.brouwer@collabora.com> wrote:

> Currently Tyr uses rustfmt style for imports, but the kernel uses a
> vertical layout that makes it easier to resolve conflicts and rebase.
> 
> Import guidelines are documented here:
> 	https://docs.kernel.org/rust/coding-guidelines.html#imports
> 
> Change all of Tyr's imports to use the vertical layout. This will
> ease the introduction of additional Tyr patches upstream.
> 
> There should be no functional changes in this patch.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/tyr/driver.rs | 62 ++++++++++++++++++++---------------
>  drivers/gpu/drm/tyr/file.rs   | 18 ++++++----
>  drivers/gpu/drm/tyr/gem.rs    | 13 +++++---
>  drivers/gpu/drm/tyr/gpu.rs    | 38 ++++++++++++---------
>  drivers/gpu/drm/tyr/regs.rs   | 14 +++++---
>  5 files changed, 88 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
> index 568cb89aaed8..46b65e004a15 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -1,31 +1,41 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  
> -use kernel::clk::Clk;
> -use kernel::clk::OptionalClk;
> -use kernel::device::Bound;
> -use kernel::device::Core;
> -use kernel::device::Device;
> -use kernel::devres::Devres;
> -use kernel::drm;
> -use kernel::drm::ioctl;
> -use kernel::io::poll;
> -use kernel::new_mutex;
> -use kernel::of;
> -use kernel::platform;
> -use kernel::prelude::*;
> -use kernel::regulator;
> -use kernel::regulator::Regulator;
> -use kernel::sizes::SZ_2M;
> -use kernel::sync::aref::ARef;
> -use kernel::sync::Arc;
> -use kernel::sync::Mutex;
> -use kernel::time;
> -
> -use crate::file::File;
> -use crate::gem::TyrObject;
> -use crate::gpu;
> -use crate::gpu::GpuInfo;
> -use crate::regs;
> +use kernel::{
> +    clk::{
> +        Clk,
> +        OptionalClk, //
> +    },
> +    device::{
> +        Bound,
> +        Core,
> +        Device, //
> +    },
> +    devres::Devres,
> +    drm,
> +    drm::ioctl,
> +    io::poll,
> +    new_mutex,
> +    of,
> +    platform,
> +    prelude::*,
> +    regulator,
> +    regulator::Regulator,
> +    sizes::SZ_2M,
> +    sync::{
> +        aref::ARef,
> +        Arc,
> +        Mutex, //
> +    },
> +    time, //
> +};
> +
> +use crate::{
> +    file::File,
> +    gem::TyrObject,
> +    gpu,
> +    gpu::GpuInfo,
> +    regs, //
> +};
>  
>  pub(crate) type IoMem = kernel::io::mem::IoMem<SZ_2M>;
>  
> diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
> index 0ef432947b73..48bff4476d74 100644
> --- a/drivers/gpu/drm/tyr/file.rs
> +++ b/drivers/gpu/drm/tyr/file.rs
> @@ -1,12 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  
> -use kernel::drm;
> -use kernel::prelude::*;
> -use kernel::uaccess::UserSlice;
> -use kernel::uapi;
> -
> -use crate::driver::TyrDevice;
> -use crate::TyrDriver;
> +use kernel::{
> +    drm,
> +    prelude::*,
> +    uaccess::UserSlice,
> +    uapi, //
> +};
> +
> +use crate::{
> +    driver::TyrDevice,
> +    TyrDriver, //
> +};
>  
>  #[pin_data]
>  pub(crate) struct File {}
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index 1273bf89dbd5..8f2d23e3c093 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -1,9 +1,14 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  
> -use crate::driver::TyrDevice;
> -use crate::driver::TyrDriver;
> -use kernel::drm::gem;
> -use kernel::prelude::*;
> +use kernel::{
> +    drm::gem,
> +    prelude::*, //
> +};
> +
> +use crate::driver::{
> +    TyrDevice,
> +    TyrDriver, //
> +};
>  
>  /// GEM Object inner driver data
>  #[pin_data]
> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
> index bfbf2a1d80e6..affca5b0dc6c 100644
> --- a/drivers/gpu/drm/tyr/gpu.rs
> +++ b/drivers/gpu/drm/tyr/gpu.rs
> @@ -1,20 +1,28 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  
> -use core::ops::Deref;
> -use core::ops::DerefMut;
> -use kernel::bits::genmask_u32;
> -use kernel::device::Bound;
> -use kernel::device::Device;
> -use kernel::devres::Devres;
> -use kernel::io::poll;
> -use kernel::platform;
> -use kernel::prelude::*;
> -use kernel::time::Delta;
> -use kernel::transmute::AsBytes;
> -use kernel::uapi;
> -
> -use crate::driver::IoMem;
> -use crate::regs;
> +use core::ops::{
> +    Deref,
> +    DerefMut, //
> +};
> +use kernel::{
> +    bits::genmask_u32,
> +    device::{
> +        Bound,
> +        Device, //
> +    },
> +    devres::Devres,
> +    io::poll,
> +    platform,
> +    prelude::*,
> +    time::Delta,
> +    transmute::AsBytes,
> +    uapi, //
> +};
> +
> +use crate::{
> +    driver::IoMem,
> +    regs, //
> +};
>  
>  /// Struct containing information that can be queried by userspace. This is read from
>  /// the GPU's registers.
> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
> index f46933aaa221..a7672fffbba5 100644
> --- a/drivers/gpu/drm/tyr/regs.rs
> +++ b/drivers/gpu/drm/tyr/regs.rs
> @@ -7,11 +7,15 @@
>  // does.
>  #![allow(dead_code)]
>  
> -use kernel::bits::bit_u32;
> -use kernel::device::Bound;
> -use kernel::device::Device;
> -use kernel::devres::Devres;
> -use kernel::prelude::*;
> +use kernel::{
> +    bits::bit_u32,
> +    device::{
> +        Bound,
> +        Device, //
> +    },
> +    devres::Devres,
> +    prelude::*, //
> +};
>  
>  use crate::driver::IoMem;
>  

