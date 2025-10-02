Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2521F4C87
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 16:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759422686; cv=none; b=louErFTbgzULzDJM7ZTel9Auy8Y3hHbt6rtxrg4wJgQiWPd/45uTswT7zAwjbeP7OuhJ8JeO84ShbnEdHp2c0SoNyEzgDiU7leVhVtDiob2NGGnmS+CTGCTYr0fbts4rAAwd5Ohhh10WF86EVn0r4RejHdBflpBYJV7w0JB/ed8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759422686; c=relaxed/simple;
	bh=8vOEb57v4DeDgKuQVBnG41w5FOouthhDLWBteN3W0uw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u6ko7S/RGEmxzRh6BURPrRX16SsZJPJtDDtcAAsxg8whAigOrUutgHVf9U2RbnHAuWRuU4Tt6DowCuf7I70+WWuC6gGiZa/um7U3NW7ATlogV2VEOwhfo5m5h11+FCdjol3lVxeB6/zrk6Ms6sSEgp6y200P77cBE/2zKsNmDwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYlJG3L/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYlJG3L/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33082aed31dso1468609a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759422684; x=1760027484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wNacPF8Btbu5WhlG5yDeVxMJj9MDP6Ps9hs4rcuLvfU=;
        b=FYlJG3L/F6HFKKDMR6FFsyPWlPlKvC9ndFSLCHiZrneCSrMnSwiyTxMsKsnT0KrCbT
         ZQ03xrUiHgK7qPK+6Fmq+b2+tS/KiD08A+T78qBJrQJIHbyfkLoTy4S9cFz2lJM5ARh8
         4u+M1ZvXUmNDsZDM7bG40ulf7dFQj0LnotOoBEgZuMCWB/8/ypgBrSOkT98A+41r4nGu
         21jRfoskZQ7gKxzauvggO8xlmzSaI49bWQ5aKIFM9fo22EpapVx7OOYpCRvoqLjCuA4C
         c5Unc0TKZnKlZJ60B2Wcp6agsBeZtqvRjcSoheBJ7MowWf96HCvr/HyCkyhNjVXUdNqx
         KGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422684; x=1760027484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wNacPF8Btbu5WhlG5yDeVxMJj9MDP6Ps9hs4rcuLvfU=;
        b=u3i+DqBfXGB6QcQi7QRLoKM9H24aB+KwmkQcha08AUqRiBpZl30GTnh5Ds+fvFD1h1
         IEERhVmH/op3fM5k8rzDdAKFTivoxIoU2OMmUewJ38D16inlNLvmMYJkNv0HopGYOb0x
         BIo6htIwV+YMyB3JrDXCpTzEgdQWvgV7mBMTVjlMCJzXu0nrqMimgYqDj0mvXx13fzEO
         VLrKPfCr11S5wBlYgWd/ml8ZO8khvp1o8urM5wPQc3RjjGHzVHGK0x8YdxK1/pueFwz5
         PY6lRuJPdYIoQkwu4cR1cRl+C7P9gQcjhbBZ99Cpj4Wl2m0g8kjO+iqTnnM8OXDreqJ1
         gF/A==
X-Forwarded-Encrypted: i=1; AJvYcCX4wV2FMQs3Sy98hEGT5kZtP3jvS46riaLbQBvGdyiHQ4QLd/QIdg6T2Aat/XjBdEoJFYsunxQBztgiN/PHEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoHQ7mBMHIihdxZ5qFeHr/kX9yczdcN8JMhyKjvN8hNLQM3bTs
	Mx734JGccoKd1Ov4AaFZ0sFuwUD7aml+iu2PcAPio9H5vR3UC/ErfX5aCjzSwpDWBgscRHIUZtD
	o9vJ5E1Y8EXtgVN4zmDrTfBkCH7YlwLI=
X-Gm-Gg: ASbGncu03vtjGxrNNjPPmIAhBX33v6fd8IWgHrGaKmLVcEOAouY5MFAPo5gAQDDaNfU
	kvRlRGadUgjaHmTyTQXBoPhTJOpWv9dJ960jHDtGPtpKHiKmc2GoVt/8w6Y1E8OOeDKC/e0fLF/
	56ApBLZBvX6YygivuWUdDQrPj0lUc74NZqf+AzLX0Ma8vIZWz4PXTB4pjh3pkdT1neES8L5JtKb
	USwAF2VLQvTA9yElBaNtlB42k3pKW4=
X-Google-Smtp-Source: AGHT+IFnwnujcKRfK6SHtM+CXGmRj6y07MeK5a3YjdSerJUGN6mjdRxCw90XvSKFtGaY+E6xs5ra+2dbd8UIevjGgJ4=
X-Received: by 2002:a17:90b:4d06:b0:30a:4874:5397 with SMTP id
 98e67ed59e1d1-339a6ea3208mr9156539a91.9.1759422684485; Thu, 02 Oct 2025
 09:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817044724.3528968-1-fujita.tomonori@gmail.com> <20250817044724.3528968-2-fujita.tomonori@gmail.com>
In-Reply-To: <20250817044724.3528968-2-fujita.tomonori@gmail.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:36:21 -0400
X-Gm-Features: AS18NWCOZJHPj9tkWYtN2k_ZmTorz1-zLbhHclnL_v_aOBMm4r-sY983njbIS20
Message-ID: <CALC8CXdU4PkSK3yy_tGi-ygRhFQG9UT2jLTmbv6q-RtESUPVjg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: Add cpu_relax() helper
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org, 
	aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu, acourbot@nvidia.com, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

PaX/Grsecurity did everything you are attempting to do, 20 years ago,
and applied to all running programs on the system, and the kernel.
Ofcourse it went proprietary and you cowards didn't even sue.
(And yes you could have, and could still do it)
Pieces of fucking shit.

On Sun, Aug 17, 2025 at 12:49=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add cpu_relax() helper in preparation for supporting
> read_poll_timeout().
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/helpers/helpers.c   |  1 +
>  rust/helpers/processor.c |  8 ++++++++
>  rust/kernel/lib.rs       |  1 +
>  rust/kernel/processor.rs | 14 ++++++++++++++
>  4 files changed, 24 insertions(+)
>  create mode 100644 rust/helpers/processor.c
>  create mode 100644 rust/kernel/processor.rs
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 7cf7fe95e41d..04598665e7c8 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -34,6 +34,7 @@
>  #include "pid_namespace.c"
>  #include "platform.c"
>  #include "poll.c"
> +#include "processor.c"
>  #include "property.c"
>  #include "rbtree.c"
>  #include "rcu.c"
> diff --git a/rust/helpers/processor.c b/rust/helpers/processor.c
> new file mode 100644
> index 000000000000..d41355e14d6e
> --- /dev/null
> +++ b/rust/helpers/processor.c
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/processor.h>
> +
> +void rust_helper_cpu_relax(void)
> +{
> +       cpu_relax();
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index ed53169e795c..c098c47c1817 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -110,6 +110,7 @@
>  pub mod platform;
>  pub mod prelude;
>  pub mod print;
> +pub mod processor;
>  pub mod rbtree;
>  pub mod regulator;
>  pub mod revocable;
> diff --git a/rust/kernel/processor.rs b/rust/kernel/processor.rs
> new file mode 100644
> index 000000000000..85b49b3614dd
> --- /dev/null
> +++ b/rust/kernel/processor.rs
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Processor related primitives.
> +//!
> +//! C header: [`include/linux/processor.h`](srctree/include/linux/proces=
sor.h)
> +
> +/// Lower CPU power consumption or yield to a hyperthreaded twin process=
or.
> +///
> +/// It also happens to serve as a compiler barrier.
> +#[inline]
> +pub fn cpu_relax() {
> +    // SAFETY: Always safe to call.
> +    unsafe { bindings::cpu_relax() }
> +}
> --
> 2.43.0
>
>
