Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B2AC433EF
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Feb 2022 09:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234859AbiBMJzt (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 13 Feb 2022 04:55:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiBMJzs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 13 Feb 2022 04:55:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB5595C873
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Feb 2022 01:55:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 647EAB8077C
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Feb 2022 09:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898E7C004E1;
        Sun, 13 Feb 2022 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644746140;
        bh=wnv3t4hHsEkegrOQcHSYZowASXWDcsSuSU09sPmIG48=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IOA4qeQe4Z1rNHbtCdhB/s3aL2y/ZFDmYstO64+lp7EGvIG4iNHLAe9njyZOzaHlB
         xuYEQ2g6SGPXQlogKaUIbzgGcxDp1jD8JlRvT6F42YTryatRBnL6yJB0xkxEvYD88O
         FcfgMZKlGdx+EJZqZrgQfG0bainxNve2Z1htiIfg=
Date:   Sun, 13 Feb 2022 10:55:36 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Geert Stappers <stappers@stappers.nl>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 00/20] Rust support,  nn/nn
Message-ID: <YgjVmGiEygx1QNqF@kroah.com>
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220213093135.7hvlvbsawcu2bjzg@gpm.stappers.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220213093135.7hvlvbsawcu2bjzg@gpm.stappers.nl>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Feb 13, 2022 at 10:31:35AM +0100, Geert Stappers wrote:
> On Sat, Feb 12, 2022 at 02:03:26PM +0100, Miguel Ojeda wrote:
> > Rust support
> > 
> > This is the patch series (v4) to add support for Rust as a second
> > language to the Linux kernel.
> >   ...
> 
> 
> Where is patch 20/20?

https://lore.kernel.org/r/20220212130410.6901-21-ojeda@kernel.org

