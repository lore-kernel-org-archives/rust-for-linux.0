Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50380C6379F
	for <rust-for-linux@archiver.kernel.org>; Tue, 14 Feb 2023 22:48:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbjBNWrr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 14 Feb 2023 17:47:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbjBNWrr (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 14 Feb 2023 17:47:47 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF6F52CFC8
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Feb 2023 14:47:45 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-517f8be4b00so174468317b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Feb 2023 14:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7+nx9pODZOTWbI9VVP6a6RYSRYbkJiAoYYb8AY41dxI=;
        b=ajIEj2qZmmPupRqqyAv+Ana2yWM1Y0+/kYOEOJFN6MuJ9BexzCm7aSfkRJ9JmF5tCK
         qcBjQ8CLJDBTsclSp6/nOLSmsXzDUeN3dQw0ADOgs4rLLipUJDO4qY7WUW1wG76ycTdK
         fGYnzxpXe81CXv7gaJFCiIU8MWI4bVoDhuMPwXXAtxrjvDMhAqpibq7hPbCByYWBis+O
         d2fjQCu68VX3ApUNV4qGg+J7FdAze2jKFkWPvfDQpSMWxAzouXQgxun/3IaKyzrYLuNJ
         j+aZxQfLJIlfhwZ7VmEE6ic1O5wtvAwouqdSYreKs4P43CceIqN1kf47YuuV64RIUeHK
         nG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+nx9pODZOTWbI9VVP6a6RYSRYbkJiAoYYb8AY41dxI=;
        b=5/48yVVimfgUsE6HqW8FiKioc3/kvABtP+faxwl2Tusek6/NJunvl1N/dciGxcjrat
         HRLLdsctphy8/9Wm79Pzr+4a3n9knrzgTb+4r1RA9quNTA6D22bSRERjRmeRFZHkxum7
         TqyIpcGoU8buQJLKCGHY1fD2fGUqgbKuiunRZs4IAdtaMKB729Seya2J/sZE33PgXxoM
         91U10N6DZvc6Oh6r46hr3s1i4xA5Lu6yQSrwHYwy+dYi57RhDTaVeSS7zm37jGrUtaap
         oVfXR2TVl+kNYqqPFj10O4+SKszJ1HYPsCo4GI68A9JdwvazTW6yM8Nduyob4hiqAt7h
         2Trw==
X-Gm-Message-State: AO0yUKVB9RaXKof9xFpaiP6mZ2tCOqaipyEJ6ftmq4NPbE56EXcybLX4
        HlV2sIga+N1o+wJ5QmfqbKSqQ68py7bGag==
X-Google-Smtp-Source: AK7set8wgrXoTNrGGFMekxOtm0ElqK2h8Agj3VZGnzS0Ft76YC/6LCFJQLi75hzTelxCVEpL3UCkhAagH9kJdA==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:e311:0:b0:92f:a9c3:a591 with SMTP id
 z17-20020a25e311000000b0092fa9c3a591mr32461ybd.8.1676414864929; Tue, 14 Feb
 2023 14:47:44 -0800 (PST)
Date:   Wed, 15 Feb 2023 06:47:35 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230214224735.264894-1-davidgow@google.com>
Subject: [PATCH] rust: kernel: Mark rust_fmt_argument as extern "C"
From:   David Gow <davidgow@google.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>
Cc:     David Gow <davidgow@google.com>, rust-for-linux@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

The rust_fmt_argument function is called from printk() to handle the %pA
format specifier.

Since it's called from C, we should mark it extern "C" to make sure it's
ABI compatible.

Cc: stable@vger.kernel.org
Fixes: 247b365dc8dc ("rust: add `kernel` crate")
Signed-off-by: David Gow <davidgow@google.com>
---

See discussion in:
https://github.com/Rust-for-Linux/linux/pull/967
and
https://github.com/Rust-for-Linux/linux/pull/966

---
 rust/kernel/print.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
index 30103325696d..ec457f0952fe 100644
--- a/rust/kernel/print.rs
+++ b/rust/kernel/print.rs
@@ -18,7 +18,7 @@ use crate::bindings;
 
 // Called from `vsprintf` with format specifier `%pA`.
 #[no_mangle]
-unsafe fn rust_fmt_argument(buf: *mut c_char, end: *mut c_char, ptr: *const c_void) -> *mut c_char {
+unsafe extern "C" fn rust_fmt_argument(buf: *mut c_char, end: *mut c_char, ptr: *const c_void) -> *mut c_char {
     use fmt::Write;
     // SAFETY: The C contract guarantees that `buf` is valid if it's less than `end`.
     let mut w = unsafe { RawFormatter::from_ptrs(buf.cast(), end.cast()) };
-- 
2.39.1.581.gbfd45094c4-goog

