Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BADEB64D9
	for <rust-for-linux@archiver.kernel.org>; Mon, 10 Jul 2023 18:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjGJS34 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 Jul 2023 14:29:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjGJS34 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 Jul 2023 14:29:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 964FA189
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Jul 2023 11:29:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2908661190
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Jul 2023 18:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C52C43391;
        Mon, 10 Jul 2023 18:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689013794;
        bh=bv1BTYWvDF6jdR4K3b0/OVRixRNMD++vQrds7exgRUE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dv300fezJEkaoc84W+FoOPKetxJMulFBSqUTnwkzVn9+0IpaeRcmaE8CAgRtYANIp
         JSZ3CdytlYujo4pRnXgnzBOZoS4CcGQDDvuHjAnoezBWy/yKbS/RKKaYNlvRnYzxFt
         loKaVUrhAFgzefCWqSGV+tluPOmGFFWMebZwX11iYdh87u/rILwb+SRXn1pHURCFDx
         WPezgVpZKFZIcmxa+XArTuQmSdBAt98C6i9j3Z/PbIdZjdk7MlZJxOzG6oEXihJWbm
         4ylaR+6xIvwhw0h5WU/nbQQITzph+4DZmzRVyEzeFYjM9Dt52Xy9MoA3jvkaI2gNDq
         nY5Jakaa61spA==
Date:   Mon, 10 Jul 2023 11:29:52 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, netdev@vger.kernel.org,
        andrew@lunn.ch, aliceryhl@google.com,
        miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Subject: Re: [PATCH v2 0/5] Rust abstractions for network device drivers
Message-ID: <20230710112952.6f3c45dd@kernel.org>
In-Reply-To: <20230710073703.147351-1-fujita.tomonori@gmail.com>
References: <20230710073703.147351-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, 10 Jul 2023 16:36:58 +0900 FUJITA Tomonori wrote:
> This patchset adds minimum Rust abstractions for network device
> drivers and an example of a Rust network device driver, a simpler
> version of drivers/net/dummy.c.
> 
> The major change is a way to drop an skb (1/5 patch); a driver needs
> to explicitly call a function to drop a skb. The code to let a skb
> go out of scope can't be compiled.
> 
> I dropped get_stats64 support patch that the current sample driver
> doesn't use. Instead I added a patch to update the NETWORKING DRIVERS
> entry in MAINTAINERS.

I'd like to double down on my suggestion to try to implement a real
PHY driver. Most of the bindings in patch 3 will never be used by
drivers. (Re)implementing a real driver will guide you towards useful
stuff and real problems.
