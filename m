Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93C6C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon,  3 Jan 2022 16:20:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234115AbiACQU1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 3 Jan 2022 11:20:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233904AbiACQU0 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 3 Jan 2022 11:20:26 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFEFC061761
        for <rust-for-linux@vger.kernel.org>; Mon,  3 Jan 2022 08:20:26 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id j6so26266356ila.4
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Jan 2022 08:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tuUKDHj5zW32lsZcpfruWvMvHYG+n4CI/8BW0EfoKbc=;
        b=FDiG9FtCbdZYOEzMVd8trALtWwRmCGecD1kSNnD+KF52ub5W8NoGkJ0IUAHWaZ07Oh
         3ajfY5zTH81A2z2+EOICFeJLIKi5Wq13/8X66MuwKJK2VZVUd+W5U4I1+TCWRXikAEH0
         ZIoil8YDF92s2NkhoEX+DUot9M5p/v9PjO2BkKmBaj9ADWUKn9a7m0itbxjS6jPEjphe
         Q999zjZe1C5QlJM0vEjfAN+7U69Jwx5OECe1Vg16svqDbsSkObLGuTUfqWM9zf0W9m4M
         1HCdyWFvMQ51tsg93glatpPSnRJZUAQulFpNj2M5xDIzTmxTpmOKHbz2KNZbSI7tQhwP
         4OlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tuUKDHj5zW32lsZcpfruWvMvHYG+n4CI/8BW0EfoKbc=;
        b=67twG8bvWi8hDtkk2+DUIOTalrKFwSsP5wuyY97cQ2sCvpxNcdPqiooh075Ag601Zp
         /vJ4thhOt54SSCqDAxUHwZhglQzb4LOf/24+DLaQQPY1bauaGoOe7Fj3/8XFRc64216V
         6NEhIjwvEI/z1YEifVZmFlz1E8hYyeZYfsvPy8bh6ZjlvQEu4CRBianbakELOMDq4hoB
         AGQBKgwHcsll88vbsUAaIWfTT7VZYs9HrpGmg9D9xNCtlAmEtdDB5mu3lu9ZVLP8eskt
         xTEXxuE0bjjyuZCdzXkmD2ZuieyPYm1WiU6XVUkgoS4vvlkffXbutmEnFQBfpfYaShCJ
         f+DA==
X-Gm-Message-State: AOAM5306fVI3GcZWnLFDo4GlQ0zUTZz7h0vTkJ67m3eiWWkYmPXMV4Sr
        fVx5QMprwHohROCslb8oDai6NW3IvL+Ildt3pzkUzjAUtfM=
X-Google-Smtp-Source: ABdhPJwD6YWOH161dgsFhjhC7LUHeN1Q+jZIzx6Vkvrj+4M2Ggms7oZDzmG+k+NXAvL4bWM6mX/MxDQ5FuaJzOfGsg4=
X-Received: by 2002:a05:6e02:164a:: with SMTP id v10mr18245272ilu.5.1641226825765;
 Mon, 03 Jan 2022 08:20:25 -0800 (PST)
MIME-Version: 1.0
References: <tencent_78F7527A2172D4676B48757B@qq.com>
In-Reply-To: <tencent_78F7527A2172D4676B48757B@qq.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 3 Jan 2022 17:20:14 +0100
Message-ID: <CANiq72nSzDFFv3QzFP2dY=WhDerdj4-BPx2Bn5kydLcPQ8S0iQ@mail.gmail.com>
Subject: Re: Which linux kernel version should I choose?
To:     =?UTF-8?B?5p2O5byY5a6H?= <lihongyu1999@bupt.edu.cn>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Jan 3, 2022 at 3:24 PM =E6=9D=8E=E5=BC=98=E5=AE=87 <lihongyu1999@bu=
pt.edu.cn> wrote:
>
> I want to apply the patchset v2 given in the mail list. I found that the =
patchset v1 can be applied to Linux kernel v5.13. However, I do not find th=
e correct Linux kernel version for the rust patchset v2. Where can I find t=
his information?

It should apply cleanly to v5.16-rc3. However, for normal development,
I suggest you simply fetch the GitHub repo instead. It gets updated
with mainline changes regularly (e.g. when I notice a conflict).

> Meanwhile, I wonder whether I can generate a patchset by myself so that I=
 can apply it to a specific kernel version I want. I tried to google this b=
ut did not find anything related.

You can, of course, apply the patchset to any version you want, but
then you will have to take care of solving any conflicts etc. on your
own.

> I want to join the Zulip group. My email address is lihongyu@bupt.edu.cn.

Do you want it to this one, or the From address? As Wei noticed, they
are different.

Cheers,
Miguel
