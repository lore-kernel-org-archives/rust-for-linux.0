Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C37C4332F
	for <rust-for-linux@archiver.kernel.org>; Sat, 15 Oct 2022 14:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbiJOOiH (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 15 Oct 2022 10:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiJOOiG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 15 Oct 2022 10:38:06 -0400
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C414E873;
        Sat, 15 Oct 2022 07:38:05 -0700 (PDT)
Date:   Sat, 15 Oct 2022 22:37:46 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1665844683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8Qc1UMAU4Ca+t9j1tH6bHGqO+sgy9kUKWgHvXLLkCJY=;
        b=SUbO5/EOK0xDCpPuIAmJhetopxbVQOaFcCMU7TzypdPkFwmp5AO1YPfVA1Hp+PjeRsXF5K
        VEKF4CSsOZSwkLbJyNJuaqBrHQ5xKFVqyyMwD/Lvp/4uVj4hp8MeVjWZT8/qpLRyYEf+Xo
        zP/nGUIdUU2n2SizX6vw1bTNvR2LbsM=
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
Subject: Re: [PATCH v1 5/5] docs/zh_CN: Add rust/arch-support Chinese
 translation
Message-ID: <Y0rFugAV266rVaYf@bobwxc.mipc>
References: <cover.1665650266.git.siyanteng@loongson.cn>
 <a7e68f6ae3642ef3fcc78fdd84702e48fffb1a7c.1665650266.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7e68f6ae3642ef3fcc78fdd84702e48fffb1a7c.1665650266.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Translate .../rust/arch-support.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/rust/arch-support.rst  | 23 +++++++++++++++++++
>  .../translations/zh_CN/rust/index.rst         |  5 +---
>  2 files changed, 24 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/rust/arch-support.rst
> 
> diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Documentation/translations/zh_CN/rust/arch-support.rst
> new file mode 100644
> index 000000000000..f8e3e7b8afe5
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/rust/arch-support.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/rust/arch-support.rst
> +
> +:翻译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> +
> +架构支持
> +========
> +
> +目前，Rust编译器（``rustc``）使用LLVM进行代码生成，这限制了可以支持的目标架构。此外，对
> +使用LLVM/Clang构建内核的支持也有所不同（请参见使用Clang/LLVM构建Linux）。这种支持对于

reference?

> +使用 ``libclang`` 的bindgen来说是必需的。

``bindgen``

> +
> +下面是目前可以工作的架构的一般总结。支持程度与 ``MAINTAINERS`` 文件中的``S`` 值相对应:
> +
> +============  ================  ==============================================
> +架构          支持水平          限制因素
> +============  ================  ==============================================
> +``x86``       Maintained        只有 ``x86_64``
> +============  ================  ==============================================
> diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
> index c5507ad488a1..b01f887e7167 100644
> --- a/Documentation/translations/zh_CN/rust/index.rst
> +++ b/Documentation/translations/zh_CN/rust/index.rst
> @@ -18,10 +18,7 @@ Rust
>      quick-start
>      general-information
>      coding-guidelines
> -
> -TODOList:
> -
> -*    arch-support
> +    arch-support
>  
>  .. only::  subproject and html
>  
> -- 
> 2.31.1
> 

Thanks,
	Wu

