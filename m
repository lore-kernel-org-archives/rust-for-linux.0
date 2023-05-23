Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65929C7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 May 2023 14:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237198AbjEWOpw (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 May 2023 10:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237361AbjEWOpu (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 May 2023 10:45:50 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB7E126
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 07:45:48 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-babb5e91ab4so6581200276.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 07:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684853147; x=1687445147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cirt2ON6amstA/3YNx8Dl/DrSfD+lKUlEarHqMF6nxw=;
        b=DqYCWPhParszen3Hd8C6NALzsNq4RE0GYoUKErPQQT/Rk8O/vXKcFFl4bB4qWAWbtP
         kkux8OKOZOKVkJsvkJ2Ny+BMhW6JZ8Lp8rG5soKSuqkKXV72FR+NUz5qjTBaOP88KeGN
         H0AC4WDcLBg1UrXmePmLeZyRcirBCEwzjJ7wSBiRt+97j9WoXoaqf2oKm7wLH7DlYFfe
         1Pv8kbdl6HkciPp6/Wmquuc5gUJx5SC+dKxW9tuwanpD0iX6llPgQm/VSavm+1y3b3PR
         h/Y217d0niQUL9S2/ueC8YV1UCjcINwLp02CAsb6llA5VM/mPUIIgFMI864kmpC1XiE7
         d/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684853147; x=1687445147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cirt2ON6amstA/3YNx8Dl/DrSfD+lKUlEarHqMF6nxw=;
        b=co7FSDXddxhgbpjmNiz0uELvLyxPnoBgyp66zR64U0oKIZcY0SAd161bDbjHO+EH1Z
         Dmj0hdfvNbg+Br3ZRgYQfnj0XV9j898z9CuuYvzr0FaCGOEZjyRBezcrd13zv+0H7UmV
         +4z/YohMbJ2uJFrChhKFLo6D8T0uJ4422zsdduLudkze0hjZiXbckQ52E1GyMyalxzFI
         MygVzj0bQjYuaLQVGVI3N/4eIRY6HEA6US9vOcPS3iIyvAXsWpNyfNXfhY2fvCdwHtmq
         qlNJIKRoJPIDGxofwzbQSnMlhDcHzZKXDwXKSFH6aZ3ukvyVDQnwTcZAGrsrNnapgIzB
         OfBA==
X-Gm-Message-State: AC+VfDxz+VeKMpsbcKMGQVLXkv3YenmYKL9MQo269YB2LP8K8/1UwNRw
        GGZnMhlmC1lCe/1qnl2ZIufPKERsIBmtO/8=
X-Google-Smtp-Source: ACHHUZ5HGv5J4DLwutjlh5WRFIrH9ud/Hd5FtZAOkFZuacDfLlkK3smnxJzIXubwF4Z90tgv7QY8eKQgKy5wLVk=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:949:0:b0:ba8:6422:bbec with SMTP id
 u9-20020a250949000000b00ba86422bbecmr8780701ybm.4.1684853147290; Tue, 23 May
 2023 07:45:47 -0700 (PDT)
Date:   Tue, 23 May 2023 14:44:17 +0000
In-Reply-To: <20230523144418.1250547-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230523144418.1250547-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230523144418.1250547-4-aliceryhl@google.com>
Subject: [PATCH v2 3/4] rust: specify when `ARef` is thread safe
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

An `ARef` behaves just like the `Arc` when it comes to thread safety, so
we can reuse the thread safety comments from `Arc` here.

This is necessary because without this change, the Rust compiler will
assume that things are not thread safe even though they are.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>
Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
---
 rust/kernel/types.rs | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 29db59d6119a..1e5380b16ed5 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -321,6 +321,19 @@ pub struct ARef<T: AlwaysRefCounted> {
     _p: PhantomData<T>,
 }
 
+// SAFETY: It is safe to send `ARef<T>` to another thread when the underlying `T` is `Sync` because
+// it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally, it needs
+// `T` to be `Send` because any thread that has an `ARef<T>` may ultimately access `T` using a
+// mutable reference, for example, when the reference count reaches zero and `T` is dropped.
+unsafe impl<T: AlwaysRefCounted + Sync + Send> Send for ARef<T> {}
+
+// SAFETY: It is safe to send `&ARef<T>` to another thread when the underlying `T` is `Sync`
+// because it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally,
+// it needs `T` to be `Send` because any thread that has a `&ARef<T>` may clone it and get an
+// `ARef<T>` on that thread, so the thread may ultimately access `T` using a mutable reference, for
+// example, when the reference count reaches zero and `T` is dropped.
+unsafe impl<T: AlwaysRefCounted + Sync + Send> Sync for ARef<T> {}
+
 impl<T: AlwaysRefCounted> ARef<T> {
     /// Creates a new instance of [`ARef`].
     ///
-- 
2.40.1.698.g37aff9b760-goog

