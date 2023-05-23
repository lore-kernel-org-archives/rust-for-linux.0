Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE63C7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 May 2023 14:45:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237200AbjEWOpd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 May 2023 10:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236481AbjEWOpc (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 May 2023 10:45:32 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB8BE12B
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 07:45:25 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-96fffd1ba46so215044166b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 07:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684853124; x=1687445124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ4w9FZLzrevw3euUgZ/CnJwq2fkRa+GrhkB6vuUVZU=;
        b=DM09wBFceGQyjzVeQn88f9gT37GoP8CdPRKIqccyn5klXMCzMXmxgXiA33U1xBdApV
         phKL7Y6oJqHMuNyPNkbrA8fkuJoSJtclCT6DlV4sbNFhEYoRh71OR3w1YoSmECRVdrmX
         bJ+EqUNSt4SfVYAfMThw8o4+OOuqNeNXdCilulQS1pEFabKB0fed/m9nsAE3FHgf28Tt
         5s9oD0Ammk7IScrdsNQ9otYN9ftb17Wl/mIR2fwtLw0Ei+SJ5U4VKFjJriNnbE5Ef95u
         se6yubaEdwOhFET+po90z+DhM/u2x4CqHeuJOKgTgzofYW75jZE4kv8+8G3kvzEMoYIB
         CFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684853124; x=1687445124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lZ4w9FZLzrevw3euUgZ/CnJwq2fkRa+GrhkB6vuUVZU=;
        b=iWwgkuUZ3hteIEW60y76hfdcXk+bqV+y2Zk7EVswHxCoqEB4fQ2ZSekdITCwbMEB6J
         7ds3fWrfVddUWvC0RCzxSDjQt8X855Zt0Lg+h5XY3MF0MjHFQTE8mgnUBm15AhaXohQk
         +/eVIaeGtqzulnImjpL2Msw8GeE73vR/CswIP3fU1pcPs2L8fyk3+iFOJp835JOt+RSa
         pKf3zUcfkCqIbu0NTaPQwNFfMoixSj9F8QzXWjLiXMm+Yp9XeEoh1meEPbTFIJsNNAqi
         SHPRqXQX3Vss5rAHWxBKpdeDK0DsiV87SrJ+hVojkbkbFZ6FaDU9SEd/FAqwWqp59fGn
         f5zw==
X-Gm-Message-State: AC+VfDzi5TLFhwNtsYfuTGe/ORG8imU51tysAewdLqv7S4r760ER09em
        AvmkhxvGvpQgGjfNoMHLlb8K0mZYrObwkmg=
X-Google-Smtp-Source: ACHHUZ5Uknm/33fO8x2pU4Gkt1Qyr7oafKZ5WmNy1nlRwLRdCV5Y5wya147tNmIt/yqie5nQUQ62+Nxb6oSmcW0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:ad82:b0:96f:5864:eb73 with SMTP
 id la2-20020a170906ad8200b0096f5864eb73mr4342619ejb.9.1684853124405; Tue, 23
 May 2023 07:45:24 -0700 (PDT)
Date:   Tue, 23 May 2023 14:44:16 +0000
In-Reply-To: <20230523144418.1250547-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230523144418.1250547-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230523144418.1250547-3-aliceryhl@google.com>
Subject: [PATCH v2 2/4] rust: sync: reword the `Arc` safety comment for `Sync`
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

The safety comment on `impl Sync for Arc` references the Send safety
comment. This commit avoids that in case the two comments drift apart in
the future.

Suggested-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/sync/arc.rs | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 87a4c9ed712b..4d10f9868d9e 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -150,9 +150,11 @@ impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<Arc<U>> for Ar
 // mutable reference, for example, when the reference count reaches zero and `T` is dropped.
 unsafe impl<T: ?Sized + Sync + Send> Send for Arc<T> {}
 
-// SAFETY: It is safe to send `&Arc<T>` to another thread when the underlying `T` is `Sync` for the
-// same reason as above. `T` needs to be `Send` as well because a thread can clone an `&Arc<T>`
-// into an `Arc<T>`, which may lead to `T` being accessed by the same reasoning as above.
+// SAFETY: It is safe to send `&Arc<T>` to another thread when the underlying `T` is `Sync`
+// because it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally,
+// it needs `T` to be `Send` because any thread that has a `&Arc<T>` may clone it and get an
+// `Arc<T>` on that thread, so the thread may ultimately access `T` using a mutable reference, for
+// example, when the reference count reaches zero and `T` is dropped.
 unsafe impl<T: ?Sized + Sync + Send> Sync for Arc<T> {}
 
 impl<T> Arc<T> {
-- 
2.40.1.698.g37aff9b760-goog

