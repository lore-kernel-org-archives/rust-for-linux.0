Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D499EB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 18:40:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjFPSkK (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 14:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjFPSkJ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 14:40:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B08330E1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jun 2023 11:40:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 14F8F629D4
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jun 2023 18:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396E9C433C0;
        Fri, 16 Jun 2023 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686940807;
        bh=088HNGSAcbeWBieFKsLLgWtQKc4989L0mbHIDYWXp7k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BtOvvcAWcFQUREDqtwlp9064kAwfQjkUP664e+jg8rpPNCQ9Lf7I1gStMkuczob8D
         dE1yHfWWZQ+cGS2jwPN08HrajpMQMRL1Q0NfdXC9HNpw3eb7xtNMSq1LsLO8Pk5Kij
         CFBEuWl0hqJIQk/IM7FjPeN/ixQ5ypYSCOznAACRowQwoWWRKKK5oZbCRrAfgmupU/
         ydxwCU1cfVroUMdmmIdg/nPiODX2UMrrZ5wLJD7Fp/dZGQSh0ofzcyqSvB/DImeYPS
         PG5/+5NCkrE4gbu2HLKKjV4rJMCxVXJSoAbYCtB6yXrke1qQw/zEgexD2hMLVQNTND
         q5BgflSZl3S5g==
Date:   Fri, 16 Jun 2023 11:40:06 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc:     andrew@lunn.ch, netdev@vger.kernel.org,
        rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <20230616114006.3a2a09e5@kernel.org>
In-Reply-To: <20230616.220220.1985070935510060172.ubuntu@gmail.com>
References: <20230614230128.199724bd@kernel.org>
        <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
        <20230615190252.4e010230@kernel.org>
        <20230616.220220.1985070935510060172.ubuntu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, 16 Jun 2023 22:02:20 +0900 (JST) FUJITA Tomonori wrote:
> > The skb freeing looks shady from functional perspective.
> > I'm guessing some form of destructor frees the skb automatically
> > in xmit handler(?), but (a) no reason support, (b) kfree_skb_reason()
> > is most certainly not safe to call on all xmit paths...  
> 
> Yeah, I assume that a driver keeps a skb in private data structure
> (such as tx ring) then removes the skb from it after the completion of
> tx; automatically the drop() method runs (where we need to free the
> skb).
> 
> I thought that calling dev_kfree_skb() is fine but no? We also need
> something different for drivers that use other ways to free the skb
> though.
> 
> I use kfree_skb_reason() because dev_kfree_skb() is a macro so it
> can't be called directly from Rust. But I should have used
> dev_kfree_skb() with a helper function.

skbs (generally) can't be freed in an interrupt context.
dev_kfree_skb_any_reason() is probably the most general implementation.
But then we also have a set of functions used in known contexts for fast
object recycling like napi_consume_skb().
How would complex object destruction rules fit in in the Rust world?
