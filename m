Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5D72F1FC7
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767179251; cv=none; b=SOxW81kBigHHPcaLbksh/3cb/G/AjjsLS4HXhVED+779rmw7d9E6QoLKDPaYONhcUGhPnPbqLAboXmonfDZYI9pPIWoc1E7FQQplXhbCH052t9Hk9hEq1iEC5pq5taIwEj+XEkYFx5+GpwH4Gvn9qR0vkahn+x/qat55LuaXBgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767179251; c=relaxed/simple;
	bh=dHD2S3W00WNDP7FD20/t2xPKp74wJA9/l8NQTZI9RjM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dcSqk8HVS4+LcY81YD/9+5CNfnqebkJNKB3wXJeoFP0eWqWFLXmoPJIgzTQ5TKz2vo9K+CvVgnvNvHOKlW7QYrYlkVOiTdUag2nGU0iLkw+e/wIfCovOeeVxoylhZsU5jTVLE0AmkghYbGiXbuZ/bRw3sAr0dn7OEqTCLqT2uLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TT+FOnoP; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TT+FOnoP"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47a83800743so58198335e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 03:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767179248; x=1767784048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Obd7y4Fx4yahQNvZOdOFXXd0rTKF3tU45eWPgCYlMqA=;
        b=TT+FOnoPUdefo+IZ+ZyIBS8HR/P71D5viN5gRqanHrngDFt08Bcs1rWWSIco3hfuZ1
         7Ff6KjVV8gVyh3IHq36c3ZB8AeveuvI0SIBoubyZ1lww0h4IzrgeDddJZljys/6eLwhG
         dOsx9/7UNT+wn1ORAze/H4IRv/NkyFgZPwsVD4zudEWxIwnxnbKwJRt/FaELO5gzqAn+
         RN71OE1+uz5oObcB5jdIPROYumSJujOFcIAhpN43naGD9sLSeYq1unakHh3k+6feNmm6
         C216t9a8Ud3DlEFcOTiind6BWWYl5Ea6HfHzPI84ZpzwfBQWEOjEJikI9fgT4wGw/AD+
         ZRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767179248; x=1767784048;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Obd7y4Fx4yahQNvZOdOFXXd0rTKF3tU45eWPgCYlMqA=;
        b=GKeo/6eOO2T8Gsjc/tRN38a5w/Uq59S2sAuFkeGIXcbLBLr7ZYLyT5XTY1umrl6oO9
         ISzsSWhjAzw+w8I7KlIU+pinH4DiGqJUmLX5XiykDYo6grhSptbg9Fa75hEy7890h6Tx
         uOpjAyJKpsxdxZcMnls2RdJB98EussCzk1rn6LR/HK9T2DV0YDbbbtkDMUH+lBMOYjJu
         ZSMOXHOcMzwJnvJH03cKu7Kr2qwi28dOa/6mK2V8E9lc1nNEBx2qvO/Cvypt8xVju9cL
         thBHo8Q1sjBpM7JfHGO2lDftl2wB0GZpRSrqAaIrrl4dfvmulSWVx+VgXpsBCuW242Ls
         3W+A==
X-Forwarded-Encrypted: i=1; AJvYcCVnURy+bxfe7K7tAKIYn+Yn934Vu4prNHf0/L1zdaMdxRT0V4CIHaofUbgzW+2aNqAm6SmqxCa7cGBLbWjeFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu7/lGb61zN+byjjPAb0vqLY4llQiK8Kt5m9cuvnEX1C9n5vOE
	029bvn80mjT+aIhM7y6GJrFAjJbTEnKb/4oIynULOYCzG821xKDbPjy3yG4nMKcpX8eGW20TVA0
	kqDkv2yzVcpHJIS8F5Q==
X-Google-Smtp-Source: AGHT+IFtUtfepgWq5okGaIWfaannYRqSdTReA0ApNU3u30WfcfStY0z27DKCkG1EnFBpa3mmU/PWbAnaedSGzQo=
X-Received: from wmbgz11.prod.google.com ([2002:a05:600c:888b:b0:47d:5885:5da5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c04b:10b0:47d:333d:99c with SMTP id 5b1f17b1804b1-47d333d09b9mr251107355e9.18.1767179248023;
 Wed, 31 Dec 2025 03:07:28 -0800 (PST)
Date: Wed, 31 Dec 2025 11:07:27 +0000
In-Reply-To: <CALpAb9MoT20Ch4pe-oMz8kpqaZsvmgNwPk1XSC+faZi7huwQKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251229072157.3857053-1-sunke@kylinos.cn> <20251229072157.3857053-2-sunke@kylinos.cn>
 <a8a08f6f-dd3b-4498-8fb2-f91934683288@gmail.com> <CALpAb9MoT20Ch4pe-oMz8kpqaZsvmgNwPk1XSC+faZi7huwQKg@mail.gmail.com>
Message-ID: <aVUD76o8dBVJpNVM@google.com>
Subject: Re: [PATCH v7 1/4] lib/vsprintf: Export functions for Rust pointer
 formatting support
From: Alice Ryhl <aliceryhl@google.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Dirk Behme <dirk.behme@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Timur Tabi <ttabi@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	John Ogness <john.ogness@linutronix.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 31, 2025 at 10:46:37AM +0800, Ke Sun wrote:
> On Mon, Dec 29, 2025 at 6:44=E2=80=AFPM Dirk Behme <dirk.behme@gmail.com>=
 wrote:
> >
> > On 29.12.25 08:21, Ke Sun wrote:
> > > Export ptr_to_hashval() and extract kptr_restrict_value() to enable
> > > Rust code to use kernel pointer formatting functionality.
> > >
> > > - Export ptr_to_hashval() with EXPORT_SYMBOL_GPL for pointer hashing.
> > >   This function is used to hash kernel pointers before printing them,
> > >   preventing information leaks about kernel memory layout.
> > >
> > > - Extract kptr_restrict handling logic from restricted_pointer() into
> > >   a separate exported function kptr_restrict_value() that can be
> > >   reused by both restricted_pointer() (for %pK format specifier) and
> > >   Rust code.
> > >
> > > The kptr_restrict_value() function:
> > > - Returns 0, 1, or 2 to indicate the kptr_restrict sysctl value
> > > - Returns -1 for error case (IRQ context with kptr_restrict=3D=3D1)
> > > - Modifies the pointer value through @pptr parameter when needed
> > >   (sets to NULL when access should be restricted)
> > >
> > > These functions are needed for the HashedPtr and RestrictedPtr wrappe=
r
> > > types in rust/kernel/ptr.rs to provide safe pointer formatting that
> > > matches C kernel patterns.
> > >
> > > This refactoring:
> > > - Allows restricted_pointer() to reuse the common logic while
> > >   maintaining the same behavior
> > > - Enables Rust code to use the same kptr_restrict handling logic
> > > - Reduces code duplication
> > >
> > > Signed-off-by: Ke Sun <sunke@kylinos.cn>
> > > Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> > > ---
> > >  include/linux/printk.h | 10 ++++++++
> > >  lib/vsprintf.c         | 55 ++++++++++++++++++++++++++++++++--------=
--
> > >  2 files changed, 52 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > > index 45c663124c9bd..91380b1eff1a1 100644
> > > --- a/include/linux/printk.h
> > > +++ b/include/linux/printk.h
> > > @@ -385,6 +385,16 @@ extern void __printk_cpu_sync_put(void);
> > >
> > >  extern int kptr_restrict;
> > >
> > > +/**
> > > + * kptr_restrict_value - Determine what pointer value should be used=
 for %pK
> > > + * @pptr: Pointer to the pointer value (may be modified)
> > > + *
> > > + * Returns:
> > > + *   - 0, 1, or 2: The kptr_restrict value if pointer should be used
> > > + *   - -1: Error case (IRQ context with kptr_restrict=3D=3D1), *pptr=
 unchanged
> > > + */
> > > +int kptr_restrict_value(const void **pptr);
> > > +
> > >  /**
> > >   * pr_fmt - used by the pr_*() macros to generate the printk format =
string
> > >   * @fmt: format string passed from a pr_*() macro
> > > diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> > > index a3790c43a0aba..29d2e681c6e73 100644
> > > --- a/lib/vsprintf.c
> > > +++ b/lib/vsprintf.c
> > > @@ -811,6 +811,7 @@ int ptr_to_hashval(const void *ptr, unsigned long=
 *hashval_out)
> > >  {
> > >       return __ptr_to_hashval(ptr, hashval_out);
> > >  }
> > > +EXPORT_SYMBOL_GPL(ptr_to_hashval);
> > >
> > >  static char *ptr_to_id(char *buf, char *end, const void *ptr,
> > >                      struct printf_spec spec)
> > > @@ -857,14 +858,28 @@ static char *default_pointer(char *buf, char *e=
nd, const void *ptr,
> > >
> > >  int kptr_restrict __read_mostly;
> > >
> > > -static noinline_for_stack
> > > -char *restricted_pointer(char *buf, char *end, const void *ptr,
> > > -                      struct printf_spec spec)
> > > +/**
> > > + * kptr_restrict_value - Determine what pointer value should be used=
 for %pK
> > > + * @pptr: Pointer to the pointer value (may be modified)
> > > + *
> > > + * This function determines what pointer value should be printed bas=
ed on the
> > > + * kptr_restrict sysctl setting:
> > > + *
> > > + * - kptr_restrict =3D=3D 0: Return 0 (use original pointer, will be=
 hashed)
> > > + * - kptr_restrict =3D=3D 1: Return 1 if current process has CAP_SYS=
LOG and same
> > > + *                       euid/egid, otherwise set *pptr to NULL and =
return 1
> > > + * - kptr_restrict >=3D 2: Set *pptr to NULL and return 2
> > > + *
> > > + * Returns:
> > > + *   - 0, 1, or 2: The kptr_restrict value if pointer should be used
> > > + *   - -1: Error case (IRQ context with kptr_restrict=3D=3D1), *pptr=
 unchanged
> > > + */
> > > +int kptr_restrict_value(const void **pptr)
> >
> > Would it be an improvment to not modify the pptr itself? But instead
> > to work with some kind of in ptr (not modified) and out_ptr (returned
> > to the caller then)?
> >
> > kptr_restrict_value(const void *ptr, const void **out_ptr)
> >
> > And an enum for the result? With something like
> >
> > enum kptr_restict_result {
> >   KPTR_RESTICT_ERROR =3D -1,
> >   KPTR_RESTICT_NONE =3D 0,
> >   KPTR_RESTICT_PARTIAL =3D 1,
> >   KPTR_RESTICT_FULL =3D 2,
> > }
> >
> > What would result in something like
> >
> > enum kptr_restict_result kptr_restrict_value(const void *ptr, const
> > void **out_ptr)
> >
> > Opinions?
>=20
> Given that fully implementing all %p format specifier extensions would
> require substantial code changes, we're considering converting Rust's
> Formatter to C format strings at the Rust layer and directly calling
> snprintf. This would allow us to reuse the existing C implementations
> without modifying vsprintf.c.
>=20
> What do you think of this approach?

That's never going to happen. It would be quite difficult to write a
safe API where you can't accidentally mix up the wrong type with the C
format string. You would probably have to write a proc macro parser for
format strings, which sounds like a nightmare. And you will never be
able to get error messages that are as good as the built-in formatting
machinery, because it relies on compiler internals and cannot be
reproduced in a custom proc macro.

I think Dirk's suggestion is reasonable. Or just do not support %pK.

Alice
