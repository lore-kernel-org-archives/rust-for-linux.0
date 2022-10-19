Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0E2C4332F
	for <rust-for-linux@archiver.kernel.org>; Wed, 19 Oct 2022 11:05:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbiJSLFR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 19 Oct 2022 07:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234528AbiJSLDl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 19 Oct 2022 07:03:41 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53E86113A;
        Wed, 19 Oct 2022 03:32:50 -0700 (PDT)
Date:   Wed, 19 Oct 2022 16:58:36 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666169932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BaRL+rjTJsmOJb/VyyXV+tNvfFHDLLSD+t7SWsuJOyc=;
        b=etBwW3ffferd/8DWFXSEAx0VUG+1A7KFvDsM53SyN8Lb8S+QRRdHk+HxkL1Ggs7dmMIDgz
        KZdzjxqmZw9rSlINpUXdCiNNiqUucXDLqu8TKQfBYPuvgHPWXn6o6AAzdsriRHK0PRCuBE
        3y9zbsIwMZerUekIaddPratNZYz71e4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        ojeda@kernel.org, boqun.feng@gmail.com, wedsonaf@gmail.com,
        gary@garyguo.net, bjorn3_gh@protonmail.com,
        rust-for-linux@vger.kernel.org, bobwxc@email.cn,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v2 3/5] docs/zh_CN: Add rust/general-information Chinese
 translation
Message-ID: <Y0+8PHe2tXp9/sHX@bobwxc.mipc>
References: <cover.1666097959.git.siyanteng@loongson.cn>
 <59496aa23862c41051836de1121a2fcf2a5f1bc5.1666097959.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59496aa23862c41051836de1121a2fcf2a5f1bc5.1666097959.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

2022-10-18 (二) 21:04:23 +0800 Yanteng Si 曰：
> Translate .../rust/general-information.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../zh_CN/rust/general-information.rst        | 75 +++++++++++++++++++
>  .../translations/zh_CN/rust/index.rst         |  2 +-
>  2 files changed, 76 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/rust/general-information.rst

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

