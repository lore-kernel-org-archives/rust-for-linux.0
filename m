Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 783C1C678D5
	for <rust-for-linux@archiver.kernel.org>; Sat,  4 Mar 2023 17:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjCDRrM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 4 Mar 2023 12:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjCDRrL (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 4 Mar 2023 12:47:11 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BBE1C31A
        for <rust-for-linux@vger.kernel.org>; Sat,  4 Mar 2023 09:47:01 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 82so4659193ybn.6
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Mar 2023 09:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677952020;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QnPWfGgu9ZgAW82Qc2D0b+fAtAx4tBkF21CqE5FDyLg=;
        b=B/z5fpDG3Tvmj8Nwl5JY+CHz5/EihOfjzQixDAvM2fioAv75hyseeH5IAwbtoD0upc
         upcoBA/MXp5n+O3LLlijmJSezlpCL5jXUykc52vnvUyoBzYrlWxxWKS7xYdMUFvb3z7A
         YLVrRygdujQx22/cp6LQESnnathWxhQLX1e2vrhT22YfvCNTES1dmnkD6PMmpUyJ/dF4
         yfoQO/rtrSlxrIixp9zb1zu58PKIzGF+fhy7pkWTTcqFbyvOEh74wvsC40jkaUvhMMEL
         n2ymJhKv70zpe4tEHGqMqAkzq+XyOn5EZtv6olf1EErU+PgyNM+X/8CKrteAnzBijtly
         Ndpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677952020;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QnPWfGgu9ZgAW82Qc2D0b+fAtAx4tBkF21CqE5FDyLg=;
        b=psOXVCes8UU3pG0u2Ft4wLZqgLGPT1Ps95FGrIZKN2kDD+ydS7kewKLos0kOC5V57+
         6j231lQaR7XdkZ5mXv5q5hYn5NwD3o7mRIkbvT/D9MsF0RHPyfMJ6SxQOw9rsvW5xdLK
         BrXwbqcTjb4qnBpLJ3RAjH3lgZKtITMKBzc1nQguKCFMVXGf9AN2n2sUAVDkLXimb4mX
         Z1dafFQAXJZd4Euefab6LQTFQ4ewW1KvGZUIiIxjw6tWzhpQb3iRLlGAb6jhYc5xD3O/
         O+k2EQemnasr6VUdmB1Sa/rI6CnYmPIfwdogn2S83IBFJgf/F69jdzH+9oCNi3R/nE1j
         lrLw==
X-Gm-Message-State: AO0yUKXiYRcDYVsIk/fpVYPveGGNaysyDx9SO4HLNveh5x7y3r/S4J6C
        MF0K7Cpx5ESalgf/cSGPbNZPjHP4heaU9h7bSob3LP2i+yNP6sKY
X-Google-Smtp-Source: AK7set9bPKJfhYlJg8DethcIPc8Jcdy4KqXB16bVDV0F8GNrxdssnmvDsqPbWSEf28kjn/hhZ4Uo/ejnU7rC2HClM8E=
X-Received: by 2002:a25:9c05:0:b0:a6f:b653:9f18 with SMTP id
 c5-20020a259c05000000b00a6fb6539f18mr2689411ybo.2.1677952020638; Sat, 04 Mar
 2023 09:47:00 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 4 Mar 2023 18:46:49 +0100
Message-ID: <CANiq72mbDNebYeABVn9_bM4_PpmDzOH6ewJzcrTZM+9PnBNEtw@mail.gmail.com>
Subject: Reminder: informal call in 15 minutes
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 15 minutes from now (18:00 UTC first
Saturday of each month).

As usual, everybody is welcome to join. If you need an invitation,
drop me an email!

Cheers,
Miguel
