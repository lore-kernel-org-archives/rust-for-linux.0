Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED58DC4332F
	for <rust-for-linux@archiver.kernel.org>; Mon, 17 Oct 2022 14:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiJQOjM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 17 Oct 2022 10:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbiJQOjL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 17 Oct 2022 10:39:11 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DCC659C0;
        Mon, 17 Oct 2022 07:39:10 -0700 (PDT)
Date:   Mon, 17 Oct 2022 22:38:47 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666017549;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HvDphsjFqSwtVDhKE7frOV4mUZ4nWuk3oSkfTxE7XLk=;
        b=uoSDfnaTNlVQMx0TsQi1swzUgx9P1aBy1tjfuho4TvdiGekxw7f/JHjogiAwWMma8Jo14J
        WNWMcEN5wSezJJV3UCXolF/SxFxOooO2+0lmmcgCuQBnIKOfkvmLyEWhSpL+JOxhWIsQqx
        aZjR6nlqpxeNsAdRyj9ghGbS43/g4UU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v1 4/5] docs/zh_CN: Add rust/coding-guidelines Chinese
 translation
Message-ID: <Y01o9/24jiHFzfAS@bobwxc.mipc>
References: <cover.1665650266.git.siyanteng@loongson.cn>
 <f74714047c46e64ee21af764c861028ec34beaed.1665650266.git.siyanteng@loongson.cn>
 <Y0rFhfIblFnnGSvW@bobwxc.mipc>
 <9de7877f-4142-2caa-6307-1d2a2c2d2bf0@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9de7877f-4142-2caa-6307-1d2a2c2d2bf0@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

2022-10-17 (一) 21:07:25 +0800 Yanteng Si 曰：
> > > +代码应该使用 ``rustfmt`` 进行格式化。这样一来，一个不时为内核做贡献的人就不需要再去学
> > > +习和记忆一个样式指南了。更重要的是，审阅者和维护者不需要再花时间指出风格问题，因此可能需
> > > +要更少的补丁往返来实现改变。
> > 可以减少补丁落地所需的邮件往返。
> how about 这样就有可能不用发那么多邮件来实现你的代码修改了。

A bit too long, just fine.

Thanks,

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

