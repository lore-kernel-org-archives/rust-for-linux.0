Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891020F98E;
	Thu, 23 Jan 2025 16:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649931; cv=pass; b=YbLKOjXN9qiaSQ1s0tbqgY/ZY4WmjtFltN7aeM+xJ05dp9HV7S7lTS/HkoSRQarpgStHluuR8BeTJA+DdsRfuGbeP8Er1QYLKGsudNSbjoP4d9YAMxrn7l4CMaaWOv/cS9xGs+lgJHRktclGFlnAwhouN2I8tAHItRIBSvcIle0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649931; c=relaxed/simple;
	bh=KuDghvagfFvD63CVCU9ta4TGk+POtEYueIytfqmlf+I=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cxNVS5tK3OYMTtaM60Ifa57nFksvcNdFyres5FRO/lh70EGdRt46JR7r3xigu0lnAdpmVSDfTr8xgqVUn+mQ9CtsQhZnU/eZOM0d/8gqS2/e/d6YdP3mMZEFmlHcbomS6wh0Kx769GaJso5ssLsrLYuDDvtIW3WfmdGVJT/JRi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=lPZ/rIpw; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="lPZ/rIpw"
ARC-Seal: i=1; a=rsa-sha256; t=1737649677; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mki5fo9CNErol/uqCzwVQqZGj0IzXu92FRjAuE2oJz+w2yCzc+fIcjq1I7C1QYs9MMfOpNlorxwQds8RxjtXuuwZLbztWOSEp17oO3wTfz82XN5ekQ+DzbX7kYUKyNrxDPW18ZM8kcfQFAX2iYQ5zn5nbyHHwY4mPNsyGEw4w0o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737649677; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EzwMl4X2em095oNSbEhkeFkbEvTCXx72ihiAI+alh6g=; 
	b=hlm5X2XGcEQOQ6v6zLasCLHXss0YgnD/BbB4q35fB2RR7QioVjG/8pCFocJQ/jnfb2egwx+WF0WGRmDDgjFxEWs58Fx5boxZexGvdU8dY53L44M+G21Sjx7EwPsJB7phUjfpXSnKTHE/cOicL6qChDEvUmfU6YBRnXiduS0odfs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737649677;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=EzwMl4X2em095oNSbEhkeFkbEvTCXx72ihiAI+alh6g=;
	b=lPZ/rIpwO4aG5/nyvRFQhGjvS+j6wIWt3w/BqZZGDVOrgnPEfzO3fbCtdfTUjDsg
	j9ejl6KIpS1wZ5W4vkH1eVhiEyWMbOpwPkWviglg5HBy5Wsa1IhRwYcmKKn2+sRHnXh
	0MFsbVw+2QJz5+of6EcFTnRlZDY8fTE2zB2cjH5s=
Received: by mx.zohomail.com with SMTPS id 1737649671278678.7659034645515;
	Thu, 23 Jan 2025 08:27:51 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <8a2bac6e-1989-41d8-a5f6-3bb518a9f139@gmail.com>
Date: Thu, 23 Jan 2025 13:27:35 -0300
Cc: ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 benno.lossin@proton.me,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <30401DE8-53DA-4CF3-9D97-1511015BCD4D@collabora.com>
References: <20250122163932.46697-1-daniel.almeida@collabora.com>
 <8a2bac6e-1989-41d8-a5f6-3bb518a9f139@gmail.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-ZohoMailClient: External

Hi Christian,

> On 23 Jan 2025, at 13:00, Christian Schrefl <chrisi.schrefl@gmail.com> =
wrote:
>=20
> On 22.01.25 5:39 PM, Daniel Almeida wrote:
>> Add support for registering IRQ handlers in Rust.
>>=20
>> IRQ handlers are extensively used in drivers when some peripheral =
wants to
>> obtain the CPU attention. Registering a handler will make the system =
invoke the
>> passed-in function whenever the chosen IRQ line is triggered.
>>=20
>> Both regular and threaded IRQ handlers are supported through a =
Handler (or
>> ThreadedHandler) trait that is meant to be implemented by a type =
that:
>>=20
>> a) provides a function to be run by the system when the IRQ fires =
and,
>>=20
>> b) holds the shared data (i.e.: `T`) between process and IRQ =
contexts.
>>=20
>> The requirement that T is Sync derives from the fact that handlers =
might run
>> concurrently with other processes executing the same driver, creating =
the
>> potential for data races.
>>=20
>> Ideally, some interior mutability must be in place if T is to be =
mutated. This
>> should usually be done through the in-flight SpinLockIrq type.
>>=20
>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>=20
> It would be nice it you included a second patch that adds the ability =
to get
> the irq number from a platform device, it should be pretty simple.
> Of course this can also just be done separately.

Sure!

>=20
> Otherwise this looks pretty good, a few small comments below.
>=20
>> ---
>>=20
>> Changes from v1:
>>=20
>> - Added Co-developed-by tag to account for the work that Alice did in =
order to
>> figure out how to do this without Opaque<T> (Thanks!)
>> - Removed Opaque<T> in favor of plain T
>> - Fixed the examples
>> - Made sure that the invariants sections are the last entry in the =
docs
>> - Switched to slot.cast() where applicable,
>> - Mentioned in the safety comments that we require that T: Sync,
>> - Removed ThreadedFnReturn in favor of IrqReturn,
>> - Improved the commit message
>>=20
>> Link to v1: =
https://lore.kernel.org/rust-for-linux/20241024-topic-panthor-rs-request_i=
rq-v1-1-7cbc51c182ca@collabora.com/
>>=20
>>=20
>> ---
>> rust/bindings/bindings_helper.h |   1 +
>> rust/helpers/helpers.c          |   1 +
>> rust/helpers/irq.c              |   9 +
>> rust/kernel/irq.rs              |   6 +
>> rust/kernel/irq/request.rs      | 517 =
++++++++++++++++++++++++++++++++
>> rust/kernel/lib.rs              |   1 +
>> 6 files changed, 535 insertions(+)
>> create mode 100644 rust/helpers/irq.c
>> create mode 100644 rust/kernel/irq.rs
>> create mode 100644 rust/kernel/irq/request.rs
>>=20
>> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
>> index 5c4dfe22f41a..0331c6273def 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -15,6 +15,7 @@
>> #include <linux/ethtool.h>
>> #include <linux/file.h>
>> #include <linux/firmware.h>
>> +#include <linux/interrupt.h>
>> #include <linux/fs.h>
>> #include <linux/jiffies.h>
>> #include <linux/jump_label.h>
>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>> index dcf827a61b52..bfc499d7f4c1 100644
>> --- a/rust/helpers/helpers.c
>> +++ b/rust/helpers/helpers.c
>> @@ -13,6 +13,7 @@
>> #include "build_bug.c"
>> #include "cred.c"
>> #include "err.c"
>> +#include "irq.c"
>> #include "fs.c"
>> #include "jump_label.c"
>> #include "kunit.c"
>> diff --git a/rust/helpers/irq.c b/rust/helpers/irq.c
>> new file mode 100644
>> index 000000000000..1faca428e2c0
>> --- /dev/null
>> +++ b/rust/helpers/irq.c
>> @@ -0,0 +1,9 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +#include <linux/interrupt.h>
>> +
>> +int rust_helper_request_irq(unsigned int irq, irq_handler_t handler,
>> +     unsigned long flags, const char *name, void *dev)
>> +{
>> + return request_irq(irq, handler, flags, name, dev);
>> +}
>> diff --git a/rust/kernel/irq.rs b/rust/kernel/irq.rs
>> new file mode 100644
>> index 000000000000..3ab83c5bdb83
>> --- /dev/null
>> +++ b/rust/kernel/irq.rs
>> @@ -0,0 +1,6 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! IRQ abstractions
>> +
>> +/// IRQ allocation and handling
>> +pub mod request;
>> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
>> new file mode 100644
>> index 000000000000..61e7d4a8f555
>> --- /dev/null
>> +++ b/rust/kernel/irq/request.rs
>> @@ -0,0 +1,517 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
>> +
>> +//! IRQ allocation and handling
>> +
>> +use core::marker::PhantomPinned;
>> +use core::ptr::addr_of_mut;
>> +
>> +use init::pin_init_from_closure;
>> +
>> +use crate::error::to_result;
>> +use crate::prelude::*;
>> +use crate::str::CStr;
>> +
>> +/// Flags to be used when registering IRQ handlers.
>> +///
>> +/// They can be combined with the operators `|`, `&`, and `!`.
>> +///
>> +/// Values can be used from the [`flags`] module.
>> +#[derive(Clone, Copy)]
>> +pub struct Flags(u64);
>> +
>> +impl core::ops::BitOr for Flags {
>> +    type Output =3D Self;
>> +    fn bitor(self, rhs: Self) -> Self::Output {
>> +        Self(self.0 | rhs.0)
>> +    }
>> +}
>> +
>> +impl core::ops::BitAnd for Flags {
>> +    type Output =3D Self;
>> +    fn bitand(self, rhs: Self) -> Self::Output {
>> +        Self(self.0 & rhs.0)
>> +    }
>> +}
>> +
>> +impl core::ops::Not for Flags {
>> +    type Output =3D Self;
>> +    fn not(self) -> Self::Output {
>> +        Self(!self.0)
>> +    }
>> +}
>> +
>> +/// The flags that can be used when registering an IRQ handler.
>> +pub mod flags {
>=20
> Maybe move flags into a separate file?
> You even have a directory for irq.

Why? Most flags are defined in the same file. See alloc::flags, for =
example.

I am not against this, but since this is merely aesthetic in nature, we =
should maybe
wait for input from more people.=20

>=20
>> +    use super::Flags;
>> +
>> +    use crate::bindings;
>> +
>> +    /// Use the interrupt line as already configured.
>> +    pub const TRIGGER_NONE: Flags =3D =
Flags(bindings::IRQF_TRIGGER_NONE as _);
>> +
>> +    /// The interrupt is triggered when the signal goes from low to =
high.
>> +    pub const TRIGGER_RISING: Flags =3D =
Flags(bindings::IRQF_TRIGGER_RISING as _);
>> +
>> +    /// The interrupt is triggered when the signal goes from high to =
low.
>> +    pub const TRIGGER_FALLING: Flags =3D =
Flags(bindings::IRQF_TRIGGER_FALLING as _);
>> +
>> +    /// The interrupt is triggered while the signal is held high.
>> +    pub const TRIGGER_HIGH: Flags =3D =
Flags(bindings::IRQF_TRIGGER_HIGH as _);
>> +
>> +    /// The interrupt is triggered while the signal is held low.
>> +    pub const TRIGGER_LOW: Flags =3D =
Flags(bindings::IRQF_TRIGGER_LOW as _);
>> +
>> +    /// Allow sharing the irq among several devices.
>> +    pub const SHARED: Flags =3D Flags(bindings::IRQF_SHARED as _);
>> +
>> +    /// Set by callers when they expect sharing mismatches to occur.
>> +    pub const PROBE_SHARED: Flags =3D =
Flags(bindings::IRQF_PROBE_SHARED as _);
>> +
>> +    /// Flag to mark this interrupt as timer interrupt.
>> +    pub const TIMER: Flags =3D Flags(bindings::IRQF_TIMER as _);
>> +
>> +    /// Interrupt is per cpu.
>> +    pub const PERCPU: Flags =3D Flags(bindings::IRQF_PERCPU as _);
>> +
>> +    /// Flag to exclude this interrupt from irq balancing.
>> +    pub const NOBALANCING: Flags =3D =
Flags(bindings::IRQF_NOBALANCING as _);
>> +
>> +    /// Interrupt is used for polling (only the interrupt that is =
registered
>> +    /// first in a shared interrupt is considered for performance =
reasons).
>> +    pub const IRQPOLL: Flags =3D Flags(bindings::IRQF_IRQPOLL as _);
>> +
>> +    /// Interrupt is not reenabled after the hardirq handler =
finished. Used by
>> +    /// threaded interrupts which need to keep the irq line disabled =
until the
>> +    /// threaded handler has been run.
>> +    pub const ONESHOT: Flags =3D Flags(bindings::IRQF_ONESHOT as _);
>> +
>> +    /// Do not disable this IRQ during suspend. Does not guarantee =
that this
>> +    /// interrupt will wake the system from a suspended state.
>> +    pub const NO_SUSPEND: Flags =3D Flags(bindings::IRQF_NO_SUSPEND =
as _);
>> +
>> +    /// Force enable it on resume even if [`NO_SUSPEND`] is set.
>> +    pub const FORCE_RESUME: Flags =3D =
Flags(bindings::IRQF_FORCE_RESUME as _);
>> +
>> +    /// Interrupt cannot be threaded.
>> +    pub const NO_THREAD: Flags =3D Flags(bindings::IRQF_NO_THREAD as =
_);
>> +
>> +    /// Resume IRQ early during syscore instead of at device resume =
time.
>> +    pub const EARLY_RESUME: Flags =3D =
Flags(bindings::IRQF_EARLY_RESUME as _);
>> +
>> +    /// If the IRQ is shared with a NO_SUSPEND user, execute this =
interrupt
>> +    /// handler after suspending interrupts. For system wakeup =
devices users
>> +    /// need to implement wakeup detection in their interrupt =
handlers.
>> +    pub const COND_SUSPEND: Flags =3D =
Flags(bindings::IRQF_COND_SUSPEND as _);
>> +
>> +    /// Don't enable IRQ or NMI automatically when users request it. =
Users will
>> +    /// enable it explicitly by `enable_irq` or `enable_nmi` later.
>> +    pub const NO_AUTOEN: Flags =3D Flags(bindings::IRQF_NO_AUTOEN as =
_);
>> +
>> +    /// Exclude from runnaway detection for IPI and similar =
handlers, depends on
>> +    /// `PERCPU`.
>> +    pub const NO_DEBUG: Flags =3D Flags(bindings::IRQF_NO_DEBUG as =
_);
>> +}
>> +
>> +/// The value that can be returned from an IrqHandler or a =
ThreadedIrqHandler.
>> +pub enum IrqReturn {
>> +    /// The interrupt was not from this device or was not handled.
>> +    None =3D bindings::irqreturn_IRQ_NONE as _,
>> +
>> +    /// The interrupt was handled by this device.
>> +    Handled =3D bindings::irqreturn_IRQ_HANDLED as _,
>> +}
>> +
>> +/// Callbacks for an IRQ handler.
>> +pub trait Handler: Sync {
>> +    /// The actual handler function. As usual, sleeps are not =
allowed in IRQ
>> +    /// context.
>> +    fn handle_irq(&self) -> IrqReturn;
>> +}
>> +
>> +/// A registration of an IRQ handler for a given IRQ line.
>> +///
>> +/// # Examples
>> +///
>> +/// The following is an example of using `Registration`:
>> +///
>> +/// ```
>> +/// use kernel::prelude::*;
>> +/// use kernel::irq::request::flags;
>> +/// use kernel::irq::request::Registration;
>> +/// use kernel::irq::request::IrqReturn;
>> +/// use kernel::sync::Arc;
>> +/// use kernel::sync::SpinLock;
>> +/// use kernel::c_str;
>> +/// use kernel::alloc::flags::GFP_KERNEL;
>> +///
>> +/// // Declare a struct that will be passed in when the interrupt =
fires. The u32
>> +/// // merely serves as an example of some internal data.
>> +/// struct Data(SpinLock<u32>);
>> +///
>> +/// // [`handle_irq`] takes &self. This example illustrates interior
>> +/// // mutability can be used when share the data between process =
context and IRQ
>> +/// // context.
>> +/// //
>> +/// // Ideally, this example would be using a version of SpinLock =
that is aware
>> +/// // of `spin_lock_irqsave` and `spin_lock_irqrestore`, but that =
is not yet
>> +/// // implemented.
>> +///
>> +/// type Handler =3D Data;
>> +///
>> +/// impl kernel::irq::request::Handler for Handler {
>> +///     // This is executing in IRQ context in some CPU. Other CPUs =
can still
>> +///     // try to access to data.
>> +///     fn handle_irq(&self) -> IrqReturn {
>> +///         // We now have exclusive access to the data by locking =
the SpinLock.
>> +///         let mut data =3D self.0.lock();
>> +///         *data +=3D 1;
>> +///
>> +///         IrqReturn::Handled
>> +///     }
>> +/// }
>> +///
>> +/// // This is running in process context.
>> +/// fn register_irq(irq: u32, handler: Handler) -> =
Result<Arc<Registration<Handler>>> {
>> +///     let registration =3D Registration::register(irq, =
flags::SHARED, c_str!("my-device"), handler);
>> +///
>> +///     // You can have as many references to the registration as =
you want, so
>> +///     // multiple parts of the driver can access it.
>> +///     let registration =3D Arc::pin_init(registration, =
GFP_KERNEL)?;
>> +///
>> +///     // The handler may be called immediately after the function =
above
>> +///     // returns, possibly in a different CPU.
>> +///
>> +///     {
>> +///         // The data can be accessed from the process context =
too.
>> +///         let mut data =3D registration.handler().0.lock();
>> +///         *data =3D 42;
>> +///     }
>> +///
>> +///     Ok(registration)
>> +/// }
>> +///
>> +/// # Ok::<(), Error>(())
>> +///```
>> +///
>> +/// # Invariants
>> +///
>> +/// * We own an irq handler using `&self` as its private data.
>> +///
>> +#[pin_data(PinnedDrop)]
>> +pub struct Registration<T: Handler> {
>> +    irq: u32,
>> +    #[pin]
>> +    handler: T,
>> +    #[pin]
>> +    /// Pinned because we need address stability so that we can pass =
a pointer
>> +    /// to the callback.
>> +    _pin: PhantomPinned,
>> +}
>> +
>> +impl<T: Handler> Registration<T> {
>> +    /// Registers the IRQ handler with the system for the given IRQ =
number. The
>> +    /// handler must be able to be called as soon as this function =
returns.
>> +    pub fn register(
>> +        irq: u32,
>> +        flags: Flags,
>> +        name: &'static CStr,
>> +        handler: T,
>> +    ) -> impl PinInit<Self, Error> {
>> +        let closure =3D move |slot: *mut Self| {
>> +            // SAFETY: The slot passed to pin initializer is valid =
for writing.
>> +            unsafe {
>> +                slot.write(Self {
>> +                    irq,
>> +                    handler,
>> +                    _pin: PhantomPinned,
>> +                })
>> +            };
>> +
>> +            // SAFETY:
>> +            // - The callbacks are valid for use with request_irq.
>> +            // - If this succeeds, the slot is guaranteed to be =
valid until the
>> +            // destructor of Self runs, which will deregister the =
callbacks
>> +            // before the memory location becomes invalid.
>> +            let res =3D to_result(unsafe {
>> +                bindings::request_irq(
>> +                    irq,
>> +                    Some(handle_irq_callback::<T>),
>> +                    flags.0,
>> +                    name.as_char_ptr(),
>> +                    &*slot as *const _ as *mut core::ffi::c_void,
>> +                )
>> +            });
>> +
>> +            if res.is_err() {
>> +                // SAFETY: We are returning an error, so we can =
destroy the slot.
>> +                unsafe { =
core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
>> +            }
>> +
>> +            res
>> +        };
>> +
>> +        // SAFETY:
>> +        // - if this returns Ok, then every field of `slot` is fully
>> +        // initialized.
>> +        // - if this returns an error, then the slot does not need =
to remain
>> +        // valid.
>> +        unsafe { pin_init_from_closure(closure) }
>> +    }
>> +
>> +    /// Returns a reference to the handler that was registered with =
the system.
>> +    pub fn handler(&self) -> &T {
>> +        // SAFETY: `handler` is initialized in `register`, and we =
require that
>> +        // T: Sync.
>> +        &self.handler
>> +    }
>> +}
>> +
>> +#[pinned_drop]
>> +impl<T: Handler> PinnedDrop for Registration<T> {
>> +    fn drop(self: Pin<&mut Self>) {
>> +        // SAFETY:
>> +        // - `self.irq` is the same as the one passed to =
`reques_irq`.
>> +        // -  `&self` was passed to `request_irq` as the cookie. It =
is
>> +        // guaranteed to be unique by the type system, since each =
call to
>> +        // `register` will return a different instance of =
`Registration`.
>> +        //
>> +        // Notice that this will block until all handlers finish =
executing,
>> +        // i.e.: at no point will &self be invalid while the handler =
is running.
>> +        unsafe { bindings::free_irq(self.irq, &*self as *const Self =
as *mut core::ffi::c_void) };
>> +    }
>> +}
>> +
>> +/// The value that can be returned from =
`ThreadedHandler::handle_irq`.
>> +pub enum ThreadedIrqReturn {
>> +    /// The interrupt was not from this device or was not handled.
>> +    None =3D bindings::irqreturn_IRQ_NONE as _,
>> +
>> +    /// The interrupt was handled by this device.
>> +    Handled =3D bindings::irqreturn_IRQ_HANDLED as _,
>> +
>> +    /// The handler wants the handler thread to wake up.
>> +    WakeThread =3D bindings::irqreturn_IRQ_WAKE_THREAD as _,
>> +}
>> +
>> +/// Callbacks for a threaded IRQ handler.
>> +pub trait ThreadedHandler: Sync {
>> +    /// The actual handler function. As usual, sleeps are not =
allowed in IRQ
>> +    /// context.
>> +    fn handle_irq(&self) -> ThreadedIrqReturn;
>> +
>> +    /// The threaded handler function. This function is called from =
the irq
>> +    /// handler thread, which is automatically created by the =
system.
>> +    fn thread_fn(&self) -> IrqReturn;
>> +}
>> +
>> +/// A registration of a threaded IRQ handler for a given IRQ line.
>> +///
>> +/// Two callbacks are required: one to handle the IRQ, and one to =
handle any
>> +/// other work in a separate thread.
>> +///
>> +/// The thread handler is only called if the IRQ handler returns =
`WakeThread`.
>> +///
>> +/// # Examples
>> +///
>> +/// The following is an example of using `ThreadedRegistration`:
>> +///
>> +/// ```
>> +/// use kernel::prelude::*;
>> +/// use kernel::irq::request::flags;
>> +/// use kernel::irq::request::ThreadedIrqReturn;
>> +/// use kernel::irq::request::ThreadedRegistration;
>> +/// use kernel::irq::request::IrqReturn;
>> +/// use kernel::sync::Arc;
>> +/// use kernel::sync::SpinLock;
>> +/// use kernel::alloc::flags::GFP_KERNEL;
>> +/// use kernel::c_str;
>> +///
>> +/// // Declare a struct that will be passed in when the interrupt =
fires. The u32
>> +/// // merely serves as an example of some internal data.
>> +/// struct Data(SpinLock<u32>);
>> +///
>> +/// // [`handle_irq`] takes &self. This example illustrates interior
>> +/// // mutability can be used when share the data between process =
context and IRQ
>> +/// // context.
>> +/// //
>> +/// // Ideally, this example would be using a version of SpinLock =
that is aware
>> +/// // of `spin_lock_irqsave` and `spin_lock_irqrestore`, but that =
is not yet
>> +/// // implemented.
>> +///
>> +/// type Handler =3D Data;
>> +///
>> +/// impl kernel::irq::request::ThreadedHandler for Handler {
>> +///     // This is executing in IRQ context in some CPU. Other CPUs =
can still
>> +///     // try to access to data.
>> +///     fn handle_irq(&self) -> ThreadedIrqReturn {
>> +///         // We now have exclusive access to the data by locking =
the SpinLock.
>> +///         let mut data =3D self.0.lock();
>> +///         *data +=3D 1;
>> +///
>> +///         // By returning `WakeThread`, we indicate to the system =
that the
>> +///         // thread function should be called. Otherwise, return
>> +///         // ThreadedIrqReturn::Handled.
>> +///         ThreadedIrqReturn::WakeThread
>> +///     }
>> +///
>> +///     // This will run (in a separate kthread) iff `handle_irq` =
returns
> typo iff

I mean the acronym for =E2=80=9Cif and only if=E2=80=9D.

>> +///     // `WakeThread`.
>> +///     fn thread_fn(&self) -> IrqReturn {
>> +///         // We now have exclusive access to the data by locking =
the SpinLock.
>> +///         let mut data =3D self.0.lock();
>> +///         *data +=3D 1;
>> +///
>> +///         IrqReturn::Handled
>> +///     }
>> +/// }
>> +///
>> +/// // This is running in process context.
>> +/// fn register_threaded_irq(irq: u32, handler: Handler) -> =
Result<Arc<ThreadedRegistration<Handler>>> {
>> +///     let registration =3D ThreadedRegistration::register(irq, =
flags::SHARED, c_str!("my-device"), handler);
>> +///
>> +///     // You can have as many references to the registration as =
you want, so
>> +///     // multiple parts of the driver can access it.
>> +///     let registration =3D Arc::pin_init(registration, =
GFP_KERNEL)?;
> You can use Arc::new instead, since you don't need pin_init.

Register returns `impl PinInit`, my understanding is that this has to be =
passed to the corresponding
`pin_init` function for types that implement the pin init trait?

>> +///
>> +///     // The handler may be called immediately after the function =
above
>> +///     // returns, possibly in a different CPU.
>> +///
>> +///     {
>> +///         // The data can be accessed from the process context =
too.
>> +///         let mut data =3D registration.handler().0.lock();
>> +///         *data =3D 42;
>> +///     }
>> +///
>> +///     Ok(registration)
>> +/// }
>> +///
>> +///
>> +/// # Ok::<(), Error>(())
>> +///```
>> +///
>> +/// # Invariants
>> +///
>> +/// * We own an irq handler using `&self` as its private data.
>> +///
>> +#[pin_data(PinnedDrop)]
>> +pub struct ThreadedRegistration<T: ThreadedHandler> {
>> +    irq: u32,
>> +    #[pin]
>> +    handler: T,
>> +    #[pin]
>> +    /// Pinned because we need address stability so that we can pass =
a pointer
>> +    /// to the callback.
>> +    _pin: PhantomPinned,
>> +}
>> +
>> +impl<T: ThreadedHandler> ThreadedRegistration<T> {
>> +    /// Registers the IRQ handler with the system for the given IRQ =
number. The
>> +    /// handler must be able to be called as soon as this function =
returns.
>> +    pub fn register(
>> +        irq: u32,
>> +        flags: Flags,
>> +        name: &'static CStr,
>> +        handler: T,
>> +    ) -> impl PinInit<Self, Error> {
>> +        let closure =3D move |slot: *mut Self| {
>> +            // SAFETY: The slot passed to pin initializer is valid =
for writing.
>> +            unsafe {
>> +                slot.write(Self {
>> +                    irq,
>> +                    handler,
>> +                    _pin: PhantomPinned,
>> +                })
>> +            };
>> +
>> +            // SAFETY:
>> +            // - The callbacks are valid for use with =
request_threaded_irq.
>> +            // - If this succeeds, the slot is guaranteed to be =
valid until the
>> +            // destructor of Self runs, which will deregister the =
callbacks
>> +            // before the memory location becomes invalid.
>> +            let res =3D to_result(unsafe {
>> +                bindings::request_threaded_irq(
>> +                    irq,
>> +                    Some(handle_threaded_irq_callback::<T>),
>> +                    Some(thread_fn_callback::<T>),
>> +                    flags.0,
>> +                    name.as_char_ptr(),
>> +                    slot.cast(),
>> +                )
>> +            });
>> +
>> +            if res.is_err() {
>> +                // SAFETY: We are returning an error, so we can =
destroy the slot.
>> +                unsafe { =
core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
>> +            }
>> +
>> +            res
>> +        };
>> +
>> +        // SAFETY:
>> +        // - if this returns Ok(()), then every field of `slot` is =
fully
>> +        // initialized.
>> +        // - if this returns an error, then the slot does not need =
to remain
>> +        // valid.
>> +        unsafe { pin_init_from_closure(closure) }
>> +    }
>> +
>> +    /// Returns a reference to the handler that was registered with =
the system.
>> +    pub fn handler(&self) -> &T {
>> +        // SAFETY: `handler` is initialized in `register`, and we =
require that
>> +        // T: Sync.
>> +        &self.handler
>> +    }
>> +}
>> +
>> +#[pinned_drop]
>> +impl<T: ThreadedHandler> PinnedDrop for ThreadedRegistration<T> {
>> +    fn drop(self: Pin<&mut Self>) {
>> +        // SAFETY:
>> +        // - `self.irq` is the same as the one passed to =
`request_threaded_irq`.
>> +        // -  `&self` was passed to `request_threaded_irq` as the =
cookie. It is
>> +        // guaranteed to be unique by the type system, since each =
call to
>> +        // `register` will return a different instance of
>> +        // `ThreadedRegistration`.
>> +        //
>> +        // Notice that this will block until all handlers finish =
executing, so,
>> +        // at no point will &self be invalid while the handler is =
running.
>> +        unsafe { bindings::free_irq(self.irq, &*self as *const Self =
as *mut core::ffi::c_void) };
>> +    }
>> +}
>> +
>> +/// # Safety
>> +///
>> +/// This function should be only used as the callback in =
`request_irq`.
>> +unsafe extern "C" fn handle_irq_callback<T: Handler>(
>> +    _irq: i32,
>> +    ptr: *mut core::ffi::c_void,
>> +) -> core::ffi::c_uint {
>> +    // SAFETY: `ptr` is a poinhandle_threaded_irq_callbackter to T =
set in `Registration::new`
>> +    let data =3D unsafe { &*(ptr as *const T) };
>> +    T::handle_irq(data) as _
>> +
>=20
> Can `handle_irq_callback` and `handle_threaded_irq_callback` be shared =
somehow?

Why? In the quest to save a few lines we might introduce bugs.

>=20
> Otherwise maybe define them locally in the calling function, since =
nothing else
> should ever use them, so we might as well restrict their scope.

I am not against this, but they=E2=80=99re private anyways, their scope =
is already restricted
as a result of their visibility. This looks cleaner too.

>=20
>> +
>> +/// # Safety
>> +///
>> +/// This function should be only used as the callback in =
`request_threaded_irq`.
>> +unsafe extern "C" fn handle_threaded_irq_callback<T: =
ThreadedHandler>(
>> +    _irq: i32,
>> +    ptr: *mut core::ffi::c_void,
>> +) -> core::ffi::c_uint {
>> +    // SAFETY: `ptr` is a pointer to T set in =
`ThreadedRegistration::new`
>> +    let data =3D unsafe { &*(ptr as *const T) };
>> +    T::handle_irq(data) as _
>> +}
>> +
>> +/// # Safety
>> +///
>> +/// This function should be only used as the callback in =
`request_threaded_irq`.
>> +unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(
>> +    _irq: i32,
>> +    ptr: *mut core::ffi::c_void,
>> +) -> core::ffi::c_uint {
>> +    // SAFETY: `ptr` is a pointer to T set in =
`ThreadedRegistration::new`
>> +    let data =3D unsafe { &*(ptr as *const T) };
>> +    T::thread_fn(data) as _
>> +}
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index e1065a7551a3..bba782e138c5 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -41,6 +41,7 @@
>> pub mod fs;
>> pub mod init;
>> pub mod ioctl;
>> +pub mod irq;
>> pub mod jump_label;
>> #[cfg(CONFIG_KUNIT)]
>> pub mod kunit;


