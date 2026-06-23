Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F0F37F01A
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782241898; cv=none; b=qYGlbFmfRDnmI+NsWABev6c8dOaEnsE79qrNwqvdQ2La1v1KFI7d7Ee9Xyau6LIxQ2a3DjGLp/sfiz4yUdRJWpJbdpLG6r8yCQ3zr5D+w8OIIR/D/gw7aQX0bPxBODcHslax299DvD2Ou4Vz5p87548Z1sgsT7g10TnDEKe8FcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782241898; c=relaxed/simple;
	bh=+Y27FDTSK4rsR5zxu5ujscwAfskV8IQNJkXptPOCUso=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aCt+Te8dx0HPFXagYCtBQjOeyonQQISpm2PciI8vlmFmDvO1zonus4y0aRr2ADu/f/yrvcI7BDuRl0cs2mcpstRxWvdFYfohlYRnv6OKxKoArmeU+3s/ujoqfq9Gbz+/YW8YUjv4B3hF3lfJhiMX9agOt8PBRcYF9IYldxmCZh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vFVR3EHb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vFVR3EHb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4923411f041so1543075e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782241896; x=1782846696; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EiXmLfx9cRA5lHogf+PWimXq8w1jjNSNV3y3Td+ltF4=;
        b=vFVR3EHbSF1K055xxh5SVgsbXClkZKjC3XWKdcGKiRVgWhAz0cAD1iuC1WhUbinZBR
         G55hYtInTi/+Tw4FgFExvjseIEvAUxg716ijmut2KfXFrSfgm0uCDXXyKtG6Gf5y6tXe
         5ABuHAP8H68Lr4lVgjjvd/xsDx49DAVXRUu/oYZneOcauugClVcFBx5CcpKIzv+HXTIr
         ZkYIipxepnQEYVrEnE6nDPU+BHYzZ/IgcyD53CspSFLqqpNaMze3X6duJqBB9BEyPn9O
         SJC7ha/YE6+KcJ8pf6mUcs6i0eGpHyhOj41gvJ8D94p01cCS/w8vCe0sbb+SkL5AV6kB
         iIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782241896; x=1782846696;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EiXmLfx9cRA5lHogf+PWimXq8w1jjNSNV3y3Td+ltF4=;
        b=tScvJXl4fuOP4AnxESqvX+6AnvKEesg0KkaJZbHiCJJIwtdOml5xDx1LZYXtXVw/5g
         9f2BFCpD+eVpp9vo1/3c4MfYY0AZX6JRMcmEcPXeRTDprtOIowYf/lJOS404/5CJyFZo
         qxxlFqEqnn+1cUJOBR2YLIu+lulmzJPkD6RqWtmP6C9B5H56RGdiGIZtwDfmjpdrtgCv
         +v6T6bENecD8GQL2jPdP0eoykF5tyofxLBjZR/vmjrxLhzO+35b5IM28/wEwIuN9TJnl
         8H9ZxCeH8QnwYAmWJ87jf4bPWXW8CyWjNLxm4li6GhkyKRE32EkinVl6wAcMdPlTyjXJ
         4cQg==
X-Forwarded-Encrypted: i=1; AFNElJ/cQr1RhJtCOR3VWRMCi7qb99mrF67Md2jqSZlEdgHqH5vRehAsEpgeu+N2Kb9kdrpZwOoRDFx7A7aucoCPzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz0k6L+tSjQVkGwzzNe4Tj2bpI/iyi144XP/gGS1VmF25Oz7Bv
	M9eBGVem7GEtwoaIgTRdghism768/uCablx952rJmDHx062KSgkZUOpV03AB8QqtDOAL3Jw7XXb
	ThyuZcXEUEAD2oh34ww==
X-Received: from wmju9.prod.google.com ([2002:a7b:cb09:0:b0:490:af39:157a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:540f:b0:492:5e21:458b with SMTP id 5b1f17b1804b1-4925e21459fmr39461755e9.8.1782241895636;
 Tue, 23 Jun 2026 12:11:35 -0700 (PDT)
Date: Tue, 23 Jun 2026 19:11:34 +0000
In-Reply-To: <DJGJURFV9NCB.25MLPQBQTL9WR@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com> <DJGJURFV9NCB.25MLPQBQTL9WR@garyguo.net>
Message-ID: <ajraZiML5mkjUZGq@google.com>
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jun 23, 2026 at 04:55:31PM +0100, Gary Guo wrote:
> On Tue Jun 23, 2026 at 4:38 PM BST, Alice Ryhl wrote:
> > Printing can be very expensive if it occurs often, so printing that can
> > be triggered by userspace should be rate limited. For this purpose, add
> > a Rust wrapper around `struct ratelimit_state` and use it in the new
> > macros.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/helpers/helpers.c   |   1 +
> >  rust/helpers/ratelimit.c |  14 ++++
> >  rust/kernel/lib.rs       |   1 +
> >  rust/kernel/prelude.rs   |   8 ++
> >  rust/kernel/ratelimit.rs | 202 +++++++++++++++++++++++++++++++++++++++++++++++
> >  5 files changed, 226 insertions(+)
> >
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index d17eaec76450..2184b11c927f 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -80,6 +80,7 @@
> >  #include "processor.c"
> >  #include "property.c"
> >  #include "pwm.c"
> > +#include "ratelimit.c"
> >  #include "rbtree.c"
> >  #include "rcu.c"
> >  #include "refcount.c"
> > diff --git a/rust/helpers/ratelimit.c b/rust/helpers/ratelimit.c
> > new file mode 100644
> > index 000000000000..e5052f568b81
> > --- /dev/null
> > +++ b/rust/helpers/ratelimit.c
> > @@ -0,0 +1,14 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/ratelimit.h>
> > +
> > +__rust_helper void rust_helper_ratelimit_state_init(struct ratelimit_state *rs,
> > +						    int interval, int burst)
> > +{
> > +	ratelimit_state_init(rs, interval, burst);
> > +}
> > +
> > +__rust_helper void rust_helper_ratelimit_state_exit(struct ratelimit_state *rs)
> > +{
> > +	ratelimit_state_exit(rs);
> > +}
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index b72b2fbe046d..ba65ab4f0b8c 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -111,6 +111,7 @@
> >  pub mod ptr;
> >  #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
> >  pub mod pwm;
> > +pub mod ratelimit;
> >  pub mod rbtree;
> >  pub mod regulator;
> >  pub mod revocable;
> > diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> > index 44edf72a4a24..5a66028dd973 100644
> > --- a/rust/kernel/prelude.rs
> > +++ b/rust/kernel/prelude.rs
> > @@ -89,13 +89,21 @@
> >      },
> >      init::InPlaceInit,
> >      pr_alert,
> > +    pr_alert_ratelimited,
> >      pr_crit,
> > +    pr_crit_ratelimited,
> >      pr_debug,
> > +    pr_debug_ratelimited,
> >      pr_emerg,
> > +    pr_emerg_ratelimited,
> >      pr_err,
> > +    pr_err_ratelimited,
> >      pr_info,
> > +    pr_info_ratelimited,
> >      pr_notice,
> > +    pr_notice_ratelimited,
> >      pr_warn,
> > +    pr_warn_ratelimited,
> >      static_assert,
> >      str::CStrExt as _,
> 
> I really want this to be just a variant of pr_, not a entire new family of
> macros.
> 
> Last time I raise this in
> https://lore.kernel.org/rust-for-linux/20260108125523.5c7810ae.gary@garyguo.net/
> , I was suggesting unifying pr_ and dev_ too, which might be a step too much. 
> 
> But I think just making ratelimited a keyword in `pr_` macro should be alright?
> 
> pr_info!("foo"); // pr_info("foo\n");
> pr_info!(once, "foo"); // pr_info_once("foo\n");
> pr_info!(ratelimited, "foo"); // pr_info_ratelimited("foo\n");
> dev_info!(dev, "foo"); // dev_info(dev, "foo\n");
> dev_info!(dev, once, "foo"); // dev_info_once(dev, "foo\n");
> dev_info!(dev, ratelimited, "foo"); // dev_info_ratelimited(dev, "foo\n");

I did it this way for consistency with the existing pr_*_once!.

Alice
