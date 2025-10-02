Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6BD258CFF
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 16:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759422527; cv=none; b=CsmIOyVyjhOaLr+i2h4OHLHxz8ZnFpovD3QFSRm2ObvCsqxRAzrS1mNLNPzQjU2bJbyqGMVV6u17O+QlONme+k3Om5trDV6EoNzEHCbSUArIU8Lz3IdahDkIaTUlj7BRBewN1RDhfjWYXtcV1Dc3U6Q7RJkF0RB/42btIWESPls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759422527; c=relaxed/simple;
	bh=R8brt8J1w6b7fpJJwWJpx3xH07Ssy3dMR3KPOrqUGH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jeA+W2qKzu4wGW2ylcBkHtH8fdOjyZe3Hpn50WgN8ysi9HjJ8vnNFGHgMvYG6PEDD8sBTPEafBiALVa2Kz4ld+yiXIhBaTh51OIGymICpPU+t/OsJj2NEn0yR0rrmejsEi317NIk8VeQUYPAyq13lc5LxO+O54+YklY9M1BT2mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTcdz2TY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTcdz2TY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-273a0aeed57so27366735ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 09:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759422525; x=1760027325; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxSop6KXcn5q36631eBJkfHEbmYYsB16EmXb2Rt0ZSE=;
        b=BTcdz2TY6g8+8cILTOVM5JuDMnnEReP747RYGuUkjPRSvL/OsTUT6Ah3cyLHuoiYs3
         MInQZQ7MndPOvzkXMN/RznLK7Oy1S8rvVJRtN7ARpdkqUXmI/OPPVZ2uF6DIJ3ePPB49
         t44znBpn6kBohxx0cv4v80AqfgY6PXQBel/XeArzwuVZ3bIQGvxUgkUHFGo6hEFt8f9Y
         JUXQZtC1H27y0FQfIkjlYRd0YBQd1+D3GFFWyvRdE9ttMi3B5n8OlbQl6hzrk1ah60Of
         kn/KU7vXWv8h9e4K+fjWuE2HRQt2+NX9JWbSsjrsGN46oJvSpncnBb4PQc7TdJYkafAj
         2viw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422525; x=1760027325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxSop6KXcn5q36631eBJkfHEbmYYsB16EmXb2Rt0ZSE=;
        b=NCW98Z6aVVj7WHXKcKIvGt+A6MwtLNIV18SLHD9emtg1hQfuSdZ8gJ0JiK1rQqyUAj
         kxEg+0JXSIKUUiiMuFDFszZ3BTIKYJvSU5/Tjr3bRtbcdUgTbvlK7yLynD+Qt1JZ+htj
         go3uhpQqvWMCTZaeQfyAdUAJvVWJmmbWOUfuBeTHV9bhlWBKxrba1WjJ6wRpIB0LWWdc
         yxVzAjvyC//eTKAhDUio5KUGsgxWmaiTs6HMbUlpYPFI+ueaaooFSo9lS+rj3aRy8EXv
         8oPqC6choNoDfZqgc/I4DYZoYHvXxV79RKWfuJkGuKULKxbVL8YY49bHxpvcS3slFU/B
         BslQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe8ezPx5RH6FGvXpQ+Bh6LghAFzxlLevlqINQItj7Hjx3SjzWcm78x0eScVaL+5gBMNuUxRGTtxsZCb/st1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YymL/U4TImQ0JlQuOfZlZ5qh46gdyc+Aq3CWMxWFnUDnCW6ATeO
	VlHGISGNxjT6axLHcQ+g2pSmCzhJTK6YJyAfkP8b3FCBtgfWFQtVgYJBr9Z5W/SKOnbCeDPbQUm
	NcQoE/JhougsKQzlpb7GAnrejTJ1hEDo=
X-Gm-Gg: ASbGncsT2d1Ch+0a8GO4TwpfjMpL4A8uosDdggArTVy2wk9pctK059isM/tzkNY6VvU
	smPY9z6mxV+7cWA9+CJTU2M/fICgRtVI/uZxVQP9qRw2gkbN1nVxv/FsYgU9V6GR1esJZDx0Tf3
	dJSfOLpjYWExk7dXyg25i0XS4BiCv2jHCW0i6LxLQu3EDYoCRzGNM3Aslcm3ds+Tv9dA6UYQ+TL
	iAu9bLMEL1xfeGPTjKHSviW3krhMYQ=
X-Google-Smtp-Source: AGHT+IEmPMz4MLeunlpA38mU4kLoqknyfp/Q09klwrTBeEpB/unLHj9ddxZqIRY+Py1NDvcwWGvbRMgB8y8oMzl3cDA=
X-Received: by 2002:a17:902:d590:b0:271:6af4:17c with SMTP id
 d9443c01a7336-28e8d00a326mr43453605ad.1.1759422524812; Thu, 02 Oct 2025
 09:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817044724.3528968-1-fujita.tomonori@gmail.com> <20250817044724.3528968-2-fujita.tomonori@gmail.com>
In-Reply-To: <20250817044724.3528968-2-fujita.tomonori@gmail.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:33:42 -0400
X-Gm-Features: AS18NWCdtiHNZfbMjKUBT6WZOxX3jgc5-4hLDduk8LQ8Vlx3lQMnbQJCO-b1Q3Y
Message-ID: <CALC8CXfKPBc=axfyre8UTwO1uV=-P-u_atR5FVYG0UXszE41Xg@mail.gmail.com>
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

Imagine a Japanese typewriter. Couldn't be done.

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
