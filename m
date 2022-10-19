Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BE5C4167D
	for <rust-for-linux@archiver.kernel.org>; Wed, 19 Oct 2022 09:10:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbiJSJKi (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 19 Oct 2022 05:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233114AbiJSJKK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 19 Oct 2022 05:10:10 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7547EBC467;
        Wed, 19 Oct 2022 02:01:42 -0700 (PDT)
Date:   Wed, 19 Oct 2022 16:59:28 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666169985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lWnqi7UQVEM/2CRVqwPRgiuiK3XmF7rBWIcTpcgoij4=;
        b=CmJXlhgz6avMgBRzIiqXA+uSWs3DCkTDOBtXQgxOP5I2uB6UFlONRRNPbcEEuvqk8MWJQN
        DMtHKscwjNzp0drevNhcgY17lld0StmdWplaOYlidoL6gDVhPy6jo7WAHxRv0DS3IPxAAS
        JpG+edGMBue/uHGtDeGh4hVuDxd1fcc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v2 5/5] docs/zh_CN: Add rust/arch-support Chinese
 translation
Message-ID: <Y0+8cBJKoYjpcgJz@bobwxc.mipc>
References: <cover.1666097959.git.siyanteng@loongson.cn>
 <69462d6bf842950080c56d1e51adc318e79c9a19.1666097959.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69462d6bf842950080c56d1e51adc318e79c9a19.1666097959.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

2022-10-18 (二) 21:07:19 +0800 Yanteng Si 曰：
> Translate .../rust/arch-support.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/rust/arch-support.rst  | 23 +++++++++++++++++++
>  .../translations/zh_CN/rust/index.rst         |  5 +---
>  2 files changed, 24 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/rust/arch-support.rst

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

