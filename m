Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BCCEB64D8
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 17:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbjFPR7N (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 13:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230132AbjFPR7M (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 13:59:12 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB03510D8;
        Fri, 16 Jun 2023 10:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=m5UFA98bQm/tJLd03h/z+t8dvv9ZMgDrIaMa7EZgg24=; b=vrX6KGYOS0XtMD/X1//v4ifnNb
        2pk1gLoXOnuUSxy1ChwxtVJ4lECbZ7AVSbHaKmKj1fZ2tbjB3A2MeutMKXEDDDczt2SD8jbrdskMF
        d+mR2F5tBIpy5wA03awqfsPHSuKTfdQbDMAu7sryolk3wFWMN3oN/0XKI8WwbPBIpWsI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qADj1-00Gk7S-VZ; Fri, 16 Jun 2023 19:59:07 +0200
Date:   Fri, 16 Jun 2023 19:59:07 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Richard Cochran <richardcochran@gmail.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <34531d5f-0804-4c8b-94c0-ce12ff8047dc@lunn.ch>
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
 <20230614230128.199724bd@kernel.org>
 <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
 <20230615190252.4e010230@kernel.org>
 <ZIvbX+edJo3Rh9W6@hoboy.vegasvil.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIvbX+edJo3Rh9W6@hoboy.vegasvil.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Jun 15, 2023 at 08:47:43PM -0700, Richard Cochran wrote:
> On Thu, Jun 15, 2023 at 07:02:52PM -0700, Jakub Kicinski wrote:
> 
> > IMO we have too much useless playground stuff in C already, don't get me
> > started. Let's get a real device prove that this thing can actually work
> > :( We can waste years implementing imaginary device drivers that nobody
> > ends up using.
> 
> Yes, the long standing policy seems to be not to merge "dummy"
> drivers.  The original PTP patch set had one, but at the time the
> reviews said firmly "No" to that.

Hi Richard

I think in the modern day, you could probably add code to netdevsim to
aid testing PTP. It should however by accompanied with selftests which
actually make use of what you add.

	Andrew
