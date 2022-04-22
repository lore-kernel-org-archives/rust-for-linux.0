Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1114AC433F5
	for <rust-for-linux@archiver.kernel.org>; Fri, 22 Apr 2022 10:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445126AbiDVKp2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 22 Apr 2022 06:45:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446824AbiDVKpY (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 22 Apr 2022 06:45:24 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839822619
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Apr 2022 03:42:31 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id i196so8180186ioa.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Apr 2022 03:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5njAUOX6njDPbuEetCZjZ0nOVzggYwZoNDXab2j0CHE=;
        b=HfS2JA15prt93wUIq/LwwSeyIM+8tg8hgjdCaf2vLEHPpYkM1varx6ncsAQv6W2kne
         CSIo5cYSvlPOtyFI6siTd0lmMvQ4jJqqD+BRNiJsseLbkuvnZtSLL4zaZhbMKFPIOG/C
         1Q34H6fs6OmeICTaGzBihsTfnJJXe3xS1gIhpoRJ1kOZchUIr6HrsGtd59ZbypV6bWe/
         KZsatmhV6meextM90zWZGxo1loajdyz6YYIaPAThj0wearVXuuFcCBr6XNmtTMso1h31
         H5eoUycLUbkBSxavmEM8LVyB3D36f5ifvc9WCVqxXPmA1jS/+QG/uT1Dn5EZaYsjf9G7
         AEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5njAUOX6njDPbuEetCZjZ0nOVzggYwZoNDXab2j0CHE=;
        b=DqS9xGmwXp8hMUvL9V2fDACgOGunZxFRUBMJw+yPc4S6e5yElKXmRW3sj4FvbICbAw
         x7KUhm7f9D4zENZ4d3jIdGtF7rhSKSBDKei3VbQn8odZ4ERZbutgeMT/FjYXnJLS6Fme
         f7r85eD1YFbdehc5Lxb8pzVIkgFZxL+AvdV+nVR8IblcIk28S3mMQFMzgH3fOnKFsIoe
         YR8l2urV864JltkRM91yRD/FZL+vTskOd+LbSrAqLRYlibr1TAjikgfyTyQ8TcM2Rwr9
         uIVAakoouLruBv7mhQ7Y9aOaupu1/MJN0lb638157/VX9FuVZoF7mU0RoJ27NdIjz5WS
         0lXQ==
X-Gm-Message-State: AOAM530EpWTvW3Dhxy58o6+ZFgWJe+UtsbsyqymakhETcTBeVeqLJKwO
        apu1cuMxse7HFzmvyLY++7T6JLKtrE+S+MdS268=
X-Google-Smtp-Source: ABdhPJxDXPRl2IEf2kyBZMf69IJqtQltzKBZHWovWX6CmgZOSpJljN4YoYmVdQHMarBU0spEDDRObCxDQUHV+SEQu4A=
X-Received: by 2002:a6b:4e07:0:b0:653:9e0e:d220 with SMTP id
 c7-20020a6b4e07000000b006539e0ed220mr1792974iob.44.1650624150889; Fri, 22 Apr
 2022 03:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <A1DB8EE6-757B-42F2-BEC2-48C71F0103BC@gmail.com>
In-Reply-To: <A1DB8EE6-757B-42F2-BEC2-48C71F0103BC@gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 22 Apr 2022 12:42:19 +0200
Message-ID: <CANiq72nvyUSEYh3D8XUgCFZFjhmKaPqg4SEO4qfKhZ3sqgYwjg@mail.gmail.com>
Subject: Re: Request an invitation about rust_for_linux zulip
To:     =?UTF-8?B?546L6ICF6Ie76JCD?= <peterwrighten@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Peter,

On Thu, Apr 21, 2022 at 11:16 PM =E7=8E=8B=E8=80=85=E8=87=BB=E8=90=83 <pete=
rwrighten@gmail.com> wrote:
>
>  I am pretty interested in Rust and System Programming, especially buildi=
ng systems by Rust. So could you give me an opportunity to join Zulip for a=
sking some questions of Linux and Rust?

Of course, invitation sent -- welcome!

Cheers,
Miguel
