Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3029EC433ED
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 14:52:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1EE8613E1
	for <rust-for-linux@archiver.kernel.org>; Thu, 29 Apr 2021 14:52:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbhD2Oxo (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 29 Apr 2021 10:53:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233486AbhD2Oxo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 29 Apr 2021 10:53:44 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F78DC06138B
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 07:52:57 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id l2so14936017wrm.9
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Apr 2021 07:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NQPEaMhp8xFHvBqMVzE4LThYW/oXIcMDg6YGDtWVVc8=;
        b=f81i20/Geiex0wZywFmgBVjtJnrj1B52bH3Cimk8kMK901AJn3l/UOy5Q/uQy2DOXH
         kcge9h1tYT+o+MVkMdwOVmZ+oWvyXL0gmzXz/zR/M2yt/Fo0UKROIShqEmrwZ3SrpwY7
         cWWrGGARONOxol1r13Afq39F71M+5Sr6rKwm0oB74PFMsPOMUttYNDH0A3FK4D+xpavr
         iF+D0vRTZwhQBEHAntg+kvaSJNW0gE1YzwhsRKJU4785+brSMPDDy2PZJHeCJ3FZ2CRC
         NwcJSeaJDSjz3Xi8itGg2Tzq8tYPrcd3tUQueWY5g8qBI/DnQAbFSKFmX/3tMykyJSTm
         J07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NQPEaMhp8xFHvBqMVzE4LThYW/oXIcMDg6YGDtWVVc8=;
        b=DEF+L71KofO7E6KFx1AYAUN0q23Xu3bJa2eRfJQKdJpquwL2ycSBQ3GUO6EjNOLLpK
         NCTcQEftiBYCMBAzFkOZyt519w2ZYIrtAAmvxAy/GJN7pZrNS4efkNcaTJd95mu8fpH2
         iMaX1hlDphJfz6w4PkjoPQ8jr1CQICwwQcXymPoShdrsyj4uIfBtmN2sSTq5MuqOX9Tp
         kP3nsD3dz6g3FGvEaon/zDQF4WOnsZrvf77rYaKG1BzgynIhu4mx6q+sEV869OS49EX0
         b+ACP98WsvVfN9ay6Weh3c+IDFZ+0rTRLPM4GH044TMnctVEHw/kf1G1ImriA8SmyMRh
         ba5w==
X-Gm-Message-State: AOAM531TYDkR3yL+ZawIJAkUsL2Uk/PEV8Oaf63p4IjIDJVFfkZymoIT
        tGQrs6g6qfbvf7zQH9kEtZk1CJDuTqe7YaGluXQ=
X-Google-Smtp-Source: ABdhPJx3+oPs9rmWyv+mh8GGaKPOf9GXT6tyV7y5zPHjiRY810ndHJS1UeYlX1YyBPUjvSNgh+siFanoeNG10pZHwH4=
X-Received: by 2002:a5d:678d:: with SMTP id v13mr172955wru.85.1619707976034;
 Thu, 29 Apr 2021 07:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <YIrDgupEqcmsUfGX@localhost.localdomain>
In-Reply-To: <YIrDgupEqcmsUfGX@localhost.localdomain>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Thu, 29 Apr 2021 10:52:45 -0400
Message-ID: <CAGngYiVvbN6wHRz4E6yh=RpPVWzzDAEFCJmdR+a5kXyufreMqg@mail.gmail.com>
Subject: Re: Loading an out-of-tree module
To:     Carlos <carloscarral13@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Apr 29, 2021 at 10:34 AM Carlos <carloscarral13@gmail.com> wrote:
>
> Is the 'loading out-of-tree module taints kernel' messsage something you
> can disable at .config? Or is it something particular to eudyptula-boot?

I don't spot a Kconfig option to disable this. But if you really
didn't want to get this warning, I guess you can always manually
comment out the relevant code in kernel/module.c (check_modinfo) ?
