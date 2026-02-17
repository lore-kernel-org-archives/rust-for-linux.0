Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A8F31A800;
	Tue, 17 Feb 2026 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771327558; cv=none; b=M3iRUkI+7jkPHIvJK3QVuQC0rCC6XUdOpKy4iIbl5F+dE3WxJVAgzcVcd84dQfcGNcAIxdliKjpPR+zvp0vxpBhRGXWtBQQZAlOYePjWkKKHyQGWflWjaq4D4oMxE5rL8WHBeRXOG5cYRBOIzW6zh23lvLSbqGKQkFd0KjrPaSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771327558; c=relaxed/simple;
	bh=rhJDnIDYzVy7Nc6zkFeLuiD/FS3qE8b5GNKN0t7ske8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=IT0oNnzUxvTUcCKJSJvEJvamcW++MJnIj4fBe7WngoeCjEKpWPonPkNzDeYFD1KvMdkMDdJOMFQwUKzsr5TOe1mCJj+me5SFb43mYRJr84n8ZT/Q+miJTuwuVH+63ThMyoOf3rgOgQxitzdfqPCWH+VlMfxe3JWbVzTcyPebet0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nwAYnkE4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nwAYnkE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32ECC4CEF7;
	Tue, 17 Feb 2026 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771327557;
	bh=rhJDnIDYzVy7Nc6zkFeLuiD/FS3qE8b5GNKN0t7ske8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=nwAYnkE49RMSxo4ckBFYQgkSuFeY5+Ic/TTqMvZIKN65I1zSEqsOGfyDgXYt1ry42
	 6+6IBq1ZYR6EC/TY5aEFM+92BxB5y9dE/BSeQSCRk18+onhJprXGEo0Bm2Pd9UESFJ
	 4KBlRHZ8wH2k7ivOquqApb8kjew/mSwSKTcKrkjlS+6orsxvdTn+1dWPBzoFZxYKOy
	 ryK1PzGoXiOMj7RiB3n5tMOdCk4Q7MyHmCrthybZralcIz91Cd+kKhgolehtvp10SB
	 ILUE6S4SAfgq/gVLIEGPoOIuzRoHaItzsayjFV/NKUAYdcGXKOHpkDuiCWrbk95xZU
	 dUnsdAQ5/+HIg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:25:53 +0100
Message-Id: <DGH77OGW8BFR.2NV0GJ1890DPF@kernel.org>
Subject: Re: [PATCH v3 7/8] gpu: nova-core: use core library's CStr instead
 of kernel one
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>, "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
 <20260217-nova-misc-v3-7-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-7-b4e2d45eafbc@nvidia.com>

On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
> The kernel's own CStr type has been replaced by the one in the core
> library, and is now an alias to the latter. Change our imports to
> directly reference the actual type.
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs     | 2 +-
>  drivers/gpu/nova-core/firmware/gsp.rs | 6 +++++-
>  drivers/gpu/nova-core/nova_core.rs    | 2 +-
>  3 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 68779540aa28..2f7249383e51 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -424,7 +424,7 @@ const fn make_entry_chipset(self, chipset: &str) -> S=
elf {
>      }
> =20
>      pub(crate) const fn create(
> -        module_name: &'static kernel::str::CStr,
> +        module_name: &'static core::ffi::CStr,
>      ) -> firmware::ModInfoBuilder<N> {
>          let mut this =3D Self(firmware::ModInfoBuilder::new(module_name)=
);
>          let mut i =3D 0;
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 9488a626352f..ae3f6581c5b6 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -32,9 +32,13 @@
>  /// that scheme before nova-core becomes stable, which means this module=
 will eventually be
>  /// removed.
>  mod elf {
> +    use core::{
> +        ffi::CStr,
> +        mem::size_of, //
> +    };
> +
>      use kernel::{
>          bindings,
> -        prelude::*,
>          transmute::FromBytes, //
>      };

What's the improvement in this change? Both of the ones factored out are al=
ready
correctly imported through prelude. Let's keep it as is.

> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index c1121e7c64c5..b5caf1044697 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -18,7 +18,7 @@
>  mod sbuffer;
>  mod vbios;
> =20
> -pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> +pub(crate) const MODULE_NAME: &core::ffi::CStr =3D <LocalModule as kerne=
l::ModuleMetadata>::NAME;
> =20
>  kernel::module_pci_driver! {
>      type: driver::NovaCore,
>
> --=20
> 2.53.0

