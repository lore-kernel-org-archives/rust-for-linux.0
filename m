Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D100631F993
	for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 06:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779949435; cv=none; b=r+B7UQKbClCmjMYAUbnuvnqJ8BskPvDPxA8Fe+6COaErmiCmP/UCyKgSfjQRisOiT0uP0IZymIFLFZiE41MNikMiJS8xKj9meKAafdUmoFme5ZJpqezgzgkmvzF/0lMGvvZiTuDkxCSwC4yACOZoIu9m1P1U7XRHmezpoKLxbZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779949435; c=relaxed/simple;
	bh=TcgAg/TWpzmu+ozz5FEbeE+LZILi325DiXMDhIfXZ7E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KhGjHXAlz23oLevt+SUefcuMQdTZtlfZwf77cOfrleIeN9g3DBhaXo0VA+jj793qrXoWM9upgEDd5uRbDt0rylDEFEzMTHBlfq9S/g0wCJzPWA0RSazA7zVSCizZw0PYWYjrk7GV6c7pUGQbutlIdBycOYsriJOP1rIC47qCFHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OFzehVG/; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OFzehVG/"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4904bbc6094so45418735e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 27 May 2026 23:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779949432; x=1780554232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFCTgxqHq2LzluJ+gBY4/IZyu9HSyEIvpy5GM7es4Ws=;
        b=OFzehVG/3eMQstEOGCtUwIJEF9hIg4aXg572HEWRqMY+2rYu0Hvwx1o51zXZtbs51D
         35AFATOuE5ohB+BhCQ/DpIJ6xIO8mdpQ8v7n7wX45qvYXRgmKEpTS/aUNaVdapyednBD
         coWmu88J2TTUrBc90LsIY6mA+YVR8G6+X5i7BMAhV8b1pxYn/yAL8Dk5ZNc8/nG1gNdQ
         pw/X583HK0wmptksH8v+hCP9cwS5fFdArE2hou7URcbneg1BzbdDJpRBa1gVkuiPLxh0
         ud3ep67Mmty3xcH5HKCAUngUC/JdN0EeNNghDP2YAySCdjrTy0ttBLnJT7b6/ACg9iKA
         VR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779949432; x=1780554232;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RFCTgxqHq2LzluJ+gBY4/IZyu9HSyEIvpy5GM7es4Ws=;
        b=ZF8SSalbrToRlUORg8vCyuYDT47arRVPFio9JJRTmcSEnVY14icMSNW9f41Gt26QW+
         gr5PSjVYNpqx54PM+FUb49E+3GSRjxttWLuPf0qjN0AYO5weIHHA5gg51xUNVmqDxVZG
         /cY1muvuYO0j1dv6IKRL4ui/Y5A4TXG9uq8z2UVmHBA0JU4MLws6LEVFoo9B8cWRwuqb
         hjESjDyoJxcoL+h6fHBV1LsLFtd0Y1GcFEik1djM6CQtnYhtv8cf1AyjvG1tyqzXWhxF
         5K2wiCoUJlTnBas0BvqpwDQmjuyIu3Adkw5vWHYwMgLzO1FzXHagH8ejRoq+CmTevYQP
         IFtw==
X-Forwarded-Encrypted: i=1; AFNElJ/x/d+3/gwjJASJJKqOhAaCOE1ekDE+Mps51syRzgL6cLTXRIu7e5Y7XximupyEV9pRnqZWpGnRedwYQtjo+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5odCXyX6V8Jb/2Vu19hepsbcjNEuHMTJs21HuYXHkRI5HbKzH
	A7dJgy62t0j7YCdzn+4O1lh/Asy0LrpHGSwcZPLiV0zsivX4C6jcg0oUMMOriS9JWucQ9h/61Fb
	YkApgLX8wM3eZsinraw==
X-Received: from wmnl21.prod.google.com ([2002:a05:600c:16d5:b0:490:25ec:da5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b29:b0:490:5466:8591 with SMTP id 5b1f17b1804b1-490546687c1mr329106895e9.12.1779949432014;
 Wed, 27 May 2026 23:23:52 -0700 (PDT)
Date: Thu, 28 May 2026 06:23:50 +0000
In-Reply-To: <05906890-cf06-414c-a625-02f9d7150d57@paulmck-laptop>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260527174120.510447-1-work@onurozkan.dev> <20260527174120.510447-2-work@onurozkan.dev>
 <05906890-cf06-414c-a625-02f9d7150d57@paulmck-laptop>
Message-ID: <ahffdv0RpIhhagc4@google.com>
Subject: Re: [PATCH v5 1/4] rust: helpers: add SRCU helpers
From: Alice Ryhl <aliceryhl@google.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, rcu@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	peterz@infradead.org, fujita.tomonori@gmail.com, tamird@kernel.org, 
	jiangshanlai@gmail.com, josh@joshtriplett.org, rostedt@goodmis.org, 
	mathieu.desnoyers@efficios.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 04:03:30PM -0700, Paul E. McKenney wrote:
> On Wed, May 27, 2026 at 08:40:42PM +0300, Onur =C3=96zkan wrote:
> > Add helper wrappers for SRCU functions that are exposed to Rust
> > through generated bindings.
> >=20
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  rust/helpers/helpers.c |  1 +
> >  rust/helpers/srcu.c    | 34 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 rust/helpers/srcu.c
> >=20
> > diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> > index 625921e27dfb..f3562d3b3888 100644
> > --- a/rust/helpers/helpers.c
> > +++ b/rust/helpers/helpers.c
> > @@ -88,6 +88,7 @@
> >  #include "signal.c"
> >  #include "slab.c"
> >  #include "spinlock.c"
> > +#include "srcu.c"
> >  #include "sync.c"
> >  #include "task.c"
> >  #include "time.c"
> > diff --git a/rust/helpers/srcu.c b/rust/helpers/srcu.c
> > new file mode 100644
> > index 000000000000..79dd24a104ef
> > --- /dev/null
> > +++ b/rust/helpers/srcu.c
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#include <linux/srcu.h>
> > +
> > +__rust_helper int rust_helper_init_srcu_struct_with_key(struct srcu_st=
ruct *ssp,
> > +							const char *name,
> > +							struct lock_class_key *key)
> > +{
> > +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> > +	return __init_srcu_struct(ssp, name, key);
> > +#else /* !CONFIG_DEBUG_LOCK_ALLOC */
> > +	return init_srcu_struct(ssp);
> > +#endif /* CONFIG_DEBUG_LOCK_ALLOC */
> > +}
>=20
> Similar to Boqun's feedback on a later patch, could you please make
> these be two functions under the corresponding legs of the existing
> CONFIG_DEBUG_LOCK_ALLOC #ifdef in include/linux/srcu.h?  You are includin=
g
> that file above, so it should work well.
>=20
> Actually, you could just name thefunction __init_srcu_struct(), use the
> existing definition under #ifdef CONFIG_DEBUG_LOCK_ALLOC, and just create
> the simple wrapper in the other leg of this #ifdef.  That would be more
> aligned with the Linux-kernel coding guidelines and also be less code.
>=20
> Or is the "rust_helper_" prefix mandatory?  If so, you could make
> rust_helper_init_srcu_struct() be a wrapper for __init_srcu_struct()
> in this file, then just define __init_srcu_struct() as a wrapper around
> init_srcu_struct() in the !CONFIG_DEBUG_LOCK_ALLOC leg of the #ifdef
> in include/linux/srcu.h.

The rust_helper_ prefix helps avoid duplicate symbol errors.

When you invoke `bindings::foo` then it will prefer to call the symbol
actually called `foo()`, but if there is no `foo` symbol, then it will
fall back to `rust_helper_foo()`.

This is useful because many symbols are only marked inline under some
configurations, and this makes it automatically pick the right one
depending on whether the real symbol exists or not.

Alice
