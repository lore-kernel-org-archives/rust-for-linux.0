Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FDBC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 13:27:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjFIN07 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjFIN06 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 09:26:58 -0400
X-Greylist: delayed 233 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 06:26:57 PDT
Received: from a27-42.smtp-out.us-west-2.amazonses.com (a27-42.smtp-out.us-west-2.amazonses.com [54.240.27.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CCEDEB
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 06:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686316984;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=IhllVdiSDyJDscvp1mRy6CSISaeg2TyiVopL+mMzkb4=;
        b=TdXKTaB79x0mTcu/Y56rWKUp38Hdw707v3FVBuWxZvL72OIkwLrYCxehlxt/TAXd
        kp5sElV0lbdSNlk2wnAfcmNivOJxoIiR6fwELbuTPNNBBx2aOzxw1M+j+y120IKkSQS
        lUTmG2Af+Yvt9uzqUTmV+XnHy5VgMlnOan7D6pa3qYfqQp75V2hvl3nqvjr7aVMGfub
        6P/ovI+fRZG4ydFjWg0XIemmX116t8JC3vFjv7a+/7pxaPM3tKyGEYSr4ChIQWuEgs7
        2KcMtvZwAo6AszdHbdXOKAtuxfMYHIN3sBAtas4PLDb3//IwRArW8kA0Swq4tY3Kc7p
        bSgAZ1sRAg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686316984;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=IhllVdiSDyJDscvp1mRy6CSISaeg2TyiVopL+mMzkb4=;
        b=azmAwG7uB85ltW48JHbODrqU29pB5LhkMSAEUZseTFSZcyzJH5JZqFinvaewxLJ4
        l0UooPgtUXvE+t4r3TAceNLivbGqlNlv1/WEVLfJB3qNpHg4JDPlzfIpLA9JD86Hh7Q
        AeoP15TIUTmK0OJ5IuDsbZ/ow48VLHOLaQHFFcHI=
Date:   Fri, 9 Jun 2023 13:23:04 +0000
Message-ID: <01010188a05326e3-04b64a57-0bc4-45c0-b91f-06e48300d5e6-000000@us-west-2.amazonses.com>
To:     aliceryhl@google.com
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
        tomo@exabit.dev, fujita.tomonori@gmail.com
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20230609131500.1646742-1-aliceryhl@google.com>
References: <20230604124735.1378859-1-aliceryhl@google.com>
        <20230609131500.1646742-1-aliceryhl@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.09-54.240.27.42
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Fri,  9 Jun 2023 13:15:00 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> You can also write:
> 
> ```
> const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
>     ndo_init: if <T>::HAS_INIT {
>         Some(Self::init_callback)
>     } else {
>         None
>     },
>     ndo_uninit: if <T>::HAS_UNINIT {
>         Some(Self::uninit_callback)
>     } else {
>         None
>     },
>     ndo_open: if <T>::HAS_OPEN {
>         Some(Self::open_callback)
>     } else {
>         None
>     },
>     ndo_stop: if <T>::HAS_STOP {
>         Some(Self::stop_callback)
>     } else {
>         None
>     },
>     ndo_start_xmit: if <T>::HAS_START_XMIT {
>         Some(Self::start_xmit_callback)
>     } else {
>         None
>     },
>     ..unsafe { core::mem::MaybeUninit::<bindings::net_device_ops>::zeroed().assume_init() }
> };
> ```

Looks good! I'll go with this in the next version.

Thanks,
