Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1567DC43217
	for <rust-for-linux@archiver.kernel.org>; Thu, 13 Oct 2022 09:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiJMJiY (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 13 Oct 2022 05:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiJMJiS (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 13 Oct 2022 05:38:18 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 95C7A13D62F;
        Thu, 13 Oct 2022 02:38:14 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.106.24.89])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxReJ+3EdjJu0sAA--.30337S2;
        Thu, 13 Oct 2022 17:38:07 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 5/5] docs/zh_CN: Add rust/arch-support Chinese translation
Date:   Thu, 13 Oct 2022 17:36:35 +0800
Message-Id: <a7e68f6ae3642ef3fcc78fdd84702e48fffb1a7c.1665650266.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1665650266.git.siyanteng@loongson.cn>
References: <cover.1665650266.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxReJ+3EdjJu0sAA--.30337S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7Zr1DKF1DWr4fXr45GFg_yoW8tF1xp3
        WqkryfG3W5Jryjkr4xGF1UJF4UGF18Gw1UJr1xGwn8Xr4kJF1UJr4Utr98tw17Cr48AFW5
        Xr40kryUCr1UAr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF
        0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxh
        VjvjDU0xZFpf9x0JUqLvtUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Translate .../rust/arch-support.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/rust/arch-support.rst  | 23 +++++++++++++++++++
 .../translations/zh_CN/rust/index.rst         |  5 +---
 2 files changed, 24 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/rust/arch-support.rst

diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Documentation/translations/zh_CN/rust/arch-support.rst
new file mode 100644
index 000000000000..f8e3e7b8afe5
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
+使用LLVM/Clang构建内核的支持也有所不同（请参见使用Clang/LLVM构建Linux）。这种支持对于
+使用 ``libclang`` 的bindgen来说是必需的。
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

