Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94744FA3740
	for <rust-for-linux@archiver.kernel.org>; Fri, 28 Oct 2022 12:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiJ1M0h (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbiJ1M0g (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 28 Oct 2022 08:26:36 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7D542543E3;
        Fri, 28 Oct 2022 05:26:35 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8AxSth6yltjBRoDAA--.9996S3;
        Fri, 28 Oct 2022 20:26:34 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxFld4yltjxmEGAA--.4128S2;
        Fri, 28 Oct 2022 20:26:34 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v3 5/5] docs/zh_CN: Add rust arch-support Chinese translation
Date:   Fri, 28 Oct 2022 20:24:43 +0800
Message-Id: <1f5b1d1e4f84bf105ab5bed146652937a74e9b69.1666959529.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1666959529.git.siyanteng@loongson.cn>
References: <cover.1666959529.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxFld4yltjxmEGAA--.4128S2
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7KFy7Zr17Kw1DAr1rCw18AFb_yoW8KFy3pa
        4qkryfG3WrJryjkrWxGF1UJF4UGF18Gw1UJr1xGwn5Xr4DJF1UJr4Utr98twnrCr48AFW5
        Xr40kryUCw1UAr7anT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bSkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kK
        e7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
        aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262
        kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW7
        JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rV
        WUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8
        JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0eOJUUUUUU==
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Translate .../rust/arch-support.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/rust/arch-support.rst  | 23 +++++++++++++++++++
 .../translations/zh_CN/rust/index.rst         |  5 +---
 2 files changed, 24 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/rust/arch-support.rst

diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Documentation/translations/zh_CN/rust/arch-support.rst
new file mode 100644
index 000000000000..afbd02afec45
--- /dev/null
+++ b/Documentation/translations/zh_CN/rust/arch-support.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/rust/arch-support.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+架构支持
+========
+
+目前，Rust编译器（``rustc``）使用LLVM进行代码生成，这限制了可以支持的目标架构。此外，对
+使用LLVM/Clang构建内核的支持也有所不同（请参见 Documentation/kbuild/llvm.rst ）。这
+种支持对于使用 ``libclang`` 的 ``bindgen`` 来说是必需的。
+
+下面是目前可以工作的架构的一般总结。支持程度与 ``MAINTAINERS`` 文件中的``S`` 值相对应:
+
+============  ================  ==============================================
+架构          支持水平          限制因素
+============  ================  ==============================================
+``x86``       Maintained        只有 ``x86_64``
+============  ================  ==============================================
diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
index c5507ad488a1..b01f887e7167 100644
--- a/Documentation/translations/zh_CN/rust/index.rst
+++ b/Documentation/translations/zh_CN/rust/index.rst
@@ -18,10 +18,7 @@ Rust
     quick-start
     general-information
     coding-guidelines
-
-TODOList:
-
-*    arch-support
+    arch-support
 
 .. only::  subproject and html
 
-- 
2.31.1

