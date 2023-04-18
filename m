Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1306CC6FD18
	for <rust-for-linux@archiver.kernel.org>; Tue, 18 Apr 2023 23:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjDRX5c (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 18 Apr 2023 19:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjDRX5b (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 18 Apr 2023 19:57:31 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF9F449F
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Apr 2023 16:57:29 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-54f6a796bd0so365056097b3.12
        for <rust-for-linux@vger.kernel.org>; Tue, 18 Apr 2023 16:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681862248; x=1684454248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0Z320UVZ6CaFW67cVrQWKNYrUACWZGC7nJsr2ZHt5Q=;
        b=blpnW/MQq7l0A9CNywU7ke45QocGifO8/kvdF2qnKcYYO6K+fzTq1hWO5+SmZ5d/0p
         AIupzydQxhEQESV+x3NMCOW52tNXG9/jZJvdLSNSNINmp0ny5CgJL8HU06kV5sScMmJz
         Uxwkt5e5FcvMGTZTcAgMChAu7PCRUnzK37oCzvBujIVvjP+yD0rzeRbhX5jA+udeybvo
         EF3NqgKNR5kcW0VWTNqeywK4hPNc7QmT+DL/Svvt1WOfuI6umOb6aEkvmy3jFvWyOrzP
         +k5M+FoHCEYZm4jbqIkwGPd92W1yj9SeoWtAmlr5zpL5inoiBgXpxRGdmnJymMJMsk0Q
         Rz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681862248; x=1684454248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y0Z320UVZ6CaFW67cVrQWKNYrUACWZGC7nJsr2ZHt5Q=;
        b=fFngERhH9oVN1V0KEhegzupxrVM+txC23YgFqSc5/EJ6FlGI7WqmNUqE6udSDm8J+1
         GLpeEkZPnx+xRUooWAYW027TFzIjCCjc8rGfzOGTV8DaVUtPO7xGbCnKtbD2Bc6+ab/y
         DAsKPSHD+D+baRLKhzVfUBGpUor4b9oAqODyPqC+V+/CtNFQ7iyWvaAHgI9tNzTquoeF
         X7qwY5m2HD019LLy0IU8fP/hW7yIxQLobnTfveIDsdvqDccvHi4VHZtfIJfL8keChrUF
         GlhRk7UlcNzEAImX5qzlYQvRv8Ra5+4GfoOmYxe/2x+8CjUlkB83JValXdxhWD1gHQAp
         FobA==
X-Gm-Message-State: AAQBX9fY5MPJ1GzhadOcXBW7vTXZ5ggcxWtCtDMx3V+gF6vk5F13PucD
        J9+LsxKhnSkZQlxhbZhcprFAX1A16ob7wGGGZCCXBcaal+0L9A==
X-Google-Smtp-Source: AKy350ZKumxi0zZc5vUluX4cqh2yA9VEfZ3o/ZrPZ/37oEITquC289CFuNZ6hJ2aW8LALYKH4CwJ6wYwCIxVH6QdImk=
X-Received: by 2002:a0d:db0f:0:b0:54f:7971:4f7b with SMTP id
 d15-20020a0ddb0f000000b0054f79714f7bmr1829330ywe.20.1681862248756; Tue, 18
 Apr 2023 16:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230413140138.348137-1-amiculas@cisco.com> <CANiq72mTyMzJVMEAfNo9TyevN8jbqV0L=ba8=Ym-2Oxhm7oniQ@mail.gmail.com>
 <CAPDJoNt_jCPfkmS7pRVA=1-U6csPEMuYsjTdwYm3HpUyZBVEUQ@mail.gmail.com>
In-Reply-To: <CAPDJoNt_jCPfkmS7pRVA=1-U6csPEMuYsjTdwYm3HpUyZBVEUQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 19 Apr 2023 01:57:17 +0200
Message-ID: <CANiq72=bGB3q1f+-Z2h09xSD-FXrzqejXy0g0xeDHm2YFf6F1Q@mail.gmail.com>
Subject: Re: [PATCH] rust: Add functions to create and modify an Inode
To:     Ariel Miculas <ariel.miculas@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, Ariel Miculas <amiculas@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Apr 13, 2023 at 8:55=E2=80=AFPM Ariel Miculas <ariel.miculas@gmail.=
com> wrote:
>
> Thanks Miguel, you've clarified some questions I had about the branches a=
nd the development process.

My pleasure!

> Regarding the rust branch, it says:
> > However, please feel free to submit new PRs for this branch.
>
> Does it make sense to open PRs against the rust branch in github and ask =
for feedback that way or should the existing fs.rs from the rust branch be =
merged into rust-next instead (and then I could submit patches)?
> For context, I'm trying to add the necessary fs abstractions in order to =
be able to rewrite lwnfs (https://lwn.net/Articles/57369/) in rust. I want =
to ask for feedback early because I'm not sure the abstractions I come up w=
ith are the right ones.

Yes, in general, please feel free to submit PRs there. The PRs will
not be merged, because the branch is effectively frozen and will
eventually go away / get archived, but you may still find it useful to
get early feedback. The mailing list is meant for mainline development
instead.

As for mainline, anyone can also send patches, of course, as long as
they are ready to be applied (again, in general, e.g. for filesystem
APIs, please wait until things get a bit more settled down as Wedson
mentioned -- when in doubt, you can always ask in Zulip).

Cheers,
Miguel
