Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F067FC433FE
	for <rust-for-linux@archiver.kernel.org>; Wed,  5 Oct 2022 07:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbiJEH1t (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 5 Oct 2022 03:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiJEH1s (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 5 Oct 2022 03:27:48 -0400
Received: from hop.stappers.nl (hop.stappers.nl [IPv6:2a02:2308:0:14e::686f:7030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C46B7434D;
        Wed,  5 Oct 2022 00:27:47 -0700 (PDT)
Received: from gpm.stappers.nl (gpm.stappers.nl [82.168.249.201])
        by hop.stappers.nl (Postfix) with ESMTP id 0835120013;
        Wed,  5 Oct 2022 07:27:45 +0000 (UTC)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 7FE39304049; Wed,  5 Oct 2022 09:27:44 +0200 (CEST)
Date:   Wed, 5 Oct 2022 09:27:44 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Olof Johansson <olof@lixom.net>, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: rust_is_available.sh: Provide hints on how to
 fix missing pieces
Message-ID: <20221005072743.vfanu2mgj56wbdmh@gpm.stappers.nl>
References: <20221004184625.10076-1-olof@lixom.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004184625.10076-1-olof@lixom.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Oct 04, 2022 at 11:46:25AM -0700, Olof Johansson wrote:
> This might be a bit bikesheddy, but it saves a few roundtrips to the
> documentation when getting the `make LLVM=1 rustavailable` run to pass.

Yeah, I have bin there    :-)

 
> Stick to the rustup options to avoid too much verbosity.
> 
> Signed-off-by: Olof Johansson <olof@lixom.net>
> ---
>  scripts/rust_is_available.sh | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Geert Stappers <stappers@stappers.nl>
