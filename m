Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AB4C47088
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 May 2021 18:39:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86A8C613EC
	for <rust-for-linux@archiver.kernel.org>; Wed, 26 May 2021 18:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235561AbhEZSkb (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 26 May 2021 14:40:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235556AbhEZSkb (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 26 May 2021 14:40:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1027B613BF;
        Wed, 26 May 2021 18:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622054338;
        bh=EtNtATWsu+MVTvn11sKT01uXWJzZiCBBcQEtOMSz5ws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nf4jDYGNVDItjVYRpPq4jxJCUzdmtZlfmLMilMyuNJodRnqVpbBBYIvgUq1qg3I2+
         jzKtcCIAIqjLzBKaWQE3n3Eo7WZKAzn8HQttL8ktd/DR2RTjkOBD39j2EvANa7ia9q
         JZ5Bk7KrWClraMG3uZJVP6JKt6/6HSeZfVx8T0Fk=
Date:   Wed, 26 May 2021 20:38:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Thomas Thanner <e580@thomasthanner.de>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: Error building sample modules
Message-ID: <YK6Vv0fIsSRz8hLR@kroah.com>
References: <fde720d1-cade-e01b-8dc2-afdbfa52bb3b@thomasthanner.de>
 <CANiq72keqzr2vraGSOcC4=Ew=Ax6ds_m7E3Gy2az3JLzmtcnsg@mail.gmail.com>
 <269315c9-56af-6914-2315-b1248519a737@thomasthanner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <269315c9-56af-6914-2315-b1248519a737@thomasthanner.de>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, May 26, 2021 at 08:22:22PM +0200, Thomas Thanner wrote:
> Hi Miguel,
> 
> yes, thanks, that worked.
> 
> Now I have two built-in rust modules. And two loadable modules.
> 
> I have to compare that to normal linux modules. The built-in rust_minimal
> doesn't show up in /sys/module. If I do insmod rust_minimal.ko then it shows
> up. I have to do that a bit more systematically with the four modules.

If you module has no parameters or options, then building it into the
kernel will not cause it to show up in /sys/modules/ as what is there to
show in that location for it?

If you load it as a module, there is stuff to show (memory maps and the
like), so it makes sense it shows up then.

Try it with a .c module to see if it does the same thing.

thanks,

greg k-h
