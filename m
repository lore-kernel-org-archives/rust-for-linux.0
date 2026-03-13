Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A3D3C3459;
	Fri, 13 Mar 2026 16:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417815; cv=none; b=BBwpWWr4RLXFhryAO66mVkSyXbPME7y/RD+/YQ4c8ZEIFwYijOf7C6TYAOTJKIZuR39TJWzaHkk8GdOEsMPpFGtQ2gVdPianNFOQDLFIRYY5KwGV+K6wV2MrIHjIc9XyMmhtmjoBRXid6TpdAkiiFunTkFelBx+elxROf/hS8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417815; c=relaxed/simple;
	bh=cg1vFT+iX7JKWcsxMXDIzCBib8TC17gmgwUUcuBGetc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=O8mNT7rcWSuZ7yXFJuPLCBJu+brgW60UP+DGEAkgRSiJ+O/WK7b7QMNe8iU8FYeDaOfBebx0bU2+HxFgDnF6km9CUX/RfO1e89zBXIWwDOy3kejt2Fzf2ifrUENmpLU76EHIUfkYJDniiO2gDtvW+QBYXBS+JHDmWtK+cWCMLgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiMA5d9h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiMA5d9h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526CAC19421;
	Fri, 13 Mar 2026 16:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773417815;
	bh=cg1vFT+iX7JKWcsxMXDIzCBib8TC17gmgwUUcuBGetc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uiMA5d9huWtpWmvfnZ7YnPLE5udgFhQagbi2tWsVJd7vEYBLaujV58eYknhwqSxfj
	 cEUX86iG7SyXJ/I2VuC0weLTt1CBLWhyX3zRIMhhiiIIOuHGtWqZMIMkhuSccq7poN
	 NE5PSITTuA1UMbVy2sRxhEcKyphfRq+/R1Nzzz0hDDIJe4sthzzG7HuZ/dYYMW3lfW
	 aocJRSC0M7EN2NxOwipim8LdRCIHN2X3Mw/RGSB4QTf9ilIcxb/NmrGsPcoxaWAydR
	 jTWQKAnw88slDyOFlJKq/Rg0HJ8znyGx70YX9JssYR/FkwWYOVgrHf+qk753wRKjhh
	 43Gze5ZJ4utvw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 17:03:28 +0100
Message-Id: <DH1S5A8YOFJZ.5D7A45BB4IAT@kernel.org>
Subject: Re: [PATCH 2/2] gpu: nova-core: add fwctl driver for firmware
 control interface
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <jgg@nvidia.com>, <gary@garyguo.net>, <joelagnelf@nvidia.com>,
 <aliceryhl@google.com>, <bhelgaas@google.com>, <kwilczynski@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <markus.probst@posteo.de>, <helgaas@kernel.org>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <acourbot@nvidia.com>, <jhubbard@nvidia.com>, <zhiwang@kernel.org>,
 <daniel.almeida@collabora.com>
To: "Zhi Wang" <zhiw@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260305190936.398590-1-zhiw@nvidia.com>
 <20260305190936.398590-3-zhiw@nvidia.com>
In-Reply-To: <20260305190936.398590-3-zhiw@nvidia.com>

On Thu Mar 5, 2026 at 8:09 PM CET, Zhi Wang wrote:
> +use kernel::{
> +    fwctl::{
> +        self,
> +        DeviceType,
> +        FwRpcResponse,
> +        Operations,
> +        RpcScope, //
> +    },
> +    prelude::*,
> +    transmute::{AsBytes, FromBytes},

NIT: Formatting.

> +    uapi, //
> +};
> +
> +use crate::{
> +    driver::NovaCore,
> +    gsp::{
> +        RmControlMsgFunction,
> +        rm::commands::send_rm_control, //
> +    },
> +};
> +
> +/// Byte-serializable wrapper for [`uapi::fwctl_rpc_nova_core_request_hd=
r`].
> +#[repr(transparent)]
> +struct FwctlNovaCoreReqHdr(uapi::fwctl_rpc_nova_core_request_hdr);
> +
> +// SAFETY: All fields are plain `__u32` with no padding.
> +unsafe impl FromBytes for FwctlNovaCoreReqHdr {}
> +
> +/// Byte-serializable wrapper for [`uapi::fwctl_rpc_nova_core_resp_hdr`]=
.
> +#[repr(transparent)]
> +struct FwctlNovaCoreRespHdr(uapi::fwctl_rpc_nova_core_resp_hdr);
> +
> +// SAFETY: All fields are plain `__u32` with no padding.
> +unsafe impl AsBytes for FwctlNovaCoreRespHdr {}
> +
> +/// Per-FD fwctl user context and operations for nova-core.
> +pub(crate) struct NovaCoreFwCtl;
> +
> +impl Operations for NovaCoreFwCtl {
> +    type DeviceData =3D ();
> +
> +    const DEVICE_TYPE: DeviceType =3D DeviceType::NovaCore;
> +
> +    fn open(_device: &fwctl::Device<Self>) -> Result<impl PinInit<Self, =
Error>, Error> {
> +        Ok(Ok(NovaCoreFwCtl))
> +    }
> +
> +    fn fw_rpc(
> +        _this: &Self,
> +        device: &fwctl::Device<Self>,
> +        scope: RpcScope,
> +        rpc_in: &mut [u8],
> +    ) -> Result<FwRpcResponse, Error> {

Result<FwRpcResponse>

> +        let hdr_size =3D size_of::<FwctlNovaCoreReqHdr>();
> +
> +        if rpc_in.len() < hdr_size {
> +            return Err(EINVAL);
> +        }
> +
> +        if scope !=3D RpcScope::Configuration {
> +            return Err(EPERM);
> +        }
> +
> +        let (hdr, _) =3D FwctlNovaCoreReqHdr::from_bytes_prefix(rpc_in).=
ok_or(EINVAL)?;
> +        let cmd =3D hdr.0.cmd;
> +
> +        let rm_cmd =3D match cmd {
> +            uapi::fwctl_cmd_nova_core_FWCTL_CMD_NOVA_CORE_UPLOAD_VGPU_TY=
PE =3D> {
> +                RmControlMsgFunction::VgpuMgrInternalPgpuAddVgpuType
> +            }
> +            _ =3D> return Err(EINVAL),
> +        };
> +
> +        let parent =3D device.parent();
> +        let data =3D parent.drvdata::<NovaCore>()?;

Please don't use drvdata() for this, it is not what it is intended for and =
I
kinda regret a bit that I added it in the first place.

Instead, please use your fwctl::Device private data, i.e. Self.

> +        let bar =3D data.gpu.bar.as_ref().access(parent)?;
> +
> +        let params =3D &rpc_in[hdr_size..];
> +        let reply_params =3D send_rm_control(
> +            &data.gpu.gsp.cmdq,
> +            bar,
> +            data.gpu.gsp.h_client,
> +            data.gpu.gsp.h_subdevice,
> +            rm_cmd,
> +            params,
> +        )?;
> +
> +        let resp_hdr =3D FwctlNovaCoreRespHdr(uapi::fwctl_rpc_nova_core_=
resp_hdr {
> +            mctp_header: 0,
> +            nvdm_header: 0,
> +        });
> +        let mut out =3D KVec::new();
> +        out.extend_from_slice(resp_hdr.as_bytes(), GFP_KERNEL)?;
> +        out.extend_from_slice(&reply_params, GFP_KERNEL)?;
> +        Ok(FwRpcResponse::NewBuffer(out))
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 60c85fffaeaf..7965ce37eb08 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -241,7 +241,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Res=
ult {
>  pub(crate) struct Gpu {
>      spec: Spec,
>      /// MMIO mapping of PCI BAR 0
> -    bar: Arc<Devres<Bar0>>,
> +    pub(crate) bar: Arc<Devres<Bar0>>,
>      /// System memory page required for flushing all pending GPU-side me=
mory writes done through
>      /// PCIE into system memory, via sysmembar (A GPU-initiated HW memor=
y-barrier operation).
>      sysmem_flush: SysmemFlush,
> @@ -251,7 +251,7 @@ pub(crate) struct Gpu {
>      sec2_falcon: Falcon<Sec2Falcon>,
>      /// GSP runtime data. Temporarily an empty placeholder.
>      #[pin]
> -    gsp: Gsp,
> +    pub(crate) gsp: Gsp,
>  }
> =20
>  impl Gpu {
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 1a1c4e9808ac..77eb30010c2f 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -4,11 +4,13 @@
> =20
>  use kernel::{
>      device,
> +    devres::Devres,
>      dma::{
>          CoherentAllocation,
>          DmaAddress, //
>      },
>      dma_write,
> +    fwctl,
>      pci,
>      prelude::*,
>      transmute::AsBytes, //
> @@ -21,15 +23,19 @@
>  mod sequencer;
> =20
>  pub(crate) use fw::{
> +    rm::RmControlMsgFunction,
>      GspFwWprMeta,
>      LibosParams, //
>  };
> =20
>  use crate::{
> -    gsp::cmdq::Cmdq,
> -    gsp::fw::{
> -        GspArgumentsPadded,
> -        LibosMemoryRegionInitArgument, //
> +    fwctl::NovaCoreFwCtl,
> +    gsp::{
> +        cmdq::Cmdq,
> +        fw::{
> +            GspArgumentsPadded,
> +            LibosMemoryRegionInitArgument, //
> +        },
>      },
>      num,
>  };
> @@ -117,6 +123,12 @@ pub(crate) struct Gsp {
>      pub(crate) cmdq: Cmdq,
>      /// RM arguments.
>      rmargs: CoherentAllocation<GspArgumentsPadded>,
> +    /// Cached RM internal client handle from GSP static info.
> +    pub(crate) h_client: u32,
> +    /// Cached RM internal subdevice handle from GSP static info.
> +    pub(crate) h_subdevice: u32,
> +    /// fwctl registration for userspace RM control.
> +    fwctl: Pin<KBox<Devres<fwctl::Registration<NovaCoreFwCtl>>>>,

This does not need to be in a separate allocation.

>  }
> =20
>  impl Gsp {
> @@ -125,6 +137,8 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) =
-> impl PinInit<Self, Error
>          pin_init::pin_init_scope(move || {
>              let dev =3D pdev.as_ref();
> =20
> +            let fwctl_dev =3D fwctl::Device::<NovaCoreFwCtl>::new(pdev.a=
s_ref(), Ok(()))?;

You should store everything you need in the private data of your fwctl::Dev=
ice
to properly tie it to its lifetime, e.g.

	struct NovaCoreFwCtl {
		gpu: Arc<Gpu>,
		bar: Arc<Devres<Bar0>>,
	}

> +
>              Ok(try_pin_init!(Self {
>                  libos: CoherentAllocation::<LibosMemoryRegionInitArgumen=
t>::alloc_coherent(
>                      dev,
> @@ -140,6 +154,9 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) =
-> impl PinInit<Self, Error
>                      1,
>                      GFP_KERNEL | __GFP_ZERO,
>                  )?,
> +                h_client: 0,
> +                h_subdevice: 0,
> +                fwctl: KBox::pin_init(fwctl::Registration::new(pdev.as_r=
ef(), &fwctl_dev), GFP_KERNEL)?,

I don't think this should live in the Gsp structure, please move this to pr=
obe()
and store the registration in struct NovaCore after the Gpu structure.

>                  _: {
>                      // Initialise the logging structures. The OpenRM equ=
ivalents are in:
>                      // _kgspInitLibosLoggingStructures (allocates memory=
 for buffers)
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index bc53e667cd9e..f493546b78ff 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -128,7 +128,7 @@ fn run_fwsec_frts(
>      ///
>      /// Upon return, the GSP is up and running, and its runtime object g=
iven as return value.
>      pub(crate) fn boot(
> -        self: Pin<&mut Self>,
> +        mut self: Pin<&mut Self>,
>          pdev: &pci::Device<device::Bound>,
>          bar: &Bar0,
>          chipset: Chipset,
> @@ -221,6 +221,10 @@ pub(crate) fn boot(
> =20
>          // Obtain and display basic GPU information.
>          let info =3D commands::get_gsp_info(&self.cmdq, bar)?;
> +        // SAFETY: h_client and h_subdevice are not structurally pinned.
> +        let this =3D unsafe { self.as_mut().get_unchecked_mut() };
> +        this.h_client =3D info.h_client();
> +        this.h_subdevice =3D info.h_subdevice();

Ick! If this is only needed from the fwctl callbacks, just move those into =
your
fwctl::Device private data.

But I think this is needed in other cases as well. So, more generally I thi=
nk
Gsp::boot() should just be part of the constructor, as we won't be able to
properly construct a Gsp object without having a chance to interact with th=
e Gsp
before.

>  /// Sends an RM control command, checks the reply status, and returns th=
e raw parameter bytes.
> -fn send_rm_control(
> +pub(crate) fn send_rm_control(
>      cmdq: &Cmdq,
>      bar: &Bar0,
>      h_client: u32,
> @@ -106,7 +106,7 @@ fn send_rm_control(
>      cmd: RmControlMsgFunction,
>      params: &[u8],
>  ) -> Result<KVVec<u8>> {
> -    let reply =3D cmdq.send_sync_command(bar, RmControl::new(h_client, h=
_object, cmd, params))?;
> +    let reply =3D cmdq.send_command(bar, RmControl::new(h_client, h_obje=
ct, cmd, params))?;

This looks like it should be a separate patch, or fixed in one of the
dependencies of this patch.

> =20
>      Result::from(reply.status)?;
> =20
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index b5caf1044697..863dc041272c 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -10,6 +10,7 @@
>  mod falcon;
>  mod fb;
>  mod firmware;
> +mod fwctl;
>  mod gfw;
>  mod gpu;
>  mod gsp;
> @@ -27,6 +28,7 @@
>      description: "Nova Core GPU driver",
>      license: "GPL v2",
>      firmware: [],
> +    imports_ns: ["FWCTL"],
>  }
> =20
>  kernel::module_firmware!(firmware::ModInfoBuilder);
> diff --git a/include/uapi/fwctl/fwctl.h b/include/uapi/fwctl/fwctl.h
> index 716ac0eee42d..f6289fbf3062 100644
> --- a/include/uapi/fwctl/fwctl.h
> +++ b/include/uapi/fwctl/fwctl.h
> @@ -45,6 +45,7 @@ enum fwctl_device_type {
>  	FWCTL_DEVICE_TYPE_MLX5 =3D 1,
>  	FWCTL_DEVICE_TYPE_CXL =3D 2,
>  	FWCTL_DEVICE_TYPE_PDS =3D 4,
> +	FWCTL_DEVICE_TYPE_NOVA_CORE =3D 5,
>  };
> =20
>  /**
> diff --git a/include/uapi/fwctl/nova-core.h b/include/uapi/fwctl/nova-cor=
e.h
> new file mode 100644
> index 000000000000..3f1d94b44ec8
> --- /dev/null
> +++ b/include/uapi/fwctl/nova-core.h

Why is this not include/uapi/gpu/nova-core.h? This driver does not live und=
er
drivers/fwctl/.

If we want to separate it, I suggest include/uapi/gpu/nova-core/fwctl.h, bu=
t it
doesn't seem necessary as we don't have any other UAPIs.
