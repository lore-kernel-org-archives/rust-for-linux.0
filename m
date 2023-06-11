Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F30DC77B7A
	for <rust-for-linux@archiver.kernel.org>; Sun, 11 Jun 2023 15:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbjFKPaS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 11 Jun 2023 11:30:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjFKPaR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 11 Jun 2023 11:30:17 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC31C1BF
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jun 2023 08:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=fc9tE9QhQbT7yAZySWMrB0QhSIcctNXs0qEGi6ESlPE=; b=PGODm7ZXp5Z78+Y+lzyLfzGI7C
        lhTVGmLW+jgXeaoDev8pdNtPt4xTULHPANDKwYnW5BSQLGqk5u7Cf0+6F0vCt/A1XTDS6dvB7SEru
        QkCQarSiIW0fmvZO1e4lGyrZpUdsgbC3B5NEb7MOOxGaa4tdtslpSspxjKQQVKsG14DE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q8N1B-00FVlc-4c; Sun, 11 Jun 2023 17:30:13 +0200
Date:   Sun, 11 Jun 2023 17:30:13 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Alice Ryhl <alice@ryhl.io>
Cc:     FUJITA Tomonori <tomo@exabit.dev>, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/5] rust: core abstractions for network device drivers
Message-ID: <1d3ade6a-1333-4729-a8e1-13e2aceeeb12@lunn.ch>
References: <20230610071848.3722492-1-tomo@exabit.dev>
 <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
 <18368b79-f204-4bc2-b591-859d3ddb22f1@lunn.ch>
 <964b5c9f-6eab-d7ff-1ce6-dc11f15898d4@ryhl.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <964b5c9f-6eab-d7ff-1ce6-dc11f15898d4@ryhl.io>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Jun 11, 2023 at 10:03:39AM +0200, Alice Ryhl wrote:
> On 6/10/23 16:11, Andrew Lunn wrote:
> > > diff --git a/rust/helpers.c b/rust/helpers.c
> > > index 81e80261d597..a91d2a99035b 100644
> > > --- a/rust/helpers.c
> > > +++ b/rust/helpers.c
> > > @@ -23,10 +23,26 @@
> > >   #include <linux/err.h>
> > >   #include <linux/refcount.h>
> > >   #include <linux/mutex.h>
> > > +#include <linux/netdevice.h>
> > > +#include <linux/skbuff.h>
> > >   #include <linux/spinlock.h>
> > >   #include <linux/sched/signal.h>
> > >   #include <linux/wait.h>
> > > +#ifdef CONFIG_NET
> > > +void *rust_helper_netdev_priv(const struct net_device *dev)
> > > +{
> > > +	return netdev_priv(dev);
> > > +}
> > > +EXPORT_SYMBOL_GPL(rust_helper_netdev_priv);
> > > +
> > > +void rust_helper_skb_tx_timestamp(struct sk_buff *skb)
> > > +{
> > > +	skb_tx_timestamp(skb);
> > > +}
> > > +EXPORT_SYMBOL_GPL(rust_helper_skb_tx_timestamp);
> > 
> > This question is probably due to me not knowing about rust. Why have
> > these helpers? They don't appear to don't do anything.
> 
> It's because we can't call inline C functions directly, so we need a
> non-inline version of it. (Similarly for #defines.)

Ah, thanks for the explanation.

This is going to be a problem for networking. The hot path has a lot
of inline functions, because a function call is expensive. So there
are going to be a lot of little wrappers like this. I don't want to
encourage early optimisation without proper profiling, but at some
point you might want to replace these wrappers with Rust, using
whatever its equivalent of inline is.

	 Andrew
