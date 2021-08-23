Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB95C4338F
	for <rust-for-linux@archiver.kernel.org>; Mon, 23 Aug 2021 10:47:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22B856136F
	for <rust-for-linux@archiver.kernel.org>; Mon, 23 Aug 2021 10:47:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbhHWKsM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 23 Aug 2021 06:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234353AbhHWKsM (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 23 Aug 2021 06:48:12 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DB1C061575
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Aug 2021 03:47:29 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id y18so5555378ioc.1
        for <rust-for-linux@vger.kernel.org>; Mon, 23 Aug 2021 03:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zNZOWPYc//xDIL5boF5CsMDtQUBqyymBvdzrVtQEdiI=;
        b=eG2pJYa4yJOpgUDcSEIn14uurHbaqGQhXHG+Avbj+TbFLt1OdvmA9PlcBbgXQ7Xirx
         9GwxJS4HjKyXi3D/T1f/wJ4m7HUUhw+jjR6MTIcd+HhquyOp8NzHb7zFnseqsUAYVK+H
         dvI0RULkN8wKiM10ChsIicw70xQfPJsAQqtlaHawddIdBlYcW2a0P00sQgh0AAb3b2+w
         P741A/skVLwIsV01GCRG/NQTi4Vxb66zIJgtYfEx+inP8//jGpA4Wnzl2JZE+2vwDHmy
         QJITicvlfVTs9M4kpHC3aOXmeS514cTFtDcwN97Wnh1hGPeW/75hwAUE5eEJrc01c/UH
         GM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zNZOWPYc//xDIL5boF5CsMDtQUBqyymBvdzrVtQEdiI=;
        b=A6Omc+l/sFoQzv6k8K/IaAKraXHA1kmz4Vj1R4lfxfNJyHpJIBv4iJfh9JgS3hYgno
         F7iWDxcSDqLIpSUHK0hLlzyMZ4eikmwL2OFqtdwWyXaJSGJLipsKp/BTWiybvi3liA+G
         N25tajCvnLkUoTMPXMQchDYrP26QPbJZi/1WDRhGHHD/BnENfjHdoBiDFNWHfdIG4HVC
         csmpqPeJsvMl5uWF6BDD2eL3XlezxvKbZr5caKamgBWCyPaB7bb+6Jj7gP6ncVy9HkQn
         RWBGLd1vw46mc8kaYiCUtSX0xMOPZHmFTK93kQMkYf/4d8KDTtcN7K85MLb8PRxJgf4A
         FmIg==
X-Gm-Message-State: AOAM533bd8K/RA4bdn/Nr+N1pS6DHXMSiIXu4Kv+xEQS9uv+x4YZLPZQ
        4h+Nn/MrHc3khddQaeSvX3u/Ej61Hg7PWfHB0ug=
X-Google-Smtp-Source: ABdhPJx/vMVO9OXEWRcr36Au/654MEzrKiuyg+TFoxKkXtC4qL5U+cFGtpXvftier5XJdvRTJD9jLHhZTAMylvyilWI=
X-Received: by 2002:a02:5bc5:: with SMTP id g188mr29589917jab.136.1629715649330;
 Mon, 23 Aug 2021 03:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210819204422.64595-1-gi-oh.kim@ionos.com>
In-Reply-To: <20210819204422.64595-1-gi-oh.kim@ionos.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 23 Aug 2021 12:47:18 +0200
Message-ID: <CANiq72=zVfJskCzhDNGjSVZiHU8QJrEJhQEdO8o=-YU=jrKneQ@mail.gmail.com>
Subject: Re: [RFC] rust: kernel: ioctl returns ENOTTY if not implemented
To:     Gioh Kim <gi-oh.kim@ionos.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Gioh Kim <gurugio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Gioh,

On Thu, Aug 19, 2021 at 10:45 PM Gioh Kim <gi-oh.kim@ionos.com> wrote:
>
> From: Gioh Kim <gurugio@gmail.com>
>
> According to fs/ioctl.c, ioctl system call first test the cmd
> value with do_vfs_ioctl. If the cmd is not supported command,
> it calls vfs_ioctl. Then vfs_ioctl returns ENOTTY if ioctl is
> not implemented.
>
> Signed-off-by: Gioh Kim <gurugio@gmail.com>

Thanks! Applying it.

(By the way, always try to match the `From` -- I understand you are
sending this as a personal contribution vs. your other commits in the
kernel).

Cheers,
Miguel
