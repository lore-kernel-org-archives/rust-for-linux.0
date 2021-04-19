Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFF1C433ED
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 20:55:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3A206101C
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Apr 2021 20:55:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234559AbhDSU4S (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 19 Apr 2021 16:56:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242804AbhDSUzs (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 19 Apr 2021 16:55:48 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67069C0611E8
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 13:52:37 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id bx20so41251830edb.12
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Apr 2021 13:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pp9GOUa2m9xFJoCD+XSE/qNzKS97bqOxZFzVB4Pylns=;
        b=pk+XydzURuFlq6dM4/6X/VsD3yox+Ek69QYgUEpbXq7dqlskrrSDfwpNQbsKo89Iud
         NLlP8xZCj/EOK2dHQXFqIIhD0k5KnSrstWkFN8b1kw8S0P30dFCjg4/aIH74LEf3Hztf
         GFG7g3mDTrHFCRmsjwSYueDpYg3DQx5FvrPgH84ENq1I3dInJQW5coqmpRtG24JDfaXU
         8272V0USb08BMzWBey/EGkqz2CRyWkOFuGpbrCOYynICJCa3nu2euv6b3eGzgtTkVcL/
         4VmMMq66iJdMZgl9LUVAV/JqOOIlT0h8tDK3WR5g2TtsOo5xw7Iy0Zg0mWMv5wpeTDxq
         zI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pp9GOUa2m9xFJoCD+XSE/qNzKS97bqOxZFzVB4Pylns=;
        b=X8rpzC0Nnqqcx/c8SeJ/TmfOxlm6gBPwkYVul8dAuxm8053lQm82RU0Yx5iz+3OVjc
         ek7AP3krRmQazZjA9+zo62/BRMx5RIwyHssAOr4oP0EGsKf/IJIrwsCwG+EmXk+h6h2j
         WOrBdq9PBveEVgM1WiU+sgpnzhK+psesanMXF010+pN0GTLv+2b0kCpezjwiDJzKJFrk
         jt8Iv0Yo6AMlcQ98r/QXLrs+uaMQIDYiU6xsVIVQ2H9aSa6UJVbCu0tkL67fPKQilcTD
         PqjFXmBxGnDEidKEKvE2l7Ua5DlMjdJwWKuvMeQT6i5c8kVIgtFbQGPUrPHCr7Xxxt4l
         eplA==
X-Gm-Message-State: AOAM533sTE7/9drzzQZDxyBLV1GKN6b7GTTuv9JG8GMyJUUVPtKiWwWd
        wrGH2xHfcTa8qyOQTuhmyIn9Cx4zqBuNUD8YfJfAC35N
X-Google-Smtp-Source: ABdhPJxceP2yQJmS87S7liAT+B7ngzeRzA4WbgHdfM8tQXhlFDL6Z1DXgZ16wSEsoKk7JyU3Te3867yJl0mrl9f2AjQ=
X-Received: by 2002:aa7:d48a:: with SMTP id b10mr22260722edr.202.1618865556100;
 Mon, 19 Apr 2021 13:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
In-Reply-To: <CANiq72mDu=Tijr1mmpLNRoR7H4eqTH50FcaQmbKM9BAHDOahHA@mail.gmail.com>
From:   Joshua Abraham <j.abraham1776@gmail.com>
Date:   Mon, 19 Apr 2021 15:52:25 -0500
Message-ID: <CAMmOe3R2kkf9UXdDg3seuZhS8C0kg2ZQcGGoAnwFQGkuGRQp5g@mail.gmail.com>
Subject: Re: Poll for call
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 19, 2021 at 11:31 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> I propose next weekend Saturday 24th or Sunday 25th at 18:00 UTC like
> as usual (EU evening / US afternoon). Please let me know which day you
> prefer, if any.

Either works for me, with a slight preference for Saturday.

-- 
Respectfully,
Josh Abraham
