Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603C3C65F0
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978644; cv=pass; b=BX7UpL+/1MhRBMsZuAQe/N61G56ZcNgGNzqQ1vrnie0ON14GN43TQI1eV1l6jMyQABn6J4kY0CTWRbtEiI8SDZBVCTMR2RiBae/m1K3jj7aQC07udYJZ2L3wVU1/l3yyXAQFU2emiTH3S9Goz1bCbtldO9cuuww1GRcHfPyHjVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978644; c=relaxed/simple;
	bh=pHrVcQLlOK1t5nKGdXPSLGw9nctg1pcpYD1ve12gl1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcOSB1pNcJEPQ7PvcJ1AVNYdWyNgz4hRTdaKNXxBj0clyIhtWXHQo9iQtrVGmpkVi6ERsX7Y8rCAQ0nMOGhzaHrDleMg32MhynokZSMEDZ+hyO5lZXLoozZAP3ysk9HfNTt8Mf5spUTo40UUdbFn6N2t0Oh67haeOzJj4b2bTEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E6yMhZHN; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E6yMhZHN"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so10155475e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Jul 2026 00:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782978637; cv=none;
        d=google.com; s=arc-20260327;
        b=p5kVvPE0vdOjfO8sv7Dc3oR7J6q4iTQCwZzRUVexH6DE5WNy+p4nzLNaam6T6JbvcE
         bFE4eJy1dTtm3Kq8cK/8sIdKZ10XL23AyYBqP/5LOY7a9FuX3FNb41k+N7Om29RQjGf8
         i3XdMssagc2mVmRDbb6XvjI3MeWqmecnhNlRmi3qEa0bKtfB+/zXvzIHBYyxjAh0171C
         t4oxLhWccfWZZa2zU/V4Bp7WB/YNFwHgIABkZYZvIiw2wvtfSeMHOHRNDUNHBcFH+fGW
         Lgtagrmp9fAsuE9z908DquMAXane9T3EVhYXvGAqel5HP9bwCZ8DqixpwyIejddK1bxf
         ogzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k+WIPEoOjs50ah6fC22Zhfdijp2GKQNWxcgboLZ4NOo=;
        fh=h/jdtxS3bqugaam3PGUEqpuv5vFx/NgSjHHDpECiebQ=;
        b=M0GvwEwkIa3aMMhmmjdoG9CQa2bFyl63/YEeUNfu5eJZBH/xKrELgO4RVOd8uo4Btn
         l6b/+4vVPefKh9jUmI6RxnTs0ZdseqYBQDILEYmGfaa+XejhsfEbDXbK53EnQvdhrMCb
         dI7niH4JhrEo2t8o9tArjPM3fDzGGszVEUNDN68R/yVAv4WuYw9Jp6mzb6RsIg0nKtbv
         1cFqT8ZJJcH4iF8F2iBAm/Tw6hAxtdCUKuDGuWNF235FWgtFV/QCkKJamXNyvyAtJJMV
         BJAyUBGC5Sa7hqzdSA6Zwq+gih0kW6VjDUxFp04YXn6eC5xuPusRjG5Y0RGNeb9QsDcd
         QuZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782978637; x=1783583437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k+WIPEoOjs50ah6fC22Zhfdijp2GKQNWxcgboLZ4NOo=;
        b=E6yMhZHNRwKDOkA5gpZs4Vh0B2MclNLn9OuphjDoS0whjLntf8hvCdFdq5aJSnfdgV
         ssDu/2dI7JnUi8nICDWpXVfw4WCu9vLd9GAeEvWyMeChpaZoj/ODBaGgSBhikb0qf9T7
         tkvjnEB4fG42F5XMK0lp0fJbH7/ADYtc7qyqXgYTEqUE+JAJpI72NwkhPrpBpF83bLi+
         KRR7MbUWff6NhFOgv0ESNCdfcPeMWe18HPxZFo991slFKvQz8ruA/jPpUJyDdbMv7n9l
         5pFmOHa4YyCGMUIHDRqjXY1iYIR6Rpi3mRiS8JngRjR1atDAWPGJaWjEzptLgCl0ft3l
         ZK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782978637; x=1783583437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k+WIPEoOjs50ah6fC22Zhfdijp2GKQNWxcgboLZ4NOo=;
        b=dszydhlnkW0vO4V0M+mIw9se2HvbxN4UbDMDGVS/WdRgEmaQbYjQfxejObs46RD1Zh
         us/qxT1DBnfYGRXOXbuHdX1ezSFEBENn0CT/vNFHkglrQmz2NfRs7+fNcXB+DButBzKi
         DQVobieIumNNjgVD7kbKEO/d2Lr1P+yAzHSQ4m7U1qLzYipWw/UNbcrDxAAnDRRdEuax
         sKTL+geq0HdEiFUV+UOG9UO2sWqkcQuReSXkHzWHekdhLK+Q9+KaO8na6Xjtic6U0oa+
         HYwK9Sl7JCM9KlDVMx+p97/hhs8hosVkmmjAyheRCFSTUofXVelLztL/KI5yLh7cWRzP
         vc7A==
X-Forwarded-Encrypted: i=1; AFNElJ8FF4vh5CL/59XRzSY6tZiveYR7aGMy1PR1jI1kC+sSLopA3j+t59dl823HsOU5ynRq/CLE5MWujHU1/mr28Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQuLB2YcrITQmNZjxy7pD8CtWPoXj5cMJQmERtV5btGs1kGybc
	ukoBUgSC3GSl69FwB7BRoDA0Wk/AwWEcrY/hA89TJ0equz33kb5qlE2bmrqCZboXD2pYkaWro13
	66iN6XxlrRFIqtVAZEHAUxw4LQkV6x2n5b/0NIH9c
X-Gm-Gg: AfdE7cmJ+9t2VjDqVh7Ac1Y1Ai7J64j6I0MOL+6NIjcQUQXfHqTGF2/nAD+almsihO9
	m2Y4sIA2yECiqmQnlimL7A9HZpegfhXeFcCzcNmR8CjXbuHq7hmoeRdb5J+VjH/Lgu1y2yxW5lq
	Blo/ov7uIJoGMFT2v03LyfOVBgh7oRZ1T/pKV6fJrTfid1LqkMPPxt4y5vNON12f0lwV0eKvVoJ
	BYjKzPxXpldP9+2zVWPM1TpnykSpYn/malOXD+d6K8vMQ9IxupP/KmdhatCcsxo/7IQ3FeXnadh
	hLHG5xVzmT+ynpr9TPktu9eUzbg=
X-Received: by 2002:a05:600c:8217:b0:493:bc88:ddcf with SMTP id
 5b1f17b1804b1-493c2b7d9a3mr66570055e9.23.1782978636026; Thu, 02 Jul 2026
 00:50:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com> <DJNDEDDBYJXW.1KX1X9QINHSQS@garyguo.net>
 <CAH5fLgjDAgwoCo3w2n0AF9NsY2mBkddG9=21Ame9qxiAY2W9iw@mail.gmail.com> <DJNEJSFRKDMZ.1J9DIN32Q9FXI@garyguo.net>
In-Reply-To: <DJNEJSFRKDMZ.1J9DIN32Q9FXI@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 2 Jul 2026 09:50:22 +0200
X-Gm-Features: AVVi8Ccq0waCoMYvA9Yvmgf3Niq2vNvIS4qn8q5XjVK_Z5DoB2S-0CNupb6uhZo
Message-ID: <CAH5fLgiUwN_K4-dwf=WQNEk6kyzS051HGy5BQKZVtfS6HrtXug@mail.gmail.com>
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

On Wed, Jul 1, 2026 at 7:14=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Wed Jul 1, 2026 at 6:02 PM BST, Alice Ryhl wrote:
> > On Wed, Jul 1, 2026 at 6:20=E2=80=AFPM Gary Guo <gary@garyguo.net> wrot=
e:
> >>
> >> On Tue Jun 23, 2026 at 4:38 PM BST, Alice Ryhl wrote:
> >> > Printing can be very expensive if it occurs often, so printing that =
can
> >> > be triggered by userspace should be rate limited. For this purpose, =
add
> >> > a Rust wrapper around `struct ratelimit_state` and use it in the new
> >> > macros.
> >> >
> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >> > ---
> >> >  rust/helpers/helpers.c   |   1 +
> >> >  rust/helpers/ratelimit.c |  14 ++++
> >> >  rust/kernel/lib.rs       |   1 +
> >> >  rust/kernel/prelude.rs   |   8 ++
> >> >  rust/kernel/ratelimit.rs | 202 ++++++++++++++++++++++++++++++++++++=
+++++++++++
> >> >  5 files changed, 226 insertions(+)
> >> >
> >> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> >> > index d17eaec76450..2184b11c927f 100644
> >> > --- a/rust/helpers/helpers.c
> >> > +++ b/rust/helpers/helpers.c
> >> > @@ -80,6 +80,7 @@
> >> >  #include "processor.c"
> >> >  #include "property.c"
> >> >  #include "pwm.c"
> >> > +#include "ratelimit.c"
> >> >  #include "rbtree.c"
> >> >  #include "rcu.c"
> >> >  #include "refcount.c"
> >> > diff --git a/rust/helpers/ratelimit.c b/rust/helpers/ratelimit.c
> >> > new file mode 100644
> >> > index 000000000000..e5052f568b81
> >> > --- /dev/null
> >> > +++ b/rust/helpers/ratelimit.c
> >> > @@ -0,0 +1,14 @@
> >> > +// SPDX-License-Identifier: GPL-2.0
> >> > +
> >> > +#include <linux/ratelimit.h>
> >> > +
> >> > +__rust_helper void rust_helper_ratelimit_state_init(struct ratelimi=
t_state *rs,
> >> > +                                                 int interval, int =
burst)
> >> > +{
> >> > +     ratelimit_state_init(rs, interval, burst);
> >> > +}
> >> > +
> >> > +__rust_helper void rust_helper_ratelimit_state_exit(struct ratelimi=
t_state *rs)
> >> > +{
> >> > +     ratelimit_state_exit(rs);
> >> > +}
> >> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> >> > index b72b2fbe046d..ba65ab4f0b8c 100644
> >> > --- a/rust/kernel/lib.rs
> >> > +++ b/rust/kernel/lib.rs
> >> > @@ -111,6 +111,7 @@
> >> >  pub mod ptr;
> >> >  #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
> >> >  pub mod pwm;
> >> > +pub mod ratelimit;
> >> >  pub mod rbtree;
> >> >  pub mod regulator;
> >> >  pub mod revocable;
> >> > diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> >> > index 44edf72a4a24..5a66028dd973 100644
> >> > --- a/rust/kernel/prelude.rs
> >> > +++ b/rust/kernel/prelude.rs
> >> > @@ -89,13 +89,21 @@
> >> >      },
> >> >      init::InPlaceInit,
> >> >      pr_alert,
> >> > +    pr_alert_ratelimited,
> >> >      pr_crit,
> >> > +    pr_crit_ratelimited,
> >> >      pr_debug,
> >> > +    pr_debug_ratelimited,
> >> >      pr_emerg,
> >> > +    pr_emerg_ratelimited,
> >> >      pr_err,
> >> > +    pr_err_ratelimited,
> >> >      pr_info,
> >> > +    pr_info_ratelimited,
> >> >      pr_notice,
> >> > +    pr_notice_ratelimited,
> >> >      pr_warn,
> >> > +    pr_warn_ratelimited,
> >> >      static_assert,
> >> >      str::CStrExt as _,
> >> >      try_init,
> >> > diff --git a/rust/kernel/ratelimit.rs b/rust/kernel/ratelimit.rs
> >> > new file mode 100644
> >> > index 000000000000..da0a49412023
> >> > --- /dev/null
> >> > +++ b/rust/kernel/ratelimit.rs
> >> > @@ -0,0 +1,202 @@
> >> > +// SPDX-License-Identifier: GPL-2.0
> >> > +
> >> > +//! Rate limiting support.
> >> > +//!
> >> > +//! C header: [`include/linux/ratelimit.h`](srctree/include/linux/r=
atelimit.h)
> >> > +
> >> > +use crate::{
> >> > +    bindings,
> >> > +    prelude::*,
> >> > +    types::Opaque, //
> >> > +};
> >> > +
> >> > +/// Defines a `static` containing a [`Ratelimit`].
> >> > +#[macro_export]
> >> > +macro_rules! ratelimit_state_init {
> >> > +    ($name:ident, $interval:expr, $burst:expr $(,)?) =3D> {
> >> > +        static $name: $crate::ratelimit::Ratelimit =3D {
> >> > +            let init: $crate::bindings::ratelimit_state =3D $crate:=
:bindings::ratelimit_state {
> >> > +                lock: $crate::sync::lock::spinlock::raw_spin_lock_u=
nlocked($crate::c_str!(
> >> > +                    ::core::stringify!($name)
> >> > +                )),
> >> > +                interval: $interval,
> >> > +                burst: $burst,
> >> > +                // SAFETY: This type can be zeroed.
> >> > +                ..unsafe { ::core::mem::zeroed() }
> >> > +            };
> >> > +            // SAFETY: This is a repr(transparent) wrapper, and the=
 invariants are satisfied.
> >> > +            unsafe { ::core::mem::transmute(init) }
> >>
> >> Hmm, I don't see anything that prohibit this from being a const fn? Wh=
at have  I
> >> missed?
> >>
> >> It looks like this type is move-initializable.
> >
> > I believe that the lock class key this implicitly creates is only
> > valid in static memory, and not for a Ratelimit stored anywhere else.
>
> Perhaps create a
>
>     /// # Safety
>     ///
>     /// The created `Ratelimit` must be stored in a static.
>     pub const unsafe fn new_static() -> Self {
>     }
>
> ?

Ok, will do.

Alice
