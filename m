Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50484C77B73
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jun 2023 16:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbjFFQUZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jun 2023 12:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbjFFQUY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jun 2023 12:20:24 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B50683
        for <rust-for-linux@vger.kernel.org>; Tue,  6 Jun 2023 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=C9FFx1qbJMT0O5K5sM9hZG/JsHLcbh3iFyqsKbUwNG8=; b=ebW6mrQREZPFXg84+HI7UxfjOF
        T4MfS0d2McBJ9ZLMQ41ax4Lvm8Gb5pcI4iJsFyhrq1RpRepRFyCJMNsxvx3ne/jY2y/gfjzefEPx4
        2wLXBzdxTCcS+Qw395hM+AE81aSey4LBrctAbtumsBj2LFhKauxBC33I/huwxVvsd0ZI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q6ZPr-00F3AZ-3b; Tue, 06 Jun 2023 18:20:15 +0200
Date:   Tue, 6 Jun 2023 18:20:15 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 1/5] rust: core abstractions for network device drivers
Message-ID: <dc024310-0445-4d1a-b55b-2537d4fca55a@lunn.ch>
References: <20230604021736.3392963-1-tomo@exabit.dev>
 <01010188843259bd-eaff4dc9-c029-4da4-8c5b-2489fd34ffdf-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01010188843259bd-eaff4dc9-c029-4da4-8c5b-2489fd34ffdf-000000@us-west-2.amazonses.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> +/// The pointer to the `net_device` object is guaranteed to be valid until
> +/// the registration object is dropped.
> +pub struct Registration<T: DeviceOperations<D>, D: DriverData> {
> +    dev: Device,
> +    is_registered: bool,
> +    _p: PhantomData<(D, T)>,
> +}


> +    pub fn register(&mut self) -> Result {
> +        // SAFETY: `dev` was allocated during initialization and is guaranteed to be valid.
> +        let ret = unsafe {
> +            (*self.dev.0).netdev_ops = Self::build_device_ops();
> +            bindings::register_netdev(self.dev.0)
> +        };
> +        if ret != 0 {
> +            Err(Error::from_errno(ret))
> +        } else {
> +            self.is_registered = true;
> +            Ok(())
> +        }
> +    }

I knew ~0 about rust, but i do know the network stack.

You need to be careful with the value of self.is_registered. The
network stack will start using the interface during the call to
register_netdev(). It can call any of the netdev ops or ethtool ops
before register_netdev() has returned. You can see this in particular
with NFS root, but there are other use cases as well.

However, i do see value in self.is_registered. One of the common bugs
in drivers caught at review time is not completely setting up the
device before calling register_netdev(). The way you have added
setters for the netdev ops and ethtool ops we want it to error out if
these setters are called after the interface is registered.

> +    const DEVICE_OPS: bindings::net_device_ops = bindings::net_device_ops {
> +        ndo_init: if <T>::HAS_INIT {
> +            Some(Self::init_callback)
> +        } else {
> +            None
> +        },
> +        ndo_uninit: if <T>::HAS_UNINIT {
> +            Some(Self::uninit_callback)
> +        } else {
> +            None
> +        },
> +        ndo_open: if <T>::HAS_OPEN {
> +            Some(Self::open_callback)
> +        } else {
> +            None
> +        },
> +        ndo_stop: if <T>::HAS_STOP {
> +            Some(Self::stop_callback)
> +        } else {
> +            None
> +        },
> +        ndo_start_xmit: if <T>::HAS_START_XMIT {
> +            Some(Self::start_xmit_callback)
> +        } else {
> +            None
> +        },
> +        ndo_features_check: None,
> +        ndo_select_queue: None,
> +        ndo_change_rx_flags: None,
> +        ndo_set_rx_mode: None,
> +        ndo_set_mac_address: None,
...
> +        ndo_validate_addr: None,
> +        ndo_fill_forward_path: None,
> +        ndo_get_tstamp: None,
> +    };

Is it necessary to list all these members, particularly those with
None? New members do get added, so it would be nice if either the
default would be None, or the compiler exited with an error if there
is a new member and it is not listed here.

The same is true for the ethtool ops.

    Andrew
