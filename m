Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBC5382292
	for <rust-for-linux@vger.kernel.org>; Thu,  2 Jul 2026 06:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972962; cv=none; b=YSFMGf4NzUaim/YgC8XO7BL/5DYQVGOV1O0nO1ByS815VYdR68DVMDL520Me/BN3Hb63N9U+CWyzNW6MoNwGI7mSE5ourdKcqAhDFdN39h6+SHbmfng1sOFi/Ww6bUBUwma1vtYYp1xgumYAlTBYwUKuCFJmgd5CCjJsk2PESAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972962; c=relaxed/simple;
	bh=IwDRwtP8oGlX4obhtjzUxymqLmxMTMzx2NsBHtVHeD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGLpev5N6hAcsSUguMhRYNqtRhGDOttWQd2qtVECQMuF0OHODCD7COVaVqWuT+padRK6vC8HEN4iWN1zZ/0XNeNMpI3Iw6kUwPzBpBwVXwzb8zC62bAK6iKzhJ3YFfskbWliGSlzQWRk2QGNiYhS9c57NFk6D1x686z2mGcdtaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VyDoednx; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VyDoednx"
Message-ID: <d63a68b2-4301-4ce2-a28c-637f4c6bf4fa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782972958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=slumhpyAGNKpDFdXehOK+5VyY4jZ2CXXkK8OCRvrkJQ=;
	b=VyDoednx4nMubMdjK6GUY/XhGeNqlq/88ByP4XNElz6dFY9XK1Ey2jA0lkjnuomS2VyPA2
	sug89u20WJY4A6wS98I69zEDTPIHPGvXHySL6CDwqP+afYBFKS0NHTUF/0aaOSfgNUFJTc
	jTWrjHfzxRIce8d/WVxj157Nw0gTeOQ=
Date: Thu, 2 Jul 2026 14:15:35 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] rust: add pr_*_ratelimit! macros for printing
To: Alice Ryhl <aliceryhl@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlos Llamas <cmllamas@google.com>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>
Cc: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>,
 Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260623-pr-ratelimited-v1-3-cc922f544dc0@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 6/23/26 23:38, Alice Ryhl wrote:
> Printing can be very expensive if it occurs often, so printing that can
> be triggered by userspace should be rate limited. For this purpose, add
> a Rust wrapper around `struct ratelimit_state` and use it in the new
> macros.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Tested-by: Alvin Sun <alvin.sun@linux.dev>

The binder-related patches couldn't be applied to the mainline
repository. I wrote a simple misc device to test pr_warn_ratelimited:

[   80.655483] misc misc_test: Opening Rust Misc Test Device
[   80.655546] Rust: 1990 callbacks suppressed
[   80.656102] rust_misc_test: pr_warn_ratelimited triggered (0) from 
/dev/misc_test
[   80.656137] rust_misc_test: pr_warn_ratelimited triggered (1) from 
/dev/misc_test

> ---
>   rust/helpers/helpers.c   |   1 +
>   rust/helpers/ratelimit.c |  14 ++++
>   rust/kernel/lib.rs       |   1 +
>   rust/kernel/prelude.rs   |   8 ++
>   rust/kernel/ratelimit.rs | 202 +++++++++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 226 insertions(+)
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index d17eaec76450..2184b11c927f 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -80,6 +80,7 @@
>   #include "processor.c"
>   #include "property.c"
>   #include "pwm.c"
> +#include "ratelimit.c"
>   #include "rbtree.c"
>   #include "rcu.c"
>   #include "refcount.c"
> diff --git a/rust/helpers/ratelimit.c b/rust/helpers/ratelimit.c
> new file mode 100644
> index 000000000000..e5052f568b81
> --- /dev/null
> +++ b/rust/helpers/ratelimit.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/ratelimit.h>
> +
> +__rust_helper void rust_helper_ratelimit_state_init(struct ratelimit_state *rs,
> +						    int interval, int burst)
> +{
> +	ratelimit_state_init(rs, interval, burst);
> +}
> +
> +__rust_helper void rust_helper_ratelimit_state_exit(struct ratelimit_state *rs)
> +{
> +	ratelimit_state_exit(rs);
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index b72b2fbe046d..ba65ab4f0b8c 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -111,6 +111,7 @@
>   pub mod ptr;
>   #[cfg(CONFIG_RUST_PWM_ABSTRACTIONS)]
>   pub mod pwm;
> +pub mod ratelimit;
>   pub mod rbtree;
>   pub mod regulator;
>   pub mod revocable;
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index 44edf72a4a24..5a66028dd973 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -89,13 +89,21 @@
>       },
>       init::InPlaceInit,
>       pr_alert,
> +    pr_alert_ratelimited,
>       pr_crit,
> +    pr_crit_ratelimited,
>       pr_debug,
> +    pr_debug_ratelimited,
>       pr_emerg,
> +    pr_emerg_ratelimited,
>       pr_err,
> +    pr_err_ratelimited,
>       pr_info,
> +    pr_info_ratelimited,
>       pr_notice,
> +    pr_notice_ratelimited,
>       pr_warn,
> +    pr_warn_ratelimited,
>       static_assert,
>       str::CStrExt as _,
>       try_init,
> diff --git a/rust/kernel/ratelimit.rs b/rust/kernel/ratelimit.rs
> new file mode 100644
> index 000000000000..da0a49412023
> --- /dev/null
> +++ b/rust/kernel/ratelimit.rs
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rate limiting support.
> +//!
> +//! C header: [`include/linux/ratelimit.h`](srctree/include/linux/ratelimit.h)
> +
> +use crate::{
> +    bindings,
> +    prelude::*,
> +    types::Opaque, //
> +};
> +
> +/// Defines a `static` containing a [`Ratelimit`].
> +#[macro_export]
> +macro_rules! ratelimit_state_init {
> +    ($name:ident, $interval:expr, $burst:expr $(,)?) => {
> +        static $name: $crate::ratelimit::Ratelimit = {
> +            let init: $crate::bindings::ratelimit_state = $crate::bindings::ratelimit_state {
> +                lock: $crate::sync::lock::spinlock::raw_spin_lock_unlocked($crate::c_str!(
> +                    ::core::stringify!($name)
> +                )),
> +                interval: $interval,
> +                burst: $burst,
> +                // SAFETY: This type can be zeroed.
> +                ..unsafe { ::core::mem::zeroed() }
> +            };
> +            // SAFETY: This is a repr(transparent) wrapper, and the invariants are satisfied.
> +            unsafe { ::core::mem::transmute(init) }
> +        };
> +    };
> +}
> +pub use ratelimit_state_init;
> +
> +/// Rate limiter state.
> +///
> +/// # Invariants
> +///
> +/// The `inner` field contains an initialized `struct ratelimit_state`.
> +#[pin_data(PinnedDrop)]
> +#[repr(transparent)]
> +pub struct Ratelimit {
> +    #[pin]
> +    inner: Opaque<bindings::ratelimit_state>,
> +}
> +
> +// SAFETY: `Ratelimit` is safe to be sent to any task.
> +unsafe impl Send for Ratelimit {}
> +
> +// SAFETY: `Ratelimit` is safe to be accessed concurrently as it is protected by an internal
> +// spinlock.
> +unsafe impl Sync for Ratelimit {}
> +
> +impl Ratelimit {
> +    /// Constructs a [`Ratelimit`] with the specified configuration.
> +    ///
> +    /// If `interval` is zero, then no rate limit is applied.
> +    #[inline]
> +    pub fn new(interval: i32, burst: i32) -> impl PinInit<Self> {
> +        // INVARIANT: This creates a `Ratelimit` containing an initialized `struct ratelimit_state`
> +        pin_init!(Self {
> +            inner <- Opaque::ffi_init(|slot: *mut bindings::ratelimit_state| {
> +                // SAFETY: `slot` is a valid pointer to an uninitialized `struct ratelimit_state`.
> +                // The memory is pinned so it remains valid until `ratelimit_state_exit` is called.
> +                unsafe { bindings::ratelimit_state_init(slot, interval, burst) };
> +            }),
> +        })
> +    }
> +
> +    /// Constructs a [`Ratelimit`] with the default configuration.
> +    #[inline]
> +    pub fn new_default() -> impl PinInit<Self> {
> +        Ratelimit::new(Ratelimit::DEFAULT_INTERVAL, Ratelimit::DEFAULT_BURST)
> +    }
> +
> +    /// The default interval used for rate limiting.
> +    pub const DEFAULT_INTERVAL: i32 = bindings::DEFAULT_RATELIMIT_INTERVAL as i32;
> +
> +    /// The default burst size.
> +    pub const DEFAULT_BURST: i32 = bindings::DEFAULT_RATELIMIT_BURST as i32;
> +
> +    /// Check if an action should be rate-limited.
> +    ///
> +    /// Returns `true` if the action is allowed, and `false` if it should be suppressed.
> +    #[inline]
> +    pub fn ratelimit(&self) -> bool {
> +        // We don't set `RATELIMIT_MSG_ON_RELEASE`, so the function name parameter is not used.
> +        //
> +        // SAFETY: `self.inner.get()` is a valid pointer to a `struct ratelimit_state`.
> +        // The lifetime of `func` ensures the pointer remains valid for the duration of the call.
> +        // The C function `___ratelimit` handles its own internal locking, so it is safe to call
> +        // concurrently.
> +        unsafe { bindings::___ratelimit(self.inner.get(), c"Rust".as_char_ptr()) != 0 }
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for Ratelimit {
> +    #[inline]
> +    fn drop(self: Pin<&mut Self>) {
> +        // SAFETY: By the type invariants, this struct contains an initialized `struct
> +        // ratelimit_state`.
> +        unsafe { bindings::ratelimit_state_exit(self.inner.get()) };
> +    }
> +}
> +
> +/// Helper macro to implement ratelimited printing.
> +#[macro_export]
> +#[doc(hidden)]
> +macro_rules! print_ratelimited {
> +    ($print_macro:ident, $($arg:tt)*) => {{
> +        $crate::ratelimit::ratelimit_state_init!(
> +            _rs,
> +            $crate::ratelimit::Ratelimit::DEFAULT_INTERVAL,
> +            $crate::ratelimit::Ratelimit::DEFAULT_BURST,
> +        );
> +        if $crate::ratelimit::Ratelimit::ratelimit(&_rs) {
> +            $crate::$print_macro!($($arg)*);
> +        }
> +    }};
> +}
> +
> +/// Prints an emergency-level message (level 0) if allowed by a rate limiter.
> +///
> +/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
> +#[macro_export]
> +macro_rules! pr_emerg_ratelimited (
> +    ($($arg:tt)*) => (
> +        $crate::print_ratelimited!(pr_emerg, $($arg)*)
> +    )
> +);
> +
> +/// Prints an alert-level message (level 1) if allowed by a rate limiter.
> +///
> +/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
> +#[macro_export]
> +macro_rules! pr_alert_ratelimited (
> +    ($($arg:tt)*) => (
> +        $crate::print_ratelimited!(pr_alert, $($arg)*)
> +    )
> +);
> +
> +/// Prints a critical-level message (level 2) if allowed by a rate limiter.
> +///
> +/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
> +#[macro_export]
> +macro_rules! pr_crit_ratelimited (
> +    ($($arg:tt)*) => (
> +        $crate::print_ratelimited!(pr_crit, $($arg)*)
> +    )
> +);
> +
> +/// Prints an error-level message (level 3) if allowed by a rate limiter.
> +///
> +/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
> +#[macro_export]
> +macro_rules! pr_err_ratelimited (
> +    ($($arg:tt)*) => (
> +        $crate::print_ratelimited!(pr_err, $($arg)*)
> +    )
> +);
> +
> +/// Prints a warning-level message (level 4) if allowed by a rate limiter.
> +///
> +/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
> +#[macro_export]
> +macro_rules! pr_warn_ratelimited (
> +    ($($arg:tt)*) => (
> +        $crate::print_ratelimited!(pr_warn, $($arg)*)
> +    )
> +);
> +
> +/// Prints a notice-level message (level 5) if allowed by a rate limiter.
> +///
> +/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
> +#[macro_export]
> +macro_rules! pr_notice_ratelimited (
> +    ($($arg:tt)*) => (
> +        $crate::print_ratelimited!(pr_notice, $($arg)*)
> +    )
> +);
> +
> +/// Prints an info-level message (level 6) if allowed by a rate limiter.
> +///
> +/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
> +#[macro_export]
> +macro_rules! pr_info_ratelimited (
> +    ($($arg:tt)*) => (
> +        $crate::print_ratelimited!(pr_info, $($arg)*)
> +    )
> +);
> +
> +/// Prints a debug-level message (level 7) if allowed by a rate limiter.
> +///
> +/// [`Ratelimit`]: $crate::ratelimit::Ratelimit
> +#[macro_export]
> +macro_rules! pr_debug_ratelimited (
> +    ($($arg:tt)*) => (
> +        if cfg!(debug_assertions) {
> +            $crate::print_ratelimited!(pr_debug, $($arg)*)
> +        }
> +    )
> +);
>
