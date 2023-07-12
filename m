Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78066EB64D9
	for <rust-for-linux@archiver.kernel.org>; Wed, 12 Jul 2023 11:45:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbjGLLpr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 12 Jul 2023 07:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjGLLpq (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 12 Jul 2023 07:45:46 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA56A1981;
        Wed, 12 Jul 2023 04:45:45 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-682b1768a0bso1509600b3a.0;
        Wed, 12 Jul 2023 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689162345; x=1691754345;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArvrEKMywHwDH4TLSn9ybzwSTrZt/sgLQvl8TNUXj9U=;
        b=cvn1Sve1BghbyoYPq8JrzD08M/vDRZffv3UNqSp2LRKe29+tWeHdmuHHVe1Ito37cG
         Z7zjh1Hzo2vg+/Lue9wWOYCdmbvlrl9v8LMS4nFnSO6GHDgfG4E3bcvtkpmiSAjjlYFM
         cIX3a/Jx1eyO+YdvKNJHANXOHOcb5KlZoEzo7mVTzRUP8RPTVAr2kKHhtZ5f7AMASKkE
         fC6gS1HfdGUbSZ2+V6vt54gFPDgMQ4zFdN2UJLByPch9g/kaJvsGOIOK4gQ8eQGUlnGh
         H05vXLnTkdajV3ex7viV6cjYqZGELc6BvzykLhKZp4FqJZINjwTzFhQjfBFJbpBWI1XY
         kcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689162345; x=1691754345;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ArvrEKMywHwDH4TLSn9ybzwSTrZt/sgLQvl8TNUXj9U=;
        b=M88ySGs+fPWy6KAK645Dxx8D9idNjtHG3GUXiJAC2VJ2Jxjd878TBjvVVBHeufDdcg
         zYiCTsJqUjxp+873O9dVMordiebwH3TMEGOWsmeeaScqnQt0pIR5+1BZaakMykGQgvVL
         vzA2d8UcZy3iRjGq/gIJn1WysaoMeJrC7/MQ8WSlHq4iTfjXCd1wuBf8VKK68ijReiZh
         5Y0dnqPkl265PDlJBlvDXO89SvOAwDAOC90wLx7cZZPxtVdsVLer1FbpFjcttl6n6wY/
         bov00OSaPpLOAyEzLoeAdp/EezTT+CWeO/kbgxFD9WqI/j8tESLh9blU3UxVVtgmbvzY
         pehQ==
X-Gm-Message-State: ABy/qLbwG6dBdmfNQ2PSX6jZ18I0JlzE52IeuTN3ssbg4V6dXCI6xS2j
        ZtrIq2cRdhZlw5wvIq9v0IY=
X-Google-Smtp-Source: APBJJlHvmNjfCRdQDsbJ8rtk19zagGaS4KOss0aPewkUBn1OCFzhStPvBIbXcQ90qoYROU67Q4CP1w==
X-Received: by 2002:a17:902:ea0b:b0:1b8:50a9:6874 with SMTP id s11-20020a170902ea0b00b001b850a96874mr23322458plg.5.1689162345170;
        Wed, 12 Jul 2023 04:45:45 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090a2a4d00b00262eccfa29fsm10548745pjg.33.2023.07.12.04.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 04:45:44 -0700 (PDT)
Date:   Wed, 12 Jul 2023 20:45:43 +0900 (JST)
Message-Id: <20230712.204543.2226074393539380021.ubuntu@gmail.com>
To:     andrew@lunn.ch
Cc:     fujita.tomonori@gmail.com, kuba@kernel.org,
        rust-for-linux@vger.kernel.org, netdev@vger.kernel.org,
        aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com,
        benno.lossin@proton.me
Subject: Re: [PATCH v2 0/5] Rust abstractions for network device drivers
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <657b43a4-6645-4afe-b60e-269624c1b9ae@lunn.ch>
References: <20230710112952.6f3c45dd@kernel.org>
        <20230711.191650.2195478119125867730.ubuntu@gmail.com>
        <657b43a4-6645-4afe-b60e-269624c1b9ae@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

On Tue, 11 Jul 2023 15:17:33 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> Or you think that PHY drivers (and probably the abstractions) are
>> relatively simple so merging the abstractions for them is acceptable
>> without a real driver (we could put a real drivers under
>> samples/rust/)?
> 
> PHY drivers are much simpler than Ethernet drivers. But more
> importantly, the API to the rest of network stack is much much
> smaller. So a binding for a sample driver is going to cover a large
> part of that API, unlike your sample Ethernet driver binding which
> covers a tiny part of the API. The PHY binding is then actually
> useful, unlike the binding for Ethernet.

Point taken, I work on PHY drivers first.

> As for reimplementing an existing driver, vs a new driver for hardware
> which is currently unsupported, that would depend on you. You could
> reach out to some vendors and see if they have devices which are
> missing mainline drivers. See if they will donate an RDK and the
> datasheet in return for a free driver written in Rust. Whole new
> drivers do come along reasonably frequently, so there is probably
> scope for a new driver. Automotive is a big source of new code and
> devices at the moment.

Understood. Let me reseach the existing drivers to think about that.

Thanks,
