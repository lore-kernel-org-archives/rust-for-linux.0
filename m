Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792424633;
	b=5aSmkI9S02QPp0M7j4RGnXKQD8JiUTSVcKIqyvKdtvdfzyGCWEjKh3vJJC+zvtM6h/jq
	 lsIqu2HT63n7OYyILPegA/mXkOCpk5jpsjyin5X+n1LwY5cjJL9qjSverwmDAIeFEgPsu
	 QFYK9qsbd+p8MroKPqJiRtrFp0x/YM7gV2YMrBLtsCa737Ih5GovdWCKWHnhi6bM+9JoI
	 WlG7cVC/FvDNEB4rCw9a5gyf3+uxCIJb2Wt+2JMWHYBR5ZPdpFlNwJ8ovfUmFbw/Wppdk
	 LPamPAwJt7FSI81pmWkhhmwvFgU97hKRoqRh4NxPu6GsZ0Ji2EXQnskOmCzGj0cwdyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
	b=q5d1b23yNKv0FYv+l6nutVcErLfGx/7dOlBK9YxoU/hNuUypyvhySFQ1gT0p0cZfFCM2
	 vpNq8k1OCtvY/FCDVGUjgVJa5qStqyXTyu1+HAQvIqHCXQaMh5pLOKoGnVwIjp6DgD+84
	 TEdSpK3wxAqHCOh167PiHQJJ+1fFG6TXyMfEsBil+kCmABQVAQvtKob50dBLQKbzCOk6c
	 PR0IrqURKnc/EkWhaSJaFsjyU3G5HsTDS3JMk09yo67ED/CpCWOsam7hhZuyLdUvsHtSX
	 pHqs3HVqyOMTQbWkUqdR4Lr3JjqhAspaI2SK2le5vH/S5JzPkDY+5YlwV6c8GKVnVGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=gfxstrand.net;
	spf=fail smtp.mailfrom=gfxstrand.net;
	dkim=pass header.d=gfxstrand-net.20251104.gappssmtp.com header.i=@gfxstrand-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=uW7KdB74;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E76E6072480
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 15:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E76E6072480
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gfxstrand.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gfxstrand.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gfxstrand-net.20251104.gappssmtp.com header.i=@gfxstrand-net.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=uW7KdB74
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so4195410c88.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 08:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792424626; cv=none;
        d=google.com; s=arc-20260327;
        b=Nl+Bt+1Mw3vefwkgPwy/OcRFECDzhBS+e3gg5SHZ/X+csA7BWC1NHy0y641vhIXoRe
         Atp5hQZAapNskEDq8Dem0reO7AJgB4HTHVjNJKfbBWB7RQxkAhWC9dZP62voIx+anRJ7
         88w0juIVmWavoYpunO5ez2uZDGQDmz5cqo7eIS11KzG/EEwP2VGxzxlKIeCxiZpWj6tO
         M/tjBH8XbU/M210MqcPMeftbfaxv8nbH/vktwD1DExZnYFORnL/sna06HROnkOAJDz3B
         dfLAC1nM1lzp50jjw/jSFZLBNbGsrYL27XEVytObe5trn1WzIQnD8Hd2QqtiWPsQqywa
         PVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
        fh=VcklD93m9+3VHTif5rvjaxKAfdnY/+LgrfntMGLdDEw=;
        b=au/uW8621Aehm84ywNzeZhcBtwOnYbYuaCjFLLjIixq4CFo810rXKEiRcwbwMC8O7+
         fVvQtunmWAJITRvsCU/MlRjDh8UHBia/7PyfAHRqjlP6li9LbNnrLtLDwijYrztUqfnM
         zig5Q0fbOYpJtUDPFkDjSPunzjOO+LrRdvj2ecPqB8flRzRs3zwie8Ozt/1207Ya7d9L
         r10jXTg3p/IY7aqUrjkFupUYBSz6VwAPHpaiCJmfymSpPWTo6HGRslbps16Nbtbrkxvn
         ps+4GGseiXWUSn/6l3ZJGCEMgHmhg5MhE+/oTMo1H6ybn29S284v+OQVXgNzt/VhKn5R
         8tcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gfxstrand-net.20251104.gappssmtp.com; s=20251104; t=1792424626; x=1793029426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
        b=uW7KdB74pZsrK3g+RhAEWGz5WwZ0ytzi8TdEmFF9CKtNXTAUIkuxmo7D6M5j4E2JBy
         4x4KBqgcWlW09mc4sOrgAhLcxSEibSywduDRRF/KpYyEEvmRUtA/usNE/YyDKZ1N0wW/
         c0i9qeKCvJLo3o8KZS6+b8Vm2z79LQvHAm9c2lcnraPMq++LC4VnGRuNsH127MUWszyw
         84Rc0ZeEHEzoDsAhA02FJraasldjUQIe4qBb4N3h8g55zdZophLrTG3N4qCfapNSgKDd
         N0PtiOp8h4fqogEBeqcAKTgC6nDBVxwvBskIGFc3rx7+jMue1GjgFQ/R+82KG83QaT5K
         0XMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424626; x=1793029426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+PJNaaQkcG0U6cvab+pi5NeILsnDidwAVp4AKHhEWI=;
        b=exMOMciSzN5V2uhGLYPk+gt2FDPC96UsvYXgluL6gFX+vNTsMQVF7rr6fIElewJuCO
         Ke7RHDHUEOirHvHZYEPz9t+J683P5OktSddqBalin7FgdaBGmQumqrxSLGl1LemhAdH+
         lUzBvOj/CrxGOH4iG59l2uhpXkLp/9ZjEF/tYl8A34XxQoCoocALwdXCNFLFyHMSt5Fc
         x523/J4FiVb68HMWloltVulwwkj+JZbG5p8IgYH/rSI2zn18nnjpoBCRHHtigYQtopfo
         VWYMe3+u2peI3s3Mnr89asQMIf0szCVBakN3SYgZJwCgNLJkDM2T2ENo9eyxmjr9mkYX
         eCMQ==
X-Gm-Message-State: AFq9FYJm1phqEgrt1bG0yxcI7aGZGYAmEcof6T8AYHGt0E4NarGGr40G
	olLenLU7RPelaX5bFzHMKMs+g2LteEEZXhz3e6jvt4tgX7qyqExx+YfDQyInHryljMw3gA2cpr9
	5ODnf2ttCyUf00WfyrA/PcmuEZ7ud8uCpzDDdJBwCIA==
X-Gm-Gg: AYBFou1AYFjM9iKra2NR6cAxz4v83j9qpqQtj5CG8p8oZxWwRcUQeDNC/6RAbBuNO8e
	wbsi7k3bgqIx+HeZNb/bcBUs9D3v+0zcdNSoMLtFoAa0R3hgk/xD3NGfgokfoRhYdznB1WBKxcC
	+FQWNMJmCbQL7L/8sXqwghQi8FevcPHtkE089qDKCd0mZH1TOV7ag0HiriwN52lEc/4BtzMjY7X
	9qizN0C+wabT7BWO7aZMvdpWQS2qJxN11YsFdmjt7tbUWBLNpPE68XKRFGflLGFSNoCKEVqsxHU
	ZyNb4JPU3sJbTmXE/Cj0WJw4rWYEItKJKmImogQWOtxnSRYjKq+I
X-Received: by 2002:a05:701b:21cd:b0:14c:be8e:69f2 with SMTP id
 a92af1059eb24-18512b3f773mr11411490c88.21.1792424625673; Mon, 19 Oct 2026
 08:43:45 -0700 (PDT)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260909064506.910162-1-apopple@nvidia.com> <20260909064506.910162-9-apopple@nvidia.com>
In-Reply-To: <20260909064506.910162-9-apopple@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Mon, 19 Oct 2026 11:43:34 -0400
X-Gm-Features: AclHuK8wgzDeroqopGem9K3ppSyG5cc3vLnnGQN2wHpX-RdNKKojDR1u5BsOoW0
Message-ID: <CAOFGe97oDdZP-XDhthZ-5tuJjuJyKxvLq9YqvWaTApZE6B8exQ@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] drm: nova: Add usable VRAM size to GPU info
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, nova-gpu <nova-gpu@lists.linux.dev>, 
	M Henning <mhenning@darkrefraction.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 2:46=E2=80=AFAM Alistair Popple <apopple@nvidia.com>=
 wrote:
>
> Add a field to the GPU info structure containing the total usable
> framebuffer size. The usable framebuffer excludes GSP carveouts and
> other protected regions, so it may differ from the BAR size and total
> physical VRAM.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Changes since v5:
>
>  - Expose the GSP static info through a NovaCoreApi::gsp_static_info()
>    accessor and read the VRAM size from it rather than adding a
>    forwarding method, as suggested by Danilo
>
> Changes since v3:
>
>  - Partially new for v4 - previously a separate scalar GETPARAM
>    parameter
> ---
>  drivers/gpu/drm/nova/file.rs          |  2 ++
>  drivers/gpu/nova-core/api.rs          |  6 ++++++
>  drivers/gpu/nova-core/gpu.rs          |  6 ++----
>  drivers/gpu/nova-core/gsp/commands.rs | 10 +++++++++-
>  include/uapi/drm/nova_drm.h           |  6 ++++++
>  5 files changed, 25 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
> index 4a65bec0fbce..d0ab3df6bcd2 100644
> --- a/drivers/gpu/drm/nova/file.rs
> +++ b/drivers/gpu/drm/nova/file.rs
> @@ -38,10 +38,12 @@ impl GpuInfo {
>      /// another documented default instead.
>      fn new(reg_data: &DrmRegData<'_>) -> Result<Self> {
>          let spec =3D reg_data.api.with(|api| api.get_ref().spec());
> +        let gsp_static_info =3D reg_data.api.with(|api| api.get_ref().gs=
p_static_info());
>
>          let info =3D uapi::drm_nova_info_gpu {
>              architecture: spec.chipset.arch() as u32,
>              chipid: spec.chipset as u32,
> +            vram_size: gsp_static_info.vram_size(),
>          };
>          Ok(Self(info))
>      }
> diff --git a/drivers/gpu/nova-core/api.rs b/drivers/gpu/nova-core/api.rs
> index 876451dcc051..64f9ea442278 100644
> --- a/drivers/gpu/nova-core/api.rs
> +++ b/drivers/gpu/nova-core/api.rs
> @@ -15,6 +15,7 @@
>  pub use crate::gpu::Spec;
>
>  use crate::gpu::Gpu;
> +use crate::gsp::commands::GetGspStaticInfoReply;
>
>  /// API handle for the auxiliary bus child drivers to interact with nova=
-core.
>  pub struct NovaCoreApi<'bound> {
> @@ -28,6 +29,11 @@ pub fn of(adev: &auxiliary::Device<Bound>) -> Result<N=
ovaCoreApiHandle<'_>> {
>          NovaCoreApiHandle::of(adev)
>      }
>
> +    /// Returns the GPU [`GetGspStaticInfoReply`].
> +    pub fn gsp_static_info(&self) -> &GetGspStaticInfoReply {
> +        &self.gpu.gsp_static_info
> +    }
> +
>      /// Returns the GPU [`Spec`].
>      pub fn spec(&self) -> &Spec {
>          &self.gpu.spec
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 91db64dcaea7..b9fba3a79b1e 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -301,7 +301,7 @@ struct GspResources<'gpu> {
>  pub(crate) struct Gpu<'gpu> {
>      pub(crate) spec: Spec,
>      /// Static GPU information as provided by the GSP.
> -    gsp_static_info: GetGspStaticInfoReply,
> +    pub(crate) gsp_static_info: GetGspStaticInfoReply,
>      /// GSP and its resources.
>      #[pin]
>      gsp_resources: GspResources<'gpu>,
> @@ -422,9 +422,7 @@ pub(crate) fn new<'a>(
>                      dev_dbg!(
>                          dev,
>                          "Total usable VRAM: {} MiB\n",
> -                        info.usable_fb_regions.iter().fold(0u64, |res, r=
egion| res
> -                            .saturating_add(region.end - region.start))
> -                            / u64::SZ_1M
> +                        info.vram_size() / u64::SZ_1M
>                      );
>                  }
>
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index ffc25fd8c47b..5c1f9d296198 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -212,7 +212,7 @@ fn init(&self) -> impl Init<Self::Command, Self::Init=
Error> {
>  }
>
>  /// The reply from the GSP to the [`GetGspStaticInfo`] command.
> -pub(crate) struct GetGspStaticInfoReply {
> +pub struct GetGspStaticInfoReply {
>      gpu_name: [u8; 64],
>      /// Usable FB (VRAM) regions for driver memory allocation.
>      pub(crate) usable_fb_regions: KVec<Range<u64>>,
> @@ -261,6 +261,14 @@ pub(crate) fn gpu_name(&self) -> core::result::Resul=
t<&str, GpuNameError> {
>              .to_str()
>              .map_err(GpuNameError::InvalidUtf8)
>      }
> +
> +    /// Returns the total usable VRAM size in bytes, i.e. the summed len=
gths of all usable FB
> +    /// regions.
> +    pub fn vram_size(&self) -> u64 {
> +        self.usable_fb_regions.iter().fold(0, |size, region| {
> +            size.saturating_add(region.end - region.start)
> +        })
> +    }
>  }
>
>  pub(crate) use fw::commands::PowerStateLevel;
> diff --git a/include/uapi/drm/nova_drm.h b/include/uapi/drm/nova_drm.h
> index 26a5e7ca5425..946bd4bf8fbd 100644
> --- a/include/uapi/drm/nova_drm.h
> +++ b/include/uapi/drm/nova_drm.h
> @@ -180,6 +180,12 @@ struct drm_nova_info_gpu {
>          * currently known chips.
>          */
>         __u32 chipid;
> +
> +       /**
> +        * @vram_size: Amount of usable FB, excluding GSP carveouts and p=
rotected
> +        * regions.

Does this also exclude the compression tag carve-out?

> +        */
> +       __u64 vram_size;
>  };
>
>  #define DRM_NOVA_GETPARAM              0x00
> --
> 2.54.0
>
