Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBD2C77B7A
	for <rust-for-linux@archiver.kernel.org>; Wed, 31 May 2023 15:01:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233575AbjEaPBh (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 31 May 2023 11:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233572AbjEaPBg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 31 May 2023 11:01:36 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05AC9121
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 08:01:35 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-96f4f1bb838so479341566b.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685545293; x=1688137293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q+2I5zSt9CeXJ84cI2DkRkCdZ4Svm4rmosqyRFgB4Q=;
        b=bnNa4BzNnMkAV8sNhlJArseXSoa/Cp3RaANBWBzd9VxjyIDTlr4hV7uLR/Fqr9sPFg
         V3T4M1u/Cqm0TGKtaApBthh754cK9SVYKk7sf7q3cjbDyz6YZOGdIstimjRAUVz5u2hR
         8m671arTsCNlICRB/UITLp9bQ0bfiVv7ZPXC8NfTxKukxFdruO1EVpr8lAweg52Zhtt/
         L3D8bfG+9M6OBkd6fuW1h7I971Cedkt4wE2UQtCSpAXNcu0eSmZhV39uhvD0x4mx1YER
         ls/kFUZu9/H1vEW7IHInniok08Iozig+z3zNg4JUoo/DWBFqr6kTLIvM4uP263wWuHu9
         tIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685545293; x=1688137293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Q+2I5zSt9CeXJ84cI2DkRkCdZ4Svm4rmosqyRFgB4Q=;
        b=Vqd3fLVQshCKAjfVBrW3/UOGUonwAwu6bdOn/B9Xut2F/fkx8FIVf0iLWCropIPAhV
         25SFtzS3GgK5eOlBYPoS89owYv6uoYOYf2DV68BSQgHtzKKa+kvuG1o2DdmDzBBSRLCG
         KMLWj0zVQzM/j+uiXweEG1qQD4gUE3sHw1heVEw3S1BrRkePipphENXqD5vC/I+3bYpc
         dSV4RujMZQkDdQ11gSeD+1pxkMK5zg2/i6M1rM9/s9lDGiO4tk8idAlxWUc0i2GcSQXO
         g2jzxYuZI3D+PS2t0RBdsxYxDFu6qhx6LkKC4leSTi882PV/u/nnqAEC9uW1FqCAaqka
         +9PQ==
X-Gm-Message-State: AC+VfDxq36qJkd5RH+St5leTJJO3ztDYmmGhYlOWjFDDyJis2T8sr034
        HORlJhy9TwRvoCs6vGrJkpjhLo8COJcjQAfAYzA6BW3BLAkReIX5jiNYsbu1D+r3Im7ZUGBErWt
        9jHf66zMsLQf2dASwNC/u+9Eed+hhW6dpow+pinFyTOC/a9dWXusUGByEDPpNOugjvmLk2/OOr1
        Cp2dyP
X-Google-Smtp-Source: ACHHUZ4rFIpC5Ll9CIoCxXSbzxO4gKHoA+ZHFByEbtLUbWCcxVxu8ZUSKtcxpuigVxxLU6jw6KkDmlloVWmty3w=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:906:846d:b0:96f:5348:6ce0 with SMTP
 id hx13-20020a170906846d00b0096f53486ce0mr2119526ejc.5.1685545293508; Wed, 31
 May 2023 08:01:33 -0700 (PDT)
Date:   Wed, 31 May 2023 14:59:37 +0000
In-Reply-To: <20230531145939.3714886-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230531145939.3714886-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230531145939.3714886-3-aliceryhl@google.com>
Subject: [PATCH v3 2/4] rust: sync: reword the `Arc` safety comment for `Sync`
From:   Alice Ryhl <aliceryhl@google.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Martin Rodriguez Reboredo <yakoyoku@gmail.com>
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
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/kernel/sync/arc.rs | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 3ad831603cf4..3da84187ecf4 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -150,9 +150,11 @@ impl<T: ?Sized + Unsize<U>, U: ?Sized> core::ops::DispatchFromDyn<Arc<U>> for Ar
 // mutable reference when the reference count reaches zero and `T` is dropped.
 unsafe impl<T: ?Sized + Sync + Send> Send for Arc<T> {}
 
-// SAFETY: It is safe to send `&Arc<T>` to another thread when the underlying `T` is `Sync` for the
-// same reason as above. `T` needs to be `Send` as well because a thread can clone an `&Arc<T>`
-// into an `Arc<T>`, which may lead to `T` being accessed by the same reasoning as above.
+// SAFETY: It is safe to send `&Arc<T>` to another thread when the underlying `T` is `Sync`
+// because it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally,
+// it needs `T` to be `Send` because any thread that has a `&Arc<T>` may clone it and get an
+// `Arc<T>` on that thread, so the thread may ultimately access `T` using a mutable reference when
+// the reference count reaches zero and `T` is dropped.
 unsafe impl<T: ?Sized + Sync + Send> Sync for Arc<T> {}
 
 impl<T> Arc<T> {
-- 
2.41.0.rc0.172.g3f132b7071-goog

