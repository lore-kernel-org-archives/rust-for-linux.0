Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4129C76196
	for <rust-for-linux@archiver.kernel.org>; Fri, 31 Mar 2023 13:03:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232681AbjCaNDr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 31 Mar 2023 09:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbjCaNDq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 31 Mar 2023 09:03:46 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0026CA27B
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Mar 2023 06:03:44 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t4so17077920wra.7
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Mar 2023 06:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1680267823;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=nDWXEeZ/uffescHeQSMnMnwMWLgrz19ofXim1Y+HCJI=;
        b=lX3rTtbdKu1vFSdVWAWg2eJdqkpxKvBOZ8N9aru4GUYxwpnKmO4v5GkonTvRrgwTGR
         HfLeQ7BxHeMMVucPjj/49KxJb5bMkRD+5SoVmm8rD6srvx3qWvM7rqOFgys4i+PTDF+L
         UhUpNEsv4Cxbv9CXNVb5JesIHM28Z4EWp2H171ir/lUz8HCgoUlYKxlvBCqcqKFkE/Yc
         LJER3dRIKT8A6xTu1MTObKbLqvpKlIfK+uZ9r029ZaLyVZUiEgLYQZ5dcJiYULnewp63
         jKAUmnB2w8bY1SNxHX/4Kp/PWENfAa2kgoXENGpDzwbWJjxI5WdAva26gYqU2rshG1Bw
         deZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680267823;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDWXEeZ/uffescHeQSMnMnwMWLgrz19ofXim1Y+HCJI=;
        b=6d1DhSNJCdTZZz/7Y5s3rRKgib9o0x5kUCJ0+kHNwg9F5Am9KqhI+f02lbXME0Es/U
         jAcfxNmzHmeBuJ+lU6IT1P6j/e1ImRBTZSUXqB7iR4rKqtsXfZg+TvhBQ7lSH5OdVqbA
         QKMFHwjfLA2kfeloiFIQ7x0SuH3s4AZEqLwMFRdZXqJ6YmyufpqOeLBHeE9TkgQ8GJWA
         cHXiW0/cKW16PRfeqHmyO9GJHTvYqRCOpBKKhudujqTD6gjzzkp97Q0JiYj0LWE1byhH
         A3JvFyg0Zuv711wV18CjIVR7qQzwitrU+TNN/HND4Kv1RdxQXyN8Xx7KJZi4XctM1h7D
         4TJg==
X-Gm-Message-State: AAQBX9ezz2QUcWtr6bZVc/rx5yaD08jzX0T4+UUIwA6YkbThMZTyyYRz
        VEvizZeKDIrcI1PhYfEsCEu9Uw==
X-Google-Smtp-Source: AKy350ZZHCgT2mEkocVnvWxY7Ky32Zu24CV0Urt8TyunzkJdaWlOuvWE49D88zrNIH3z7838cgvajA==
X-Received: by 2002:a5d:6dcc:0:b0:2ce:ab76:cc8c with SMTP id d12-20020a5d6dcc000000b002ceab76cc8cmr7486660wrz.2.1680267823444;
        Fri, 31 Mar 2023 06:03:43 -0700 (PDT)
Received: from localhost ([165.225.194.194])
        by smtp.gmail.com with ESMTPSA id o5-20020adfcf05000000b002c592535839sm2183743wrj.17.2023.03.31.06.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 06:03:43 -0700 (PDT)
References: <20230329223239.138757-13-y86-dev@protonmail.com>
User-agent: mu4e 1.9.18; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     y86-dev@protonmail.com
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Alice Ryhl <alice@ryhl.io>, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Andreas Hindborg <a.hindborg@samsung.com>
Subject: Re: [PATCH v3 12/13] rust: sync: reduce stack usage of
 `UniqueArc::try_new_uninit`
Date:   Fri, 31 Mar 2023 15:03:13 +0200
In-reply-to: <20230329223239.138757-13-y86-dev@protonmail.com>
Message-ID: <87355l2hu9.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


y86-dev@protonmail.com writes:

> From: Benno Lossin <y86-dev@protonmail.com>
>
> `UniqueArc::try_new_uninit` calls `Arc::try_new(MaybeUninit::uninit())`.
> This results in the uninitialized memory being placed on the stack,
> which may be arbitrarily large due to the generic `T` and thus could
> cause a stack overflow for large types.
>
> Change the implementation to use the pin-init API which enables in-place
> initialization. In particular it avoids having to first construct and
> then move the uninitialized memory from the stack into the final location.
>
> Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
> ---

Reviewed-by Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/lib.rs      |  1 -
>  rust/kernel/sync/arc.rs | 14 ++++++++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 3e2777d26ff5..d9df77132fa2 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -27,7 +27,6 @@
>  #[cfg(not(CONFIG_RUST))]
>  compile_error!("Missing kernel configuration for conditional compilation");
>
> -#[allow(unused_extern_crates)]
>  // Allow proc-macros to refer to `::kernel` inside the `kernel` crate (this crate).
>  extern crate self as kernel;
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index 77a3833cc265..4ed6329a5e5f 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -18,6 +18,7 @@
>  use crate::{
>      bindings,
>      error::{Error, Result},
> +    init,
>      init::{InPlaceInit, Init, PinInit},
>      types::{ForeignOwnable, Opaque},
>  };
> @@ -29,6 +30,7 @@ use core::{
>      pin::Pin,
>      ptr::NonNull,
>  };
> +use macros::pin_data;
>
>  /// A reference-counted pointer to an instance of `T`.
>  ///
> @@ -121,6 +123,7 @@ pub struct Arc<T: ?Sized> {
>      _p: PhantomData<ArcInner<T>>,
>  }
>
> +#[pin_data]
>  #[repr(C)]
>  struct ArcInner<T: ?Sized> {
>      refcount: Opaque<bindings::refcount_t>,
> @@ -501,9 +504,16 @@ impl<T> UniqueArc<T> {
>
>      /// Tries to allocate a new [`UniqueArc`] instance whose contents are not initialised yet.
>      pub fn try_new_uninit() -> Result<UniqueArc<MaybeUninit<T>>> {
> -        Ok(UniqueArc::<MaybeUninit<T>> {
> +        // INVARIANT: The refcount is initialised to a non-zero value.
> +        let inner = Box::init(init!(ArcInner {
> +            // SAFETY: There are no safety requirements for this FFI call.
> +            refcount: Opaque::new(unsafe { bindings::REFCOUNT_INIT(1) }),
> +            data <- init::uninit(),
> +        }))?;
> +        Ok(UniqueArc {
>              // INVARIANT: The newly-created object has a ref-count of 1.
> -            inner: Arc::try_new(MaybeUninit::uninit())?,
> +            // SAFETY: The pointer from the `Box` is valid.
> +            inner: unsafe { Arc::from_inner(Box::leak(inner).into()) },
>          })
>      }
>  }

