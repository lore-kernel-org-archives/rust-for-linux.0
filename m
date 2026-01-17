Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3BE18E1F
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 12:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768652465; cv=none; b=Ytn2nQQbPDJti+r00/ZkLsD/Nu2SfyyNgYujF/i/vsd8mrkC8rRDxkPp0Ys/KSErGn5uYxO5th/pJzgHUwFFYJM/UC0PcYGaiIiy8ITxlLZCwZk5gsbyGsB2v/M5KxaEn6CxDwPAW9+393+mvHjBflMchziwsUDPzhFYt6MlwkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768652465; c=relaxed/simple;
	bh=aTKgDt63RyfhxxV4HEUKvM9YGl8WmNS/R2HSy/ldFSo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=HHk9FgG09QLdEzlXH6GLw31UWAplOiDrXqo0y+BB2HvqACkFIuZfX2jyJ2DTU3szsS28D4xL2X+yzrhz67rG/BrweK4QgAn/y2lU1SkgU9Gi4seQpVwrFdijNCKWvZp8kKLuDFvaJLQ9yrPthZU7/ScSYUMH9OYbJpEuJpr5nSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjlY7aZK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjlY7aZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D6EC4CEF7;
	Sat, 17 Jan 2026 12:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768652465;
	bh=aTKgDt63RyfhxxV4HEUKvM9YGl8WmNS/R2HSy/ldFSo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=BjlY7aZKzPmlIHTKY75wC43f0NCqxcl+Z0PZ6VPtcQ5iy+Lki2wglc8SOAZlmLAeF
	 az/0tGtq4RonUAC8r1bIEedl8wkK/HLIaatIS2LagSTVdttLpdZ797JfzOA/YrmV0+
	 nU5eAZYYueh4B18cPJTc31gBgGnaFSH0twPWowY+Vg976mjSYiXtbWOq6Vtn6Clm4W
	 RYDcXpr8KeGpTqF6Bf85zMiSm4m0RrtLq5ixSXPXRjXz4lv9/9hOpAZwsDb/GrFdg+
	 I64c0SRDo6rf2jLlqhGECa1JG7z4MdJu2NgIaxpm4gEKVeKSUdy8VzlsZABCaxXO8B
	 ZD2szie8uccKA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 13:21:02 +0100
Message-Id: <DFQUZ0DA9LJ5.2194XUZDLF0T2@kernel.org>
Subject: Re: [PATCH v5 8/8] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Cc: "Matthew Maurer" <mmaurer@google.com>, "Gary Guo" <gary@garyguo.net>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-9-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-9-ttabi@nvidia.com>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
> are the three primary printf logging buffers from GSP-RM.  LOGPMU will
> be added at a later date, as it requires it support for its RPC message
> first.
>
> This patch uses the `pin_init_scope` feature to create the entries.
> `pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
> reference by delaying its acquisition until the time the entry is
> actually initialized.
>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp.rs | 45 +++++++++++++++++++++++++++++-------
>  1 file changed, 37 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 273327c33aa7..4b194bb805b4 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -3,6 +3,7 @@
>  mod boot;
> =20
>  use kernel::{
> +    c_str,
>      debugfs,
>      device,
>      dma::{
> @@ -101,17 +102,24 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>      }
>  }
> =20
> -/// GSP runtime data.
> -#[pin_data]
> -pub(crate) struct Gsp {
> -    /// Libos arguments.
> -    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +/// Log buffers used by GSP-RM for debug logging.
> +struct LogBuffers {
>      /// Init log buffer.
>      loginit: LogBuffer,
>      /// Interrupts log buffer.
>      logintr: LogBuffer,
>      /// RM log buffer.
>      logrm: LogBuffer,
> +}
> +
> +/// GSP runtime data.
> +#[pin_data]
> +pub(crate) struct Gsp {
> +    /// Libos arguments.
> +    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +    /// Log buffers, optionally exposed via debugfs.
> +    #[pin]
> +    logs: debugfs::Scope<LogBuffers>,
>      /// Command queue.
>      pub(crate) cmdq: Cmdq,
>      /// RM arguments.
> @@ -163,15 +171,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>=
) -> impl PinInit<Self, Error
>          pin_init::pin_init_scope(move || {
>              let dev =3D pdev.as_ref();
> =20
> +            // Create log buffers before try_pin_init! so they're access=
ible throughout
> +            let loginit =3D LogBuffer::new(dev)?;
> +            let logintr =3D LogBuffer::new(dev)?;
> +            let logrm =3D LogBuffer::new(dev)?;
> +
>              Ok(try_pin_init!(Self {
>                  libos: CoherentAllocation::<LibosMemoryRegionInitArgumen=
t>::alloc_coherent(
>                      dev,
>                      GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgum=
ent>(),
>                      GFP_KERNEL | __GFP_ZERO,
>                  )?,
> -                loginit: LogBuffer::new(dev)?,
> -                logintr: LogBuffer::new(dev)?,
> -                logrm: LogBuffer::new(dev)?,
>                  cmdq: Cmdq::new(dev)?,
>                  rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_=
coherent(
>                      dev,
> @@ -192,6 +202,25 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>)=
 -> impl PinInit<Self, Error
>                      dma_write!(rmargs[0] =3D fw::GspArgumentsCached::new=
(cmdq))?;
>                      dma_write!(libos[3] =3D LibosMemoryRegionInitArgumen=
t::new("RMARGS", rmargs))?;
>                  },
> +                logs <- {
> +                    let log_buffers =3D LogBuffers {
> +                        loginit,
> +                        logintr,
> +                        logrm,
> +                    };
> +
> +                    #[allow(static_mut_refs)]
> +                    // SAFETY: `DEBUGFS_ROOT` is never modified after in=
itialization, so it is
> +                    // safe to create a shared reference to it.

Well, it is modified in module_exit(), so you have to justify why this can'=
t
race with module_exit(). I.e. because you drop the driver registration firs=
t.

You also have to say that the debugfs dir is created before the driver
registration.

> +                    let debugfs_root =3D unsafe { crate::DEBUGFS_ROOT.as=
_ref() }
> +                        .unwrap_or_else(|| debugfs::Dir::empty());
> +
> +                    debugfs_root.scope(log_buffers, dev.name(), |logs, d=
ir| {
> +                        dir.read_binary_file(c_str!("loginit"), &logs.lo=
ginit);
> +                        dir.read_binary_file(c_str!("logintr"), &logs.lo=
gintr);
> +                        dir.read_binary_file(c_str!("logrm"), &logs.logr=
m);
> +                    })
> +                },
>              }))
>          })
>      }
> --=20
> 2.52.0

