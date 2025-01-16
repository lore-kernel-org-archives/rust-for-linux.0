Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450EA24A7C2;
	Thu, 16 Jan 2025 11:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737026799; cv=none; b=GlPblqNfhKr93j0ovw0clP41QHC5bLvibf50OUdZzvAgIsboNeqI6i5R3Ha4L8XLiPW7PD27JBpqPFLEb9OmWU/Zb+YJ7SOMYzkDSTeGymxihu+kTAMY1KRDcgyX8KKdJrP5GxZDnCTK33v8VTZ1eyt5WiZHyy37aXuwagC7kiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737026799; c=relaxed/simple;
	bh=yOW/PBXmaiRHTOvJfSBhnoNSrZ7GTZ9nm3RZwF0X42M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qzHGi8ErzGt7hCaehMQq+1xk6hrLNyy1hk5LkAcRzj/RUhcf9ppVOYgaMyB9/NMdGsCwX6GlsKGB+YV5NBN++LrX0dvbJOah1QP11WVUGseUjbukFIdjZRX3wpzpvlt8dbAq76uaV4LJHGaRSHbkYwCa8AkoTe+x4PVvi00C9CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=MJKW3w1G; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="MJKW3w1G"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1737026792; bh=cHHctvmp0FQOQbzkdKfG30CiR62KPfqJlBlBnL5DGck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MJKW3w1G/XHj75ZIYvQj3d7ZANECDM7AphX/GZLrJ3kYqp0mRyPWzN7dBp0rzW+l0
	 sHf1t1wsRwZPgZC/in9eUeupDXHslIiUWoocNCUcIrZfWO6vBXgNzM0X3MqXkA27g/
	 WjkL2hzOSoZ/X7BcaI9RKJe8xxuYgQP94AxhcgXo=
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, boris.brezillon@collabora.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] rust: io: add resource abstraction
Date: Thu, 16 Jan 2025 12:26:31 +0100
Message-ID: <F1056C79-4FCE-494C-B5BF-D777B1430ED1@kloenk.dev>
In-Reply-To: <20250109133057.243751-2-daniel.almeida@collabora.com>
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
 <20250109133057.243751-2-daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable



On 9 Jan 2025, at 14:30, Daniel Almeida wrote:

> In preparation for ioremap support, add a Rust abstraction for struct
> resource.
>
> A future commit will introduce the Rust API to ioremap a resource from =
a
> platform device. The current abstraction, therefore, adds only the
> minimum API needed to get that done.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/io.c               |  7 +++++
>  rust/kernel/io.rs               |  2 ++
>  rust/kernel/io/resource.rs      | 49 +++++++++++++++++++++++++++++++++=

>  4 files changed, 59 insertions(+)
>  create mode 100644 rust/kernel/io/resource.rs
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_h=
elper.h
> index e9fdceb568b8..f9c2eedb5b9b 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -16,6 +16,7 @@
>  #include <linux/file.h>
>  #include <linux/firmware.h>
>  #include <linux/fs.h>
> +#include <linux/ioport.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
>  #include <linux/mdio.h>
> diff --git a/rust/helpers/io.c b/rust/helpers/io.c
> index 4c2401ccd720..3cb47bd01942 100644
> --- a/rust/helpers/io.c
> +++ b/rust/helpers/io.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>
>  #include <linux/io.h>
> +#include <linux/ioport.h>
>
>  void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
>  {
> @@ -99,3 +100,9 @@ void rust_helper_writeq_relaxed(u64 value, volatile =
void __iomem *addr)
>  	writeq_relaxed(value, addr);
>  }
>  #endif
> +
> +resource_size_t rust_helper_resource_size(struct resource *res)
> +{
> +	return resource_size(res);
> +}
> +
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index d4a73e52e3ee..566d8b177e01 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -7,6 +7,8 @@
>  use crate::error::{code::EINVAL, Result};
>  use crate::{bindings, build_assert};
>
> +pub mod resource;
> +
>  /// Raw representation of an MMIO region.
>  ///
>  /// By itself, the existence of an instance of this structure does not=
 provide any guarantees that
> diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
> new file mode 100644
> index 000000000000..84876af1699c
> --- /dev/null
> +++ b/rust/kernel/io/resource.rs
> @@ -0,0 +1,49 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Abstraction for system resources.
> +//!
> +//! C header: [`include/linux/ioport.h`](../../../../include/linux/iop=
ort.h)
> +
> +use crate::str::CStr;
> +use crate::types::Opaque;
> +
> +/// A resource abstraction.
> +#[repr(transparent)]
> +pub struct Resource(Opaque<bindings::resource>);
> +
> +impl Resource {
> +    /// Creates a reference to a [`Resource`] from a valid pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must ensure that for the duration of 'a, the pointe=
r will
> +    /// point at a valid `bindings::resource`
> +    ///
> +    /// The caller must also ensure that the `Resource` is only access=
ed via the
> +    /// returned reference for the duration of 'a.
> +    pub(crate) unsafe fn from_ptr<'a>(ptr: *mut bindings::resource) ->=
 &'a Self {
> +        // SAFETY: Self is a transparent wrapper around `Opaque<bindin=
gs::resource>`.
> +        unsafe { &mut *ptr.cast() }
> +    }
> +
> +    /// Returns the size of the resource.
> +    pub fn size(&self) -> bindings::resource_size_t {
> +        let inner =3D self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { bindings::resource_size(inner) }
> +    }
> +
> +    /// Returns the start address of the resource.
> +    pub fn start(&self) -> u64 {
> +        let inner =3D self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { *inner }.start
> +    }

`start` and `size` return different types in the rust abstraction but on =
the C side both are of type `resource_size_t`.
(That=E2=80=99s why I created a type alias depending on the config for my=
 abstraction[0] which I know am rewriting to use this)

[0]: https://lore.kernel.org/rust-for-linux/20250113121620.21598-5-me@klo=
enk.dev/

Thanks
Fiona

> +
> +    /// Returns the name of the resource.
> +    pub fn name(&self) -> &CStr {
> +        let inner =3D self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { CStr::from_char_ptr((*inner).name) }
> +    }
> +}
> -- =

> 2.47.1
