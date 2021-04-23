Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F02C433ED
	for <rust-for-linux@archiver.kernel.org>; Fri, 23 Apr 2021 18:31:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48E1061458
	for <rust-for-linux@archiver.kernel.org>; Fri, 23 Apr 2021 18:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231728AbhDWSbq (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 23 Apr 2021 14:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhDWSbp (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 23 Apr 2021 14:31:45 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB461C061574
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Apr 2021 11:31:08 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id q192so3060284ybg.4
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Apr 2021 11:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=clV+4+qw3SX6Y6iEWBV2CuEbMnlXxtG/DIyF8cLnHVk=;
        b=dDKAINc11VlQk4gk3w+6PEe89PiCFiDcmjwuFwrG6rjBQ80zFZb3BBYoX+vTMSVVGs
         IxU7TYNayw6E0XyyKpcmh2na7aWGESiLGE3RHnf4X1huIE23VXWVmSzyJTC+83aZumtl
         4oSItBMLneoeFRCqqNLUXyaTEQXE8o9hzCpY4JVGzxWPytQhnxsuIzR7F1xxOlhfUQ4s
         FODhKru0AANh9NXj9donnDXD5Q1FKqymcl7XKTNJIon8h8FRgdlO7KexSsFj1bd0J3Xi
         mOOCK4rPErJluzEEgGJ3ctAGdpha7figom1c3YQXsi+UH+2Z3s+OFl3GkmWoKtSErh3q
         dQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=clV+4+qw3SX6Y6iEWBV2CuEbMnlXxtG/DIyF8cLnHVk=;
        b=ewEes/x6JSkrEA5sX/OsIkP0siKLkQ11f2LGKPaObRDg9fuWHt993Kz8/ofcQ1nPKA
         z+4LWID0+PMkLHWoht6Ry8qEXCKuF22w8EbdVwA7qUAJRoi5u0nHVJfG28xqR19zj2Jj
         mVclK5IZoemOmqvbd46tq9BjecgEMvXvr21ApxONBR7Vn43wsxaIXdO+3stmjPq3Mi8A
         wKUcMmfgHaiBNpf7TnjKgjn+cc2CeAUHuSGKqRD/tKLML396mgrtHHQMGwq+WhlEN26a
         JpfLGZ6KUu6ezEAsDuS90GenbiVBdU/FdDdgUhH070Yvjm75whD1p+g0x3gK5JyiRY5e
         viOQ==
X-Gm-Message-State: AOAM532mSUgZiKS2R8b9zUW0BX7nBZa0NfZAk1BCtPKkoWoUgngUCNis
        jH7RN+dpXKdudOJZlvAw7nv1pQevm9rcJ0NLwN2oioPR/Fs=
X-Google-Smtp-Source: ABdhPJxR3X1WShqSHmBNb1/DW1lnIxLwyek/KUopFj2SQoTxdY90s3LYcWcnAdmMlOgEA7ULzYcyWpVAAwGco7kmvUQ=
X-Received: by 2002:a25:c444:: with SMTP id u65mr7842370ybf.93.1619202667548;
 Fri, 23 Apr 2021 11:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
In-Reply-To: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 23 Apr 2021 20:30:56 +0200
Message-ID: <CANiq72mm+QBivEuwJ8=6ruiK3=kcTvLJ87gBrwJA6T471vLj7w@mail.gmail.com>
Subject: Re: Poll for call
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 19, 2021 at 6:14 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I propose next weekend Saturday 24th or Sunday 25th at 18:00 UTC like
> as usual (EU evening / US afternoon). Please let me know which day you
> prefer, if any.

Let's do it tomorrow Saturday 24th 18:00 UTC then.

Cheers,
Miguel
