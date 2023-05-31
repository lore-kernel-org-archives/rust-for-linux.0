Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25F9C77B73
	for <rust-for-linux@archiver.kernel.org>; Wed, 31 May 2023 15:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233090AbjEaPAN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 31 May 2023 11:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231640AbjEaPAM (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 31 May 2023 11:00:12 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D986A11D
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 08:00:10 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-568960f4596so59140607b3.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 08:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685545210; x=1688137210;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kgt3lW2r0aoY0DDLcZTyq/QALzXXToKg0VwThNVsEZs=;
        b=DxCZiH1EJ6GTCeR7M1xZCCD83a49cOiQ9TFOb2cpTE+xJykFniGsMxkSKaNxVhgrie
         1ZUAUK64KCNds1oQP+SCgoYSGdYMWl4o7suvBgY/fiRhtcgkzNsNtzRN+NWwpIus8zx3
         Vae/ZhynetGaQPIjblP8vLMJRXOMjpcH629xoRqz8t5E2fEZrJswrNEjr6nEe/aHzUTs
         RF6bxBNTe+6jyJyimjvXZ6/h8o3aJ6JwIzR0C63FS93ayeG0tDJuGhpRYKeAhQSqums1
         4tURIQ+m9vlVvRiXXfNzi4B2tWPJXtV8fwHUDZ2/v9rrUFsoB2tqZmw9E2ZE5l2J9MU8
         roSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685545210; x=1688137210;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kgt3lW2r0aoY0DDLcZTyq/QALzXXToKg0VwThNVsEZs=;
        b=SBC/hvz5kEpYtNvcgSF7FimVPDjNA5ct4FeeahDN2Sqt9fEbNXzDlfCq1++9kuzWle
         XkZ1sbw3m4GxAkDrwmeJIwDeU4Z1Fp8aJR15V1mr1XHDdIVXeh2qOQVtQewzBGbaz0+v
         5MHjrCMRvW2E6Dxiy99iY3qQBuy2Vmg/2QcP4ENSIonbfDIZjG4dhR9XJR6i7QQ3ohcl
         4xMPtQ4OWGV9wGtT5pwJ890YnnpuPBBILnBBWIoHOirQxOEe0yBb3+S6ZFwmEElZqf2R
         GCs2UHFX6DWMD0Jrb4EdZ6X0FrzAB5ciI1PqQfRzh6HQdTtRFG9UA6cYoFIw82I/QTc6
         43Hw==
X-Gm-Message-State: AC+VfDzE5uxt9gvH/cvNgHPNMGOYnHTMK2uaiB2LT+oAwJ9qUK3vtF2Y
        SP1uAyJgF0OpltfRksTEOWveC55Xjmv2/tYlUC74msNQvW3jk4J5tqUyQ9a8XllDQrwhsuBNxlY
        TgbfsLWraaA1vpsU7MXetaK3oGJg81Mph8E5OabK8E2RRuoYz9OstKUoLO348VB+wva2BHmAIdn
        iK4+Ah
X-Google-Smtp-Source: ACHHUZ5PGbClUzmUIu5JqGN5ZZy5XtiWsjT/HcmZjSMbK2ZzZTMOkv46r/SbQAgSQWglSlAAgf/x7TZItrF2jmQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:ae05:0:b0:565:9f59:664f with SMTP id
 m5-20020a81ae05000000b005659f59664fmr3434986ywh.6.1685545210063; Wed, 31 May
 2023 08:00:10 -0700 (PDT)
Date:   Wed, 31 May 2023 14:59:35 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230531145939.3714886-1-aliceryhl@google.com>
Subject: [PATCH v3 0/4] Update thread safety markers
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
        linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

In Rust, the `Send` and `Sync` traits are used to mark in what ways a
specific type is thread safe. In this patch series, I add some missing
thread safety markers and improve the documentation related to them.
This change will let you compile some code that would currently fail to
compile even though it doesn't actually violate any thread safety rules.

You can find a definition of what these marker traits mean at [1].

Changes since v2:

 * Removed "for example" as suggested in [2].
 * Added Reviewed-by annotations from v2 review.

[1]: https://stackoverflow.com/a/68708557/1704411
[2]: https://lore.kernel.org/all/20230523165027.71600b4b.gary@garyguo.net/

Alice Ryhl (4):
  rust: sync: reword the `Arc` safety comment for `Send`
  rust: sync: reword the `Arc` safety comment for `Sync`
  rust: specify when `ARef` is thread safe
  rust: task: add `Send` marker to `Task`

 rust/kernel/sync/arc.rs | 12 +++++++-----
 rust/kernel/task.rs     | 10 ++++++++--
 rust/kernel/types.rs    | 13 +++++++++++++
 3 files changed, 28 insertions(+), 7 deletions(-)


base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.41.0.rc0.172.g3f132b7071-goog

