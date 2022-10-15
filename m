Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED10FC4332F
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 Oct 2022 08:46:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiJOIqK (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 15 Oct 2022 04:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiJOIqK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 15 Oct 2022 04:46:10 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A379110FDC;
        Sat, 15 Oct 2022 01:46:07 -0700 (PDT)
Date:   Sat, 15 Oct 2022 16:45:33 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1665823564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9ElwQjuoHlKGvdWovgURY2GQH5FcYFD+IE5n6D7NlG4=;
        b=DMP/UkWGosSG3RBju15gBFZnyS3526vunyCfI6YYTilrp+0WpS9LNHg1vnWT7EUnlJsOt+
        qP6RwMOkY5NJjQGC4Zwapb1cbnd1nvhka6yZOirfAYOcQGpXoAZcej3T0jd/O9dhJPH4T6
        sMnOsnOBURaHA90bwrpCqGnXQv0+6yc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 2/5] docs/zh_CN: Add rust/quick-start Chinese
 translation
Message-ID: <Y0py30rOBh5glrpz@bobwxc.mipc>
References: <cover.1665650266.git.siyanteng@loongson.cn>
 <58d7a63610d6eb19eed8f809d2eee46807464749.1665650266.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58d7a63610d6eb19eed8f809d2eee46807464749.1665650266.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Translate .../rust/quick-start.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/rust/index.rst         |   2 +-
>  .../translations/zh_CN/rust/quick-start.rst   | 211 ++++++++++++++++++
>  2 files changed, 212 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/rust/quick-start.rst
> 
> diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
> index fc6a074841bc..fe884d1da353 100644
> --- a/Documentation/translations/zh_CN/rust/index.rst
> +++ b/Documentation/translations/zh_CN/rust/index.rst
> @@ -15,10 +15,10 @@ Rust
>  .. toctree::
>      :maxdepth: 1
>  
> +    quick-start
>  
>  TODOList:
>  
> -*    quick-start
>  *    general-information
>  *    coding-guidelines
>  *    arch-support
> diff --git a/Documentation/translations/zh_CN/rust/quick-start.rst b/Documentation/translations/zh_CN/rust/quick-start.rst
> new file mode 100644
> index 000000000000..21ebc25b0d01
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/rust/quick-start.rst
> @@ -0,0 +1,211 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/rust/quick-start.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +
> +快速入门
> +========
> +
> +本文介绍了如何开始使用Rust进行内核开发。
> +
> +
> +构建程序的必要条件
> +------------------

构建依赖

> +
> +本节描述了如何获取构建所需的工具。
> +
> +其中一些必要的软件包可能会从Linux发行版中获得，名称是 ``rustc`` , ``rust-src`` ,

其中一些依赖也许可以从Linux发行版中获得，包名可能是 ``rustc`` , ``rust-src`` ,

> +``rust-bindgen`` 等。然而，在写这篇文章的时候，它们很可能还不够新，除非发行版跟踪最
> +新的版本。
> +
> +为了方便检查是否满足要求，可以使用以下指标::

指标 -> 目标 ？

> +
> +	make LLVM=1 rustavailable
> +
> +这触发了与Kconfig用来确定是否应该启用 ``RUST_IS_AVAILABLE`` 相同的逻辑；但它也解

这会触发

> +释了如果是这样的话为什么不启用。

不过它也会列出未满足的条件。

> +
> +
> +rustc
> +*****
> +
> +需要一个特定版本的Rust编译器。较新的版本可能会也可能不会工作，因为就目前而言，内核依赖
> +于一些不稳定的Rust特性。
> +
> +如果使用的是 ``rustup`` ，请进入检查出来的源代码目录并运行::

检查出来的 -> 检出的

> +
> +	rustup override set $(scripts/min-tool-version.sh rustc)
> +
> +否则，获取一个独立的安装程序或从 ``rustup`` 安装:

或者从以下网址获取一个独立的安装程序或安装 ``rustup`` ：

> +
> +	https://www.rust-lang.org
> +
> +
> +Rust标准库源代码
> +****************
> +
> +Rust标准库的源代码是必需的，因为构建系统会交叉编译 ``core`` 和 ``alloc`` 。
> +
> +如果正在使用 ``rustup`` ，请运行::
> +
> +	rustup component add rust-src
> +
> +这些组件是按工具链安装的，因此以后升级Rust编译器版本需要重新添加组件。
> +
> +否则，如果使用独立的安装程序，可以将Rust仓库克隆到工具链的安装文件夹中::
> +
> +	git clone --recurse-submodules \
> +		--branch $(scripts/min-tool-version.sh rustc) \
> +		https://github.com/rust-lang/rust \
> +		$(rustc --print sysroot)/lib/rustlib/src/rust
> +
> +在这种情况下，以后升级Rust编译器版本需要手动更新这个克隆的仓库。
> +
> +
> +libclang
> +********
> +
> +``libclang`` （LLVM的一部分）被 ``bindgen`` 用来理解内核中的C代码，这意味着需要安

换成主动句可能稍微好一点，看你意思
``bindgen`` 使用 ``libclang`` （LLVM的一部分）来理解内核中的C代码

> +装LLVM；比如当内核被编译为 ``CC=clang`` 或 ``LLVM=1`` 时。

同在开启 ``CC=clang`` 或 ``LLVM=1`` 时编译内核一样。

> +
> +Linux发行版可能会有一个合适的，所以最好先检查一下。

Linux发行版中可能会有合适的包

> +
> +也有一些适用于一些系统和架构的二进制文件上载于：

适用于部分系统和架构的二进制文件也可到以下网址下载：

> +
> +	https://releases.llvm.org/download.html
> +
> +否则，构建LLVM需要相当长的时间，但这并不是一个复杂的过程：

或者自行构建LLVM，这需要相当长的时间，但并不是一个复杂的过程：

> +
> +	https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm
> +
> +请参阅使用Documentation/kbuild/llvm.rst，以了解更多信息以及获取预构建版本和发行包
> +的进一步方法。


请参阅 Documentation/kbuild/llvm.rst 了解更多信息，以及获取预构建版本和发行包

Please check all inline rst file names, must surrounding with prefix and suffix
spaces.

> +
> +
> +bindgen
> +*******
> +
> +内核的C端绑定是在构建时使用 ``bindgen`` 工具生成的。一个特定的版本是必需的。

需要特定版本。

> +
> +通过以下方式安装它（注意，这将从源码下载并构建该工具）::
> +
> +	cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen
> +
> +
> +开发的必要条件

开发依赖

> +--------------
> +
> +本节解释了如何获取开发所需的工具。也就是说，在构建内核时不需要这些工具。
> +
> +
> +rustfmt
> +*******
> +
> +``rustfmt`` 工具被用来自动格式化所有的Rust内核代码，包括生成的C绑定（详情请见
> +coding-guidelines.rst）。
> +
> +如果使用的是 ``rustup`` ，它的 ``默认`` 配置文件已经安装了这个工具，因此不需要做什么。
> +如果使用的是其他配置文件，可以手动安装该组件::
> +
> +	rustup component add rustfmt
> +
> +独立的安装程序也带有 ``rustfmt`` 。
> +
> +
> +clippy
> +******
> +
> +``clippy`` 是一个Rust linter。运行它可以为Rust代码提供额外的警告。它可以通过向 ``make``
> +传递 ``CLIPPY=1`` 来运行（关于细节，请看general-information.rst）。

关于细节，请看 -> 详见

> +
> +如果正在使用 ``rustup`` ，它的 ``默认`` 配置文件已经安装了这个工具，因此不需要做什么。
> +如果使用的是另一个配置文件，该组件可以被手动安装::
> +
> +	rustup component add clippy
> +
> +独立的安装程序也带有 ``clippy`` 。
> +
> +
> +cargo
> +*****
> +
> +``cargo`` 是Rust的本地构建系统。目前需要它来运行测试，因为它被用来构建一个自定义的标准
> +库，其中包含了内核中自定义 ``alloc`` 所提供的设施。测试可以使用 ``rusttest`` Make target

target -> 目标

> +来运行。
> +
> +如果使用的是 ``rustup`` ，所有的配置文件都已经安装了该工具，因此不需要再做什么。
> +
> +独立的安装程序也带有 ``cargo`` 。
> +
> +
> +rustdoc
> +*******
> +
> +``rustdoc`` 是Rust的文档工具。它为Rust代码生成漂亮的HTML文档（详情请见general-information.rst）。
> +
> +``rustdoc`` 也被用来测试文档化的Rust代码中提供的例子（称为doctests或文档测试）。
> +``rusttest`` Make target使用这个功能。

本功能的Make目标是 ``rusttest`` 。

> +
> +如果使用的是 ``rustup`` ，所有的配置文件都已经安装了这个工具，因此不需要做什么。
> +
> +独立的安装程序也带有 ``rustdoc`` 。
> +
> +
> +rust-analyzer
> +*************
> +
> +`rust-analyzer <https://rust-analyzer.github.io/>`_ 语言服务器可以和许多编辑器
> +一起使用，以实现语法高亮、补全、转到定义和其他功能。
> +
> +``rust-analyzer`` 需要一个配置文件， ``rust-project.json``, 它可以由 ``rust-analyzer``
> +Make target生成。

target -> 目标

> +
> +
> +配置
> +----
> +
> +Rust支持（CONFIG_RUST）需要在 ``General setup`` 菜单中启用。在其他要求得到满足的情

``CONFIG_RUST``

> +况下，该选项只有在找到合适的Rust工具链时才会显示（见上文）。反而言之，这将使依赖Rust的其

反而言之 -> 相应的

> +他选项可见。
> +
> +之后，进入::
> +
> +	Kernel hacking
> +	    -> Sample kernel code
> +	        -> Rust samples
> +
> +并启用一些内置或可加载的样本模块。

样本 -> 样例

> +
> +
> +构建
> +----
> +
> +用完整的LLVM工具链构建内核是目前支持的最佳设置。这就是::

这就是 -> 即

> +
> +	make LLVM=1
> +
> +对于不支持完整LLVM工具链的架构，使用::
> +
> +	make CC=clang
> +
> +使用GCC对某些配置也是可行的，但目前它是非常试验性的。
> +
> +
> +折腾
> +----
> +
> +要想深入了解，请看 ``samples/rust/`` 下的样本源代码、 ``rust/`` 下的Rust支持代码和

样本 -> 样例

> +``Kernel hacking`` 下的 ``Rust hacking`` 菜单。
> +
> +如果使用的是GDB/Binutils，而Rust符号没有被拆分，原因是工具链还不支持Rust的新v0拆分方案。
> +有几个办法可以解决：
> +
> +  - 安装一个较新的版本（GDB >= 10.2, Binutils >= 2.36）。
> +
> +  - 一些版本的GDB（例如vanilla GDB 10.1）能够使用嵌入在调试信息(``CONFIG_DEBUG_INFO``)
> +    中的预先纠错的名字。

预先纠错 pre-demangled?

> -- 
> 2.31.1
> 

Thanks,
        Wu

