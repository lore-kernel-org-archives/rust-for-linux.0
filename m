Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D76C27C76
	for <rust-for-linux@archiver.kernel.org>; Sat, 28 Jan 2023 06:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbjA1G7j (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 28 Jan 2023 01:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjA1G7j (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 28 Jan 2023 01:59:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175EB19694;
        Fri, 27 Jan 2023 22:59:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A244C6068E;
        Sat, 28 Jan 2023 06:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73350C433EF;
        Sat, 28 Jan 2023 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1674889177;
        bh=RzdQKWxdnV05xj2/m7n6jzQAV2vfKB+Kkx5z7ak2070=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=I93Iz6uRqDewZXiYTM7MRFPzdVKQEQXM3l3o68mbp/wEe+E04fE4qzFeo5KM1sJzj
         Cg9W+tzOOWsgObyt5gJXcUyn4ouqgyDVGP5JdxzDwOaLC0NzDfB5enkIZg4lkjzlQI
         SPyHZbX/ghj7AWmUbKUMxVReisr64j7FgCM7WU+M=
Date:   Sat, 28 Jan 2023 07:59:34 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: MAINTAINERS: Add the zulip link
Message-ID: <Y9TH1hQU3eaXB8lc@kroah.com>
References: <20230127190917.3369037-1-boqun.feng@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230127190917.3369037-1-boqun.feng@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jan 27, 2023 at 11:09:13AM -0800, Boqun Feng wrote:
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Most maintainers will not take patches without any changelog text, so
please, always do so.

thanks,

greg k-h
