Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB4BC7EE22
	for <rust-for-linux@archiver.kernel.org>; Thu, 11 May 2023 23:51:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239311AbjEKXvl (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 11 May 2023 19:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238915AbjEKXvk (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 11 May 2023 19:51:40 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0658173A
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 16:51:39 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-b9d881ad689so11689825276.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 May 2023 16:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683849099; x=1686441099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEknV1RKCBnzK6u7tkMq8YoKZ3kABDtNTyJKbZVivn8=;
        b=E06Hcv3DC3gijuqRCO5XinL9id9bJGlqG5C0dXOSTtml++Hzfhbrreqwvp7O0yEVGF
         8ZmXG0yzV/MCT4YNunM1vd2ilRxZ4ccGX1t/IHdFbOKErM9Nw0BmiSUYvlx7n/OeSYxw
         PA/k69hbSvV39FxzwOChSUxcx4JrMVHd2Zu/6lSxb+7+FxzWoqYD9rLTLsmo/gxnOL93
         qnJbSRbIf4lRE+5lEgJNLqxF4V18A8WPvRJijLJT41rmc1v2fdgqwT9KuETrbeH5PxNh
         2fHwe6bTSQ1Rg/eLR+Mg/qg4R9m/JJlDUrqvBQVGiqDh3TKN0kn7zMnyV31sh/xJBUKs
         5/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683849099; x=1686441099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEknV1RKCBnzK6u7tkMq8YoKZ3kABDtNTyJKbZVivn8=;
        b=k01ovgteoLbs9g3PC8/IctLNybPEGuR1LPuTlrJfBzCFB4musQ/Gc2d+X9bfrEecp9
         46DCp9RpQPB0n6B2/U5styl80X3KFJQv2n1FgEIcrjQUdMcHoPoCXUS0ltmgutGj+W0u
         u4yJMipo8WT0F8AcdzzN0sjiUQkI09lrVNC/F1dRs6f3qd9oEFmNpcqzGegwco9PzvWz
         alWMOMI5QCC7BZvRpFABR10vwddwx67eLVJEjeA+gfs6Nps1FMTPyjQ8K7yqkq0raluG
         7xkUtXEWgKHxD4hq0hbH1LIEiAhq+P0EBPX2VmuILUzrcqlQcM8NNpaaIswEMH5r0O2P
         HclQ==
X-Gm-Message-State: AC+VfDwGUiT0ozg5rPCqCqYwwyrtIGyqoNRNPBwkwYnaND43nksK293r
        YXBfY2xUt0sjRJjXScLZj/Sndlt1lcqk4rBWdlCZrgDOVb6mKQ==
X-Google-Smtp-Source: ACHHUZ6snS/zdAN2+Iex7jA30zMpQLPH+iEMM6hAe0fO6c/Kv8rKgvwwHl7MX419h4Gn0k3XBheMGDqyr3gM483nX4o=
X-Received: by 2002:a25:dfc6:0:b0:ba7:c8b:9ad9 with SMTP id
 w189-20020a25dfc6000000b00ba70c8b9ad9mr139819ybg.41.1683849099172; Thu, 11
 May 2023 16:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230511230837.63114-1-i@truongsinh.pro>
In-Reply-To: <20230511230837.63114-1-i@truongsinh.pro>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 12 May 2023 01:51:28 +0200
Message-ID: <CANiq72=gH3vvn+=VmPOgUXZ-Utqbve8_3AfVbGP0jtKZrM_FSQ@mail.gmail.com>
Subject: Re: [PATCH] feat(rust): include bitfield macro into kernel crate
To:     TruongSinh Tran-Nguyen <i@truongsinh.pro>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, May 12, 2023 at 1:22=E2=80=AFAM TruongSinh Tran-Nguyen <i@truongsin=
h.pro> wrote:
>
> This commit add bitfield related macro into kernel crate. It is taken fro=
m
> https://docs.rs/crate/bitfield/0.14.0/source/, with SPDX license header
> and some minor changes to make it a module without kernel crate instead o=
f an
> indepedent crate.
>
> It was discussed and agree that this is small enough to be a module in ke=
rnel
> crate. This module is needed by at least one up-coming kernel module, bca=
chefs.

It is true that this may be best integrated as a simple module, but it
has not been agreed yet.

In addition, we need to see the code that will use this, otherwise it
is dead code, and I don't see it in the `bcachefs-for-upstream`
branch. Please see https://rust-for-linux.com/third-party-crates and
come to our Zulip if possible to discuss it. There are other
discussions around third-party crates going on, too.

What I was doing is integrating the two crates you needed into the
experiment PR, so that you can start using it, and then we can discuss
whether we want it or not etc.

Cheers,
Miguel
