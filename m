Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E6CC4332F
	for <rust-for-linux@archiver.kernel.org>; Tue,  1 Nov 2022 21:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbiKAV12 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 1 Nov 2022 17:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiKAV11 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 1 Nov 2022 17:27:27 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5B51054D;
        Tue,  1 Nov 2022 14:27:26 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 52041378;
        Tue,  1 Nov 2022 21:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 52041378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1667338045; bh=Jchlhsjev47LqjgLhwBIy48aaeAwna49eQyRotaAxQg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=FWTs4tXd2Q1IsQnOLiWhijuBsnjiFqPhZ/4RSRDH3o+ZDt6yY7SXL5dnCIo+ha9OQ
         BLH9ugBo+brmXiqnER0nO88bS6jwug7mbmf6eCtoTQMLmAX5pPth4YWRAAVJpq9b6s
         yAzKRNn6U+oQPSr51nRAZ91NTzobaEPQE26l/c+Yj5Xva/B4aBZ6LRHTE71XT29+SI
         IZc0+dDDv532oD4JJCfoBhqzY0qOBjDIaaDR/P1/OAwoZE+dGiZF5qVmndgJfHACkv
         BDUN3+TuYjXWZJu1QtZMuoy0nUUAYo7rudcEHXKbRbmBI1dKlEMBlXHj9O1V5a4CiW
         U0zyZaul099HQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, ojeda@kernel.org,
        boqun.feng@gmail.com, wedsonaf@gmail.com, gary@garyguo.net,
        bjorn3_gh@protonmail.com, rust-for-linux@vger.kernel.org,
        bobwxc@email.cn, wu.xiangcheng@linux.dev, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v3 0/5] docs/zh_CN: Add rust Chinese translation
In-Reply-To: <cover.1666959529.git.siyanteng@loongson.cn>
References: <cover.1666959529.git.siyanteng@loongson.cn>
Date:   Tue, 01 Nov 2022 15:27:24 -0600
Message-ID: <871qqmz7pf.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> v3:
> * Modify some words under Gary's advice.
>
> v2:
> * Modify some words under Xiangcheng's advice.
>
> v1:
> * Translate Documentation/rust/* into Chinese.
>
> Yanteng Si (5):
>   docs/zh_CN: Add rust/index Chinese translation
>   docs/zh_CN: Add rust/quick-start Chinese translation
>   docs/zh_CN: Add rust/general-information Chinese translation
>   docs/zh_CN: Add rust/coding-guidelines Chinese translation
>   docs/zh_CN: Add rust/arch-support Chinese translation
>
>  Documentation/translations/zh_CN/index.rst    |   1 +
>  .../translations/zh_CN/rust/arch-support.rst  |  23 ++
>  .../zh_CN/rust/coding-guidelines.rst          | 192 ++++++++++++++++
>  .../zh_CN/rust/general-information.rst        |  75 +++++++
>  .../translations/zh_CN/rust/index.rst         |  28 +++
>  .../translations/zh_CN/rust/quick-start.rst   | 211 ++++++++++++++++++
>  6 files changed, 530 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/rust/arch-support.rst
>  create mode 100644 Documentation/translations/zh_CN/rust/coding-guidelines.rst
>  create mode 100644 Documentation/translations/zh_CN/rust/general-information.rst
>  create mode 100644 Documentation/translations/zh_CN/rust/index.rst
>  create mode 100644 Documentation/translations/zh_CN/rust/quick-start.rst

Series applied, thanks.

jon
