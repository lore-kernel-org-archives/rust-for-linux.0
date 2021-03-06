Return-Path: <SRS0=ZQ81=IE=vger.kernel.org=rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAE4C433E0
	for <rust-for-linux@archiver.kernel.org>; Sat,  6 Mar 2021 09:33:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8D9E6501B
	for <rust-for-linux@archiver.kernel.org>; Sat,  6 Mar 2021 09:33:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhCFJch (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 6 Mar 2021 04:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229738AbhCFJcb (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 6 Mar 2021 04:32:31 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2B1C06175F
        for <rust-for-linux@vger.kernel.org>; Sat,  6 Mar 2021 01:32:30 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id b10so4653366ybn.3
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Mar 2021 01:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=frGR6bUg+5j9/OAihYMRc6I5CFu+hkzvZXByeKwtcGU=;
        b=g8TXhvJ84rTPaO4CJMmKu791qLQAmTKZSC9xppK43tofhFoB+FWClKN+1qNks/6x4t
         Knn+QivYGSyxtQ6IiXOUrkD2If/7s0WnB83aflv2ixI3gFgj14rCabK0L+hANn4Lj9Td
         uicndOROAuhWFknF3ByBrkpCPhXe4nKoA03qvJ6gtAY5898/7snH5/yLjMlH+r33K/X7
         4fiyyTS4G8IE5xQx/9XrrmgKEn+8nSA3w/HVU7bZDMBuNDMO+SwtX3vyI/l2M+9nvtjT
         UYlcosHOqn9nrfRxmuwnNhwdez9xK568uIGjnvZ1Ts6S8k9atfdHVxsNwkD4z8+pdpXk
         YLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=frGR6bUg+5j9/OAihYMRc6I5CFu+hkzvZXByeKwtcGU=;
        b=g7qV7frtkeA864AnPIeNxTAoryYYKeENTC2F5SP9A3od5NjAh0WJwUV4ETKHAI+uqz
         Huw2u9l8MpbawmXr203wO7YcZHFsw4PYwoGVMiQN50tJle5HMGpL8eTDUuDBTE5MIJVI
         MeZ76D2SGoF4w7gAc/oQeGzMyGXfRErsB6FuajNlv2eg/4CsLKMJIhVvso70ASXSnsic
         tDxswCpCvMsrwTmgXdCdq3HR6+Xk7JDsVy3+Qf8gk4So8sFkVdZVEKj5zOboT6Hfxgx7
         kPw4DHE3m6HGVSZKKLeiczV7cKyzXMT9f8Gj2QaDq3/zCP6zgGrxdo0ih6kNkzfW/AZo
         JePg==
X-Gm-Message-State: AOAM532xlct2gdi6j2YgVciiJakYEeOkPji77FPu8Z39aU9t2hHANpko
        gJopL1ehpI6ny5xQpUwFoUHtt0KMv9sevA9sBu0=
X-Google-Smtp-Source: ABdhPJzeeUEjWdP72QgNoXkrVWTtuu/qL7j15l7V9sN6xGSRvUIO/Vgxwr6uouUrYIbsyYDuUDfMrg3eBI88FSlnqgc=
X-Received: by 2002:a25:d4d0:: with SMTP id m199mr20275793ybf.26.1615023149918;
 Sat, 06 Mar 2021 01:32:29 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72njjy7sJ=_mgjKNzaHcwRgoWkQmgSN2Fq6gdCYoeD1WZg@mail.gmail.com>
 <B1F9C55A-AA3D-418C-8C2C-BB1EE794D5D1@kloenk.dev> <CANiq72kPTw_TE9Yy26xwdn0h94QV85C+rNBqsh6uS2tt6FgQhA@mail.gmail.com>
 <BEF50476-4600-472A-B2BA-FCDB370A0509@kloenk.dev>
In-Reply-To: <BEF50476-4600-472A-B2BA-FCDB370A0509@kloenk.dev>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 6 Mar 2021 10:32:19 +0100
Message-ID: <CANiq72k+y0nPmiwLYnHJ49-WMqoejsFTid2t_-imNVJvk8nh=Q@mail.gmail.com>
Subject: Re: [Rust for Linux] Poll for call
To:     Finn Behrens <finn@kloenk.dev>
Cc:     rust-for-linux@vger.kernel.org, milan@petabyte.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

Thanks a lot Finn for managing to do it this weekend!

Saturday 18:00 UTC (today! :-) is it then!

See you later,

Cheers,
Miguel

On Sat, Mar 6, 2021 at 10:23 AM Finn Behrens <finn@kloenk.dev> wrote:
>
> Hi,
>
> I would prefer Saturday 18:00 UTC.
> I als got my schedule a bit cleaned up, so not a problem anymore.
>
> Cheers,
> Finn
>
> > On 6. Mar 2021, at 10:15, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Hi all,
> >
> > It looks like everyone that replied can do it both days, with Finn
> > having some time constraints.
> >
> > Finn, how is your weekend shaping up? Would picking one of the two
> > days help you a bit with your schedule?
> >
> > Cheers,
> > Miguel
> >
> >
> >
> > On Thu, Mar 4, 2021 at 7:40 AM Finn Behrens <finn@kloenk.dev> wrote:
> >>
> >> Hi Miguel,
> >>
> >> I would prefer the following weekend (13th, 14th), as this weekend is rather full at my end. But if needed, I could probably also manage this weekend.
> >> 18:00 UTC sounds like a good time for me.
> >>
> >> CU,
> >> Finn

Cheers,
Miguel
