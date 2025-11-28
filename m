Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629CA2FFF89;
	Fri, 28 Nov 2025 11:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764329884; cv=none; b=goW1+NRJ2wpMGEy0+u9y/S1Q5S7a7nOhIX4w1XvOFHpqfBPkGSJvnwpHSgohr99aPQ94fNfwJTvRQ9cgIDUnnY8PrzZ/7PAm3ufkZoBidtBNPrfrRn1OTwqgDQwPKgBxBVrbMo0A/139wYB0WMEnhOG8xyviRHKgR3mvYVs2LAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764329884; c=relaxed/simple;
	bh=cVgoCtq2j/ndelmoSpMVml06ZaxQpq+EWGXnViuOfeM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G5QF8SIv4wnSbM0LCDLV9m5MZTXZkq91IlOyJQ+nMJ5rsjj/XVAdXFyKP5UhTtGYH5gZqXn7Xz/eLJO6woKxquQGGdQbVwpMz8qnfv7DjM/X42tssasj4LtSv/ix56nUv9FDuEWPwyfMcx2vlBqLeMQpGQz4Z4agKqjnmLad9h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=f6sgtErO; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="f6sgtErO"
Received: from mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:571a:0:640:23e3:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 124148118D;
	Fri, 28 Nov 2025 14:37:53 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id lbdQPsLLxiE0-ioe7jIl2;
	Fri, 28 Nov 2025 14:37:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764329872;
	bh=PtP34/WiKNrDxi9O9UtpNx2aDvdJKNuyY2HPf/lEDoY=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=f6sgtErOb9sr3hu4x41hH+kzWxDOj0vA9t7MXcEulhvo8b1YbFf3pEAHqGkxP0BDZ
	 zv1d/vfAAtblhRbxWWiam8fJ72wTNsPTJmNjk3VIveI3dxlS102HoJ25j7dCVCCDg+
	 6A5oWWIYsNYhzlD7jAoKNeREum4/APmOboqff0g0=
Authentication-Results: mail-nwsmtp-smtp-production-main-81.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Fri, 28 Nov 2025 14:37:46 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 longman@redhat.com, felipe_life@live.com, daniel@sedlak.dev,
 bjorn3_gh@protonmail.com, daniel.almeida@collabora.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/6] rust: ww_mutex: add Mutex, AcquireCtx and
 MutexGuard
Message-ID: <20251128143746.4fc57cfb@nimda>
In-Reply-To: <80844a3e9f27963592b9453b57f227e8fa5f802b.camel@redhat.com>
References: <20251101161056.22408-1-work@onurozkan.dev>
	<20251101161056.22408-5-work@onurozkan.dev>
	<80844a3e9f27963592b9453b57f227e8fa5f802b.camel@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Nov 2025 16:00:18 -0500
Lyude Paul <lyude@redhat.com> wrote:

> Feedback down below:
>=20
> On Sat, 2025-11-01 at 19:10 +0300, Onur =C3=96zkan wrote:
> > Implements full locking API (lock, try_lock, slow path,
> > interruptible variants) and integration with kernel bindings.
> >=20
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  rust/kernel/sync/lock/ww_mutex.rs             | 276
> > ++++++++++++++++++ rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs |
> > 211 +++++++++++++ 2 files changed, 487 insertions(+)
> >  create mode 100644 rust/kernel/sync/lock/ww_mutex/acquire_ctx.rs
> >=20
> > diff --git a/rust/kernel/sync/lock/ww_mutex.rs
> > b/rust/kernel/sync/lock/ww_mutex.rs index
> > 727c51cc73af..2a9c1c20281b 100644 ---
> > a/rust/kernel/sync/lock/ww_mutex.rs +++
> > b/rust/kernel/sync/lock/ww_mutex.rs @@ -1,7 +1,283 @@
> >  // SPDX-License-Identifier: GPL-2.0
> > =20
> >  //! Rust abstractions for the kernel's wound-wait locking
> > primitives. +//!
> > +//! It is designed to avoid deadlocks when locking multiple
> > [`Mutex`]es +//! that belong to the same [`Class`]. Each lock
> > acquisition uses an +//! [`AcquireCtx`] to track ordering and
> > ensure forward progress.=20
> > +use crate::error::to_result;
> > +use crate::prelude::*;
> > +use crate::types::{NotThreadSafe, Opaque};
> > +use crate::{bindings, container_of};
> > +
> > +use core::cell::UnsafeCell;
> > +use core::marker::PhantomData;
> > +
> > +pub use acquire_ctx::AcquireCtx;
> >  pub use class::Class;
> > =20
> > +mod acquire_ctx;
> >  mod class;
> > +
> > +/// A wound-wait (ww) mutex that is powered with deadlock avoidance
> > +/// when acquiring multiple locks of the same [`Class`].
> > +///
> > +/// Each mutex belongs to a [`Class`], which the wound-wait
> > algorithm +/// uses to figure out the order of acquisition and
> > prevent deadlocks. +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::c_str;
> > +/// use kernel::sync::Arc;
> > +/// use kernel::sync::lock::ww_mutex::{AcquireCtx, Class, Mutex};
> > +/// use pin_init::stack_pin_init;
> > +///
> > +/// stack_pin_init!(let class =3D
> > Class::new_wound_wait(c_str!("some_class"))); +/// let mutex =3D
> > Arc::pin_init(Mutex::new(42, &class), GFP_KERNEL)?; +///
> > +/// let ctx =3D KBox::pin_init(AcquireCtx::new(&class), GFP_KERNEL)?;
> > +///
> > +/// // SAFETY: Both `ctx` and `mutex` uses the same class.
> > +/// let guard =3D unsafe { ctx.lock(&mutex)? };
> > +/// assert_eq!(*guard, 42);
> > +///
> > +/// # Ok::<(), Error>(())
> > +/// ```
> > +#[pin_data]
>=20
> You're missing a #[repr(C)] here, because=E2=80=A6 (cont. down below)
>=20
> > +pub struct Mutex<'a, T: ?Sized> {
> > +    #[pin]
> > +    inner: Opaque<bindings::ww_mutex>,
> > +    _p: PhantomData<&'a Class>,
>=20
> This should be at the bottom of the class
>=20
> > +    data: UnsafeCell<T>,
> > +}
> > +
> > +// SAFETY: `Mutex` can be sent to another thread if the protected
> > +// data `T` can be.
> > +unsafe impl<T: ?Sized + Send> Send for Mutex<'_, T> {}
> > +
> > +// SAFETY: `Mutex` can be shared across threads if the protected
> > +// data `T` can be.
> > +unsafe impl<T: ?Sized + Send + Sync> Sync for Mutex<'_, T> {}
>=20
> Looks like there's a funny pitfall here! According to Alice Rhyl (see
> the convo we had in zulip), for this to actually be safe we need to
> add an empty Drop implementation to Mutex to ensure the compiler
> doesn't actually allow it to be dropped after the lock class. So
> would be good to add that + a comment of why it's needed
>=20

Mutex cannot live longer than the Class it includes. Which means this
case (compiler dropping Mutex because Class was dropped) can't ever
happen. Or, am I missing something here?

[...]
> > +}
> > +
> > +#[pinned_drop]
> > +impl PinnedDrop for AcquireCtx<'_> {
> > +    fn drop(self: Pin<&mut Self>) {
> > +        // SAFETY: Given the lifetime bounds we know no locks are
> > held,
> > +        // so calling `ww_acquire_fini` is safe.
> > +        unsafe { bindings::ww_acquire_fini(self.inner.get()) };
> > +    }
> > +}
>=20

-Onur
