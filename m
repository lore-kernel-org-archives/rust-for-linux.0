Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F5DC6FD18
	for <rust-for-linux@archiver.kernel.org>; Fri, 31 Mar 2023 12:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232449AbjCaMwS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 31 Mar 2023 08:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbjCaMwG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 31 Mar 2023 08:52:06 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6307A1CB98
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Mar 2023 05:51:45 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id h17so22258989wrt.8
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Mar 2023 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1680267099;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=UsGubbzk0dCjG5wCsoY5mRw327zyvC5R+ejx+1+wa68=;
        b=03sQJJ1LaNV8LEYEs1ETSwJlzUJlhnJ8G2vSy8+UA5LIU3mqUs7QN4TDdNoDAk9Eqk
         V8R3E702XY/7PSlW6boqvagNy4uVcrpSmGt7yzS353DV+ASE0U0lYFQgQqo8J3C3fMFp
         W6j9R1u7FwlqjnBD1+IXqwwReW987DCIb218egtvqoewVBqVdaqv3WKrLn3aELu5d7Rw
         2dPAIoqnk7mevLWNAVeWFMLjfju7xSYJBXoYUtmb5NtOt068fpBJJnJZPq7DIdUNScAo
         03xlxqvSKLTk6hHlE9Qu3u2X6QoOg/jmK30cMU+qQ1do4hIeb0Zck7DUW5e6IZwkVCsy
         ECFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680267099;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsGubbzk0dCjG5wCsoY5mRw327zyvC5R+ejx+1+wa68=;
        b=Wqsa/11HM1fYxkJxAtXnYHn1tLhGv1YR1fyOLNA6TyL4KqlZNVzqNs1XDy2LHtIC7M
         z5AhN36cM5B5yq8q7zTljIHyyUF+dPP6RGgu5FwEAsz74lnBpn8l2eojS/aIOvaYPFYi
         XXXtRq06R2BuHiUxtwl7boMPMp2E9gCRCAorPrIvVn5yinTErIvBqM7llFPYh/P6pdn7
         ZeAnaOEYbmzFJliSjmvh9ipIbKv69iXi8ku3DqvunxfLCk0maNgzcxLNcByfAV/VQKhb
         YsHxhfrq9Yli3cLmJr9lWAUkaZ2aJy/Bu2g4Zhm9kwXZ9tMzHxNU9iDW96WGVPpx8beg
         huOw==
X-Gm-Message-State: AAQBX9fmNKIvRxclqUBR1x7s0BcImCK9eBDbKTBOqdYNLPreP+Ez7Up3
        znvkQVYP8Naw4scODOnbP9au+g==
X-Google-Smtp-Source: AKy350aDcoHRT3JiiMvfouQyjeJsV4oDEXMvorqyhiIA+F6ahoEd/4aNjEXVaQZExo/0h8Md4kambQ==
X-Received: by 2002:adf:f2c6:0:b0:2d1:5b75:28f0 with SMTP id d6-20020adff2c6000000b002d15b7528f0mr20065546wrp.39.1680267098890;
        Fri, 31 Mar 2023 05:51:38 -0700 (PDT)
Received: from localhost ([165.225.194.194])
        by smtp.gmail.com with ESMTPSA id o11-20020a056000010b00b002de9a0b0a20sm2104329wrx.113.2023.03.31.05.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 05:51:38 -0700 (PDT)
References: <20230329223239.138757-11-y86-dev@protonmail.com>
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
Subject: Re: [PATCH v3 10/13] rust: prelude: add `pin-init` API items to
 prelude
Date:   Fri, 31 Mar 2023 14:50:59 +0200
In-reply-to: <20230329223239.138757-11-y86-dev@protonmail.com>
Message-ID: <87bkk92ied.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


y86-dev@protonmail.com writes:

> From: Benno Lossin <y86-dev@protonmail.com>
>
> Add `pin-init` API macros and traits to the prelude.
>
> Signed-off-by: Benno Lossin <y86-dev@protonmail.com>
> ---

Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>

>  rust/kernel/prelude.rs | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index 0bc1c97e5604..fcdc511d2ce8 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -18,7 +18,7 @@ pub use core::pin::Pin;
>  pub use alloc::{boxed::Box, vec::Vec};
>
>  #[doc(no_inline)]
> -pub use macros::{module, vtable};
> +pub use macros::{module, pin_data, pinned_drop, vtable};
>
>  pub use super::build_assert;
>
> @@ -27,8 +27,12 @@ pub use super::build_assert;
>  pub use super::dbg;
>  pub use super::{pr_alert, pr_crit, pr_debug, pr_emerg, pr_err, pr_info, pr_notice, pr_warn};
>
> +pub use super::{init, pin_init, try_init, try_pin_init};
> +
>  pub use super::static_assert;
>
>  pub use super::error::{code::*, Error, Result};
>
>  pub use super::{str::CStr, ThisModule};
> +
> +pub use super::init::{InPlaceInit, Init, PinInit};

