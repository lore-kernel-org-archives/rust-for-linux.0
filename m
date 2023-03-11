Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36E9C6FD1C
	for <rust-for-linux@archiver.kernel.org>; Sat, 11 Mar 2023 15:00:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjCKPAL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 11 Mar 2023 10:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjCKPAK (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 11 Mar 2023 10:00:10 -0500
X-Greylist: delayed 511 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 11 Mar 2023 06:59:54 PST
Received: from hop.stappers.nl (hop.stappers.nl [141.105.120.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C08E6804
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Mar 2023 06:59:54 -0800 (PST)
Received: from gpm.stappers.nl (gpm.stappers.nl [82.168.249.201])
        by hop.stappers.nl (Postfix) with ESMTP id 78D1F200EB;
        Sat, 11 Mar 2023 14:51:21 +0000 (UTC)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 1572630417C; Sat, 11 Mar 2023 15:51:20 +0100 (CET)
Date:   Sat, 11 Mar 2023 15:51:20 +0100
From:   Geert Stappers <stappers@stappers.nl>
To:     Andrea Righi <andrea.righi@canonical.com>,
        rust-for-linux@vger.kernel.org
Subject: Re: distribute linux-headers to build out-of-tree Rust modules
Message-ID: <ZAyVaAs/HMLKilkD@gpm.stappers.nl>
References: <ZAyJnCKa65WKozEJ@righiandr-XPS-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAyJnCKa65WKozEJ@righiandr-XPS-13-7390>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Mar 11, 2023 at 03:01:00PM +0100, Andrea Righi wrote:
> Hello,
> 
> I'm trying to distribute a linux-headers package (deb) that would allow
> to build out-of-tree Rust modules.
> 
> Everything looks fine, except for the following error:
> 
> error[E0461]: couldn't find crate `core` with expected target triple target-10951614936105594995

Number ends with 4995

>   |
>   = note: the following crate versions were found:
>           crate `core`, target triple target-3759196539525232825: /usr/src/linux-headers-6.2.0-16-generic/rust/libcore.rmeta

Number ends with 2825



> All I need to do is to "refresh" the headers by running a
> "make modules_prepare" after installing my linux-headers package on my
> system and then everything works perfectly.

Acknowledge

 
> Is this because my system, where I try to build the out-of-tree module,
> has different toolchain versions (e.g., binutils) than the build host?
> 
> Any pointer/documentation to better understand how the target triple
> version is determined?


I don't know and I could not resist to ask:


  Would it make sense that

     make

  would include

     make modules_prepare


  ?



Groeten
Geert Stappers
-- 
Silence is hard to parse
