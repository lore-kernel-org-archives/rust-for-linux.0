Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55704EE849;
	Thu,  3 Sep 2026 22:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788473262; cv=pass; b=q7EEDj7mW/x0RKaG630/pCvjtyIofMO88eYhG3XDs7Yyig+HAhz2OdoGQg6hVerbMWiNBFdL0Yh7PFiHMjHIlDRe+J7s2qW2nW2aMiV5YsQR4CJn6GH8fvcShxd6/3NSoL2EdYxBvu8tKERSjAleYP0I1igXhJdKO6sAZYNkY4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788473262; c=relaxed/simple;
	bh=tC09nplv4RU1dR18MCiMlbWJptdYmcrFJ5one10NiXs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aGWqufaGM6ijoLgaxQVBbJ+3G5I7E4SzP7CzLBveTS/0jNbd00L1vzBefH4LFeOKp0TQ6FunND5Ee0AT3qTzHWzU8/k133VOo/VNw/sc/VuknXe3x4t6iy69NXkOYFsVXRkySdXc4Vx8jwZY+gTksx7coxGj3HBrmMAaNa9crNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=C8AufTuH; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="C8AufTuH"
ARC-Seal: i=1; a=rsa-sha256; t=1788473213; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R6bG7hdiDiKlEIgrX3xMgWzJwRMGsftITsN+MI8KcXwvHksT/f6eZ+8jr2s7TAvHdrVVzR4+Urpo34vxL5TpFw24bUjI2Fnb73NQkOZW1mJFCkfeR1DZlR56k0zx81GJLzDmeIEyhFUMgqTY/n6v2cJhMphmq8IsVeDuKiywRKI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788473213; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=afA3ax7f9QXcCedQi5bAM/QoI2EIiapIQDf4xdId4Ug=; 
	b=e03QYNDF1BzCbkp3Z6v8qmmYuONMENPFbUos06vuaYO4Cp8ZtKipFRSSeig4Xav2jk55S4104gDYbDjWBGOB09QyaFmGQT4pEEIuhqqXjHSQKLM9aVNqgvFuMffT7PR1hHX9djHM6jN+3njkRLqsNklXYmGBMTQRfqjNL8ZJqwc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788473213;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=afA3ax7f9QXcCedQi5bAM/QoI2EIiapIQDf4xdId4Ug=;
	b=C8AufTuHLPwUljbA54/aDdNTZQpkZb0OFLwnFnvPnt6ZW8E2u8au1DNCLZpbqCnD
	Mvh34mx5FVS9mgjYUsToU957PGF05WKA5kM6/zX5+Vrwtz8W1xjBVTxT3dBIF8ukHy/
	sthFIRJyiU6knD+o6DPFAt+UbTn/LzVzeHZlJKMQ=
Received: by mx.zohomail.com with SMTPS id 1788473212203626.0025116376753;
	Thu, 3 Sep 2026 15:06:52 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 6/9] drm/tyr: add BO creation and lookup helpers
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260902-tyr-ioctls-v1-6-e0fdbf8bd108@kylinos.cn>
Date: Thu, 3 Sep 2026 19:06:31 -0300
Cc: rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org,
 Alvin Sun <alvin.sun@linux.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B6966555-4532-4369-B519-56AD72307553@collabora.com>
References: <20260902-tyr-ioctls-v1-0-e0fdbf8bd108@kylinos.cn>
 <20260902-tyr-ioctls-v1-6-e0fdbf8bd108@kylinos.cn>
To: sunke@kylinos.cn
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 1 Sep 2026, at 13:09, Ke Sun via B4 Relay =
<devnull+sunke.kylinos.cn@kernel.org> wrote:
>=20
> From: Alvin Sun <alvin.sun@linux.dev>
>=20
> Add the new_object() and lookup_handle() helpers.
>=20
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
> drivers/gpu/drm/tyr/gem.rs | 29 ++++++++++++++++++++++++++++-
> 1 file changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tyr/gem.rs b/drivers/gpu/drm/tyr/gem.rs
> index 3bf3787f5c3fd..be1affe80db1a 100644
> --- a/drivers/gpu/drm/tyr/gem.rs
> +++ b/drivers/gpu/drm/tyr/gem.rs
> @@ -9,9 +9,11 @@
> use kernel::{
>     drm::gem::{
>         self,
> -        shmem, //
> +        shmem,
> +        BaseObject, //
>     },
>     prelude::*,
> +    sizes::SZ_4K,
>     sync::{
>         aref::ARef,
>         Arc, //
> @@ -23,6 +25,7 @@
>         TyrDrmDevice,
>         TyrDrmDriver, //
>     },
> +    file::TyrDrmFile,
>     vm::{
>         Vm,
>         VmMapFlags, //
> @@ -53,6 +56,30 @@ fn new(_dev: &TyrDrmDevice, _size: usize, args: =
BoCreateArgs) -> impl PinInit<Se
> /// Type alias for Tyr GEM buffer objects.
> pub(crate) type Bo =3D gem::shmem::Object<BoData>;
>=20
> +/// Create a new GEM buffer object.
> +pub(crate) fn new_object(ddev: &TyrDrmDevice, size: usize, flags: =
u32) -> Result<ARef<Bo>> {
> +    if size =3D=3D 0 {
> +        return Err(EINVAL);
> +    }
> +
> +    let aligned_size =3D =
size.checked_next_multiple_of(SZ_4K).ok_or(EINVAL)?;

I think this needs to be PAGE_SIZE instead of SZ_4K.

> +
> +    Bo::new(
> +        ddev,
> +        aligned_size,
> +        shmem::ObjectConfig {
> +            map_wc: true,
> +            parent_resv_obj: None,
> +        },
> +        BoCreateArgs { flags },
> +    )
> +}
> +
> +/// Look up a GEM object by handle for a DRM file.
> +pub(crate) fn lookup_handle(file: &TyrDrmFile, handle: u32) -> =
Result<ARef<Bo>> {
> +    Bo::lookup_handle(file, handle)
> +}
> +
> /// Creates a dummy GEM object to serve as the root of a GPUVM.
> pub(crate) fn new_dummy_object(ddev: &TyrDrmDevice) -> =
Result<ARef<Bo>> {
>     let bo =3D Bo::new(
>=20
> --=20
> 2.43.0
>=20
>=20

