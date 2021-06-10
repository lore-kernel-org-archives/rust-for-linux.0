Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B1FC47094
	for <rust-for-linux@archiver.kernel.org>; Thu, 10 Jun 2021 15:21:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C40061364
	for <rust-for-linux@archiver.kernel.org>; Thu, 10 Jun 2021 15:21:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhFJPXg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 10 Jun 2021 11:23:36 -0400
Received: from mail-yb1-f179.google.com ([209.85.219.179]:42909 "EHLO
        mail-yb1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbhFJPXf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 10 Jun 2021 11:23:35 -0400
Received: by mail-yb1-f179.google.com with SMTP id g142so21984975ybf.9
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Jun 2021 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=XJ+d6O7OIGCPNpSAhfVsY9HEdcuvLjtk7izlsIIaY8Q=;
        b=cjGiv/5VKwWOheK0nBMDjBNE/2gStQshDKzeD8a0O3y1Y3SXaeppWsjjL+8TAGvLBf
         vA6aJMXRwNt6xbJugPAOD/WEfeSFe85EVsnXjG9QU/W0ZdgXmY+gQIt7yn0wQua79juL
         /8bAjNOEWem6XIBxFxLj2/ER7LO0E7Sb7Z2k4B0UxVlErfwh7ipvm2q10vdBeZqkCm/A
         5+VOOEute07qNg1190o5Qf6yhNOi91MO3Inp7zYsOC3xJK8PlVJlxzZobk36QJB51f9a
         fcoftZuUdzHZPD0QgrIPxYd8rcOD1lnpHzM7XnURkgcjO8JGVqdpGcGJT2BMxvnxj0WA
         Rzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=XJ+d6O7OIGCPNpSAhfVsY9HEdcuvLjtk7izlsIIaY8Q=;
        b=FWGpVzlMTIdiI5S3bl/828N7RATdTQ7CQqW80a8Lb6LTykRNKwOSPkwS0jSo/uvc44
         06WG/M7iB+Ksa7xB8uSZFeBk2lSgP1+tagyHcLlA5FZ6EoMjFuYPP+MQVAPraHPyE50M
         pkJX+hYmawSxNWkMnC1YvyaM86Dwri3VjAGJ0soKOVGzwZdWLSSt3tyWALbKK/heoZWp
         3W/epXcu63SNJmhu4eIa8SVQFk8iybl/DefQrzQz1WL14g/RhB6J83YXUtjyRbgGDUYx
         eMvnyw0nA131LStqY8wO3yDUAcTikDhcPeHpywG2ggREhvKlZG4bWaql8CTd75a9sPXk
         zg3Q==
X-Gm-Message-State: AOAM531JyTOlM0M2HorDlCIXGwzQZshrKnIx16HkMNuZOn6k/aXPI7kV
        vQlV2HmcJqFLdMxK/T8plGfRcPaqzOyqSWNPfWQT1EYEXHTpqg==
X-Google-Smtp-Source: ABdhPJwav7qeO5pDpfjDENbT4xwkt/azRCJPyJ8mLR/a2cDX3XM5f33d7IMoIshF/jpvuIdXxlvyUlo/2ZJYiE+H9PE=
X-Received: by 2002:a25:cac6:: with SMTP id a189mr7803299ybg.33.1623338430295;
 Thu, 10 Jun 2021 08:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <CANiq72nkghBWopTK1CErYGcU3PriQGaGrXxMwgCc+MhvS+HfVw@mail.gmail.com>
In-Reply-To: <CANiq72nkghBWopTK1CErYGcU3PriQGaGrXxMwgCc+MhvS+HfVw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 10 Jun 2021 17:20:19 +0200
Message-ID: <CANiq72=f7bvzc291u24_x+M_=wGaJMXYFEKOLXON35icuJoKSQ@mail.gmail.com>
Subject: Re: Technical call on `alloc`
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jun 9, 2021 at 11:43 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> We will have a technical call on `alloc` on Friday or Monday.
>
> Please pick your best times:
>
>     https://doodle.com/poll/8xv9ss85bfu7zh9d

The two best options seem to be both 15:00 UTC, so I have picked the
Monday one to have Alex with us. Fox, Josh, Douglas: sorry!

I have sent the invitation to everyone that filled the poll in case
you manage to come. If anybody else wants to join but did not fill the
poll, let me know.

Thanks!

Cheers,
Miguel
