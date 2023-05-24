Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC039C77B73
	for <rust-for-linux@archiver.kernel.org>; Wed, 24 May 2023 12:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjEXMeQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 24 May 2023 08:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbjEXMeO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 24 May 2023 08:34:14 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5CB10C2
        for <rust-for-linux@vger.kernel.org>; Wed, 24 May 2023 05:33:34 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5125a64b24dso991713a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 24 May 2023 05:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684931612; x=1687523612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XZafPqgI9Fb4pogcf8RRb1JCJ1KFVqaaBis24tWL2C0=;
        b=6nLPqQkHIbAbRRsrRMRjIaMSxB8wTAHe51+mF9Ro3EK6sZAGVNp7lyfPZztpFwZTXh
         z8VZPUGKeJukHFmyAzqI20VUE9rUSlxm9G3Yi95DGQZOPXEmEh0BXj5AaG9ZfAfiTVDh
         +3wCp8HgcDP32GpMMLsnNDm51CUz/p2Y0dDom6bYLprj56kHfnOsr1Et+ErbIdGbMejk
         /RVyC0E1D4dgHkbc16XZf6WQqd2INAcwgj+mcu3N/MTQpix6xA5GC+F8JDCyf6aYcMc7
         /nUgh1gRYQieFevxn19EJByi5XLeozkDDxrJYxrncCvqtGMUsihyArzJ4VQ/mgEzuyjF
         2oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684931612; x=1687523612;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XZafPqgI9Fb4pogcf8RRb1JCJ1KFVqaaBis24tWL2C0=;
        b=S0EVFxl6qw+6fAZOqebvXsSZjo4tO8qnnf/FNmuFU05oZSQX6CDbtK6h60v8rOOP+a
         AMZkJaUQUS9JFc8fj9pAlzH+KA6NMpyFvJChT3VgTSofBtgG7fVlMRvAcNGLg4m5I+WH
         Dc0dnYNzD++BXB91FdfzjBgGOZBmKB6XUL6IcRJBMrSDYRnbvQSzUeAFXFnhnIK046u2
         tKhwyxKR74jcR0homZCR/YoSUffyofsaVta5iHgf/C0wrRqX/5uIXcyFejGdy9t4a8xz
         uwoYpSlIfXeo7adMU/phYQv55v8iyOv6x1GnHb8eepHXUNLrQ97mtNWf1c8SXebLSGTG
         yFCA==
X-Gm-Message-State: AC+VfDy4l7ZwqTPVz9WWdPol0kOkd9YGKuQcYA7+/Ta9d86cYTkaHjKU
        lP8Pv7o6eagtmcwWIEWFGQkJwt6GccEU1IM=
X-Google-Smtp-Source: ACHHUZ6nEk5+MTTdAeuKBA1sa0MKBRxd3bRqOe3lsS32BwxY4I+/jQylsZCoMoxlY0J3DOW/9hm18x4HO2Uf4a8=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:9f2d:0:b0:50b:fc7b:de7f with SMTP id
 b42-20020a509f2d000000b0050bfc7bde7fmr922098edf.2.1684931612445; Wed, 24 May
 2023 05:33:32 -0700 (PDT)
Date:   Wed, 24 May 2023 12:33:30 +0000
In-Reply-To: <87ilcjdthc.fsf@metaspace.dk>
Mime-Version: 1.0
References: <87ilcjdthc.fsf@metaspace.dk>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230524123330.2501843-1-aliceryhl@google.com>
Subject: Re: [PATCH v1 0/7] Bindings for the workqueue
From:   Alice Ryhl <aliceryhl@google.com>
To:     nmi@metaspace.dk
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, gary@garyguo.net, jiangshanlai@gmail.com,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
        tj@kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Andreas Hindborg <nmi@metaspace.dk> writes:
> This does not compile for me. Could you link dependencies to be applied
> first?

I messed up something related to the patch for specifying error type on
`Result` [1]. This patch doesn't _need_ to depend on that though, so the
next version of this patchset should compile without it.

Alice

[1]: https://lore.kernel.org/all/20230502124015.356001-1-aliceryhl@google.com/
