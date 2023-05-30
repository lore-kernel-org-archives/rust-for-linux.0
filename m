Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A6CC77B7A
	for <rust-for-linux@archiver.kernel.org>; Tue, 30 May 2023 06:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbjE3Gsn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 30 May 2023 02:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjE3Gsl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 30 May 2023 02:48:41 -0400
Received: from out0-195.mail.aliyun.com (out0-195.mail.aliyun.com [140.205.0.195])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0107692;
        Mon, 29 May 2023 23:48:35 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R431e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047206;MF=changxian.cqs@antgroup.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---.TGKDcVE_1685429309;
Received: from localhost(mailfrom:changxian.cqs@antgroup.com fp:SMTPD_---.TGKDcVE_1685429309)
          by smtp.aliyun-inc.com;
          Tue, 30 May 2023 14:48:30 +0800
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
Subject: [PATCH 0/2] Rust scatterlist abstractions
Date:   Tue, 30 May 2023 14:48:19 +0800
Message-Id: <20230530064821.1222290-1-changxian.cqs@antgroup.com>
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

Qingsong Chen (2):
  rust: kernel: add scatterlist wrapper
  samples: rust: add `SgTable` and `ScatterList` selftests

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers.c                  |  14 +
 rust/kernel/error.rs            |   2 +-
 rust/kernel/lib.rs              |   1 +
 rust/kernel/scatterlist.rs      | 478 ++++++++++++++++++++++++++++++++
 samples/rust/Kconfig            |  10 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_selftests.rs  | 186 +++++++++++++
 8 files changed, 692 insertions(+), 1 deletion(-)
 create mode 100644 rust/kernel/scatterlist.rs
 create mode 100644 samples/rust/rust_selftests.rs

-- 
2.40.1

