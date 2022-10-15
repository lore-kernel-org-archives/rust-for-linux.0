Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302BFC4332F
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 Oct 2022 14:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbiJOOhO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 15 Oct 2022 10:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiJOOhN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 15 Oct 2022 10:37:13 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FE54E401;
        Sat, 15 Oct 2022 07:37:12 -0700 (PDT)
Date:   Sat, 15 Oct 2022 22:36:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1665844630;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+y+T60uen7wu9pm9tRWNAuB30px6Y5s7ZrNmK5k05k0=;
        b=cUHU+2YBl5ZGfwOtZV/zKsSq2MqFqfXvCRxi6Pn/SSprWXIqSu96nDtV6i0m9RgNFtzY3O
        0LjL1iWC3PZaQ89lt4K8nacKLGkrJutbyS7byroqa6AXUZkH2eWtPNTplLW8+81VqCgwQE
        CGBTX9wKAlKiBVXfWHYKhVFK17eNCus=
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
Subject: Re: [PATCH v1 4/5] docs/zh_CN: Add rust/coding-guidelines Chinese
 translation
Message-ID: <Y0rFhfIblFnnGSvW@bobwxc.mipc>
References: <cover.1665650266.git.siyanteng@loongson.cn>
 <f74714047c46e64ee21af764c861028ec34beaed.1665650266.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f74714047c46e64ee21af764c861028ec34beaed.1665650266.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Translate .../rust/coding-guidelines.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/rust/coding-guidelines.rst          | 192 ++++++++++++++++++
>  .../translations/zh_CN/rust/index.rst         |   2 +-
>  2 files changed, 193 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/rust/coding-guidelines.rst
> 
> diff --git a/Documentation/translations/zh_CN/rust/coding-guidelines.rst b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> new file mode 100644
> index 000000000000..fe2ead35e1bd
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> @@ -0,0 +1,192 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/rust/coding-guidelines.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +编码指南
> +========
> +
> +本文档描述了如何在内核中编写Rust代码。
> +
> +
> +风格和格式化
> +------------
> +
> +代码应该使用 ``rustfmt`` 进行格式化。这样一来，一个不时为内核做贡献的人就不需要再去学
> +习和记忆一个样式指南了。更重要的是，审阅者和维护者不需要再花时间指出风格问题，因此可能需
> +要更少的补丁往返来实现改变。

可以减少补丁落地所需的邮件往返。

> +
> +.. note::  ``rustfmt`` 不检查注释和文档的约定。因此，这些仍然需要照顾到。
> +
> +使用 ``rustfmt`` 的默认设置。这意味着遵循Rust的习惯性风格。例如，缩进时使用4个空格而
> +不是制表符。
> +
> +在输入时、保存时或提交时目标编辑器/IDE进行格式化是很方便的。然而，如果因为某些原因需要

在输入、保存或提交时告知编辑器

> +在某个时候重新格式化整个内核Rust的源代码，可以运行以下程序::
> +
> +	make LLVM=1 rustfmt
> +
> +也可以检查所有的东西是否都是格式化的（否则就打印一个差异），例如对于一个CI，用::
> +
> +	make LLVM=1 rustfmtcheck
> +
> +像内核其他部分的 ``clang-format`` 一样， ``rustfmt`` 在单个文件上工作，并且不需要
> +内核配置。有时，它甚至可以与破碎的代码一起工作。
> +
> +
> +注释
> +----
> +
> +"普通" 注释 (即. ``//``, 而不是以 ``///`` 或 ``//!`` 开头的代码文档在Markdown中
> +的写法与文档注释相同，尽管它们不会被渲染。这提高了一致性，简化了规则，并允许在这两种注释

“普通”注释（即以 ``//`` 开头，而不是 ``///`` 或 ``//!`` 开头的代码文档）的写法与文
档注释相同，使用Markdown语法，

> +之间更容易地移动内容。比如说:
> +
> +.. code-block:: rust
> +
> +	// `object` is ready to be handled now.
> +	f(object);
> +
> +此外，就像文档一样，注释在句子的开头要大写，并以句号结束（即使是单句）。这包括 ``// SAFETY:``,
> +``// TODO:`` 和其他“标记”的注释，例如:
> +
> +.. code-block:: rust
> +
> +	// FIXME: The error should be handled properly.
> +
> +注释不应该被用于文档的目的：注释是为了实现细节，而不是为了用户。即使源文件的读者既是API
> +的实现者又是用户，这种区分也是有用的。事实上，有时同时使用注释和文档是很有用的。例如，用
> +于 ``TODO`` 列表或对文档本身的注释。对于后一种情况，注释可以插在中间；也就是说，离要注
> +释的文档行更近。对于其他情况，注释会写在文档之后，例如:
> +
> +.. code-block:: rust
> +
> +	/// Returns a new [`Foo`].
> +	///
> +	/// # Examples
> +	///
> +	// TODO: Find a better example.
> +	/// ```
> +	/// let foo = f(42);
> +	/// ```
> +	// FIXME: Use fallible approach.
> +	pub fn f(x: i32) -> Foo {
> +	    // ...
> +	}
> +
> +一种特殊的注释是 ``// SAFETY:`` 注释。这些注释必须出现在每个 ``不安全`` 块之前，它们

``不安全`` -> ``unsafe``
保留关键字不译

> +解释了为什么该块内的代码是正确/健全的，即为什么它在任何情况下都不会触发未定义行为，例如:
> +
> +.. code-block:: rust
> +
> +	// SAFETY: `p` is valid by the safety requirements.
> +	unsafe { *p = 0; }
> +
> +``// SAFETY:`` 注释不能与代码文档中的 ``# Safety`` 部分相混淆。 ``# Safety`` 部
> +分指定了调用者（对于函数）或实现者（对于特征）需要遵守的契约。

（函数）调用者或（特性）实现者

> +``// SAFETY:`` 注释显示了为什么一个调用（对于函数）或实现（对于特性）实际上尊重了

（函数）调用或（特性）实现

> +``# Safety`` 部分或语言参考中的前提条件。
> +
> +
> +代码文档
> +--------
> +
> +Rust内核代码不像C内核代码那样被记录下来（即通过kernel-doc）。取而代之的是用于记录Rust
> +代码的常用系统：rustdoc工具，它使用Markdown（一种轻量级的标记语言）。
> +
> +要学习Markdown，外面有很多指南。例如，一个在：

remove "，一个在"  _(: 」∠)_

> +
> +https://commonmark.org/help/
> +
> +一个记录良好的Rust函数可能是这样的:
> +
> +.. code-block:: rust
> +
> +	/// Returns the contained [`Some`] value, consuming the `self` value,
> +	/// without checking that the value is not [`None`].
> +	///
> +	/// # Safety
> +	///
> +	/// Calling this method on [`None`] is *[undefined behavior]*.
> +	///
> +	/// [undefined behavior]: https://doc.rust-lang.org/reference/behavior-considered-undefined.html
> +	///
> +	/// # Examples
> +	///
> +	/// ```
> +	/// let x = Some("air");
> +	/// assert_eq!(unsafe { x.unwrap_unchecked() }, "air");
> +	/// ```
> +	pub unsafe fn unwrap_unchecked(self) -> T {
> +	    match self {
> +	        Some(val) => val,
> +
> +	        // SAFETY: The safety contract must be upheld by the caller.
> +	        None => unsafe { hint::unreachable_unchecked() },
> +	    }
> +	}
> +
> +这个例子展示了一些 ``rustdoc`` 的特性和内核中遵循的一些惯例:
> +
> +  - 第一段必须是一个简单的句子，简要地描述被记录的项目的作用。进一步的解释必须放在额
> +    外的段落中。
> +
> +  - 不安全的函数必须在 ``# Safety`` 部分记录其安全前提条件。
> +
> +  - 虽然这里没有显示，但如果一个函数可能会恐慌，那么必须在 ``# Panics`` 部分描述发
> +    生这种情况的条件。
> +
> +    请注意，恐慌应该是非常少见的，只有在有充分理由的情况下才会使用。几乎在所有的情况下，
> +    都应该使用一个容易出错的方法，通常是返回一个 ``Result``.

容易出错 -> 可失败

> +
> +  - 如果提供使用实例对读者有帮助的话，必须写在一个叫做``# Examples``的部分。
> +
> +  - Rust项目（函数、类型、常量......）必须有适当的链接(``rustdoc`` 会自动创建一个
> +    链接).

标点

> +
> +  - 任何 ``不安全`` 的代码块都必须在前面加上一个 ``// SAFETY:`` 的注释，描述里面

``不安全`` -> ``unsafe``

> +    的代码为什么是正确的。
> +
> +    虽然有时原因可能看起来微不足道，因此不需要，但写这些注释不仅是记录已经考虑到的问

remove "因此不需要，"

> +    题的好方法，最重要的是，它提供了一种知道没有额外隐含约束的方法。
> +
> +要了解更多关于如何编写Rust和拓展功能的文档，请看看 ``rustdoc`` 这本书，网址是:
> +
> +	https://doc.rust-lang.org/rustdoc/how-to-write-documentation.html
> +
> +
> +命名
> +----
> +
> +Rust内核代码遵循通常的Rust命名惯例:
> +
> +	https://rust-lang.github.io/api-guidelines/naming.html
> +
> +当现有的C语言概念（如宏、函数、对象......）被包装成Rust抽象时，应该使用尽可能接近C语

...... -> ……

> +言的名称，以避免混淆，并在C语言和Rust语言之间来回切换时提高可读性。例如，C语言中的
> +``pr_info`` 这样的宏在Rust中的命名是一样的。
> +
> +说到这里，应该调整大小写以遵循Rust的命名惯例，模块和类型引入的命名间隔不应该在项目名称

命名空间？

> +中重复。例如，在包装常量时，如:
> +
> +.. code-block:: c
> +
> +	#define GPIO_LINE_DIRECTION_IN	0
> +	#define GPIO_LINE_DIRECTION_OUT	1
> +
> +在Rust中的等价物可能是这样的（忽略文档）。:
> +
> +.. code-block:: rust
> +
> +	pub mod gpio {
> +	    pub enum LineDirection {
> +	        In = bindings::GPIO_LINE_DIRECTION_IN as _,
> +	        Out = bindings::GPIO_LINE_DIRECTION_OUT as _,
> +	    }
> +	}
> +
> +也就是说， ``GPIO_LINE_DIRECTION_IN`` 的等价物将被称为 ``gpio::LineDirection::In`` 。
> +特别是，它不应该被命名为 ``gpio::gpio_line_direction::GPIO_LINE_DIRECTION_IN`` 。
> diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
> index c4d773a8a288..c5507ad488a1 100644
> --- a/Documentation/translations/zh_CN/rust/index.rst
> +++ b/Documentation/translations/zh_CN/rust/index.rst
> @@ -17,10 +17,10 @@ Rust
>  
>      quick-start
>      general-information
> +    coding-guidelines
>  
>  TODOList:
>  
> -*    coding-guidelines
>  *    arch-support
>  
>  .. only::  subproject and html
> -- 
> 2.31.1
> 

Thanks,
	Wu

