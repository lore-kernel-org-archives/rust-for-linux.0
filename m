Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A2934D91E
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597570; cv=pass; b=D1D6vqEIBjqYLiwdNdALxC6XKgHpaEQHh0Xnn69okFnZATUb9pDDsQ2wAfWv6G81KZJwCadtvHVsZVIzinkXko/xE9/wf5IxBufcrXxSWABl+bCEEvcgi/zdrB99f+uwtmSvQumYb8o1QgpABJycsgy7L191G8yqbwdvOYXgqw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597570; c=relaxed/simple;
	bh=GWzndF6616Hb9ScuHCNSGJgqUvlxLjw5LKMKgButtN4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=D/feb18wyFkajD8Elfd2/6tax8vfxkqzy+huxsOR0yl/53TaIbKBi+cms+kCk2fawc1op+ROzxShokEzE11iWtYYD1an5hUgMPHbZuzpTXGUlanHZLOcc0lGO5pOd0HrCp3tVpLgPsEF5vBNevzTV+wIkBRyrWbVXQLCrKNJFIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=NCOGVIQL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="NCOGVIQL"
ARC-Seal: i=1; a=rsa-sha256; t=1771597558; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EFsKcoG9vuCoCYgPXD9cVTI/b1rKKjqDejr/k/6BfnveP2KB3wFnnxAn30Ld8GHIsjhn41E+3TZKIZh0xKLrX01s4jaHJtLw4UklHMJO8DWQASt07M2Su+GPbTR5TLK4RmjF1ih8ZlcRhsc9EKlGz+frLAlw3XXQhKcrUuWLog4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771597558; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SgCizO3HkZx+yUOO1qIsj6L6sYpshRY4y+E+T2xDKsk=; 
	b=dffgqto31AF7W22+DpwIWE6eFEDeCWdz7kLNzEnIJ1SKtY6Ia9UhkiqQnEkDdC5Bip9d0ZbSY63UhICyA9ErXXMjHvpZ+2Pr74v86yCZ3F47DVK9yn/Qh2PQiDvT3lUFMyab4sClOqGlLTznw4izATAmvG+QAq4675sCso4fVAQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771597558;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=SgCizO3HkZx+yUOO1qIsj6L6sYpshRY4y+E+T2xDKsk=;
	b=NCOGVIQLYAZCSWEZewbfmW5zF0IL5Zg9bxjmNB6B3+88IlJXnj00m42QegbIRK8+
	yRrW7bhr3NcyjKycqRUzZwaN6jt/cRkDrWdekUTF9rSOJbk4hjMFTbkdWOxfpqG29K8
	zUg2g8xNoFrNaHRMArtU6YIp8io7pJj/MxU8XIlo=
Received: by mx.zohomail.com with SMTPS id 1771597557804534.7027052118756;
	Fri, 20 Feb 2026 06:25:57 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 06/12] drm/tyr: add shmem backing for GEM objects
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260212013713.304343-7-deborah.brouwer@collabora.com>
Date: Fri, 20 Feb 2026 11:25:47 -0300
Cc: dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org,
 aliceryhl@google.com,
 boris.brezillon@collabora.com,
 beata.michalska@arm.com,
 lyude@redhat.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <A849CDE2-C257-42D7-9FD2-E9442A540264@collabora.com>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-7-deborah.brouwer@collabora.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 11 Feb 2026, at 22:37, Deborah Brouwer =
<deborah.brouwer@collabora.com> wrote:
>=20
> Add support for GEM buffer objects backed by shared memory.
>=20
> This introduces the BoCreateArgs structure for passing creation =
parameters
> including flags, and adds a flags field to BoData. A =
new_dummy_object()
> helper is provided to create a dummy GEM object for use as a GPUVM =
root.
>=20
> The Bo type alias is added to simplify working with Tyr's shmem-backed
> GEM objects throughout the driver.
>=20
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
> drivers/gpu/drm/tyr/gem.rs | 52 ++++++++++++++++++++++++++++++++------
> 1 file changed, 44 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index c1208d332dea..6a58f2da88d3 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -1,28 +1,64 @@
> // SPDX-License-Identifier: GPL-2.0 or MIT
> +//! GEM buffer object management for the Tyr driver.
> +//!
> +//! This module provides buffer object (BO) management functionality =
using
> +//! DRM's GEM subsystem with shmem backing.
>=20
> use kernel::{
>     drm::{
>         gem,
> +        gem::shmem,
>         DeviceContext, //
>     },
> -    prelude::*, //
> +    prelude::*,
> +    sync::aref::ARef, //
> };
>=20
> -use crate::driver::TyrDrmDriver;
> +use crate::driver::{
> +    TyrDrmDevice,
> +    TyrDrmDriver, //
> +};
>=20
> -/// GEM Object inner driver data
> +/// Tyr's DriverObject type for GEM objects.
> #[pin_data]
> -pub(crate) struct BoData {}
> +pub(crate) struct BoData {
> +    flags: u32,
> +}
> +
> +/// Provides a way to pass arguments when creating BoData
> +/// as required by the gem::DriverObject trait.
> +pub(crate) struct BoCreateArgs {
> +    flags: u32,
> +}
>=20
> impl gem::DriverObject for BoData {
>     type Driver =3D TyrDrmDriver;
> -    type Args =3D ();
> +    type Args =3D BoCreateArgs;
>=20
>     fn new<Ctx: DeviceContext>(
> -        _dev: &kernel::drm::Device<TyrDrmDriver, Ctx>,
> +        _dev: &TyrDrmDevice<Ctx>,

Unrelated change?

>         _size: usize,
> -        _args: (),
> +        args: BoCreateArgs,
>     ) -> impl PinInit<Self, Error> {
> -        try_pin_init!(BoData {})
> +        try_pin_init!(Self { flags: args.flags })
>     }
> }
> +
> +/// Type alias for Tyr GEM buffer objects.
> +pub(crate) type Bo =3D gem::shmem::Object<BoData>;
> +
> +/// Creates a dummy GEM object to serve as the root of a GPUVM.
> +#[expect(dead_code)]
> +pub(crate) fn new_dummy_object<Ctx: DeviceContext>(ddev: =
&TyrDrmDevice<Ctx>) -> Result<ARef<Bo>> {
> +    let bo =3D gem::shmem::Object::<BoData>::new(
> +        ddev,
> +        4096,
> +        shmem::ObjectConfig {
> +            map_wc: true,
> +            parent_resv_obj: None,
> +        },
> +        BoCreateArgs { flags: 0 },
> +    )?;
> +
> +    Ok(bo)
> +}
> --=20
> 2.52.0
>=20
>=20

