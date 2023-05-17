Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D50C7EE22
	for <rust-for-linux@archiver.kernel.org>; Wed, 17 May 2023 20:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjEQUIm (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 17 May 2023 16:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjEQUIi (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 17 May 2023 16:08:38 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4467D91
        for <rust-for-linux@vger.kernel.org>; Wed, 17 May 2023 13:08:37 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-94a34a0b75eso131647266b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 May 2023 13:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684354116; x=1686946116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8iJR0huTfHVTodkNfO2dbFSpbRb6U9pb/v/u0biFupw=;
        b=bWzM94fINtOQiMgIeij8r/YgZ5x9bR/Dr9fiTQjsYbOEc/EG/KK3e24KYDbSbKNXFq
         q0JETAcKy8aAdEveycELSQP0Ii/yRJnHVk4NKArscNFWSTQkCbq1VcORowwK/6Ou8Yb8
         0s6z4qC2HG4wsDP+zgctkD2KNiocsj8sZviKvuD+KSI518NxZvqsWzw8HUxm1BcPU4eJ
         S3tGklnk97V3591mhv9OhfHFl38eoUwDL0WA8VbW30AEVdqh1K736UaBB1EKE5aaAvRJ
         RpxcN2gss1FGPI7JNDtmlPhXfX8KVUsqBfnaRMg0dauYa+JFHyIAHP4RRisrg0k+L8XF
         1ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684354116; x=1686946116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8iJR0huTfHVTodkNfO2dbFSpbRb6U9pb/v/u0biFupw=;
        b=YevIuLRZZPrtZUY5nYFxJy58UMYvjW4WU7ZQOM8BF/0WbSGk7g1CZvWpRM4KWQOHvF
         WmVmulUz/Ycd8rYmoEZt8l+OLZeUxyLRiNOV7GoXUWFzp2wUinl3go2bh4lXKRNTp7ct
         NGj9IKeOYCA9K11Mh+WEKIHZjsPeRzv6PH0F/YqnO6RWNwBkai36Di7WhqT25Cy69YNK
         Oze9ykBlILAU2DAc09VOGb13pQApHLex4fZ0sFGDVB5pmGWn2HIccjT9RqSiJ5VCkUc9
         wclFVkNd/ZokeiUpYhnPDtBIUxQ7hytwcMUo5ikpn7F1cKF4G1qbus8DW9uZ1SXdk8ax
         Z5aA==
X-Gm-Message-State: AC+VfDyWb7Hwx/96Sb7KzpGOr76O+Ou1P6s6Q/9FZn8NcUnDPAyzYFIX
        HRIfBWQ2zJTFQUkGSXQytwt0wnpvcG8mUP0=
X-Google-Smtp-Source: ACHHUZ4YGLtjd/kuG8qRx/nnMKQbJbKmU6GNX6G9qK33HW2/6o/Jr8uWhpPLl4A/zXlgMGnERgXqzW6IE9wZdio=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:847a:b0:969:fc90:bf94 with SMTP
 id hx26-20020a170906847a00b00969fc90bf94mr9978929ejc.8.1684354116437; Wed, 17
 May 2023 13:08:36 -0700 (PDT)
Date:   Wed, 17 May 2023 20:08:14 +0000
In-Reply-To: <20230517200814.3157916-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230517200814.3157916-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
Message-ID: <20230517200814.3157916-2-aliceryhl@google.com>
Subject: [PATCH v1 2/2] rust: sync: implement `AsRef<T>` for `Arc<T>`
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

This trait lets you use `Arc<T>` in code that is generic over smart
pointer types.

The `AsRef` trait should be implemented on all smart pointers. The
standard library also implements it on the ordinary `Arc`.

Co-developed-by: Wedson Almeida Filho <walmeida@microsoft.com>
Signed-off-by: Wedson Almeida Filho <walmeida@microsoft.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/sync/arc.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 274febe3bb06..9ec911e4a0c7 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -264,6 +264,12 @@ impl<T: ?Sized> Deref for Arc<T> {
     }
 }
 
+impl<T: ?Sized> AsRef<T> for Arc<T> {
+    fn as_ref(&self) -> &T {
+        self.deref()
+    }
+}
+
 impl<T: ?Sized> Clone for Arc<T> {
     fn clone(&self) -> Self {
         // INVARIANT: C `refcount_inc` saturates the refcount, so it cannot overflow to zero.
-- 
2.40.1.606.ga4b1b128d6-goog

