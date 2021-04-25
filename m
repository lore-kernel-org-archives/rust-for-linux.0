Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A78EC433B4
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Apr 2021 19:27:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C90D26128A
	for <rust-for-linux@archiver.kernel.org>; Sun, 25 Apr 2021 19:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhDYT2P (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 25 Apr 2021 15:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhDYT2O (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 25 Apr 2021 15:28:14 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A414C061574
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Apr 2021 12:27:34 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id i81so54517604oif.6
        for <rust-for-linux@vger.kernel.org>; Sun, 25 Apr 2021 12:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=mhgAVUqa+99a81b60HZAGzNwp5ZR8i2fqPNzCzXlP0s=;
        b=V/DAUIyX1hVirKsIM/y2yzGI1OnEJnBdyMjKWhrcgwdvv/93s/sJ+MAcN1RX0M52wm
         Cd1joJok3ry97oHOqQDLuiZ0tvyQaclhNxztqO3faHD+/B6OY8KHnCi49eBJdJG3rA6L
         D7xBFGSMWYfAUebz67+liab+TAktpWn/k3DLU0u4KeAyZmzM8NstlMXl1yIKuuhVyc/i
         kbK69Wu2bY0go68gtwWdRXUWpBm5ZQSLHedZfGk/seMUmrgs94ojAd1eN2xtAm8k+JYE
         /7ebDUF6xy6klNZ/r1cDbA2wiHQjw7/VcBaWYBdpothcsIXuZBivouInNDwIq57tky5w
         td4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=mhgAVUqa+99a81b60HZAGzNwp5ZR8i2fqPNzCzXlP0s=;
        b=QQ7DLWvrp9PyfZT1NPr7E2ISVR05NjBbdQrUPuDODeKSKlmn/Rt0sUR15ETMyDwdwT
         0mruHeanfyw8fO/xbNVgkU6RkwJwY4OQ4H+MSJzcYqd294zxmPca8XoH4zW5JHbeonlu
         IaHwXP/6sIBDjQ8E4B4U7F2nNT5cSoMr7A+nGx98LOOu+GETq++UAP9Jle82+t3SxMog
         5SbJqLpe5TgatKn7S45CFtRQ4D6K4leJCmeXLqxlEKOPhFvGdYAYJIyGC07x4EP5mCSl
         DER8R1keE5TAQ2KbtI1pBvaapZlTMIDDe3sHYEPoQsmqvJ+IhhfpOs7YbfQ2cyL7xxdF
         9XHA==
X-Gm-Message-State: AOAM530fjOfznowr7+hc7xl3vm2F9bhb1GCifp6auWi5mdZEloj1ECjH
        u/xvvm6CadbDTYJ7+H6Dee+2j53T2hXJPBGKq3e66JkW
X-Google-Smtp-Source: ABdhPJyzJ9MUfYU7yCeb4U2zQzf+yi8Ii36m2dOTEdxr8vvUs0QVSdwBJaYhECE48GryDGeKGuBP/QWElFzajJE0Vmc=
X-Received: by 2002:aca:f412:: with SMTP id s18mr9607425oih.144.1619378853729;
 Sun, 25 Apr 2021 12:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAMU0-c+QrurnfVZofHHtQFKPQ_QTpAeoB67LnXnuEBGjrPQByQ@mail.gmail.com>
 <20210425162804.imic6oehm5kvzbro@gpm.stappers.nl> <CAMU0-cJRJg9m-ARTzTaxVOSugU8_iLzd=to_crv07j3CehC2tg@mail.gmail.com>
In-Reply-To: <CAMU0-cJRJg9m-ARTzTaxVOSugU8_iLzd=to_crv07j3CehC2tg@mail.gmail.com>
From:   Carlos Carral <carloscarral13@gmail.com>
Date:   Sun, 25 Apr 2021 14:27:22 -0500
Message-ID: <CAMU0-cKb0vxVsNzp4q=n-TM4bbSprc01vQjLPyUv2F=D_Cev-Q@mail.gmail.com>
Subject: Fwd: Regarding: Regarding SCULL driver
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

> Yes, you can try.
> No, you can't claim  "It is mine, now wait till I have finished it"

Fair enough. I will start working on it so maybe we can have a shared
agreement on the missing parts of the API we need to expose for SCULL
and how we are going to expose them by the end of this week.
If you have any comments regarding this timeframe and/or workflow
please let me know.

All the best,
Carlos

(Forwarding it again to the mailing list as I accidentally only
replied to Geert)
