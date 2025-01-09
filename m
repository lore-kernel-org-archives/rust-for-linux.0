Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58843218E88
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jan 2025 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736430435; cv=none; b=eZqlDk0uY0lmq2QIH0f4ypQnypplLkej8rBE2kJ/DAoHL1EiwjSiL/zk5rEeWdeC9yiWc75Mfq2wCcgZin2Q8ks/kvziytRD97K3F9ZvGTn/a//bbRJDSY2AHoQRO20O63X4k1MdX45MEZyQQVXN6Tq0dh6ICiuFEpjBuTz+DMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736430435; c=relaxed/simple;
	bh=4Z3v633SiBtHD9mw1R/Zvb5bocP/cEmmsASPYelx+7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C2RUS8A1m+OFEWavI+ozYpIRjp99p1Lob+4noCblDExEozI5WHvZZ24CWQBFkPDcLT1qEOlA2O5YCyJZ9Pa8KQgf12UPxfYx+rF7MOVfpjLq70kn7ZaLou9AQOB6zTBMi+c42ubvvHXtSWaDPt4s+HMxqi1mdnxs+04FUr+g28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=34LZwP4X; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="34LZwP4X"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361f664af5so11772415e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jan 2025 05:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736430432; x=1737035232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIlVap8mGvAxLI38Cf/1/3f62/QgGkjUuncYXG4UNLw=;
        b=34LZwP4Xs2q4XgcCKtHkil9aINe5sHyIUSj5HBxGh8E0/lGW94AZh4/wTynTLb5GE4
         zwgp+4AvY68Pdy6a6KEVuI3JtHXXqxdEdfBjDPdChB4XQ+3Z31L4EREAi4cvMQDWDnTR
         ZFXPcRBnV3K9hqxgd0U+We3PPVBkwvn9LVboJmY83PEY8SF5kVdLMStXF7sCtQBLAtKV
         kNZyvJyJeayAtQggiuFvWRI0xJrAym4ZMjlaRhy0tH1LtW7BPvQI0EvliBe5w6HenTj/
         KpSBlrb8qfMu89RVGlE68+oRi7nt0IdOmg12yDyGAUzpvy/w0DeFZzDUb+VRLnK/mhVy
         rEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736430432; x=1737035232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIlVap8mGvAxLI38Cf/1/3f62/QgGkjUuncYXG4UNLw=;
        b=CGRaMGSauXT2pE7Z2mSW8IM/wommDP2u/jch8QDPSzqOBGxv5hfbX6Bht0MYn1lBuB
         lKxmG7B7GOg44qnWTJw7CSIRNeTUSmZCMg7kwrF9qXw7DeS7MqY3ruOj93v2MmkxEIAL
         nVQJtyazvXrVJjRbI4k/OHIV9WL8B2tMgU62HHyTSQxBOvkwSPCo1+fcTYl2+2edNrTG
         ZVPAke+Rm2P0sTLpUdEjdPp91Rj4AloKyTzqFrumO/hjLAHn5YBLROvysmcgquhsSXID
         WtVK/WzUzg/fdUAtmc/4jsEeMOQVGzANxS4nVE6pqkVhQ3/uKnzOXyyAjOUD1JczL5SY
         M04Q==
X-Forwarded-Encrypted: i=1; AJvYcCXncSP0f+f9A2ycQldTfVwHMh1tk8hKemKQtSsl4v5dZrraHKcv4Lnfm+wBEsnAiJiYOPKK6m5vvV/tUpYOlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiMTW3fUTaKfw5GJuYxT6HsFOaF+Qa43RqBQ+EHJoDUlho5ZM
	5jsfFLV/5HYp0fDgPeRDhY2Vgx6nW63UDk3vG+vGTBe3GZpMe2y3isaMzzK16BO64PaseYR8yeN
	++HUZNllsqtwxk2fobl7n3cvzi+2EUmGB2sXg
X-Gm-Gg: ASbGncslqeSCjqWdpRTSIzM7Gr4RlL2wUtx2qnFYm05ZSi20YpEF/FSwQboBT2oMavy
	4Lopb95QhBV8fFnWTljWz4sgzZWB0jnlBIggIkTc=
X-Google-Smtp-Source: AGHT+IEp54Lrqdbrrm3Cg2fYgsH5GAZmhdVgqsMaY2Pk+ZSt3rRXiK5yg8vd4V/5WIw3g25LeSZclre5eXQq/NcnWKU=
X-Received: by 2002:a5d:598d:0:b0:385:f72a:a3b0 with SMTP id
 ffacd0b85a97d-38a8733a3ecmr5853760f8f.55.1736430431603; Thu, 09 Jan 2025
 05:47:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-topic-panthor-rs-platform_io_support-v3-1-08ba707e5e3b@collabora.com>
 <20250109133057.243751-2-daniel.almeida@collabora.com>
In-Reply-To: <20250109133057.243751-2-daniel.almeida@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 9 Jan 2025 14:46:59 +0100
X-Gm-Features: AbW1kvYrYwzB5yUNORuGEmQykWSE1hbR3JgnJ7TNz85nnD1ZOoVjnKlIpylM-h0
Message-ID: <CAH5fLgjC3mOp688vGgfhv5Bq0TzbaXuE1DMTXk3Ck7UqxJi+Pg@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: io: add resource abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	tmgross@umich.edu, gregkh@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, boris.brezillon@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 2:32=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> In preparation for ioremap support, add a Rust abstraction for struct
> resource.
>
> A future commit will introduce the Rust API to ioremap a resource from a
> platform device. The current abstraction, therefore, adds only the
> minimum API needed to get that done.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/helpers/io.c               |  7 +++++
>  rust/kernel/io.rs               |  2 ++
>  rust/kernel/io/resource.rs      | 49 +++++++++++++++++++++++++++++++++
>  4 files changed, 59 insertions(+)
>  create mode 100644 rust/kernel/io/resource.rs
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
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
> @@ -99,3 +100,9 @@ void rust_helper_writeq_relaxed(u64 value, volatile vo=
id __iomem *addr)
>         writeq_relaxed(value, addr);
>  }
>  #endif
> +
> +resource_size_t rust_helper_resource_size(struct resource *res)
> +{
> +       return resource_size(res);
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
>  /// By itself, the existence of an instance of this structure does not p=
rovide any guarantees that
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
> +//! C header: [`include/linux/ioport.h`](../../../../include/linux/iopor=
t.h)

Please use srctree instead of ../../../..

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
> +    /// The caller must ensure that for the duration of 'a, the pointer =
will
> +    /// point at a valid `bindings::resource`
> +    ///
> +    /// The caller must also ensure that the `Resource` is only accessed=
 via the
> +    /// returned reference for the duration of 'a.
> +    pub(crate) unsafe fn from_ptr<'a>(ptr: *mut bindings::resource) -> &=
'a Self {
> +        // SAFETY: Self is a transparent wrapper around `Opaque<bindings=
::resource>`.
> +        unsafe { &mut *ptr.cast() }

Please remove the `mut` here.

> +    }
> +
> +    /// Returns the size of the resource.
> +    pub fn size(&self) -> bindings::resource_size_t {
> +        let inner =3D self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`

If you're going to refer to the invariants of Reserve, then it should
have an "# Invariants" section.

> +        unsafe { bindings::resource_size(inner) }
> +    }
> +
> +    /// Returns the start address of the resource.
> +    pub fn start(&self) -> u64 {
> +        let inner =3D self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { *inner }.start
> +    }
> +
> +    /// Returns the name of the resource.
> +    pub fn name(&self) -> &CStr {
> +        let inner =3D self.0.get();
> +        // SAFETY: safe as per the invariants of `Resource`
> +        unsafe { CStr::from_char_ptr((*inner).name) }
> +    }
> +}
> --
> 2.47.1
>
