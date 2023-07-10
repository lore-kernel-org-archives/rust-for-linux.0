Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7BDEB64DA
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 Jul 2023 19:53:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjGJTx3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 Jul 2023 15:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjGJTx2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 Jul 2023 15:53:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D2FF13E
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Jul 2023 12:53:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD61C611C5
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Jul 2023 19:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B84C433C7;
        Mon, 10 Jul 2023 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1689018807;
        bh=ZQLAF664MoAnYtWv5E94iquWvL1fzy2b4GZ39N1JM14=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vSfYDTyOeLyG6wmRZyhz0363UM42HyCAKFCugyNOAtFbVi56rYsxwVRluRMK7HSYP
         QUlJCrzadBIsrFoV1ssJhfPNwKtKCipZjv61veSJh4yfS80AA8pngcIC+UuqUp+4VY
         WQLV8HD9jaH7Sk9f+TDlAoeEAYxSho182GVLG+SU=
Date:   Mon, 10 Jul 2023 21:53:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>,
        rust-for-linux@vger.kernel.org, netdev@vger.kernel.org,
        andrew@lunn.ch, aliceryhl@google.com,
        miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Subject: Re: [PATCH v2 0/5] Rust abstractions for network device drivers
Message-ID: <2023071049-gigabyte-timing-0673@gregkh>
References: <20230710073703.147351-1-fujita.tomonori@gmail.com>
 <20230710112952.6f3c45dd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710112952.6f3c45dd@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Jul 10, 2023 at 11:29:52AM -0700, Jakub Kicinski wrote:
> On Mon, 10 Jul 2023 16:36:58 +0900 FUJITA Tomonori wrote:
> > This patchset adds minimum Rust abstractions for network device
> > drivers and an example of a Rust network device driver, a simpler
> > version of drivers/net/dummy.c.
> > 
> > The major change is a way to drop an skb (1/5 patch); a driver needs
> > to explicitly call a function to drop a skb. The code to let a skb
> > go out of scope can't be compiled.
> > 
> > I dropped get_stats64 support patch that the current sample driver
> > doesn't use. Instead I added a patch to update the NETWORKING DRIVERS
> > entry in MAINTAINERS.
> 
> I'd like to double down on my suggestion to try to implement a real
> PHY driver. Most of the bindings in patch 3 will never be used by
> drivers. (Re)implementing a real driver will guide you towards useful
> stuff and real problems.

And I'd recommend that we not take any more bindings without real users,
as there seems to be just a collection of these and it's hard to
actually review them to see how they are used...

thanks,

greg k-h
