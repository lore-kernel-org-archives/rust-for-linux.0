Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D666135950;
	Thu, 23 Jan 2025 16:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737648016; cv=none; b=N9mf08MBj4u8Vua5mmKvsU0a2qRfd8C4Gv3PF0Y2sPgPcOd5EWfSRqXcWomH/sV3OeW89IgvaP0JVuecFkOYu1rZqFWHQFNwZdCQ9Zytwxrpf/Cjj2/vrCIPoezXb/uZGMrwaHcNEcoek4ygFZRwawRhchLwYGRP8TCptsOSkXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737648016; c=relaxed/simple;
	bh=ilVO+eLgnH1HXpNHlu5Js9orudEww4dv9hG2pvdrzic=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sz0t72ZH2aIIM67F8HruK6VKzgY5FM7h26H8kt055IwVn/cqrshp9aD5LFCrQdvGu1ZwtcS1eZqEjLCuWwg31kPGRYCGuhBDU8Wz8avvA0ZIYWYmvuEDfqD9sRRHLht58YUq+Cs3z24xBxrcAVxDFdyjlFlHAovi+RoOfMD78IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5UlBqxb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5UlBqxb"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385eed29d17so602796f8f.0;
        Thu, 23 Jan 2025 08:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737648012; x=1738252812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gEIda5CW+IGUa1pNICbiRFIAl5pcyLiFFcWG9iJhQlI=;
        b=j5UlBqxbklok1RbXZYb2h/sK6Xe91rD9rBHFJxbZZc3jS+dUkf5fnGaqD7u2mz3HrJ
         mf59/YimbRsMsCXuUzosWMEj/LvwS3EHahnVhojcBiDRTIRqCrVPLl38YzVA+m4T3rgk
         O5eUnRW1gzb3ziVFuGrWTPGOxzpTrcqgIskVnn4gL+0Lnh0f+VGTnfHfiYwqgcC7pElN
         mWWVgqGEj9H4v8uAr3piJXViR91DURdpoq8WvuRG4ushgL2sv/aaUjAD8Z3/9cKNklMv
         0vP8mlI7wwszo5Fu9NTdzX/f4fU9uI/OsgIa0TRvniE2yBhSz0WVDvPP4wiOd4MKLrDU
         G9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737648012; x=1738252812;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gEIda5CW+IGUa1pNICbiRFIAl5pcyLiFFcWG9iJhQlI=;
        b=Z7IQ912VyYtl62SARaT5H7dDvyl1162PlUjJJugRLbS60cni92tXH95NH3BnTTrFKv
         MzbkRKRDaSgV5NEpoDRgf5oTQN6PuYhu+zRg+EQBljDX68x8S5EdND+881TLQXb/fZIj
         xm/6aT4BbUzhLhohXVsWQVfTuHb6gE9njZ4+z036CqebTGHZ3Zrg3WiCczNIE/r7GN45
         N7AMD4d4wl2Ov6DMkWy4Wl8XI3UQNmZQROwCxhnhL2hEpp8lUyvLa6/YunhLH5Tmon8t
         iwLLKKu8JdpeM/2/Im9p51nT0J+V9Ry0308R/MiS/6z2P34eqqTVkr3f4arE1+v3RbEJ
         ymOw==
X-Forwarded-Encrypted: i=1; AJvYcCWeW9QG9SPcapS6pXfQC9fglGw7jmnA2iMNqaYjv/hOTtLXGVE1AzY1sIriqHZND83XbnPl/OEf0Npo8ec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8RuZoMY7F1ghCkHPOwYKXAV2gzbR/w1ullWN2s/AbKwrZTcnL
	c6tdL7zuvxtaaCP6pMOE6F7/0T9AFwfhkj7B5BKcMsHxLLqQ2NN8
X-Gm-Gg: ASbGncvAnApe3rTr48pf/XRuhfWRWqq+oaBU2M05i4xwK1S0fmjl+2Ikt6G80CGbJ7x
	oAy/ZPVPvI3xqPd/EaCRNF1/RKfLC7gAgkzqnYhOsbP4jqIX0OPrZYnZRS0q8IQgJRnbVtB08Bx
	Tuj46urL3eydeKO0iZ8MRRkcNc2C479+x+DY6n1MZpKDCpLvnD4EX6Mcr23R2osM3JO+uABrWrz
	Dv9aDtEe7CHX9CBzzV+qXIjqY2nAfmgReN0E85xkpiuzTauP/mUalOBbiGQOHyA2G/fwupn9Td9
	uY5p/Jqc6AVukLk/0g==
X-Google-Smtp-Source: AGHT+IFjHYTCqn/dat5g6FFCcWZzt5DkbrysLnQ0tKN6aiwybbbZdY9tzTIl6LKcmhV7IoFnF3tc2A==
X-Received: by 2002:a5d:64e9:0:b0:386:2ebe:7ae2 with SMTP id ffacd0b85a97d-38bf57b8aa7mr24239271f8f.45.1737648011652;
        Thu, 23 Jan 2025 08:00:11 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a189283sm63234f8f.59.2025.01.23.08.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 08:00:11 -0800 (PST)
Message-ID: <8a2bac6e-1989-41d8-a5f6-3bb518a9f139@gmail.com>
Date: Thu, 23 Jan 2025 17:00:09 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
To: Daniel Almeida <daniel.almeida@collabora.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>
References: <20250122163932.46697-1-daniel.almeida@collabora.com>
Content-Language: en-US
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250122163932.46697-1-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.25 5:39 PM, Daniel Almeida wrote:
> Add support for registering IRQ handlers in Rust.
> 
> IRQ handlers are extensively used in drivers when some peripheral wants to
> obtain the CPU attention. Registering a handler will make the system invoke the
> passed-in function whenever the chosen IRQ line is triggered.
> 
> Both regular and threaded IRQ handlers are supported through a Handler (or
> ThreadedHandler) trait that is meant to be implemented by a type that:
> 
> a) provides a function to be run by the system when the IRQ fires and,
> 
> b) holds the shared data (i.e.: `T`) between process and IRQ contexts.
> 
> The requirement that T is Sync derives from the fact that handlers might run
> concurrently with other processes executing the same driver, creating the
> potential for data races.
> 
> Ideally, some interior mutability must be in place if T is to be mutated. This
> should usually be done through the in-flight SpinLockIrq type.
> 
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

It would be nice it you included a second patch that adds the ability to get
the irq number from a platform device, it should be pretty simple.
Of course this can also just be done separately.

Otherwise this looks pretty good, a few small comments below.

> ---
> 
> Changes from v1:
> 
> - Added Co-developed-by tag to account for the work that Alice did in order to
> figure out how to do this without Opaque<T> (Thanks!)
> - Removed Opaque<T> in favor of plain T
> - Fixed the examples
> - Made sure that the invariants sections are the last entry in the docs
> - Switched to slot.cast() where applicable,
> - Mentioned in the safety comments that we require that T: Sync,
> - Removed ThreadedFnReturn in favor of IrqReturn,
> - Improved the commit message
> 
> Link to v1: https://lore.kernel.org/rust-for-linux/20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com/
> 
> 
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/helpers/helpers.c          |   1 +
>  rust/helpers/irq.c              |   9 +
>  rust/kernel/irq.rs              |   6 +
>  rust/kernel/irq/request.rs      | 517 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   1 +
>  6 files changed, 535 insertions(+)
>  create mode 100644 rust/helpers/irq.c
>  create mode 100644 rust/kernel/irq.rs
>  create mode 100644 rust/kernel/irq/request.rs
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 5c4dfe22f41a..0331c6273def 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -15,6 +15,7 @@
>  #include <linux/ethtool.h>
>  #include <linux/file.h>
>  #include <linux/firmware.h>
> +#include <linux/interrupt.h>
>  #include <linux/fs.h>
>  #include <linux/jiffies.h>
>  #include <linux/jump_label.h>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index dcf827a61b52..bfc499d7f4c1 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -13,6 +13,7 @@
>  #include "build_bug.c"
>  #include "cred.c"
>  #include "err.c"
> +#include "irq.c"
>  #include "fs.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> diff --git a/rust/helpers/irq.c b/rust/helpers/irq.c
> new file mode 100644
> index 000000000000..1faca428e2c0
> --- /dev/null
> +++ b/rust/helpers/irq.c
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/interrupt.h>
> +
> +int rust_helper_request_irq(unsigned int irq, irq_handler_t handler,
> +			    unsigned long flags, const char *name, void *dev)
> +{
> +	return request_irq(irq, handler, flags, name, dev);
> +}
> diff --git a/rust/kernel/irq.rs b/rust/kernel/irq.rs
> new file mode 100644
> index 000000000000..3ab83c5bdb83
> --- /dev/null
> +++ b/rust/kernel/irq.rs
> @@ -0,0 +1,6 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! IRQ abstractions
> +
> +/// IRQ allocation and handling
> +pub mod request;
> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
> new file mode 100644
> index 000000000000..61e7d4a8f555
> --- /dev/null
> +++ b/rust/kernel/irq/request.rs
> @@ -0,0 +1,517 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
> +
> +//! IRQ allocation and handling
> +
> +use core::marker::PhantomPinned;
> +use core::ptr::addr_of_mut;
> +
> +use init::pin_init_from_closure;
> +
> +use crate::error::to_result;
> +use crate::prelude::*;
> +use crate::str::CStr;
> +
> +/// Flags to be used when registering IRQ handlers.
> +///
> +/// They can be combined with the operators `|`, `&`, and `!`.
> +///
> +/// Values can be used from the [`flags`] module.
> +#[derive(Clone, Copy)]
> +pub struct Flags(u64);
> +
> +impl core::ops::BitOr for Flags {
> +    type Output = Self;
> +    fn bitor(self, rhs: Self) -> Self::Output {
> +        Self(self.0 | rhs.0)
> +    }
> +}
> +
> +impl core::ops::BitAnd for Flags {
> +    type Output = Self;
> +    fn bitand(self, rhs: Self) -> Self::Output {
> +        Self(self.0 & rhs.0)
> +    }
> +}
> +
> +impl core::ops::Not for Flags {
> +    type Output = Self;
> +    fn not(self) -> Self::Output {
> +        Self(!self.0)
> +    }
> +}
> +
> +/// The flags that can be used when registering an IRQ handler.
> +pub mod flags {

Maybe move flags into a separate file?
You even have a directory for irq.

> +    use super::Flags;
> +
> +    use crate::bindings;
> +
> +    /// Use the interrupt line as already configured.
> +    pub const TRIGGER_NONE: Flags = Flags(bindings::IRQF_TRIGGER_NONE as _);
> +
> +    /// The interrupt is triggered when the signal goes from low to high.
> +    pub const TRIGGER_RISING: Flags = Flags(bindings::IRQF_TRIGGER_RISING as _);
> +
> +    /// The interrupt is triggered when the signal goes from high to low.
> +    pub const TRIGGER_FALLING: Flags = Flags(bindings::IRQF_TRIGGER_FALLING as _);
> +
> +    /// The interrupt is triggered while the signal is held high.
> +    pub const TRIGGER_HIGH: Flags = Flags(bindings::IRQF_TRIGGER_HIGH as _);
> +
> +    /// The interrupt is triggered while the signal is held low.
> +    pub const TRIGGER_LOW: Flags = Flags(bindings::IRQF_TRIGGER_LOW as _);
> +
> +    /// Allow sharing the irq among several devices.
> +    pub const SHARED: Flags = Flags(bindings::IRQF_SHARED as _);
> +
> +    /// Set by callers when they expect sharing mismatches to occur.
> +    pub const PROBE_SHARED: Flags = Flags(bindings::IRQF_PROBE_SHARED as _);
> +
> +    /// Flag to mark this interrupt as timer interrupt.
> +    pub const TIMER: Flags = Flags(bindings::IRQF_TIMER as _);
> +
> +    /// Interrupt is per cpu.
> +    pub const PERCPU: Flags = Flags(bindings::IRQF_PERCPU as _);
> +
> +    /// Flag to exclude this interrupt from irq balancing.
> +    pub const NOBALANCING: Flags = Flags(bindings::IRQF_NOBALANCING as _);
> +
> +    /// Interrupt is used for polling (only the interrupt that is registered
> +    /// first in a shared interrupt is considered for performance reasons).
> +    pub const IRQPOLL: Flags = Flags(bindings::IRQF_IRQPOLL as _);
> +
> +    /// Interrupt is not reenabled after the hardirq handler finished. Used by
> +    /// threaded interrupts which need to keep the irq line disabled until the
> +    /// threaded handler has been run.
> +    pub const ONESHOT: Flags = Flags(bindings::IRQF_ONESHOT as _);
> +
> +    /// Do not disable this IRQ during suspend. Does not guarantee that this
> +    /// interrupt will wake the system from a suspended state.
> +    pub const NO_SUSPEND: Flags = Flags(bindings::IRQF_NO_SUSPEND as _);
> +
> +    /// Force enable it on resume even if [`NO_SUSPEND`] is set.
> +    pub const FORCE_RESUME: Flags = Flags(bindings::IRQF_FORCE_RESUME as _);
> +
> +    /// Interrupt cannot be threaded.
> +    pub const NO_THREAD: Flags = Flags(bindings::IRQF_NO_THREAD as _);
> +
> +    /// Resume IRQ early during syscore instead of at device resume time.
> +    pub const EARLY_RESUME: Flags = Flags(bindings::IRQF_EARLY_RESUME as _);
> +
> +    /// If the IRQ is shared with a NO_SUSPEND user, execute this interrupt
> +    /// handler after suspending interrupts. For system wakeup devices users
> +    /// need to implement wakeup detection in their interrupt handlers.
> +    pub const COND_SUSPEND: Flags = Flags(bindings::IRQF_COND_SUSPEND as _);
> +
> +    /// Don't enable IRQ or NMI automatically when users request it. Users will
> +    /// enable it explicitly by `enable_irq` or `enable_nmi` later.
> +    pub const NO_AUTOEN: Flags = Flags(bindings::IRQF_NO_AUTOEN as _);
> +
> +    /// Exclude from runnaway detection for IPI and similar handlers, depends on
> +    /// `PERCPU`.
> +    pub const NO_DEBUG: Flags = Flags(bindings::IRQF_NO_DEBUG as _);
> +}
> +
> +/// The value that can be returned from an IrqHandler or a ThreadedIrqHandler.
> +pub enum IrqReturn {
> +    /// The interrupt was not from this device or was not handled.
> +    None = bindings::irqreturn_IRQ_NONE as _,
> +
> +    /// The interrupt was handled by this device.
> +    Handled = bindings::irqreturn_IRQ_HANDLED as _,
> +}
> +
> +/// Callbacks for an IRQ handler.
> +pub trait Handler: Sync {
> +    /// The actual handler function. As usual, sleeps are not allowed in IRQ
> +    /// context.
> +    fn handle_irq(&self) -> IrqReturn;
> +}
> +
> +/// A registration of an IRQ handler for a given IRQ line.
> +///
> +/// # Examples
> +///
> +/// The following is an example of using `Registration`:
> +///
> +/// ```
> +/// use kernel::prelude::*;
> +/// use kernel::irq::request::flags;
> +/// use kernel::irq::request::Registration;
> +/// use kernel::irq::request::IrqReturn;
> +/// use kernel::sync::Arc;
> +/// use kernel::sync::SpinLock;
> +/// use kernel::c_str;
> +/// use kernel::alloc::flags::GFP_KERNEL;
> +///
> +/// // Declare a struct that will be passed in when the interrupt fires. The u32
> +/// // merely serves as an example of some internal data.
> +/// struct Data(SpinLock<u32>);
> +///
> +/// // [`handle_irq`] takes &self. This example illustrates interior
> +/// // mutability can be used when share the data between process context and IRQ
> +/// // context.
> +/// //
> +/// // Ideally, this example would be using a version of SpinLock that is aware
> +/// // of `spin_lock_irqsave` and `spin_lock_irqrestore`, but that is not yet
> +/// // implemented.
> +///
> +/// type Handler = Data;
> +///
> +/// impl kernel::irq::request::Handler for Handler {
> +///     // This is executing in IRQ context in some CPU. Other CPUs can still
> +///     // try to access to data.
> +///     fn handle_irq(&self) -> IrqReturn {
> +///         // We now have exclusive access to the data by locking the SpinLock.
> +///         let mut data = self.0.lock();
> +///         *data += 1;
> +///
> +///         IrqReturn::Handled
> +///     }
> +/// }
> +///
> +/// // This is running in process context.
> +/// fn register_irq(irq: u32, handler: Handler) -> Result<Arc<Registration<Handler>>> {
> +///     let registration = Registration::register(irq, flags::SHARED, c_str!("my-device"), handler);
> +///
> +///     // You can have as many references to the registration as you want, so
> +///     // multiple parts of the driver can access it.
> +///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
> +///
> +///     // The handler may be called immediately after the function above
> +///     // returns, possibly in a different CPU.
> +///
> +///     {
> +///         // The data can be accessed from the process context too.
> +///         let mut data = registration.handler().0.lock();
> +///         *data = 42;
> +///     }
> +///
> +///     Ok(registration)
> +/// }
> +///
> +/// # Ok::<(), Error>(())
> +///```
> +///
> +/// # Invariants
> +///
> +/// * We own an irq handler using `&self` as its private data.
> +///
> +#[pin_data(PinnedDrop)]
> +pub struct Registration<T: Handler> {
> +    irq: u32,
> +    #[pin]
> +    handler: T,
> +    #[pin]
> +    /// Pinned because we need address stability so that we can pass a pointer
> +    /// to the callback.
> +    _pin: PhantomPinned,
> +}
> +
> +impl<T: Handler> Registration<T> {
> +    /// Registers the IRQ handler with the system for the given IRQ number. The
> +    /// handler must be able to be called as soon as this function returns.
> +    pub fn register(
> +        irq: u32,
> +        flags: Flags,
> +        name: &'static CStr,
> +        handler: T,
> +    ) -> impl PinInit<Self, Error> {
> +        let closure = move |slot: *mut Self| {
> +            // SAFETY: The slot passed to pin initializer is valid for writing.
> +            unsafe {
> +                slot.write(Self {
> +                    irq,
> +                    handler,
> +                    _pin: PhantomPinned,
> +                })
> +            };
> +
> +            // SAFETY:
> +            // - The callbacks are valid for use with request_irq.
> +            // - If this succeeds, the slot is guaranteed to be valid until the
> +            // destructor of Self runs, which will deregister the callbacks
> +            // before the memory location becomes invalid.
> +            let res = to_result(unsafe {
> +                bindings::request_irq(
> +                    irq,
> +                    Some(handle_irq_callback::<T>),
> +                    flags.0,
> +                    name.as_char_ptr(),
> +                    &*slot as *const _ as *mut core::ffi::c_void,
> +                )
> +            });
> +
> +            if res.is_err() {
> +                // SAFETY: We are returning an error, so we can destroy the slot.
> +                unsafe { core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
> +            }
> +
> +            res
> +        };
> +
> +        // SAFETY:
> +        // - if this returns Ok, then every field of `slot` is fully
> +        // initialized.
> +        // - if this returns an error, then the slot does not need to remain
> +        // valid.
> +        unsafe { pin_init_from_closure(closure) }
> +    }
> +
> +    /// Returns a reference to the handler that was registered with the system.
> +    pub fn handler(&self) -> &T {
> +        // SAFETY: `handler` is initialized in `register`, and we require that
> +        // T: Sync.
> +        &self.handler
> +    }
> +}
> +
> +#[pinned_drop]
> +impl<T: Handler> PinnedDrop for Registration<T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY:
> +        // - `self.irq` is the same as the one passed to `reques_irq`.
> +        // -  `&self` was passed to `request_irq` as the cookie. It is
> +        // guaranteed to be unique by the type system, since each call to
> +        // `register` will return a different instance of `Registration`.
> +        //
> +        // Notice that this will block until all handlers finish executing,
> +        // i.e.: at no point will &self be invalid while the handler is running.
> +        unsafe { bindings::free_irq(self.irq, &*self as *const Self as *mut core::ffi::c_void) };
> +    }
> +}
> +
> +/// The value that can be returned from `ThreadedHandler::handle_irq`.
> +pub enum ThreadedIrqReturn {
> +    /// The interrupt was not from this device or was not handled.
> +    None = bindings::irqreturn_IRQ_NONE as _,
> +
> +    /// The interrupt was handled by this device.
> +    Handled = bindings::irqreturn_IRQ_HANDLED as _,
> +
> +    /// The handler wants the handler thread to wake up.
> +    WakeThread = bindings::irqreturn_IRQ_WAKE_THREAD as _,
> +}
> +
> +/// Callbacks for a threaded IRQ handler.
> +pub trait ThreadedHandler: Sync {
> +    /// The actual handler function. As usual, sleeps are not allowed in IRQ
> +    /// context.
> +    fn handle_irq(&self) -> ThreadedIrqReturn;
> +
> +    /// The threaded handler function. This function is called from the irq
> +    /// handler thread, which is automatically created by the system.
> +    fn thread_fn(&self) -> IrqReturn;
> +}
> +
> +/// A registration of a threaded IRQ handler for a given IRQ line.
> +///
> +/// Two callbacks are required: one to handle the IRQ, and one to handle any
> +/// other work in a separate thread.
> +///
> +/// The thread handler is only called if the IRQ handler returns `WakeThread`.
> +///
> +/// # Examples
> +///
> +/// The following is an example of using `ThreadedRegistration`:
> +///
> +/// ```
> +/// use kernel::prelude::*;
> +/// use kernel::irq::request::flags;
> +/// use kernel::irq::request::ThreadedIrqReturn;
> +/// use kernel::irq::request::ThreadedRegistration;
> +/// use kernel::irq::request::IrqReturn;
> +/// use kernel::sync::Arc;
> +/// use kernel::sync::SpinLock;
> +/// use kernel::alloc::flags::GFP_KERNEL;
> +/// use kernel::c_str;
> +///
> +/// // Declare a struct that will be passed in when the interrupt fires. The u32
> +/// // merely serves as an example of some internal data.
> +/// struct Data(SpinLock<u32>);
> +///
> +/// // [`handle_irq`] takes &self. This example illustrates interior
> +/// // mutability can be used when share the data between process context and IRQ
> +/// // context.
> +/// //
> +/// // Ideally, this example would be using a version of SpinLock that is aware
> +/// // of `spin_lock_irqsave` and `spin_lock_irqrestore`, but that is not yet
> +/// // implemented.
> +///
> +/// type Handler = Data;
> +///
> +/// impl kernel::irq::request::ThreadedHandler for Handler {
> +///     // This is executing in IRQ context in some CPU. Other CPUs can still
> +///     // try to access to data.
> +///     fn handle_irq(&self) -> ThreadedIrqReturn {
> +///         // We now have exclusive access to the data by locking the SpinLock.
> +///         let mut data = self.0.lock();
> +///         *data += 1;
> +///
> +///         // By returning `WakeThread`, we indicate to the system that the
> +///         // thread function should be called. Otherwise, return
> +///         // ThreadedIrqReturn::Handled.
> +///         ThreadedIrqReturn::WakeThread
> +///     }
> +///
> +///     // This will run (in a separate kthread) iff `handle_irq` returns
typo iff
> +///     // `WakeThread`.
> +///     fn thread_fn(&self) -> IrqReturn {
> +///         // We now have exclusive access to the data by locking the SpinLock.
> +///         let mut data = self.0.lock();
> +///         *data += 1;
> +///
> +///         IrqReturn::Handled
> +///     }
> +/// }
> +///
> +/// // This is running in process context.
> +/// fn register_threaded_irq(irq: u32, handler: Handler) -> Result<Arc<ThreadedRegistration<Handler>>> {
> +///     let registration = ThreadedRegistration::register(irq, flags::SHARED, c_str!("my-device"), handler);
> +///
> +///     // You can have as many references to the registration as you want, so
> +///     // multiple parts of the driver can access it.
> +///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
You can use Arc::new instead, since you don't need pin_init.
> +///
> +///     // The handler may be called immediately after the function above
> +///     // returns, possibly in a different CPU.
> +///
> +///     {
> +///         // The data can be accessed from the process context too.
> +///         let mut data = registration.handler().0.lock();
> +///         *data = 42;
> +///     }
> +///
> +///     Ok(registration)
> +/// }
> +///
> +///
> +/// # Ok::<(), Error>(())
> +///```
> +///
> +/// # Invariants
> +///
> +/// * We own an irq handler using `&self` as its private data.
> +///
> +#[pin_data(PinnedDrop)]
> +pub struct ThreadedRegistration<T: ThreadedHandler> {
> +    irq: u32,
> +    #[pin]
> +    handler: T,
> +    #[pin]
> +    /// Pinned because we need address stability so that we can pass a pointer
> +    /// to the callback.
> +    _pin: PhantomPinned,
> +}
> +
> +impl<T: ThreadedHandler> ThreadedRegistration<T> {
> +    /// Registers the IRQ handler with the system for the given IRQ number. The
> +    /// handler must be able to be called as soon as this function returns.
> +    pub fn register(
> +        irq: u32,
> +        flags: Flags,
> +        name: &'static CStr,
> +        handler: T,
> +    ) -> impl PinInit<Self, Error> {
> +        let closure = move |slot: *mut Self| {
> +            // SAFETY: The slot passed to pin initializer is valid for writing.
> +            unsafe {
> +                slot.write(Self {
> +                    irq,
> +                    handler,
> +                    _pin: PhantomPinned,
> +                })
> +            };
> +
> +            // SAFETY:
> +            // - The callbacks are valid for use with request_threaded_irq.
> +            // - If this succeeds, the slot is guaranteed to be valid until the
> +            // destructor of Self runs, which will deregister the callbacks
> +            // before the memory location becomes invalid.
> +            let res = to_result(unsafe {
> +                bindings::request_threaded_irq(
> +                    irq,
> +                    Some(handle_threaded_irq_callback::<T>),
> +                    Some(thread_fn_callback::<T>),
> +                    flags.0,
> +                    name.as_char_ptr(),
> +                    slot.cast(),
> +                )
> +            });
> +
> +            if res.is_err() {
> +                // SAFETY: We are returning an error, so we can destroy the slot.
> +                unsafe { core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
> +            }
> +
> +            res
> +        };
> +
> +        // SAFETY:
> +        // - if this returns Ok(()), then every field of `slot` is fully
> +        // initialized.
> +        // - if this returns an error, then the slot does not need to remain
> +        // valid.
> +        unsafe { pin_init_from_closure(closure) }
> +    }
> +
> +    /// Returns a reference to the handler that was registered with the system.
> +    pub fn handler(&self) -> &T {
> +        // SAFETY: `handler` is initialized in `register`, and we require that
> +        // T: Sync.
> +        &self.handler
> +    }
> +}
> +
> +#[pinned_drop]
> +impl<T: ThreadedHandler> PinnedDrop for ThreadedRegistration<T> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY:
> +        // - `self.irq` is the same as the one passed to `request_threaded_irq`.
> +        // -  `&self` was passed to `request_threaded_irq` as the cookie. It is
> +        // guaranteed to be unique by the type system, since each call to
> +        // `register` will return a different instance of
> +        // `ThreadedRegistration`.
> +        //
> +        // Notice that this will block until all handlers finish executing, so,
> +        // at no point will &self be invalid while the handler is running.
> +        unsafe { bindings::free_irq(self.irq, &*self as *const Self as *mut core::ffi::c_void) };
> +    }
> +}
> +
> +/// # Safety
> +///
> +/// This function should be only used as the callback in `request_irq`.
> +unsafe extern "C" fn handle_irq_callback<T: Handler>(
> +    _irq: i32,
> +    ptr: *mut core::ffi::c_void,
> +) -> core::ffi::c_uint {
> +    // SAFETY: `ptr` is a poinhandle_threaded_irq_callbackter to T set in `Registration::new`
> +    let data = unsafe { &*(ptr as *const T) };
> +    T::handle_irq(data) as _
> +

Can `handle_irq_callback` and `handle_threaded_irq_callback` be shared somehow?

Otherwise maybe define them locally in the calling function, since nothing else
should ever use them, so we might as well restrict their scope.

> +
> +/// # Safety
> +///
> +/// This function should be only used as the callback in `request_threaded_irq`.
> +unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
> +    _irq: i32,
> +    ptr: *mut core::ffi::c_void,
> +) -> core::ffi::c_uint {
> +    // SAFETY: `ptr` is a pointer to T set in `ThreadedRegistration::new`
> +    let data = unsafe { &*(ptr as *const T) };
> +    T::handle_irq(data) as _
> +}
> +
> +/// # Safety
> +///
> +/// This function should be only used as the callback in `request_threaded_irq`.
> +unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(
> +    _irq: i32,
> +    ptr: *mut core::ffi::c_void,
> +) -> core::ffi::c_uint {
> +    // SAFETY: `ptr` is a pointer to T set in `ThreadedRegistration::new`
> +    let data = unsafe { &*(ptr as *const T) };
> +    T::thread_fn(data) as _
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index e1065a7551a3..bba782e138c5 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -41,6 +41,7 @@
>  pub mod fs;
>  pub mod init;
>  pub mod ioctl;
> +pub mod irq;
>  pub mod jump_label;
>  #[cfg(CONFIG_KUNIT)]
>  pub mod kunit;

