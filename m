Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D9CC77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 14:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbjFJOLr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 10:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjFJOLq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 10:11:46 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24FD3A97
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=/3PGUBT38nBW+uTh3xzm6oYfIwYo3wRysFUzvdQdrNE=; b=fu1dGOLQeCYq6V3ggYNeRgIQK8
        5ubv/IeBANSpep555WwPtGLxWbrSRTkz4PABGX7sTVIjPt3LGCO0UPbMZbsmIe4Vhp91576lP941N
        1dvQIptvcMXDhKvodrSfwlQuBbD8+AJnQL2RaOXOQ9N0ppkKQx/Ozay65esZqMSDJsaM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q7zJd-00FRO0-Dl; Sat, 10 Jun 2023 16:11:41 +0200
Date:   Sat, 10 Jun 2023 16:11:41 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v2 1/5] rust: core abstractions for network device drivers
Message-ID: <18368b79-f204-4bc2-b591-859d3ddb22f1@lunn.ch>
References: <20230610071848.3722492-1-tomo@exabit.dev>
 <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> diff --git a/rust/helpers.c b/rust/helpers.c
> index 81e80261d597..a91d2a99035b 100644
> --- a/rust/helpers.c
> +++ b/rust/helpers.c
> @@ -23,10 +23,26 @@
>  #include <linux/err.h>
>  #include <linux/refcount.h>
>  #include <linux/mutex.h>
> +#include <linux/netdevice.h>
> +#include <linux/skbuff.h>
>  #include <linux/spinlock.h>
>  #include <linux/sched/signal.h>
>  #include <linux/wait.h>
>  
> +#ifdef CONFIG_NET
> +void *rust_helper_netdev_priv(const struct net_device *dev)
> +{
> +	return netdev_priv(dev);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_netdev_priv);
> +
> +void rust_helper_skb_tx_timestamp(struct sk_buff *skb)
> +{
> +	skb_tx_timestamp(skb);
> +}
> +EXPORT_SYMBOL_GPL(rust_helper_skb_tx_timestamp);

This question is probably due to me not knowing about rust. Why have
these helpers? They don't appear to don't do anything.

> +impl<D: DriverData, T: DeviceOperations<D>> Registration<T, D> {
> +    /// Creates new instance of registration.
> +    pub fn try_new(tx_queue_size: u32, rx_queue_size: u32, data: D::Data) -> Result<Self> {
> +        // SAFETY: FFI call.
> +        let ptr = from_err_ptr(unsafe {
> +            bindings::alloc_etherdev_mqs(
> +                core::mem::size_of::<*const c_void>() as i32,
> +                tx_queue_size,
> +                rx_queue_size,
> +            )

In the future, there might be some naming issues there. Not every
network device in Linux is an Ethernet network device. Some network
drivers will call alloc_netdev, or some other specialised
allocator. 

	   Andrew
