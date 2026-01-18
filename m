Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAC733ADBE;
	Sun, 18 Jan 2026 14:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768746978; cv=none; b=ZC6w+blkNvSoi/CVCJcyr8uGh0xneXKHtVFqe+0MPGKM/TXSsUyW5kcaBMb/7mCe4smBvTb4CH90xRmOB8c9pqjfYNq17Yjc546oPFMmoQM+XEyB86bS4JFvvRTE3fuYq3WBS/I/XOk4gpid46krBeF+kby/HX4yMV51JECWKwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768746978; c=relaxed/simple;
	bh=33hSF7vZvBt9hpj11PH/qOK78BNtuiOFwFzHcWTHKGs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=GQ1/QYFBPNmEJr1IgoK8pc8CMWmIstBSPj3MBocyvXSrVoG7gKAwJevC45hwkIiN3FD49/h1HcE4+V4IUv9t8IhZTEYgSrwON5fiab64TcoqqQxV1ANXaLabey9T9JRNYJkRkmryMrASaoXlvoCfR4GjdW+4r6g4fXsB99UAYNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpXshR4h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpXshR4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53DDC116D0;
	Sun, 18 Jan 2026 14:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768746977;
	bh=33hSF7vZvBt9hpj11PH/qOK78BNtuiOFwFzHcWTHKGs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=dpXshR4hP1Uedl3csIEZzc8pB6piBF2OUIe80AqEQbPSXr8U6nOJJTJgQo7q9J+oc
	 txtdGHKW365ZRdZMsmTnCK1Wj4aDchYwxWWRgb2rc54N2Qd4tErlIX9LlR6xitKcN1
	 eV8z8QL+tcVLJxRFQhwhLALUuRNTA+kk8StX9XCfAlTMDSchYUkYyScaIBt/KmnVIf
	 W0bj0CVPVLbFlgT34tWVhYHnf+cm8FAcUfBVqq/ycGU9z7yUgJZKbx3PlpQqUhRHuN
	 XbHpnt+Of98+DF1pBupltso1u/xqd8ZdqCIe0O5nr1dOyw1LtSZCVh03u30E2+8GT0
	 /PbRrLBXvZJSg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 Jan 2026 15:36:13 +0100
Message-Id: <DFRSH2462TT2.RZBLN08KS0IW@kernel.org>
Subject: Re: [PATCH v2 2/3] rust/drm: Don't setup private driver data until
 registration
Cc: <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Shankari Anand" <shankari.ak0208@gmail.com>,
 "David Airlie" <airlied@gmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Asahi Lina" <lina+kernel@asahilina.net>, "Atharv Dubey"
 <atharvd440@gmail.com>, "Daniel Almeida" <daniel.almeida@collabora.com>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116204728.725579-1-lyude@redhat.com>
 <20260116204728.725579-3-lyude@redhat.com>
In-Reply-To: <20260116204728.725579-3-lyude@redhat.com>

On Fri Jan 16, 2026 at 9:41 PM CET, Lyude Paul wrote:
> @@ -118,7 +120,7 @@ pub trait DeviceContext: Sealed + Send + Sync {}
>  ///
>  /// The device in `self.0` is guaranteed to be a newly created [`Device`=
] that has not yet been
>  /// registered with userspace until this type is dropped.
> -pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, Uninit>>, N=
otThreadSafe);
> +pub struct UnregisteredDevice<T: drm::Driver>(pub(crate) ARef<Device<T, =
Uninit>>, NotThreadSafe);
> =20
>  impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
>      type Target =3D Device<T, Uninit>;
> @@ -165,7 +167,7 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
>      /// Create a new `UnregisteredDevice` for a `drm::Driver`.
>      ///
>      /// This can be used to create a [`Registration`](kernel::drm::Regis=
tration).
> -    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, Error>)=
 -> Result<Self> {
> +    pub fn new(dev: &device::Device) -> Result<Self> {
>          // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, hence =
ensure a `kmalloc()`
>          // compatible `Layout`.
>          let layout =3D Kmalloc::aligned_layout(Layout::new::<Self>());
> @@ -184,22 +186,6 @@ pub fn new(dev: &device::Device, data: impl PinInit<=
T::Data, Error>) -> Result<S
>          .cast();
>          let raw_drm =3D NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOME=
M)?;
> =20
> -        // SAFETY: `raw_drm` is a valid pointer to `Self`.
> -        let raw_data =3D unsafe { ptr::addr_of_mut!((*raw_drm.as_ptr()).=
data) };
> -
> -        // SAFETY:
> -        // - `raw_data` is a valid pointer to uninitialized memory.
> -        // - `raw_data` will not move until it is dropped.
> -        unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
> -            // SAFETY: `raw_drm` is a valid pointer to `Self`, given tha=
t `__drm_dev_alloc` was
> -            // successful.
> -            let drm_dev =3D unsafe { Device::into_drm_device(raw_drm) };
> -
> -            // SAFETY: `__drm_dev_alloc()` was successful, hence `drm_de=
v` must be valid and the
> -            // refcount must be non-zero.
> -            unsafe { bindings::drm_dev_put(drm_dev) };
> -        })?;
> -
>          // SAFETY: The reference count is one, and now we take ownership=
 of that reference as a
>          // `drm::Device`.
>          // INVARIANT: We just created the device above, but have yet to =
call `drm_dev_register`.
> @@ -231,7 +217,15 @@ pub fn new(dev: &device::Device, data: impl PinInit<=
T::Data, Error>) -> Result<S
>  #[repr(C)]
>  pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
>      dev: Opaque<bindings::drm_device>,
> -    data: T::Data,
> +
> +    /// Keeps track of whether we've initialized the device data yet.
> +    pub(crate) data_is_init: AtomicBool,

Please use a kernel atomic, i.e. kernel::sync::atomic::Atomic<bool>. See al=
so [1].

[1] https://lore.kernel.org/all/20251230093718.1852322-1-fujita.tomonori@gm=
ail.com/

> +    /// The Driver's private data.
> +    ///
> +    /// This must only be written to from [`drm::Registration::new`].
> +    pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,

Why not just Opaque<T::Data>?

> +
>      _ctx: PhantomData<C>,
>  }
