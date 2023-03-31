Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B4F2C6FD18
	for <rust-for-linux@archiver.kernel.org>; Fri, 31 Mar 2023 12:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbjCaM4X (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 31 Mar 2023 08:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbjCaM4W (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 31 Mar 2023 08:56:22 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 710DD2D41
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Mar 2023 05:56:18 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id d11-20020a05600c3acb00b003ef6e6754c5so9815048wms.5
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Mar 2023 05:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1680267377;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=qy9odNc7Scj+5TiOlDP0T3cAFFMFZ3rDfYoS+BvKg+w=;
        b=JprhLA8hniC9SOCj04aIGvzlLKmPCOP2lImGQhZNDGXIc/CQvs80gzo5NwQm0AfQMq
         jqSHKWdzxkduFKHDvm5iMp5U72c6OCDOdrkUyGVrSMPIs8PGYkEPXXZFpduwrXyHoHmU
         91uKdySJ0nYMbAaYl6fwsL9JtUIvBK5k4vQFOuKc8fnQ6p+J0TyDUC/PwG1qEhnVkLkX
         92VNiqLwn71W6fCPs5ZQ+OO2+nF8AQbzkgtZIYtzSfVTZHz1MIqtqWpLxr8LvG2xm+a7
         kR/ArBi7a68EdBbdOIlxB1jZSXvh+yl16ROIC1KG72n24/+2tyAZtvvQoMdlMQeN6z+3
         KUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680267377;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qy9odNc7Scj+5TiOlDP0T3cAFFMFZ3rDfYoS+BvKg+w=;
        b=n7fVZtCJVW1a0vwgDfrX4JkESxd0mcV39ZzRKtwssmuG1JhU7dFWbzttRicsQhhHiS
         6WwOe3BiXr7xwt/YVavXGvqK6jgAM52M1ZMvXdFq58pMuF0aI+zKRQoxNsPbIqe/R86U
         laNluYMda3AAXSwjIN232ZSusoOVAyZT0Q+SQd6mMCZLE+/sfC9PMGoJUdAI7sRSkyjG
         0gamII8f+XyyAM+u0Dt+R9aN5ArAjS7EgVq19FVARjBn9YH5zjoAA11sTVD+4jcCpk8N
         /yO+fxFYk3eJjyj5jIidA3im+pIqKLwmK+UbnGGWlDgBlntq7DyOzNuDO1tId846v8Gt
         Gpag==
X-Gm-Message-State: AAQBX9che24Tn2GHSMVxGYKW9Sb7OfSicIoAggZYqJ1YXZWztky/Ll7w
        Q5CM1vH9b57hSLk0Id1NXkbIOA==
X-Google-Smtp-Source: AKy350b8JaK/LUMjIZyJBVmThlTMuqtpz3dt2/+UBqzqgf31jzd67DE+PCCXQJyJrhKscgDM0K8Tsg==
X-Received: by 2002:a1c:c913:0:b0:3ef:acf6:f815 with SMTP id f19-20020a1cc913000000b003efacf6f815mr7627289wmb.32.1680267376881;
        Fri, 31 Mar 2023 05:56:16 -0700 (PDT)
Received: from localhost ([165.225.195.122])
        by smtp.gmail.com with ESMTPSA id z3-20020a05600c0a0300b003ee6aa4e6a9sm10282085wmp.5.2023.03.31.05.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:56:16 -0700 (PDT)
References: <20230329223239.138757-12-y86-dev@protonmail.com>
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
Subject: Re: [PATCH v3 11/13] rust: types: add common init-helper functions
 for `Opaque`
Date:   Fri, 31 Mar 2023 14:55:44 +0200
In-reply-to: <20230329223239.138757-12-y86-dev@protonmail.com>
Message-ID: <877cux2i6n.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


y86-dev@protonmail.com writes:

> From: Benno Lossin <y86-dev@protonmail.com>
>
> Add helper functions to more easily initialize `Opaque<T>` via FFI and
> rust raw initializer functions.
> These functions take a function pointer to the FFI/raw initialization
> function and take between 0-4 other arguments. It then returns an
> initializer that uses the FFI/raw initialization function along with the
> given arguments to initialize an `Opaque<T>`.
>
> Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/init.rs  |  9 +++++++++
>  rust/kernel/types.rs | 47 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>
> diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
> index a923546696ce..485970b6522d 100644
> --- a/rust/kernel/init.rs
> +++ b/rust/kernel/init.rs
> @@ -177,6 +177,14 @@
>  //! }
>  //! ```
>  //!
> +//! For the special case where initializing a field is a single FFI-function call that cannot fail,
> +//! there exist helper functions [`Opaque::ffi_init`]. These functions initialize a single
> +//! [`Opaque`] field by just delegating to the FFI-function. You can use these in combination with
> +//! [`pin_init!`].
> +//!
> +//! For more information on how to use [`pin_init_from_closure()`], take a look at the uses inside
> +//! the `kernel` crate. The [`sync`] module is a good starting point.
> +//!
>  //! [`sync`]: kernel::sync
>  //! [pinning]: https://doc.rust-lang.org/std/pin/index.html
>  //! [structurally pinned fields]:
> @@ -187,6 +195,7 @@
>  //! [`impl PinInit<T, E>`]: PinInit
>  //! [`impl Init<T, E>`]: Init
>  //! [`Opaque`]: kernel::types::Opaque
> +//! [`Opaque::ffi_init`]: kernel::types::Opaque::ffi_init
>  //! [`pin_data`]: ::macros::pin_data
>
>  use crate::{
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index ff2b2fac951d..dbfae9bb97ce 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -2,6 +2,7 @@
>
>  //! Kernel types.
>
> +use crate::init::{self, PinInit};
>  use alloc::boxed::Box;
>  use core::{
>      cell::UnsafeCell,
> @@ -248,6 +249,52 @@ impl<T> Opaque<T> {
>      }
>  }
>
> +macro_rules! opaque_init_funcs {
> +    ($($abi:literal $name:ident($($arg_name:ident: $arg_typ:ident),*);)*) => {
> +        impl<T> Opaque<T> {
> +            $(
> +                /// Create an initializer using the given initializer function.
> +                ///
> +                /// # Safety
> +                ///
> +                /// The given function **must** under all circumstances initialize the memory
> +                /// location to a valid `T`. If it fails to do so it results in UB.
> +                ///
> +                /// If any parameters are given, those need to be valid for the function. Valid
> +                /// means that calling the function with those parameters complies with the above
> +                /// requirement **and** every other requirement on the function itself.
> +                pub unsafe fn $name<$($arg_typ),*>(
> +                    init_func: unsafe extern $abi fn(*mut T $(, $arg_typ)*),
> +                    $($arg_name: $arg_typ,)*
> +                ) -> impl PinInit<Self> {
> +                    // SAFETY: The safety contract of this function ensures that `init_func` fully
> +                    // initializes `slot`.
> +                    unsafe {
> +                        init::pin_init_from_closure(move |slot| {
> +                            init_func(Self::raw_get(slot) $(, $arg_name)*);
> +                            Ok(())
> +                        })
> +                    }
> +                }
> +            )*
> +        }
> +    }
> +}
> +
> +opaque_init_funcs! {
> +    "C" ffi_init();
> +    "C" ffi_init1(arg1: A1);
> +    "C" ffi_init2(arg1: A1, arg2: A2);
> +    "C" ffi_init3(arg1: A1, arg2: A2, arg3: A3);
> +    "C" ffi_init4(arg1: A1, arg2: A2, arg3: A3, arg4: A4);
> +
> +    "Rust" manual_init();
> +    "Rust" manual_init1(arg1: A1);
> +    "Rust" manual_init2(arg1: A1, arg2: A2);
> +    "Rust" manual_init3(arg1: A1, arg2: A2, arg3: A3);
> +    "Rust" manual_init4(arg1: A1, arg2: A2, arg3: A3, arg4: A4);
> +}
> +
>  /// A sum type that always holds either a value of type `L` or `R`.
>  pub enum Either<L, R> {
>      /// Constructs an instance of [`Either`] containing a value of type `L`.

