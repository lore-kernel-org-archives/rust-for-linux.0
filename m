Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1986DEB64D9
	for <rust-for-linux@archiver.kernel.org>; Tue, 11 Jul 2023 01:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbjGKBM5 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 10 Jul 2023 21:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjGKBMu (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 10 Jul 2023 21:12:50 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C966E74
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Jul 2023 18:12:27 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6b73741a632so4184524a34.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Jul 2023 18:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689037946; x=1691629946;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=20IgmmmxFL9+5mbS4FyJkAYOCEehKi3aFN/J8t5pDEA=;
        b=NybR0pZQ8OqBr8pogbKo5aDoBw/RBs+m1gfLrD0iCnjt/Y0RBkroVc1w3L7Mi9b6Hc
         Xw4mvgi4GrEsq924o0SbBGiNNDB8SGg2Kh+y5fLIQvcakU8GRTs2m7SOHgiZoEStjeLm
         EH1rMwjvwY5B9G/0eDas/s+7y+3h0wbQ8ceVqlfxg1f0RgzpQlJW580sBoX4Ky0ZcGYZ
         69F6cbSkHLt7U0eFGBRgiTLLlwG1TfSUQhDgXWIlbUvwWQzWSxmqZzgTZIZ78bLJV1vr
         MDNb5BLaoMMMRhXBHiKsfy6NyhF1XqaHs3RXkJublySjcG+MhU/xU3l8Y18yTEeG4iIE
         g6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689037946; x=1691629946;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=20IgmmmxFL9+5mbS4FyJkAYOCEehKi3aFN/J8t5pDEA=;
        b=Ne7V2X6qSF7uXyF3xhnF9GEVhdH2uxchMSCXCVCyXpNYghPpfHUN2W75OzKGwtyJNI
         fcFoNhTPgQtsYyalE5ulohvkiClbUqbzgVc5WhBbPOR32f8Xvv+r3+ci+TN20zfXL03j
         J0dH436iTuyaedI+w9N12NHdYoAzvsdv/kzSgX7B74mS/pX/d3bnWcst87C33sK4eEb/
         fhz5n0tYf0YUVlm95+7l7Bl7lsRUIFNZFF3Akw/Wu9XYlfBLsxAsmeRet7OwuZ2DajLU
         VHC6pt6ew+EHb8qafrqhFH8OiR74xe02rLcZB8aRRUG/+XL8M85AhA4+bcNxCC7TfkmU
         N8YA==
X-Gm-Message-State: ABy/qLaVn8pVURV700a2SrMKsin4APuEBhZ3R8jbNPeY4IZ0sIsWadx+
        16SSEqFlA8wKAv2uAuBl+11sY8JU9FqMIG/85geYjKlsxV8=
X-Google-Smtp-Source: APBJJlGKwFxhj/IYBUOvkbdAPTtQy0tc4gk49WpLJkzliuGohEdk9XftX0TQihNG5XgXFA8hIJjTS4boUh91iWe9JnU=
X-Received: by 2002:a9d:6a93:0:b0:6b9:67e4:eba7 with SMTP id
 l19-20020a9d6a93000000b006b967e4eba7mr3684015otq.23.1689037946595; Mon, 10
 Jul 2023 18:12:26 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 11 Jul 2023 03:12:15 +0200
Message-ID: <CANiq72mE=-LmMg=nrMdtF6i_JUscDU6GFZgNve9xtvUs76DnwA@mail.gmail.com>
Subject: Rust for Linux Open Meeting
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our Open Meeting call on Wednesday 18:00 UTC (first
Wednesday after -rc1 is tagged).

    https://meet.google.com/vii-meij-xpw

Like in the case of our old informal call, everybody is welcome to join.

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
