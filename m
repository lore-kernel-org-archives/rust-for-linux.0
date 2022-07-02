Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21F2C433EF
	for <rust-for-linux@archiver.kernel.org>; Sat,  2 Jul 2022 13:57:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiGBN5R (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 2 Jul 2022 09:57:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiGBN5Q (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 2 Jul 2022 09:57:16 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 069F910F6
        for <rust-for-linux@vger.kernel.org>; Sat,  2 Jul 2022 06:57:15 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id s17so4728466iob.7
        for <rust-for-linux@vger.kernel.org>; Sat, 02 Jul 2022 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=TZQBfyPX+Lm0+51FppVnhYpJxmpiQ/AzALf0TQA8OGQ=;
        b=LsWNOLAElxNFsJTycB6zOXKWPJzzlJj5kE7OnfBNZnYIwjxTRRMWu/oUiXv6YqEzWT
         tcqgOBrBIEzZGUYocnSBR7bSOSX7gFG1bbYNKzoQIMuMljQuiA5NOsZfiBxdasOtVVI1
         xcRlxEHR0j1dT287hiNeS/2VxhaHnpXveTwRQspj22pISErPbNxOqRnADU1vrwAdqpoJ
         B9OVniO49h/4oUx1zu5pQUn3WImK97oNAtXQ+7JqnrpW7z11ffTzvx5IN6TGky2Fl75Q
         muKAq8421VbIgVVlnbDyRy/LbumzCTKtlL4VjaNiLbyV/g2l3yjzBFJoAUiivo2l4OC5
         z1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=TZQBfyPX+Lm0+51FppVnhYpJxmpiQ/AzALf0TQA8OGQ=;
        b=oX0Ph9szXQgynojVnjiQanXfHqNztlaS3vqn6FgnnjyYdj1degoQAoJlTZHIBk//n/
         Fhqya0Mpoqxm0pWyEvEpLQYKy+D/65FnagHj7ytQMurOMRCwlDqNfgRqZNv2YzITjfG2
         qPE+Nh6tXVmApQxCOAL76al/7Ln5oipecOUhzoRGXGPCnXJkiJ7+NRoM1t/EKQX5q5fJ
         B1Uz9MxtJiMFQQuZLqOvKcyllKQexrPsPHQo17aIoM9XTu53HKmyFCjMdx/mUPijpvNk
         16inzhAWUACRZ0dijYq5Gpt+INhfaQgELlnuoXXVRkWaz3E8kM7zFGFKxMU/NrHaJiSl
         DX6g==
X-Gm-Message-State: AJIora/ipVFgHxCtM+4G12AOPq+Sg68I7g/S3RC9mqT4t3GhduumOBK0
        NJiPJym3viCH6shSVKvgI2V7KrRF3Q6NQTtidifW6tpJulQnbA==
X-Google-Smtp-Source: AGRyM1sljhc2XV2IdZJoFpWjmd3SLihKicZMr2WF9lRskBwgjr0tiANwT3slmtjPRMuwNR/fnTq0oEqQJ0LTTGaDpO0=
X-Received: by 2002:a05:6638:1642:b0:33d:76a4:317f with SMTP id
 a2-20020a056638164200b0033d76a4317fmr8412668jat.186.1656770234478; Sat, 02
 Jul 2022 06:57:14 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 2 Jul 2022 15:57:03 +0200
Message-ID: <CANiq72n3L1ULyMkR48TqNvhOkz0fF2MT1_eCs86+k_joBgWUow@mail.gmail.com>
Subject: Reminder: informal call in 4 hours
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 4 hours from now (18:00 UTC first
Saturday of each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
