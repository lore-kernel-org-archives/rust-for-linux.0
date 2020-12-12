Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D7A0C433FE
	for <rust-for-linux@archiver.kernel.org>; Sat, 12 Dec 2020 23:49:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 422BA21D46
	for <rust-for-linux@archiver.kernel.org>; Sat, 12 Dec 2020 23:49:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391079AbgLLXt1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 12 Dec 2020 18:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgLLXt0 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 12 Dec 2020 18:49:26 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5FFC0613CF
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 15:48:46 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id u18so20950516lfd.9
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 15:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MdPubj2vdLL976wWh2WjMIljAYY3+4TCrlUzv1TRciw=;
        b=J9rZJS/wNmXwS4AnLO98XHYlzA62lHpRvmsTfguNMdTs/mwacPuAo86M5ji0ccFsi3
         6kFjGM0+0SWtZjqerNUEZjlUfFjOs+CPlWEQjaYBFYP1DIZhUHHrwT29Jxo/FHiakCi2
         ooIvvKvWKf2BNetxtmCFyenMFh1NiludeDH8x1d4xZI2aema9iUHL2vIS9ztzmTaI9Mz
         HdsQHB0kj5xqHKRLG6XvNsJzonm7gbTBX2iVc7QbaSJdvSFuO5On6dy1XAA/JBAfgw1+
         +lR0h1m5T2J3waNdWcz4AWjzjWkOa4o8sqmfg2FJNc+eFZoeKY3FEsafJqxM/BXXH37B
         kLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MdPubj2vdLL976wWh2WjMIljAYY3+4TCrlUzv1TRciw=;
        b=UoUXqUpLek6yCIy2rSaQy4xxSWDyniEocCQekKslNN9jLWztuO1mFcK442Wnle+e2P
         sFz8We5meofFbP/PNBOc2Hyswn1+TgJa9KAE7lMpgRVF13bNh1WhYh/w2fWmBEMjBaMY
         kXYJKV2Up8nFECoI727BBSB4LxbSvIeogNclrp9VqB6u5b+Z13Hb9LRE0IPLj+fHpfNf
         0Uh0dlug37mD/gBm69yhzI0FvxRyYq7cFg3DlHo7k8uRGp6Kw/Rc3dLNB2PgzE8en+oe
         Cy5G+YS0A6GX3acx3n0T9JZKvCkN5VimjW6YuHhqwdrbN7dzQJH/HHSibpmAD7CfNHTD
         PynA==
X-Gm-Message-State: AOAM533K1azAm7iPkzQWUp0gBco+IAybowMHhSkTh77XE2iFE6sBhl4H
        Uk1BKXHY8PJXp/9vcPG4KnMb0aM3Z6fodL1jYgKV
X-Google-Smtp-Source: ABdhPJzttx0Y3LpuZIWlinJqT0f9xTIOdqbKmWeH6+hrM/ZZ/WKBDJBZQGe3WiGSsbfCmrvZ32FFyqL3f9FgAoR+Rdo=
X-Received: by 2002:a05:6512:3305:: with SMTP id k5mr6896092lfe.35.1607816924628;
 Sat, 12 Dec 2020 15:48:44 -0800 (PST)
MIME-Version: 1.0
References: <aa2ff401-d552-fd46-b2c3-2058af8226c3@kloenk.de>
 <CANiq72kKthjwUvBpHHPbhFsE555DriFVTtm2ziFTjwnPH_aA=A@mail.gmail.com>
 <cc71bee3-32e7-f3a5-8afa-a373438e5b36@kloenk.de> <d417fec0-c5c6-edda-796e-a861f5518eed@kloenk.de>
 <CANiq72negqN+2eOjieYW1Zas1ays3t3W-+wZisXjF9q=kob3yw@mail.gmail.com>
 <6c621482-94c7-b34b-6d46-5036df3fc1ff@kloenk.de> <CANiq72mfzkVVV+zV-GRWo+kTh=b3VayPz-9Bk+Yn35YuusDEQA@mail.gmail.com>
In-Reply-To: <CANiq72mfzkVVV+zV-GRWo+kTh=b3VayPz-9Bk+Yn35YuusDEQA@mail.gmail.com>
From:   Wedson Almeida Filho <wedsonaf@google.com>
Date:   Sat, 12 Dec 2020 23:48:33 +0000
Message-ID: <CAMKQLNJKZ+z985+zB0WJ+fiQkLT-q_bNrYH_qvh_xPDcQuiDyw@mail.gmail.com>
Subject: Re: module as seperate crate
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Finn Behrens <me@kloenk.de>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Thank you, Miguel!

Finn,

I posted on your PR before, but I think this is a better forum for
this. IIUC, you are implementing the pr_* family of functions and you
need a mutex for that. If this is the case, I think using a mutex is
probably not the ideal solution because it precludes the functions
from being used in contexts where blocking the task is not allowed.

I've just uploaded[1] a WIP commit that contains a SpinLock, which is
probably a better choice. Also, if this is a one-time initialisation
sort of thing, we can probably use a more efficient synchronisation
primitive. If you could describe your needs in more detail we could
probably work something out.

(As for the SpinLock implementation, it also has a condition variable
that uses a generic `Guard`, so if you want to hook your mutex
implementation to this, it will automatically work with the condition
variable too.)

Cheers,
-Wedson

[1] Spin lock commit:
https://github.com/Rust-for-Linux/linux/commit/3a9b3137f6fd179df3dacb72d717f5f4b4d0a266

On Wed, 9 Dec 2020 at 23:20, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Nov 29, 2020 at 7:30 PM Finn Behrens <me@kloenk.de> wrote:
> >
> > I create a static mut Mutex<&str> (or similar) to contain the pr_fmt
> > string. I cannot init the mutex in a const fn, and so I cannot create an
> > static mut value which already contains a mutex. So I have to call an
> > init_printk functions which creates this mutex. That's all what I'm doing.
> >
> > Will try to get something working the following days, and then send a
> > patch. Mayebe easier to decide then.
>
> This email is just to give Wedson an email thread to reply to. :-)
>
> Cheers,
> Miguel
