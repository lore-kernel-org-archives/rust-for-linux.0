Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B635C433E0
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Jan 2021 21:03:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2370C233CF
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Jan 2021 21:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbhAGVD4 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Jan 2021 16:03:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbhAGVD4 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Jan 2021 16:03:56 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 612E2C0612F4
        for <rust-for-linux@vger.kernel.org>; Thu,  7 Jan 2021 13:03:16 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id r63so7412085ybf.5
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Jan 2021 13:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=+hUPbOiN9jAlcuENLRtE0Cc015clM2lRdjjWlITKFpw=;
        b=NgoiZB83VQmDR3ASHziLs7iPMvONF+ZYn4+iMHmHO6SFdWxCfJuQR1YDTlroJys6fd
         rONk1fagmstGacJ4cMTgEjN5Ln6s2+eUFp0ZAhR2AbEpf1VahaO310DG3yqyJH1p94po
         GWUbMA716OswlxYSWjpOr3mjtzfMHN5X/biYEJu1FO12FW7aaeDmVSDpyvUqKdgqrK3p
         VspsSWybN6pov6G4xrNL3+702js4wVYo5XmNcjHISnNhOEb0ZvRkxh0OOHOMqN2ErGqE
         iLb0SRPfIBvKTZK2dFZlv02tLjAyYwVv4ydWMxgxuN4Dw1ViS9kFhPExZl88DAQm2eyH
         IgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=+hUPbOiN9jAlcuENLRtE0Cc015clM2lRdjjWlITKFpw=;
        b=jUybLwPOoQokde7H+EoYt49vN/s0BwV/lOQZD+VYYy8RkIO2C2b24N514RghjYWSEL
         RDddKONd2sjf+6CPVmCu8i/nm0qJi5Tmcf32DeJ88vBKF982u5E0DZdAMhbtIOR7eLOO
         BLK5CmtQDprdzXXkMu9faQRA4TOTfaM3J/n7JgSdI8i5gJaXzpjAZls0Mk+RgOcfe3mN
         +r9/BML8dVRHNnZkcvvM9DL2Mdbdvqy7QA+ERSwEpyGA7Am5Tb14tSahXDcKdwEF5ERZ
         mttGllc2asKiaV8Sto4Nt8HSpOH2ABphXK4gBx57wsYT3hsThGrifjsUVysKqB/S5Toh
         VVgw==
X-Gm-Message-State: AOAM531utWMIHcJKc1tdcLUMIu1mqMz7BWdDy6bi4HJFMtLctol+lVZC
        A+2ctZe2crF3pPKX4KzaCjTMiD0K9IEuCDxsOZrbvDNU
X-Google-Smtp-Source: ABdhPJyLtGv+0OrYPyCHqVN0UszW+GotNHe4xiSGo0w22HWDIkICNBeXhOECQmDpEYcX6Dml4CA3DXg0n7PuCuNWa2o=
X-Received: by 2002:a25:50a:: with SMTP id 10mr1019768ybf.115.1610053395712;
 Thu, 07 Jan 2021 13:03:15 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72=-He3iQRpKrCwApPUCjbF+zAiM95mR5JJ0tvs1hA0fnQ@mail.gmail.com>
In-Reply-To: <CANiq72=-He3iQRpKrCwApPUCjbF+zAiM95mR5JJ0tvs1hA0fnQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 7 Jan 2021 22:03:04 +0100
Message-ID: <CANiq72mRp6goyxUCrCGZ=VHJ1Xi74v0ey1sFt=7fzLELsHkpQw@mail.gmail.com>
Subject: Re: [Rust for Linux] Happy new year & Poll for call
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Jan 3, 2021 at 9:18 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I propose next weekend Saturday 9th or Sunday 10th, at some point
> between 16:00-21:00 UTC (EU evening / US afternoon).

Thanks everyone for the replies! Let's do it Saturday 18:00 UTC then.
Hopefully that is not that early for those in PST, just after lunch
for EST and not too late for anywhere in Europe. :-)

Cheers,
Miguel
