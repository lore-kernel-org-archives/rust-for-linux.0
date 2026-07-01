Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901A62F1FD0
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Jul 2026 17:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925379; cv=pass; b=WprX13dXyPeMQUS5WfAZhEIW6xR8zTtHHatX+uFgmRvzGEfTddyWjXBnwtD9jVI5XoeRBhnYHuslfAPdOvflMzFV4riD02tK4kOtKfoTiQHP2nfgo1wGblWzS86oadj+pKNtRr0FCtqHBDzNCWAyXw2cY5oHN+PTiAcZQuegOHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925379; c=relaxed/simple;
	bh=7SoAYslaIf0yUF3H6/E3wKlJxvwsxww4JvHuobpKcPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2OsXPz4vN5fcvTVcCpVgRtD9Wgfc9o3AIq7DAze3pjnANb3X6anbobndjp01rNrNLyZ4NduESdh5f/rQm3wdAob98QpZnnwBg7TxSu42oBHGRYmB8Ga2ARLs77yl/ENbAZ8qZBjA/HYq0zAeyQTlAcHSHT+0oFm6BYh1AeoyuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZXQJKBM1; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZXQJKBM1"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso869055f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Jul 2026 10:02:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782925376; cv=none;
        d=google.com; s=arc-20260327;
        b=Vwwpe3UC/F0oPrNx5NUSC3qMVeGuk7L0AR2xn4Oy+WipUZtwK0Vw09EuzzSU0WKO51
         48JzVr8VmyOR8nMJmTWw+LTsFGURcJ2YZcIEkz/NtrUmWnXN+QABLV7zsJoVzdZVuERU
         0zdKHszkOj0AOWGFjXDHJ/aZrCKtYBuZasGHHf0YLbpRMCHnSydVCXB1HhFsursrljST
         ZMyfdJvWie2v+GZNy6E+yqGu1EbKIFiVilk5mM5s9FInrH6AB3tYa5qsx8MWagwU0T5u
         bXg3SgJsJk/5zHK5lwWIjxbD1iC3lYH38bbqycK0MV+ZkVBoKL81wvc7BoBFn+6RIca6
         GsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=edQG9M0HPe9BvkYuvDsM0grTM2Im2uotzgXOZWYKpY0=;
        fh=ZkaIszvvCs7KT4TGG5+Frh70sljQdPAA9eIWnb+2bqE=;
        b=qUXN5DVc0QbFJa+T7GtUBfaBnyVbA3yVr6chI/GPpwvDHC783SCxhn6MaJjbjz8lzi
         ImaaDXLsdxDJSz+e8dYRpSxiID3qPXAZrdn/lYzy1VtSFnBLhhIU0Az74E+lyKQvCL2N
         FT/HIMwROwHMP4D/d1OIQHSkL/7y8ukDq7eVE2LE+tiS9AxSgk8UFZvlAFiPnlSwCmwW
         tY6rzBFaBJMtHDFE5CZ4a+ZYiQifijBJu7SN20NvoosEcLEJ+WJ4cKqL2+azqAVeM1Lk
         KfpoDMTV/HPnByflg7TCHRKYK2eFJyqChRbv2+4TNhWAS9+7cPcaPLx11hZ4GqwVKRL7
         Ll0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782925376; x=1783530176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edQG9M0HPe9BvkYuvDsM0grTM2Im2uotzgXOZWYKpY0=;
        b=ZXQJKBM1eUs5OV6NpAfqbFQbK6kzzWLufzAGbPbnmwD2Rh55pkY+gSKV8tdKPovGNW
         RUkJOpjW7rME121g0LtKINUIQ4jJ/FZUz+Mdp0XtB6nAglmmdG9DeKQjoofOmLlIGA6N
         2VJm6x4rs3uf8aPo9293J6PG8uFYpRanWP0EbFQoPf1+gy5paMLAd7HAY9UUFRqxZO7b
         hUkIUiXKCTJu2U+mFIXtC4+bPZQz/KuqRoKx+/RcRSxrDlJd7CAvEAq4fqSNoGDcb0Ip
         WwNd83hOPu9IyfSmGN0K01dAKgRhgcsiRtdqq/gIApdLZt7wiZBSJDRU5UriksSGcfEq
         DcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782925376; x=1783530176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edQG9M0HPe9BvkYuvDsM0grTM2Im2uotzgXOZWYKpY0=;
        b=fFFLZ5cClzdxmXhAJSgi2peBnXxUsh6m5UwKLaaSVlmprwalpjo+Zg5Yq6XDx8Jr1A
         PbNGSotlh64Qndfo9UgJWomEFEDSXFuxpwWjCHCqtOFXwXyCgvAhZmDGIX71auGcnM+a
         UjuNK8VQ32MIDbXmw4kxeMNGe/rOVqT/A2ZvAXSksDYFpeQ2ANf98Xi+w3evjNGxzZrW
         cteU2sJCnC/81Cu3fpyx3hfLxRpEeDMT8B5AV28TaV3ijZYAz9EEJwz4rH7Az5PT7prv
         iHVnOqh0/CtxPATrBABBzEvLYSlGerUOvaFZIT4D87lKMJ9VNMGIFTurSrhWczj60l0t
         xN7Q==
X-Forwarded-Encrypted: i=1; AHgh+RrRnbE7VPu9bc9FxdcjGnS9lqVGaQxmm4BwQ0o38X0mnoNFtJC47NVTN3B0nlUtXAk4e9TJp4+hA9rYRNLHzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKs3SuMvbk18ZZx64696mxydD1jI+TtJ9srq9SV+DIz7JbtKlo
	YUnCl816Ls485eNlusTjHCX+Xd8JwLJPkhfrBlpzp77ERV/DljAuQQ8EriHU4QWXCGd7GAGweYp
	5IUcH22bEyQNr9DP7ig35ZR6G7VNrbiYOua6+VSM1
X-Gm-Gg: AfdE7cmsrfQSu/5vpgq7lMYsJesg4dFWQ2oUdtp7/ukH1DmmGPcb5Cow0X1Qh322yZI
	kwlwsRpzhn+RAByRAGtUzfbXXBr5GHa8BVEk158rassHAd7Pf5kwtRjzTManSFRcxnYm0Vp5JYt
	Ak2lhZq8STR/bGkah5M5fYwvWpDXqzxOjbrI3vLXJxqxTLwB9KbZ3ZZq7MrCypY6V6hN9C0SVXW
	q3bAFHaLJxSp9hC78kDWDZXKRLXfKSc14klf8R+qzdrylS9Ta4BmKgZsxEubKMCDuEyVLHozBgL
	XHhJFxRsGL3enT3pc2mVWJBnRa0=
X-Received: by 2002:a5d:4b4b:0:b0:474:cd60:1154 with SMTP id
 ffacd0b85a97d-4775a6d5197mr2908568f8f.41.1782925375380; Wed, 01 Jul 2026
 10:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com> <DJNDEDDBYJXW.1KX1X9QINHSQS@garyguo.net>
In-Reply-To: <DJNDEDDBYJXW.1KX1X9QINHSQS@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 1 Jul 2026 19:02:43 +0200
X-Gm-Features: AVVi8Cc9xtHCipC6_nKHKfsDaKUOnZamRNkcLOGCHx9BjzdU1Wuu4YfdK6GkInc
Message-ID: <CAH5fLgjDAgwoCo3w2n0AF9NsY2mBkddG9=21Ame9qxiAY2W9iw@mail.gmail.com>
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
To: Gary Guo <gary@garyguo.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 6:20=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
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
> >  rust/kernel/ratelimit.rs | 202 +++++++++++++++++++++++++++++++++++++++=
++++++++
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
> > +__rust_helper void rust_helper_ratelimit_state_init(struct ratelimit_s=
tate *rs,
> > +                                                 int interval, int bur=
st)
> > +{
> > +     ratelimit_state_init(rs, interval, burst);
> > +}
> > +
> > +__rust_helper void rust_helper_ratelimit_state_exit(struct ratelimit_s=
tate *rs)
> > +{
> > +     ratelimit_state_exit(rs);
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
> >      try_init,
> > diff --git a/rust/kernel/ratelimit.rs b/rust/kernel/ratelimit.rs
> > new file mode 100644
> > index 000000000000..da0a49412023
> > --- /dev/null
> > +++ b/rust/kernel/ratelimit.rs
> > @@ -0,0 +1,202 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Rate limiting support.
> > +//!
> > +//! C header: [`include/linux/ratelimit.h`](srctree/include/linux/rate=
limit.h)
> > +
> > +use crate::{
> > +    bindings,
> > +    prelude::*,
> > +    types::Opaque, //
> > +};
> > +
> > +/// Defines a `static` containing a [`Ratelimit`].
> > +#[macro_export]
> > +macro_rules! ratelimit_state_init {
> > +    ($name:ident, $interval:expr, $burst:expr $(,)?) =3D> {
> > +        static $name: $crate::ratelimit::Ratelimit =3D {
> > +            let init: $crate::bindings::ratelimit_state =3D $crate::bi=
ndings::ratelimit_state {
> > +                lock: $crate::sync::lock::spinlock::raw_spin_lock_unlo=
cked($crate::c_str!(
> > +                    ::core::stringify!($name)
> > +                )),
> > +                interval: $interval,
> > +                burst: $burst,
> > +                // SAFETY: This type can be zeroed.
> > +                ..unsafe { ::core::mem::zeroed() }
> > +            };
> > +            // SAFETY: This is a repr(transparent) wrapper, and the in=
variants are satisfied.
> > +            unsafe { ::core::mem::transmute(init) }
>
> Hmm, I don't see anything that prohibit this from being a const fn? What =
have  I
> missed?
>
> It looks like this type is move-initializable.

I believe that the lock class key this implicitly creates is only
valid in static memory, and not for a Ratelimit stored anywhere else.

Alice
