Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74366C433E0
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 16:58:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C8E7650F0
	for <rust-for-linux@archiver.kernel.org>; Tue, 16 Mar 2021 16:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236943AbhCPQ6S (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 16 Mar 2021 12:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232041AbhCPQ6E (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 16 Mar 2021 12:58:04 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09BBC06174A
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 09:58:04 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id t18so10948308pjs.3
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Mar 2021 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NGkVMy8mx8dDy4kmbTxg//fME/ItOhcMdlripIfe2s0=;
        b=tPJwYP70BSiExtFZIAPC1QJJXE0reMHQD9R599fR6A1HNLHejAHJbEZ+px+AxWiEwt
         TmDogvUJBffEmNK9ehYC7Q/Yr19KJVIwhKrewuaF3JGk/dmrJxnzm9bq/GGokyssjneL
         GX3HJEdmAlRW7ueefgUqX55fVgtPCiDAxHp73tEYYOG+78Hb1LaYr+k8SZxGsKk65wzz
         fUqU6rl1XiB9LwwqlVLZLrToFntHmvEyL7EfSIhnO5LY5BktAEf5cTaDFj7Cdqr9QAeE
         0A5LQy6FFvjM3AYDSojUfUD5J0ct9+B9xgSAOlbWh72ax9DmHVHrkXANIZ9M0gjyaOo1
         IKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NGkVMy8mx8dDy4kmbTxg//fME/ItOhcMdlripIfe2s0=;
        b=UuDwky7zMSqyV1jmpcnb376LFClc/7lx79epC/MgplVIEXXfCF5HORIgybSObXT6n/
         uH8nDM4b2TCsB1Fx8i2U9ChoAq1jeOQgNeXVjPRuouBTQ5b6wi7d4jLSRMcttzcUXu/R
         GUllDuEYNw2jNaHYTmUGPmfwG8g0cGbSrjmlOGK0ASOZtJFd2FjCP5Xa8oQK4iS/OWWn
         S5d7Gko4EpYkcbrlTj+K6WYf/tA3cXQzZHz9kH62MvPx6qEQlF2V4BHIGqhFKd+XQM4v
         e1VSywDidS8GBDytCcTnRLRAY7ewY5VJoqySaPP+gAmSdtsfuNc62lnNBw5h9pO44W5z
         y+OQ==
X-Gm-Message-State: AOAM5328xv64MogAJTc04uVqFKgp7F9VE/ql+C9wJJpzqEMM53bNWDV8
        kpRo7ffI+bWKmhrIouG9yBaO1IyPTDRzabEff54QTdt5kLY=
X-Google-Smtp-Source: ABdhPJyEi3XXLqJBdRzoTMjnMvOqJHuQ7EalupiTVbhvi6yEEgpvJT1ejuHE8qOODQ4fQhXYCHUps+zlXDmyBsLzSmM=
X-Received: by 2002:a17:90a:d3d1:: with SMTP id d17mr16563pjw.21.1615913884306;
 Tue, 16 Mar 2021 09:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72nCOKy_rUmxpqt=s4PX3veentT-jz38c7Yti0tr2X3FSg@mail.gmail.com>
In-Reply-To: <CANiq72nCOKy_rUmxpqt=s4PX3veentT-jz38c7Yti0tr2X3FSg@mail.gmail.com>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Tue, 16 Mar 2021 12:57:53 -0400
Message-ID: <CAFRnB2WSVcPyH4Wvp9SWP8O=L8ZjEKhXf0=oXPj9h2XHT1yh7Q@mail.gmail.com>
Subject: Re: [Rust for Linux] Poll for call
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

I will hopefully be able to make that -- the 27th is unusually busy
for a pandemic day for me :-)

Alex

On Tue, Mar 16, 2021 at 12:40 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi all,
>
> As discussed in the previous meeting, let's have one meeting focused
> on having a re-review of the code for the RFC.
>
> We have a fair amount of new code coming in and I am preparing a few
> things too, but it should still be fine by the original schedule [1],
> so I propose Saturday 27th or Sunday 28th at 18:00 UTC like last time
> (EU evening / US afternoon).
>
> If all goes well, we should be able to send the RFC soon after -rc5.
>
> [1] https://lore.kernel.org/rust-for-linux/CANiq72knSgMU30A2ALaJGY5FWumPKU18ThvfjR1t14_77kYLrQ@mail.gmail.com/
>
> Cheers,
> Miguel



-- 
All that is necessary for evil to succeed is for good people to do nothing.
