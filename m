Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C3DFEB64DD
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 13:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345601AbjFPNS6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 16 Jun 2023 09:18:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345566AbjFPNSy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 16 Jun 2023 09:18:54 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EDD430C5;
        Fri, 16 Jun 2023 06:18:49 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bcde2b13fe2so581726276.3;
        Fri, 16 Jun 2023 06:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686921528; x=1689513528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lb4+PmCQ8W+jKe8LqTzGsYTrqTGNcxJgHIuvlDznX6w=;
        b=MssdAyyIVVLeIgnULlNVeAnVafBVBXlPP6VmMzjjNDNKj3wsQr4A65r0+hLrR7Amfp
         THagIY1MROBa5ol9mH5MJ3GI6Y8L1kANNGxZmrr7RnxHBcyL7Tc5QcypA5CyvAVQXach
         TF0SJteT7G7dsRS9aAR/0hDU9Brt+00kVNk2pszX9UATYFk6yCifQmiwoZlAxnclkuue
         H/uhcnS8oSBKSvDlzQenaCXjqLBZXZUAI4+Fl62O8Bfs8cJF0Cx3XkylmehHH67C7hxI
         AJMP/+2OTw08+9C3oE1gVWLc6UNbocjq1Q7COVZtmMdPwt+W3CGkjf/qNlfhJPuiix02
         CfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686921528; x=1689513528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lb4+PmCQ8W+jKe8LqTzGsYTrqTGNcxJgHIuvlDznX6w=;
        b=UHmJISPfSBSHlOqIYFx2OKqwSrpzIqA9haDnWkxcJFJknBy7RWCdihfEGGR4Qth+Bp
         DoueQERHW3Gr/H2oiqiDuqNnlldMUF6ENIovIwRReUqAJaBgfAnTPjOr54dZv9j0My4A
         OAqcPOgiOEUqtOG+oEcqLjeVopikJAhc96x1no7LrjsTgIJy0injIFMfPfD6LEKU0ZD4
         +hhDckIe8FG8AiCawei5rYynJjzHbIJ6EUXp4ACWXAv2sjKmfLQsqMKGnpbuUU2afqDm
         4p0ztdG2gB90h8YXnWRbblK78KORzUKNmiXC+zK0Ulfbpd1r0sAFQ8IX0zElvIe/Zwuf
         DTQw==
X-Gm-Message-State: AC+VfDyxPQDY0xiPmsXZ9ApQGibVS9JMn0OBealkT9a30AXoUh7FNrlZ
        46RKqRoCM7PcgtMKKLU7FqMZm9D6K/1V/Cfma90=
X-Google-Smtp-Source: ACHHUZ5cjY2pwdX4gIXa2flcRSPaGMsiaBz0YxjuX1FrtixuwEsKLuzegMpT6froAHth0ohtjvcHkxb36vDORfK4C0U=
X-Received: by 2002:a25:f80c:0:b0:bd6:7af3:2185 with SMTP id
 u12-20020a25f80c000000b00bd67af32185mr1824430ybd.17.1686921528186; Fri, 16
 Jun 2023 06:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
 <20230614230128.199724bd@kernel.org> <CANiq72nLV-BiXerGhhs+c6yeKk478vO_mKxMa=Za83=HbqQk-w@mail.gmail.com>
 <20230615191931.4e4751ac@kernel.org>
In-Reply-To: <20230615191931.4e4751ac@kernel.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Jun 2023 15:18:37 +0200
Message-ID: <CANiq72nyTdfBQDrBNOV7MEhpbwM3hYEeyaVZgRpMv8xFkLBwdw@mail.gmail.com>
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 16, 2023 at 4:19=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> TBH I was hoping that the code will be more like reading "modern C++"
> for a C developer. I can't understand much of what's going on.

Yeah, there are some subtleties in the language, especially in
`unsafe` land and dealing with FFI, but please feel free to ask. I
think if one understands the complexities of modern C++, then
high-level Rust can be mapped fairly well.

> Are there success stories in any subsystem for getting a driver for
> real HW supported? I think the best way to focus the effort would be
> to set a target on a relatively simple device.

DRM is looking into start merging things [1] soon, as far as I
understand, and the GPU driver is being used in Asahi Linux.

If we go a bit outside "real HW", but still "non-sample/toy modules",
my understanding is that Binder is also looking into merging the Rust
implementation in the next few months [2] (they are submitting the
abstractions for their dependencies already).

Then there are other efforts like the NVMe driver, which is
progressing nicely and Andreas has shown nice performance results so
far [3]. Though the upstreaming story for some of those efforts may be
less clear (for different reasons).

Of course, I don't speak for any of them -- I am just trying to give a
summary of how things are going, and a positive outlook :) In the end,
if a subsystem is willing to give things a try, we appreciate it,
because it also makes things easier for others in the future, too.

Perhaps you may want to treat it as an experiment (possibly marking
things as experimental/staging/... explicitly if needed) that allows
you to both learn Rust and whether it suits your subsystem, as well as
a way to possibly get new people/future maintainers involved.

[1] https://lore.kernel.org/rust-for-linux/20230307-rust-drm-v1-0-917ff5bc8=
0a8@asahilina.net/
[2] https://rust-for-linux.com/android-binder-driver
[3] https://rust-for-linux.com/nvme-driver

Cheers,
Miguel
