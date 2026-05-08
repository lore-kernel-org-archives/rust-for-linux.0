Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9685309EFA
	for <rust-for-linux@vger.kernel.org>; Fri,  8 May 2026 21:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778276987; cv=none; b=j+dpgJhOh1K6KQPhmTiKR94NFJGDH9zVMiNdm7X8TRQYM3cIXrAtyzJwtPX80nBndvrmdmkINwWWcPQNnh4P1A0nNAh8lka95+ljuAXEMKTWV4EFKZobb7Egj7xw9UaIIDhiuKPEhwAVt+WIt6ixlKG6yJkbloxOdhpI6kTdDSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778276987; c=relaxed/simple;
	bh=xneW9n/eFyYFwX151QQV138RZGgNafKZ/KvLb6N/acE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r6ZOAxnln0MyIgNk00sLzhsZGLf5gBAuoyFTNdpzYlFEb6JA4Vio+0ztg/LYxE1TJk+sA6ofzSXUbnZiZ1r4mrh4/U2SFnYJLNqLHMjxigeM1b4FaVQIrNl87GUfMtAHigu2NqnyBbmDjnDI0vLtlyssvNnz0xiVg68vzeNei7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WxD3UYzi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WxD3UYzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778276984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xneW9n/eFyYFwX151QQV138RZGgNafKZ/KvLb6N/acE=;
	b=WxD3UYziYxd0JKI5vAFk1DX4Oqa6JSw0/Os7ngQDlLiX0FKoAPKsmsV31cZKOKd1Hv+jo7
	wplA4umJ+XJfV/Mq/PeMn+jTQZQWSfonLrVO9ecB+L38J8rlAYE6ahML4ff+QSq9cvj1o0
	NkNmLsqrCEjq+rYNHqcmEfowNow/gMA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-9GMx8PjsMI6DS8RsxAYLqQ-1; Fri, 08 May 2026 17:49:43 -0400
X-MC-Unique: 9GMx8PjsMI6DS8RsxAYLqQ-1
X-Mimecast-MFC-AGG-ID: 9GMx8PjsMI6DS8RsxAYLqQ_1778276983
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ebc7ea2402so476220485a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 May 2026 14:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778276982; x=1778881782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xneW9n/eFyYFwX151QQV138RZGgNafKZ/KvLb6N/acE=;
        b=fOoVMNe7/KVWLET4gmKBVAtUmvGWuMMDgGCBsShENSa0dsXN8alTnwhDtzwt8RF7ot
         a6/rKRXG4o3d6zRjVqmT0QKD183YcEP9eJhr42QTG+sQUyjkveABEDpSdJ87oLZLvsyS
         /xURcWzP2jZNRgk0PQpeZ9dJEeIDpDsqJYyqjO8RLK6luZ2NJWAS+REjG6AhNfqGH4uv
         qKYouPK/mZ/PZT2wJTqlQPbNdk2tEUte21kp2zquQVfAPB5IBD/u2aY/Tj7NuOVfy58F
         F4CZfkjluacppWTx0BkniiWP8GXSlDuFPCqboUqSHorpA5WGxU07I//fLJcsxfZ19IfO
         S4EQ==
X-Forwarded-Encrypted: i=1; AFNElJ87XudG7ciVvgTil63uFZ9tZ2OE/mWJ/O5EpY28nTsBIqB6cmdbRHxdpAd69bOxw2r1l29dM9XixNJeIeyPiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoCX9WhkjRa55jZc0ecfNIzC5g8BJrkkgakiMpuDCYlUKsnMJX
	O5mkmPxT3WVh5n/QsEOWAyAmlUMwqnXcuef+HYnWqRghJTwzehN03NsJdYjE9QN5kwg4OQGvvZo
	8bj2Fncah7bGE45emYLfuOi2QNR+eCudS06RCLxS4ZiuTUK/HaTlf7GHQSU55656d65ZL
X-Gm-Gg: AeBDies/IJ59IFUlyrJ74zWiVFQRuOwCGxqhrqYkivPt0Qb01xpo3x71iQxh+/cv00f
	R2trWvwExdNQ4b+SWWGgWxMOvHn0SkkM4cAIKCq8UMtCf/uuiQ7OXOTnaJpZl5IX2e1o94fmxoP
	aCzpLZfooVQs+/TNkUgb4EwZKZK8IG8AFuvoheb5vGAINcsPzrz0O1iE5WoMCeqPCKGkqer1LM7
	Ocw+8AhFNWyJ6RrW9LFWHbix3GrqQm4LWuFy0BKZgQU4xP8E66JowXF4VbGMDYMrwh0B09wkJjH
	9ymQBJ8H0xSDl9kJD9qpayx5IT5PejxxM2ZdXIKE1u9uSaceWBtfJK/QPOTnheNjmcfhF5gGMxD
	EarRemEPypMcqQ/s2ZYcd7+l/ND7o
X-Received: by 2002:a05:620a:2544:b0:8f8:82a8:a31e with SMTP id af79cd13be357-904d72c5b2bmr2085911685a.60.1778276982596;
        Fri, 08 May 2026 14:49:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2544:b0:8f8:82a8:a31e with SMTP id af79cd13be357-904d72c5b2bmr2085905585a.60.1778276982047;
        Fri, 08 May 2026 14:49:42 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b9c524bbsm309451785a.1.2026.05.08.14.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:49:41 -0700 (PDT)
Message-ID: <56009df378bc90f171bccd89c80222dcfddd6884.camel@redhat.com>
Subject: Re: [PATCH 1/6] rust: drm: Add Driver::ParentDevice associated type
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 airlied@gmail.com, 	simona@ffwll.ch, daniel.almeida@collabora.com,
 acourbot@nvidia.com, 	apopple@nvidia.com, ecourtney@nvidia.com,
 deborah.brouwer@collabora.com, 	ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, 	lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu
Cc: driver-core@lists.linux.dev, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Fri, 08 May 2026 17:49:40 -0400
In-Reply-To: <20260506221027.858481-2-dakr@kernel.org>
References: <20260506221027.858481-1-dakr@kernel.org>
	 <20260506221027.858481-2-dakr@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r_b1fgmrOSfWbQ25Y18uxz6g_8d8xz4E3plsh4fBNJ8_1778276983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2026-05-07 at 00:05 +0200, Danilo Krummrich wrote:
> Add a ParentDevice associated type to the Driver trait, allowing each
> DRM driver to declare its parent bus device type (e.g.
> auxiliary::Device, platform::Device).
>=20
> Change UnregisteredDevice::new() to take &T::ParentDevice<Bound>,
> ensuring at the type level that the DRM device's parent matches the
> declared bus device type.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/nova/driver.rs | 8 ++++++--
> =C2=A0drivers/gpu/drm/tyr/driver.rs=C2=A0 | 6 ++++--
> =C2=A0rust/kernel/drm/device.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 7 +++++--
> =C2=A0rust/kernel/drm/driver.rs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A04 files changed, 18 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nova/driver.rs
> b/drivers/gpu/drm/nova/driver.rs
> index 9eef28b506bb..9d4100f01ea7 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -2,7 +2,10 @@
> =C2=A0
> =C2=A0use kernel::{
> =C2=A0=C2=A0=C2=A0=C2=A0 auxiliary,
> -=C2=A0=C2=A0=C2=A0 device::Core,
> +=C2=A0=C2=A0=C2=A0 device::{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Core,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceContext, //
> +=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0 drm::{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem,
> @@ -59,7 +62,7 @@ fn probe(
> =C2=A0=C2=A0=C2=A0=C2=A0 ) -> impl PinInit<Self, Error> + 'bound {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let data =3D try_pin_ini=
t!(NovaData { adev: adev.into() });
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let drm =3D
> drm::UnregisteredDevice::<Self>::new(adev.as_ref(), data)?;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let drm =3D drm::Unregistered=
Device::<Self>::new(adev, data)?;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let drm =3D drm::Registr=
ation::new_foreign_owned(drm,
> adev.as_ref(), 0)?;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(Self { drm: drm.into(=
) })
> @@ -71,6 +74,7 @@ impl drm::Driver for NovaDriver {
> =C2=A0=C2=A0=C2=A0=C2=A0 type Data =3D NovaData;
> =C2=A0=C2=A0=C2=A0=C2=A0 type File =3D File;
> =C2=A0=C2=A0=C2=A0=C2=A0 type Object<Ctx: drm::DeviceContext> =3D gem::Ob=
ject<NovaObject,
> Ctx>;
> +=C2=A0=C2=A0=C2=A0 type ParentDevice<Ctx: DeviceContext> =3D auxiliary::=
Device<Ctx>;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 const INFO: drm::DriverInfo =3D INFO;
> =C2=A0
> diff --git a/drivers/gpu/drm/tyr/driver.rs
> b/drivers/gpu/drm/tyr/driver.rs
> index 2743178af325..747745d23f31 100644
> --- a/drivers/gpu/drm/tyr/driver.rs
> +++ b/drivers/gpu/drm/tyr/driver.rs
> @@ -8,7 +8,8 @@
> =C2=A0=C2=A0=C2=A0=C2=A0 device::{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bound,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Core,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Device, //
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Device,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DeviceContext, //
> =C2=A0=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0 drm,
> =C2=A0=C2=A0=C2=A0=C2=A0 drm::ioctl,
> @@ -131,7 +132,7 @@ fn probe(
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 gpu_info,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 });
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tdev =3D
> drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev.as_ref(), data)?;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tdev =3D
> drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, data)?;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tdev =3D
> drm::driver::Registration::new_foreign_owned(tdev, pdev.as_ref(),
> 0)?;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let driver =3D TyrPlatfo=
rmDriverData {
> @@ -176,6 +177,7 @@ impl drm::Driver for TyrDrmDriver {
> =C2=A0=C2=A0=C2=A0=C2=A0 type Data =3D TyrDrmDeviceData;
> =C2=A0=C2=A0=C2=A0=C2=A0 type File =3D TyrDrmFileData;
> =C2=A0=C2=A0=C2=A0=C2=A0 type Object<R: drm::DeviceContext> =3D drm::gem:=
:Object<TyrObject,
> R>;
> +=C2=A0=C2=A0=C2=A0 type ParentDevice<Ctx: DeviceContext> =3D platform::D=
evice<Ctx>;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 const INFO: drm::DriverInfo =3D INFO;
> =C2=A0
> diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> index d91f19dcc375..492c2f2c7ca4 100644
> --- a/rust/kernel/drm/device.rs
> +++ b/rust/kernel/drm/device.rs
> @@ -197,7 +197,10 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Create a new `UnregisteredDevice` for a `drm=
::Driver`.
> =C2=A0=C2=A0=C2=A0=C2=A0 ///
> =C2=A0=C2=A0=C2=A0=C2=A0 /// This can be used to create a
> [`Registration`](kernel::drm::Registration).
> -=C2=A0=C2=A0=C2=A0 pub fn new(dev: &device::Device, data: impl PinInit<T=
::Data,
> Error>) -> Result<Self> {
> +=C2=A0=C2=A0=C2=A0 pub fn new(
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev: &T::ParentDevice<device:=
:Bound>,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data: impl PinInit<T::Data, E=
rror>,
> +=C2=A0=C2=A0=C2=A0 ) -> Result<Self> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // `__drm_dev_alloc` use=
s `kmalloc()` to allocate memory,
> hence ensure a `kmalloc()`
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // compatible `Layout`.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let layout =3D Kmalloc::=
aligned_layout(Layout::new::<Device<T,
> Uninit>>());
> @@ -207,7 +210,7 @@ pub fn new(dev: &device::Device, data: impl
> PinInit<T::Data, Error>) -> Result<S
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `dev` is valid by i=
ts type invarants,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let raw_drm: *mut Device=
<T, Uninit> =3D unsafe {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bindings::__drm_dev_alloc(
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dev.as_raw(),
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dev.as_ref().as_raw(),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &Self::VTABLE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 layout.size(),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 mem::offset_of!(Device<T, Uninit>, dev),
> diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> index 294e17af86a3..9d06f8c5b2da 100644
> --- a/rust/kernel/drm/driver.rs
> +++ b/rust/kernel/drm/driver.rs
> @@ -114,6 +114,9 @@ pub trait Driver {
> =C2=A0=C2=A0=C2=A0=C2=A0 /// The type used to represent a DRM File (clien=
t)
> =C2=A0=C2=A0=C2=A0=C2=A0 type File: drm::file::DriverFile;
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 /// The bus device type of the parent device that the=
 DRM device
> is associated with.
> +=C2=A0=C2=A0=C2=A0 type ParentDevice<Ctx: device::DeviceContext>:
> device::AsBusDevice<Ctx>;
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 /// Driver metadata
> =C2=A0=C2=A0=C2=A0=C2=A0 const INFO: DriverInfo;
> =C2=A0

