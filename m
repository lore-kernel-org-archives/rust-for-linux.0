Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A774C64ED8
	for <rust-for-linux@archiver.kernel.org>; Fri, 24 Feb 2023 07:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjBXHjy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 24 Feb 2023 02:39:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjBXHjx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 24 Feb 2023 02:39:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B344D65AD;
        Thu, 23 Feb 2023 23:39:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5AD79B81BFD;
        Fri, 24 Feb 2023 07:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746BBC433EF;
        Fri, 24 Feb 2023 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677224332;
        bh=zPXyGB0UPLWvv4/Y9I3lbN3e/S2N41NQvGh13g7vIIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=auScaNIp2B5tgCM92UyzPQroNZ1vTcx1YaqYscHqTcx9QiBH6UQ/5fNq0SPYBxz4y
         ETg/UgCNKK78CV773Kd+Lff1CwgW9yLcXkjcCIQ7t2ltKI0n7eEurQmnOubcJzi337
         41E69h7J3CaUjGeP+A7V3l5Y6nsv/40AAv+KHlbg=
Date:   Fri, 24 Feb 2023 08:38:49 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Asahi Lina <lina@asahilina.net>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, Finn Behrens <me@kloenk.dev>,
        Sumera Priyadarsini <sylphrenadin@gmail.com>
Subject: Re: [PATCH 3/3] rust: macros: Allow specifying multiple module
 aliases
Message-ID: <Y/hpiWDLm0fB0Xp/@kroah.com>
References: <20230224-rust-macros-v1-0-b39fae46e102@asahilina.net>
 <20230224-rust-macros-v1-3-b39fae46e102@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-rust-macros-v1-3-b39fae46e102@asahilina.net>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Feb 24, 2023 at 04:25:57PM +0900, Asahi Lina wrote:
> Modules can (and usually do) have multiple alias tags, in order to
> specify multiple possible device matches for autoloading. Allow this by
> changing the alias ModuleInfo field to an Option<Vec<String>>.

Note, manually specifying the MODULE_ALIAS is only really ever done for
platform drivers today (and I would argue we need to fix that up),
otherwise the use of MODULE_DEVICE_TABLE() should really really be used
instead of having to manually specify aliases.

And why would a module alias be needed for new (i.e. rust) code anyway?
You aren't trying to do any backwards-compatibility stuff yet :)

Or is this just for a platform driver?  It's hard to review
infrastructure changes without seeing any real users :(

thanks,

greg k-h
