Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DEE1FDE39
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 16:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982542; cv=none; b=Rc8x9WL5MFlKSTE9gyaEVahTbNvsHy9DHZWfhRL/jHd1PAeYeqJvKmrzLL2+A6vF4mS9rphhX8BlGxR7UbZUJ9MxLaT3gq5XxJ1t/63jp0asjrSSttrrsgkRpLPiRZqNd9WZ/HxLeOHV/pC9NNqD7Qf/6nmaxHwrT+CqPgiamIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982542; c=relaxed/simple;
	bh=emJwioSET82ma5wk2Wj8pD4x+CUD8+IT98gNrkXVzjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c8dWNBzl4WuILxQEI6h4IBL/AuSBjQx1AjCcnrsaGWtLAVQGg74pEJxKj250Qqr0a+Wf8pI8IppJbiTvuqtMPk8oEIeOk4Ic93M2GhCFdQ55sIagmPHuTwNOUbOkffm9tFkRU41b85YzCb4GTxmG6I5VyQOfDsRIj8KWjSY/Ljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fYQ5Ev10; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fYQ5Ev10"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f26a82d1dso3501421f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Feb 2025 08:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739982538; x=1740587338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFRbR48ppuOSqbaCOW7HIqpzgud5csABpIpz146ytiI=;
        b=fYQ5Ev10eVsP5Sr2D1seGuqe7mqlEQO7yz/XkdDL0J4XsrXEBuNY7WQMi4UQdTQSlX
         Kt9r2AaoC0DPd2e8BQOkWbIy9Ax2y7ln2U6SXa/sO1Ct3UJbKaXdXjvtNUkx2D7O+MAD
         5uS8SXF6WS+Osy1Cbo9RSgbQFRwEOLUYIgROHCXsZmJqFJpOnS2KX3yBYXcM2J1VtiN0
         aJatPAfA2bk7u7FikJYyWScnjf/EWWmsUEKPzoMHaNjq7llzdj2sPxZU6J8ObQsJrJ0l
         Z7MRFAZAC0YHVB/+EtYfLAt+1ow6+uL5sijFRWLa0VYsTdgs1Gi27hoTKuxLfcJtxfJn
         JjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739982538; x=1740587338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFRbR48ppuOSqbaCOW7HIqpzgud5csABpIpz146ytiI=;
        b=dTPtZg+CfYy4lliB5PE7YD0wSs8XmUcwcfCkv8HUjU6wgzi2H6QuiO+2O/rBSDGZmk
         w8Tc0vlkIX9ZYiltoZix7ObWYeGh/KeVp3dAI2boq/hV6ym1zmKiUVuy7jDNEbgGDu6L
         bV7vZnXvfptZJCLW3id533RawH37rgywQzxfX+drhwT7yVtl0Aun0SpYu0pfgCkrTQEA
         ZZYtvu566DfbjPaODNkspInCnwKQdQIEkC92qZVshswrh1t5crxhNg9/cpPTQUhIrr8o
         aJ576AutFIdAZbTsHh1bU3g3Kd+dZwa+J/tIoQ23DxQA25PrJ7/A8zdOnITXbQbtPZo8
         0QmA==
X-Forwarded-Encrypted: i=1; AJvYcCW4mBaH/MTOh0eZCw4ql8r9y6dQ4NqKBN6cJlDQyLTuDMR7oMBhhtazTXiYy4rG23C05um3oFp7zxU3Xi+DZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2WCXIA6qrwfak0F++Gi745P9ytvn9XlbcPwTmVPdyn2Ab0i5B
	6kNHC6X2BIk79auusV3DqJxz4inybY9S/QAK2c5BG0oR/D4LZhhDruhI/+pnkh3YfT3hf7WMh8L
	WwHRUdeP1yPCF2rp8cH+626ixFiMS/rl60CEH
X-Gm-Gg: ASbGnctc5bLNhB6VEjPJg1W2I0dLGP81HFF2zfiRv7znnhORfI4fhTO6cXB/3MMHvcX
	DXnBNFzkHfTeOwKYB3ZE8woL9OkRgeMSADWxxB7l76F0b4ENrY1vClUEi+XDAZXyZ/NF3G/QMvp
	IAHZ7L+NysAE9/FQcLu44a3Wau
X-Google-Smtp-Source: AGHT+IG495bFTbE1P6h3BVXkY4LEgL34rIWGX80Z/ZM6WtwUQeIReUc06KCZ2SrkFKNMU2/Qx08kXHZdYYzMqhAy6s8=
X-Received: by 2002:a5d:5888:0:b0:38f:27d3:1b3b with SMTP id
 ffacd0b85a97d-38f33f11925mr15697927f8f.11.1739982538436; Wed, 19 Feb 2025
 08:28:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219162517.278362-1-daniel.almeida@collabora.com>
In-Reply-To: <20250219162517.278362-1-daniel.almeida@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 19 Feb 2025 16:28:46 +0000
X-Gm-Features: AWEUYZnQJ9lIBvSmKT_baEuG0BJNmNaSDuOffAsZaEl1gqpYyNt5U2oDUDBg0Fw
Message-ID: <CAH5fLgiErvnziU-hSCV6djNq7Q56ZfX9gZudmX7+r06hWoX0Tw@mail.gmail.com>
Subject: Re: [PATCH] rust: regulator: add a bare minimum regulator abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, sebastian.reichel@collabora.com, 
	sjoerd.simons@collabora.co.uk, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	a.hindborg@kernel.org, benno.lossin@proton.me, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 4:26=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Add a bare minimum regulator abstraction to be used by Rust drivers.
> This abstraction adds a small subset of the regulator API, which is
> thought to be sufficient for the drivers we have now.
>
> Regulators provide the power needed by many hardware blocks and thus are
> likely to be needed by a lot of drivers.
>
> It was tested on rk3588, where it was used to power up the "mali"
> regulator in order to power up the GPU.
>
> Note that each instance of [`Regulator`] obtained from
> `Regulator::get()` can only be enabled once. This ensures that the calls
> to enable and disable are perfectly balanced before `regulator_put()` is
> called, as mandated by the C API.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/lib.rs              |   2 +
>  rust/kernel/regulator.rs        | 120 ++++++++++++++++++++++++++++++++
>  3 files changed, 123 insertions(+)
>  create mode 100644 rust/kernel/regulator.rs
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index 55354e4dec14..92504f19655e 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -28,6 +28,7 @@
>  #include <linux/poll.h>
>  #include <linux/property.h>
>  #include <linux/refcount.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sched.h>
>  #include <linux/security.h>
>  #include <linux/slab.h>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 496ed32b0911..0224f4c248c0 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -68,6 +68,8 @@
>  pub mod prelude;
>  pub mod print;
>  pub mod rbtree;
> +#[cfg(CONFIG_REGULATOR)]
> +pub mod regulator;
>  pub mod revocable;
>  pub mod security;
>  pub mod seq_file;
> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> new file mode 100644
> index 000000000000..df6eb325d11a
> --- /dev/null
> +++ b/rust/kernel/regulator.rs
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Regulator abstractions.
> +//!
> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include/lin=
ux/regulator/consumer.h)
> +
> +use crate::{
> +    bindings,
> +    device::Device,
> +    error::{from_err_ptr, to_result, Result},
> +    prelude::*,
> +};
> +
> +use core::ptr::NonNull;
> +
> +/// A `struct regulator` abstraction.
> +///
> +/// Note that each instance of [`Regulator`] obtained from `Regulator::g=
et()`
> +/// can only be enabled once. This ensures that the calls to enable and =
disable
> +/// are perfectly balanced before `regulator_put()` is called, as mandat=
ed by
> +/// the C API.
> +///
> +/// # Invariants
> +///
> +/// - [`Regulator`] is a non-null wrapper over a pointer to a `struct re=
gulator`
> +///   obtained from `regulator_get()`.
> +/// - Each instance of [`Regulator`] obtained from `Regulator::get()` ca=
n only
> +///   be enabled once.
> +pub struct Regulator {
> +    inner: NonNull<bindings::regulator>,
> +    enabled: bool,
> +}

I wonder if enabled vs disabled should be two different types?

Alice
