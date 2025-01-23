Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD913AA41;
	Thu, 23 Jan 2025 17:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737652196; cv=none; b=bZUGtYZvpcq/izcRt5z7WpQOVwVEvVwgXvBKbjF8j7I96OoB3VaBY9gIWx7KBA5t2IiqhZ26QasuTQDMm5OPphU38+e2Fj+SXtOFSFlXsqWtzAGkz5/R91VXbBbaDLjFHgHnoxW9jd9v2DQyzOMpvjgbXBYS5KF1j6a6o4ZHtNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737652196; c=relaxed/simple;
	bh=iAG7WYqYvGeCr0ErD1u2ndDRUy/n28T3mVTm4wCtPQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRAaDnXs+DZmJ0zwfD53LZddV2ZZ6yrVIQBs5mARAUsrAuFkdlif4eTH4+hcLPHfWQy6w4lZCw9ipHCVA2xWeiLPmKSxOT2INxtOYYFO36J9vbjEAdqZphwWPCbAguc15pLuEQwZpZ7UEPH9SWhStK2zSgmNOADQcu0p+zRm3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WaUifED0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WaUifED0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43624b2d453so12822755e9.2;
        Thu, 23 Jan 2025 09:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737652192; x=1738256992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/j8msa88dexFDIPlQ1NuorlcyrRMrp5RIm+yOJqhUyQ=;
        b=WaUifED0xZBYwm68l0so6FBDBF1J9N+aiMw9EIY6lv6mGlOwcYi34YvBk9ux0FgSUK
         JHzX1P9/hlc651NYwaCAe3ZQHXJbwqd2iazb2X/sQ0wYB9cU+X1lSjF1+LnVjR/wDKZd
         jj4ZdNrG4+EWapjGy3o4bEcz+rmaBzgxcuzfmqTHeXKWZ/YxdboxO1hvey65ACO56fVc
         9ApiWYvoogjlu3AW4D+eB2/jMJOOopKtvssdZj4iA2JeCJrRzcARvnRCB3gm+OeLqtQX
         UxxeznyPmd4F52rPRv83gzNDNISyVHrVCUPdspDCnV9VpEYwsHCE39/d9dGhCyn/ydAH
         m/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737652192; x=1738256992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/j8msa88dexFDIPlQ1NuorlcyrRMrp5RIm+yOJqhUyQ=;
        b=FsrA4uiPFNsHvvWc23DudJub3Leh5+wkksf86f0rAI+tcPBE/PVSzSYw+7/EqNKV/c
         zaXOTo+QmO+A7V4bXMee7cWGS0mFR/7TVTotjZrdArYxiLq8tdeO5bw5QThSlM403VgM
         Aa/+PmfaXRi6D/MWpNOfMvG/CrpB1hnph2uckbyeo+o7KS0ymRpZkqvt5oazRZOj+y+R
         cIprpFh68M3PLlGgVUZULyVzFRmvceM8p1CnA9oBpDeGGMbUtVJRa43rhhFF2AqmH19Q
         kiKTuCmt3yvHi4cHwTxLqcTsyustHaDyoLDGh3LuedCOukwdHwwgKdERBARBJkdrA2FF
         y1KA==
X-Forwarded-Encrypted: i=1; AJvYcCUUPFLiwA01/EdoaIcisOm16PS5vE8TDFca2BP3mj4GAiV5hjJk3BE0RM9cR5HydmWmGpbITUEJ8adLrL4=@vger.kernel.org, AJvYcCV7xYhWDUzgdo2BGuatgWcSM3OS15yY/lDepzpuDtjsDIS2uEOQvANzs6oZd1R7PYywizGFrw4PvpqNyCw4xzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNowMAc3rNd+9oF5uoU7d6r3RTMTUfJ1YJec2NtD6hqERCUD2C
	UrEwIagyoPT1NLYKmza6g5sz8m5lpI/9P/D7OCYFbhfgq55TmUn5
X-Gm-Gg: ASbGncuFfFkLtS0qyBBHiU3OJa5WXcP49pa0I+IcWPPJITbygBrMdsH+2HwEjCRBhZr
	ZUVZlEr45i9vOZquYYve+SIzMf++tBFKuygluzX8LeZOJ/Bs3o8vLl8OxU06lvan3vme96MbDJb
	W92Zrx1YRO/BPRJnSI2adB4VfJy9krXGNpy+5K3eBYtWzLd2TVH3egHuwk5tk0cdmvg5r0AB39A
	Uzn+PDpg3FMX3n18GTPNyoKkY3J5ojdJwZjbl01RIJGnI0HDhj8FX2EbjZA/NmVyn/h/cVLweSA
	HSYW1B5vkHucbKZitw==
X-Google-Smtp-Source: AGHT+IERowf4tWMCYv0bsxHEV9FT06AEoNW27pXsFGx17GPX+VzgNbol1nHblTgpQH/YybhPLqLkxQ==
X-Received: by 2002:a05:600c:3b0f:b0:436:e86e:e4ab with SMTP id 5b1f17b1804b1-4389146e66cmr285822065e9.30.1737652191614;
        Thu, 23 Jan 2025 09:09:51 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31aea72sm68062195e9.21.2025.01.23.09.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 09:09:51 -0800 (PST)
Message-ID: <18959872-87c6-4cb1-a4b9-707567fafaca@gmail.com>
Date: Thu, 23 Jan 2025 18:09:50 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
References: <20250122163932.46697-1-daniel.almeida@collabora.com>
 <8a2bac6e-1989-41d8-a5f6-3bb518a9f139@gmail.com>
 <30401DE8-53DA-4CF3-9D97-1511015BCD4D@collabora.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <30401DE8-53DA-4CF3-9D97-1511015BCD4D@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23.01.25 5:27 PM, Daniel Almeida wrote:
> Hi Christian,
> 
>> On 23 Jan 2025, at 13:00, Christian Schrefl <chrisi.schrefl@gmail.com> wrote:
>>
>> On 22.01.25 5:39 PM, Daniel Almeida wrote:
>>> Add support for registering IRQ handlers in Rust.
>>>
>>> IRQ handlers are extensively used in drivers when some peripheral wants to
>>> obtain the CPU attention. Registering a handler will make the system invoke the
>>> passed-in function whenever the chosen IRQ line is triggered.
>>>
>>> Both regular and threaded IRQ handlers are supported through a Handler (or
>>> ThreadedHandler) trait that is meant to be implemented by a type that:
>>>
>>> a) provides a function to be run by the system when the IRQ fires and,
>>>
>>> b) holds the shared data (i.e.: `T`) between process and IRQ contexts.
>>>
>>> The requirement that T is Sync derives from the fact that handlers might run
>>> concurrently with other processes executing the same driver, creating the
>>> potential for data races.
>>>
>>> Ideally, some interior mutability must be in place if T is to be mutated. This
>>> should usually be done through the in-flight SpinLockIrq type.
>>>
>>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>
>> It would be nice it you included a second patch that adds the ability to get
>> the irq number from a platform device, it should be pretty simple.
>> Of course this can also just be done separately.
> 
> Sure!
> 
>>
>> Otherwise this looks pretty good, a few small comments below.
>>
>>> ---
>>>
>>> Changes from v1:
>>>
>>> - Added Co-developed-by tag to account for the work that Alice did in order to
>>> figure out how to do this without Opaque<T> (Thanks!)
>>> - Removed Opaque<T> in favor of plain T
>>> - Fixed the examples
>>> - Made sure that the invariants sections are the last entry in the docs
>>> - Switched to slot.cast() where applicable,
>>> - Mentioned in the safety comments that we require that T: Sync,
>>> - Removed ThreadedFnReturn in favor of IrqReturn,
>>> - Improved the commit message
>>>
>>> Link to v1: https://lore.kernel.org/rust-for-linux/20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com/
>>>
>>>
>>> ---
>>> rust/bindings/bindings_helper.h |   1 +
>>> rust/helpers/helpers.c          |   1 +
>>> rust/helpers/irq.c              |   9 +
>>> rust/kernel/irq.rs              |   6 +
>>> rust/kernel/irq/request.rs      | 517 ++++++++++++++++++++++++++++++++
>>> rust/kernel/lib.rs              |   1 +
>>> 6 files changed, 535 insertions(+)
>>> create mode 100644 rust/helpers/irq.c
>>> create mode 100644 rust/kernel/irq.rs
>>> create mode 100644 rust/kernel/irq/request.rs
>>>
>>> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
>>> index 5c4dfe22f41a..0331c6273def 100644
>>> --- a/rust/bindings/bindings_helper.h
>>> +++ b/rust/bindings/bindings_helper.h
>>> @@ -15,6 +15,7 @@
>>> #include <linux/ethtool.h>
>>> #include <linux/file.h>
>>> #include <linux/firmware.h>
>>> +#include <linux/interrupt.h>
>>> #include <linux/fs.h>
>>> #include <linux/jiffies.h>
>>> #include <linux/jump_label.h>
>>> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
>>> index dcf827a61b52..bfc499d7f4c1 100644
>>> --- a/rust/helpers/helpers.c
>>> +++ b/rust/helpers/helpers.c
>>> @@ -13,6 +13,7 @@
>>> #include "build_bug.c"
>>> #include "cred.c"
>>> #include "err.c"
>>> +#include "irq.c"
>>> #include "fs.c"
>>> #include "jump_label.c"
>>> #include "kunit.c"
>>> diff --git a/rust/helpers/irq.c b/rust/helpers/irq.c
>>> new file mode 100644
>>> index 000000000000..1faca428e2c0
>>> --- /dev/null
>>> +++ b/rust/helpers/irq.c
>>> @@ -0,0 +1,9 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <linux/interrupt.h>
>>> +
>>> +int rust_helper_request_irq(unsigned int irq, irq_handler_t handler,
>>> +     unsigned long flags, const char *name, void *dev)
>>> +{
>>> + return request_irq(irq, handler, flags, name, dev);
>>> +}
>>> diff --git a/rust/kernel/irq.rs b/rust/kernel/irq.rs
>>> new file mode 100644
>>> index 000000000000..3ab83c5bdb83
>>> --- /dev/null
>>> +++ b/rust/kernel/irq.rs
>>> @@ -0,0 +1,6 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! IRQ abstractions
>>> +
>>> +/// IRQ allocation and handling
>>> +pub mod request;
>>> diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
>>> new file mode 100644
>>> index 000000000000..61e7d4a8f555
>>> --- /dev/null
>>> +++ b/rust/kernel/irq/request.rs
>>> @@ -0,0 +1,517 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +// SPDX-FileCopyrightText: Copyright 2025 Collabora ltd.
>>> +
>>> +//! IRQ allocation and handling
>>> +
>>> +use core::marker::PhantomPinned;
>>> +use core::ptr::addr_of_mut;
>>> +
>>> +use init::pin_init_from_closure;
>>> +
>>> +use crate::error::to_result;
>>> +use crate::prelude::*;
>>> +use crate::str::CStr;
>>> +
>>> +/// Flags to be used when registering IRQ handlers.
>>> +///
>>> +/// They can be combined with the operators `|`, `&`, and `!`.
>>> +///
>>> +/// Values can be used from the [`flags`] module.
>>> +#[derive(Clone, Copy)]
>>> +pub struct Flags(u64);
>>> +
>>> +impl core::ops::BitOr for Flags {
>>> +    type Output = Self;
>>> +    fn bitor(self, rhs: Self) -> Self::Output {
>>> +        Self(self.0 | rhs.0)
>>> +    }
>>> +}
>>> +
>>> +impl core::ops::BitAnd for Flags {
>>> +    type Output = Self;
>>> +    fn bitand(self, rhs: Self) -> Self::Output {
>>> +        Self(self.0 & rhs.0)
>>> +    }
>>> +}
>>> +
>>> +impl core::ops::Not for Flags {
>>> +    type Output = Self;
>>> +    fn not(self) -> Self::Output {
>>> +        Self(!self.0)
>>> +    }
>>> +}
>>> +
>>> +/// The flags that can be used when registering an IRQ handler.
>>> +pub mod flags {
>>
>> Maybe move flags into a separate file?
>> You even have a directory for irq.
> 
> Why? Most flags are defined in the same file. See alloc::flags, for example.#

Yeah its in alloc.rs, but no other implementation is after that.
The implmentations of the containers are in other files.

> 
> I am not against this, but since this is merely aesthetic in nature, we should maybe
> wait for input from more people.

I just think its easier to read when the file doesn't have this many definitions before
some actual implementation. But I don't mind that much to keep it as-is.

> 
>>
>>> +    use super::Flags;
>>> +
>>> +    use crate::bindings;
>>> +

<snip>

>>> +///         ThreadedIrqReturn::WakeThread
>>> +///     }
>>> +///
>>> +///     // This will run (in a separate kthread) iff `handle_irq` returns
>> typo iff
> 
> I mean the acronym for “if and only if”.

Ok

>
>>> +///     // `WakeThread`.
>>> +///     fn thread_fn(&self) -> IrqReturn {
>>> +///         // We now have exclusive access to the data by locking the SpinLock.
>>> +///         let mut data = self.0.lock();
>>> +///         *data += 1;
>>> +///
>>> +///         IrqReturn::Handled
>>> +///     }
>>> +/// }
>>> +///
>>> +/// // This is running in process context.
>>> +/// fn register_threaded_irq(irq: u32, handler: Handler) -> Result<Arc<ThreadedRegistration<Handler>>> {
>>> +///     let registration = ThreadedRegistration::register(irq, flags::SHARED, c_str!("my-device"), handler);
>>> +///
>>> +///     // You can have as many references to the registration as you want, so
>>> +///     // multiple parts of the driver can access it.
>>> +///     let registration = Arc::pin_init(registration, GFP_KERNEL)?;
>> You can use Arc::new instead, since you don't need pin_init.
> 
> Register returns `impl PinInit`, my understanding is that this has to be passed to the corresponding
> `pin_init` function for types that implement the pin init trait?

Ah ok sorry I thought let registration already stored the initialized value, not the `impl PinInit`.
>
>>> +///
>>> +///     // The handler may be called immediately after the function above
>>> +///     // returns, possibly in a different CPU.
>>> +///
>>> +///     {
>>> +///         // The data can be accessed from the process context too.
>>> +///         let mut data = registration.handler().0.lock();
>>> +///         *data = 42;
>>> +///     }
>>> +///
>>> +///     Ok(registration)
>>> +/// }
>>> +///
>>> +///
>>> +/// # Ok::<(), Error>(())
>>> +///```
>>> +///
>>> +/// # Invariants
>>> +///
>>> +/// * We own an irq handler using `&self` as its private data.
>>> +///
>>> +#[pin_data(PinnedDrop)]
>>> +pub struct ThreadedRegistration<T: ThreadedHandler> {
>>> +    irq: u32,
>>> +    #[pin]
>>> +    handler: T,
>>> +    #[pin]
>>> +    /// Pinned because we need address stability so that we can pass a pointer
>>> +    /// to the callback.
>>> +    _pin: PhantomPinned,
>>> +}
>>> +
>>> +impl<T: ThreadedHandler> ThreadedRegistration<T> {
>>> +    /// Registers the IRQ handler with the system for the given IRQ number. The
>>> +    /// handler must be able to be called as soon as this function returns.
>>> +    pub fn register(
>>> +        irq: u32,
>>> +        flags: Flags,
>>> +        name: &'static CStr,
>>> +        handler: T,
>>> +    ) -> impl PinInit<Self, Error> {
>>> +        let closure = move |slot: *mut Self| {
>>> +            // SAFETY: The slot passed to pin initializer is valid for writing.
>>> +            unsafe {
>>> +                slot.write(Self {
>>> +                    irq,
>>> +                    handler,
>>> +                    _pin: PhantomPinned,
>>> +                })
>>> +            };
>>> +
>>> +            // SAFETY:
>>> +            // - The callbacks are valid for use with request_threaded_irq.
>>> +            // - If this succeeds, the slot is guaranteed to be valid until the
>>> +            // destructor of Self runs, which will deregister the callbacks
>>> +            // before the memory location becomes invalid.
>>> +            let res = to_result(unsafe {
>>> +                bindings::request_threaded_irq(
>>> +                    irq,
>>> +                    Some(handle_threaded_irq_callback::<T>),
>>> +                    Some(thread_fn_callback::<T>),
>>> +                    flags.0,
>>> +                    name.as_char_ptr(),
>>> +                    slot.cast(),
>>> +                )
>>> +            });
>>> +
>>> +            if res.is_err() {
>>> +                // SAFETY: We are returning an error, so we can destroy the slot.
>>> +                unsafe { core::ptr::drop_in_place(addr_of_mut!((*slot).handler)) };
>>> +            }
>>> +
>>> +            res
>>> +        };
>>> +
>>> +        // SAFETY:
>>> +        // - if this returns Ok(()), then every field of `slot` is fully
>>> +        // initialized.
>>> +        // - if this returns an error, then the slot does not need to remain
>>> +        // valid.
>>> +        unsafe { pin_init_from_closure(closure) }
>>> +    }
>>> +
>>> +    /// Returns a reference to the handler that was registered with the system.
>>> +    pub fn handler(&self) -> &T {
>>> +        // SAFETY: `handler` is initialized in `register`, and we require that
>>> +        // T: Sync.
>>> +        &self.handler
>>> +    }
>>> +}
>>> +
>>> +#[pinned_drop]
>>> +impl<T: ThreadedHandler> PinnedDrop for ThreadedRegistration<T> {
>>> +    fn drop(self: Pin<&mut Self>) {
>>> +        // SAFETY:
>>> +        // - `self.irq` is the same as the one passed to `request_threaded_irq`.
>>> +        // -  `&self` was passed to `request_threaded_irq` as the cookie. It is
>>> +        // guaranteed to be unique by the type system, since each call to
>>> +        // `register` will return a different instance of
>>> +        // `ThreadedRegistration`.
>>> +        //
>>> +        // Notice that this will block until all handlers finish executing, so,
>>> +        // at no point will &self be invalid while the handler is running.
>>> +        unsafe { bindings::free_irq(self.irq, &*self as *const Self as *mut core::ffi::c_void) };
>>> +    }
>>> +}
>>> +
>>> +/// # Safety
>>> +///
>>> +/// This function should be only used as the callback in `request_irq`.
>>> +unsafe extern "C" fn handle_irq_callback<T: Handler>(
>>> +    _irq: i32,
>>> +    ptr: *mut core::ffi::c_void,
>>> +) -> core::ffi::c_uint {
>>> +    // SAFETY: `ptr` is a poinhandle_threaded_irq_callbackter to T set in `Registration::new`
>>> +    let data = unsafe { &*(ptr as *const T) };
>>> +    T::handle_irq(data) as _
>>> +
>>
>> Can `handle_irq_callback` and `handle_threaded_irq_callback` be shared somehow?
> 
> Why? In the quest to save a few lines we might introduce bugs.

Mostly curious if its possible, if it would require to hacky code just ignore it.
> 
>>
>> Otherwise maybe define them locally in the calling function, since nothing else
>> should ever use them, so we might as well restrict their scope.
> 
> I am not against this, but they’re private anyways, their scope is already restricted
> as a result of their visibility. This looks cleaner too.

I just think its cleaner if something that is only supposed to be used in one scope is
defined in that scope so it is automatically restricted to that.

But I guess that's just a matter of taste and I'm fine with keeping it as is.

> 
>>
>>> +
>>> +/// # Safety
>>> +///
>>> +/// This function should be only used as the callback in `request_threaded_irq`.
>>> +unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
>>> +    _irq: i32,
>>> +    ptr: *mut core::ffi::c_void,
>>> +) -> core::ffi::c_uint {
>>> +    // SAFETY: `ptr` is a pointer to T set in `ThreadedRegistration::new`
>>> +    let data = unsafe { &*(ptr as *const T) };
>>> +    T::handle_irq(data) as _
>>> +}
>>> +
>>> +/// # Safety
>>> +///
>>> +/// This function should be only used as the callback in `request_threaded_irq`.
>>> +unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(
>>> +    _irq: i32,
>>> +    ptr: *mut core::ffi::c_void,
>>> +) -> core::ffi::c_uint {
>>> +    // SAFETY: `ptr` is a pointer to T set in `ThreadedRegistration::new`
>>> +    let data = unsafe { &*(ptr as *const T) };
>>> +    T::thread_fn(data) as _
>>> +}
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index e1065a7551a3..bba782e138c5 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -41,6 +41,7 @@
>>> pub mod fs;
>>> pub mod init;
>>> pub mod ioctl;
>>> +pub mod irq;
>>> pub mod jump_label;
>>> #[cfg(CONFIG_KUNIT)]
>>> pub mod kunit;
> 
> 

