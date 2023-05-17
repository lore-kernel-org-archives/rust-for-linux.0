Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D779C77B75
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 May 2023 20:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjEQUIg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 May 2023 16:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjEQUIf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 May 2023 16:08:35 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8863E7C
        for <rust-for-linux@vger.kernel.org>; Wed, 17 May 2023 13:08:33 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5104a3f0a45so1455728a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 17 May 2023 13:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684354112; x=1686946112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WVkaYtQTj8iUhQoCH4E7KYFvPTbFMzSMw0B5Ujo6j7U=;
        b=k/7Al0AtAF6zKhw0lzSRawbRH6pCbg1kV1kmPFxrNcXxZZYRNvdWDqo5+Or3482dNP
         c5fXAAOIyOdgdQnsxZsnHrrdaSSFW6pS6MFD9QS3xPcTs7/2pKsMhqtcbzr7t9NAWTNt
         /l5t3O8F+7nfkfHvCAVmULq94St6KRSnCzLp/wtq0RI1lvTJjYjREhVebxAfmpX790tX
         bE9vFcQaAVvXxAKahSHmzirCs6T7b2PFBDoJfqyJbxUIb8VJgU/B6rWmDJUfZZ0Z+9iZ
         6HIcs8qwMqxTNOhL9TeOLNkASwPfLLroCSB02PAeXZL/qmNASCFOEbmYw9mQZCnFAedm
         d/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684354112; x=1686946112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WVkaYtQTj8iUhQoCH4E7KYFvPTbFMzSMw0B5Ujo6j7U=;
        b=jUhm/zZof7WsS8Ixdwyyto/BtT8Cawbuy1rEqdBb9wpUBnYLXDbGNDnTZajL8mZHcI
         IRp9wOtIzBk54OQCjQ4cwPcjNirkOb6AHWC64asR8UiM8GA/EJOk62+K742X/mT6Vnpd
         kA/g072I8uR2o2ShSNtWc1MOfGDjTBNCqOCIWD14SVd0i9rzKLPMFDs5amATKb0YM4rr
         aVKQAS+/zfQv7+GRFhSP330h649Jdz4dsInM16+JiC5WXrF8XA7LGWsKni8qUv0X1FCu
         ltz+xMItZpGqtfFhayQKPxXLNJ9NtK9eEFxEZeUttAHOjUyOjsxcIC3y7tDneKhp+ZPU
         zWzw==
X-Gm-Message-State: AC+VfDwmqwd10FJDVYRju7UNs8UTM4cuyZ1dmpSCcWtG00gkn2p2JhEf
        bdwo+TsX6FUQh1RAD8zokBudSqcIaj6LZiM=
X-Google-Smtp-Source: ACHHUZ4fXXzkgZEE7kXW29z7xI8+JKUgG3Ttr9/nlpSJe9h8kBZqv80+Xkmr0bhvapKwvhzU0djTZltE3Lse/7w=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:aac5:0:b0:510:b4dc:1656 with SMTP id
 r5-20020a50aac5000000b00510b4dc1656mr1476722edc.3.1684354112325; Wed, 17 May
 2023 13:08:32 -0700 (PDT)
Date:   Wed, 17 May 2023 20:08:13 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230517200814.3157916-1-aliceryhl@google.com>
Subject: [PATCH v1 1/2] rust: sync: add `Arc::ptr_eq`
From:   Alice Ryhl <aliceryhl@google.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alice Ryhl <aliceryhl@google.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev,
        Wedson Almeida Filho <walmeida@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Add a method for comparing whether two `Arc` pointers reference the same
underlying object.

This comparison can already be done by getting a reference to the inner
values and comparing whether the references have the same address.
However, writing `Arc::ptr_eq(a, b)` is generally less error-prone than
doing the same check on the references, since you might otherwise
accidentally compare the two `&Arc<T>` references instead, which wont
work because those are pointers to pointers to the inner value, when you
just want to compare the pointers to the inner value.

Also, this method might optimize better because getting a reference to
the inner value involves offsetting the pointer, which this method does
not need to do.

Co-developed-by: Wedson Almeida Filho <walmeida@microsoft.com>
Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/arc.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index e6d206242465..274febe3bb06 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -221,6 +221,11 @@ impl<T: ?Sized> Arc<T> {
         // reference can be created.
         unsafe { ArcBorrow::new(self.ptr) }
     }
+
+    /// Compare whether two [`Arc`] pointers reference the same underlying object.
+    pub fn ptr_eq(this: &Self, other: &Self) -> bool {
+        core::ptr::eq(this.ptr.as_ptr(), other.ptr.as_ptr())
+    }
 }
 
 impl<T: 'static> ForeignOwnable for Arc<T> {

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.40.1.606.ga4b1b128d6-goog

