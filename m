Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D356AC77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 16:48:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjFJQsF (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 12:48:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbjFJQsF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 12:48:05 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B8EC4
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 09:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=3h/RI0rVNzrYAGcvj8vCeETmdvzgyEqRjg+pfQ8/XmI=; b=KzblFpRdV1slF1LbMFj3gmP5on
        WwQgPA4pwGjevV1oMKPhjfbOFpkt0Nt8euZjrFNWeY5sZtOtkQvLtbJkJ4II7XWoAU0/CFZp4KvQO
        EOeR2nn80dW8IWsW1UEdkYUzsFpyBdCT6ASTIEiH227ZyVFRx8FzC3db5REDeDIH0TJ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q81ku-00FRvZ-0i; Sat, 10 Jun 2023 18:48:00 +0200
Date:   Sat, 10 Jun 2023 18:48:00 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 2/5] rust: add support for ethernet operations
Message-ID: <60618e7d-10ed-489d-a6cf-52005a2f918d@lunn.ch>
References: <20230610071848.3722492-1-tomo@exabit.dev>
 <01010188a42d53e0-2d47cf6b-9c3a-4e94-9322-0935d0e5dcd4-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01010188a42d53e0-2d47cf6b-9c3a-4e94-9322-0935d0e5dcd4-000000@us-west-2.amazonses.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> +/// Corresponds to the kernel's `struct ethtool_ts_info`.
> +pub struct EthtoolTsInfo(*mut bindings::ethtool_ts_info);
> +
> +/// Sets up the info for software timestamping.
> +///
> +/// This can be [`Device`] method, but there are non ethernet devices.
> +pub fn ethtool_op_get_ts_info(dev: &mut Device, info: &mut EthtoolTsInfo) -> Result {

Just an FYI: Despite it being called ethtool, it is not limited to
ethernet devices. e.g. CAN devices make use of ethtool.

	 Andrew
