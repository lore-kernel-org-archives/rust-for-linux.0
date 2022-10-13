Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD01C43217
	for <rust-for-linux@archiver.kernel.org>; Thu, 13 Oct 2022 09:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbiJMJfe (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 13 Oct 2022 05:35:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJMJfc (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 13 Oct 2022 05:35:32 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D3B94BEF80;
        Thu, 13 Oct 2022 02:35:30 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.106.24.89])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxFeLQ20djxewsAA--.31417S5;
        Thu, 13 Oct 2022 17:35:22 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v1 3/5] docs/zh_CN: Add rust/general-information Chinese translation
Date:   Thu, 13 Oct 2022 17:33:44 +0800
Message-Id: <2354c17a110101de2838766846a5082e6df4ff50.1665650266.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1665650266.git.siyanteng@loongson.cn>
References: <cover.1665650266.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxFeLQ20djxewsAA--.31417S5
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1xKw4fWrWDtry7WF4xtFb_yoWrAr17pF
        s7C34Sga17Jw15CFZ7Cr1UCF17GFyfCayrGa17Ka4xXr9Ykr4qqrZFqr1rA3s7ury8uFW5
        XFZakFWS93W0ywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUjKFAPUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
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
index 000000000000..58a28eb6f01d
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
+们，请使用 ``rustdoc`` target，并使用编译时使用的相同调用，例如::
+
+	make LLVM=1 rustdoc
+
+要在你的网络浏览器中本地阅读该文档，请运行如::
+
+	xdg-open rust/doc/kernel/index.html
+
+要了解如何编写文档，请看coding-guidelines.rst。
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
+抽象是Rust代码，用于包装来自C端的内核功能。
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

