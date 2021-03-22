Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C96C433DB
	for <rust-for-linux@archiver.kernel.org>; Mon, 22 Mar 2021 02:34:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A05E761930
	for <rust-for-linux@archiver.kernel.org>; Mon, 22 Mar 2021 02:34:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhCVCeU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 21 Mar 2021 22:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCVCdu (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 21 Mar 2021 22:33:50 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AABC061574
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Mar 2021 19:33:50 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id g38so4980867ybi.12
        for <rust-for-linux@vger.kernel.org>; Sun, 21 Mar 2021 19:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=inxM3UWEp3QouGvEDK2aOrGZ/TdBhPmZLd0Ahfs6BYI=;
        b=lLib/OHweaxE8bA4/DnYpqw9zoIDe+/kvf9QE+9H4HEofmHZsRQT+ksN023ebZG57/
         N3eVoXHWsd/0MvdTlM3VvOsBsd8DjiNIakHOEKJ9nQqnybZf82O1rwu5bRDPhFRGQr2C
         vfQoS3KfK8OOZqnzkjbOxcPizXuku4pHbh1Nl8V/cL7WLZxhLQW+En5wc+faek7F3aI3
         EhwIPzz6bXB7Ej3nmFUlQzPjyHpHqyl5wK/zmTdUeLs8oelPr/jGN/rnpqhN+MAxQRvE
         UHTGA/20JdeUS+n1rB6EUzK5MIrhBlS1XC9NxJKNfbo2UK/qYhULBsQD4gAVDXHVpNz0
         H2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=inxM3UWEp3QouGvEDK2aOrGZ/TdBhPmZLd0Ahfs6BYI=;
        b=OIHZrFivTQwuzhw2SWz4fvfpU1id6lZbh1vLWyJPciaujW1G6Fnf/x3LHOHd/memwt
         mr34ggUcBWurx7wnEB+2kiq4Mq1ZSCYu9bniasxOoGCrWtvfnADF1E9DBjIH33B1iLy/
         1YhmK5jtHpZpMFL26gDVbSjDXsjclVclDx31MtjWYOxl3VgPU2/dI5dYAaGVmHeHKwRx
         PkIokVTePvE+lmNsyObGFk0Ggh/ri2562EEzk/gaY7yzVNHurebttJez9OoFgieADFLf
         p5rT5cro+tkGYBJXXbS2rWrtXHm7abIfUY4E5wi7fhrYiBZQq9icu7Yp+0EFIsC9wtHz
         z/eA==
X-Gm-Message-State: AOAM5325j/Qw7V4AIFq0fCtnkFx35SRkWMH0rvNcnyvvNfVyBLl2hCaz
        Ir4hSMqiqfzYTz9K8Z4uWisbNtZC2AUyZgokyTZWzzRUy74=
X-Google-Smtp-Source: ABdhPJzAKebN2tC3wQ6jAzqTL9UqCDuszOlJktPKqCPCUyo0VrD5dTDSLcvfJsH2omFrUkyf8jeOL/FnXoSZsaE1f04=
X-Received: by 2002:a25:6e02:: with SMTP id j2mr20915170ybc.247.1616380429474;
 Sun, 21 Mar 2021 19:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <87zgyy160b.fsf@santosiv.in.ibm.com> <CANiq72koz3X=fstSLcAu_MkCDsznK+i0xqSnZjxh8LpRC_OBMg@mail.gmail.com>
 <87v99j2a38.fsf@santosiv.in.ibm.com>
In-Reply-To: <87v99j2a38.fsf@santosiv.in.ibm.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 22 Mar 2021 03:33:38 +0100
Message-ID: <CANiq72=i=-DBmfRFO=yoTb6x--A6eVG+7vfF-wCfsvXOmjsuLQ@mail.gmail.com>
Subject: Re: Could not insert module: Exec format error
To:     Santosh Sivaraj <santosh@fossix.org>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Mar 22, 2021 at 3:31 AM Santosh Sivaraj <santosh@fossix.org> wrote:
>
> No, it is a 64-bit x86 guest. I also saw this in the dmesg:
>
> [   43.409639] module: rust_example_3: Unknown rela relocation: 9

Ah, we saw this with the latest nightlies -- I'll take a look soon.
Please give a go to the 2021-02-20, that one should work.

Cheers,
Miguel
