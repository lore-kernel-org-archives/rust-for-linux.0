Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C8BC433FE
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Sep 2022 13:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235666AbiI2NYN (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Sep 2022 09:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235698AbiI2NXy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Sep 2022 09:23:54 -0400
Received: from hop.stappers.nl (hop.stappers.nl [141.105.120.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CFF1879E0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Sep 2022 06:23:43 -0700 (PDT)
Received: from gpm.stappers.nl (gpm.stappers.nl [IPv6:2a02:a46d:659e:1::696e:626f])
        by hop.stappers.nl (Postfix) with ESMTP id 686A52000F;
        Thu, 29 Sep 2022 13:23:41 +0000 (UTC)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 1E082304049; Thu, 29 Sep 2022 15:23:40 +0200 (CEST)
Date:   Thu, 29 Sep 2022 15:23:40 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Wedson Almeida Filho <wedsonaf@gmail.com>
Cc:     Geert Stappers <stappers@stappers.nl>,
        rust-for-linux@vger.kernel.org
Subject: Re: scripts/Kconfig.include:40: linker 'ld.lld' not found
Message-ID: <20220929132340.zyeeo4hj25qjk3hc@gpm.stappers.nl>
References: <20220929130435.4bjnk27ksl63f2pq@gpm.stappers.nl>
 <CANeycqpnOC2GjmbNqtm7k3ZKZ5JjQuPY6CXCi1QxJnrdVPZxFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANeycqpnOC2GjmbNqtm7k3ZKZ5JjQuPY6CXCi1QxJnrdVPZxFQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Sep 29, 2022 at 02:14:35PM +0100, Wedson Almeida Filho wrote:
> On Thu, 29 Sept 2022 at 14:11, Geert Stappers <stappers@stappers.nl> wrote:
> > How to deal
> > with "scripts/Kconfig.include:40: linker 'ld.lld' not found"?
> 
> Installing the 'lld' package with apt should make the error go away.

Yes,

   sudo apt install lld

Got me further, thanks.



Groeten
Geert Stappers
-- 
Silence is hard to parse
