Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3AAEB64DB
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 06:02:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243114AbjFOGCW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 02:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243170AbjFOGBd (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 02:01:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C415294D
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jun 2023 23:01:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2ACCF6217D
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 06:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E34C433C0;
        Thu, 15 Jun 2023 06:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686808889;
        bh=BbLWfzMuToidV1olsCdEhXwJZyAe6DRdZKAiDQJ2H8E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=APtdWpaKInSMXgvKpbNr2GFwNf4hAGNNFVD72sz11/9tReEpp71sDx3zppVs7Bt4h
         4vd+AHHpgBYY5MRgHgaYqeqLZLFzdSDStRFZfqFXSpYdYLe87rYbTjQ8IwCZ3ZXJJW
         YKnkrdzspLcK9qjrpRVZftxVIDgmYE3bxUVpKylXL0sUwILzAEoDS4QFK9BNIEcFBC
         lZxnNeHK2yvRlptP6uck4YjqMJqnndPrserdSoVrFIsVI22xSAbHAztUGcUJycodaH
         wxeVAfmF3AmS7OjMzZuL6ut114zeLo97s7MC4zdfH/IuuUVm0jq57LDPBz7Ca7nbqM
         IqhFRwQ57owWg==
Date:   Wed, 14 Jun 2023 23:01:28 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc:     netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, andrew@lunn.ch,
        miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <20230614230128.199724bd@kernel.org>
In-Reply-To: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, 13 Jun 2023 13:53:21 +0900 FUJITA Tomonori wrote:
> This patchset adds minimum Rust abstractions for network device
> drivers and an example of a Rust network device driver, a simpler
> version of drivers/net/dummy.c.
> 
> The dummy network device driver doesn't attach any bus such as PCI so
> the dependency is minimum. Hopefully, it would make reviewing easier.
> 
> Thanks a lot for reviewing on RFC patchset at rust-for-linux ml.
> Hopefully, I've addressed all the issues.

First things first, what are the current expectations for subsystems
accepting rust code?

I was hoping someone from the Rust side is going to review this.
We try to review stuff within 48h at netdev, and there's no review :S

My immediate instinct is that I'd rather not merge toy implementations
unless someone within the netdev community can vouch for the code.

>  rust/bindings/bindings_helper.h |   3 +
>  rust/helpers.c                  |  23 ++
>  rust/kernel/lib.rs              |   3 +
>  rust/kernel/net.rs              |   5 +
>  rust/kernel/net/dev.rs          | 697 ++++++++++++++++++++++++++++++++
>  samples/rust/Kconfig            |  12 +
>  samples/rust/Makefile           |   1 +
>  samples/rust/rust_net_dummy.rs  |  81 ++++
>  scripts/Makefile.build          |   2 +-

You seem to create a rust/net/ directory without adding anything 
to MAINTAINERS. Are we building a parallel directory structure?
Are the maintainers also different?
-- 
pw-bot: defer
