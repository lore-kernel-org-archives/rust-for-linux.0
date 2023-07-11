Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D85BEB64DC
	for <rust-for-linux@archiver.kernel.org>; Tue, 11 Jul 2023 09:34:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjGKJeA (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 11 Jul 2023 05:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjGKJd7 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 11 Jul 2023 05:33:59 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A864F92
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jul 2023 02:33:58 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c4e0342c50dso6470519276.2
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Jul 2023 02:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689068038; x=1691660038;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i+zDEU10wYnr89r/fFOaqQkCw/zLk+nePTObPe5KGak=;
        b=1/0toChTWWBAndjOWOH9RFI8ug3gqZRQwEc1/yzk+oja/PSEbqdChv9Kry6ZVjdZ92
         Eng3IzHLuqtXuAdURFSrHtjDEy9A6JmLUL14Nq/Poo7qX8i5Ln2Ku0kFtNudzONYodDd
         pTaM7lsyVVzcl7E/Tyf9sTbYnC0SDB5oRRMloI2bg5XIVuSfk1yBAVPBXxD0TaWYLWoo
         a0fFQWYcCygUCnIqelFEujJ+DegjhdOy63yNjndYGKFToh2oOI7u4LJc0QI5vNPQPd90
         c5WLoT8fa0L1f9BFWCGiOX50YKPbVVMX50NrOHASLiGSzGUEEiza6hcHQzlnrMXOlVEl
         so8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689068038; x=1691660038;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+zDEU10wYnr89r/fFOaqQkCw/zLk+nePTObPe5KGak=;
        b=b/sNymkuWImcQsgpzy9+3o+kMxizqGCBjPuQOQAAEGi84blujetC+IlDFrPAM7XQNI
         FfYqBmewmAYervlMgva1ci9yi6OMb6P2B5sNA9L5j6/w3m/RgyHNaMpsekuTcxIPUuJ+
         uUHJI/ovZhvu2TaPW0lS9b9q2ognV71api8JHkm+76sdO6wT5mFcJDl9ASfhoczm3V44
         GwcLZY9xWxrJ6WBmsQp+OasO1lh0g4Uobttelnqo0ji5X1Ea0X5erQHAPdsscEClAc+7
         /mXO10gI4DO4feYvYwDx/iS01QI4MwDGHt7YAp4nzTMUKhTvalvBrqhZTwD+i3l5QVpq
         s5xQ==
X-Gm-Message-State: ABy/qLaTjm9SBQnMco9RERo7b9Vjl9XD1xbqVuQ6G9/zakm0Ez2a8+1/
        U5VF4HJX5FmFRkYTeWBTacO2q7j/NOmcMUlGCOTY/jJfYqIBaKWyjftuNGx2IyzP4InMdvu0BaC
        EVXuUQuFJ1JkB82ApkYWzNfoRkRjhDE7URZnhM4jWMYl4bmBNdi+gvzjcNZ73hXU6NIIMsViWUA
        /9jYb4
X-Google-Smtp-Source: APBJJlG7CVg8ZIjiHugsIIAwsKz38An7XLFFQ67zguULn2KMYeTniDrNRdInRiElbolNDz0ZuyBpq8JoTzIBmpc=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:ad54:0:b0:c1a:dc07:1d74 with SMTP id
 l20-20020a25ad54000000b00c1adc071d74mr135384ybe.0.1689068037722; Tue, 11 Jul
 2023 02:33:57 -0700 (PDT)
Date:   Tue, 11 Jul 2023 09:32:54 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230711093303.1433770-1-aliceryhl@google.com>
Subject: [PATCH v3 0/9] rust: workqueue: add bindings for the workqueue
From:   Alice Ryhl <aliceryhl@google.com>
To:     rust-for-linux@vger.kernel.org, Tejun Heo <tj@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Cc:     Lai Jiangshan <jiangshanlai@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Alice Ryhl <aliceryhl@google.com>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This patchset contains Rust bindings for the kernel workqueue.

One of the primary goals behind the design used in this patch is that we
must support embedding the `work_struct` as a field in user-provided
types, because this allows you to submit things to the workqueue without
having to allocate, making the submission infallible. If we didn't have
to support this, then the patch would be much simpler. One of the main
things that make it complicated is that we must ensure that the function
pointer in the `work_struct` is compatible with the struct it is
contained within.

The original version of the workqueue bindings was written by Wedson,
but I have rewritten much of it so that it uses the pin-init
infrastructure and can be used with containers other than `Arc`.

Changes v2 -> v3:

 * Moved dependency patches so they are first.
 * Various documentation and comment improvements.
 * Changed implementation of `Arc::from_raw`.
 * Use __INIT_WORK_WITH_KEY instead of __INIT_WORK and use `LockClassKey`
   where appropriate.
 * Removed PhantomPinned from Work. This depends on [1] for correctness.

More detailed changelogs can be found on the individual patches.

v1: https://lore.kernel.org/all/20230517203119.3160435-1-aliceryhl@google.com/
v2: https://lore.kernel.org/all/20230601134946.3887870-1-aliceryhl@google.com/

[1]: https://lore.kernel.org/all/20230630150216.109789-1-benno.lossin@proton.me/

Alice Ryhl (5):
  rust: workqueue: add low-level workqueue bindings
  rust: workqueue: add helper for defining work_struct fields
  rust: workqueue: implement `WorkItemPointer` for pointer types
  rust: workqueue: add `try_spawn` helper method
  rust: workqueue: add examples

Wedson Almeida Filho (4):
  rust: add offset_of! macro
  rust: sync: add `Arc::{from_raw, into_raw}`
  workqueue: introduce `__INIT_WORK_WITH_KEY`
  rust: workqueue: define built-in queues

 include/linux/workqueue.h       |  17 +-
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers.c                  |   8 +
 rust/kernel/lib.rs              |  39 ++
 rust/kernel/sync/arc.rs         |  49 ++-
 rust/kernel/workqueue.rs        | 659 ++++++++++++++++++++++++++++++++
 scripts/Makefile.build          |   2 +-
 7 files changed, 767 insertions(+), 8 deletions(-)
 create mode 100644 rust/kernel/workqueue.rs


base-commit: d2e3115d717197cb2bc020dd1f06b06538474ac3
-- 
2.41.0.255.g8b1d071c50-goog

