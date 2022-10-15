Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05CEC4332F
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 Oct 2022 14:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiJOOgV (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 15 Oct 2022 10:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiJOOgU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 15 Oct 2022 10:36:20 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB374E180;
        Sat, 15 Oct 2022 07:36:17 -0700 (PDT)
Date:   Sat, 15 Oct 2022 22:35:50 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1665844575;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sj7BgGnB3tJT4jg7t4AszS3TagfavKQgrfYnKOeqmrQ=;
        b=QBW18G0YMsYzitvhwzjbhNd398nPiHR42HXL+meg6T6XdYEWVMiFIB5UIJsM/CynmA9krX
        AEzil1u4hle6OItd47zxuhSow8+lX0SHwFtXrw6vH7yr0TVuEMKnTW9l3I/ebFIJxDGwuy
        9LY1+dsWId8RwGJRfrf9JJfXkSXLs40=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   wu.xiangcheng@linux.dev
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 3/5] docs/zh_CN: Add rust/general-information Chinese
 translation
Message-ID: <Y0rFRgnzw5Y+oNj+@bobwxc.mipc>
References: <cover.1665650266.git.siyanteng@loongson.cn>
 <2354c17a110101de2838766846a5082e6df4ff50.1665650266.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2354c17a110101de2838766846a5082e6df4ff50.1665650266.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Translate .../rust/general-information.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/rust/general-information.rst        | 75 +++++++++++++++++++
>  .../translations/zh_CN/rust/index.rst         |  2 +-
>  2 files changed, 76 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/rust/general-information.rst
> 
> diff --git a/Documentation/translations/zh_CN/rust/general-information.rst b/Documentation/translations/zh_CN/rust/general-information.rst
> new file mode 100644
> index 000000000000..58a28eb6f01d
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/rust/general-information.rst
> @@ -0,0 +1,75 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/rust/general-information.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +
> +基本信息
> +========
> +
> +本文档包含了在内核中使用Rust支持时需要了解的有用信息。
> +
> +
> +代码文档
> +--------
> +
> +Rust内核代码使用其内置的文档生成器 ``rustdoc`` 进行记录。
> +
> +生成的HTML文档包括集成搜索、链接项（如类型、函数、常量）、源代码等。它们可以在以下地址阅读
> +（TODO：当在主线中时链接，与其他文档一起生成）：
> +
> +	http://kernel.org/
> +
> +这些文档也可以很容易地在本地生成和阅读。这相当快（与编译代码本身的顺序相同），而且不需要特
> +殊的工具或环境。这有一个额外的好处，那就是它们将根据所使用的特定内核配置进行定制。要生成它
> +们，请使用 ``rustdoc`` target，并使用编译时使用的相同调用，例如::

target -> 目标

> +
> +	make LLVM=1 rustdoc
> +
> +要在你的网络浏览器中本地阅读该文档，请运行如::
> +
> +	xdg-open rust/doc/kernel/index.html
> +
> +要了解如何编写文档，请看coding-guidelines.rst。

请看 coding-guidelines.rst 。

> +
> +
> +额外的lints
> +-----------
> +

Is there any good translation for "lint" ?

> +虽然 ``rustc`` 是一个非常有用的编译器，但一些额外的lints和分析可以通过 ``clippy``
> +（一个Rust linter）来实现。要启用它，请将CLIPPY=1传递到用于编译的同一调用中，例如::
> +
> +	make LLVM=1 CLIPPY=1
> +
> +请注意，Clippy可能会改变代码生成，因此在构建产品内核时不应该启用它。
> +
> +抽象和绑定
> +----------
> +
> +抽象是Rust代码，用于包装来自C端的内核功能。

抽象是用Rust代码包装来自C端的内核功能。

> +
> +为了使用来自C端的函数和类型，需要创建绑定。绑定是Rust对那些来自C端的函数和类型的声明。
> +
> +例如，人们可以在Rust中写一个 ``Mutex`` 抽象，它从C端包装一个 ``Mutex结构体`` ，并
> +通过绑定调用其函数。
> +
> +抽象并不能用于所有的内核内部API和概念，但随着时间的推移，我们打算扩大覆盖范围。“Leaf”
> +模块（例如，驱动程序）不应该直接使用C语言的绑定。相反，子系统应该根据需要提供尽可能安
> +全的抽象。
> +
> +
> +有条件的编译
> +------------
> +
> +Rust代码可以访问基于内核配置的条件性编译:
> +
> +.. code-block:: rust
> +
> +	#[cfg(CONFIG_X)]       // Enabled               (`y` or `m`)
> +	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
> +	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
> +	#[cfg(not(CONFIG_X))]  // Disabled
> diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
> index fe884d1da353..c4d773a8a288 100644
> --- a/Documentation/translations/zh_CN/rust/index.rst
> +++ b/Documentation/translations/zh_CN/rust/index.rst
> @@ -16,10 +16,10 @@ Rust
>      :maxdepth: 1
>  
>      quick-start
> +    general-information
>  
>  TODOList:
>  
> -*    general-information
>  *    coding-guidelines
>  *    arch-support
>  
> -- 
> 2.31.1
> 
> 
> 
