Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A62205132
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730209072; cv=none; b=uS9mM0tVOO4rp/BvCd+z2k/M4VzkIKDK8OJJ8aVEeShoUXWFX0B2s/9fVnwEQwtXj9xSycR1njOISi5kVDe2fNOxV6h+YXtG6iCf9hNX97rB26ngfxgvEuktH7hAf9JcAqY7CkhoW93ZFeelIKf2I5/AZeYtd19tSvH0glnhpdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730209072; c=relaxed/simple;
	bh=GND/WorrV9FkOhia0bvZDFHolTvInRwiHCzjYuesh8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGJ80waK3w61UMke2rTJv5DMpBCPMl66V6j12e4glhqpRlMniHhgjfJG5blKLzvCJQpgjVOLTlBISwhYcrjjVeQ2kK/EXjd4j9lIAqDAR05Za9qmGgz9lBaTS5Ga+QIvGQL2P9IfrfA2J0o/WI+iHQGxqM/wcwZPZqORB9DXtC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y6GVf+WK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y6GVf+WK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so52425865e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 06:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730209068; x=1730813868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHjXQ7SseZStdWtp4M3yo7TikmtScrCLnios0Konpt0=;
        b=y6GVf+WKeLUVPTpwiGlQQ6R+yhdRPnsV5/+HeM3TQGRTqLF9UCitNC2a6ZDqw69Nbk
         R2nGvB4QA+Kn+Io5bR3yU7Bvx07RrVuI3El2S5Uefn6hiw89kh0MU5bkzEs4Depy5GRg
         2MUlFloxnwitAHIHmzOibukP8RmAiB4FpS6mn8ANlcNAAmX8fqBecnEuMM1YK+i+vgbb
         aB6EqrOGdk0ov9nZb2sn7svE6wgvHXwbFHC62HV/pcobNsx62QaAE0AcmruhRlRsHSLV
         bNBWSqt942BDKoyC7qWFiM/+d+rnwMIppZRGpW2uZkkJO1Du3a6hoOIbi9XC9Oe8QkiO
         Evfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730209068; x=1730813868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHjXQ7SseZStdWtp4M3yo7TikmtScrCLnios0Konpt0=;
        b=SXYjN8Vm1eKjpzPPyalc4ktoxx9ezZz7EmKot+v1xC30fmN0U7Z3wokpE66I5gLWvE
         W8lL9AeZOSNO8Q6XO7Rwt8tdp0uqZvu9lqOfxC1NCOHBmFcKhJpj0TBsBje/t1uYyDeD
         R6UGW8e32xfOHzBjZNX3dHHHHmkBlUlTNazRMKTOch11lZZuGFj7lM9kqHOikGuuqhO9
         soD9yn74z4gq3mRgtBOhVlL1p88p9mustp5npoIEof0rjoUCbialyzgyRjsD3uIjXBfb
         Ra+DK19TKPiVotuLEYOeUB7oVZbwxEKMCilt0LAU3eQw7jhKjMcaAay+0SoeHDJsIiec
         BlsA==
X-Forwarded-Encrypted: i=1; AJvYcCUO02D2ELjj2JHlu5uujP0AlAqoMkD3KaWV6VYpLukejvq5oKqGNskg5gs8OLrWWGSjBpT1Y1MQb2GbCTg3fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4q0yQ09Ye4gisMVEA9/HRnpCmrdKrjWcfRqRnE+NcEMs+fUyf
	21DUljWVOIEidlxAJqAZgpYTKW+N8zPpy79sTYhkMJEU2nznLEHpmLSZqz0n5D4fqSESDlwuyF7
	fsqXjjJFSGCoOzvvD1ozgCCp9vetpDQxXqQZI
X-Google-Smtp-Source: AGHT+IGoJLMwFKqdGVQYxgqNckaKkLJooLVh1zvBc4VOiRWEyfKZ5Pk6g1m3IKME2AkWQnzefHEhe6i0eTPL5cS8P9g=
X-Received: by 2002:a05:6000:1:b0:37c:cca1:b1e3 with SMTP id
 ffacd0b85a97d-380611dcb75mr7778568f8f.41.1730209068300; Tue, 29 Oct 2024
 06:37:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022213221.2383-1-dakr@kernel.org> <20241022213221.2383-15-dakr@kernel.org>
In-Reply-To: <20241022213221.2383-15-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Oct 2024 14:37:35 +0100
Message-ID: <CAH5fLgh-CyMeRMm4OK-iNMP0n2UBu9_Qj6M0ch0t6wpaSEi6mw@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] rust: of: add `of::DeviceId` abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> `of::DeviceId` is an abstraction around `struct of_device_id`.
>
> This is used by subsequent patches, in particular the platform bus
> abstractions, to create OF device ID tables.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS                     |  1 +
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/lib.rs              |  1 +
>  rust/kernel/of.rs               | 63 +++++++++++++++++++++++++++++++++
>  4 files changed, 66 insertions(+)
>  create mode 100644 rust/kernel/of.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d9c512a3e72b..87eb9a7869eb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17340,6 +17340,7 @@ T:      git git://git.kernel.org/pub/scm/linux/ke=
rnel/git/robh/linux.git
>  F:     Documentation/ABI/testing/sysfs-firmware-ofw
>  F:     drivers/of/
>  F:     include/linux/of*.h
> +F:     rust/kernel/of.rs
>  F:     scripts/dtc/
>  F:     tools/testing/selftests/dt/
>  K:     of_overlay_notifier_
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index cd4edd6496ae..312f03cbdce9 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -15,6 +15,7 @@
>  #include <linux/firmware.h>
>  #include <linux/jiffies.h>
>  #include <linux/mdio.h>
> +#include <linux/of_device.h>
>  #include <linux/pci.h>
>  #include <linux/phy.h>
>  #include <linux/refcount.h>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3ec690eb6d43..5946f59f1688 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -51,6 +51,7 @@
>  pub mod list;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
> +pub mod of;
>  pub mod page;
>  pub mod prelude;
>  pub mod print;
> diff --git a/rust/kernel/of.rs b/rust/kernel/of.rs
> new file mode 100644
> index 000000000000..a37629997974
> --- /dev/null
> +++ b/rust/kernel/of.rs
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Open Firmware abstractions.
> +//!
> +//! C header: [`include/linux/of_*.h`](srctree/include/linux/of_*.h)
> +
> +use crate::{bindings, device_id::RawDeviceId, prelude::*};
> +
> +/// An open firmware device id.
> +#[derive(Clone, Copy)]
> +pub struct DeviceId(bindings::of_device_id);
> +
> +// SAFETY:
> +// * `DeviceId` is a `#[repr(transparent)` wrapper of `struct of_device_=
id` and does not add
> +//   additional invariants, so it's safe to transmute to `RawType`.

Your #[repr(transparent)] marker is missing.

> +// * `DRIVER_DATA_OFFSET` is the offset to the `data` field.
> +unsafe impl RawDeviceId for DeviceId {
> +    type RawType =3D bindings::of_device_id;
> +
> +    const DRIVER_DATA_OFFSET: usize =3D core::mem::offset_of!(bindings::=
of_device_id, data);
> +
> +    fn index(&self) -> usize {
> +        self.0.data as _
> +    }
> +}
> +
> +impl DeviceId {
> +    /// Create a new device id from an OF 'compatible' string.
> +    pub const fn new(compatible: &'static CStr) -> Self {

Since you make a copy of `compatible`, you don't need 'static.

> +        let src =3D compatible.as_bytes_with_nul();
> +        // Replace with `bindings::of_device_id::default()` once stabili=
zed for `const`.
> +        // SAFETY: FFI type is valid to be zero-initialized.
> +        let mut of: bindings::of_device_id =3D unsafe { core::mem::zeroe=
d() };
> +
> +        let mut i =3D 0;
> +        while i < src.len() {
> +            of.compatible[i] =3D src[i] as _;
> +            i +=3D 1;
> +        }
> +
> +        Self(of)
> +    }
> +
> +    /// The compatible string of the embedded `struct bindings::of_devic=
e_id` as `&CStr`.
> +    pub fn compatible<'a>(&self) -> &'a CStr {

This should probably be:

pub fn compatible(&self) -> &CStr {

Right now, the returned CStr is not tied to self at all, even though
it points inside `self`.

Alice
