Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDEEC433ED
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Apr 2021 22:13:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAC406112F
	for <rust-for-linux@archiver.kernel.org>; Wed,  7 Apr 2021 22:13:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhDGWNO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 7 Apr 2021 18:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhDGWNN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 7 Apr 2021 18:13:13 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B205C061760
        for <rust-for-linux@vger.kernel.org>; Wed,  7 Apr 2021 15:13:03 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id g38so364627ybi.12
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Apr 2021 15:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=75RCHJBlZJjbmmgfPzZyB1jSgpH8YfaWRtUeAWsdo+c=;
        b=CvUZMRGVeUxdu+NgGDvSzfDXC8bdJo/7CxSPxYWBr42yZ9sOasWfV70j06RXNgipgK
         5LQbJBX/9uuNQl3ybcFy29ctDBbK7QCtlLoOQIpmTFOhN5CVeO+47Hd7pEGIRMDVL134
         zXksYDFQeQG4Q6UFWBBbHlqn4t7vl0XFoMktywDdlHMirilfIe+04UYlPGV3SfdYx+G+
         Lii7+n0ta6IJ1iwRxhplZauO8ZzIr94gbquKTaS8B/VbczHUWVYB1qsYgmkp8Z/yBNGK
         OapRlnFYJQs+jTlfd6o+CrMfh5M+EcmMy1e0z+33loE9EZXOsQ0hgNViJfhJUTyV7sTP
         m+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=75RCHJBlZJjbmmgfPzZyB1jSgpH8YfaWRtUeAWsdo+c=;
        b=Y7X6c5L4CQt//ZAhAxceJHkwYfSpRNQXge9p8c4fdf/fVHwPoYZI27Ktd5+bFhBWfp
         h6VUpf7SZXSS8UJwlneYE0ylreeOVxHX3nPuBjLDxUAYA+2bFQSNA6C0CpaKdnZcpUuP
         DH4odmzL/vuFugq3+BZvMr0c417d0+HAS9gs3KPUpFJHnT9L+1NEBVV27CBS+P5KaJfA
         M+QyF94gimNtQecg6gu7xjsx05jiY4Oofta9cg4sRLZDDAZFD+W5FuedxO+PbzQ2CiLu
         kuUC7ERvNtp3pD9Q1phdwWmw71ESeLsVHFeRl1PbJp9eei8jO4+hJgYp2EOzDkveuqBm
         munA==
X-Gm-Message-State: AOAM533/4GL4pS5UX6GUJ2oSPpNloCRmzCblbZQyWcxovgfRQpZAZhBL
        B8XT96PsDE6R2o3he3InIGAHU1kE1RImbT5BCqY=
X-Google-Smtp-Source: ABdhPJzdVGi3x1iYx75fKNGzia7Ak3u0HWQs71PjQXkrf0sb8tyoClHmSuKbzyBE5RTqjVjofqxLERLniRH8eegUnZ4=
X-Received: by 2002:a25:7394:: with SMTP id o142mr7891231ybc.422.1617833582544;
 Wed, 07 Apr 2021 15:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <1802230489.25122.1617805363569@ichabod.co-bxl> <CANiq72nWvusyKf_N2N8i+de5HA-UZYfFPUrp9taRFbXya5h18w@mail.gmail.com>
In-Reply-To: <CANiq72nWvusyKf_N2N8i+de5HA-UZYfFPUrp9taRFbXya5h18w@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 8 Apr 2021 00:12:51 +0200
Message-ID: <CANiq72n3+CSSGVUzjuDzHdH2p_6ucug+FKSHButbwPgCjswAeA@mail.gmail.com>
Subject: Re: leaky info and kernel modules
To:     se iro <seiro22@mailfence.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 7, 2021 at 11:50 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I will create a quick issue about this.

Done:

    https://github.com/Rust-for-Linux/linux/issues/169

Cheers,
Miguel
