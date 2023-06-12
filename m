Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D575C7EE25
	for <rust-for-linux@archiver.kernel.org>; Mon, 12 Jun 2023 11:39:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236510AbjFLLjB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Jun 2023 07:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232098AbjFLLiL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Jun 2023 07:38:11 -0400
X-Greylist: delayed 8582 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Jun 2023 04:27:10 PDT
Received: from a27-42.smtp-out.us-west-2.amazonses.com (a27-42.smtp-out.us-west-2.amazonses.com [54.240.27.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91CC7EDB
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jun 2023 04:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=s25kmyuhzvo7troimxqpmtptpemzlc6l; d=exabit.dev; t=1686552452;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding;
        bh=APEIM5a3jGaZn90hsbySieNbwFrY87LHcvgSs7aqwdE=;
        b=XCUkGDJ047XKm6rXPudsasooRbZgImgSrmpYCxprl3dk4jwWYRLTrcDXvdExc4eu
        +qpBNJ/R38lTgyoNc+1ZvJgUiag+kk9BPDDg3B5aln+1JxCXkNKmKDf2/ElzQi4lwrk
        V6yHJ1l+Tyvu79rcakH0eAJhhTvkUqRyXj+QvKu7wQPZBtB7qsxDTt6YN1ah+AzrfDS
        II+Npr1Wrprh2R0H/aG5VHR4MAw/AiZr4ekzchWp2wIk2Lk4nj2VeKNHIsBh/Hu5qBI
        3HpZMy2EJGwBtjXjmF3hYR0u4ryHE8I22fUboXqHibQhYM79Nmf3ldCKvd+7Iq8JqNx
        zQuGmHo5YQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686552452;
        h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:Mime-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
        bh=APEIM5a3jGaZn90hsbySieNbwFrY87LHcvgSs7aqwdE=;
        b=McPGlL2PZ4mR17dE5XONdcLcEqktT8lsEssfnDcNUP4gB2wL8u2RhQnv9HbtEt5k
        8wd6u0SWCc1ndTGNutB0RnRKB6oh39TWPQSTMie55SSMmivyYBF7LWHwAEJZwSYaNpt
        6Bq/H19juZQlY23Ps4Bsidy+ncBTd4KGDpu+1gj0=
Date:   Mon, 12 Jun 2023 06:47:32 +0000
Message-ID: <01010188ae5c1bf9-0893599c-c21c-4fc2-b8fc-c68c9f2a4e14-000000@us-west-2.amazonses.com>
To:     andrew@lunn.ch
Cc:     tomo@exabit.dev, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/5] rust: core abstractions for network device
 drivers
From:   FUJITA Tomonori <tomo@exabit.dev>
In-Reply-To: <18368b79-f204-4bc2-b591-859d3ddb22f1@lunn.ch>
References: <20230610071848.3722492-1-tomo@exabit.dev>
        <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
        <18368b79-f204-4bc2-b591-859d3ddb22f1@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Feedback-ID: 1.us-west-2.j0GTvY5MHQQ5Spu+i4ZGzzYI1gDE7m7iuMEacWMZbe8=:AmazonSES
X-SES-Outgoing: 2023.06.12-54.240.27.42
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Sat, 10 Jun 2023 16:11:41 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> +impl<D: DriverData, T: DeviceOperations<D>> Registration<T, D> {
>> +    /// Creates new instance of registration.
>> +    pub fn try_new(tx_queue_size: u32, rx_queue_size: u32, data: D::Data) -> Result<Self> {
>> +        // SAFETY: FFI call.
>> +        let ptr = from_err_ptr(unsafe {
>> +            bindings::alloc_etherdev_mqs(
>> +                core::mem::size_of::<*const c_void>() as i32,
>> +                tx_queue_size,
>> +                rx_queue_size,
>> +            )
> 
> In the future, there might be some naming issues there. Not every
> network device in Linux is an Ethernet network device. Some network
> drivers will call alloc_netdev, or some other specialised
> allocator. 

Yeah, I thought about it. Actually dummy.c uses alloc_netdev (then
calls ether_setup so does the same things that alloc_etherdev_mqs).

Wrapping alloc_etherdev_mqs is simpler because of a function pointer
argument in alloc_netdev so I used alloc_etherdev_mqs.

Once someone takes up the issue, I guess that we could add new
functions for other allocators.

thanks,


