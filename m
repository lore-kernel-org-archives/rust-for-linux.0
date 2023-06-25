Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B580EB64DC
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Jun 2023 12:17:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232036AbjFYMRJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 25 Jun 2023 08:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbjFYMRI (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 25 Jun 2023 08:17:08 -0400
Received: from out0-206.mail.aliyun.com (out0-206.mail.aliyun.com [140.205.0.206])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96353E46;
        Sun, 25 Jun 2023 05:17:05 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018047213;MF=changxian.cqs@antgroup.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---.TdJk.Z0_1687695421;
Received: from localhost(mailfrom:changxian.cqs@antgroup.com fp:SMTPD_---.TdJk.Z0_1687695421)
          by smtp.aliyun-inc.com;
          Sun, 25 Jun 2023 20:17:02 +0800
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
Subject: [RFC PATCH 0/8] Rust device mapper abstractions
Date:   Sun, 25 Jun 2023 20:16:49 +0800
Message-Id: <20230625121657.3631109-1-changxian.cqs@antgroup.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello!

This is a version of device mapper abstractions. Based on
these, we also implement a linear target as a PoC.
Any suggestions are welcomed, thanks!

Additionally, there are some dummy codes used to wrap the block
layer structs, i.e., `bio` and `request`, which seems being
in the review process, so I just place it in the same file.

Qingsong Chen (8):
  rust: kernel: add basic abstractions for device-mapper
  rust: kernel: add request related TargetOperations
  rust: kernel: add some hook TargetOperations
  rust: kernel: add some info handler TargetOperations
  rust: kernel: add underlying device related TargetOperations
  rust: kernel: add DAX related TargetOperations
  rust: kernel: prepare to implement dm target in Rust
  samples: rust: add a device mapper linear target

 rust/bindings/bindings_helper.h |    2 +
 rust/helpers.c                  |    7 +
 rust/kernel/device_mapper.rs    | 1279 +++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |    1 +
 samples/rust/Kconfig            |   10 +
 samples/rust/Makefile           |    1 +
 samples/rust/rust_dm_linear.rs  |  257 +++++++
 7 files changed, 1557 insertions(+)
 create mode 100644 rust/kernel/device_mapper.rs
 create mode 100644 samples/rust/rust_dm_linear.rs

-- 
2.40.1

