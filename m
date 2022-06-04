Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FD8C433EF
	for <rust-for-linux@archiver.kernel.org>; Sat,  4 Jun 2022 17:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234886AbiFDRhu (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 4 Jun 2022 13:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234420AbiFDRht (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 4 Jun 2022 13:37:49 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B1E9633E
        for <rust-for-linux@vger.kernel.org>; Sat,  4 Jun 2022 10:37:48 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id p130so4183194iod.0
        for <rust-for-linux@vger.kernel.org>; Sat, 04 Jun 2022 10:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=RQM48X3RfgIFChHvqnRPT0widQSiJNoM2DdfxgvUUNY=;
        b=XoVYMP6z4wDQuu0h/pMJogKzBklPwmiDhKl+JcAVGgNLX0kc5kOuh79w/6xKgXcIcD
         bh7flJ3UJJj/wcro3vkdfkyV1LqOHAzuU9VY+lOXj/sW/cQkWYnIn0eAUVxB0dFYQrxr
         lSGVZEynQ85Yf0PA70fcJ/OqnHPMdbPK0r7QsxUIK/48OOgKr5tl37hnrn5jHEDI33kD
         6sO80BP3lA+LLmiOu3FyGYKLc1qgEWNiuJ/+R1Yo5E7QCnoPTJrMeqR0KmgNYFxG4RbQ
         NT1lVTBRXb8N5Vw+oorsJUXFfkkr7zKBJWnDHacRESQ95MEhLtDxda3Fi36DQUubYGmp
         Reng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=RQM48X3RfgIFChHvqnRPT0widQSiJNoM2DdfxgvUUNY=;
        b=qe5hriOvxVmjtEqoZ4Cj7xviZhZzUvYIUCg+VCrv5mY1zNi0lb8+08UmrvoQopsMhk
         8EDa/LmN5XiJIQIWN2gzrgueJjBY+0LspcSqtNs8QjSUvX5dm5Np5tt6dvdgbYtuheir
         h9NUc0ru8zsZTM7m85a88ZSIT7Vxnxo7A+6EC4XwgcMfqSAO99y3dVSeh1WhzZ6UCsGI
         BhiFkEFtAibTwpHrk9zBzpv3XxjGHLAnWWVYCBHfJXxhwRyinYQ0fAOBON3OtqaORZQP
         sPOqwgfbUUSl9DMwBnOVz3/r07BMO0e5eZycu545XaIfxips51eucTaxVsNBv8OpWsXm
         boYQ==
X-Gm-Message-State: AOAM532n1o5NFwlFzS+3SBcpjwZobckFeMn+GiNiPDJhTEvuwaE7jm3z
        4IoZi2ct8kkIPaekwZvKDN0S96H+j5xWLiECe/GCDzIErcs20w==
X-Google-Smtp-Source: ABdhPJwvKLiDo6GMZ1ANdO6L8Mxb331woaqaO0TCTBCZiDWxwQKPBHf7XArFmQxglIEQ1GQqwbKZD6EXN+cpMQol0C8=
X-Received: by 2002:a02:394c:0:b0:331:7d9a:70b with SMTP id
 w12-20020a02394c000000b003317d9a070bmr4233138jae.199.1654364267964; Sat, 04
 Jun 2022 10:37:47 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 4 Jun 2022 19:37:37 +0200
Message-ID: <CANiq72=RuTU3nH8TUBys059Mpr6S4oU+5jAPT3MFcVbhaMgVnw@mail.gmail.com>
Subject: Reminder: informal call in 20 minutes
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 20 minutes (18:00 UTC first Saturday
of each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
