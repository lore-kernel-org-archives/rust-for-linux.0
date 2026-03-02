Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49EA1A682F
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 22:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772491630; cv=none; b=KlkTQ4MCsitJYln4vlHVrDsWS/IhllbbAwKdGtQEchyJMtS0VsdocoYK/I0F42GSn3+JXrMkPO3/GgZMzF2/e0o5p1eXW/diKzj9qEK/Me4ut1mML4+lDFNZXQq/4nIqTjuJtqOND7YPJPDdXa3N0e+d7tFZQjeWlJwdRW82hO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772491630; c=relaxed/simple;
	bh=DAPgw1+jCAvvxOf3eTs8qZySYiNFPzLsrWsvipDTuB8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N8oIS/CWw+hfwBeyU4XY8Gf7Irg4G0j6zrWjZfwrz07th8EdRxdzTdnlfwwPbefcNkFnuZAUUvhMUQbyHWrsMerldSG9SsWcqmxOiXEz5QX2Z9zPNbUhHi9ssHhOg3OfyHfUSV+Fqgj/xXnxu0Q7KSRUs4lZeMll2bKo0vhPj9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CQYMbAXy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CQYMbAXy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772491627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DAPgw1+jCAvvxOf3eTs8qZySYiNFPzLsrWsvipDTuB8=;
	b=CQYMbAXyNkyDSB9tT1sfiKL7RgZGKsAjkZXxwOrHHPFw1rNurPbJXUsVe2zBbtTLt4atpG
	+VxSiWv8hbC+eCv8HndwHPLgxeKieXZlFLQYKGIRQAm3AJgVn8l9Yr+Uvs0OvkZCs9FjDI
	raLuSw7O+IjANZSEiVhm8RgaOv57B78=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-szR8YHa6OYakHYTSStOJCg-1; Mon, 02 Mar 2026 17:47:07 -0500
X-MC-Unique: szR8YHa6OYakHYTSStOJCg-1
X-Mimecast-MFC-AGG-ID: szR8YHa6OYakHYTSStOJCg_1772491626
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a0258c5e5so15986606d6.3
        for <rust-for-linux@vger.kernel.org>; Mon, 02 Mar 2026 14:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772491626; x=1773096426;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DAPgw1+jCAvvxOf3eTs8qZySYiNFPzLsrWsvipDTuB8=;
        b=T6Q+BBI7p9pF/urjUGsoIyrUq1WJn7s7Yyn5m2NXq/5MnRDM1qMpuybF5rDYpItnJC
         VfxKaCgLtJZP1cNp5IWna3RF0JRWv1iQWLWuUxDQHlqyUmukGKVydv6YN1VMl5yQ/83t
         dw4hrKiC/juS3HTpkUV8wu7F3WZCvx1YtxGDMaGJkRyaLBO8iRgOxccTUUfv6h3a3x5D
         njV3r+Ak9cjpM0jUwVlf6RYCGUAspKPBHyOjcyVhRH2MVFQ5CBYZI5Qi3WseRQ/LeCpS
         RMZRm77vAOVf+UJiCCXk9pqLuGaYYDDMaFfXuHYWYfKx06eezwdIJPmDbmoQ5HeR2EoR
         4IHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUo2B9zHwLYMamO/O22UdI6tspLNM57wVh2AeNQMNmb6Eo6RN5B/tpmiL9u2aq2mO9UchxyW/FajqVtc8mnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlw5XQ9yIA33/91G7oOJMdZCCY+PCWyvZjVWdnv8XENDRE52b2
	K4fcs8485wwTTWPwMCZxoGbjn+x29//EUpGZHMfr7OB80j7IADYurItWmHmNvw3XFbb1HTF6Dy5
	Mc/pdZr2IOH/Ai9Rl+zWq+EvbJbTXaAK7/3X7ZaqhgYyKvywhVbpUbVA9mA7Cpv5VX7m2asWWKr
	hG
X-Gm-Gg: ATEYQzw135yvmHhdZ6bLB4hTpuzkRcPNkieZyHmEb1Vcu0JSucqHzcvqCvqs5fdpke+
	3ceFeaBLmwI7cF9lvH7zEaOXEQM6s+xY+hwlX6hq1P81AyTs7oWh2MAUOigeKFP2kuzC5EskbIK
	iDigkPVrfieFi/GEBidNnCEQdxOlDPLhoF6SPpcZCNvkXjMdLkz7es4hNHAiNLFVUdKE5fnKoSj
	F9DGVgP6U1LpxyuyTjmAbxAtAKiE9p63xzqyQNc/gx0rwAiq6PepnjjdANglifYU6q8qPRHRtL+
	sQnnEFFMc0T2ZreiZ+rdSRGJtjrs1xYbuDEI5B6OBuYA7G7/uKFVEvPGb3LglPzDcbuHgrQY+xx
	hT3qEJLbCDI1/S3ks1g==
X-Received: by 2002:a05:6214:e67:b0:899:f601:7891 with SMTP id 6a1803df08f44-899f60179b0mr84068566d6.14.1772491626127;
        Mon, 02 Mar 2026 14:47:06 -0800 (PST)
X-Received: by 2002:a05:6214:e67:b0:899:f601:7891 with SMTP id 6a1803df08f44-899f60179b0mr84068186d6.14.1772491625533;
        Mon, 02 Mar 2026 14:47:05 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7374600sm117987256d6.29.2026.03.02.14.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 14:47:04 -0800 (PST)
Message-ID: <482ef57154db2d58e1907a1648816ee31f2045a2.camel@redhat.com>
Subject: Re: [PATCH v18 5/5] rust: sync: Introduce SpinLockIrq::lock_with()
 and friends
From: lyude@redhat.com
To: Gary Guo <gary@garyguo.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Cc: Boqun Feng <boqun.feng@gmail.com>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor	 <alex.gaynor@gmail.com>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross	 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton	 <akpm@linux-foundation.org>, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar	 <mingo@redhat.com>, Will Deacon
 <will@kernel.org>, Waiman Long	 <longman@redhat.com>
Date: Mon, 02 Mar 2026 17:47:03 -0500
In-Reply-To: <DG7EYT29W3CY.2WMEH783JP7RI@garyguo.net>
References: <20260205204709.528234-1-lyude@redhat.com>
	 <20260205204709.528234-6-lyude@redhat.com>
	 <DG7EYT29W3CY.2WMEH783JP7RI@garyguo.net>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a9AoaunGsTEDVcsLoLfTcaxuMoIyUXwgWh9rmQA7PZ8_1772491626
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-02-05 at 23:23 +0000, Gary Guo wrote:
> On Thu Feb 5, 2026 at 8:44 PM GMT, Lyude Paul wrote:
> > `SpinLockIrq` and `SpinLock` use the exact same underlying C
> > structure,
> > with the only real difference being that the former uses the
> > irq_disable()
> > and irq_enable() variants for locking/unlocking. These variants can
> > introduce some minor overhead in contexts where we already know
> > that
> > local processor interrupts are disabled, and as such we want a way
> > to be
> > able to skip modifying processor interrupt state in said contexts
> > in order
> > to avoid some overhead - just like the current C API allows us to
> > do.
> >=20
> > In order to do this, we add some special functions for SpinLockIrq:
> > lock_with() and try_lock_with(), which allow acquiring the lock
> > without
> > changing the interrupt state - as long as the caller can provide a
> > LocalInterruptDisabled reference to prove that local processor
> > interrupts
> > have been disabled.
> >=20
> > In some hacked-together benchmarks we ran, most of the time this
> > did
> > actually seem to lead to a noticeable difference in overhead:
> >=20
> > =C2=A0 From an aarch64 VM running on a MacBook M4:
> > =C2=A0=C2=A0=C2=A0 lock() when irq is disabled, 100 times cost Delta { =
nanos: 500
> > }
> > =C2=A0=C2=A0=C2=A0 lock_with() when irq is disabled, 100 times cost Del=
ta { nanos:
> > 292 }
> > =C2=A0=C2=A0=C2=A0 lock() when irq is enabled, 100 times cost Delta { n=
anos: 834 }
> >=20
> > =C2=A0=C2=A0=C2=A0 lock() when irq is disabled, 100 times cost Delta { =
nanos: 459
> > }
> > =C2=A0=C2=A0=C2=A0 lock_with() when irq is disabled, 100 times cost Del=
ta { nanos:
> > 291 }
> > =C2=A0=C2=A0=C2=A0 lock() when irq is enabled, 100 times cost Delta { n=
anos: 709 }
> >=20
> > =C2=A0 From an x86_64 VM (qemu/kvm) running on a i7-13700H
> > =C2=A0=C2=A0=C2=A0 lock() when irq is disabled, 100 times cost Delta { =
nanos: 1002
> > }
> > =C2=A0=C2=A0=C2=A0 lock_with() when irq is disabled, 100 times cost Del=
ta { nanos:
> > 729 }
> > =C2=A0=C2=A0=C2=A0 lock() when irq is enabled, 100 times cost Delta { n=
anos: 1516
> > }
> >=20
> > =C2=A0=C2=A0=C2=A0 lock() when irq is disabled, 100 times cost Delta { =
nanos: 754
> > }
> > =C2=A0=C2=A0=C2=A0 lock_with() when irq is disabled, 100 times cost Del=
ta { nanos:
> > 966 }
> > =C2=A0=C2=A0=C2=A0 lock() when irq is enabled, 100 times cost Delta { n=
anos: 1227
> > }
> >=20
> > =C2=A0=C2=A0=C2=A0 (note that there were some runs on x86_64 where lock=
() on irq
> > disabled
> > =C2=A0=C2=A0=C2=A0 vs. lock_with() on irq disabled had equivalent bench=
marks, but
> > it very
> > =C2=A0=C2=A0=C2=A0 much appeared to be a minority of test runs.
> >=20
> > While it's not clear how this affects real-world workloads yet,
> > let's add
> > this for the time being so we can find out.
> >=20
> > This makes it so that a `SpinLockIrq` will work like a `SpinLock`
> > if
> > interrupts are disabled. So a function:
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (&'a SpinLockIrq, &'a Interr=
uptDisabled) -> Guard<'a, ..,
> > SpinLockBackend>
> >=20
> > makes sense. Note that due to `Guard` and `InterruptDisabled`
> > having the
> > same lifetime, interrupts cannot be enabled while the Guard exists.
> >=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> >=20
> > ---
> > This was originally two patches, but keeping them split didn't make
> > sense
> > after going from BackendInContext to BackendWithContext.
> >=20
> > V10:
> > * Fix typos - Dirk/Lyude
> > * Since we're adding support for context locks to GlobalLock as
> > well, let's
> > =C2=A0 also make sure to cover try_lock while we're at it and add
> > try_lock_with
> > * Add a private function as_lock_in_context() for handling casting
> > from a
> > =C2=A0 Lock<T, B> to Lock<T, B::ContextualBackend> so we don't have to
> > duplicate
> > =C2=A0 safety comments
> > V11:
> > * Fix clippy::ref_as_ptr error in Lock::as_lock_in_context()
> > V14:
> > * Add benchmark results, rewrite commit message
> > V17:
> > * Introduce `BackendWithContext`, move context-related bits into
> > there and
> > =C2=A0 out of `Backend`.
> > * Add missing #[must_use =3D =E2=80=A6] for try_lock_with()
> > * Remove all unsafe code from lock_with() and try_lock_with():
> > =C2=A0 Somehow I never noticed that literally none of the unsafe code i=
n
> > these
> > =C2=A0 two functions is needed with as_lock_in_context()...
> > V18:
> > * Get rid of BackendWithContext
> > * Just use transmute in as_lock_in_context()
> > * Now that we're only supporting IRQ spinlocks and not using
> > traits, use
> > =C2=A0 the type aliases for SpinLock and SpinLockGuard
> > * Improve the docs now that we're not using traits.
> >=20
> > =C2=A0rust/kernel/sync/lock/spinlock.rs | 78
> > ++++++++++++++++++++++++++++++-
> > =C2=A01 file changed, 77 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/rust/kernel/sync/lock/spinlock.rs
> > b/rust/kernel/sync/lock/spinlock.rs
> > index f11a84505ba0e..de736cb777e93 100644
> > --- a/rust/kernel/sync/lock/spinlock.rs
> > +++ b/rust/kernel/sync/lock/spinlock.rs
> > @@ -4,7 +4,10 @@
> > =C2=A0//!
> > =C2=A0//! This module allows Rust code to use the kernel's `spinlock_t`=
.
> > =C2=A0use super::*;
> > -use crate::prelude::*;
> > +use crate::{
> > +=C2=A0=C2=A0=C2=A0 interrupt::LocalInterruptDisabled,
> > +=C2=A0=C2=A0=C2=A0 prelude::*, //
> > +};
> > =C2=A0
> > =C2=A0/// Creates a [`SpinLock`] initialiser with the given name and a
> > newly-created lock class.
> > =C2=A0///
> > @@ -224,6 +227,45 @@ macro_rules! new_spinlock_irq {
> > =C2=A0/// # Ok::<(), Error>(())
> > =C2=A0/// ```
> > =C2=A0///
> > +/// The next example demonstrates locking a [`SpinLockIrq`] using
> > [`lock_with()`] in a function
> > +/// which can only be called when local processor interrupts are
> > already disabled.
> > +///
> > +/// ```
> > +/// use kernel::sync::{new_spinlock_irq, SpinLockIrq};
> > +/// use kernel::interrupt::*;
> > +///
> > +/// struct Inner {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 a: u32,
> > +/// }
> > +///
> > +/// #[pin_data]
> > +/// struct Example {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 #[pin]
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 inner: SpinLockIrq<Inner>,
> > +/// }
> > +///
> > +/// impl Example {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 fn new() -> impl PinInit<Self> {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pin_init!(Self {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 inner <- new_spinlock_irq!(Inner { a: 20 }),
> > +///=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 })
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +/// }
> > +///
> > +/// // Accessing an `Example` from a function that can only be
> > called in no-interrupt contexts.
> > +/// fn noirq_work(e: &Example, interrupt_disabled:
> > &LocalInterruptDisabled) {
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 // Because we know interrupts are disabled=
 from
> > interrupt_disable, we can skip toggling
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 // interrupt state using lock_with() and t=
he provided
> > token
> > +///=C2=A0=C2=A0=C2=A0=C2=A0 assert_eq!(e.inner.lock_with(interrupt_dis=
abled).a, 20);
> > +/// }
> > +///
> > +/// # let e =3D KBox::pin_init(Example::new(), GFP_KERNEL)?;
> > +/// # let interrupt_guard =3D local_interrupt_disable();
> > +/// # noirq_work(&e, &interrupt_guard);
> > +/// #
> > +/// # Ok::<(), Error>(())
> > +/// ```
> > +///
> > =C2=A0/// [`lock()`]: SpinLockIrq::lock
> > =C2=A0/// [`lock_with()`]: SpinLockIrq::lock_with
> > =C2=A0pub type SpinLockIrq<T> =3D super::Lock<T, SpinLockIrqBackend>;
> > @@ -286,6 +328,40 @@ unsafe fn assert_is_held(ptr: *mut
> > Self::State) {
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
> > =C2=A0
>=20
> This is much cleaner now compared the previous series. Thanks!
>=20
> With functions marked as `#[inline]` as appropriate:
>=20
> =C2=A0=C2=A0=C2=A0 Reviewed-by: Gary Guo <gary@garyguo.net>
>=20
> BTW: do we want to have a
>=20
> =C2=A0=C2=A0=C2=A0 impl<'a> lock::Guard<'a, T, SpinLockIrqBackend> {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn as_local_irq_disabled(&self=
) -> &LocalInterruptDisabled;
> =C2=A0=C2=A0=C2=A0 }
>=20

Yes imo - since it lets us get to the level of skipping assertions that
C is currently able to hit. Though, I wonder if this would be better
suited for AsRef?

I will save this for a follow-up patch though, since we're so close to
getting this in right now.

> ?
>=20
> Best,
> Gary
>=20
> > +impl<T: ?Sized> Lock<T, SpinLockIrqBackend> {
> > +=C2=A0=C2=A0=C2=A0 /// Casts the lock as a `Lock<T, SpinLockBackend>`.
> > +=C2=A0=C2=A0=C2=A0 fn as_lock_in_interrupt<'a>(&'a self, _context: &'a
> > LocalInterruptDisabled) -> &'a SpinLock<T> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `Lock<T, SpinLockBacke=
nd>` and `Lock<T,
> > SpinLockIrqBackend>` both have identical data
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 layouts.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - As long as local inter=
rupts are disabled (which is
> > proven to be true by _context), it
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 is safe to t=
reat a lock with SpinLockIrqBackend as a
> > SpinLockBackend lock.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { core::mem::transmu=
te(self) }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Acquires the lock without modifying local inter=
rupt state.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// This function should be used in place of the mo=
re
> > expensive [`Lock::lock()`] function when
> > +=C2=A0=C2=A0=C2=A0 /// possible for [`SpinLockIrq`] locks.
> > +=C2=A0=C2=A0=C2=A0 pub fn lock_with<'a>(&'a self, context: &'a
> > LocalInterruptDisabled) -> SpinLockGuard<'a, T> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.as_lock_in_interrupt(c=
ontext).lock()
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Tries to acquire the lock without modifying loc=
al
> > interrupt state.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// This function should be used in place of the mo=
re
> > expensive [`Lock::try_lock()`] function
> > +=C2=A0=C2=A0=C2=A0 /// when possible for [`SpinLockIrq`] locks.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// Returns a guard that can be used to access the =
data
> > protected by the lock if successful.
> > +=C2=A0=C2=A0=C2=A0 #[must_use =3D "if unused, the lock will be immedia=
tely
> > unlocked"]
> > +=C2=A0=C2=A0=C2=A0 pub fn try_lock_with<'a>(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &'a self,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context: &'a LocalInterrupt=
Disabled,
> > +=C2=A0=C2=A0=C2=A0 ) -> Option<SpinLockGuard<'a, T>> {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.as_lock_in_interrupt(c=
ontext).try_lock()
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > =C2=A0#[kunit_tests(rust_spinlock_irq_condvar)]
> > =C2=A0mod tests {
> > =C2=A0=C2=A0=C2=A0=C2=A0 use super::*;

