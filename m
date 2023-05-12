Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F29C77B7F
	for <rust-for-linux@archiver.kernel.org>; Fri, 12 May 2023 00:12:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239590AbjELAMB (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 11 May 2023 20:12:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjELAMB (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 11 May 2023 20:12:01 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A86199
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 17:12:00 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-b9e27684b53so8239226276.0
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 17:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683850319; x=1686442319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oukKbeeNr3cZeduy9SckdIxZCzLIFYHWbe7QeHfBVtE=;
        b=ZwmAlFRHyExU/9BfwT2/bKmI2ErD3GT47ZbhJEweNmduWW6hs8BqEA077z9wdqMHOK
         EU9bQJcBPguwPEl9udIrdVvU3FbkMuHyED+jxidCwlLqFlJdUwWiLMFuGS3O5/d1bXJR
         0LYzDXEBccnWYtuJ4jW13EzVIqzYc42zDgk2b9CsuZbvq3Dal47oGPLverLG3GQAeqlR
         yTODttOw3QZRrlQCW9R++wXlU+0vsby0D8ZNrXIc2Z06n3ZRuCRXJTWTMyUFYaTfa2rS
         WPnewpu2L1JvuaMQa4F/+7gYDJobmK0LcCJTKmAxreQ8B/RbUasOiLJEnCq3FHvtJIN1
         9WQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683850319; x=1686442319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oukKbeeNr3cZeduy9SckdIxZCzLIFYHWbe7QeHfBVtE=;
        b=fPV/qiqqWr4b3XRQSlibWNo87oac+Ygwl57mRFh1Z+0cDoKoDu2w0AUpeIKO9Ax/Qz
         Wus+jcEM0apHq9HpokxGu0nQQSKK6kLuUmU2vdRCTqtnISHsPtZHYnwgoxN1Zyk9mN+h
         3bJEcgEbsdDHc2Aps+qWw1oipd26ElY4W1OAAzDmB46+JNJlgfUQzyMcbUcoV3xu2oPp
         y5iKY0Bauy4v2bLyUAIQSOhSuQY4qg/BNzbVQ2IYQmSZveqWQaIaAzK7JvDEnwEqktyY
         /0apyMKY4HHMWQ3+QZagaZpnYzvsMh4k1V+yMNTvSklfdTOGU2l5S0VrzF/yAsJtoCtN
         Sluw==
X-Gm-Message-State: AC+VfDyC6tXWgR/Web36ElV/LF9dLl5KivTQPGV4v3K6T3tu+ixBlHOg
        sOtAU4rDcJc0nQPFWwdY9hIk19gDW2gCKYNA9waoyZxPLR+t+Q==
X-Google-Smtp-Source: ACHHUZ4H1Dyg6DQ0lWstSMZzfikoN2pS5tHEJJ+HiO+hJy0FugJVzBZkhsqzZAIF8GYFMO1ZnG1lpn0I6aWUvkFwauw=
X-Received: by 2002:a25:2143:0:b0:ba6:f438:afeb with SMTP id
 h64-20020a252143000000b00ba6f438afebmr856789ybh.13.1683850319367; Thu, 11 May
 2023 17:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230511230837.63114-1-i@truongsinh.pro> <CANiq72=gH3vvn+=VmPOgUXZ-Utqbve8_3AfVbGP0jtKZrM_FSQ@mail.gmail.com>
 <CAMy36z4Md=+2kXb2GMAh1+0-ttmB9tZj=a+xYzzKid08=9U5xw@mail.gmail.com>
In-Reply-To: <CAMy36z4Md=+2kXb2GMAh1+0-ttmB9tZj=a+xYzzKid08=9U5xw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 12 May 2023 02:11:48 +0200
Message-ID: <CANiq72nPekj0uXcM30aNmeeJXx48i3wQYhtxsNqh1HUYdy3=iQ@mail.gmail.com>
Subject: Re: [PATCH] feat(rust): include bitfield macro into kernel crate
To:     TruongSinh Tran-Nguyen <i@truongsinh.pro>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, May 12, 2023 at 2:01=E2=80=AFAM TruongSinh Tran-Nguyen <i@truongsin=
h.pro> wrote:
>
> Btw, I haven't subscribed to rust-for-linux@vger.kernel.org, yet, and
> I assume I have to to receive the patch for the mentioned PR.

No, the experiment PR is on GitHub because it is not yet decided which
parts of it, if any, will arrive upstream -- as I said, please read
https://rust-for-linux.com/third-party-crates. The experiment PR is
mentioned there.

You didn't answer where `bcachefs` is using this, by the way -- it is
important because we need users to justify merging new code (of
course, it may still be useful anyhow for other users too).

Cheers,
Miguel
