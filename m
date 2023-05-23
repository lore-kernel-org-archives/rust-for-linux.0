Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA6BC7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 May 2023 14:44:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237085AbjEWOo2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 May 2023 10:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234888AbjEWOo1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 May 2023 10:44:27 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83100CD
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 07:44:26 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-ba8b0fc0d35so10649070276.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684853065; x=1687445065;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yPN2BpzOKR7Rs0wxh0Zdg1UkwhhxDvNrZrq1CaLSSZQ=;
        b=B7M4fxocDWncwNJOfecUOc8pS/sCVvN9OXU6KGy4jrD0ZzyajwUU2BDl1AikpLbEIh
         KSyWuw2wF3Cp5ZRDPAOaiNnn80ftEkOCAg6a8n6b/cDc1+ruQaE7BFWieqx7Nfaxbl0P
         rrLSe/jYHNRr2mRLZym1dcwVfPvD2kjh8n6g6t0mXyWe/MTU+l6gMqEr7LaZ0wzSSgAj
         B+OSQ+yfQ3ugA56jl33nP5KbTNVE9BYVwjP3ma/9YBy3U9UnKSnGtW6OFJ7o3R5PZQVa
         pCZJoHuoOremB/BNh1N8aKjD3J+eUzUl3Ki58VQbA2V7tURIp2lwdAWPe7HUBMUp1RI7
         hJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684853065; x=1687445065;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yPN2BpzOKR7Rs0wxh0Zdg1UkwhhxDvNrZrq1CaLSSZQ=;
        b=Tp6Q0fz9VCPRc/CvOB2UWkqfVxRiyq9Jor0nsIyic+uryC3LxASn94EIVsiC/jiksU
         96sbjtCwR39vP6dzcOb4bmZnpZMQmn9IxBbD4N8QmLg/V9d7Augz7Uxcys8rtohLt61v
         4zn79fNcPA61E2ddsHGaQeyfC4sQ49UQ0bI9aqyvjPYPEQxXLn+9zwVDWNgYs6V9LvgT
         xngU3vuD37Ac+ia0bQXmVmY1W+QV0mpFtIP7WyOyYWt2/bBuM0x+P0loZRONijlpTi4d
         VCs3BH4/w0UCwhcLhZCIuwFnXmlATK8yROBlgdYXbKpEKLIPWEUND6lH5W7za5xLw1n+
         tKgQ==
X-Gm-Message-State: AC+VfDzZBu1qrCB1/Ik6f+0gtcrDoM6opr4tZa0B6C+8nBqnsOYuXQ4L
        m/0uoOIjDHd02kdMQesOMwFcg2eN9wW61Bc=
X-Google-Smtp-Source: ACHHUZ656OnC2srdDMtzUpWdENlFVaUBI5YJEFeGiZxbSyebkOl0dnFJTs2fWDoVRQLUxZB9CaeyTKcu1gllt+0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:1895:b0:ba8:4ba3:5b54 with SMTP
 id cj21-20020a056902189500b00ba84ba35b54mr6433268ybb.11.1684853065789; Tue,
 23 May 2023 07:44:25 -0700 (PDT)
Date:   Tue, 23 May 2023 14:44:14 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230523144418.1250547-1-aliceryhl@google.com>
Subject: [PATCH v2 0/4] Update thread safety markers
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
        patches@lists.linux.dev
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

[1]: https://stackoverflow.com/a/68708557/1704411

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
2.40.1.698.g37aff9b760-goog

