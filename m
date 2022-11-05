Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8687CC433FE
	for <rust-for-linux@archiver.kernel.org>; Sat,  5 Nov 2022 17:43:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiKERn1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 5 Nov 2022 13:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKERn1 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 5 Nov 2022 13:43:27 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC341DDD6
        for <rust-for-linux@vger.kernel.org>; Sat,  5 Nov 2022 10:43:25 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-36a4b86a0abso70199177b3.7
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Nov 2022 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4K7wERXIexITdSkMG5+Urwv7/i7smYmlpH7pxgLTReQ=;
        b=f819dVxvNSY4qKFmZTSkXNbRfuC6ukzyFwBmDIo4RaLr+x4lPoir7uA0JBaFxKjZJ3
         JwRC4ur7kffROXwQnpWCIgD6t5xCxk7pNMLEaXfr6vD1RtqvUvGROq4AT57txmeqBaKk
         lO71+iJOwa6rwB+cHoiaGuH7cxMpXfyZ4X4TQecbTualQOiio14nMVP6hGk2EK2Zzgoe
         uodmgrlM7MlCZo6OzylAjkYuFXV3lggDMLZELrDiW8jmHxLUKitKs1XDsgNIch84km7S
         6hlpHNP6XogocqttGmhn7PFQXv1Sz4tXa6I3WxCgGlgjYyXqGipxsxDxzI70EL5K5k4i
         C7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4K7wERXIexITdSkMG5+Urwv7/i7smYmlpH7pxgLTReQ=;
        b=g93Vrj3MKLnMSuLLLgMTEsVbpDGzVa3w0OtK9TDlq3qPb+ap7TaGO40iS3VPWn2k96
         EQqBTGUZSs5ABREyFlLxRUVSVg4sVf1vFc/5MEtUW9YSPhTlwUk+fjYgEys80NIUelyg
         puLcViVowhQr9rpoLLnEgtv7N+axD8JpvDEgur7h5iY2SeAG5Akh+eUF+plNY3kiEojf
         +Hy+Uld33aMyehTjr0aXybPE7rH/Orf5EKLt2IBMsypOhQyfdYWyZLc73J7l7UHpcMv4
         iquaFSGY0EuO6ZrJa0U4xUmfAs8iur0uT6yOJMICWjPQ3mvwVC2LShmEWp0GwFA5eoZO
         J+ZQ==
X-Gm-Message-State: ACrzQf2YGUX6GMnZGvxa+HrEEVtpUM7QC1ANfImbu3YWIVlfi3VgiTJ5
        LUiVhH/ryz1uSmHVrBokhzOHPbtnfZqEj9lawXoduQqE4Go=
X-Google-Smtp-Source: AMsMyM6PvSmO5OL/n83z39JZp2AKwLvPIRlseFXQLHr0M2Ia9S1zzDdv0/69u8d9Xs9k9YaVtPfmLutEYh8i9q+cA64=
X-Received: by 2002:a81:8302:0:b0:36a:a51f:a22b with SMTP id
 t2-20020a818302000000b0036aa51fa22bmr39322492ywf.129.1667670204731; Sat, 05
 Nov 2022 10:43:24 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 5 Nov 2022 18:43:13 +0100
Message-ID: <CANiq72kh9r3Ms20wxyZcsxfvOjDx9sVkoc0uaTQxe4mBYDB-Ww@mail.gmail.com>
Subject: Reminder: informal call in 20 minutes
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

We will have our informal call in 20 minutes from now (18:00 UTC first
Saturday of each month).

As usual, everybody is welcome to join. The meetings take place on
Google Meet. If you need an invitation, drop me an email!

If you are in a timezone that cannot easily attend the meetings at
18:00 UTC, please let us know.

Cheers,
Miguel
