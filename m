Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F3BC636D3
	for <rust-for-linux@archiver.kernel.org>; Wed,  1 Feb 2023 10:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbjBAKf5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 1 Feb 2023 05:35:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbjBAKf5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 1 Feb 2023 05:35:57 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582635898B
        for <rust-for-linux@vger.kernel.org>; Wed,  1 Feb 2023 02:35:55 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so50077099ejc.4
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Feb 2023 02:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=aSHKCE9vJDcU6FD7uBVxN+faUF9zdCQJNIAv8u5C1R8=;
        b=DUABZjJxTjMTArmt5AilcvhMfi/ZzdMLhADxcEMvvzsfRVtsrZ+CwUPxUfEtGR3rmT
         11LQ6AMy29373ZOcBZpYICqmSSw+zG5cK809rmRh3iXJjDJ64VFb9frqCR/yUuZV/s56
         QSlPYP3Ou4e1J+yh0pdeYYkODo6BMwtXimdivq1sbQuRMJUPxlEucoIdE87UM49L/zke
         cXZJtd+hO+xlOQXPU+RQJ2qdN/V35pNa2fn4bTzjsekCtbR6IQO+vp2ZbJFcThRX0hwq
         nyzDrfQYYZGuWehp563eUJTKVu6aMcbvsNrYwSiFtWauYhzTTxe2kt2UidfoPQtaNENM
         1x9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSHKCE9vJDcU6FD7uBVxN+faUF9zdCQJNIAv8u5C1R8=;
        b=vv/bFpuwbmyFsdmxAmcVsXmoP6zKmepctFtd+eHWSaLM15vmdTY8FCpytlWQQARu3t
         gdIySLYLcAC0YIJzQ+u7GR9afFy7Bh/oCN6wh+YOz2OrWwm+LQQj4yO2tFxj+mWBF3uZ
         kTqwBrbRzSnvEVH3Ki66WHsQ8aTdcIfUSfwK/uoromMuMw+iToVHxlqmGoB0QpOdCjMT
         E/tWAHdSUmKdEKms+ZlJb8QUdO68LMFfFz8kcwBarqBlGvGfk4VGJFmYT1HpOG4sNmVw
         qRj9eIMg237WwbiYm/xKTELqt1BVpkX2FQ6Mt+PMK8zqdAJVcp4IXcteno5+Y+Nnh7I3
         thlg==
X-Gm-Message-State: AO0yUKUsMtIkZEL8w8W6ojhtZgoE56s06D7ZtFhzX0f4Ik6S8g85gm1w
        lOV3FN3TH10yYY4J6eiyP2uRdA==
X-Google-Smtp-Source: AK7set+fsG7o4K0HNSeLZhFcCnBgSznqi+fResUXsIDQBgxMYEkfQSbBWKyjnJA+nWSPM4KYC0GB6g==
X-Received: by 2002:a17:906:5450:b0:887:31c8:9794 with SMTP id d16-20020a170906545000b0088731c89794mr1749511ejp.37.1675247753823;
        Wed, 01 Feb 2023 02:35:53 -0800 (PST)
Received: from localhost ([79.142.230.49])
        by smtp.gmail.com with ESMTPSA id n3-20020a05640204c300b004a23609fab4sm5411014edw.70.2023.02.01.02.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 02:35:53 -0800 (PST)
References: <20230130064404.744600-1-wedsonaf@gmail.com>
 <20230130064404.744600-5-wedsonaf@gmail.com>
User-agent: mu4e 1.9.18; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        linux-kernel@vger.kernel.org,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>,
        Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>,
        Andreas Hindborg <a.hindborg@samsung.com>
Subject: Re: [PATCH v2 5/5] rust: types: implement `ForeignOwnable` for
 `Arc<T>`
Date:   Wed, 01 Feb 2023 11:17:16 +0100
In-reply-to: <20230130064404.744600-5-wedsonaf@gmail.com>
Message-ID: <87h6w5isfq.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Wedson Almeida Filho <wedsonaf@gmail.com> writes:

> This allows us to hand ownership of Rust ref-counted objects to
> the C side of the kernel.
>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
> Reviewed-by: Alice Ferrazzi <alice.ferrazzi@miraclelinux.com>
> ---
> v1 -> v2: Unmodified
>
>  rust/kernel/sync/arc.rs | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index ff73f9240ca1..519a6ec43644 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -15,7 +15,11 @@
>  //!
>  //! [`Arc`]: https://doc.rust-lang.org/std/sync/struct.Arc.html
>  
> -use crate::{bindings, error::Result, types::Opaque};
> +use crate::{
> +    bindings,
> +    error::Result,
> +    types::{ForeignOwnable, Opaque},
> +};
>  use alloc::boxed::Box;
>  use core::{
>      marker::{PhantomData, Unsize},
> @@ -189,6 +193,32 @@ impl<T: ?Sized> Arc<T> {
>      }
>  }
>  
> +impl<T: 'static> ForeignOwnable for Arc<T> {
> +    type Borrowed<'a> = ArcBorrow<'a, T>;
> +
> +    fn into_foreign(self) -> *const core::ffi::c_void {
> +        ManuallyDrop::new(self).ptr.as_ptr() as _
> +    }
> +
> +    unsafe fn borrow<'a>(ptr: *const core::ffi::c_void) -> ArcBorrow<'a, T> {
> +        // SAFETY: By the safety requirement of this function, we know that `ptr` came from
> +        // a previous call to `Arc::into_foreign`.
> +        let inner = NonNull::new(ptr as *mut ArcInner<T>).unwrap();
> +
> +        // SAFETY: The safety requirements of `from_foreign` ensure that the object remains alive
> +        // for the lifetime of the returned value. Additionally, the safety requirements of
> +        // `ForeignOwnable::borrow_mut` ensure that no new mutable references are created.
> +        unsafe { ArcBorrow::new(inner) }
> +    }
> +
> +    unsafe fn from_foreign(ptr: *const core::ffi::c_void) -> Self {
> +        // SAFETY: By the safety requirement of this function, we know that `ptr` came from
> +        // a previous call to `Arc::into_foreign`, which owned guarantees that `ptr` is valid and
> +        // owns a reference.

The last part of the sentence does not read clearly to me. Would this
make sense instead:

// SAFETY: By the safety requirement of this function, we know that `ptr` came from
// a previous call to `Arc::into_foreign`, which guarantees that `ptr` is valid and
// holds a reference count increment that is transferrable to us.

> +        unsafe { Self::from_inner(NonNull::new(ptr as _).unwrap()) }
> +    }
> +}
> +
>  impl<T: ?Sized> Deref for Arc<T> {
>      type Target = T;


Cheers,
Andreas
