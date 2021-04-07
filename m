Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2022CC433ED
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Apr 2021 14:22:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA43F61279
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Apr 2021 14:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243635AbhDGOW5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:22:57 -0400
Received: from wilbur.contactoffice.com ([212.3.242.68]:54554 "EHLO
        wilbur.contactoffice.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348318AbhDGOW4 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Apr 2021 10:22:56 -0400
Received: from ichabod.co-bxl (ichabod.co-bxl [10.2.0.36])
        by wilbur.contactoffice.com (Postfix) with ESMTP id 51714D28
        for <rust-for-linux@vger.kernel.org>; Wed,  7 Apr 2021 16:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1617805366;
        s=20210208-e7xh; d=mailfence.com; i=seiro22@mailfence.com;
        h=Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:Reply-To:From:To;
        l=725; bh=nRCNQI/cYCUUGMryEha+mV8UjBbaYCOjz2b5Nyd8p5Y=;
        b=zRMdVqngz8KkYyEWyfZxNf4fQs87MymlIGdroBmS5fuZuPbLLZE0dlIdqBoi6A2b
        y+A/DjhDO3wLxGP7EQlYeQkccc1DgfxRKOlhHO/dm7Rrgo+v7ITyGx8gGh5WtordplP
        wDhkYxu2rUaI5itk7kicp1bXPio1IqKj5Q0fwFgH+AStKuUN95WS4hR/qhOE7CR5kHa
        1xYb76tAUWPw1eoe3tc71TbijYb4KyqYwt/yB5VeYjH31TSOy/xye1Hm1RE/mE1uLDE
        j62RJKcDNyHdx3RaEAN789XPOkzqT+MpOaZ06PLwkrFV5i3FPIr9yxJj9o7WtueSMPF
        qdgNBfl4jQ==
Date:   Wed, 7 Apr 2021 16:22:43 +0200 (CEST)
Message-ID: <1802230489.25122.1617805363569@ichabod.co-bxl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Subject: leaky info and kernel modules
X-Priority: 3
Reply-To: se iro <seiro22@mailfence.com>
From:   se iro <seiro22@mailfence.com>
To:     rust-for-linux@vger.kernel.org
X-Mailer: ContactOffice Mail
X-ContactOffice-Account: com:283344282
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

saw post on reddit and github issues where rust compiler adds username and systems paths/info to **release** mode compile bins. also its pkg mgr cargo does the same with registry paths. otherwise its extra strings bloating output that not needed and strip command doesnt work. also not working is compiler opts described

does this impact chat of rust in linux since rust team seems to be ignoring the issue?

ref links (maybe more too):

https://www.reddit.com/r/rust/comments/mfax64/remove_username_from_binary_for_privacy/
https://github.com/rust-lang/rust/issues/40374
https://github.com/rust-lang/rust/issues/40552
https://github.com/rust-lang/rust/issues/75263
https://github.com/rust-lang/cargo/issues/5505
