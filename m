Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3961AC433E0
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 11:00:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07A1F64E05
	for <rust-for-linux@archiver.kernel.org>; Thu, 18 Mar 2021 11:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhCRK7u (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 18 Mar 2021 06:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbhCRK7Z (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 18 Mar 2021 06:59:25 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A545C06174A
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Mar 2021 03:59:25 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id o83so2131684ybg.1
        for <rust-for-linux@vger.kernel.org>; Thu, 18 Mar 2021 03:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=hKGanM0Rip/AitDrtV0qkIb88m8gRw9S7a4eQ1oGQ+8=;
        b=eawd2rfWaw4Tp33zi+uT1J7JpT3KWEL2oMlTD+/zQBmAEtoi80p2ZMw5jwOwpUkI6a
         Xm0V9izfirTRUdLnYLn8mF4jTmljfUmZoWkYygB4EqwAqJxbGCf/sdYVBA5juf/aQ+VP
         06Xn+lWVbw2YzrV22GJblOFWBuDepjpwL/rga7ofrEGb26coEhyV5Fcy+icpRtaVtwuO
         cKfRyZcC1+t2an8tQj7OQlaTeCnTjMrT1DpN9JOtrDhctudv8EgDyYdSOchZB+lHOjux
         FEdVohQ4mpq7gK8E1tCNbRiQA8D0nCPxuqEvUecgFeA4twJNrflo7N1d/S31bePdsJt9
         oRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=hKGanM0Rip/AitDrtV0qkIb88m8gRw9S7a4eQ1oGQ+8=;
        b=ZqLZmCqzdOx5bvo7LWxc3mPRRWRgRB3TdCOyA/3PUP6ZNo05iQxOqJrgBBqJBu10Js
         z/81swA6SL2xwgDmyV90jWMW+QD5IPj/GdkZWWeXny7PzwsJlFPzF28sgv58ch84vO55
         KqlFnqHVvPl+Zv+IgF89vkEoyo2ElFBpb9qVYhFFOQy+8vDItWJYENVBYkZa/ltFzQgm
         SZV8j3TNHFp7Aq0gvQhI9QZRAIjcvhjQmntLFVi0doImzotaulpA2+KZ/JqGoaVh0p8k
         F5sXTK4qsJTMPiGmMAzvOuRgEwBhXZSZNT3SFFh2OyuXQ3fiu5gsmkbqCliBMs9TWGoF
         ri0Q==
X-Gm-Message-State: AOAM533oN99vkl58BLIsdarZp5zBKGQMBcXBhYGDBLUTKMUuiiRtPcAu
        hUiwvy5gDqNg3jp2y/+sdJre7FFKS7XEZDqssdn7hh4cHEQ=
X-Google-Smtp-Source: ABdhPJzP4FlEXaHkivYq7/RJ7MHfUGej5S0GNS642ju1zf7CtdStkYj+v9qRvRPktDl9lcXRowCI7k/zI6PtXH5clfM=
X-Received: by 2002:a25:844a:: with SMTP id r10mr4909031ybm.26.1616065164405;
 Thu, 18 Mar 2021 03:59:24 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 18 Mar 2021 11:59:13 +0100
Message-ID: <CANiq72nbNxpps+p4wYp03ncrbGH9FFoTfHQZwg_vGdPO41eGmQ@mail.gmail.com>
Subject: We are now in linux-next!
To:     rust-for-linux@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

Thanks to Stephen Rothwell, we are now in linux-next!

This does not mean we will make it into mainline, of course, but it is
a nice step to make things as smooth as possible.

Stephen has kindly agreed to give me a bit of leeway the first few
days until the RFC to rebase things as needed, which is very much
appreciated.

Cheers,
Miguel
