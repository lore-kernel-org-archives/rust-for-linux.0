Received: from forward502b.mail.yandex.net (forward502b.mail.yandex.net [178.154.239.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA062BDC3F;
	Thu, 27 Nov 2025 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236185; cv=none; b=ZyAFNTYOmhKqVFZ9PIoMa3tcL1cD1TETaho4ZNUn6f+DJUGBw+TTJqptQHc8lDAUgG0YMgH/reS42AGMSC+dT5V+3RAV6mBh1KThv1MYe8/F9bF5GvG2i2o+7xB94bkeRD/P7sRr4Up+9T+IejDPWFGzaIqPQjsAhktUwjYZIFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236185; c=relaxed/simple;
	bh=uiYox4PsOatAejl1SZIKDolKvWn42oQ9kwA2CfUAr0M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kvP+r1uRKskP7LK3xOM+VSfsPS4PPvaTKjuOs72zZ6pvyhX5CbRzer+J9ZsWXd0pjCqcTy72E+glTUokkuCce5CXX4A5z/IOFkjqtHxZdObq1En2NdOYxFuKGrLDcki6hys1axJum29x0AU6CihmQI5c2KYU0X66XSR2B2gSRxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=cs5Pk9/n; arc=none smtp.client-ip=178.154.239.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="cs5Pk9/n"
Received: from mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net [IPv6:2a02:6b8:c24:942:0:640:e3c0:0])
	by forward502b.mail.yandex.net (Yandex) with ESMTPS id 2E48D81AA4;
	Thu, 27 Nov 2025 12:24:54 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id mOa9DQ8LViE0-cZSHnfAw;
	Thu, 27 Nov 2025 12:24:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1764235493;
	bh=pD96XnJc1uvvSzdlPT27EyKGqjNgpJBA4wqJeKUjdEI=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=cs5Pk9/n3WG1JElAUFHTbJ6Z+KA8+wrTlhaBzuF588fHJL3sMILVrZokccTPUJ9M3
	 dUe4tkLoXCvgOcnekw8VUbFHQsawPMJiV8hMSOt0eF//pB3idezjcyPg5uMkFMS94X
	 b0W+EVG4sABe1hx/1y3Q0oqEAqAAVuZJfKu2LbC0=
Authentication-Results: mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 27 Nov 2025 12:24:46 +0300
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
Message-ID: <20251127122446.5a5b4e23@nimda.home>
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

Can't do that due to:

    error[E0277]: the size for values of type `T` cannot be known at
    compilation time --> rust/kernel/sync/lock/global.rs:119:12
         |
    118  | pub struct GlobalLockedBy<T: ?Sized, B: GlobalLockBackend> {
         |                           - this type parameter needs to be
    `Sized` 119  |     value: UnsafeCell<T>,
         |            ^^^^^^^^^^^^^ doesn't have a size known at
    compile-time |


It's the same reason we did the same thing on GlobalLockedBy like this:

	pub struct GlobalLockedBy<T: ?Sized, B: GlobalLockBackend> {
            _backend: PhantomData<B>,
            value: UnsafeCell<T>,
        }

[...]
> > +    /// Tries to lock the mutex on this [`AcquireCtx`] without
> > blocking.
> > +    ///
> > +    /// Unlike `lock`, no deadlock handling is performed.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The given `mutex` must be created with the [`Class`] that
> > was used
> > +    /// to initialize this [`AcquireCtx`].
> > +    pub unsafe fn try_lock<'a, T>(&'a self, mutex: &'a Mutex<'a,
> > T>) -> Result<MutexGuard<'a, T>> {
> > +        // SAFETY: By the safety contract, `mutex` belongs to the
> > same `Class`
> > +        // as `self` does.
> > +        unsafe { lock_common(mutex, Some(self), LockKind::Try) }
> > +    }
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
