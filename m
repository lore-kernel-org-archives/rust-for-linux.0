Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCAF206049
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210370; cv=none; b=a1FWjAAnW9mfz1hxLSYr2+f8dslYsjMFaf5JeBukH11YJdJ/tnF5Z1uqItIQMsRAxruyPCPCbFBYDcGdYldpCQQgFMQsdPQtxBzGP12KcG6/p3i5qV4uPmVAbq8IoBNEL5TLGT7/WDmYesd+kvViIQZSidQc71HWOoFFm4OjqY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210370; c=relaxed/simple;
	bh=HWBADJXnoh2NUNrdZ4R8VuuNYl1bmNxvyx9KhUtUxEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sKASQtTAKIDIm8yLCL1SDzWmeXO9jsK+Mj0/fPew8h8wtoC9Mxd7ndcaCgoT6kgR329z/6pcfBhcn9/CodSSIaGW/S8CgLFyuXmRcoFtvCpeUeg3s99eMoSFq/2B9fmgQ361JhBPYJJcFU2+uYxBNj3HpilI4cgvXwROjJjRe6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s/1PBN+O; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s/1PBN+O"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d495d217bso5094963f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Oct 2024 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730210364; x=1730815164; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0+r5DXauPWMBo80TC003d10oYhw7X04leDKPh0fruY=;
        b=s/1PBN+O4ssMce33ShcFRDVxgnF0bzyFMTPkXBQD+CHNpuVcPuUuWVIeFbSTQ2RKAX
         SzyfVCwgP9Gr6Pg6PF4WkcbBPDkpqXzHpLIp+XaOAZKHslD9yMLSO8njq8gWrrtDp20b
         FJBYhxAFMCe6o1QLNfDMRgaa51ritTL6O1Exth+2EPQ75ob8OOZ39+RqdTFbpYWkXjsv
         ZSMABo/ZMKJ4IFg+lSI2eA6UqEQQr2UI6VrBgva2iMmHufjp57xL/PCEJz4jkhV1HKFE
         5F4IVQrn3D0tk7wvtLul1Cti40IuvA1GDUxOTxTDsuBu0cdPxSfHiCAT3PZ6BvJNCBS0
         I59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730210364; x=1730815164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0+r5DXauPWMBo80TC003d10oYhw7X04leDKPh0fruY=;
        b=QB72xRp0bA2ameJp1edttNyWZY3EeEwUwkUakHe29XhhAnzt3ClueFuEr3J9809l4m
         Lhj86cduK4/dPWw1L/QFWXyjhOIWi1yq8B03X+701/2LaWBUQqTFb+f3bVOIwr2ESsYF
         6Z4lbkiAgRpl5d98gScJ39EPdR9sFQIUJUMHyxO5sawgNgbGSQ5JMLqIPwCcaBzQn6yQ
         QI/Db9xC9csFc8PZQByC59kIAuC4s+J3N8Bb1v9V0/tgSAVZWTTjDgMSZ5r0EeqBkeMO
         inVhVLOz6hlA2mPdIfsUaM+1y9nlImav/BngmV/nOmmuNs65Xh6OvLQm/7VTUULeRATj
         +Cyg==
X-Forwarded-Encrypted: i=1; AJvYcCX7mXEfadJ/e3zvFjzSHHBHoiXNjcszPpE7QtDUa46fNGE6CC1IgLy/BzI5PWFfnTkmReRZC6mhxJw+tHLpGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUiTE3a+XOLZivWjWp1Gaf9hKq7WsoVTKmH7dpdoL2M99RBd3D
	JBa7NqvW5HiD+XhEekPrGt5XmmyRb2ASJMUizLZ49xyzOLUi7qQoaN+bYTLqR7MguUtmeb0TzNP
	hkGxT+4xoF6PnHLUZ1v3twcKT6SHrJh/PYxxr
X-Google-Smtp-Source: AGHT+IHKguE544j9cYCAx/GnN3x2cBIU4yFs+FD0nSAsUtdOZzL/B0VKKdtS72gv2gH4vafJAmdHPLNGHnEY0QP/rKg=
X-Received: by 2002:a5d:56d2:0:b0:37e:f4a1:2b58 with SMTP id
 ffacd0b85a97d-38061172aa9mr11280347f8f.16.1730210364034; Tue, 29 Oct 2024
 06:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022213221.2383-1-dakr@kernel.org> <20241022213221.2383-7-dakr@kernel.org>
In-Reply-To: <20241022213221.2383-7-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 29 Oct 2024 14:59:10 +0100
Message-ID: <CAH5fLgji5SozS2Y+G16pPS3iiKnee-p94xO+uZZykTd_7EBOpQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/16] rust: add rcu abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, bhelgaas@google.com, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	tmgross@umich.edu, a.hindborg@samsung.com, airlied@gmail.com, 
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, robh@kernel.org, 
	daniel.almeida@collabora.com, saravanak@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 11:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
>
> Add a simple abstraction to guard critical code sections with an rcu
> read lock.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/helpers/helpers.c  |  1 +
>  rust/helpers/rcu.c      | 13 +++++++++++
>  rust/kernel/sync.rs     |  1 +
>  rust/kernel/sync/rcu.rs | 52 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 67 insertions(+)
>  create mode 100644 rust/helpers/rcu.c
>  create mode 100644 rust/kernel/sync/rcu.rs
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 20a0c69d5cc7..0720debccdd4 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -16,6 +16,7 @@
>  #include "mutex.c"
>  #include "page.c"
>  #include "rbtree.c"
> +#include "rcu.c"
>  #include "refcount.c"
>  #include "signal.c"
>  #include "slab.c"
> diff --git a/rust/helpers/rcu.c b/rust/helpers/rcu.c
> new file mode 100644
> index 000000000000..f1cec6583513
> --- /dev/null
> +++ b/rust/helpers/rcu.c
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/rcupdate.h>
> +
> +void rust_helper_rcu_read_lock(void)
> +{
> +       rcu_read_lock();
> +}
> +
> +void rust_helper_rcu_read_unlock(void)
> +{
> +       rcu_read_unlock();
> +}
> diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> index 0ab20975a3b5..1806767359fe 100644
> --- a/rust/kernel/sync.rs
> +++ b/rust/kernel/sync.rs
> @@ -11,6 +11,7 @@
>  mod condvar;
>  pub mod lock;
>  mod locked_by;
> +pub mod rcu;
>
>  pub use arc::{Arc, ArcBorrow, UniqueArc};
>  pub use condvar::{new_condvar, CondVar, CondVarTimeoutResult};
> diff --git a/rust/kernel/sync/rcu.rs b/rust/kernel/sync/rcu.rs
> new file mode 100644
> index 000000000000..5a35495f69a4
> --- /dev/null
> +++ b/rust/kernel/sync/rcu.rs
> @@ -0,0 +1,52 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! RCU support.
> +//!
> +//! C header: [`include/linux/rcupdate.h`](srctree/include/linux/rcupdat=
e.h)
> +
> +use crate::bindings;
> +use core::marker::PhantomData;
> +
> +/// Evidence that the RCU read side lock is held on the current thread/C=
PU.
> +///
> +/// The type is explicitly not `Send` because this property is per-threa=
d/CPU.
> +///
> +/// # Invariants
> +///
> +/// The RCU read side lock is actually held while instances of this guar=
d exist.
> +pub struct Guard {
> +    _not_send: PhantomData<*mut ()>,

Once 6.13 is released, you'll want to use NotThreadSafe here instead
of PhantomData. It's landing upstream through vfs.rust.file.

Alice
