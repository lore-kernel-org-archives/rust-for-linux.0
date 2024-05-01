Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4DA535B5
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 09:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714554389; cv=none; b=j4HrDfpJxetS3pFxmQpEER+NK01PPEEztGHPKyW6oo2+kIG+/xYfxBF5DqmSy19YSUhi9arM3x3jL5D6dXQQL5Azlbf63V28C6GBINWiiPlp/6AAeW5oDEZCcG6WmMCGcwaJAeN37TkXA005va31/tDk2tPR/CG0zx1AmI4/BRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714554389; c=relaxed/simple;
	bh=uw4xXTxt7Nk3WO7vF7BGhYYIR2is5MBb+cFd007uQQE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VpWznKeCgP+nNAhaV49jdEiQaU4eTP+rG7p9XXKAiaAdbwPDigWKMbPfZ4jx91ok5iXNU6DxKLAcJD3xnlZoezFb/2pY5gWjSR0JdE2OTmmnmWVM+rJR0n9ffdQ/StthNzwAVUZzoINNwTN8Ek289Di+PRwmasNUYtCwfPtukBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fglQEj5z; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fglQEj5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1714554384; x=1714813584;
	bh=J3Nc9ak+uW320G2NySF6zfEP26uWMKAy82Eblf0pS/A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fglQEj5zdQWERIhT7MRANPfjF2jBVBtAQbUgV+JWl1eT+ZzIlWpMpQKt8eTGFhU5B
	 hrFCsWcUiEt8otoazBNaXDF5ZRQu6PqVjwZz3riR5VbBesPsb0FcRdplFIeVcTescE
	 hFxLKo3s/g6VeFl00SEJsV04fYpeZwPoXKUlMK2I7VbiBII7K4gXBghhNJEZFziEnU
	 rIGTiVbQmCaFn0fD/8H+rlY7f0nK+2pColWuBlqLCytst3S9mRZDUjxAApPUc21hIY
	 c2KzFXLr443vrJuQ6XWFACHz28H33amXZ9qDKeirexHqS8DvAOzg15bk2leZ5dbniH
	 AU4sF3Wuqqu0g==
Date: Wed, 01 May 2024 09:06:18 +0000
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, rust-for-linux@vger.kernel.org
From: Benno Lossin <benno.lossin@proton.me>
Cc: miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH v1] rust: add 'firmware' field support to module! macro
Message-ID: <d6e2ea94-17a7-46c6-918e-e02ce3a0922e@proton.me>
In-Reply-To: <20240426095627.37333-1-fujita.tomonori@gmail.com>
References: <20240426095627.37333-1-fujita.tomonori@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: bcba0ce926600b1c9c1fa474e9533be1a016e2a2
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.04.24 11:56, FUJITA Tomonori wrote:
> This adds 'firmware' field support to module! macro, corresponds to
> MODULE_FIRMWARE macro. You can specify the file names of binary
> firmware that the kernel module requires. The information is embedded
> in the modinfo section of the kernel module. For example, a tool to
> build an initramfs uses this information to put the firmware files
> into the initramfs image.
>=20
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/macros/lib.rs    | 31 +++++++++++++++++++++++++++++++
>  rust/macros/module.rs | 18 ++++++++++++++++--
>  2 files changed, 47 insertions(+), 2 deletions(-)

I left one comment below, otherwise LGTM:

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

> diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
> index f489f3157383..73fa768fce64 100644
> --- a/rust/macros/lib.rs
> +++ b/rust/macros/lib.rs
> @@ -67,6 +67,36 @@
>  /// }
>  /// ```
>  ///
> +/// ## Firmware
> +///
> +/// The following example shows how to declare a kernel module that need=
s
> +/// to load binary firmware files. You need to specify the file names of
> +/// the firmware in the `firmware` field. The information is embedded
> +/// in the `modinfo` section of the kernel module. For example, a tool t=
o
> +/// build an initramfs uses this information to put the firmware files i=
nto
> +/// the initramfs image.
> +///
> +/// ```ignore
> +/// use kernel::prelude::*;
> +///
> +/// module!{
> +///     type: MyDeviceDriverModule,
> +///     name: "my_device_driver_module",
> +///     author: "Rust for Linux Contributors",
> +///     description: "My device driver requires firmware",
> +///     license: "GPL",
> +///     firmware: ["my_device_firmware1.bin", "my_device_firmware2.bin"]=
,
> +/// }
> +///
> +/// struct MyDeviceDriverModule;
> +///
> +/// impl kernel::Module for MyDeviceDriverModule {
> +///     fn init() -> Result<Self> {
> +///         Ok(Self)
> +///     }
> +/// }
> +/// ```
> +///
>  /// # Supported argument types
>  ///   - `type`: type which implements the [`Module`] trait (required).
>  ///   - `name`: byte array of the name of the kernel module (required).
> @@ -74,6 +104,7 @@
>  ///   - `description`: byte array of the description of the kernel modul=
e.
>  ///   - `license`: byte array of the license of the kernel module (requi=
red).
>  ///   - `alias`: byte array of alias name of the kernel module.
> +///   - `firmware`: array of the file names of firmware required by the =
kernel module.

There is a patch [1] that updates this list. It will have a v2, with
this list specifying the types that can be put there due to this [2]
comment.

We should have the same kind of item for the `firmware` field here. I
would suggest:

     ///   - `firmware`: array of ASCII string literals of the firmware fil=
es of the kernel module.

[1]: https://lore.kernel.org/rust-for-linux/20240419215015.157258-3-aswinun=
ni01@gmail.com/
[2]: https://lore.kernel.org/rust-for-linux/CANiq72=3Dg4f60n8x=3D-fCxqQ4QzD=
2eOrEb=3DvEXgoNidY-N4omN1A@mail.gmail.com/

--=20
Cheers,
Benno

>  #[proc_macro]
>  pub fn module(ts: TokenStream) -> TokenStream {
>      module::module(ts)

