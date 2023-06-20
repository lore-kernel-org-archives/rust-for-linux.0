Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B30CEB64D8
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Jun 2023 11:17:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbjFTLRG convert rfc822-to-8bit (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Jun 2023 07:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjFTLRF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Jun 2023 07:17:05 -0400
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A50100
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jun 2023 04:17:04 -0700 (PDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-321-Hqnv-aqzNfCJOJ_wQbNkDg-1; Tue, 20 Jun 2023 12:17:01 +0100
X-MC-Unique: Hqnv-aqzNfCJOJ_wQbNkDg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 20 Jun
 2023 12:16:58 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 20 Jun 2023 12:16:58 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Andrew Lunn' <andrew@lunn.ch>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
CC:     "greg@kroah.com" <greg@kroah.com>, "alice@ryhl.io" <alice@ryhl.io>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        "aliceryhl@google.com" <aliceryhl@google.com>,
        "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>
Subject: RE: [PATCH 0/5] Rust abstractions for network device drivers
Thread-Topic: [PATCH 0/5] Rust abstractions for network device drivers
Thread-Index: AQHZorDeYU+x+QMBQ0aQGdSDP/YRva+Ti3KQ
Date:   Tue, 20 Jun 2023 11:16:58 +0000
Message-ID: <647250b251454fa99f4e473e553c99d7@AcuMS.aculab.com>
References: <c1b23f21-d161-6241-26fb-7a2cbc4c059c@ryhl.io>
 <20230619.175003.876496330266041709.ubuntu@gmail.com>
 <2023061940-rotting-frequency-765f@gregkh>
 <20230619.200559.1405325531450768221.ubuntu@gmail.com>
 <15046eb0-e0bb-4ab3-8d94-0cf9f37acfc2@lunn.ch>
In-Reply-To: <15046eb0-e0bb-4ab3-8d94-0cf9f37acfc2@lunn.ch>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

....
> Not releasing the frame at all is a different problem, and probably
> not easy to fix. There is some degree of handover of ownership of the
> skb. When asked to transmit it, the driver should eventually release
> the skb. However, that is often sometime in the future after the
> hardware has confirmed it has DMAed a copy of the frame into its own
> memory. On the receive side, in the normal path the driver could
> allocate an skb, setup the DMA to copy the frame into it, and then
> wait for an indication the DMA is complete. Then it passes it to the
> network stack, at which point the network stack becomes the owner.
> 
> But there are no simple scope rules to detect an skb has been leaked.

You can require/enforce that the pointer the driver has is set to
NULL when the skb is successfully passed on.
But that tends to require passing the pointer by reference.
Ok for long-lived items but a likely performance hit for skb.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

