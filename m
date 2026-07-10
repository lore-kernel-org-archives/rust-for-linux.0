Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D475B38F926
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 19:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783712834; cv=none; b=Ftps1IHkL4AXykrPwikLX/cacrvVNIh7v3+9nfVP9Vt0IaE3we8GieM7x23WFWC94XE4foMi6G7xTWSoc0pfOdE67s+aD5Jc13SeRg0Lh6KVsenlxjTqFpxdGhSgHNkuRY4phB8/Tou+ISi7rfQaQrKtTftC/HuEgskv/e1CVUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783712834; c=relaxed/simple;
	bh=/6ZFlyF2u8YZXQDVe+9p51Y+eSDbo/i4HiDhXUU738g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9gGGI3lXMmpmEtzbnlVklvMKdYO7xFJy7QmITR5EzpIoxFu65NhlvY9hC01/eS2RIQgl5/SJPGoBSPNVT8Y+wxPGBfuutJbgLeiNzIFUP9HYIQNNIIymserKLwKQVeQzJeliozWJpO1vZBe7zTKGyliW3ayV2Qfp17Amv9Qrbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RW2oKJEk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RW2oKJEk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cacef7d299so23105ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 12:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783712832; x=1784317632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CGpDTWyhH4xrOTpV3gYMpAtM3fyjq8FwoLgexTgA66c=;
        b=RW2oKJEk/qfM+M2+GNfv3orzLPznSjfKKGZR7oaWw4Eak+4YgIJ69TYSCsGursbQSM
         HKAmGRssGQlCa8DAwdJWMGJndKZZAZ74THhXn99VbZOxfXuiqjJ38U1ZV5Pky6xvDBHc
         g3Yhy/8P+fEucPUx5bQd6sNHSeet6nK7RR+e1+YxPzUeNX1V8WufInRLSFGdltp/aQ7l
         By5jJpkXKvvjbeiouWy4Xv9lwGji5OkWS/pWDoDvZFkwIjawDNnfT4qixTBP+fVWgwg7
         3uDQhSKwWZdeKQMugxmyWcO8SahOGhmzoaUKw9M3hzWOjrk3HjAklJcACWMTXzpitww9
         3zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783712832; x=1784317632;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGpDTWyhH4xrOTpV3gYMpAtM3fyjq8FwoLgexTgA66c=;
        b=S/1f1QkORdX5wISRcQXrsmisv0nLmoFC7uiNDJwbt7zavw6M4VV76nB+TZD/kIkWKy
         L4G9TpBezl8vK3bYp+MuikHH0INEFA1vmFf7Jm7rvyhUNxBvDoYuvp2Rp+EvXTUFOzM3
         uD4igkbtrqXlKN86W1ppkr7pPFqap4ifQh8Phrl1DXePLfc8EuLz0aJNS7vbOgAo3dGG
         uuZBGnAAg0CSpXFpebculrjC/4qcEA4Gxo2bW2E/JG847SvWSEYOEpVFjmbJDxdNO3Ii
         XNHGNBEHGLgHBH7wiIANwjz5LRsXDvrHs3XLiDFyDgSKPUVXYX+A2TzxbBdwQ+IyXAbQ
         D9xA==
X-Forwarded-Encrypted: i=1; AHgh+Rosj3DLYT4zbVC+atvBBkRACeCEHbn+u7xAswxrkpawNa4EPY9AUFqTvJVOlFyhSO76OxI3vgY6pGMphChNKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHMQK/b3agz2vBJZEC0CHKT7r4huutpoiT0pT22To95mL9ADOe
	rDg+L2eUFhB0yKG+N7advtZ9kBUudTutnmWQV/Uz019wGUvXhBHWi1EjU2Qnn6XAmQ==
X-Gm-Gg: AfdE7ck/uI55mB9iJGFwM7HfkEPbSvO5WIomOfDcnKWssRX7Ed7YuXk+LrcgJHLT3Gz
	sFDBXRnOo3DftYq4k/+SHWfTQyAVfZqwSi97567nbgr6Zz7cpadMSIbA59xkYgtNecaSRdg/7XH
	9KKbt4gWTyprLeGZQhSVWvp0Z2K5FCjWwbIUVzRyT0zdGMbAPqn/7FhWcLJbjyace/cCqazZbHA
	Zd/MkoIwbGEY1nEgnOot7JythXm6+BQHshsMcQbw3QE3mc4XTZH0ZXyEmQ9LnTAichirnDHMp3t
	HT8o4chVdcyEWeMdAVNJG8OM1PCIYF0AU9J/X3B7dkbpmlMwerJvRAftaezYUitQEaXPmLGhs6c
	wZN2ggezJMimuw+/1eMBY4UAUvvxtvv4Nf1sKDHS1a31Tei9fxoAPbieEu/L2qh9/Nzywa302C3
	VCP59FCISTcrelCUM6x1CpWyte5K3GLXMWv9dxz5jQYuLpu1wLr2U7ebDRt8HFGFLlVP/6QJj+1
	u5AqkB5aQ7snewKKb+LS9pQf8ZisKZswz3o
X-Received: by 2002:a17:902:e88b:b0:2c7:9e6a:1a8d with SMTP id d9443c01a7336-2ce9eaeca48mr695745ad.12.1783712831478;
        Fri, 10 Jul 2026 12:47:11 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11280409sm924921a91.0.2026.07.10.12.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 12:47:10 -0700 (PDT)
Date: Fri, 10 Jul 2026 19:47:05 +0000
From: Carlos Llamas <cmllamas@google.com>
To: jahnavimn@google.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <brauner@kernel.org>,
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
Message-ID: <alFMOYlB24vuOxP2@google.com>
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

Yeah, declaring it under rust_binderfs.c is not great but I guess we
don't have any other alternative for now. So this is fine.

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

Where is this being used? I can't find it on subsequent patches.
Maybe leftover from previous implementation?

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
> +    }
> +);
> +
> +extern "C" {
> +    // Declared as static mut because the value is mutated dynamically by C sysfs.
> +    static mut rust_binder_debug_mask: u32;
> +}
> +
> +/// Checks if the given debug logging category is enabled in the mask.
> +pub(crate) fn debug_mask_enabled(mask: DebugMask) -> bool {
> +    // SAFETY: `rust_binder_debug_mask` is defined in C and can be mutated at any time.
> +    // We read it via volatile to ensure we fetch the current value from memory.
> +    let current_mask = unsafe { core::ptr::read_volatile(&raw const rust_binder_debug_mask) };
> +    (current_mask & (mask as u32)) != 0
> +}
> +
> +/// Prints a debug log if the specified mask category is enabled.
> +#[macro_export]
> +macro_rules! binder_debug {
> +    // 1. Internal helper rule to do the raw print.
> +    (raw, $($arg:tt)*) => {
> +        kernel::pr_info!($($arg)*);
> +    };
> +
> +    // 2. Rule to explicitly specify a PID (used in kworkers).
> +    (pid=$pid:expr, $mask:ident, $($arg:tt)*) => {
> +        if $crate::debug::debug_mask_enabled($crate::debug::DebugMask::$mask) {
> +            $crate::binder_debug!(
> +                raw,
> +                "{}: {}\n",
> +                $pid,
> +                kernel::prelude::fmt!($($arg)*)
> +            );
> +        }
> +    };
> +
> +    // 3. Default rule (automatically prepends "PID:TID" of the current calling thread).

Adding the pid:tid implicitly is a good idea. Nice!


> +    ($mask:ident, $($arg:tt)*) => {
> +        if $crate::debug::debug_mask_enabled($crate::debug::DebugMask::$mask) {
> +            let thread = kernel::current!();
> +            $crate::binder_debug!(
> +                raw,
> +                "{}:{} {}\n",
> +                thread.tgid(),
> +                thread.pid(),
> +                kernel::prelude::fmt!($($arg)*)
> +            );
> +        }
> +    };
> +}
> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index f855d8d9818c..836a0db92354 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -1349,6 +1349,7 @@ pub(crate) fn lock_with_nodes(&self) -> WithNodes<'_> {
>      }
>  
>      fn deferred_flush(&self) {
> +        binder_debug!(pid=self.task.pid(), OpenClose, "flushing process");
>          let inner = self.inner.lock();
>          for thread in inner.threads.values() {
>              thread.exit_looper();
> @@ -1356,6 +1357,8 @@ fn deferred_flush(&self) {
>      }
>  
>      fn deferred_release(self: Arc<Self>) {
> +        binder_debug!(pid=self.task.pid(), OpenClose, "releasing process");
> +
>          let is_manager = {
>              let mut inner = self.inner.lock();
>              inner.is_dead = true;
> @@ -1658,7 +1661,9 @@ fn ioctl_write_read(
>  /// The file operations supported by `Process`.
>  impl Process {
>      pub(crate) fn open(ctx: ArcBorrow<'_, Context>, file: &File) -> Result<Arc<Process>> {
> -        Self::new(ctx.into(), ARef::from(file.cred()))
> +        let proc = Self::new(ctx.into(), ARef::from(file.cred()))?;
> +        binder_debug!(OpenClose, "opened process");
> +        Ok(proc)
>      }
>  
>      pub(crate) fn release(this: Arc<Process>, _file: &File) {
> diff --git a/drivers/android/binder/rust_binder_main.rs b/drivers/android/binder/rust_binder_main.rs
> index df47aba05133..995e6131bb77 100644
> --- a/drivers/android/binder/rust_binder_main.rs
> +++ b/drivers/android/binder/rust_binder_main.rs
> @@ -31,6 +31,8 @@
>  mod context;
>  mod deferred_close;
>  mod defs;
> +#[macro_use]
> +mod debug;
>  mod error;
>  mod netlink;
>  mod node;
> diff --git a/drivers/android/binder/rust_binderfs.c b/drivers/android/binder/rust_binderfs.c
> index ade1c4d92499..fa8b38465550 100644
> --- a/drivers/android/binder/rust_binderfs.c
> +++ b/drivers/android/binder/rust_binderfs.c
> @@ -51,6 +51,9 @@ DEFINE_SHOW_ATTRIBUTE(rust_binder_proc);
>  char *rust_binder_devices_param = CONFIG_ANDROID_BINDER_DEVICES;
>  module_param_named(rust_devices, rust_binder_devices_param, charp, 0444);
>  
> +u32 rust_binder_debug_mask = 7;

hmm, I'm not sure about this magic number. Do you think we can
initialize on the rust end at init()? Or at least a comment about what
flags we are setting as default here?

> +module_param_named(debug_mask, rust_binder_debug_mask, uint, 0644);
> +
>  static dev_t binderfs_dev;
>  static DEFINE_MUTEX(binderfs_minors_mutex);
>  static DEFINE_IDA(binderfs_minors);
> diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> index 38273f4eedb5..1b290c61714d 100644
> --- a/rust/kernel/task.rs
> +++ b/rust/kernel/task.rs
> @@ -210,6 +210,13 @@ pub fn pid(&self) -> Pid {
>          unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
>      }
>  
> +    /// Returns the TGID (Thread Group ID / Process ID) of the given task.
> +    pub fn tgid(&self) -> Pid {
> +        // SAFETY: The tgid of a task never changes after initialization, so reading this field is
> +        // not a data race.
> +        unsafe { *ptr::addr_of!((*self.as_ptr()).tgid) }
> +    }
> +
>      /// Returns the UID of the given task.
>      #[inline]
>      pub fn uid(&self) -> Kuid {
> 
> -- 

Only a few optional suggestions so...

Reviewed-by: Carlos Llamas <cmllamas@google.com>
