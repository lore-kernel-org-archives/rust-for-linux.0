Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A83C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 16:59:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjFJQ75 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 12:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjFJQ75 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 12:59:57 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00AEA2D41
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 09:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=AuWcVfiew/ZJVo2PRJT6HeiJMqrIy85Mb6yuHgVw7Ew=; b=m6lMBFhZ0FdCDxVSo6oLIWoKt8
        iL7xFx1ofJg9g0q3q190jSIEYAv/jazw+aezUGQdf5SKDVvxS++ol82SxwzXoXU4i9Lw19tz/V0W4
        HsC/bnFlk+TpD5pUnlOg113j+aQtC3v18VcX1o7Lnu1ppBSS4RplFZEjvNE8B9A7DeAQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q81wO-00FRx7-TQ; Sat, 10 Jun 2023 18:59:52 +0200
Date:   Sat, 10 Jun 2023 18:59:52 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 5/5] samples: rust: add dummy network driver
Message-ID: <d76261e6-5558-4e57-9e5f-d778f9ef3804@lunn.ch>
References: <20230610071848.3722492-1-tomo@exabit.dev>
 <01010188a42d5620-fdafc00a-8aad-4c5e-a0b7-1fb83da6ba03-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01010188a42d5620-fdafc00a-8aad-4c5e-a0b7-1fb83da6ba03-000000@us-west-2.amazonses.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> +        pr_info!("Hello Rust dummy netdev!");

In general, we discourage the use of pr_info(). netdev_info(ndev, ...)
is what should be used, once the device is registered. The output then
includes which device is says "hello world", which can be useful when
you have more than one of them. netdev_info() can be called before the
device is registered, but since the name is not fixed at that point,
the output is a bit more ambiguous.

I would not say this is a blocked for this patchset, but i would add
wrapping netdev_{dbg|warn|info|error}() high on your todo list, they
are pretty fundamental to network drivers.

    Andrew
