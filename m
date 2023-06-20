Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A93EB64D7
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Jun 2023 15:47:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjFTPrx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Jun 2023 11:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjFTPrw (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Jun 2023 11:47:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E02BF4
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jun 2023 08:47:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 15191612E6
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jun 2023 15:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41987C433C8;
        Tue, 20 Jun 2023 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687276070;
        bh=rr7UydW/2FNKioGxwQSQuNroNIrd0zGsBBwiHBvIbn4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AFUPSSXljmKFfJ+/UK/PtK1BpxA07qnT6BG6bhBI9frlzuq2IwSrTE0zZoifMqkjj
         mFtdpZJT04ZRlLpa56KulHbB/ot4zeNNm6UFvSTdYysqwYZGUYaymFnDRTTEDBCxzX
         yo0O6MRswQ/OiDIShJ6ZifrGFNmi3guMZqvOEdzprs+anMZP8ElTrVSGMe+HWtz27I
         +P0E2M38FjeLbtIoa5YYDwwIGpy08JOMcBJHJC5fMCZOmiDfRvYMBLqUR2D6csBpAG
         8rfiOLr8N69GOvPmaQhfvONeEIyQu7NZmyffoaC8qG/P8JI9ehTh9ZSnne8hey4Dj7
         pZ7g4o5KO2BrQ==
Date:   Tue, 20 Jun 2023 08:47:49 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Alice Ryhl <alice@ryhl.io>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <20230620084749.597f10b3@kernel.org>
In-Reply-To: <c1b23f21-d161-6241-26fb-7a2cbc4c059c@ryhl.io>
References: <20230614230128.199724bd@kernel.org>
        <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
        <20230615190252.4e010230@kernel.org>
        <20230616.220220.1985070935510060172.ubuntu@gmail.com>
        <20230616114006.3a2a09e5@kernel.org>
        <66dcc87e-e03f-1043-c91d-25d6fa7130a1@ryhl.io>
        <20230616121041.4010f51b@kernel.org>
        <053cb4c3-aab1-23b3-56e3-4f1741e69404@ryhl.io>
        <7dbf3c85-02ca-4c9b-b40d-adcdb85305dd@lunn.ch>
        <c1b23f21-d161-6241-26fb-7a2cbc4c059c@ryhl.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, 17 Jun 2023 12:08:26 +0200 Alice Ryhl wrote:
> > The drop reason indicates why the packet was dropped. It should give
> > some indication of what problem occurred which caused the drop. So
> > ideally we don't want an anonymous drop. The C code does not enforce
> > that, but it would be nice if the rust wrapper to dispose of an skb
> > did enforce it.  
> 
> It sounds like a destructor with WARN_ON is the best approach right now.
> 
> Unfortunately, I don't think we can enforce that the destructor is not 
> used today. That said, in the future it may be possible to implement a 
> linter that detects it - I know that there have already been experiments 
> with other custom lints for the kernel (e.g., enforcing that you don't 
> sleep while holding a spinlock).

Can we do something to hide the destructor from the linker?
