Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA34C6FD18
	for <rust-for-linux@archiver.kernel.org>; Tue, 18 Apr 2023 21:44:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbjDRVod (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Apr 2023 17:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjDRVoc (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Apr 2023 17:44:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E5149FD;
        Tue, 18 Apr 2023 14:44:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 34C11615CB;
        Tue, 18 Apr 2023 21:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1E9C433EF;
        Tue, 18 Apr 2023 21:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681854268;
        bh=fShyOiFtQErvDADUUDFhY+2tgV5ExyPswF84GvCNBZE=;
        h=From:To:Cc:Subject:Date:From;
        b=J04K5N7gKP+5+xoE5xA2lOlYNmlAJ7lOSWuDt2uopOVJuJDYtRmuSALHOjILmiwmh
         7tKjStUheF6sj6YemX9ng1l57flCn/5TXP057lBOJ4YUkSD9CytiEAnJiPwZu68usF
         PWYnEi8mylSeJRYdDeW1TVk+SzmrApVc0k3xBihbMGMJMhj+NUFXpTC4ThLbDRNIb/
         RMuiafO6r8szTtNcFWkLk1ahc28x2XGU00x7pPiLW3p4595VLmLMQV0MN49fO5FMTG
         DaJwrP5JWJc1MY0SO+e2a3/B+1XCgqZ1THjiTBK9Qf/ChyfyGoDaMfEKMrU7ejaQPE
         B9g7mn8YlGmzw==
From:   Miguel Ojeda <ojeda@kernel.org>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Josh Stone <jistone@redhat.com>,
        William Brown <william.brown@suse.com>,
        Georgy Yakovlev <gyakovlev@gentoo.org>,
        Jan Alexander Steffens <jan.steffens@gmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev
Subject: [PATCH 0/3] Rust 1.68.2 upgrade
Date:   Tue, 18 Apr 2023 23:43:44 +0200
Message-Id: <20230418214347.324156-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

This is the first upgrade to the Rust toolchain since the initial Rust
merge, from 1.62.0 to 1.68.2 (i.e. the latest).

Please see the last patch message for a long explanation of the upgrade,
the policy for future upgrades and some indications on how to easily
review this.

The series is based on `rust-next`.

Miguel Ojeda (3):
  rust: alloc: clarify what is the upstream version
  rust: arc: fix intra-doc link in `Arc<T>::init`
  rust: upgrade to Rust 1.68.2

 Documentation/process/changes.rst |   2 +-
 rust/alloc/README.md              |   3 +
 rust/alloc/alloc.rs               |  55 ++--
 rust/alloc/boxed.rs               | 446 ++++++++++++++++++++++++++--
 rust/alloc/collections/mod.rs     |   5 +-
 rust/alloc/lib.rs                 |  71 +++--
 rust/alloc/raw_vec.rs             |  16 +-
 rust/alloc/slice.rs               | 447 ++++------------------------
 rust/alloc/vec/drain.rs           |  81 +++++-
 rust/alloc/vec/drain_filter.rs    |  60 +++-
 rust/alloc/vec/into_iter.rs       | 125 ++++++--
 rust/alloc/vec/is_zero.rs         |  96 ++++++-
 rust/alloc/vec/mod.rs             | 464 +++++++++++++++++++++++-------
 rust/alloc/vec/set_len_on_drop.rs |   5 +
 rust/alloc/vec/spec_extend.rs     |  63 +---
 rust/bindings/lib.rs              |   1 -
 rust/kernel/build_assert.rs       |   2 +
 rust/kernel/init.rs               |   5 +
 rust/kernel/lib.rs                |   4 -
 rust/kernel/std_vendor.rs         |   2 +
 rust/kernel/sync/arc.rs           |   2 +-
 scripts/Makefile.build            |   2 +-
 scripts/min-tool-version.sh       |   2 +-
 23 files changed, 1278 insertions(+), 681 deletions(-)

-- 
2.40.0

