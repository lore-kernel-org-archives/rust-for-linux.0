Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C093BC19F28
	for <rust-for-linux@archiver.kernel.org>; Wed,  3 Aug 2022 19:52:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbiHCTw6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 3 Aug 2022 15:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbiHCTw6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 3 Aug 2022 15:52:58 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D953206C
        for <rust-for-linux@vger.kernel.org>; Wed,  3 Aug 2022 12:52:55 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id f20so20652451lfc.10
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Aug 2022 12:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:from:to:cc;
        bh=HvqXkuvCpoP3u/hitlzp+t6ug2jEzgee40ySuizkFzg=;
        b=GgEbQag0Mo9MM4oWWsafwxoHA5I7xUhZrg5iYNFHh2QJbeTVXEpHPn4AMb2t/5IyRW
         REbzEFpobiYrCQOb9s1Ah8R8aX/ws/rlTM9caoII3s8+qIcBiM3pxdbiQ095GoCzml1b
         UeHQSDPFtXiPNDabDZZr/Mb4iPhceZjI8KzmMbbt1OsSKe/zyCjWwuxVjL5eHarlfZJQ
         fM5JDhO3Ue/vbOarA+Yqxb9WviSwE90sRBkkTGmcI5x98ldJJsMDPoCR7nnEwbIu2zIe
         6WGmEum1AytlQu73cEyrSqGeHAVDAiBdANq22mPkhDyvUVgfINRY7lGCaljq+lffHuaj
         dnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:x-gm-message-state:from:to:cc;
        bh=HvqXkuvCpoP3u/hitlzp+t6ug2jEzgee40ySuizkFzg=;
        b=TK2WKLhncBrYFirdA5vENU+SYZHsnx8LI2Nw4NFbIkgPq5kb9h1oFrHZG0cph3ocpg
         bAXW2zEKV+B/2Nc1leP0MGzd6EZeYYQOHjYdaLfalH6ZCrsRqOQjMm9n4b/lV4wEaDAO
         B7/8+Zr82PhrViGizfjUqoG+8QD0r3saZn8TjUfmP+gaTyAOf5QFkUBpIgRc4t9FM0NY
         qEXNnmhj/Hv6x9gZkEM/Ak6rS5jaXQxhmmdnV/O6QcjmQ3i8vNJDHBWtIQJMZtKqDfNQ
         LPW6lGpVN/zgK1Ur4BITfcXQHu79a3N+b4HnpHDk48UZmt9jzIO8i0TZ574u31M5iCNo
         WaEA==
X-Gm-Message-State: ACgBeo1coUZ8pXsKNqVco+7XDiq9WanvDFfT72dfgC9uTRI4DflL/JxK
        As+pWTsB3FMbvm0Mw1do7ixwfTjuqWg=
X-Google-Smtp-Source: AA6agR5KdhrI4fk8vEnQVDvSWpDJ/oadeYINOekvlAXZ3MhowOhB9BRkH95ha1LH0UeLoST6QhQaRA==
X-Received: by 2002:a05:6512:3f8d:b0:48b:16d8:fbdd with SMTP id x13-20020a0565123f8d00b0048b16d8fbddmr2553816lfa.462.1659556373715;
        Wed, 03 Aug 2022 12:52:53 -0700 (PDT)
Received: from smtpclient.apple ([176.59.6.75])
        by smtp.gmail.com with ESMTPSA id k22-20020a2e92d6000000b0025e57b40009sm909611ljh.89.2022.08.03.12.52.52
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Aug 2022 12:52:53 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
From:   Sergei Belokon <srj.belokon@gmail.com>
Mime-Version: 1.0 (1.0)
Date:   Wed, 3 Aug 2022 22:52:52 +0300
Subject: hello
Message-Id: <09F13A5D-918B-4027-83B1-20BFA5AC6EF7@gmail.com>
To:     rust-for-linux@vger.kernel.org
X-Mailer: iPhone Mail (19F77)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org




Many thanks,
Sergei
