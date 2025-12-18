Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73971338927
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Dec 2025 10:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052656; cv=none; b=AJvO89GDQCuWtcq3ReB2JbPpWn26qnOSKzqmGBW2POvEADdszBsAQoSGmG4uPOUFwGhHI6qHvF0s7N14EqEwT/28yretOugFJg7IdEUWqVjsIDtLriYqYMhM+F8SOZsSc0PqFU45cL2WhF3bO631/+uAHCp2RkdWEMeWXcKjUSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052656; c=relaxed/simple;
	bh=k4AnuEM5cM2z9536PBg/Etme6m+ff94jyEewMOwsOmk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=MCqRlQkboJdjwFHEIfEtXXQNuFTfrO6O+WeRUC3CIHumEafxGv3dfZpVrqMQyQX6AooQsqZLVJxIJEDlLZi+vxr9d7TOk2U7F0O1p3xJIRP1JPCbzV5kKBb4XjA9arUbPX8hTQZVDDK2UuZif87xouRqIGmL3DQbtW+ps/sYgHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KWgYRsg2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KWgYRsg2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A00C4CEFB;
	Thu, 18 Dec 2025 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766052656;
	bh=k4AnuEM5cM2z9536PBg/Etme6m+ff94jyEewMOwsOmk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=KWgYRsg2Zn8mcfSAfiVY5zZ3Mb6ClUOuvpSD1be8ebGq7DKvMBoulmUEN/qqT1ABs
	 kmcu1WtCY/heLLMzzIeORfZjOA3tma5Fre45E7KS0ydN2LLDostkJwZtJwyv126DZA
	 mkKihaIKIyksnmQro1Xs6KG8XNcddQfNUnMiey4Q0sZ1hb66c9HvFicZdS2U8cSwcH
	 tDVQJ1zib5UfbMxzXw4DZdeDFbh1Ol+l3XyCSMfKjWK0vLLCg+g1tZmCbfmYTOVxka
	 WfXbvIrJx2oMktIkqDir5wfGgArm3iunR6/6a1X075eZ5PeLG/U5Xt/cyGgAGNmVT0
	 d9aM+4ae853jg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 11:10:52 +0100
Message-Id: <DF19F07P95XZ.32ISH5C9QQK75@kernel.org>
Subject: Re: [PATCH v3 6/9] gpu: nova-core: create debugfs root when driver
 loads
Cc: "Gary Guo" <gary@garyguo.net>, <rust-for-linux@vger.kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-7-ttabi@nvidia.com>
In-Reply-To: <20251218013910.459045-7-ttabi@nvidia.com>

On Thu Dec 18, 2025 at 2:39 AM CET, Timur Tabi wrote:
> Create the 'nova_core' root debugfs entry when the driver loads.
> The Dir entry is part of the NovaCoreModule, so when the module
> unloads, the NovaCoreModule object is dropped, and that drops the
> _debugfs_root, which automatically deletes the debugfs file.
>
> Field order in Rust structs determines drop order - fields are dropped
> in declaration order. By placing _driver before _debugfs_root:
>
> 1. The driver registration is dropped first, which removes all PCI
>    devices and their associated debugfs subdirectories
> 2. Then _debugfs_root is dropped, removing the now-empty nova_core
>    directory
>
> This ordering is critical because debugfs_remove() performs recursive
> removal. If the parent directory were removed first, it would free the
> child dentries, and then the child's drop would attempt to remove an
> already-freed dentry, causing a use-after-free crash.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/nova_core.rs | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index 01353be103ca..f17505e5e2b3 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -2,8 +2,7 @@
> =20
>  //! Nova Core GPU Driver
> =20
> -use kernel::{error::Error, pci, prelude::*, InPlaceModule};
> -use pin_init::{PinInit, pinned_drop};
> +use kernel::{debugfs::Dir, error::Error, pci, prelude::*, InPlaceModule}=
;

Again, please use kernel vertical style.

> =20
>  #[macro_use]
>  mod bitfield;
> @@ -24,17 +23,24 @@
> =20
>  pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> =20
> -#[pin_data(PinnedDrop)]
> +#[pin_data]
>  struct NovaCoreModule {
> +    // Note: field order matters for drop order. The driver must be drop=
ped before
> +    // the debugfs directory so that device subdirectories are removed f=
irst.

This is not correct, subdirectories have a reference count of their parent
directory. Hence, the drop order does not matter.

>      #[pin]
>      _driver: kernel::driver::Registration<pci::Adapter<driver::NovaCore>=
>,
> +    _debugfs_root: Dir,
>  }
> =20
>  impl InPlaceModule for NovaCoreModule {
>      fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, E=
rror> {
>          pr_info!("NovaCore GPU driver loaded\n");
> +
> +        let debugfs_root =3D Dir::new(kernel::c_str!("nova_core"));

I'd just inline this statement below.

> +
>          try_pin_init!(Self {
>              _driver <- kernel::driver::Registration::new(MODULE_NAME, mo=
dule),
> +            _debugfs_root: debugfs_root,
>          })
>      }
>  }
> --=20
> 2.52.0

