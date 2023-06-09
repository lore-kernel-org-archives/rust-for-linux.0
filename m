Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D041CC7EE37
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 09:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239153AbjFIJf0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 05:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239910AbjFIJed (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 05:34:33 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 384AB44BA
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:29:29 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-b9a6eec8611so3883435276.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686302967; x=1688894967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIw8ykoZ45Ky5fqAqNzlctWSBsH9z28kJfotvrEQ0sg=;
        b=WhoNETov3rMmyKArv/4heatN8Wf8VXw1liILwG6PfUe9l/1K6qDtOJNFMLJKXVaJaI
         sCCVZagDUn4LwLwULla9BhC46gLilV/iiMh8NAJKaRg95tv4xQYurP5ZcYs8LiXM6E8g
         70ifhBzn7z7tnhosI+Yiaxh1qCa0be4aO55zOI2V/uEM9L41lTCNtuO2KEzthZ5/s5tx
         ebdn0coZNb7DkiJm2HvPCJqXMS6rCacxnFWqY2X+SZ5+0nIYI7EzjLsF8/60FQTLGWgo
         xkOycnA9otCyCCI5UbquwhWTeyN27fjaZnUhNQ5TvGa06OOne9y/jql2IZDocEznIHAu
         S0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686302967; x=1688894967;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIw8ykoZ45Ky5fqAqNzlctWSBsH9z28kJfotvrEQ0sg=;
        b=gcd8GwKABqI7hE/t9bbnebm6PTwOr38bd0pRBbH9nEAbi8IO0Bkiv88cdY3AGJUVC5
         A2S+wdLaLrWkUyr2cj+6kgA1tVOJld0ALHIGS/hYjsmqFO40bkSlXMD2PH1mNB+XG8s/
         N3Q8/LxKriN5HDzNlL3IQOV1mFDhm9DEGahB8tS4wq40QnoDZh+FH5Xc9Cgm8iG2zFgA
         ys6neibPiYLTxLI81mRtTXPrVvhUA2GpHNKMtAjx6AGn2S1wZ2Ms7OCpkp31PONImHDW
         817aVM9BuP5+A+eCacLGbhkuhA4GURzCDc0A1kmyPImXu7NjfB8KXNF3wwmxpFe6cdlb
         ub5Q==
X-Gm-Message-State: AC+VfDzCmjw8hUHe4w7vXJrfhZGX3l8Q0xI+PqLHPBoEKm3F+8gw/34i
        PysYrrsNXL7OB4CJFV6QC0msYvyX/0LH5E5ZkGFkiH0/
X-Google-Smtp-Source: ACHHUZ79mGGIz7E6ZLI+gDrxjcZokqbFJiYhSpLFmZfT1br36fsNVSpz0FT8741UOYy1fzQ0U+wZPX9lYHDh3gwyS9A=
X-Received: by 2002:a0d:e6c1:0:b0:565:6a95:51 with SMTP id p184-20020a0de6c1000000b005656a950051mr2663918ywe.15.1686302967387;
 Fri, 09 Jun 2023 02:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-10-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-10-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:29:16 +0200
Message-ID: <CANiq72mqJiyRWxFG6PUbVCcpcYZKJEu+VFoweeo=5KhMdZ89uw@mail.gmail.com>
Subject: Re: [PATCH 09/80] rust: kernel: backport the delay module from the
 rust branch
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org,
        John Baublitz <john.m.baublitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 9:01=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

If we end up adding it as it was in the `rust` branch, then this would
need proper attribution (Cc'ing John).

We are also trying to have the original authors from the `rust` branch
to submit the code they wrote, if possible / they have the time, so
that they are involved in the discussion.

Cheers,
Miguel
