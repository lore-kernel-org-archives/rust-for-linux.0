Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 174ABEB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 20:04:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbjFPUEe (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 16:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjFPUEd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 16:04:33 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE70B1FF9;
        Fri, 16 Jun 2023 13:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=LHiszXAb7nwBiKS/AoOvMPG11A0zfSSACYA75QNJtEg=; b=ULVCY8J+9KmD5c+TNRTqu5P9Ap
        A65Wc/EppZRzl24ahuJHMfN/PRrqkkAbe+Uk0FFFWze2WJl9hmfsqFY85SHwHWAlyBuaSN507Olww
        5YpsPN2E0wA9qUpIH87sDzYdD/GWedxWM+Paju6UyQQJsl7c2QxaoGkeNcHFA124y7k0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qAFgB-00GklU-Qt; Fri, 16 Jun 2023 22:04:19 +0200
Date:   Fri, 16 Jun 2023 22:04:19 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Alice Ryhl <alice@ryhl.io>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <7dbf3c85-02ca-4c9b-b40d-adcdb85305dd@lunn.ch>
References: <20230614230128.199724bd@kernel.org>
 <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
 <20230615190252.4e010230@kernel.org>
 <20230616.220220.1985070935510060172.ubuntu@gmail.com>
 <20230616114006.3a2a09e5@kernel.org>
 <66dcc87e-e03f-1043-c91d-25d6fa7130a1@ryhl.io>
 <20230616121041.4010f51b@kernel.org>
 <053cb4c3-aab1-23b3-56e3-4f1741e69404@ryhl.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <053cb4c3-aab1-23b3-56e3-4f1741e69404@ryhl.io>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Yes, you can certainly put a WARN_ON in the destructor.
> 
> Another possibility is to use a scope to clean up. I don't know anything
> about these skb objects are used, but you could have the user define a
> "process this socket" function that you pass a pointer to the skb, then make
> the return value be something that explains what should be done with the
> packet. Since you must return a value of the right type, this forces you to
> choose.
> 
> Of course, this requires that the processing of packets can be expressed as
> a function call, where it only inspects the packet for the duration of that
> function call. (Lifetimes can ensure that the skb pointer does not escape
> the function.)
> 
> Would something like that work?

I don't think so, at least not in the contest of an Rust Ethernet
driver.

There are two main flows.

A packet is received. An skb is allocated and the received packet is
placed into the skb. The Ethernet driver then hands the packet over to
the network stack. The network stack is free to do whatever it wants
with the packet. Things can go wrong within the driver, so at times it
needs to free the skb rather than pass it to the network stack, which
would be a drop.

The second flow is that the network stack has a packet it wants sent
out an Ethernet port, in the form of an skb. The skb gets passed to
the Ethernet driver. The driver will do whatever it needs to do to
pass the contents of the skb to the hardware. Once the hardware has
it, the driver frees the skb. Again, things can go wrong and it needs
to free the skb without sending it, which is a drop.

So the lifetime is not a simple function call.

The drop reason indicates why the packet was dropped. It should give
some indication of what problem occurred which caused the drop. So
ideally we don't want an anonymous drop. The C code does not enforce
that, but it would be nice if the rust wrapper to dispose of an skb
did enforce it.

I would also say that this dummy driver and the C dummy driver is
actually wrong in 'dropping' the frame. Its whole purpose in life is to
be a black hole. It should only drop the packet if for some reason it
cannot throw the packet into the black hole.

       Andrew

