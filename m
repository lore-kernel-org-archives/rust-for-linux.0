Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B274C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 18 Jul 2022 04:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbiGRE4R (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 18 Jul 2022 00:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiGRE4Q (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 18 Jul 2022 00:56:16 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB17F11C3E
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Jul 2022 21:56:15 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id m16so13674779edb.11
        for <rust-for-linux@vger.kernel.org>; Sun, 17 Jul 2022 21:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=QsYq0HKVRqVyS8bll6Q2clkFNw6AGW6gH0It89AKkpA=;
        b=PxAFv6v29T/MeqTocKYz926fd6TSSe78/1m4H8C1NlZ6Uq22I0TxLH++WTh/MbQJ5M
         594L1Q2DY2rhAGRagptNDIlpBNbHhIXyzLVkuUcCWD8NPbvywv39KE18Cu/c5qnPwGJs
         k3hG3Q1z7dBdO7RXQnjCfj2Z2my2lgSCHFSWel9os4+gkwf+eQ6kllg8N2H0VLMXkLbk
         JVTH5cy8B3DC/lVIb436ZYIWmr0bXTx+EVE8y8+0W6YyakLQwkrWoRj+mR+gF/8vKxuH
         U8rr2bCT8mu589krEyf5FwToZjGmpESDNIrshaA3E/0sZHnthvAr17hQuDWWL8jXoX5x
         NycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QsYq0HKVRqVyS8bll6Q2clkFNw6AGW6gH0It89AKkpA=;
        b=VMmErVzhgtxczb0zYppzzW/Q++Yfiyw4prufpkBziHSQmJxiXb3XSZo6se2X+pl1WL
         8ffk8L0FPbLojTfs91z2E6+oV8ggTDasD5Y2l6KjWyCdGWboEGofO0C4DRyyMwTWqGxc
         DKzoOrdLhuW5xpqbIZiTxw6V57eOnvvmemB4GPHBaktVuNHw0W1XJq9tsQ/ezRPAb52q
         9jPkM+twIeMKt4bpKEHMGaQ+vgmYDgGzQNUK4JA4Z+tT4iI5aIoerKeprC2p6x/x6n8t
         Xj6CeurwyF0KNkB7xtjeVdlEQdBZK8lP0stWX2CNpmxAI9F83DzoycOKEb8CD26+d3Uy
         EN/A==
X-Gm-Message-State: AJIora8L9u3L0xDLBpR9fDg5Pqm+BP/UrzMjJjHxAPq25xneJ+DY/QL2
        fiPxB2Q+vlL7rudOjCF7FK03Yf1zMeSGfi01KKaSNs/J6ck=
X-Google-Smtp-Source: AGRyM1smi5DCAmHcMbEHMtu0kJqFwTDR+qPrjGlIL5Ps/GxzBQFvnBGztuLs8myEhf+1ZSwCFjzh1RVp/BJkjEaXooM=
X-Received: by 2002:a05:6402:c44:b0:431:52cc:f933 with SMTP id
 cs4-20020a0564020c4400b0043152ccf933mr34754735edb.41.1658120174072; Sun, 17
 Jul 2022 21:56:14 -0700 (PDT)
MIME-Version: 1.0
From:   Muhammad Falak Reyaz <falakreyaz@gmail.com>
Date:   Mon, 18 Jul 2022 10:26:02 +0530
Message-ID: <CAOmbKqnmmskRQW39Li4EV5_RpiJDn1W1pbQCTO73Cd20acJ-Og@mail.gmail.com>
Subject: Request for invite to rust-for-linux zulip
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello,

I recently attended the LFX mentorship session on developing drivers
for the linux kernel in rust.
I request for an invite to the zulip chat.

Thanks in advance.

-mfrw
