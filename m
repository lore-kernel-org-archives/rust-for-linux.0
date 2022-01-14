Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D4AC433EF
	for <rust-for-linux@archiver.kernel.org>; Fri, 14 Jan 2022 19:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239746AbiANTcF (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 14 Jan 2022 14:32:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbiANTcF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 14 Jan 2022 14:32:05 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16449C061574
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jan 2022 11:32:05 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id f24so7710016ioc.0
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Jan 2022 11:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=X2g0oBi1ONv1MWss6MWs3SgsIMnqHxQ8xTj09ppwRQU=;
        b=Ojyi5eNAmm2HamKXVmFex54Db9Ve/bLNTz7hvIwgcH0xifnlBBYYnPSGa0snarYHaS
         KwLA6RTOVrAyRNFC6YD9rFSg+8h4yQYvbTAEfDqAmtUL5+tpedbZbg+RuX4RyEBviYn/
         5r8YkdmSitdk2C/VVpYJHjhntGdpBVgRVbRY06Pa24eHOt6KpF+8HGMwg8cShlTVRxp6
         S2/5BJwPFJ8hfW3dNcUvB7USfT8fJBC70za7wW3k/gjVCxoFDtTpk6YJdaiW98VyoGjt
         U42CdqiPlYQHo6zYOslPzIPYSRDzPmDm747Unm2Q3pRvwxWf5N6JQUCLIV5rK5RH4RIv
         b81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=X2g0oBi1ONv1MWss6MWs3SgsIMnqHxQ8xTj09ppwRQU=;
        b=Janl3Yjq3b7r83bFaYQlLGAFZ7YK64Q8WA40lzvXLT13PHgEKM5CJ+z/tOF7HSGR6Z
         pNqwu1lT2TfyCF6Uzl4OD+5a3bqWh690Ontj05+GGpxghu3n2Tj0kV3gM8j2DY+I0hVD
         9SsZtFJ6e0ALxVu90lCbXvwwHkPOSTzeo/OUWUtmz2B1oTUzVYmnA/tvErlla4vIhV/c
         CAKHFeuyk5OCHVvg9duDQOS0Dnq9Rd5dyhU3Rcp1xCAI5pWyQJow0v0IXUd0Ww62Ni1H
         JgwrOLeU6MXgMLIqRVaL4JugynMaHJ7f9GsN6r3d5OkWod4NGxalw/11Jc+99QgWFa/F
         xfHA==
X-Gm-Message-State: AOAM5326RbEXfxoYLb97JnOaoYLnQpgszg6chIZS44uHVZ3x69CGRNNV
        cq4avIHYtl30Pc7RFOSOAo3JrWYwJDGNLpgISJ5Nqo2xnWc=
X-Google-Smtp-Source: ABdhPJxCNyrlj8sp0441iBly/KHcdnXBTs3sv+mxBqGCrqyYkqun3XaALH2kawV4ew7jbZmpex/o0k191Hk/ELyUyLs=
X-Received: by 2002:a02:7a1b:: with SMTP id a27mr5275860jac.186.1642188724451;
 Fri, 14 Jan 2022 11:32:04 -0800 (PST)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 14 Jan 2022 20:31:53 +0100
Message-ID: <CANiq72mr5KPXJFJXw1DmeA6szJab_8eDE=0Ya79sr4nemAb3og@mail.gmail.com>
Subject: Reminder: informal call 10:00 UTC
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call tomorrow/today (15th of January), 10:00
UTC. In this instance, the date and the time is a bit unusual, see [1]
(normally we do it the first Saturday of each month, 18:00 UTC).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

[1] https://lore.kernel.org/rust-for-linux/CANiq72=N-1tnsKnjX1Dwhr-VQ58bzjaR2nQ4f7E8K25dW6zh0w@mail.gmail.com/

Cheers,
Miguel
