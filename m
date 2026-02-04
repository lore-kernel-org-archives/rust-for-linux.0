Received: from sender4-pp-e107.zoho.com (sender4-pp-e107.zoho.com [136.143.188.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115F32EF652;
	Wed,  4 Feb 2026 18:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770229728; cv=pass; b=JWlEzv2/y1z3wfHrOcteARksDc/gA7bjSk8uU8w8LEAp2GyStrM1WrVKZAdVmZ6DUOvofTYJamTTwy20LdIIuXvov9Sq3TOfOEozc9hTgOlGPygsSwijRphBfOBEN6F+qEpATqcXSXQSjMzpEAa9PdIVoKmMhsxRk6ZzO8G1yWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770229728; c=relaxed/simple;
	bh=8sM9ftQAYXjEHofZ7h8/kIoV/tsEphLhYFeDluCFZNQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=dRl+hZx67uFse8ELv+//iks0XNBgVWCl3Xb4ro7EBLfn08jO0+kZGaF2gzRf5wm0Mtr3+XHjfX4A3f1CY154MvD/dPf1k4G676drE/pKCKxJ4iy/4Kg1xGxp1MOWs9PUhXA87s7LDzka3/V2jRadCn4TOq7bRmOpUcGkCktai+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=eq8gm3g7; arc=pass smtp.client-ip=136.143.188.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eq8gm3g7"
ARC-Seal: i=1; a=rsa-sha256; t=1770229718; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RrnnWNFovVAA7axgHvvJbMU76dInNA2OcXPTGMkvH7c2QCNdmQpR43RKqUs+mNc2k3z7YJJDpgk+Ci+lyeFnwZ3haSJ7u3JiLw4RJpm2SXHCws/sXZYxzCZHMf0X2jVyZKlxsQWhLmWAh64GYGi1oK4tVIPxBE8GqarXuX/RXcE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770229718; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eHsWAvz2hep0KdnzuN8UWmsGB1m6+dJ9OA8gLUPXydU=; 
	b=kJXGKGVIZkLtnSkxO/gGoLDQCwfGAY4j9zorW0DOz5Cwe/u/bwah82/dPsfdLPKK0DXe43K7jnW1pCSiLGRKwB1Vrjyh7wr1uBLMeXcHjeEehW8XN+AwBvz8rujxSGhWPUirNDwe6VClVaO3m/351zDz3u3w1k0hKbLDuxjhwNw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770229718;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=eHsWAvz2hep0KdnzuN8UWmsGB1m6+dJ9OA8gLUPXydU=;
	b=eq8gm3g7JtCOAvJFXHaZgS6PYgHQ/r/fqwf8NZRu14T9UoZDZouJUqW4jmo7S2xs
	k+HApZ9/f32PdqhLMZdGrdCpocsOC5c+cRN4V5ED232E7gvKPwOTBUUkgpCIfDUA2p+
	4z75gOqC25a+L7t28m6nT9G6dXdOlicTQ0NT9L/g=
Received: by mx.zohomail.com with SMTPS id 1770229717476464.77123307000454;
	Wed, 4 Feb 2026 10:28:37 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v5 2/4] rust/drm: Don't setup private driver data until
 registration
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260131001602.2095470-3-lyude@redhat.com>
Date: Wed, 4 Feb 2026 15:28:20 -0300
Cc: linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Alice Ryhl <aliceryhl@google.com>,
 Shankari Anand <shankari.ak0208@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Asahi Lina <lina+kernel@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <95623012-BAA8-4AA5-9D34-42FAE44B0FFD@collabora.com>
References: <20260131001602.2095470-1-lyude@redhat.com>
 <20260131001602.2095470-3-lyude@redhat.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Lyude,

> On 30 Jan 2026, at 21:13, Lyude Paul <lyude@redhat.com> wrote:
>=20
> Now that we have a DeviceContext that we can use to represent whether =
a
> Device is known to have been registered, we can make it so that =
drivers can
> create their Devices but wait until the registration phase to assign =
their
> private data to the Device. This is desirable as some drivers need to =
make
> use of the DRM device early on before finalizing their private driver =
data.
>=20
> As such, this change makes it so that the driver's private data can
> currently only be accessed through Device<T, Registered> types and not
> Device<T, Uninit>.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
> V4:
> * Remove accidental double-aliasing &mut in Device::release()
> ---
> drivers/gpu/drm/nova/driver.rs |  4 +--
> drivers/gpu/drm/tyr/driver.rs  |  4 +--
> rust/kernel/drm/device.rs      | 64 +++++++++++++++++++++-------------
> rust/kernel/drm/driver.rs      | 19 ++++++++--
> 4 files changed, 59 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/driver.rs =
b/drivers/gpu/drm/nova/driver.rs
> index 99d6841b69cbc..8cea5f68c3b04 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -56,8 +56,8 @@ impl auxiliary::Driver for NovaDriver {
>     fn probe(adev: &auxiliary::Device<Core>, _info: &Self::IdInfo) -> =
impl PinInit<Self, Error> {
>         let data =3D try_pin_init!(NovaData { adev: adev.into() });
>=20
> -        let drm =3D =
drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
> -        let drm =3D drm::Registration::new_foreign_owned(drm, =
adev.as_ref(), 0)?;
> +        let drm =3D =
drm::UnregisteredDevice::<Self>::new(adev.as_ref())?;
> +        let drm =3D drm::Registration::new_foreign_owned(drm, =
adev.as_ref(), data, 0)?;
>=20
>         Ok(Self { drm: drm.into() })
>     }
> diff --git a/drivers/gpu/drm/tyr/driver.rs =
b/drivers/gpu/drm/tyr/driver.rs
> index 0d479b5d7bd62..b574ee1c24587 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -133,8 +133,8 @@ fn probe(
>                 gpu_info,
>         });
>=20
> -        let tdev =3D =
drm::UnregisteredDevice::<Self>::new(pdev.as_ref(), data)?;
> -        let tdev =3D =
drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), 0)?;
> +        let tdev =3D =
drm::UnregisteredDevice::<Self>::new(pdev.as_ref())?;
> +        let tdev =3D =
drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(), data, =
0)?;
>=20
>         let driver =3D TyrDriver {
>             _device: tdev.into(),
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index 8f1780b8f0196..a1d9b0e92f3fd 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -26,13 +26,15 @@
> };
> use core::{
>     alloc::Layout,
> +    cell::UnsafeCell,
>     marker::PhantomData,
> -    mem,
> -    ops::Deref,
> -    ptr::{
> +    mem::{
>         self,
> -        NonNull, //
> +        MaybeUninit, //
>     },
> +    ops::Deref,
> +    ptr::NonNull,
> +    sync::atomic::*,
> };
>=20
> #[cfg(CONFIG_DRM_LEGACY)]
> @@ -141,7 +143,7 @@ impl DeviceContext for Uninit {}
> ///
> /// The device in `self.0` is guaranteed to be a newly created =
[`Device`] that has not yet been
> /// registered with userspace until this type is dropped.
> -pub struct UnregisteredDevice<T: drm::Driver>(ARef<Device<T, =
Uninit>>, NotThreadSafe);
> +pub struct UnregisteredDevice<T: drm::Driver>(pub(crate) =
ARef<Device<T, Uninit>>, NotThreadSafe);
>=20
> impl<T: drm::Driver> Deref for UnregisteredDevice<T> {
>     type Target =3D Device<T, Uninit>;
> @@ -188,7 +190,7 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
>     /// Create a new `UnregisteredDevice` for a `drm::Driver`.
>     ///
>     /// This can be used to create a =
[`Registration`](kernel::drm::Registration).
> -    pub fn new(dev: &device::Device, data: impl PinInit<T::Data, =
Error>) -> Result<Self> {
> +    pub fn new(dev: &device::Device) -> Result<Self> {
>         // `__drm_dev_alloc` uses `kmalloc()` to allocate memory, =
hence ensure a `kmalloc()`
>         // compatible `Layout`.
>         let layout =3D Kmalloc::aligned_layout(Layout::new::<Self>());
> @@ -207,22 +209,6 @@ pub fn new(dev: &device::Device, data: impl =
PinInit<T::Data, Error>) -> Result<S
>         .cast();
>         let raw_drm =3D =
NonNull::new(from_err_ptr(raw_drm)?).ok_or(ENOMEM)?;
>=20
> -        // SAFETY: `raw_drm` is a valid pointer to `Self`.
> -        let raw_data =3D unsafe { =
ptr::addr_of_mut!((*raw_drm.as_ptr()).data) };
> -
> -        // SAFETY:
> -        // - `raw_data` is a valid pointer to uninitialized memory.
> -        // - `raw_data` will not move until it is dropped.
> -        unsafe { data.__pinned_init(raw_data) }.inspect_err(|_| {
> -            // SAFETY: `raw_drm` is a valid pointer to `Self`, given =
that `__drm_dev_alloc` was
> -            // successful.
> -            let drm_dev =3D unsafe { Device::into_drm_device(raw_drm) =
};
> -
> -            // SAFETY: `__drm_dev_alloc()` was successful, hence =
`drm_dev` must be valid and the
> -            // refcount must be non-zero.
> -            unsafe { bindings::drm_dev_put(drm_dev) };
> -        })?;
> -
>         // SAFETY: The reference count is one, and now we take =
ownership of that reference as a
>         // `drm::Device`.
>         // INVARIANT: We just created the device above, but have yet =
to call `drm_dev_register`.
> @@ -253,7 +239,15 @@ pub fn new(dev: &device::Device, data: impl =
PinInit<T::Data, Error>) -> Result<S
> #[repr(C)]
> pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
>     dev: Opaque<bindings::drm_device>,
> -    data: T::Data,
> +
> +    /// Keeps track of whether we've initialized the device data yet.
> +    pub(crate) data_is_init: AtomicBool,

What about this?

	/**
	 * @registered:
	 *
	 * Internally used by drm_dev_register() and =
drm_connector_register().
	 */
	bool registered;

Can=E2=80=99t we use this in lieu of this flag you=E2=80=99ve added?

> +
> +    /// The Driver's private data.
> +    ///
> +    /// This must only be written to from [`drm::Registration::new`].
> +    pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,
> +
>     _ctx: PhantomData<C>,
> }
>=20

=E2=80=94 Daniel

