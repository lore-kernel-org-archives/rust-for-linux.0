Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D760EC4332F
	for <rust-for-linux@archiver.kernel.org>; Mon, 17 Oct 2022 14:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiJQOgD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 17 Oct 2022 10:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbiJQOgC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 17 Oct 2022 10:36:02 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A257E60CB4;
        Mon, 17 Oct 2022 07:36:00 -0700 (PDT)
Date:   Mon, 17 Oct 2022 22:35:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666017359;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rBOUSVQxqFRllMzkNWJMFHVwxqfLhLI7prcbLGS1dKg=;
        b=v/qMbDYMkwnWQsql3BfngBQsk3PGGRf8cxnAF/PETKCbNBwmW5+eHl5uA90Hiq2BmvfOA5
        EIKjzzN5mdIR7wQzipCkYnNxWoi8dRwQhmkCmm7iGhVNYh0wxxFX633iwFGeJJEZXA+67Y
        /CuxEkLg379gMcw5rRuqPtFPBDnT4nY=
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
Message-ID: <Y01oOyQ+Yu1rspHn@bobwxc.mipc>
References: <cover.1665650266.git.siyanteng@loongson.cn>
 <58d7a63610d6eb19eed8f809d2eee46807464749.1665650266.git.siyanteng@loongson.cn>
 <Y0py30rOBh5glrpz@bobwxc.mipc>
 <1661dc82-10bc-e53e-864c-0825d6184ece@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1661dc82-10bc-e53e-864c-0825d6184ece@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

2022-10-17 (一) 20:29:00 +0800 Yanteng Si 曰：
> > > +为了方便检查是否满足要求，可以使用以下指标::
> > 指标 -> 目标 ？
> 
> I was struggling to translate this word, I probably knew what it referred
> to,
> 
> but I couldn't think of a proper Chinese word. "目标" doesn't seem very
> appropriate either.

Many Chinese information of make use 目标
$ make --help
用法：make [选项] [目标] ...

> > > +内核的C端绑定是在构建时使用 ``bindgen`` 工具生成的。一个特定的版本是必需的。
> > 需要特定版本。
> how about 这需要特定的版本？

good

> > > +``rustdoc`` 也被用来测试文档化的Rust代码中提供的例子（称为doctests或文档测试）。
> > > +``rusttest`` Make target使用这个功能。
> > 本功能的Make目标是 ``rusttest`` 。
> 
> Let's think about alignment?
> 
> ``rusttest`` 是本功能的Make目标。

good

> > > +``Kernel hacking`` 下的 ``Rust hacking`` 菜单。
> > > +
> > > +如果使用的是GDB/Binutils，而Rust符号没有被拆分，原因是工具链还不支持Rust的新v0拆分方案。
> > > +有几个办法可以解决：
> > > +
> > > +  - 安装一个较新的版本（GDB >= 10.2, Binutils >= 2.36）。
> > > +
> > > +  - 一些版本的GDB（例如vanilla GDB 10.1）能够使用嵌入在调试信息(``CONFIG_DEBUG_INFO``)
> > > +    中的预先纠错的名字。
> > 预先纠错 pre-demangled?
> 
> How about 预先还原函数 ?

Better than former one.

Thanks,

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

