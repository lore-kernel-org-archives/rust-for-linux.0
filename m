Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BCEC7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 09:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241621AbjFIJba (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 05:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241634AbjFIJbD (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 05:31:03 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B225729B
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:25:54 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-ba86ea269e0so1525795276.1
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686302753; x=1688894753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hstOdu79/RaQhTfNh6i1MF7SdPZZcbMbIefOyvNihqQ=;
        b=gAqxklwFsR2YiSviRtpw/JcU1hJ7WjYxiqKQg+v+InRJhbGWkigrcmpcCBDEINiCiH
         EZTCI0o3gDKQLTJYTRpm6uQZU6JrRLi2KMGMG55/KzXh0EJC0Flyi4Xhs0HUgF/huZO9
         qFJZRfanmiOCCJbMsjPMBfyzM7l4L1wxZQOs2IBzJZnRqWX9cHslZCbmIUzqa5RdAqTW
         LuTkw8ujOgJ0VKaDcyGUKlZg9DXhMW96XfUUVnEYWuJSjhTDlcMBGkl1WJx7dQnlJj2Q
         mYfFaocuvTjDR+4BRAz0rXbkiYyVUZfruj2PBnxH9W8NJaj7DR1iwQYub5rIvJRk707S
         lNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686302753; x=1688894753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hstOdu79/RaQhTfNh6i1MF7SdPZZcbMbIefOyvNihqQ=;
        b=Hy0BXIK4nGkRLhkwXK1IMmfN+7GTSgWTj+9S8r4w0apdrl0ML0HJe9/c8306vkxrnl
         RiVv+jIFm4ZKjh5rIdclOLbE22B1sjoQxNBWFtCPuuTFk+LUR7Hbizo6xUEDqCq5PrFC
         ETUDi7D3QED8ZeQA6MPJArkk2QaorcD1Gg7JTTuqcDHxPiRi/sSF1Y/SZADzPHtHeo+2
         eerR0D3X7xHGyQpok+XGUPgHiUrZvxGebFAZmjsB1mH4iZPfct1ZeyElbEmZqqYtr7uI
         o/prpAWtF55tBcJ8evoKH9uZJ9REbh2K5lJe9Q6vkNuKj5YqH7AniCnLXVGysoc12Czy
         O1Lg==
X-Gm-Message-State: AC+VfDy3PQlK+NumOMqClZc0bfoXTbzdR66l5IiyyepPKGB8BTLxc79x
        76YTThwc6KXsbxrRC6CuSvYWK2wtNRQU8loMwxI=
X-Google-Smtp-Source: ACHHUZ6t4LpMqVuEyGueVTufVytIB9siYX0YEqiKSiWv3mFkbYVzPFBLGjKisctBwAz7Qj5qoNQ8LTYaShd6vJIwiUI=
X-Received: by 2002:a0d:ebc4:0:b0:55a:ad11:1ba2 with SMTP id
 u187-20020a0debc4000000b0055aad111ba2mr723694ywe.9.1686302753519; Fri, 09 Jun
 2023 02:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-21-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-21-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:25:42 +0200
Message-ID: <CANiq72=F7nHmYgLUe8iXuQ9gAJyqvtvrs=6FmBMZjemDj_38bw@mail.gmail.com>
Subject: Re: [PATCH 20/80] kernel: configs: enable rust samples in rust.config
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 9:03=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
> Signed-off-by: Ariel Miculas <amiculas@cisco.com>

I think the intention of `rust.config` is to enable the Rust support,
not everything related to Rust.

So it would be better to have another file to enable samples, or one
to enable as much as possible (e.g. for testing/CI), etc.

Cheers,
Miguel
