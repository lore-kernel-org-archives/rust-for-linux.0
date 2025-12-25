Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net [178.154.239.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0684E220F29;
	Thu, 25 Dec 2025 10:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766657200; cv=none; b=aIZE7paaoVzgyUfw2bvbDErIvNS3dbfLpe94flL9jXRXieU4dUoxJmcNgtPOW6VWSt7mMqwneDqarvCu7OcEK1eXhgh5Qk/jKV9szg8lkkOSCM22l4goAF0w7qf3TIhUOEWSrSM62tmtGom01Y7Uy2JozrjR+/mQYMRduSQcIL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766657200; c=relaxed/simple;
	bh=XPHLlP/uTjBxjHAck75S30bJI+dxip88nP0XEeNErDM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jzkvnyem8c68q9ymDj0LPpONDW4Ind3cd4eQlSOH1ueFqaTr6PtraVdmCpyKETL2Z0OahUevaOTAHqRuy70SIWDqCBYRTI8vQjZNnZrgez7/ZoeTKn5NKywpdw+7NEM34OKNYdk4M4kAFqF/QX/cis+3zVWHYHfGrD2NrWl6qA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=BJRfb3Tn; arc=none smtp.client-ip=178.154.239.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="BJRfb3Tn"
Received: from mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2804:0:640:a3ea:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTPS id 6D57C89DEA;
	Thu, 25 Dec 2025 13:00:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 20attH7G7W20-oEXLPuBM;
	Thu, 25 Dec 2025 13:00:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1766656807;
	bh=Zu9eBT3zdFDfly4VLEKmZESuYGrUlPo9P7pyCB7LKgI=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=BJRfb3TnL5aVWEyTSaJdrJspGmUwq26hODMf6g2bI7uqwZ4MMfCXVe3V6cc/8wmkl
	 sRj0SlBWCEV7XRz3NWy9VBvIg6+9vZ0P7Lyg7MXJtlPxsbvjvQtQV1FcC94sPUoTOQ
	 4XiVwA6foUwdsN4rchXgWZIAzIX0dniLVsPqyXwg=
Authentication-Results: mail-nwsmtp-smtp-production-main-97.vla.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 25 Dec 2025 13:00:00 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: rust-for-linux@vger.kernel.org, lossin@kernel.org, lyude@redhat.com,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, felipe_life@live.com,
 daniel@sedlak.dev, thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/6] rust: implement Class for ww_class support
Message-ID: <20251225130000.429629db@nimda>
In-Reply-To: <C57F6478-F365-4FCB-B4B2-7ADB6B4793E3@collabora.com>
References: <20251201102855.4413-1-work@onurozkan.dev>
	<20251201102855.4413-5-work@onurozkan.dev>
	<C57F6478-F365-4FCB-B4B2-7ADB6B4793E3@collabora.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Dec 2025 14:59:59 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

Hi Daniel,

> Hi Onur,
>=20
> > On 1 Dec 2025, at 07:28, Onur =C3=96zkan <work@onurozkan.dev> wrote:
> >=20
> > Adds the Class type, the first step in supporting
> > ww_mutex in Rust. Class represents ww_class, used
> > for deadlock avoidance for supporting both wait-die
> > and wound-wait semantics.
> >=20
> > Also adds the define_class macro for safely declaring
> > static instances.
> >=20
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> > rust/kernel/sync/lock.rs                |   1 +
> > rust/kernel/sync/lock/ww_mutex.rs       |   7 ++
> > rust/kernel/sync/lock/ww_mutex/class.rs | 156
> > ++++++++++++++++++++++++ 3 files changed, 164 insertions(+)
> > create mode 100644 rust/kernel/sync/lock/ww_mutex.rs
> > create mode 100644 rust/kernel/sync/lock/ww_mutex/class.rs
> >=20
> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > index 27202beef90c..5b320c2b28c1 100644
> > --- a/rust/kernel/sync/lock.rs
> > +++ b/rust/kernel/sync/lock.rs
> > @@ -15,6 +15,7 @@
> >=20
> > pub mod mutex;
> > pub mod spinlock;
> > +pub mod ww_mutex;
> >=20
> > pub(super) mod global;
> > pub use global::{GlobalGuard, GlobalLock, GlobalLockBackend,
> > GlobalLockedBy}; diff --git a/rust/kernel/sync/lock/ww_mutex.rs
> > b/rust/kernel/sync/lock/ww_mutex.rs new file mode 100644
> > index 000000000000..727c51cc73af
> > --- /dev/null
> > +++ b/rust/kernel/sync/lock/ww_mutex.rs
> > @@ -0,0 +1,7 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Rust abstractions for the kernel's wound-wait locking
> > primitives.
>=20
> Can you link to the docs here?
>=20
> > +
> > +pub use class::Class;
> > +
> > +mod class;
> > diff --git a/rust/kernel/sync/lock/ww_mutex/class.rs
> > b/rust/kernel/sync/lock/ww_mutex/class.rs new file mode 100644
> > index 000000000000..b0753093f1e0
> > --- /dev/null
> > +++ b/rust/kernel/sync/lock/ww_mutex/class.rs
> > @@ -0,0 +1,156 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Provides [`Class`] to group wound/wait mutexes to be acquired
> > together +//! and specifies which deadlock avoidance algorithm to
> > use (e.g., wound-wait +//! or wait-die).
> > +//!
> > +//! The [`define_class`] macro and
> > [`Class::new_wait_die`]/[`Class::new_wound_wait`] +//! constructors
> > provide safe ways to create classes. +
> > +use crate::bindings;
> > +use crate::prelude::*;
> > +use crate::types::Opaque;
> > +
> > +/// Creates static [`Class`] instances.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::{c_str, define_class};
> > +///
> > +/// define_class!(WOUND_WAIT_GLOBAL_CLASS, wound_wait,
> > c_str!("wound_wait_global_class")); +///
> > define_class!(WAIT_DIE_GLOBAL_CLASS, wait_die,
> > c_str!("wait_die_global_class")); +/// ``` +#[macro_export]
> > +macro_rules! define_class {
> > +    ($name:ident, wound_wait, $class_name:expr) =3D> {
> > +        static $name: $crate::sync::lock::ww_mutex::Class =3D
> > +            // SAFETY: This is `static`, so address is fixed and
> > won't move.
> > +            unsafe {
> > $crate::sync::lock::ww_mutex::Class::unpinned_new($class_name,
> > false) };
> > +    };
> > +    ($name:ident, wait_die, $class_name:expr) =3D> {
> > +        static $name: $crate::sync::lock::ww_mutex::Class =3D
> > +            // SAFETY: This is `static`, so address is fixed and
> > won't move.
> > +            unsafe {
> > $crate::sync::lock::ww_mutex::Class::unpinned_new($class_name,
> > true) };
> > +    };
> > +}
> > +
> > +/// Used to group mutexes together for deadlock avoidance.
> > +///
> > +/// All mutexes that might be acquired together should use the
> > same class. +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::sync::lock::ww_mutex::Class;
> > +/// use kernel::c_str;
> > +/// use pin_init::stack_pin_init;
> > +///
> > +/// stack_pin_init!(let _wait_die_class =3D
> > Class::new_wait_die(c_str!("some_class"))); +///
> > stack_pin_init!(let _wound_wait_class =3D
> > Class::new_wound_wait(c_str!("some_other_class"))); +/// +/// #
> > Ok::<(), Error>(()) +/// ```
> > +#[pin_data]
> > +#[repr(transparent)]
> > +pub struct Class {
> > +    #[pin]
> > +    pub(super) inner: Opaque<bindings::ww_class>,
>=20
> Do you plan on ever extending this? A tuple struct might make more
> sense otherwise.
>=20

I can't find any usage of `#[pin]` inside a tupple. Is it even possible?

> > +}
> > +
> > +// SAFETY: [`Class`] is set up once and never modified. It's fine
> > to share it across threads.
>=20
> > +unsafe impl Sync for Class {}
> > +// SAFETY: Doesn't hold anything thread-specific. It's safe to
> > send to other threads. +unsafe impl Send for Class {}
>=20
> Please keep Foo and impl Foo together. The very next thing one wants
> to see after a type definition is its implementation.
>=20
> i.e.:
>=20
> struct Foo;
>=20
> impl Foo {=E2=80=A6}
>=20
> impl Bar for Foo {=E2=80=A6}
>=20
> > +
> > +impl Class {
> > +    /// Creates an unpinned [`Class`].
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// Caller must guarantee that the returned value is not moved
> > after creation.
> > +    pub const unsafe fn unpinned_new(name: &'static CStr,
> > is_wait_die: bool) -> Self {
>=20
> IMHO new_unpinned() would be a better name. Also, where is this used?
>=20
> By the way, this will immediately move Self out of this function,
> which is technically after its creation (i.e.: it=E2=80=99s after the Cla=
ss
> {=E2=80=A6} construct). Is this ok?
>=20

It's meant to be used from the `define_class` macro. I will update the
comment to make it more clear.

>=20
>=20
> > +        Class {
> > +            inner: Opaque::new(bindings::ww_class {
> > +                stamp: bindings::atomic_long_t { counter: 0 },
> > +                acquire_name: name.as_char_ptr(),
> > +                mutex_name: name.as_char_ptr(),
> > +                is_wait_die: is_wait_die as u32,
> > +                // TODO: Replace with
> > `bindings::lock_class_key::default()` once
> > +                // stabilized for `const`.
> > +                //
> > +                // SAFETY: This is always zero-initialized when
> > defined with
> > +                // `DEFINE_WD_CLASS` globally on C side.
> > +                //
> > +                // For reference, see __WW_CLASS_INITIALIZER() in
> > +                // "include/linux/ww_mutex.h".
> > +                acquire_key: unsafe { core::mem::zeroed() },
> > +                // TODO: Replace with
> > `bindings::lock_class_key::default()` once
> > +                // stabilized for `const`.
> > +                //
> > +                // SAFETY: This is always zero-initialized when
> > defined with
> > +                // `DEFINE_WD_CLASS` globally on C side.
> > +                //
> > +                // For reference, see __WW_CLASS_INITIALIZER() in
> > +                // "include/linux/ww_mutex.h".
> > +                mutex_key: unsafe { core::mem::zeroed() },
> > +            }),
> > +        }
> > +    }
> > +
> > +    /// Creates a [`Class`].
> > +    ///
> > +    /// You should not use this function directly. Use the
> > [`define_class!`]
> > +    /// macro or call [`Class::new_wait_die`] or
> > [`Class::new_wound_wait`] instead.
> > +    fn new(name: &'static CStr, is_wait_die: bool) -> impl
> > PinInit<Self> {
> > +        pin_init! {
> > +            Self {
> > +                inner <- Opaque::ffi_init(|slot: *mut
> > bindings::ww_class| {
> > +                    // SAFETY: The fields are being initialized.
> > The `name` pointer is valid for a
> > +                    // static lifetime. The keys are zeroed, which
> > is what the C side does.
> > +                    unsafe {
> > +                        slot.write(bindings::ww_class {
> > +                            stamp: bindings::atomic_long_t {
> > counter: 0 },
> > +                            acquire_name: name.as_char_ptr(),
> > +                            mutex_name: name.as_char_ptr(),
> > +                            is_wait_die: is_wait_die.into(),
> > +                            // TODO: Replace with
> > `bindings::lock_class_key::default()` once
> > +                            // stabilized for `const`.
> > +                            //
> > +                            // SAFETY: This is always
> > zero-initialized when defined with
> > +                            // `DEFINE_WD_CLASS` globally on C
> > side.
> > +                            //
> > +                            // For reference, see
> > __WW_CLASS_INITIALIZER() in
> > +                            // "include/linux/ww_mutex.h".
> > +                            acquire_key: core::mem::zeroed(),
> > +                            mutex_key: core::mem::zeroed(),
> > +                        });
> > +                    }
> > +                }),
> > +            }
> > +        }
> > +    }
> > +
> > +    /// Creates wait-die [`Class`].
> > +    pub fn new_wait_die(name: &'static CStr) -> impl PinInit<Self>
> > {
> > +        Self::new(name, true)
> > +    }
> > +
> > +    /// Creates wound-wait [`Class`].
> > +    pub fn new_wound_wait(name: &'static CStr) -> impl
> > PinInit<Self> {
> > +        Self::new(name, false)
> > +    }
> > +
> > +    /// Creates a [`Class`] from a raw pointer.
> > +    ///
> > +    /// This function is intended for interoperability with C code.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The caller must ensure that `ptr` points to the `inner`
> > field of
> > +    /// [`Class`] and that it remains valid for the lifetime `'a`.
> > +    pub const unsafe fn from_raw<'a>(ptr: *mut bindings::ww_class)
> > -> &'a Self {
> > +        // SAFETY: By the safety contract, `ptr` is valid to
> > construct `Class`.
> > +        unsafe { &*ptr.cast() }
> > +    }
> > +}
> > --=20
> > 2.51.2
> >=20
> >=20
>=20

Regards,
Onur
