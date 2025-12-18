Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1067B23F27B
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 09:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766048480; cv=none; b=AoBtJ3v/QP1ANigoYj2I49Dme5aHa2ZHOwu4MsfQma2MCxXRKfWYvgu5om2T8g7Z4aGHqGkmGeTFMDdPA03QnueH3VneuTaM2KHimD3iFcdCVwInO2ICLwtXVqTruRTgbGkCQ8pkj/FHUNqJwdu8DVvS3V0u1Xe7Yhufek7K5Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766048480; c=relaxed/simple;
	bh=afeAQJRCnu4GRHnu5E5kfLOK1xWhPyYLbd+eFtITJ+w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TTLagifp/+Y2WSXqKEnkHJCK7/WJq5osy9PF85IO5s2sWvBMvhu4Fj3A8U2pNyeFOl1OQN5KkYT8GJFvQ2+dQrcp6M2RkZIH6AncSROxf+VO4PlejMIt9A13eqGZNEz0fINIMXk+ylKYQDpbBs/blKVZL0zUZvpdF4j1NBLgnbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBEbtPot; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBEbtPot"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26A25C4CEFB;
	Thu, 18 Dec 2025 09:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766048479;
	bh=afeAQJRCnu4GRHnu5E5kfLOK1xWhPyYLbd+eFtITJ+w=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=sBEbtPotMzYJvW58gLZbIA2sN4jEkILwBFePD5sTuF8TqonBXGW4QYxLuCvusY7gI
	 U/9bFCey1JZhHUyfb5zyHXNcyvVxlwjRjmlww/6IflJuJNGwsEC/y8AVlPNB/aPCPW
	 PL4oG/YylRUKKTfgypYpUN0FpISqhjrmlI7GGLZ0MQuu6TRQvwvvRfSJiqwSVIyXQA
	 RSE6QRmp5bWu1VeRhsshxE9wNCD2Yi34uah2mTiTbugyZqE8mRdZ3ZNk/Mbk/nc4zN
	 GfmFcosRvKDbOv0MXWQLFV22MashEyvjpmIk0oaB+jaywLnt760m1oArdLowTi9ipo
	 tz3m4ksujvphQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 10:01:16 +0100
Message-Id: <DF17XPT1MU64.ZXT4LSXR9CIG@kernel.org>
Subject: Re: [PATCH v3 5/9] gpu: nova-core: Replace module_pci_driver! with
 explicit module init
Cc: "Gary Guo" <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-6-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-6-ttabi@nvidia.com>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index b98a1c03f13d..01353be103ca 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,6 +2,9 @@
> =20
>  //! Nova Core GPU Driver
> =20
> +use kernel::{error::Error, pci, prelude::*, InPlaceModule};
> +use pin_init::{PinInit, pinned_drop};

Please use kernel vertical style [1].

[1] https://docs.kernel.org/rust/coding-guidelines.html#imports

> +
>  #[macro_use]
>  mod bitfield;
> =20
> @@ -21,13 +24,27 @@
> =20
>  pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> =20
> -kernel::module_pci_driver! {
> -    type: driver::NovaCore,
> +#[pin_data(PinnedDrop)]
> +struct NovaCoreModule {
> +    #[pin]
> +    _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>=
>,
> +}
> +
> +impl InPlaceModule for NovaCoreModule {
> +    fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
> +        pr_info!("NovaCore GPU driver loaded\n");

Please don't add such print statements, drivers should be silent when they =
work
properly.

> +        try_pin_init!(Self {
> +            _driver <- kernel::driver::Registration::new(MODULE_NAME, mo=
dule),
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

This change seems unrelated, please send a separate patch for this.

>  }
> =20
>  kernel::module_firmware!(firmware::ModInfoBuilder);
> --=20
> 2.52.0

