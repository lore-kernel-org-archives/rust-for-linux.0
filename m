Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D40BC7EE2E
	for <rust-for-linux@archiver.kernel.org>; Thu,  1 Jun 2023 13:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbjFANuA (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 1 Jun 2023 09:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232258AbjFANt7 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 1 Jun 2023 09:49:59 -0400
Received: from mail-ej1-x64a.google.com (mail-ej1-x64a.google.com [IPv6:2a00:1450:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 418A718B
        for <rust-for-linux@vger.kernel.org>; Thu,  1 Jun 2023 06:49:57 -0700 (PDT)
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-94a34a0b75eso57530466b.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Jun 2023 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685627396; x=1688219396;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=az0YAt2KTk16nw2JnbQbsBwE6ykYTuim3D59K9WH+fw=;
        b=yHQRUcVRjeNWwyQCxaJU9Cr8mkagox0Gt9ILgBA9i8OFkTV63hblKgqcjOAETquax/
         TWWKRKnZmGuHTueetjFdjV/IZon++qASbXJaAxRHYzJQBYLnk92bPCId3XPnZQ14nWna
         WKWlVjvLgrXgx+F5Cu0JuyHQe5zVpWtiLM9LcOApjBLXjkpe8yuWSPixgpEmce/uX3qv
         gsIJ5mzdhDECyYNs7VaQJmcw5B/Lep9EzdmbRuehMiKMRTMoBvGSySBgOGMEvumivUMa
         axQFdvSLoMpq2LW7ho4XbRHfxLn5TyNk48tuv/p+1NqnuU1TeclsRH1nPYXI1tv8Fom+
         vaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685627396; x=1688219396;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=az0YAt2KTk16nw2JnbQbsBwE6ykYTuim3D59K9WH+fw=;
        b=KSoS4EikUnkgbrUBwVW728pglR/v64Xwh4uHCFJUil8ngQjNceQTP08Fu6gIzTVnPK
         zKWMVPqTjZ83PVz5NioiJjKlqiJW7fug6+TGNKYVsQG8uM7BQpNywJxUGjz9iKpjglqP
         UIrBHQRQltuUHrvZDHJfxwY3lZYWZsZyOzc9ZXvhUHb2ayCT6sVvKL0MySfUH6brsB5t
         AITTOriPEQa3QbPNRUVKpiKyZxxEnMUB1QBS62zwcCP8l/n4cUIz35wfERvEHlshxWQE
         EVEMYXbVKxpjwzS8hnaH2X/JsrDDULL4Iq4AHvk+REEg0RF6Bxp2btrRL5LDkfqtsw39
         n2RQ==
X-Gm-Message-State: AC+VfDwFIKUrrT6PhgmWCDpTSZjUdcu+0wnf+LJ4ZhtDBuZkYTSKk32I
        rR63dGuDX4psZ+CvVcDMXV7djzXY/nG3e55D6i60JBPK2cs9G6B4NrLzpW0BRgo3wN/fMeM3Ys1
        1sjnb8myLiPut7cxy4rkBT05GhBY9gTPAqmtm4rsqeDlbf43MDogUPk27qcW1qjVhaUy3iSK3OJ
        MmBF6g
X-Google-Smtp-Source: ACHHUZ6y558j5AwsRrstwPTYGwrzuoI4R2q5Hll3BeCCQsm0d7NK4qsQFtXx0QME/IjY8y5dnLNNjCUJZBL7QmI=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:270c:b0:965:b935:91f6 with SMTP
 id w12-20020a170907270c00b00965b93591f6mr2284491ejk.14.1685627395637; Thu, 01
 Jun 2023 06:49:55 -0700 (PDT)
Date:   Thu,  1 Jun 2023 13:49:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230601134946.3887870-1-aliceryhl@google.com>
Subject: [PATCH v2 0/8] rust: workqueue: add bindings for the workqueue
From:   Alice Ryhl <aliceryhl@google.com>
To:     rust-for-linux@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
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

This patchset contains bindings for the kernel workqueue.

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

Changes since v1:

Most of this patchset was rewritten based on Gary's example for how
field projections can be used with the workqueue.

I have also added some examples of how the workqueue bindings will be
used. You can find those in the last patch of this patchset.

v1: https://lore.kernel.org/all/20230517203119.3160435-1-aliceryhl@google.com/

Alice Ryhl (5):
  rust: workqueue: add low-level workqueue bindings
  rust: workqueue: add helper for defining work_struct fields
  rust: workqueue: implement `WorkItemPointer` for pointer types
  rust: workqueue: add `try_spawn` helper method
  rust: workqueue: add examples

Wedson Almeida Filho (3):
  rust: add offset_of! macro
  rust: sync: add `Arc::{from_raw, into_raw}`
  rust: workqueue: define built-in queues

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers.c                  |   8 +
 rust/kernel/lib.rs              |  37 ++
 rust/kernel/sync/arc.rs         |  42 ++-
 rust/kernel/workqueue.rs        | 631 ++++++++++++++++++++++++++++++++
 scripts/Makefile.build          |   2 +-
 6 files changed, 719 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/workqueue.rs


base-commit: d09a61024f6b78c6a08892fc916cdafd87b50365
-- 
2.41.0.rc0.172.g3f132b7071-goog

