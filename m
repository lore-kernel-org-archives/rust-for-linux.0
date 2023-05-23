Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70C0C7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 May 2023 14:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237274AbjEWOpK (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 May 2023 10:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237351AbjEWOpJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 May 2023 10:45:09 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D160811A
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 07:45:07 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-96f83b44939so393406066b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684853105; x=1687445105;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qdVRg6LoNElWahe9YlmLHc0fO9VPVtOwab5a4NPQ+t0=;
        b=L+ydM2ZMhTGwNMwmjmnRmRfMJfy783Y8dALDZDlyzR0avEpxlOnKtSq5GYMkYzb317
         vtIYmC0LT38gm6XodkzGrp11N2LZSJzXE2oX4+W0z/RRuSLisAL86VqLi7RA5QO8f8GZ
         MxaI60HRLpFzgsFuRKnLFYwHloYozwkZC6aKvzAr95gWRC27FvpWdG3aAxjmKIqnSmbw
         p1oYFQpe3C9rz5RILbQYi1dfGzQIBcN6VOtGm7F2Kkm2Uaml0QsfDRilvm4+zqsDKcZW
         G511w179klPw2ryx75gy6gXzIM9R+enCxH/3gS0BhdyC4bXWrH8OjIEVk2y5yvwAQAE+
         6usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684853105; x=1687445105;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdVRg6LoNElWahe9YlmLHc0fO9VPVtOwab5a4NPQ+t0=;
        b=gwAuVnM9d2pE6gKjysGzGH/0IcobHmnfyldfkMbyd6F+fH3KsGG8x38kbvgPWEjBdi
         OMkhqi1E9Z441LT80bMAm/9w8fAjlP52D+UaNZEQv9Mh3NDBYEHQM5uRUXgHeAhlyygE
         OuhXpnD9E+MNqxFw1XRvqqaMlLLfCfLY2UHjW4iwxtoIC07mTnCcjNoMOsw8DeOL722M
         PS9g2mJvg7pJ5Xp+OxWeXy5TfnlwaH5AVzQtuYxI1095NR21khOJWnXAftxL2jwwYkgf
         DrqbQkMFGB7gzsUDdSslWPzjuVVImx+s1shH0wE8JlDOTJSGWMIoLHBFYQtsk7QVN+Ek
         67Jw==
X-Gm-Message-State: AC+VfDyF6VgPJ/LNV9mdExLrvMPaexJExO4REXOmWv9df4tGGj/FVfGt
        AhxhoYw3AqL3IpenEFIxtSpxOCVHfQTxFvk=
X-Google-Smtp-Source: ACHHUZ5EOxmKcPckGGYoWG+E6eScW9ff6mALx3v5X3xhD+aggfd1Uq5KEgyfu4kvGgNrs8PkLoMCyDXlb999Xwc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:8453:b0:965:ecf8:4af5 with SMTP
 id e19-20020a170906845300b00965ecf84af5mr5174037ejy.12.1684853105342; Tue, 23
 May 2023 07:45:05 -0700 (PDT)
Date:   Tue, 23 May 2023 14:44:15 +0000
In-Reply-To: <20230523144418.1250547-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230523144418.1250547-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230523144418.1250547-2-aliceryhl@google.com>
Subject: [PATCH v2 1/4] rust: sync: reword the `Arc` safety comment for `Send`
From:   Alice Ryhl <aliceryhl@google.com>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Andreas Hindborg <a.hindborg@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

The safety comment on `impl Send for Arc` talks about "directly"
accessing the value, when it really means "accessing the value with a
mutable reference". This commit clarifies that.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/arc.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index e6d206242465..87a4c9ed712b 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -146,8 +146,8 @@ impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<Arc<U>> for Ar
 
 // SAFETY: It is safe to send `Arc<T>` to another thread when the underlying `T` is `Sync` because
 // it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally, it needs
-// `T` to be `Send` because any thread that has an `Arc<T>` may ultimately access `T` directly, for
-// example, when the reference count reaches zero and `T` is dropped.
+// `T` to be `Send` because any thread that has an `Arc<T>` may ultimately access `T` using a
+// mutable reference, for example, when the reference count reaches zero and `T` is dropped.
 unsafe impl<T: ?Sized + Sync + Send> Send for Arc<T> {}
 
 // SAFETY: It is safe to send `&Arc<T>` to another thread when the underlying `T` is `Sync` for the
-- 
2.40.1.698.g37aff9b760-goog

