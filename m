Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54487C38A02
	for <rust-for-linux@archiver.kernel.org>; Fri, 28 Oct 2022 12:25:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiJ1MZS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJ1MZR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 28 Oct 2022 08:25:17 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5D9E259E9D;
        Fri, 28 Oct 2022 05:25:15 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8BxLtspyltj0hkDAA--.11938S3;
        Fri, 28 Oct 2022 20:25:13 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTuAfyltjkGEGAA--.22497S4;
        Fri, 28 Oct 2022 20:25:06 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v3 2/5] docs/zh_CN: Add rust quick-start Chinese translation
Date:   Fri, 28 Oct 2022 20:23:10 +0800
Message-Id: <00e9069e9259f4ba05f7c4c4ab64edcbe73d1eaf.1666959529.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1666959529.git.siyanteng@loongson.cn>
References: <cover.1666959529.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTuAfyltjkGEGAA--.22497S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3WFWxuFy8AF13ZFyfZrW5ZFb_yoWfXFW5pF
        4vgr9Yga17Ga4rCry0kF1UZr1xCa1ruw15KwsrJa4vyrn5Jrs5G3y8try3Wwsxua4xAFW5
        tF1kZryY9r10vaDanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS
        14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
        1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
        67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2
        AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
        xVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
        C2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_
        Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
        WUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
        CTnIWIevJa73UjIFyTuYvjxU4YLvDUUUU
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Translate .../rust/quick-start.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../translations/zh_CN/rust/index.rst         |   2 +-
 .../translations/zh_CN/rust/quick-start.rst   | 211 ++++++++++++++++++
 2 files changed, 212 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/rust/quick-start.rst

diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
index fc6a074841bc..fe884d1da353 100644
--- a/Documentation/translations/zh_CN/rust/index.rst
+++ b/Documentation/translations/zh_CN/rust/index.rst
@@ -15,10 +15,10 @@ Rust
 .. toctree::
     :maxdepth: 1
 
+    quick-start
 
 TODOList:
 
-*    quick-start
 *    general-information
 *    coding-guidelines
 *    arch-support
diff --git a/Documentation/translations/zh_CN/rust/quick-start.rst b/Documentation/translations/zh_CN/rust/quick-start.rst
new file mode 100644
index 000000000000..a4b8e8a50a89
--- /dev/null
+++ b/Documentation/translations/zh_CN/rust/quick-start.rst
@@ -0,0 +1,211 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/rust/quick-start.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+
+快速入门
+========
+
+本文介绍了如何开始使用Rust进行内核开发。
+
+
+构建依赖
+--------
+
+本节描述了如何获取构建所需的工具。
+
+其中一些依赖也许可以从Linux发行版中获得，包名可能是 ``rustc`` , ``rust-src`` ,
+``rust-bindgen`` 等。然而，在写这篇文章的时候，它们很可能还不够新，除非发行版跟踪最
+新的版本。
+
+为了方便检查是否满足要求，可以使用以下目标::
+
+	make LLVM=1 rustavailable
+
+这会触发与Kconfig用来确定是否应该启用 ``RUST_IS_AVAILABLE`` 相同的逻辑；不过，如
+果Kconfig认为不该启用，它会列出未满足的条件。
+
+
+rustc
+*****
+
+需要一个特定版本的Rust编译器。较新的版本可能会也可能不会工作，因为就目前而言，内核依赖
+于一些不稳定的Rust特性。
+
+如果使用的是 ``rustup`` ，请进入检出的源代码目录并运行::
+
+	rustup override set $(scripts/min-tool-version.sh rustc)
+
+或者从以下网址获取一个独立的安装程序或安装 ``rustup`` ：
+
+	https://www.rust-lang.org
+
+
+Rust标准库源代码
+****************
+
+Rust标准库的源代码是必需的，因为构建系统会交叉编译 ``core`` 和 ``alloc`` 。
+
+如果正在使用 ``rustup`` ，请运行::
+
+	rustup component add rust-src
+
+这些组件是按工具链安装的，因此以后升级Rust编译器版本需要重新添加组件。
+
+否则，如果使用独立的安装程序，可以将Rust仓库克隆到工具链的安装文件夹中::
+
+	git clone --recurse-submodules \
+		--branch $(scripts/min-tool-version.sh rustc) \
+		https://github.com/rust-lang/rust \
+		$(rustc --print sysroot)/lib/rustlib/src/rust
+
+在这种情况下，以后升级Rust编译器版本需要手动更新这个克隆的仓库。
+
+
+libclang
+********
+
+``bindgen`` 使用 ``libclang`` （LLVM的一部分）来理解内核中的C代码，这意味着需要安
+装LLVM；同在开启 ``CC=clang`` 或 ``LLVM=1`` 时编译内核一样。
+
+Linux发行版中可能会有合适的包，所以最好先检查一下。
+
+适用于部分系统和架构的二进制文件也可到以下网址下载：
+
+	https://releases.llvm.org/download.html
+
+或者自行构建LLVM，这需要相当长的时间，但并不是一个复杂的过程：
+
+	https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm
+
+请参阅 Documentation/kbuild/llvm.rst 了解更多信息，以及获取预构建版本和发行包
+的进一步方法。
+
+
+bindgen
+*******
+
+内核的C端绑定是在构建时使用 ``bindgen`` 工具生成的。这需要特定的版本。
+
+通过以下方式安装它（注意，这将从源码下载并构建该工具）::
+
+	cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen
+
+
+开发依赖
+--------
+
+本节解释了如何获取开发所需的工具。也就是说，在构建内核时不需要这些工具。
+
+
+rustfmt
+*******
+
+``rustfmt`` 工具被用来自动格式化所有的Rust内核代码，包括生成的C绑定（详情请见
+coding-guidelines.rst ）。
+
+如果使用的是 ``rustup`` ，它的 ``默认`` 配置文件已经安装了这个工具，因此不需要做什么。
+如果使用的是其他配置文件，可以手动安装该组件::
+
+	rustup component add rustfmt
+
+独立的安装程序也带有 ``rustfmt`` 。
+
+
+clippy
+******
+
+``clippy`` 是一个Rust linter。运行它可以为Rust代码提供额外的警告。它可以通过向 ``make``
+传递 ``CLIPPY=1`` 来运行（关于细节，详见 general-information.rst ）。
+
+如果正在使用 ``rustup`` ，它的 ``默认`` 配置文件已经安装了这个工具，因此不需要做什么。
+如果使用的是另一个配置文件，该组件可以被手动安装::
+
+	rustup component add clippy
+
+独立的安装程序也带有 ``clippy`` 。
+
+
+cargo
+*****
+
+``cargo`` 是Rust的本地构建系统。目前需要它来运行测试，因为它被用来构建一个自定义的标准
+库，其中包含了内核中自定义 ``alloc`` 所提供的设施。测试可以使用 ``rusttest`` Make 目标
+来运行。
+
+如果使用的是 ``rustup`` ，所有的配置文件都已经安装了该工具，因此不需要再做什么。
+
+独立的安装程序也带有 ``cargo`` 。
+
+
+rustdoc
+*******
+
+``rustdoc`` 是Rust的文档工具。它为Rust代码生成漂亮的HTML文档（详情请见 general-information.rst ）。
+
+``rustdoc`` 也被用来测试文档化的Rust代码中提供的例子（称为doctests或文档测试）。
+``rusttest`` 是本功能的Make目标。
+
+如果使用的是 ``rustup`` ，所有的配置文件都已经安装了这个工具，因此不需要做什么。
+
+独立的安装程序也带有 ``rustdoc`` 。
+
+
+rust-analyzer
+*************
+
+`rust-analyzer <https://rust-analyzer.github.io/>`_ 语言服务器可以和许多编辑器
+一起使用，以实现语法高亮、补全、转到定义和其他功能。
+
+``rust-analyzer`` 需要一个配置文件， ``rust-project.json``, 它可以由 ``rust-analyzer``
+Make 目标生成。
+
+
+配置
+----
+
+Rust支持（CONFIG_RUST）需要在 ``General setup`` 菜单中启用。在其他要求得到满足的情
+况下，该选项只有在找到合适的Rust工具链时才会显示（见上文）。相应的，这将使依赖Rust的其
+他选项可见。
+
+之后，进入::
+
+	Kernel hacking
+	    -> Sample kernel code
+	        -> Rust samples
+
+并启用一些内置或可加载的样例模块。
+
+
+构建
+----
+
+用完整的LLVM工具链构建内核是目前支持的最佳设置。即::
+
+	make LLVM=1
+
+对于不支持完整LLVM工具链的架构，使用::
+
+	make CC=clang
+
+使用GCC对某些配置也是可行的，但目前它是非常试验性的。
+
+
+折腾
+----
+
+要想深入了解，请看 ``samples/rust/`` 下的样例源代码、 ``rust/`` 下的Rust支持代码和
+``Kernel hacking`` 下的 ``Rust hacking`` 菜单。
+
+如果使用的是GDB/Binutils，而Rust符号没有被demangled，原因是工具链还不支持Rust的新v0
+mangling方案。有几个办法可以解决：
+
+  - 安装一个较新的版本（GDB >= 10.2, Binutils >= 2.36）。
+
+  - 一些版本的GDB（例如vanilla GDB 10.1）能够使用嵌入在调试信息(``CONFIG_DEBUG_INFO``)
+    中的pre-demangled的名字。
-- 
2.31.1

