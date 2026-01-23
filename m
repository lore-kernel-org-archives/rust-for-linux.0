Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DA122D4C3;
	Fri, 23 Jan 2026 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188169; cv=none; b=rAKkpgdapXscJYBNZgbiE4MInDiSaLkhvaJ8ytZF4CxGm/QzICW88ZXy/hOg1/x8PQgHOLz1WhUbqWyfPR654HM+HFdAHerV3QTq4SGySWoUXvxwc5YzkDg1EIM2qZ6lXiZY0tqJ4k4uOhCRwxHTZ7eNVP+ewdhc6FRxr5F9V+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188169; c=relaxed/simple;
	bh=f+5R3JjKS78CLRcPp/zk8EZGYV2IyAlDbob41E0jGxM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=tyi+Oi64Eox/a1aOK+fBLfu1b04CLHU2WNR84Nibb1vixCXlLeZbpo+r+PKza0kRbhncxUwPhOgEnmu2ahLjHI/u0s7D3mN6Ah6JYIMp9PS6Mx+sRf55eW2oZAx5RipKDQMlcLlK7GqjDmidGolR5CoBi0wE9Oa2CSGUc/mjL0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCkq1BVR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCkq1BVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B204BC4CEF1;
	Fri, 23 Jan 2026 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188169;
	bh=f+5R3JjKS78CLRcPp/zk8EZGYV2IyAlDbob41E0jGxM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=pCkq1BVRkt6UcdQekae22ylsavZ31j2jTyO8zTmWNTofhT5FduLMCzTiSC/wlIOQd
	 tVo4GSmp0pl1zQWgFpAcUSRKyJzs+gYg5VWzDeXcx/2eg1o/YaAX1tzPO78SwlATzj
	 eq5//FZKCyWVbxmRLlsofp7Le3K/wSIWkEssD6vw9ybk60joiOZDrCDeCivtf3leN/
	 413W+uG6Siydgo67ZqfGwNECbm6XRX/qANShby5hxZIobEAZ5rHaL3n+L0zAdbPNxN
	 2czIooc9BJcrFR44ZdSGjd+S+vBpNixHcOG1cFDQSUBv8BBm56jb3/rIOz+clV+zD5
	 c4sgFJQ/r15Jg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:09:24 +0100
Message-Id: <DFW4V2S0HUNK.1QCRUK104TQZE@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Alice Ryhl"
 <aliceryhl@google.com>, "Shankari Anand" <shankari.ak0208@gmail.com>,
 "David Airlie" <airlied@gmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Asahi Lina" <lina+kernel@asahilina.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
To: "Lyude Paul" <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 1/3] rust/drm: Introduce DeviceContext
References: <20260122225057.3589500-1-lyude@redhat.com>
 <20260122225057.3589500-2-lyude@redhat.com>
In-Reply-To: <20260122225057.3589500-2-lyude@redhat.com>

On Thu Jan 22, 2026 at 11:46 PM CET, Lyude Paul wrote:
> diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver=
.rs
> index b1af0a099551d..99d6841b69cbc 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -21,7 +21,7 @@ pub(crate) struct NovaDriver {
>  }
> =20
>  /// Convienence type alias for the DRM device type for this driver
> -pub(crate) type NovaDevice =3D drm::Device<NovaDriver>;
> +pub(crate) type NovaDevice<Ctx =3D drm::Registered> =3D drm::Device<Nova=
Driver, Ctx>;

Nothing for this patch (series), but I think we should get rid of this type
alias, I think it's confusing.

> +/// A typed DRM device with a specific [`drm::Driver`] implementation an=
d [`DeviceContext`].
> +///
> +/// Since DRM devices can be used before being fully initialized and reg=
istered with userspace, `C`
> +/// represents the furthest [`DeviceContext`] we can guarantee that this=
 [`Device`] has reached.
> +///
> +/// Keep in mind: this means that an unregistered device can still have =
the registration state
> +/// [`Registered`] as long as it was registered with userspace once in t=
he past, and that the
> +/// behavior of such a device is still well-defined. In such a situation=
, the behavior of any
> +/// functions which interact with userspace will simply be no-ops. Addit=
ionally, a device with the

This is still not correct, the are not guaranteed to be no-ops. We can stil=
l
have callbacks from userspace after the DRM device is unregistered.

> +/// registration state [`Uninit`] simply does not have a guaranteed regi=
stration state at compile
> +/// time, and could be either registered or unregistered. Since there is=
 no way to guarantee a
> +/// long-lived reference to an unregistered device would remain unregist=
ered, we do not provide a
> +/// [`DeviceContext`] for this.
> +///
> +/// # Invariants
> +///
> +/// * `self.dev` is a valid instance of a `struct device`.
> +/// * The data layout of `Self` remains the same across all implementati=
ons of `C`.
> +/// * Any invariants for `C` also apply.
> +#[repr(C)]
> +pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
> +    dev: Opaque<bindings::drm_device>,
> +    data: T::Data,
> +    _ctx: PhantomData<C>,
> +}

<snip>

> -    /// Registers a new [`Device`](drm::Device) with userspace.
> +    /// Registers a new [`UnregisteredDevice`](drm::UnregisteredDevice) =
with userspace.
>      ///
>      /// Ownership of the [`Registration`] object is passed to [`devres::=
register`].
> -    pub fn new_foreign_owned(
> -        drm: &drm::Device<T>,
> -        dev: &device::Device<device::Bound>,
> +    pub fn new_foreign_owned<'a>(
> +        drm: drm::UnregisteredDevice<T>,
> +        dev: &'a device::Device<device::Bound>,
>          flags: usize,
> -    ) -> Result
> +    ) -> Result<&'a drm::Device<T>>
>      where
>          T: 'static,
>      {
> -        if drm.as_ref().as_raw() !=3D dev.as_raw() {
> +        let this_dev: &device::Device =3D drm.as_ref();
> +        if this_dev.as_raw() !=3D dev.as_raw() {

I still think this change is unnecessary and the name 'this_dev' is mislead=
ing,
as it actually is the parent device.

>              return Err(EINVAL);
>          }
> =20
>          let reg =3D Registration::<T>::new(drm, flags)?;
> +        let drm =3D NonNull::from(reg.device());
> +
> +        devres::register(dev, reg, GFP_KERNEL)?;
> =20
> -        devres::register(dev, reg, GFP_KERNEL)
> +        // SAFETY: Since `reg` was passed to devres::register(), the dev=
ice now owns the lifetime
> +        // of the DRM registration - ensuring that this references lives=
 for at least as long as 'a.
> +        Ok(unsafe { drm.as_ref() })
>      }
