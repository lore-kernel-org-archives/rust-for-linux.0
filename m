Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D80EB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 19:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjFPTKp (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 15:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjFPTKo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 15:10:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6E230D3
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jun 2023 12:10:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7068161CC7
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jun 2023 19:10:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B1CC433C0;
        Fri, 16 Jun 2023 19:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686942642;
        bh=vQP8RpU0TBh50UzUbBTbdS49nrwA/MnxyXUEhhLwNbg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AKQoc7AXdc/EFusTGnAlBCUfHAdkKR7enXuFMx6h6aQ+chzS4gQHK9Whg0vVWmZlK
         9wFshMjL8VnU/KzadHlpqWE0ETUSHWFxEdlwzbJZZbeORmEhjwEgHnt/nCGWeLLJJ2
         7pYg+0ccfRUYIW7QF1M5PyS7OVPrgh+9uwMlA9l2PYYHJfLD5hZKLbFHdoUcs6J4lF
         8++ZjJmdE1r/b+v6uqTNyZ6TZTrG1rNe4bOj+Fs1kpeazOWtQiIsr1Z3gQNsL8ab0n
         o5AiGcw/eX4/LaVtxOSYJ+SWhKnN/e4/VDv9ycqDGBBCRDeC3gFo6HKzKJby4XTiHz
         M/0NL+NyAO7Gg==
Date:   Fri, 16 Jun 2023 12:10:41 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Alice Ryhl <alice@ryhl.io>
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>, andrew@lunn.ch,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <20230616121041.4010f51b@kernel.org>
In-Reply-To: <66dcc87e-e03f-1043-c91d-25d6fa7130a1@ryhl.io>
References: <20230614230128.199724bd@kernel.org>
        <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
        <20230615190252.4e010230@kernel.org>
        <20230616.220220.1985070935510060172.ubuntu@gmail.com>
        <20230616114006.3a2a09e5@kernel.org>
        <66dcc87e-e03f-1043-c91d-25d6fa7130a1@ryhl.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, 16 Jun 2023 21:00:36 +0200 Alice Ryhl wrote:
> A Rust method can be defined to take the struct "by value", which 
> consumes the struct and prevents you from using it again. This can let 
> you provide many different cleanup methods that each clean it up in 
> different ways.
> 
> However, you cannot force the user to use one of those methods. They 
> always have the option of letting the value go out of scope, which calls 
> the destructor. And they can do this at any time.
> 
> That said, the destructor of the value does not necessarily *have* to 
> translate to immediately freeing the value. If the value if refcounted, 
> the destructor could just drop the refcount. It would also be possible 
> for a destructor to schedule the cleanup operation to a workqueue. Or 
> you could do something more clever.

Can we put a WARN_ON() in the destructor and expect object to never be
implicitly freed?  skbs represent packets (most of the time) and for
tracking which part of the stack is dropping packets we try to provide
a drop reason along the freed skb. It'd be great if for Rust we could
from the get-go direct everyone towards the APIs with an explicit reason
code.
