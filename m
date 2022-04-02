Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9118C433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  2 Apr 2022 17:31:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiDBRd3 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 2 Apr 2022 13:33:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiDBRd2 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 2 Apr 2022 13:33:28 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37A4B91BB
        for <rust-for-linux@vger.kernel.org>; Sat,  2 Apr 2022 10:31:36 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id 14so4023286ily.11
        for <rust-for-linux@vger.kernel.org>; Sat, 02 Apr 2022 10:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=MeCJshg0jn/YLuklsUy0eFmdVn+Z8Bwtn//j2zifDm0=;
        b=Ox1/gyQbdakG79hJwr5ch5SNT+llfDUMwNg7u3LBDomt6Rz318nKrv0WwgNO8t5HgN
         QrJn/FLTcvo5z6jjodvWrvkX7EouVT2M8qc16kk2vWwYteDWylzoZevwkuGEvBN6YP9p
         Vwl5ETGJNIBfwqluU4uyZLjw527AsJW5kNSBe5ROHVu+n2MjtCMWTooTZlkyPx2RluMk
         WNjuVg0G+RjIEEoQfmOytJb+fro94lYQB4tr8LFpxmGpEUs8o5zbyFAm/Rl/nSC3/ijv
         4NyzUSM1R4/4Zi/wUZVrMoBdKXoO6o7+6iTwzMlAFAxLy2p/h686lnGwlR9D3STRSE7E
         r4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=MeCJshg0jn/YLuklsUy0eFmdVn+Z8Bwtn//j2zifDm0=;
        b=bWUj0Mj6n1c0NXnqjV61P/QN1BcNjxil3NXhTTJF0nQ1hH16dVhwSn/3FHbxdK1kAq
         0gXwAd8FT9zDyTGy31OQP8l99K36crCdnnrwg+A/tqY2PvsoUW711IjroVj1b3qEjjm0
         R4Ffqac4aOGoK4UXdaJGcyzYIdAUW2OQBFLrHhT1/d3xZ/vZjWsPGDSb6Ct7kTVmFPY5
         gppYbnNTTGhZERYuFgIbQrd1m6E9e0pgAMfpd6FeyDC4x7Q4jaLfkJT+yzYx08JAIGOM
         Fnvfcx0ylhPApo1AAaYQm6pQx+FgL6kbdivXPGIOtsP4mc6ehZojjGE6YDHNw4whuy7W
         jGRA==
X-Gm-Message-State: AOAM533GGoowKcQEsU7Zp1QKK1FUc5jwH49UTfXCrtZpJk3/SHY/RQs5
        Ot96kMA2mkDIGGZe7wNd37IrGzV1XqlIIHaEtxDTInQuOFs=
X-Google-Smtp-Source: ABdhPJya988wgz9pLfRekA7ipywY9FJm89zLi3SX7MNavYdQLP7lN3Pba+TAa3QImKK/f+uK23+oix4hJzn5ZIHbTkU=
X-Received: by 2002:a92:c908:0:b0:2c1:a287:8868 with SMTP id
 t8-20020a92c908000000b002c1a2878868mr2179182ilp.321.1648920696051; Sat, 02
 Apr 2022 10:31:36 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 2 Apr 2022 19:31:25 +0200
Message-ID: <CANiq72nBE5=fAsVqNoV=VvNdGuGCX23=CTFWHEJ=qCRs5_PAsg@mail.gmail.com>
Subject: Reminder: informal call in half an hour
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in half an hour (18:00 UTC first
Saturday of each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
