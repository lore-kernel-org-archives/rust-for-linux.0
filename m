Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAEB258CFF
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Oct 2025 16:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759422597; cv=none; b=abRgLlTAoP8U0wbhkeHv11b5Nnkisl7zDrCJEf2EbkTvUmPSw9aLMHDoyfMkjCiIJHdX+WnEE0KDfWqNQgbl474JoYOjl3zuxDUAC8M6c4+9E5TwVHd06OgwEbhaOGgTeVvorE3weX02kJ/h9TKqu8cFPjGEDypRNX8LWzTsqiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759422597; c=relaxed/simple;
	bh=x9hYAArqMeGicQwVO4aAGaQ5LFClBvY1j5G2TwlIfbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gjhian5zFSs2Tsk7IG+4uXeK9FJhV9FHpTQkRPV3Jr0e4pPR8GyBo3HT9Fem6yu6PzCJV13OtcF1yC+B3GZ79TrdHZ8srJ47Kou9MpY19E5zB651k+/KJjTr3eAMF0CFGMKPSqi/+5Xgq5E7pVMtNJiNJX9JnGIwjzRnP1nK2ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoDsFEmy; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoDsFEmy"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32eb45ab7a0so1413323a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Oct 2025 09:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759422595; x=1760027395; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHoTuJJ8AfzEcY5pfjyL0sTJOZGpsUEORDoLpA2bUs0=;
        b=JoDsFEmy76soUYPgZMfOeBLyK7EGtYXmE2gt7jv2Z8HOmLW14HN/6rOZWn1xsSZgTz
         oPTnvXwn9E7eR3mt/02ED8M2unMBhOI+VLeftF6yd57aPzo+p68trZJo5D3odR2uK2jX
         5OSbcRDdgqxpKE1A9wKvQ8fYyJWOb+loocoZZwWTGTrrF6ciCqZAqMXagXOlEscrxXLN
         fasD+Qx9dWCEQBnVNU6Ij9d+z5xtu5/7PhdqgMcIGWoQx3en8hYDQ5oqJA7vAfEnbu+8
         tqtj3KSfBPVjJSkDGKZ2n1JvXgQlYVP4xBHGyPjwccfGmxzbJpOHJP+OgZwQIi6xc5ty
         bTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759422595; x=1760027395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHoTuJJ8AfzEcY5pfjyL0sTJOZGpsUEORDoLpA2bUs0=;
        b=toK6zE4nfbuv4doCiDGr6JTwxXj0RKD0G30Y/TTW9KmfqhjUf7d7izYcJolcoVMsjA
         UmeWB2d2g5op9pgDxu9TEzL5JObtxTgmoRHgAD+FWni1a4fSpqajH3ICbPMGpvfWSnnf
         bvp7kYqrsuSenLwra80VRNRxLk07zbRcOcPI07iVKVip33sAU9wmxUh6gkwRQBUrNDw0
         4+Q1klERW4tE7XjGyfnR+3G7tHdssqPdjD9E5lW2XqOZyUvWq8BF0NfaMidzT+rd42pg
         D4fxwXXNUV1bY/PfrbJZ0eyfGS7UahBdCUOPjedOtP7N4w6ZAe61f3qDJVlCtaMQCg2p
         KQMw==
X-Forwarded-Encrypted: i=1; AJvYcCViZgHD7Ns0BMogRp/e8ugiocCYmxwFjk11y0SHdB6xFA63Ywn7bBKE9XDCgGDlFQY1RJyn1XlVq7LzmzEX4g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlglCc6PjEnaH0tPjkq8Xyi0jLC2PVCCBTm4GIWeqVHc+48ue1
	rHMq64xJRINDG4wxeM+yeYB+7FlENtgGYGbZdbHLmgiZsmMCw31dhvkO7ISXG+FmWXdr3JUdaua
	C/x8o/qqT760kiej24j/8Kc6XFHbDC3M=
X-Gm-Gg: ASbGncvrzdWNJGCcuOVjV9u4ki/gj+jkD8/B3JnEE/3A9EbDltgwArdrjuF9D0mNJgW
	n4C9V+87X+4N0T6xMsvwPyduR56z3PhisJ44VjLQvolwavdXJB8WQjBFRKO83oaHIGpm6dx1bdf
	ocZ0hXf75PChDD14NisMcOFGZHXSrn7b6jdE5YmQseLjMlTZnTXb7XOse3qz1rQMvgN7t69cyna
	0nhOn9nGKobS7JyS0D/bQKcLE3/ogA=
X-Google-Smtp-Source: AGHT+IFIgPcmPFHu6ydpBX+LcaaxQKdA5pFtu25OpqJED5PdGVTKzE/gxfoWMu1ti1aeiIMjFcmrHAf2cSHroAMOU8M=
X-Received: by 2002:a17:90b:33c2:b0:32d:d8de:191e with SMTP id
 98e67ed59e1d1-339a6e94f50mr8973125a91.10.1759422594991; Thu, 02 Oct 2025
 09:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250817044724.3528968-1-fujita.tomonori@gmail.com> <20250817044724.3528968-2-fujita.tomonori@gmail.com>
In-Reply-To: <20250817044724.3528968-2-fujita.tomonori@gmail.com>
From: ChaosEsque Team <chaosesqueteam@gmail.com>
Date: Thu, 2 Oct 2025 12:34:52 -0400
X-Gm-Features: AS18NWDSkVWWR18PWpaY7lou_TtcqRCUWA1IUJF9HuLwoN19aCXIp24D9D5a4IY
Message-ID: <CALC8CXei5o5fWrMcBZXRYmFCQuWgimsch_FHp7oZwDNiz10LYQ@mail.gmail.com>
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

Thanks for taking over our C project and running all the C hackers
out, and making it uncompilable on old systems.
Thanks.
Really great thing this opensource, these days.
"this is a RUST project now"

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
