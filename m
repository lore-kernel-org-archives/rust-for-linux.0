Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6782EC77B7A
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Jun 2023 05:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbjFGFVR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Jun 2023 01:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjFGFVP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Jun 2023 01:21:15 -0400
X-Greylist: delayed 392 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 06 Jun 2023 22:21:12 PDT
Received: from a27-50.smtp-out.us-west-2.amazonses.com (a27-50.smtp-out.us-west-2.amazonses.com [54.240.27.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42690173B
        for <rust-for-linux@vger.kernel.org>; Tue,  6 Jun 2023 22:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686114879;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=f6twGNeFMF+FC3OWacTdubZ2FiEDu3ux7K+fF4pMkts=;
        b=R3BRSbMPkEEbr5gh7zRUw4rRhQeDekxIp1L5q/rpZRZLNtIl0+U4ap5ab5YxDoi3
        58vzvREEP1Dpu3iuNKLlk8m90nK7ctv0YH4WOJLx0oLsBmR/SOsBDQ/qaYYB0VuRIxm
        vpsMs0pIMBri/XSvf0E0eQthzK7wYUpF6sZZHZh67+b3VVQZIV0+KwVrTolE+YJdHLz
        PTf93ILSQ2UCNzmfbV2wjhFZu6NjCrVfyomWE2J2mrBrroIO7bD/1vzfSNx/0XDPnHr
        TvDjhgC73lUlCZVIGjUqNrIm1v41qWyKsxhiVQs3gHUMC1veVMOvk5VWI1VUJHEkk+A
        52JO2N041g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686114879;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=f6twGNeFMF+FC3OWacTdubZ2FiEDu3ux7K+fF4pMkts=;
        b=WiHFClAZOk5H1rgxveMwZoDoioyuUhZE9ys5IhXdzDzPQ8AFoarE2NRDMKNGpt1x
        2qT3CeVuSuG0Qaa/Jy555Y6P3GRxLjY9JtvX+PGKJdzCN3CcUFAmjiEfLxKsrEny1y6
        Q36u1cjLzSEJCggRV6ROF8KznXusqpH7tzm+0KO8=
Date:   Wed, 7 Jun 2023 05:14:39 +0000
Message-ID: <0101018894474873-ef8c957c-2064-404b-a94e-dabcd5c37ddc-000000@us-west-2.amazonses.com>
To:     andrew@lunn.ch
Cc:     tomo@exabit.dev, rust-for-linux@vger.kernel.org,
        fujita.tomonori@gmail.com, fujita.tomonori@gmail.com
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <dc024310-0445-4d1a-b55b-2537d4fca55a@lunn.ch>
References: <20230604021736.3392963-1-tomo@exabit.dev>
        <01010188843259bd-eaff4dc9-c029-4da4-8c5b-2489fd34ffdf-000000@us-west-2.amazonses.com>
        <dc024310-0445-4d1a-b55b-2537d4fca55a@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.07-54.240.27.50
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,
Thanks a lot for reviewing!

On Tue, 6 Jun 2023 18:20:15 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> +/// The pointer to the `net_device` object is guaranteed to be valid until
>> +/// the registration object is dropped.
>> +pub struct Registration<T: DeviceOperations<D>, D: DriverData> {
>> +    dev: Device,
>> +    is_registered: bool,
>> +    _p: PhantomData<(D, T)>,
>> +}
> 
> 
>> +    pub fn register(&mut self) -> Result {
>> +        // SAFETY: `dev` was allocated during initialization and is guaranteed to be valid.
>> +        let ret = unsafe {
>> +            (*self.dev.0).netdev_ops = Self::build_device_ops();
>> +            bindings::register_netdev(self.dev.0)
>> +        };
>> +        if ret != 0 {
>> +            Err(Error::from_errno(ret))
>> +        } else {
>> +            self.is_registered = true;
>> +            Ok(())
>> +        }
>> +    }
> 
> I knew ~0 about rust, but i do know the network stack.
> 
> You need to be careful with the value of self.is_registered. The
> network stack will start using the interface during the call to
> register_netdev(). It can call any of the netdev ops or ethtool ops
> before register_netdev() has returned. You can see this in particular
> with NFS root, but there are other use cases as well.
> 
> However, i do see value in self.is_registered. One of the common bugs
> in drivers caught at review time is not completely setting up the
> device before calling register_netdev(). The way you have added
> setters for the netdev ops and ethtool ops we want it to error out if
> these setters are called after the interface is registered.

Yeah, the current API guarantees that netdev ops and ethtool ops are
set up before calling register_netdev().

However, register() could be misused, register_netdev() might called
multiple times. It will be fixed in the next version.


>> +    const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
>> +        ndo_init: if <T>::HAS_INIT {
>> +            Some(Self::init_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_uninit: if <T>::HAS_UNINIT {
>> +            Some(Self::uninit_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_open: if <T>::HAS_OPEN {
>> +            Some(Self::open_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_stop: if <T>::HAS_STOP {
>> +            Some(Self::stop_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_start_xmit: if <T>::HAS_START_XMIT {
>> +            Some(Self::start_xmit_callback)
>> +        } else {
>> +            None
>> +        },
>> +        ndo_features_check: None,
>> +        ndo_select_queue: None,
>> +        ndo_change_rx_flags: None,
>> +        ndo_set_rx_mode: None,
>> +        ndo_set_mac_address: None,
> ...
>> +        ndo_validate_addr: None,
>> +        ndo_fill_forward_path: None,
>> +        ndo_get_tstamp: None,
>> +    };
> 
> Is it necessary to list all these members, particularly those with
> None? New members do get added, so it would be nice if either the
> default would be None, or the compiler exited with an error if there
> is a new member and it is not listed here.
> 
> The same is true for the ethtool ops.

With the current code, the compiler exited with an error if there is a
new member and it is not listed here.

However, it would be nicer if the default would be set
automatically. As far as I know, we can't do yet.
