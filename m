Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F840C77B75
	for <rust-for-linux@archiver.kernel.org>; Wed,  3 May 2023 08:41:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjECIlX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 3 May 2023 04:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjECIk5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 3 May 2023 04:40:57 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D526C5B8E
        for <rust-for-linux@vger.kernel.org>; Wed,  3 May 2023 01:40:12 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-559d36a91a9so50081157b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 May 2023 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683103211; x=1685695211;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tsKroyIYfOmkggcrqdey4GLuHL/j3Hn3ECNrtbDv+4k=;
        b=FreTAQEnryHPqC1s5NFCr/rg08FAyWJ++blo3gR3srCPJIWQb0UIrS35Mj4JRYVGcS
         yIxKzaQKAhNrc+MMIfhu3gstweG2OA1eeSUeZxLxKzOv16T4OIbdG/z6itte0rbfQRh8
         iYLOyxDeydvghUIxpKHvzmrd+AD4Q1xBwRXXufmBiYEJ7wOrx4XgyMVZoCFVBcAx549y
         f0DLrC0U7aAKTvkgLLQWIes+zJFBQQwvu9HHDPgeUtSx1De2In1XceQPUD/Ifn31ru2u
         G8b8gnRqi7lGLyxzpLtqHQ5vVc6vMTgyJEInukz4V5UJCLR95ke/OkUNSMldz95iDcK4
         14yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683103211; x=1685695211;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tsKroyIYfOmkggcrqdey4GLuHL/j3Hn3ECNrtbDv+4k=;
        b=TuNX+bGXQ98dDau4AoSk5ACb5rF64SUXOCEXVTjMpjC8utYkGf3mq10EUXF5fFP6TY
         3oodQVSpkJc69JjIgQ/aN8hG1uDVfg9i53/vUjBJoEFCFZY1MbQVJA6b5ogYjnRNi940
         g1YHVgvximfrxH2Yjc7AVJffX9SJlku9CxBzu2C+9usNP+U1hofSZMoe/i0DmLhDBzzq
         TAiNfax26W6exicl2FiWzFrAeyP3nANqTst38Mu2uLObKfJrF31RYaj3VNiXIG9OlPDV
         rv9WAWaAJOUhUK5rnnC2F4pT1P2bHhyFKvnxcehqYm/xE27oauguyQEUoOKwplDmpf4X
         CugA==
X-Gm-Message-State: AC+VfDxtjwLbfJlju8zJy620xyCvwFcaggGDKa7O2TopobjRLCB6kX9Y
        1JzaYvc5EYhG+1RZuVWRMd1qBChMREjycI8=
X-Google-Smtp-Source: ACHHUZ49hHPRm1pH+uSHGjzOViT5H8XUxKiVJ0tGHFWZkkVa6+RFvZX/3w1ZyAFbdz/Qvp6wo0yb3vkYn/DUt/w=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:e901:0:b0:54f:b986:9c60 with SMTP id
 d1-20020a81e901000000b0054fb9869c60mr12213286ywm.7.1683103211316; Wed, 03 May
 2023 01:40:11 -0700 (PDT)
Date:   Wed,  3 May 2023 08:39:41 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
Message-ID: <20230503083941.499090-1-aliceryhl@google.com>
Subject: [PATCH v1] rust: error: add ERESTARTSYS error code
From:   Alice Ryhl <aliceryhl@google.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This error code was probably excluded here originally because it never
actually reaches user programs when a syscall returns it. However, from
the perspective of a kernel driver, it is still a perfectly valid error
type, that the driver might need to return. E.g., this can be necessary
when a signal occurs during sleep.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 5f4114b30b94..cbde1b2d29f4 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -58,6 +58,7 @@ pub mod code {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(ERESTARTSYS, "Restart the system call.");
 }
 
 /// Generic integer kernel error.

base-commit: ea76e08f4d901a450619831a255e9e0a4c0ed162
-- 
2.40.1.495.gc816e09b53d-goog

