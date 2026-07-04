Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0170D1C84AB;
	Sat,  4 Jul 2026 19:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783194188; cv=none; b=jr6kCLvUSESpDdMCCtgd3PmYLfQDtg2DmS5UYiRQQNRWFxUBgnHh1SP/qTyaNuLsTYZIb6G2d7T0+U1eQnLGTat4JVSdr/9jwv/ZWPg2+twGlzw935VQsoQmm5QRJiM9ZnL7tF6QcTSlYbRlSY9qk1Dv0ScBillwMr5V7/Y0V/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783194188; c=relaxed/simple;
	bh=qs1U9E+DEVGmR2Z8Xd4ZQW6556SE0U/dQuPWkOLO4H4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=pfzFcdKtdyqfqkOqaQT0jjauWjr58euLnW1V7sEw/OTEFz5Dyyk+493ucFDrnN0Lo9LSJaRKYiQsGN40enFReY6OlbUhfb0yh41E7JzB2bOFk5rc1CdOpecdn5ThTgQS70TmTNnmEP/nfMsxlmoz9cgq0S6HvEKaVcbCB1gGi7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRTC+dY/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRTC+dY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1173A1F000E9;
	Sat,  4 Jul 2026 19:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783194186;
	bh=dXIVdqBmXDiJE5zH9LVS4v2TAK0M3+aAqTPABU0tdTk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=kRTC+dY/R28i61BTfosQ3WoW+S6BphqMIrosgRBcgz2tAJ8D0+b8qjBKKPyGWeceH
	 pGrVAtKOKIue+DedQOgE+SIQ80bW1tHKoTC5vkN+yE9LmTe1yNQqyNdBcLZylIrQXa
	 RVKfeJ15z/wGKbxXmx35hkqMEPqKETXZC8iMmiIC0Yq+ASu1aNbPJILVVLSkg0bqSY
	 zZZSmfWXfXzjjzXdBm5R2W9T8JN7Sbu+vAEcwAiujCpuGf/qds347XPb2ll89Qu/nq
	 HXFHfnzk1UVmODasIxXicufLk8Tz/1R7n7Pi64rUb6sEQ8w0d4OSmaTC9j9mgfjJ6N
	 /mq4uGdGSh+Hg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Jul 2026 21:42:59 +0200
Message-Id: <DJQ1KX0O60J7.Q3RUZ46V153O@kernel.org>
Subject: Re: [PATCH v6 1/1] rust: introduce abstractions for fwctl
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dave.jiang@intel.com>, <saeedm@nvidia.com>, <jic23@kernel.org>,
 <gary@garyguo.net>, <joelagnelf@nvidia.com>, <aliceryhl@google.com>,
 <kwilczynski@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <kjaju@nvidia.com>,
 <alkumar@nvidia.com>, <acourbot@nvidia.com>, <jhubbard@nvidia.com>,
 <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
To: "Zhi Wang" <zhiw@nvidia.com>, <jgg@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260629150156.3169384-1-zhiw@nvidia.com>
 <20260629150156.3169384-2-zhiw@nvidia.com>
In-Reply-To: <20260629150156.3169384-2-zhiw@nvidia.com>

On Mon Jun 29, 2026 at 5:01 PM CEST, Zhi Wang wrote:
> Introduce safe Rust wrappers around struct fwctl_device and
> struct fwctl_uctx. This lets Rust drivers register fwctl devices and
> implement firmware RPC callbacks through a typed trait interface.
>
> The abstraction keeps lifetime and reference-count handling inside the
> wrapper, exposes pinned per-FD user contexts to drivers, and validates th=
e
> layout assumptions required by the C fwctl allocation model.
>
> Registration owns driver private data with a lifetime tied to the bound
> parent device. fwctl callbacks access that data through the Registration
> lifetime, while Device remains only the refcounted fwctl object. This
> avoids requiring Rust drop glue from the fwctl_device release path after
> unregister or module teardown.
>
> Co-developed-by: Danilo Krummrich <dakr@kernel.org>

This also needs:

Signed-off-by: Danilo Krummrich <dakr@kernel.org>

> Link: https://lore.kernel.org/r/DJJW7X4ESDSM.QCVYK2FC7ZR3@kernel.org
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Few remaining nits below.

Jason, would you be fine if I take this through the DRM tree, so Nova can b=
uild
on top of it right away, or do you want to take it through your fwctl tree?

> ---
>  drivers/fwctl/Kconfig           |  12 +
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/fwctl.c            |  17 +
>  rust/helpers/helpers.c          |   3 +-
>  rust/kernel/fwctl.rs            | 546 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  6 files changed, 580 insertions(+), 1 deletion(-)
>  create mode 100644 rust/helpers/fwctl.c
>  create mode 100644 rust/kernel/fwctl.rs


The MAINTAINERS file needs an update.

> +/// Represents a fwctl device type.
> +///
> +/// Corresponds to the C `enum fwctl_device_type`.
> +#[repr(u32)]
> +#[derive(Copy, Clone, Debug, Eq, PartialEq)]
> +pub enum DeviceType {
> +    /// Mellanox ConnectX (mlx5) device.
> +    Mlx5 =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_MLX5,
> +    /// CXL (Compute Express Link) device.
> +    Cxl =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_CXL,
> +    /// AMD/Pensando PDS device.
> +    Pds =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_PDS,
> +    /// Broadcom NetXtreme (bnxt) device.
> +    Bnxt =3D bindings::fwctl_device_type_FWCTL_DEVICE_TYPE_BNXT,
> +}

NIT: Do we want to add all device types even though they do not (plan to) h=
ave a
Rust driver?

> +/// Trait implemented by each Rust driver that integrates with the fwctl=
 subsystem.
> +///
> +/// The implementing type **is** the per-FD user context: one instance i=
s
> +/// created for each `open()` call and dropped when the FD is closed.
> +///
> +/// Each implementation corresponds to a specific device type and provid=
es the
> +/// vtable used by the core `fwctl` layer to manage per-FD user contexts=
 and
> +/// handle RPC requests.
> +pub trait Operations: Sized + Send + Sync + 'static {
> +    /// Data owned by the [`Registration`] and accessible during callbac=
ks.
> +    ///
> +    /// The lifetime `'a` is tied to the [`Registration`] scope (which l=
ives within the parent bus
> +    /// device binding scope). Drivers use it to store references to res=
ources bound to this scope,
> +    /// such as PCI BARs or typed bus device references.
> +    type RegistrationData<'a>: Send + Sync + 'a
> +    where
> +        Self: 'a;
> +
> +    /// fwctl device type identifier.
> +    const DEVICE_TYPE: DeviceType;
> +
> +    /// Called when a new user context is opened.
> +    ///
> +    /// Returns a [`PinInit`] initializer for `Self`. The instance is dr=
opped
> +    /// automatically when the FD is closed (after [`close`](Self::close=
)).
> +    fn open<'a>(
> +        device: &'a Device<Self>,
> +        reg_data: &'a Self::RegistrationData<'a>,
> +    ) -> impl PinInit<Self, Error>;

I think this can just be

	fn open<'a>(
	    device: &Device<Self>,
	    reg_data: &Self::RegistrationData<'a>,
	) -> impl PinInit<Self, Error>;

> +impl<T: Operations> Device<T> {
> +    /// Allocate a new fwctl device.
> +    ///
> +    /// Returns an [`ARef`] that can be passed to [`Registration::new()`=
]
> +    /// to make the device visible to userspace.
> +    pub fn new(parent: &device::Device<device::Bound>) -> Result<ARef<Se=
lf>> {
> +        const_assert!(
> +            core::mem::offset_of!(Self, dev) =3D=3D 0,
> +            "struct fwctl_device must be at offset 0"
> +        );
> +
> +        let ops =3D core::ptr::from_ref::<bindings::fwctl_ops>(&VTable::=
<T>::VTABLE).cast_mut();
> +
> +        // SAFETY: `ops` is static, `parent` is bound, and `size` covers=
 the full `Device<T>`.
> +        let raw =3D unsafe {
> +            bindings::_fwctl_alloc_device(parent.as_raw(), ops, core::me=
m::size_of::<Self>())
> +        };
> +
> +        if raw.is_null() {
> +            return Err(ENOMEM);
> +        }
> +
> +        let this =3D raw.cast::<Self>();
> +
> +        // INVARIANT: Set `registration_data` to dangling (no registrati=
on yet).
> +        // SAFETY: `this` points to the allocation just returned by fwct=
l.
> +        unsafe {
> +            core::ptr::addr_of_mut!((*this).registration_data)

Here and in a few other places, this can use &raw mut instead.

> +/// Static vtable mapping Rust trait methods to C callbacks.
> +pub struct VTable<T: Operations>(PhantomData<T>);

Why does this need public visibility?

> +
> +impl<T: Operations> VTable<T> {
> +    /// The fwctl operations vtable for this driver type.
> +    pub const VTABLE: bindings::fwctl_ops =3D bindings::fwctl_ops {
> +        device_type: T::DEVICE_TYPE as u32,
> +        uctx_size: core::mem::size_of::<UserCtx<T>>(),
> +        open_uctx: Some(Self::open_uctx_callback),
> +        close_uctx: Some(Self::close_uctx_callback),
> +        info: Some(Self::info_callback),
> +        fw_rpc: Some(Self::fw_rpc_callback),
> +    };

Same here.

> +
> +    /// # Safety
> +    ///
> +    /// `uctx` must be a valid `fwctl_uctx` embedded in a `UserCtx<T>` w=
ith
> +    /// sufficient allocated space for the uctx field.
> +    unsafe extern "C" fn open_uctx_callback(uctx: *mut bindings::fwctl_u=
ctx) -> ffi::c_int {
> +        const_assert!(
> +            core::mem::offset_of!(UserCtx<T>, fwctl_uctx) =3D=3D 0,
> +            "struct fwctl_uctx must be at offset 0"
> +        );
> +
> +        // SAFETY: fwctl sets this pointer before calling `open_uctx`.
> +        let raw_fwctl =3D unsafe { (*uctx).fwctl };
> +        // SAFETY: Rust fwctl devices use the offset-0 `Device<T>` layou=
t.
> +        let device =3D unsafe { Device::<T>::from_raw(raw_fwctl) };
> +
> +        // SAFETY: open_uctx is called under registration_lock read; the=
 device is registered.
> +        let reg_data =3D unsafe { device.registration_data_unchecked() }=
;
> +
> +        let initializer =3D T::open(device, reg_data);
> +
> +        let uctx_offset =3D core::mem::offset_of!(UserCtx<T>, uctx);
> +        // SAFETY: `uctx_size` reserves space for the full `UserCtx<T>`.
> +        let uctx_ptr: *mut T =3D unsafe { uctx.cast::<u8>().add(uctx_off=
set).cast() };

This can use byte_add() instead.

> +            Ok(FwRpcResponse::NewBuffer(kvec)) =3D> {
> +                let (ptr, len, _cap) =3D kvec.into_raw_parts();
> +                // SAFETY: `out_len` is valid.
> +                unsafe { *out_len =3D len };
> +                ptr.cast::<ffi::c_void>()

This probably needs a kvec.is_empty() check, since an empty vector contains=
 a
dangling pointer.
