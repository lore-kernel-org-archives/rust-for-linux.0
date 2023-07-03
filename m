Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5479BEB64DC
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 Jul 2023 11:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjGCLha (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 Jul 2023 07:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbjGCLh2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 Jul 2023 07:37:28 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C773E5A
        for <rust-for-linux@vger.kernel.org>; Mon,  3 Jul 2023 04:37:26 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-51d98906383so2881305a12.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jul 2023 04:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688384245; x=1690976245;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5KVnJtuQwMZQfNIqcWt+goZd/DD7fJW4ut0aNiWQuDg=;
        b=jza+LFQPyng7N+NwcIVlSKpYKdTN68JmzwedT1tGetbfa+s4q50pMmTKrM5KGY5Srn
         Cv11Cgsfy01gipGEJeed37HohlhCe+iScvcioLxDxmJQr6NJpxlqYmwqYXoZXpi0TJ5I
         3D2t2FvPk37x+uhUPoHWOyTmB75DvF04e3gx/OEvroTStoFlr+Wj0OLh6jnXJZQic9/r
         BDkHdZsIBSJZQV4WfOznp5TgfS3z3TUHKmB3R9yC9hLCYv9HkgyLwWtfleSk1+5Cud7L
         E6vOSoC8TRQDAfZeoPkOtJf4OV++xq5murXZZHVRHnzlAO/7ffs+oYxaA5TkTkny0BFh
         Hmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384245; x=1690976245;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5KVnJtuQwMZQfNIqcWt+goZd/DD7fJW4ut0aNiWQuDg=;
        b=PJ5qrqheoNrr2634myKEXUph/Nw/THDk2Xq23cvaULNwo89sy/X3x0PUpQwbjNWMia
         cISHcWFnYjS968/qYCU3AwFEcfPyImH5m+9zc7bWXxBmUBe9Ib71lZ75WgLtvi5EPHaE
         9wQhEZ+kr+xlDvicw812rcSRTdhLq0Z6eTuz5HWMAwtE9n4ClSmJNOZa3x3+ik7xbd3s
         EfFMEPxCiwcLZAnJTuOBetUWMHyV9VEGWH3NI7wib9WmHjJHOEFJpp/zXLBRIT7gTbN7
         8lIhGhbfzUMt2OkTpd2xkwufGqhN8C/F/TurUOtQTXmiUAF5gKRNCQiMW3AjXPSUA0bv
         sjGw==
X-Gm-Message-State: ABy/qLaR72jxiTf8nnca6RyCu9vnSBaC9pahYGufJROlSJQq/ohn4k1X
        ZTQbcVl9da2UBtq2ES/CeuJPu8YPl/hnYvQ=
X-Google-Smtp-Source: APBJJlEEFQL7cz8xFtZbp6U0Zty2ffqyn0hzeT6NK8BoxMapeaKnv4aHWn3qKxYC1CiyBKDZd4KQFd1x9Uw7Q4g=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:c05e:0:b0:51d:25d3:512e with SMTP id
 u30-20020a50c05e000000b0051d25d3512emr45181edd.6.1688384244845; Mon, 03 Jul
 2023 04:37:24 -0700 (PDT)
Date:   Mon,  3 Jul 2023 11:37:07 +0000
In-Reply-To: <20230628171108.1150742-1-gary@garyguo.net>
Mime-Version: 1.0
References: <20230628171108.1150742-1-gary@garyguo.net>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230703113708.1758734-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: macros: add `paste!` proc macro
From:   Alice Ryhl <aliceryhl@google.com>
To:     gary@garyguo.net
Cc:     a.hindborg@samsung.com, alex.gaynor@gmail.com,
        aliceryhl@google.com, benno.lossin@proton.me,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Gary Guo <gary@garyguo.net> writes:
> This macro provides a flexible way to concatenated identifiers together
> and it allows the resulting identifier to be used to declare new items,
> which `concat_idents!` does not allow. It also allows identifiers to be
> transformed before concatenated.
> 
> The `concat_idents!` example
> 
>     let x_1 = 42;
>     let x_2 = concat_idents!(x, _1);
>     assert!(x_1 == x_2);
> 
> can be written with `paste!` macro like this:
> 
>     let x_1 = 42;
>     let x_2 = paste!([<x _1>]);
>     assert!(x_1 == x_2);
> 
> However `paste!` macro is more flexible because it can be used to create
> a new variable:
> 
>     let x_1 = 42;
>     paste!(let [<x _2>] = [<x _1>];);
>     assert!(x_1 == x_2);
> 
> While this is not possible with `concat_idents!`.
> 
> This macro is similar to the `paste!` crate [1], but this is a fresh
> implementation to avoid vendoring large amount of code directly. Also, I
> have augmented it to provide a way to specify span of the resulting
> token, allowing precise control.
> 
> For example, this code is broken because the variable is declared inside
> the macro, so Rust macro hygiene rules prevents access from the outside:
> 
>     macro_rules! m {
>         ($id: ident) => {
>             // The resulting token has hygiene of the macro.
>             paste!(let [<$id>] = 1;)
>         }
>     }
> 
>     m!(a);
>     let _ = a;
> 
> In this versionn of `paste!` macro I added a `span` modifier to allow
> this:
> 
>     macro_rules! m {
>         ($id: ident) => {
>             // The resulting token has hygiene of `$id`.
>             paste!(let [<$id:span>] = 1;)
>         }
>     }
> 
>     m!(a);
>     let _ = a;
> 
> Link: http://docs.rs/paste/ [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

