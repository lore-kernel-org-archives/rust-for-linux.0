Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B8D245020
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Nov 2025 09:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762334983; cv=none; b=dGc1X//IAayNOSbvZzUkBWII2exnFrfBqdnF1wIpxFpAWM+XXlKQbTmUzyCs3iKrcz6KZANw7RfCCUGW+8j7yA+KTxauwaSb/pg83OS7mz2aypyGYFyLgwHDRsEQDgs8YkhLEJSNK+pDMy3cW4tlepxd9ngFgFYv6DQKGPuanM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762334983; c=relaxed/simple;
	bh=WlR7mYX9yXh7o0b4eCgJx7yAzT5z5J6p6rbTgo2q/CM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WdSy3gkJKv8Tep1OLB3tvsD6VnGSttu/FRUBwJBhEY/1+Ld4pnzMF3r9VvIcZk7YJGP3y0/RfIf/ATwGKwGLwd7zIJCOUEQZ9XaKNOEP0ghC8lHIBylK7tH0njp3nngiwKx2c/e1HRzTCNZfQwWlKAarbrHF2qLNwQ10zEFMB9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=XVNskxSx; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="XVNskxSx"
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:4ca4:0:640:f272:0])
	by forward501d.mail.yandex.net (Yandex) with ESMTPS id 9316B81E32;
	Wed, 05 Nov 2025 12:21:31 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id RLhAd0aLlmI0-7fy3n5G9;
	Wed, 05 Nov 2025 12:21:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1762334491;
	bh=SfHinn3WUb5RKE+2qXHDkmKOGvPGznUzs5FF+mwM4gY=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=XVNskxSxhUWEZ/H85S6XYxnW+6aasprQUx1LkqYoE5GYwCzXHjOwsjTP5IqIjMJo6
	 bA0yGYCJ4xxkr+gqygfBuB3BV1BrBSPS8yip9P/ciXLHMis9Q51sjZhfIl6Mg+JbzR
	 YJBL0CACme3HaQk6/AhnYt4MHIulh8nwSjQ99Q44=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Wed, 5 Nov 2025 12:21:25 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
Message-ID: <20251105122125.5b84fa83@nimda>
In-Reply-To: <20251105054731.3194118-2-fujita.tomonori@gmail.com>
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
	<20251105054731.3194118-2-fujita.tomonori@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  5 Nov 2025 14:47:30 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> Add the Rust equivalent of the kernel's `DO_ONCE_LITE` macro. While it
> would be possible to implement the feature entirely as a Rust macro,
> the functionality that can be implemented as regular functions has
> been extracted and implemented as the `OnceLite` struct for better
> code maintainability.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/lib.rs       |  1 +
>  rust/kernel/once_lite.rs | 71
> ++++++++++++++++++++++++++++++++++++++++ 2 files changed, 72
> insertions(+) create mode 100644 rust/kernel/once_lite.rs
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3dd7bebe7888..19553eb8c188 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -110,6 +110,7 @@
>  #[cfg(CONFIG_NET)]
>  pub mod net;
>  pub mod of;
> +pub mod once_lite;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
>  pub mod page;
> diff --git a/rust/kernel/once_lite.rs b/rust/kernel/once_lite.rs
> new file mode 100644
> index 000000000000..44ad5dbdc67e
> --- /dev/null
> +++ b/rust/kernel/once_lite.rs
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Support for calling a function exactly once.
> +//!
> +//! C header:
> [`include/linux/once_lite.h`](srctree/include/linux/once_lite.h) +

This seems like a pure Rust implementation. What exactly do we need
from the "once_lite.h" in this module?

-Onur

> +use crate::sync::atomic::{Atomic, AtomicType, Relaxed};
> +
> +/// A lightweight `call_once` primitive.
> +///
> +/// This structure provides the Rust equivalent of the kernel's
> `DO_ONCE_LITE` macro. +/// While it would be possible to implement
> the feature entirely as a Rust macro, +/// the functionality that can
> be implemented as regular functions has been +/// extracted and
> implemented as the `OnceLite` struct for better code maintainability.
> +pub struct OnceLite(Atomic<State>); +
> +#[derive(Clone, Copy, PartialEq, Eq)]
> +#[repr(i32)]
> +enum State {
> +    Incomplete = 0,
> +    Complete = 1,
> +}
> +
> +// SAFETY: `State` and `i32` has the same size and alignment, and
> it's round-trip +// transmutable to `i32`.
> +unsafe impl AtomicType for State {
> +    type Repr = i32;
> +}
> +
> +impl OnceLite {
> +    /// Creates a new [`OnceLite`] in the incomplete state.
> +    #[inline(always)]
> +    #[allow(clippy::new_without_default)]
> +    pub const fn new() -> Self {
> +        OnceLite(Atomic::new(State::Incomplete))
> +    }
> +
> +    /// Calls the provided function exactly once.
> +    pub fn call_once<F>(&self, f: F) -> bool
> +    where
> +        F: FnOnce(),
> +    {
> +        let old = self.0.xchg(State::Complete, Relaxed);
> +        if old == State::Complete {
> +            return false;
> +        }
> +
> +        f();
> +        true
> +    }
> +}
> +
> +/// Run the given function exactly once.
> +///
> +/// This is equivalent to the kernel's `DO_ONCE_LITE` macro.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// kernel::do_once_lite!(|| {
> +///     kernel::pr_info!("This will be printed only once\n");
> +/// });
> +/// ```
> +#[macro_export]
> +macro_rules! do_once_lite {
> +    ($e:expr) => {{
> +        #[link_section = ".data..once"]
> +        static ONCE: $crate::once_lite::OnceLite =
> $crate::once_lite::OnceLite::new();
> +        ONCE.call_once($e)
> +    }};
> +}

