Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BE9EB64DD
	for <rust-for-linux@archiver.kernel.org>; Tue, 11 Jul 2023 13:17:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjGKNRq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 11 Jul 2023 09:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjGKNRp (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 11 Jul 2023 09:17:45 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6F8F12F;
        Tue, 11 Jul 2023 06:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=cmot2SFBpdbwPrKTco6MWhWJdMWMoNQ1PwTIAFCIClQ=; b=2FrDpfjXbS3nxZWccXVouAZGtn
        cGfq1BaJMZN/Yy7bfXZNmN8ZqDyb/36C0XuPtpvlnQGHyKBlEPsRJXPI5i740BLIdFV36YWBHMZy+
        oZVjHB3ayQF46XYSuAWaOWtKpCJPoeGDQ033feHQaUD8WLXyXxVamfD1TC9HUXki66Yc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qJDFF-0012IW-U7; Tue, 11 Jul 2023 15:17:33 +0200
Date:   Tue, 11 Jul 2023 15:17:33 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc:     kuba@kernel.org, rust-for-linux@vger.kernel.org,
        netdev@vger.kernel.org, aliceryhl@google.com,
        miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Subject: Re: [PATCH v2 0/5] Rust abstractions for network device drivers
Message-ID: <657b43a4-6645-4afe-b60e-269624c1b9ae@lunn.ch>
References: <20230710073703.147351-1-fujita.tomonori@gmail.com>
 <20230710112952.6f3c45dd@kernel.org>
 <20230711.191650.2195478119125867730.ubuntu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711.191650.2195478119125867730.ubuntu@gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Or you think that PHY drivers (and probably the abstractions) are
> relatively simple so merging the abstractions for them is acceptable
> without a real driver (we could put a real drivers under
> samples/rust/)?

PHY drivers are much simpler than Ethernet drivers. But more
importantly, the API to the rest of network stack is much much
smaller. So a binding for a sample driver is going to cover a large
part of that API, unlike your sample Ethernet driver binding which
covers a tiny part of the API. The PHY binding is then actually
useful, unlike the binding for Ethernet.

As for reimplementing an existing driver, vs a new driver for hardware
which is currently unsupported, that would depend on you. You could
reach out to some vendors and see if they have devices which are
missing mainline drivers. See if they will donate an RDK and the
datasheet in return for a free driver written in Rust. Whole new
drivers do come along reasonably frequently, so there is probably
scope for a new driver. Automotive is a big source of new code and
devices at the moment.

	Andrew
