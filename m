Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D7DC7EE29
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 May 2023 14:46:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237345AbjEWOqF (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 May 2023 10:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234406AbjEWOqE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 May 2023 10:46:04 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B5D11B
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 07:46:03 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ba8bab3b392so9966547276.1
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 07:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684853162; x=1687445162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r16leosVab/uLX7D74lYCjCyQd2teI7cw9N2TnAgQsA=;
        b=Hd/uUrDISL30aYgFZm7tT9bNmVfu5Hj5bE8z8pqztEcp7fh7IokeZvyVl4+oOgQpv2
         1msJ8stWSASsldMCECBLTZSZbmB67D/T7j1oTM2DeUMplouDBShHymsHyviGEf60tBiM
         d5vZPUEHKU0E12wSNBYOP4P1NYGjDUM5j4FC2jB/qherVgJcq2o2o9Lx9KuA3cUjjFbh
         fGZSVMVBEzRtgYXzq81Yb06w9UEFGdV9cfI9x14itoTZcmT+hYvViRiWZtK/VEhv4HGE
         vpDT/Rx7Cux0WO7uyvBET3G0qLUukSAXX6k4OFRmxbn4iL0lJKuXNJeqS7trW8tXqQhC
         akzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684853162; x=1687445162;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r16leosVab/uLX7D74lYCjCyQd2teI7cw9N2TnAgQsA=;
        b=kQqvvM3GEvbVVf8OU6ot7SkPMBILdbH44faFDD9AaJlAmzAQ30FCVevguFzoPQQs5p
         vZ/ZQFZqBpunK/EPJTlxaH3XUafhArJZfYmozgUk2AMab9QmoOJbgwOmAhNA0V3Q0pki
         y3mtBnRbdf3lW86L/JT08l+o0HUfRXg/R2RKjXVcs3KswUQ+0GiYw+JcKoo4qjq12edL
         Ua7GiWeYxYYH3zP0O6+k+nPBYuT5FOyx1BkhWJg1fC7IzIIA+WPKLJg+F2pLivMet5d9
         zCDolbp46jvC+fNNe4UZzbHwNqSMUvdG+0h+HjG8UEXiwkDXupjbofud5hwYxN47YLfI
         8Y1Q==
X-Gm-Message-State: AC+VfDzVABtRzo16+LxoDC+WL0HgPvfwtAFMUQRZBJDyLoO9gJ9jWrub
        BAENMFINm5uuPY15UE6oG0m3PcY1Re+eBDQ=
X-Google-Smtp-Source: ACHHUZ5GGO9M9zi95iQU/We2rgCa/AZ2NpDuHENeetlWQiYs4A5/3srhvSG4IjsY4UStilvM/k6fLMYqCtGwmFY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:9989:0:b0:ba2:2d0e:a752 with SMTP id
 p9-20020a259989000000b00ba22d0ea752mr8278874ybo.6.1684853162123; Tue, 23 May
 2023 07:46:02 -0700 (PDT)
Date:   Tue, 23 May 2023 14:44:18 +0000
In-Reply-To: <20230523144418.1250547-1-aliceryhl@google.com>
Mime-Version: 1.0
References: <20230523144418.1250547-1-aliceryhl@google.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230523144418.1250547-5-aliceryhl@google.com>
Subject: [PATCH v2 4/4] rust: task: add `Send` marker to `Task`
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

When a type also implements `Sync`, the meaning of `Send` is just "this
type may be accessed mutably from threads other than the one it is
created on". That's ok for this type.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>
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
2.40.1.698.g37aff9b760-goog

