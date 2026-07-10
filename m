Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6B734CDD;
	Fri, 10 Jul 2026 14:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695582; cv=none; b=N7DedjjKWj8ORgywkScZA2TTUI341/KzZkoEoaA21HHgASXEVp3yw5eRLtpJPc2AJJYa3K6WTdx7AzugnvZMhKgXQFe368RwH1YvXwhmwC6vrBi4R3pRu2QHBSDG8mGoqbhn+bCGRfkLePsBSYu3EpuDZUyEUuj5YyXf2lgu+vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695582; c=relaxed/simple;
	bh=EIr5KNz33BOBpDOOIlsHY60SPjqnO3Gwr0biOUoFUXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyUkJVizjO57BClGGgFWYYxpZC/sdGDzivTkPv13h3Lvtg/Z6Cn+vCP4VrRltHZScw6zYP8YiHB879Uj6uBeqBaPVMVx8BKPlLzzVVQzKfEUWyiNRXHut0L+IAm6zjyQP32a0dPYP53nAneMeFIVsvkSBfByAGvr7fGApn8Bcdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KNA3uOil; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KNA3uOil"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA8BF1F000E9;
	Fri, 10 Jul 2026 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783695581;
	bh=k3R004eU3w4K0NsJlMEUiQB/E/UHlcuFZx3rZRDDzDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KNA3uOilBcLKYq/sAshfROskVxqWX+m9dkjJt9yhCDImLo/RK3gjRytMHNgFQtW+1
	 KcpEi5/pvKppVAeZqBWsTcDEC8GV5aPgwVDgEoPay9Gv+sbbzeZXBnh2UF/4E4hNXf
	 pWwZi4cXVSQVdVj+28VY4kvkfCSOgPRpEZQueDSk=
Date: Fri, 10 Jul 2026 16:59:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: jahnavimn@google.com
Cc: Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/7] rust_binder: Add dynamic debug logging mask
Message-ID: <2026071054-hazing-antirust-8e40@gregkh>
References: <20260710-rust_binder_debug_mask-v2-0-2846410e3ae6@google.com>
 <20260710-rust_binder_debug_mask-v2-1-2846410e3ae6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-rust_binder_debug_mask-v2-1-2846410e3ae6@google.com>

On Fri, Jul 10, 2026 at 02:32:52PM +0000, Jahnavi MN via B4 Relay wrote:
> From: Jahnavi MN <jahnavimn@google.com>
> 
> Implement a dynamic debug logging mask (`debug_mask`) for the
> `rust_binder` module to allow dynamic runtime configuration of log
> levels. This enables parity with the legacy C driver's debug mask.
> 
> Since the Rust `module!` macro in the current kernel build does not yet
> support declaring module parameters directly in Rust, we define the
> `debug_mask` variable in a C companion file to expose it to the kernel
> runtime and import it using FFI with volatile reads.
> 
> To verify the setup, instrument process lifecycle events (open, flush,
> and release) in `process.rs` under the new `BINDER_DEBUG_OPEN_CLOSE`
> logging mask. These entry-point events are chosen for initial validation
> because they represent the start of the Binder lifecycle and occur
> at low frequency, allowing simple runtime verification of the dynamic
> toggle without log noise.
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>
> ---
>  drivers/android/binder/debug.rs            | 80 ++++++++++++++++++++++++++++++
>  drivers/android/binder/process.rs          |  7 ++-
>  drivers/android/binder/rust_binder_main.rs |  2 +
>  drivers/android/binder/rust_binderfs.c     |  3 ++
>  rust/kernel/task.rs                        |  7 +++
>  5 files changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/android/binder/debug.rs b/drivers/android/binder/debug.rs
> new file mode 100644
> index 000000000000..da48bce3df54
> --- /dev/null
> +++ b/drivers/android/binder/debug.rs
> @@ -0,0 +1,80 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2026 Google LLC.
> +
> +//! Binder debugging helpers.
> +
> +#![allow(dead_code)]
> +
> +kernel::impl_flags!(
> +    /// Represents multiple debug mask flags.
> +    #[derive(Debug, Clone, Default, Copy, PartialEq, Eq)]
> +    pub struct DebugMasks(u32);
> +
> +    /// Represents a single debug mask category.
> +    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
> +    pub enum DebugMask {
> +        UserError = 1 << 0,
> +        FailedTransaction = 1 << 1,
> +        DeadTransaction = 1 << 2,
> +        OpenClose = 1 << 3,
> +        DeadBinder = 1 << 4,
> +        DeathNotification = 1 << 5,
> +        ReadWrite = 1 << 6,
> +        UserRefs = 1 << 7,
> +        Threads = 1 << 8,
> +        Transaction = 1 << 9,
> +        TransactionComplete = 1 << 10,
> +        FreeBuffer = 1 << 11,
> +        InternalRefs = 1 << 12,
> +        PriorityCap = 1 << 13,
> +        Spinlocks = 1 << 14,

Not an objection, but don't we have the equivalent of the BIT() macro in
rust?  I think that's what this should be using if we do...

thanks,

greg k-h
