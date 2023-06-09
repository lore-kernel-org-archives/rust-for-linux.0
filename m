Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60C3C7EE29
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 13:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjFINGH (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjFINGF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 09:06:05 -0400
X-Greylist: delayed 422 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 09 Jun 2023 06:05:59 PDT
Received: from a27-27.smtp-out.us-west-2.amazonses.com (a27-27.smtp-out.us-west-2.amazonses.com [54.240.27.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B972D70
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 06:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686315177;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=W7zFpePb8SZbbzPdS6HoQlr4FR9e2qRetvhhcRrJKuY=;
        b=RRDXVcz8Lgl+bmH3yDtKaTVMvWwLnzFITBa+YPhLECZdqQszJc2Juaj4Co3LYkTM
        BHRV6vRVTiAXQQESrzT1/MSMJGbno031S4TJ80kpCwZR/KgLLcAX9Je72lZGiDwNVJI
        uMJU55I2t2bUNM00S7zRYLWliA43nFZWGyopZI2zfWPP0glusQTHt0UBO6q3xgdRuDF
        4UebUnCrnSC7i/zoRxFhquMRFbb4P91+vFP+0GPjXbRKyLZKkldcnGyYYVMyPlNwVyI
        0SPLVboDDRqgWmx0okf+smggqLvel2JhTFK5yU+Lc9zpZV2+qaRdLRO7NHI+0qgD3WS
        BZwUICwCBw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686315177;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=W7zFpePb8SZbbzPdS6HoQlr4FR9e2qRetvhhcRrJKuY=;
        b=GPeXIK3lKPOKzscD044QfV1Zs87QDRhaAWXb7cORrlfrs/uPq21TMcBkVo+mZFqJ
        2XZY0+7coVpfUq4cX/OgpKdgb7AD1OmqN4Ajfp1SlOGxRuUQacdC6P0TOq6+mwohCkO
        bDLQeicZW7GSGLg++J2Xs2aAcMw01nOwZ4WzkSIw=
Date:   Fri, 9 Jun 2023 12:52:57 +0000
Message-ID: <01010188a03796fa-adbd8343-87c8-4c55-9e7f-e421040650b5-000000@us-west-2.amazonses.com>
To:     aliceryhl@google.com
Cc:     andrew@lunn.ch, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org, tomo@exabit.dev,
        fujita.tomonori@gmail.com
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <20230608081023.1365292-1-aliceryhl@google.com>
References: <dc024310-0445-4d1a-b55b-2537d4fca55a@lunn.ch>
        <20230608081023.1365292-1-aliceryhl@google.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.09-54.240.27.27
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Thu,  8 Jun 2023 08:10:23 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

>>> +    pub fn register(&mut self) -> Result {
>>> +        // SAFETY: `dev` was allocated during initialization and is guaranteed to be valid.
>>> +        let ret = unsafe {
>>> +            (*self.dev.0).netdev_ops = Self::build_device_ops();
>>> +            bindings::register_netdev(self.dev.0)
>>> +        };
>>> +        if ret != 0 {
>>> +            Err(Error::from_errno(ret))
>>> +        } else {
>>> +            self.is_registered = true;
>>> +            Ok(())
>>> +        }
>>> +    }
>> 
>> I knew ~0 about rust, but i do know the network stack.
>> 
>> You need to be careful with the value of self.is_registered. The
>> network stack will start using the interface during the call to
>> register_netdev(). It can call any of the netdev ops or ethtool ops
>> before register_netdev() has returned. You can see this in particular
>> with NFS root, but there are other use cases as well.
>> 
>> However, i do see value in self.is_registered. One of the common bugs
>> in drivers caught at review time is not completely setting up the
>> device before calling register_netdev(). The way you have added
>> setters for the netdev ops and ethtool ops we want it to error out if
>> these setters are called after the interface is registered.
> 
> Another possibility is to use two different types:
> 
>  * `UnregisteredDevice`
>  * `RegisteredDevice`
> 
> Then, the methods that need to be called before registration can be
> defined on the first type, and the other methods can be defined on the
> second type. Using Rust's move semantics, we can prevent people from
> using the `UnregisteredDevice` after calling `register`. This means that
> the following will not compile:
> 
> device.register();
> device.setup_step_that_should_happen_before_register();
> 
> This is called the "typestate pattern". [1]
> 
> Now, the above only helps if the setup operations don't also make sense
> after registration, because in that case you would need to add the
> method to both types, meaning that you're no longer prevented from
> calling the setup step after registration. I don't know the network
> stack well enough to tell whether this is the case here.

Looks like works nicely for the netdev ops or ethtool ops (and other
ops), must be set before registration. However, there are several
members on netdev that can be changed both before and after
registration like mtu, features, etc. So this pattern might not be
fit. I'll investigate.

Thanks again for reviewing!

