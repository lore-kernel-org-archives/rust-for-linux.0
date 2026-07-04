Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DB8184540
	for <rust-for-linux@vger.kernel.org>; Sat,  4 Jul 2026 21:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783199004; cv=none; b=egsbkBFgzF3Y6Y1jr9ApX3Czp7Ulf3Jc2pjQs2oUgQKkbHY6bMASjTlOD9yxVgMXCk/acQKLIPETYauN/0Uo9jHDvYyJHGgUZh9iHZD43AYZIH5PxrmpM7C9C9HPNIaSssWar3nBrz/ttbuu3pNdPe6L8kY8t8ah4KmbhC4ZoAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783199004; c=relaxed/simple;
	bh=Ck4JJaZmgkoCl/I+djI8TbJbk2wJ29zl60Y1stgczUA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tUJu3A6HrEveCWWBySpsqdOdxeRdvAoGnTH+1KB1k9hd89yp+buzEpumMPIoByOEB8sW8+/Z31d5LVB0Af7lt2r6H8de96qBMqbwUnTs0Nq41IEF/7bK4EFYD8199LHRQYQkYMwHVWCDSwO+S7CSHFHMzvtipIga1BJz1n0Qz44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vU6DJ9Ug; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vU6DJ9Ug"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-697d51ced1cso1595887a12.1
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Jul 2026 14:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783199001; x=1783803801; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ug4GAW6hRxP0V0DrpHgPLZXGFh1mzzQejcgwIy96G7s=;
        b=vU6DJ9Ug18ETh0nOMy9EYiHEtqsG9HWS//Q70llrG9vFSWApsKZVEhO5iQPvhtR32r
         R5vkFh9mS7IUo/rc8nZffdFEzpjU953LxYM2K+Dojmd3jgjp7Es28+22lHCVW26l4QKC
         YQsX0DndmI4Y85Dse++KvXxACqUxUO9WgWXXtxh3dW1C2KdrM65+jlvQzmhI0gDsFZxP
         iQR6D39NFRWrNMq24xX2rWmlQd23gb7V0NHCo/yuy8A3z21UbmB44HP0XMwdX3SbZrqC
         nIS0+PyYte82bJ4HILWbmNeP5jHDx9IvN57AQGxGz1TNFID1sz8Q/1aaTfMLderjrlvX
         iKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783199001; x=1783803801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ug4GAW6hRxP0V0DrpHgPLZXGFh1mzzQejcgwIy96G7s=;
        b=Z/qIdM/IT7mis8kcb2o7NB5vXPHpSo112DgcR3vHsZB4gQcfnswGjWcY4vBx0Pj8Ov
         31cE78tcmuvqD6whoce2uSqw/RsZ29ZwcZjly8GKOWKnDK6uTVcSqh3jnn5gNlFkFPZp
         l7J4LkrvFX802DzkYrje07XkTYDNdTANesL+ZQ5tIcIY2KeoQJWL4GYqyFo9X6RTtUV3
         KE+1GUZcPWHEoikBz5xRngAVOrUkaebrwLUK0baiHxwacgG8rO7dWPXLUo5E7hIcU2rf
         hbWQ4Xl/1bkwUlPrte3c1/5pKDpVUgywIEgHKkiCCEAt/MmGynq4HJVwIucW1zsml3d5
         qK1Q==
X-Forwarded-Encrypted: i=1; AHgh+Ros2v96MyhllVbHT8hPw3Lr2oFWar80gnWDa9p9aJ6uLR+QSoriWISlTXfztWowxlAz1Gglx0W4VgK3YOQ7cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRtwNMbV9DB+O7ZaG5U5RBkF+a27zY5lMjSiOrNX3kea4zM6da
	xMwXKW8rg9oZh816glHuAWEr/hVmiMG6aBFPkEUmmJjGquMIehtpWpLKYx1YWEdaOTD0kwXaSOk
	mj0MkXghshTJIRAx2YQ==
X-Received: from ejju21.prod.google.com ([2002:a17:906:4095:b0:c12:4bf3:86c1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:ba8c:b0:c12:8798:7bf9 with SMTP id a640c23a62f3a-c12e6c1ec1dmr126199966b.46.1783199000441;
 Sat, 04 Jul 2026 14:03:20 -0700 (PDT)
Date: Sat, 4 Jul 2026 21:03:19 +0000
In-Reply-To: <20260703-rust_binder_debug_mask-v1-1-9bdf12b5325c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-rust_binder_debug_mask-v1-0-9bdf12b5325c@google.com> <20260703-rust_binder_debug_mask-v1-1-9bdf12b5325c@google.com>
Message-ID: <akl1F-3IiZYnHEcX@google.com>
Subject: Re: [PATCH 1/7] rust_binder: Add dynamic debug logging mask
From: Alice Ryhl <aliceryhl@google.com>
To: Jahnavi MN <jahnavimn@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 03, 2026 at 03:29:22PM +0000, Jahnavi MN wrote:
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

> diff --git a/drivers/android/binder/process.rs b/drivers/android/binder/process.rs
> index 96b8440ceac6..c13a04a3afcb 100644
> --- a/drivers/android/binder/process.rs
> +++ b/drivers/android/binder/process.rs
> @@ -898,7 +898,6 @@ pub(crate) fn insert_or_update_handle(
>      }
>  
>      pub(crate) fn get_transaction_node(&self, handle: u32) -> BinderResult<NodeRef> {
> -        // When handle is zero, try to get the context manager.
>          if handle == 0 {
>              Ok(self.ctx.get_manager_node(true)?)
>          } else {

Removing this comment appears to be a spurious change.

> @@ -1314,6 +1313,11 @@ pub(crate) fn lock_with_nodes(&self) -> WithNodes<'_> {
>      }
>  
>      fn deferred_flush(&self) {
> +        binder_debug!(
> +            crate::debug::BINDER_DEBUG_OPEN_CLOSE,
> +            "binder_flush: process {}",
> +            self.pid_in_current_ns()
> +        );
>          let inner = self.inner.lock();
>          for thread in inner.threads.values() {
>              thread.exit_looper();
> @@ -1321,6 +1325,11 @@ fn deferred_flush(&self) {
>      }
>  
>      fn deferred_release(self: Arc<Self>) {
> +        binder_debug!(
> +            crate::debug::BINDER_DEBUG_OPEN_CLOSE,
> +            "binder_deferred_release: process {}",
> +            self.pid_in_current_ns()
> +        );

Since you included the pid in the binder_debug! macro itself, you can
remove it from these two println statements.

Also, I think it'd be nicer to word these as "flushing process" and
"releasing process".

> diff --git a/drivers/android/binder/thread.rs b/drivers/android/binder/thread.rs
> index 97d5f31e8fe3..c908dde5796a 100644
> --- a/drivers/android/binder/thread.rs
> +++ b/drivers/android/binder/thread.rs
> @@ -1222,6 +1222,7 @@ fn read_transaction_info(
>          info.buffers_size = td.buffers_size as usize;
>          // SAFETY: Above `read` call initializes all bytes, so this union read is ok.
>          info.target_handle = unsafe { td.transaction_data.target.handle };
> +        info.debug_id = super::next_debug_id();
>          Ok(())
>      }
>  
> diff --git a/drivers/android/binder/transaction.rs b/drivers/android/binder/transaction.rs
> index 1d9b66920a21..f9285eb93fc0 100644
> --- a/drivers/android/binder/transaction.rs
> +++ b/drivers/android/binder/transaction.rs
> @@ -42,6 +42,7 @@ pub(crate) struct TransactionInfo {
>      pub(crate) reply: u32,
>      pub(crate) oneway_spam_suspect: bool,
>      pub(crate) is_reply: bool,
> +    pub(crate) debug_id: usize,
>  }
>  
>  impl TransactionInfo {
> @@ -93,7 +94,7 @@ pub(crate) fn new(
>          from: &Arc<Thread>,
>          info: &mut TransactionInfo,
>      ) -> BinderResult<DLArc<Self>> {
> -        let debug_id = super::next_debug_id();
> +        let debug_id = info.debug_id;
>          let allow_fds = node_ref.node.flags & FLAT_BINDER_FLAG_ACCEPTS_FDS != 0;
>          let txn_security_ctx = node_ref.node.flags & FLAT_BINDER_FLAG_TXN_SECURITY_CTX != 0;
>          let mut txn_security_ctx_off = if txn_security_ctx { Some(0) } else { None };
> @@ -152,7 +153,7 @@ pub(crate) fn new_reply(
>          info: &mut TransactionInfo,
>          allow_fds: bool,
>      ) -> BinderResult<DLArc<Self>> {
> -        let debug_id = super::next_debug_id();
> +        let debug_id = info.debug_id;

It looks like this change to move debug_id so that it's present in
TransactionInfo is happening in the wrong patch. Ideally this change
would be part of the patch that actually needs to read debug_id from
TransactionInfo.

Alice
