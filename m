Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CD1C433B4
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 01:28:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8409D6127A
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 01:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233919AbhD0B26 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 21:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhD0B26 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 21:28:58 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F9BC061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 18:28:14 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id a4so57759075wrr.2
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 18:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=es3KrXu5Z9omDLUIEhPBVdEVH5LpaEtGJgjvZ9qB2xA=;
        b=UX1PJP1TqZ8qXpFiSlSRovm9QD5Iou0wgnfpWnTpW2IIjtjPFUrhTh4I/seoW0jOW/
         7jRhATVhQqBLT2jMZQ8iqoBG1+FxDC6NMNiWAE2PFdegSlWP9va8P4hZB2os3OT03Tbu
         GiBJIGGJ+RT6AwCy3N9pnCIAMiGSwHl0hFRsYeesORwlP/RJPYzjWZOubemLdHBGjwfW
         S2Q8Pa/DuHpiGZiEKZubyvOFPsof1IcMt4yPBdFN3nVtRwA5nRierQeAmJXmKI0kyc/F
         GyIAlCqWzKAuL1G1xtAA3V5w+k5aVN6iGggLth7QhsPYOQi/wC7ghPVsiqdxQdovb8E6
         WrFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=es3KrXu5Z9omDLUIEhPBVdEVH5LpaEtGJgjvZ9qB2xA=;
        b=IPTNEM/JrIUO2xIr2u9P5SG4i60rRSoKNVEJVPLCnxuUBRR4a/rlX2hGSbKQoGO/j/
         kWelkm5TbeCffGkbeq4cNfe1kkht9PzKiwN6Ub2Int12j+2YLDac2yZ95hivDbcBT4jA
         jVsGfIV9zAnvBzEWzYEOt10doBRKU/xDrMqclt/g25qiyddbkHt4FPCUsNoh2z2QAmhE
         ihrOJ5pyDPSYkh42SAmcmFG3N8GHxvisXRf/OW4TW8GjEgaE5MiFr4MWvIwpCSwWzcEp
         3p/cNYySsdP8mKeX8ZWE6KMa+RZy+SQjzgQr2SaX9QvQRZk72PhkPn/IOToh7tExMr9d
         LRMg==
X-Gm-Message-State: AOAM531fiOaJYPfyPPRbY87f6QmU/0jKB9idZtqeCjZN01AajyKdjDQO
        l08IQzHVwD7/2MdPyvn9zJcT8mopeuMO
X-Google-Smtp-Source: ABdhPJyDwXxWSIpDf7kNpMDippsO1krkLnnMjUGd9UgyFc3gPe210K071XqzkgySXHKPNDiNCClozg==
X-Received: by 2002:a05:6000:1785:: with SMTP id e5mr26362167wrg.143.1619486893092;
        Mon, 26 Apr 2021 18:28:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:12fe:7da3:d4af:86a4])
        by smtp.gmail.com with ESMTPSA id x23sm18590700wmj.43.2021.04.26.18.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 18:28:12 -0700 (PDT)
Date:   Tue, 27 Apr 2021 02:28:08 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Hanqing Zhao <ouckarlzhao@gmail.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [Question] import third-party crates in kernel modules
Message-ID: <YIdoqJvma2xozpwu@google.com>
References: <CAKmvQ+U7LbwLRyY6FC70Y9-1Sdp8KdYRXryUvk9oTHvJSh29nQ@mail.gmail.com>
 <CANiq72knPX3GHHPPrZ=ErgX=1DttMXjOShcA1ZF4TENzNRaWzg@mail.gmail.com>
 <CAKmvQ+UGiKVchv3DpR-QhyWqQ6-kx9HETNUcZqAv+An0ZgQwCg@mail.gmail.com>
 <CANiq72=oSMO1yGKFdOfVSZbLcsTVeJCXmbD_RdpnOqqKw4p55A@mail.gmail.com>
 <CAKmvQ+WH_PVy-XS+Rpa+_8Z9AjNDVwkTQFMZZtAZc7G9-7tJoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKmvQ+WH_PVy-XS+Rpa+_8Z9AjNDVwkTQFMZZtAZc7G9-7tJoA@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 26, 2021 at 04:41:04PM -0400, Hanqing Zhao wrote:
> After I finish the linux kernel integration, I'll show my
> demonstration to the rust-linux community.

Hanqing, Miguel himself is already working on an alloc crate for the kernel. We
discussed this a couple of days ago in the meeting, that's why he's inviting you
to participate there as well.

It is of course fine for more than one person to work on any given aspect and we
are glad that you intend to contribute. But we think we'll be more effective if
we coordinate with others before spending a lot of effort on something -- it'll
also reduce the risk of frustation and I hope better utilise our limited
resources.

Cheers,
-Wedson
