Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE19C433FE
	for <rust-for-linux@archiver.kernel.org>; Tue, 18 Oct 2022 13:06:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbiJRNGg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Oct 2022 09:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiJRNGa (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Oct 2022 09:06:30 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7C45CC58B2;
        Tue, 18 Oct 2022 06:06:26 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8Bx3NjRpE5j6m0AAA--.2574S3;
        Tue, 18 Oct 2022 21:06:25 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_1e+pE5jMLQAAA--.2960S5;
        Tue, 18 Oct 2022 21:06:24 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 3/5] docs/zh_CN: Add rust/general-information Chinese translation
Date:   Tue, 18 Oct 2022 21:04:23 +0800
Message-Id: <59496aa23862c41051836de1121a2fcf2a5f1bc5.1666097959.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1666097959.git.siyanteng@loongson.cn>
References: <cover.1666097959.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dx_1e+pE5jMLQAAA--.2960S5
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuF1xKw4fWrWDtry7WF4xtFb_yoWrWw4DpF
        s7C34Sga17Jw1rCrZ7Cr1jkF1xGFyfCFWrGa17Ka4xXrnYkr4qqrZFqr1rA3s7ury8CFW5
        XFZakFWS93W0ywUanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bSAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zV
        CFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2
        z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x
        0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCF
        I7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
        Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07Uio7tUUUUU=
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Translate .../rust/general-information.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/rust/general-information.rst        | 75 +++++++++++++++++++
 .../translations/zh_CN/rust/index.rst         |  2 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/rust/general-information.rst

diff --git a/Documentation/translations/zh_CN/rust/general-information.rst b/Documentation/translations/zh_CN/rust/general-information.rst
new file mode 100644
index 000000000000..6b91dfe1834a
--- /dev/null
+++ b/Documentation/translations/zh_CN/rust/general-information.rst
@@ -0,0 +1,75 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/rust/general-information.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+
+基本信息
+========
+
+本文档包含了在内核中使用Rust支持时需要了解的有用信息。
+
+
+代码文档
+--------
+
+Rust内核代码使用其内置的文档生成器 ``rustdoc`` 进行记录。
+
+生成的HTML文档包括集成搜索、链接项（如类型、函数、常量）、源代码等。它们可以在以下地址阅读
+（TODO：当在主线中时链接，与其他文档一起生成）：
+
+	http://kernel.org/
+
+这些文档也可以很容易地在本地生成和阅读。这相当快（与编译代码本身的顺序相同），而且不需要特
+殊的工具或环境。这有一个额外的好处，那就是它们将根据所使用的特定内核配置进行定制。要生成它
+们，请使用 ``rustdoc`` 目标，并使用编译时使用的相同调用，例如::
+
+	make LLVM=1 rustdoc
+
+要在你的网络浏览器中本地阅读该文档，请运行如::
+
+	xdg-open rust/doc/kernel/index.html
+
+要了解如何编写文档，请看 coding-guidelines.rst 。
+
+
+额外的lints
+-----------
+
+虽然 ``rustc`` 是一个非常有用的编译器，但一些额外的lints和分析可以通过 ``clippy``
+（一个Rust linter）来实现。要启用它，请将CLIPPY=1传递到用于编译的同一调用中，例如::
+
+	make LLVM=1 CLIPPY=1
+
+请注意，Clippy可能会改变代码生成，因此在构建产品内核时不应该启用它。
+
+抽象和绑定
+----------
+
+抽象是用Rust代码包装来自C端的内核功能。
+
+为了使用来自C端的函数和类型，需要创建绑定。绑定是Rust对那些来自C端的函数和类型的声明。
+
+例如，人们可以在Rust中写一个 ``Mutex`` 抽象，它从C端包装一个 ``Mutex结构体`` ，并
+通过绑定调用其函数。
+
+抽象并不能用于所有的内核内部API和概念，但随着时间的推移，我们打算扩大覆盖范围。“Leaf”
+模块（例如，驱动程序）不应该直接使用C语言的绑定。相反，子系统应该根据需要提供尽可能安
+全的抽象。
+
+
+有条件的编译
+------------
+
+Rust代码可以访问基于内核配置的条件性编译:
+
+.. code-block:: rust
+
+	#[cfg(CONFIG_X)]       // Enabled               (`y` or `m`)
+	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
+	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
+	#[cfg(not(CONFIG_X))]  // Disabled
diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
index fe884d1da353..c4d773a8a288 100644
--- a/Documentation/translations/zh_CN/rust/index.rst
+++ b/Documentation/translations/zh_CN/rust/index.rst
@@ -16,10 +16,10 @@ Rust
     :maxdepth: 1
 
     quick-start
+    general-information
 
 TODOList:
 
-*    general-information
 *    coding-guidelines
 *    arch-support
 
-- 
2.31.1

