Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26973C77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 15:35:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbjFJPf1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 11:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbjFJPf1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 11:35:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B5241FDE;
        Sat, 10 Jun 2023 08:35:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 26A9B60C5A;
        Sat, 10 Jun 2023 15:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D158C433EF;
        Sat, 10 Jun 2023 15:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686411325;
        bh=SOMuFTGxbfhkKLDTX+IKvHvZ9WDdJT5FPXR+FGxWZx0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NHyXXmTi8i5XTZ7E8IBk/jsy+zx2iA2Vn+yGQTyV+qxfP9ED0U9TM1o/YKI28+sDs
         S8gyTE/Z/kvuKxOqyWYI62H7DN1zNxptYHxNfDLCDY2866umNuL5TmwxkAMbkygcTf
         zP2exY9NCFB3Sbn3gTzj0htWUzybqwMpdPItCEqw=
Date:   Sat, 10 Jun 2023 17:35:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Qingsong Chen <changxian.cqs@antgroup.com>
Cc:     linux-kernel@vger.kernel.org,
        =?utf-8?B?55Sw5rSq5Lqu?= <tate.thl@antgroup.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Rust scatterlist abstractions
Message-ID: <2023061001-immovable-mongoose-7546@gregkh>
References: <20230610104909.3202958-1-changxian.cqs@antgroup.com>
 <2023061017-usable-bountiful-3f59@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023061017-usable-bountiful-3f59@gregkh>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 05:33:47PM +0200, Greg KH wrote:
> On Sat, Jun 10, 2023 at 06:49:06PM +0800, Qingsong Chen wrote:
> > Hi All!
> > 
> > This is a version of scatterlist abstractions for Rust drivers.
> > 
> > Scatterlist is used for efficient management of memory buffers, which is
> > essential for many kernel-level operations such as Direct Memory Access
> > (DMA) transfers and crypto APIs.
> > 
> > This patch should be a good start to introduce the crypto APIs for Rust
> > drivers and to develop cipher algorithms in Rust later.
> 
> I thought we were getting rid of the scatter list api for the crypto
> drivers, so this shouldn't be needed going forward, right?  Why not just
> use the direct apis instead?

See https://lore.kernel.org/r/ZH2hgrV6po9dkxi+@gondor.apana.org.au for
the details of that (sorry I forgot the link first time...)

greg k-h
