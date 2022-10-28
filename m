Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BABFA3740
	for <rust-for-linux@archiver.kernel.org>; Fri, 28 Oct 2022 12:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiJ1MZR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229773AbiJ1MZR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 28 Oct 2022 08:25:17 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5D61F58EA9;
        Fri, 28 Oct 2022 05:25:14 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8Axjrcpyltj3BkDAA--.6888S3;
        Fri, 28 Oct 2022 20:25:13 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTuAfyltjkGEGAA--.22497S5;
        Fri, 28 Oct 2022 20:25:12 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v3 3/5] docs/zh_CN: Add rust general-information Chinese translation
Date:   Fri, 28 Oct 2022 20:23:11 +0800
Message-Id: <b623a39e3598e9dcd8ead4efa512694716403c48.1666959529.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1666959529.git.siyanteng@loongson.cn>
References: <cover.1666959529.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTuAfyltjkGEGAA--.22497S5
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXry7Gr15tFW8ur4fur1rZwb_yoWrCr4rpF
        s7C34fWa17Jw15CrZ7CF1jkF1xGFWxCayrGay7Ka4xXrnYyr4DtrZFqr1rA3s7urW8CFW5
        XFZakFWI93W0ywUanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kK
        e7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWrXVW3AwAv7VC2z280
        aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4
        kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI
        1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
        Wlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj
        6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
        YxBIdaVFxhVjvjDU0xZFpf9x07j-b1bUUUUU=
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Translate .../rust/general-information.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
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

