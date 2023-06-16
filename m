Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35ADAEB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 13:14:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244396AbjFPNOe (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 09:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbjFPNOd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 09:14:33 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B63273F;
        Fri, 16 Jun 2023 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=ivCjS5IGfmiD4w4NiMhSejZnj+H+Z4zA2nobydVreB4=; b=eTy7dst5qqgQ5q7WjiIBmA/PWT
        OFaVERWt2pjHODQGyDdNsS6JpqKg7mmfAbk6bWxSh0TSVaMYQ9DkUf27zKLJrlmsuJXQgqtK52aSu
        nzi6gtZxMCo64FyDipb2TMjPpVIZxuQlxoEvOHJTLCXq9HSgnw1g2yo3/sgwnxl6fyvo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qA9Ha-00Gikv-KH; Fri, 16 Jun 2023 15:14:30 +0200
Date:   Fri, 16 Jun 2023 15:14:30 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc:     kuba@kernel.org, netdev@vger.kernel.org,
        rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <f28d6403-d042-4ffb-9872-044388d0f9d9@lunn.ch>
References: <20230614230128.199724bd@kernel.org>
 <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
 <20230615190252.4e010230@kernel.org>
 <20230616.220220.1985070935510060172.ubuntu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616.220220.1985070935510060172.ubuntu@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> I use kfree_skb_reason() because dev_kfree_skb() is a macro so it
> can't be called directly from Rust. But I should have used
> dev_kfree_skb() with a helper function.

I think this is something you need to get addressed at a language
level very soon. Lots of netdev API calls will be to macros. The API
to manipulate skbs is pretty much always used on the hot path, so i
expect that it will have a large number of macros. It is unclear to me
how well it will scale if you need to warp them all?

~/linux/include/linux$ grep inline skbuff.h  | wc
    349    2487   23010

Do you really want to write 300+ wrappers?

   Andrew
