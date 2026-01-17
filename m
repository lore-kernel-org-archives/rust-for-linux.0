Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0219AD5C
	for <rust-for-linux@vger.kernel.org>; Sat, 17 Jan 2026 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768652321; cv=none; b=D/zFXxslXITGXodcU+kJewyEJlXy03Gc66m9GjIck3+AFKiU0zXEdkuyx/u0LeUE7cqQOXaI/CDbfLOwiJWsukOazG1RqClAXVChjESRo4i6F4wgsOy0cQU1TbbmF0wxWCRYyS/iu5FrRIPHWS8/Sf6fFVClKLh76rpF3UwEzPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768652321; c=relaxed/simple;
	bh=1VFlYAb3J6PFjrajzHXUkRqFDo/2WFsWKu6N0B4R6lM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=PGjgG/c76XFF5KjTkqdjnX2BBOqAkBsqh35YA6so4aZ/qrr8sFUlzsO3RuFf8QQFB0hqq/wPtZgc/jJqZZdGD88RR5o2PACt9b9Fd8ZFS9g4REJv73iNJM/Ix1+/Qd6AbDpQJgXgofnew8tgswbLSz1/qhttndccmbWOjPUn5WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z13Ic91S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z13Ic91S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0090CC4CEF7;
	Sat, 17 Jan 2026 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768652321;
	bh=1VFlYAb3J6PFjrajzHXUkRqFDo/2WFsWKu6N0B4R6lM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=Z13Ic91SW1AoXurh8xqXxhjcjj3n0TfsMf/N1IwLVTcNzL4zaCxiNZY3wnYR2oxjR
	 e/6hb1MGlTVMlBuwqbaTcpxbCwbzV8N66Rl1wVI8uH5dY5DFP1r6rBOUB7vH01pHJ7
	 +0ERx0JE7swKrlFVacKqN8r59FtM/KOruYROIeDNNqHOXwBB7ogKPhOWUdUzcxl+QH
	 YRa4R/mpcMc4gGEJy8pVW17QfFivipnWOv6JbAd51ngCPLwTRIwpfVaLvE0pPLJGEX
	 gzchcUANyqz8t1lZ5I0Ylb3X/4/6zHicsKSOwsdEFvxEP5KXgog3WfoAsWcx2AMuN3
	 LMsFES87JOjxw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 13:18:38 +0100
Message-Id: <DFQUX68AGU1T.1QSGMOBWK6YC6@kernel.org>
Cc: "Matthew Maurer" <mmaurer@google.com>, "Gary Guo" <gary@garyguo.net>,
 "John Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 7/8] gpu: nova-core: create debugfs root in module
 init
References: <20260116214959.641032-1-ttabi@nvidia.com>
 <20260116214959.641032-8-ttabi@nvidia.com>
In-Reply-To: <20260116214959.641032-8-ttabi@nvidia.com>

On Fri Jan 16, 2026 at 10:49 PM CET, Timur Tabi wrote:
> Create the 'nova_core' root debugfs entry when the driver loads.
>
> Normally, non-const global variables need to be protected by a
> mutex.  Instead, we use unsafe code, as we know the entry is never
> modified after the driver is loaded.  This solves the lifetime
> issue of the mutex guard, which would otherwise have required the
> use of `pin_init_scope`.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/nova_core.rs | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index d0df8db3693d..eceefa41cddc 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -3,6 +3,7 @@
>  //! Nova Core GPU Driver
> =20
>  use kernel::{
> +    debugfs::Dir,
>      error::Error,
>      pci,
>      prelude::*,
> @@ -27,7 +28,9 @@
> =20
>  pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> =20
> -#[pin_data]
> +static mut DEBUGFS_ROOT: Option<Dir> =3D None;

Please add the FIXME comment that we talked about in the last revision and =
use
debugfs::Dir rather than just Dir.

> +
> +#[pin_data(PinnedDrop)]
>  struct NovaCoreModule {
>      #[pin]
>      _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>=
>,
> @@ -35,12 +38,27 @@ struct NovaCoreModule {
> =20
>  impl InPlaceModule for NovaCoreModule {
>      fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
> +        let dir =3D Dir::new(kernel::c_str!("nova_core"));
> +
> +        // SAFETY: we are the only driver code running, so there cannot =
be any concurrent access to
> +        // `DEBUGFS_ROOT`.
> +        unsafe { DEBUGFS_ROOT =3D Some(dir) };
> +
>          try_pin_init!(Self {
>              _driver <- kernel::driver::Registration::new(MODULE_NAME, mo=
dule),
>          })
>      }
>  }
> =20
> +#[pinned_drop]
> +impl PinnedDrop for NovaCoreModule {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: we are the only driver code running, so there cannot =
be any concurrent access to
> +        // `DEBUGFS_ROOT`.

The driver::Registration is not yet dropped at this point, so there might b=
e
other driver code running. You have to justify that this does not race with
module_init() (which module_exit() never does) and that it does not race wi=
th
Gsp::new(), i.e. probe().

Note that probe() may run async, so you have to drop the driver registratio=
n
manually before dropping the debugfs dir.

> +        unsafe { DEBUGFS_ROOT =3D None };

You also have to drop the debugfs::Dir.

> +    }
> +}
> +
>  module! {
>      type: NovaCoreModule,
>      name: "NovaCore",
> --=20
> 2.52.0

