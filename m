Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA28C761A6
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 Apr 2023 08:42:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjDCImC (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 Apr 2023 04:42:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbjDCIl7 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 Apr 2023 04:41:59 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8790FF76E
        for <rust-for-linux@vger.kernel.org>; Mon,  3 Apr 2023 01:41:49 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id x3so114034943edb.10
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Apr 2023 01:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1680511307;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=QTJlPe83VxVN/a/064MffW70nIdppbk/yJjbPFL4b3k=;
        b=2LfxvaU3LlfabrRlPEyZCExJAxNv+/yycGqARiUwnciKzD5fIHuqXS864XRArjAQ8h
         lrQgJcIOqR+nw3z3IjSxe4UmHBdCwwyGguBXplfv9d4bctz+iCX4NON6F6Y+bu+tje3z
         fFWiIybNVXTfUehTV5zfYnLaTG/mg4ubFJ7K8luth9p801eSrnkYjyl5JlYkvcMGF6s9
         M9rB/ho9d/oBu9KuxQEGkrEAyzIIhC0d0sjVteUVU+WTqG7g/D3NJ3r74CMETNI/uB/v
         hTnKtpvgOJ1AllPKfEOPJwiEEGFF+mmbP939fQXD5n62EZUkuItGVb/VRa8CDskHRtib
         pZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680511307;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTJlPe83VxVN/a/064MffW70nIdppbk/yJjbPFL4b3k=;
        b=ijNw5yOJacHTJQVtDQN3o9gEr6tJDDTqQxwSc/0FR42GhKg7zExYAHUR8AloadoyNV
         u73HnBM0g4lOD/vKrQtbsxW39piPbNehncFFgCUKTm6kPR/RhdqiMcmg2Uj/CbF/ypgx
         FDAMCRUEVrBoBj+1oBxS4jjHGz7WlazOPoGp4sbXdMWxK5rloQ1wVOBG5eDwsGPRKaxO
         CriWBW99es/Gv7RZo7Fc3U24rIeqao/lfl26XXFji6jBhs38MCsoCr51gSU7GRw0+USQ
         6b4MarWSyJ3yxc8H4xTfpPacEBiBIH5ciYQgaTfVCtsH8HOu/Jw6HEnoqLvSOsI2WzXW
         58Nw==
X-Gm-Message-State: AAQBX9fgM1aoh6XtR4zq5vBXZQWopOtq57gNg6XtERiX3iyyBbL/wBwu
        aHP7ziAMTwimrHsI/DO4gt86MQ==
X-Google-Smtp-Source: AKy350ZPPxzS2GLb6MswkF7dL8Zh45iApF2+VGCigEs0XX4EroIHgdYu+N2dNA7hB5dczJUBUbVarg==
X-Received: by 2002:a17:906:aeda:b0:931:20fd:3d09 with SMTP id me26-20020a170906aeda00b0093120fd3d09mr19595275ejb.17.1680511307670;
        Mon, 03 Apr 2023 01:41:47 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b009486efb9192sm1535169ejc.11.2023.04.03.01.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 01:41:47 -0700 (PDT)
References: <20230331215053.585759-1-y86-dev@protonmail.com>
 <20230331215053.585759-4-y86-dev@protonmail.com>
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
        Alice Ryhl <aliceryhl@google.com>,
        Andreas Hindborg <a.hindborg@samsung.com>
Subject: Re: [PATCH v4 03/15] rust: sync: change error type of constructor
 functions
Date:   Mon, 03 Apr 2023 10:41:08 +0200
In-reply-to: <20230331215053.585759-4-y86-dev@protonmail.com>
Message-ID: <87y1n9jr1x.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


y86-dev@protonmail.com writes:

> From: Benno Lossin <y86-dev@protonmail.com>
>
> Change the error type of the constructors of `Arc` and `UniqueArc` to be
> `AllocError` instead of `Error`. This makes the API more clear as to
> what can go wrong when calling `try_new` or its variants.
>
> Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Andreas Hindborg <a.hindborg@samsung.com>
> Cc: Alice Ryhl <aliceryhl@google.com>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/sync/arc.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
> index f2f1c83d72ba..aa7135f0f238 100644
> --- a/rust/kernel/sync/arc.rs
> +++ b/rust/kernel/sync/arc.rs
> @@ -17,11 +17,11 @@
>
>  use crate::{
>      bindings,
> -    error::Result,
>      types::{ForeignOwnable, Opaque},
>  };
>  use alloc::boxed::Box;
>  use core::{
> +    alloc::AllocError,
>      marker::{PhantomData, Unsize},
>      mem::{ManuallyDrop, MaybeUninit},
>      ops::{Deref, DerefMut},
> @@ -149,7 +149,7 @@ unsafe impl<T: ?Sized + Sync + Send> Sync for Arc<T> {}
>
>  impl<T> Arc<T> {
>      /// Constructs a new reference counted instance of `T`.
> -    pub fn try_new(contents: T) -> Result<Self> {
> +    pub fn try_new(contents: T) -> Result<Self, AllocError> {
>          // INVARIANT: The refcount is initialised to a non-zero value.
>          let value = ArcInner {
>              // SAFETY: There are no safety requirements for this FFI call.
> @@ -469,7 +469,7 @@ pub struct UniqueArc<T: ?Sized> {
>
>  impl<T> UniqueArc<T> {
>      /// Tries to allocate a new [`UniqueArc`] instance.
> -    pub fn try_new(value: T) -> Result<Self> {
> +    pub fn try_new(value: T) -> Result<Self, AllocError> {
>          Ok(Self {
>              // INVARIANT: The newly-created object has a ref-count of 1.
>              inner: Arc::try_new(value)?,
> @@ -477,7 +477,7 @@ impl<T> UniqueArc<T> {
>      }
>
>      /// Tries to allocate a new [`UniqueArc`] instance whose contents are not initialised yet.
> -    pub fn try_new_uninit() -> Result<UniqueArc<MaybeUninit<T>>> {
> +    pub fn try_new_uninit() -> Result<UniqueArc<MaybeUninit<T>>, AllocError> {
>          Ok(UniqueArc::<MaybeUninit<T>> {
>              // INVARIANT: The newly-created object has a ref-count of 1.
>              inner: Arc::try_new(MaybeUninit::uninit())?,

