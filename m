Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40286C7EE21
	for <rust-for-linux@archiver.kernel.org>; Tue,  2 May 2023 12:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234021AbjEBMky (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 2 May 2023 08:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234147AbjEBMkw (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 2 May 2023 08:40:52 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AA959D0
        for <rust-for-linux@vger.kernel.org>; Tue,  2 May 2023 05:40:50 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-50bcd24504eso1429032a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 May 2023 05:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683031249; x=1685623249;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ADtw/qW1A9BDeVMPTl0uodglbiJnCrGJeTfJlSlwBKg=;
        b=RtMUrDSWYfljcmZM/ZtUMzf01ONWDqjrPnyBWPRvafhDE2ibUgIMV4q2TPupNf49Hn
         LCSAs6t9MhQVa4Cjq4Z5jZS8uPlpzgWmjfiso1xgiADZNeIql8OJLlUI/AF/gKddo1Q7
         putis1pK61uDgfKDnRrk/qsNBCqJvN0emkuYAppsSRgrA0amla/syw7lWZJ2015dUb6E
         7IjrAmQ7gLKNIIeUNyTmukgtEIQH7TKHWerk+VKWds7L0O1rNLagmd/HvQ6wk+Nm6Cc5
         VNGUV1iObaiBxMV2zsNZO9SWbnE8TaWL6/YCZgSPaWVGajYPUtn0bnfQ9zON4bfXpGVb
         vuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683031249; x=1685623249;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ADtw/qW1A9BDeVMPTl0uodglbiJnCrGJeTfJlSlwBKg=;
        b=Vb9AqiRWLw1CCwNckJxWx1dhAkdYgoOqJymbKdhh+S3WxTvwvElzkAAxMUdHMMcULk
         tvbHN5tKyRUE9SiKhSSyJR0QkIZ8AYLoG5WzJ6hMvD31xG1c8Fz3Z0qq2jb0p7McixSD
         /cCqAdbEIDcvuVdkb2jV4akRpzdC2phRljUEASjzf+kWTVRMmsjwrpYZx+fCNgMj9BRU
         ia0c3Qa3Mxd4Ix0Q1N2Nrtwp1JVF+26+D+uWX5j0e6Mgwsh0fZ/uLghCbAgNhwpTrQrS
         00fxOOy+1EyRdAQWUPIuprVH/7SJSu/EOspC7kP9bsH8Kt0Lk/7z4Sg+zKDHIskXRCZX
         FYrA==
X-Gm-Message-State: AC+VfDxnTplHNBXL29yVDD7i4mdeQjsQXaRvqnjKo860CUsil49jRGc5
        vs5xilYsp0hRQAh3SihrcuX2tNr2mOcaa3A=
X-Google-Smtp-Source: ACHHUZ4PGt9JNY1496rQhEH+WLmSav3+qf88yqqFPW52fA2YiYcRFGcqDl4OEBgAI76aE3ZWAWeGyNcuQPShBzg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:9fe3:0:b0:50b:c83b:22d8 with SMTP id
 c90-20020a509fe3000000b0050bc83b22d8mr2063829edf.3.1683031242984; Tue, 02 May
 2023 05:40:42 -0700 (PDT)
Date:   Tue,  2 May 2023 12:40:15 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230502124015.356001-1-aliceryhl@google.com>
Subject: [PATCH] rust: error: allow specifying error type on `Result`
From:   Alice Ryhl <aliceryhl@google.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Currently, if the `kernel::error::Result` type is in scope (which is
often is, since it's in the kernel's prelude), you cannot write
`Result<T, SomeOtherErrorType>` when you want to use a different error
type than `kernel::error::Error`.

To solve this we change the error type from being hard-coded to just
being a default generic parameter. This still lets you write `Result<T>`
when you just want to use the `Error` error type, but also lets you
write `Result<T, SomeOtherErrorType>` when necessary.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/error.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 5f4114b30b94..01dd4d2f63d2 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -177,7 +177,7 @@ impl From<core::convert::Infallible> for Error {
 /// Note that even if a function does not return anything when it succeeds,
 /// it should still be modeled as returning a `Result` rather than
 /// just an [`Error`].
-pub type Result<T = ()> = core::result::Result<T, Error>;
+pub type Result<T = (), E = Error> = core::result::Result<T, E>;
 
 /// Converts an integer as returned by a C kernel function to an error if it's negative, and
 /// `Ok(())` otherwise.

base-commit: ea76e08f4d901a450619831a255e9e0a4c0ed162
-- 
2.40.1.495.gc816e09b53d-goog

