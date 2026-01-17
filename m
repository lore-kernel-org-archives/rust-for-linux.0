Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779162D1F64
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768649046; cv=none; b=OrIJwpkY7RtVsmFFQqcgJM9XtzWZrVTKGIYUoKwm2Jrz1wsjHdGrkebRmhJR5J4+RivzGVjHUqj5cdAjX3/EWSoijiq2qniu/42oGtxXW8oiltUmG/7JTh1CelmZ76yG2rL/KTgm1lKtq76uYoESrw3Rs23l51I5LGYkJ1IC6JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768649046; c=relaxed/simple;
	bh=y1VqaXEkPKmolU8tuUd7ehCwYdrV2lX2sTBowpAwuGE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=U6H0gx663AsEqCq0u2G8VTxwDSihOZyLRDrGxeQ9tPSHUEDxKOxSymxI0nkRKcvJ5dOBJP+gMJydvkBZlWL6Tl2u43kCafxRzMB7jUBemYlBjO/Hs0xEj6+yiSb/TZLVroVqREJxPLbifjPmuqKNZ8opWp6e6boIZiZxOBxkurU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JadbjWt8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JadbjWt8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E6EC4CEF7;
	Sat, 17 Jan 2026 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768649046;
	bh=y1VqaXEkPKmolU8tuUd7ehCwYdrV2lX2sTBowpAwuGE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=JadbjWt8wCHgJkTrvTK+O2Xf7dHwdsca3hEosLp8S7+IqgMtVQmW+ukBAISkpZ0xp
	 2/vvvXZVXu6I0vK41Al3PRhYFrpeMARqmpx535iqVdHDcfzbKshyVsr+DZsRpGQ0fv
	 gK5ifup+WWV1K25heb2ygdldWiEFJOuJOT+lUSVIF9PKHAYdZo0nA92kuXSFsBOBUf
	 9awmRbPKrBKg5pSBeYNEBvDY4K3HKdlgczx1m+/HdWXLiv7B73GiQ+o6zELGMWHD0K
	 pQfubArMSP/t+p50OkZ/urj5k+iQBJ9Gn0ZWMW84JYc62KwALaj9WF6or4vBvOBZQI
	 Yx20OVzQsWUOQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 12:24:02 +0100
Message-Id: <DFQTRDK9BO2M.995Y3QDQM7CG@kernel.org>
Subject: Re: [PATCH v5 5/8] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
Cc: "Matthew Maurer" <mmaurer@google.com>, "Gary Guo" <gary@garyguo.net>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-6-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-6-ttabi@nvidia.com>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> Replace the module_pci_driver! macro with an explicit module
> initialization using the standard module! macro and InPlaceModule
> trait implementation.  No functional change intended, with the
> exception that the driver now prints a message when loaded.
>
> This change is necessary so that we can create a top-level "nova_core"
> debugfs entry when the driver is loaded.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/nova_core.rs | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index c1121e7c64c5..d0df8db3693d 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,6 +2,13 @@
> =20
>  //! Nova Core GPU Driver
> =20
> +use kernel::{
> +    error::Error,

This should be covered by prelude.

> +    pci,
> +    prelude::*,
> +    InPlaceModule, //
> +};
> +
>  #[macro_use]
>  mod bitfield;
> =20
> @@ -20,13 +27,26 @@
> =20
>  pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> =20
> -kernel::module_pci_driver! {
> -    type: driver::NovaCore,
> +#[pin_data]
> +struct NovaCoreModule {
> +    #[pin]
> +    _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>=
>,

Let's import driver, such that this becomes driver::Registration<_>.

> +}
> +
> +impl InPlaceModule for NovaCoreModule {
> +    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
> +        try_pin_init!(Self {
> +            _driver <- kernel::driver::Registration::new(MODULE_NAME, mo=
dule),

Same here.

> +        })
> +    }
> +}
> +
> +module! {
> +    type: NovaCoreModule,
>      name: "NovaCore",
>      authors: ["Danilo Krummrich"],
>      description: "Nova Core GPU driver",
>      license: "GPL v2",
> -    firmware: [],

Should be a separate patch.
