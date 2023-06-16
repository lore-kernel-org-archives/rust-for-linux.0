Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70B9EB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 18:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjFPS0l (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 14:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjFPS0l (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 14:26:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B71DF35AC
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jun 2023 11:26:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5336F620A8
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jun 2023 18:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB3BC433C8;
        Fri, 16 Jun 2023 18:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686939997;
        bh=nPsZFlwn5qGnnVU4mxSlpErJ0FOZ69VUTXp5WTIuC7Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dBJa6Gf1pe3Eihsl4ZaN8VrLmScUFxZwGuV2ZDOmp6F9KJ3dYXVIRKfwbz9j1QhFZ
         IrE5UcDmZ9etV2Ddyvc7rNVdbbzq0aTdG1gi95N+bmZX3cG5YzFJ8ur7w6r01WWDiz
         Vow9rxVbGmYKumnttQ2cA/wjWvmSXocJY5q34gOPuO+CPEqXT9y1SsRJeRm5sRVzTV
         iXSRL2sR5Z58Z474j7ntuzx349ZnGOsDpCoc/ILeWzmdzKHs6Azye/S7pODZcFxQL3
         3tQvobbgT6Ff9M71w+no9xLAfcVoRzaSIggyqxHpSFQ9ETM2BCknLXFRnIGEXr20u0
         nwzIK2nodxCFg==
Date:   Fri, 16 Jun 2023 11:26:36 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, andrew@lunn.ch
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <20230616112636.5b216a78@kernel.org>
In-Reply-To: <CANiq72mAHv8ozBsZ9-ax9kY8OfESFAc462CxrKNv0gC3r0=Xmg@mail.gmail.com>
References: <20230614230128.199724bd@kernel.org>
        <CANiq72nLV-BiXerGhhs+c6yeKk478vO_mKxMa=Za83=HbqQk-w@mail.gmail.com>
        <20230615191931.4e4751ac@kernel.org>
        <20230616.211821.1815408081024606989.ubuntu@gmail.com>
        <CANiq72mAHv8ozBsZ9-ax9kY8OfESFAc462CxrKNv0gC3r0=Xmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, 16 Jun 2023 15:23:01 +0200 Miguel Ojeda wrote:
> Not necessarily. It is true that, in general, the kernel does not
> want/accept duplicate implementations.
> 
> However, this is a bit of a special situation, and there may be some
> reasons to allow for it in a given subsystem. For instance:
> 
>   - The need to experiment with Rust.

Duplicated driver in a new language means nobody has a real incentive
to use it in production. That really mutes the signal we get out of the
experiment. At the same time IIUC building the Rust code is not trivial,
so IDK if we're ready to force people to use it. Ugh.

Do you have any idea how long it will take until one can 
 dnf install $rust
and have that be enough to be build a kernel (for the two major arches)?
