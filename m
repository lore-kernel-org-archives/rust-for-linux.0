Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE27C433EF
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Feb 2022 10:53:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbiBMKxE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 13 Feb 2022 05:53:04 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbiBMKxE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 13 Feb 2022 05:53:04 -0500
X-Greylist: delayed 4878 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 13 Feb 2022 02:52:58 PST
Received: from gpm.stappers.nl (gpm.stappers.nl [82.161.218.215])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 627A65DE68
        for <rust-for-linux@vger.kernel.org>; Sun, 13 Feb 2022 02:52:58 -0800 (PST)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 16D813041A7; Sun, 13 Feb 2022 11:52:56 +0100 (CET)
Date:   Sun, 13 Feb 2022 11:52:56 +0100
From:   Geert Stappers <stappers@stappers.nl>
To:     rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 00/20] Rust support,  nn/nn
Message-ID: <20220213105256.wvkwsccjtjleel7h@gpm.stappers.nl>
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220213093135.7hvlvbsawcu2bjzg@gpm.stappers.nl>
 <YgjVmGiEygx1QNqF@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgjVmGiEygx1QNqF@kroah.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Feb 13, 2022 at 10:55:36AM +0100, Greg KH wrote:
> On Sun, Feb 13, 2022 at 10:31:35AM +0100, Geert Stappers wrote:
> > On Sat, Feb 12, 2022 at 02:03:26PM +0100, Miguel Ojeda wrote:
> > > Rust support
> > > 
> > > This is the patch series (v4) to add support for Rust as a second
> > > language to the Linux kernel.
> > >   ...
> > 
> > 
> > Where is patch 20/20?
> 
> https://lore.kernel.org/r/20220212130410.6901-21-ojeda@kernel.org
> 

Ah, Subject: [PATCH v4 20/20] [RFC] drivers: android: Binder IPC in Rust
Thanks.  So 20/20 does exist.  That it is
NOT at https://lore.kernel.org/rust-for-linux/ remains odd.


Groeten
Geert Stappers
-- 
Silence is hard to parse
