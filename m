Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BFEC77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 10:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbjFJKtT (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 06:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjFJKtS (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 06:49:18 -0400
Received: from out0-205.mail.aliyun.com (out0-205.mail.aliyun.com [140.205.0.205])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C919D269A;
        Sat, 10 Jun 2023 03:49:16 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047211;MF=changxian.cqs@antgroup.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---.TQFQXe0_1686394151;
Received: from localhost(mailfrom:changxian.cqs@antgroup.com fp:SMTPD_---.TQFQXe0_1686394151)
          by smtp.aliyun-inc.com;
          Sat, 10 Jun 2023 18:49:12 +0800
From:   "Qingsong Chen" <changxian.cqs@antgroup.com>
To:     linux-kernel@vger.kernel.org
Cc:     "=?UTF-8?B?55Sw5rSq5Lqu?=" <tate.thl@antgroup.com>,
        "Qingsong Chen" <changxian.cqs@antgroup.com>,
        "Miguel Ojeda" <ojeda@kernel.org>,
        "Alex Gaynor" <alex.gaynor@gmail.com>,
        "Wedson Almeida Filho" <wedsonaf@gmail.com>,
        "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
        "=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>,
        "Benno Lossin" <benno.lossin@proton.me>,
        <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 0/3] Rust scatterlist abstractions
Date:   Sat, 10 Jun 2023 18:49:06 +0800
Message-Id: <20230610104909.3202958-1-changxian.cqs@antgroup.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi All!

This is a version of scatterlist abstractions for Rust drivers.

Scatterlist is used for efficient management of memory buffers, which is
essential for many kernel-level operations such as Direct Memory Access
(DMA) transfers and crypto APIs.

This patch should be a good start to introduce the crypto APIs for Rust
drivers and to develop cipher algorithms in Rust later.

Changelog:
----------
v2 -> v3:
- Use `addr_of!` to avoid creating a reference to uninit memory.
- Mark `ScatterList::as_ref` and `ScatterList::as_mut` as unsafe.
- Revise some typos and check with `scripts/checkpatch.pl --codespell`.
- Add `# Errors` doc comment to some methods of `SgTable`.

v1 -> v2:
- Split the old patch into smaller parts.
- Remove the selftest module, and place those use cases in the doc.
- Repair some invalid hyperlinks in the doc.
- Put some `cfgs` inside functions to avoid boilerplate.
====================

Qingsong Chen (3):
  rust: kernel: add ScatterList abstraction
  rust: kernel: implement iterators for ScatterList
  rust: kernel: add SgTable abstraction

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers.c                  |  14 +
 rust/kernel/lib.rs              |   1 +
 rust/kernel/scatterlist.rs      | 549 ++++++++++++++++++++++++++++++++
 4 files changed, 565 insertions(+)
 create mode 100644 rust/kernel/scatterlist.rs

-- 
2.40.1

