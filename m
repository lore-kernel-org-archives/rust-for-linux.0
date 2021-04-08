Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847FBC433B4
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Apr 2021 06:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 606B5610A5
	for <rust-for-linux@archiver.kernel.org>; Thu,  8 Apr 2021 06:35:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhDHGfl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 8 Apr 2021 02:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhDHGfl (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 8 Apr 2021 02:35:41 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A678C061760
        for <rust-for-linux@vger.kernel.org>; Wed,  7 Apr 2021 23:35:30 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id g38so1419137ybi.12
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Apr 2021 23:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q2nLbjlDAecUq6fwP/b+CxVWbohskvcECAgn5Is9U84=;
        b=KqkU2/4z/+v69ST1EaWx1/siU/NFwRVOw3uT9U9JLNgoduBk///0QAvc2YqruzJVAI
         BXmbkuHeaU/zI+RF5B3pAC6nd13RmrTpukXyV75zUD0yluLlPiln9SSj+QET68bqGHW2
         2lZjjIx7c1UGAceFSv92rj+cJ9osQLx2Y1fGFoKoyaJD1xUQ+nPIXCdyn/W7RYhT8bYK
         xOCkTcq9Y/TpXxw1WXxWS1t8hfvKM3i2eP8BZcdF9+IFIahydIwCe+eJUGPXUH8dQXC+
         nrJrjsMKdJWYb0GjZR9nfepMAdk7ONpEhCytiY0I7mcgbsvu07noZMTXk2DYrRjnzpQx
         26SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q2nLbjlDAecUq6fwP/b+CxVWbohskvcECAgn5Is9U84=;
        b=aIaXGANi/9PiEuyPyiW7WED5o8RF7A3Sf0b1HOs/xmPJwgLy/vVTMl8PuazYAk8/Lq
         98+GP7NUEWuaWG03TD2QA1fr5Q8IwXllRanzph8vsBLIDAEjJWPb5G0/5SVFqEcLbzlk
         9yHUEWg81r5FgZhHktcJfZutTl/NzXJKm+ZJ93TCrDqSdhGeqNwbT4tiI1fnTuJRlPrW
         v1FepQ8/DWQW5FtX5rEwP1vDxWuBcAt04cCcDXXW3L/CGSXXfYCqCh/0E6yMjNJgHixQ
         q80Mg113XioIuNSr9ZP6ARbnoa8tCg7ijX91ZQw1LdmOoCdjhp0QnlTB+I1fPwasl2LB
         Hizw==
X-Gm-Message-State: AOAM530MZUe4eHRnWROAYIoyLBsKngxaJbmVbP09zzyxpTH4fiX5s/e4
        jKGEwwT5Wb40tjAeEWwaXwKu3VvcxleLovBoJr3yRZ0iTk/MJA==
X-Google-Smtp-Source: ABdhPJwd8oqWnr4qFnfj32KMy2gXyQgQfpezglQCN2sv4sXwnCFG/T6q+qFD05QHmMLXSwnh2vdecFfNSAl9yAqMAkc=
X-Received: by 2002:a25:d07:: with SMTP id 7mr9407697ybn.135.1617863729214;
 Wed, 07 Apr 2021 23:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <1802230489.25122.1617805363569@ichabod.co-bxl>
 <CANiq72nWvusyKf_N2N8i+de5HA-UZYfFPUrp9taRFbXya5h18w@mail.gmail.com> <315832261.93199.1617849486791@ichabod.co-bxl>
In-Reply-To: <315832261.93199.1617849486791@ichabod.co-bxl>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 8 Apr 2021 08:35:18 +0200
Message-ID: <CANiq72kE5U2k6rYWDxdvkguyR9n0CxrZXQThUZc98QRfeGg4NQ@mail.gmail.com>
Subject: Re: leaky info and kernel modules
To:     se iro <seiro22@mailfence.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Se Iro,

On Thu, Apr 8, 2021 at 4:38 AM se iro <seiro22@mailfence.com> wrote:
>
> you mention debug but this is building release mode not debug which is wh=
y it odd.

I was talking about release mode (please note I said "without"
`DEBUG_KERNEL`, not "with"). Perhaps I misunderstood you?

> and yeah if these paths exists its not reproducible as they different for=
 everyone else. steve k commented on reddit and said he thinks so long as b=
uild process is same its reproducible, not that hashing matching is require=
. rust team may have differ opinion on what reproducible builds are too whi=
ch affect this like you say

Reproducible builds are, in the end, about achieving the same output
every time. How to achieve that, however, can be easier or harder
depending on how much state/environment a project relies upon.

So, for instance, if we have absolute paths in the binary, then that
is one more thing to worry when preparing the build. That is why
removing the paths improves reproducibility, but it is not the only
thing that is required to achieve it for the kernel (i.e. we are not
breaking reproducibility just because we have those paths & one can
still achieve it by taking care of the paths).

Cheers,
Miguel
