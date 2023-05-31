Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41AAC77B7A
	for <rust-for-linux@archiver.kernel.org>; Wed, 31 May 2023 15:03:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233824AbjEaPDP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 31 May 2023 11:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231215AbjEaPDO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 31 May 2023 11:03:14 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D69F193
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 08:03:00 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bacfa4eefcbso2289457276.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685545380; x=1688137380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1lJ5Uf+EcwGNh0b/3i4Z2YdTIWfA6+IGf6dwAn0jzq8=;
        b=5OgM51JSEe6PSOdk5CNCvcME9wVy09vhid7JxBNb7qJiDjF7E4J7ZYoqTcZXK7G/4Q
         fBVGQRIPzqWJ4sY8Qc07prjIwDuUtokHF0Ed2I4HNciIkLqmXpEkND10y5X5aZpnha+V
         JLsxaK5gm0+gDI/poxo2GLrXFxNVTsbSH75EjWelp+iT0fqpaAFlShM/OEEAy9Q/Z1oH
         U4OocqQZEmuNGhc3RV03kZUW3fYLSdLdiSfHU6Vi4FDgN/sFLOHJKfa+8/E/hJkpUra5
         Sjmd9/kBBv4MLQcWszMrplLIURaRI+p5FKBw8o4fAZ4CJcaOMFqdKw5U+Lr+aVFM4OvC
         h9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685545380; x=1688137380;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lJ5Uf+EcwGNh0b/3i4Z2YdTIWfA6+IGf6dwAn0jzq8=;
        b=gkhW25kXN1wm4tHnGK47SfiLAV/mAbJQ3fZypGzXfDBvRsWio2o8gqI95CxP7JEejD
         nwA1xfITE3E5y1hsB/PODJcg68JWyqwKOvZSQKWV81GHjZOkyOBxiNIHdT/Xh88s4JbK
         yszBUK/XhHMAoo3XPcZ0Y9ktM1eV6S8+E9bJqBknlVYGleTU7UPK23Uk45HDLHwPL0if
         6i6sfMAsfKROx/Hga7xN/XSyi4eMZCCC46ZyK5D8LSly6i4EdIsBZZ4yRM3FC/PjEEh/
         T7PvqL6So+BcW+myOs6sHkfybrgDZDK4nVS1WYy+981/CGUtoIAL9yxNA6d8xlcKZHFb
         DFQw==
X-Gm-Message-State: AC+VfDzCRkLLkxQSZpi7Yfap6T6qaH0YpihypH1sU0N8EddpELVbcxKZ
        I3mTzp8g4ZNLktWF7d6XmSlZbsBl2ZOwgmYTN0WHZcFwcqJO3pr2rDsIQK9vgeMTojF0Fp4Xeop
        yOK2yg2ZUf9z319NGrW8u64e8Ar9SDoGadt/jv9P3F6ZQwzzexDJSVScam4MVJxPczkw8ZtTrca
        1P+RIM
X-Google-Smtp-Source: ACHHUZ7jvbBEzbGMgkGfuh3So2mtf2RBfJvxuGuJkkzHzas325wMoQJCyO0TQgPDMkaiP/e7MDeDFu9c3SC1WFw=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:100e:b0:bb1:569c:f381 with SMTP
 id w14-20020a056902100e00b00bb1569cf381mr1335253ybt.1.1685545379836; Wed, 31
 May 2023 08:02:59 -0700 (PDT)
Date:   Wed, 31 May 2023 14:59:39 +0000
In-Reply-To: <20230531145939.3714886-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230531145939.3714886-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230531145939.3714886-5-aliceryhl@google.com>
Subject: [PATCH v3 4/4] rust: task: add `Send` marker to `Task`
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

When a type also implements `Sync`, the meaning of `Send` is just "this
type may be accessed mutably from threads other than the one it is
created on". That's ok for this type.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/kernel/task.rs | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index 526d29a0ae27..7eda15e5f1b3 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -64,8 +64,14 @@ macro_rules! current {
 #[repr(transparent)]
 pub struct Task(pub(crate) Opaque<bindings::task_struct>);
 
-// SAFETY: It's OK to access `Task` through references from other threads because we're either
-// accessing properties that don't change (e.g., `pid`, `group_leader`) or that are properly
+// SAFETY: By design, the only way to access a `Task` is via the `current` function or via an
+// `ARef<Task>` obtained through the `AlwaysRefCounted` impl. This means that the only situation in
+// which a `Task` can be accessed mutably is when the refcount drops to zero and the destructor
+// runs. It is safe for that to happen on any thread, so it is ok for this type to be `Send`.
+unsafe impl Send for Task {}
+
+// SAFETY: It's OK to access `Task` through shared references from other threads because we're
+// either accessing properties that don't change (e.g., `pid`, `group_leader`) or that are properly
 // synchronised by C code (e.g., `signal_pending`).
 unsafe impl Sync for Task {}
 
-- 
2.41.0.rc0.172.g3f132b7071-goog

