Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44791EB64D7
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 13:05:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjFPNFG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 09:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232355AbjFPNFE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 09:05:04 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74A072D76;
        Fri, 16 Jun 2023 06:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=6/LfT9iNS8yV2y/ZAxphMrt/HM3OIy2tnzNwsJBJ0PU=; b=1vqOKdNDYEIynUeQsKA0IILYvl
        W2c4dtakUWT5xFnLHAFRcb9qiRxgFWvuWS1nZDajSq6tiMimy3hiU4PtWanvfiu8g6McdyXQEPXVl
        kdfmyp03QVl5nPWryL02fxKuN4QT3XVd3M9M6nCwFwYEm1+jQISpfkwJiTgwpzKLcCik=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qA98N-00Gigd-VV; Fri, 16 Jun 2023 15:04:59 +0200
Date:   Fri, 16 Jun 2023 15:04:59 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <67756b12-e533-4f76-bd3c-360536f2636b@lunn.ch>
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
 <20230614230128.199724bd@kernel.org>
 <CANiq72nLV-BiXerGhhs+c6yeKk478vO_mKxMa=Za83=HbqQk-w@mail.gmail.com>
 <20230615191931.4e4751ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615191931.4e4751ac@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Actually Andrew is interested, and PHY drivers seem relatively simple..
> /me runs away

:-)

I think because they are so simple, there is not much to gain by
implementing them in rust.

	Andrew
