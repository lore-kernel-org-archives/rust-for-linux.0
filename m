Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7C3C77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 19:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjFJTOQ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 15:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjFJTOQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 15:14:16 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 498811FEC
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 12:14:15 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-565eb83efe4so28904477b3.0
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 12:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686424454; x=1689016454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX7ZVev5wzPEBx+8jDem6FL0JInlHfYj1UKTqB6upSs=;
        b=cKenZ+o1G0kJyGvNhWCLxzzIny12l4su83oB1lGO0M6Ktm8qAaFmlIZ9PU1AeOBPhE
         vBx/5iL0IBLUZ8J8DwEj85AL6dVC94QKc6o90BgtE7NRx9BDCG7newwRUm7daa65mb0O
         S73jCvPA3x5ep2KR7b8DDbmtOoDv2PjoKVnnQ0RneZJQZDtvNRaAJWjL81IueB6j/Olb
         IfI5422bSa6g8AcdPEkksGoAiW5WBUfPgg3NGjOAXa8lUxyQNE+uSKnwiU/FE6HmnCm7
         2rds6cByqqRzgj1TlgCl5nPpz+CEujW+8YXwX9LL9oe51OWaXGy1gE8Cbyrm01cHBZV4
         2jYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686424454; x=1689016454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iX7ZVev5wzPEBx+8jDem6FL0JInlHfYj1UKTqB6upSs=;
        b=BHVH68npCnM5nUFYsIJ/WqsZx8azZ6m1+8tY9I7Zvvis3mcvq2St0EhPFQ6sqPVXJ1
         w5rU7BtEixVADv9GL2DATBrbT7LzrKDud7aSLprrAjONB1dWyb/UM+4IJjNC6bSmHhvY
         3VTN4g0Sh0spST9Ax1BXlav6kmUFirUKidLaRaiq6LlESuG9HJhL6XZzA8UsD5fgD6LF
         RryvUOE3N9tdzd4B9Yng5ymJknvNsVz8moGYRm/HJKXF4h1Cd1fVbevhZWvD2ECtCHeC
         DAbnOx4/hKlfhmtyLBqTyA+x58E3KGFEraGz+eFWP8RWuTzzBJr7fNkSULSHE616SYCw
         1EjQ==
X-Gm-Message-State: AC+VfDzSUgX8zFUZp1KQfc1a/MJMHhA9jtGvHrLZJzESJtthsDKpWRtj
        odaBqZ5DlvwQ2uA0+2/y8+NX38sHsoLox0wb78c3lyWq
X-Google-Smtp-Source: ACHHUZ4RCVw0UGh67RiJAzG9vhXU2Unp1j7V6hqWUWGiAhO0kh0pvu85QsafZepwmwRV+bDwm6cApcjvuY6ligLQ5mc=
X-Received: by 2002:a0d:ca8c:0:b0:56d:28b:8042 with SMTP id
 m134-20020a0dca8c000000b0056d028b8042mr1227448ywd.40.1686424454470; Sat, 10
 Jun 2023 12:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230610071848.3722492-1-tomo@exabit.dev> <01010188a42d5620-fdafc00a-8aad-4c5e-a0b7-1fb83da6ba03-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188a42d5620-fdafc00a-8aad-4c5e-a0b7-1fb83da6ba03-000000@us-west-2.amazonses.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 10 Jun 2023 21:14:03 +0200
Message-ID: <CANiq72kQLHjSPb43gvmiSzT5cCVBa9aNTLdyXnKgcLHoMt7rEg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] samples: rust: add dummy network driver
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        andrew@lunn.ch, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 9:51=E2=80=AFAM FUJITA Tomonori <tomo@exabit.dev> w=
rote:
>
> +config SAMPLE_RUST_NET_DUMMY
> +       tristate "Dummy network driver"
> +       help
> +         This is the simpler version of drivers/net/dummy.c. No intentio=
n to replace it. This provides educational information for Rust
> +         abstractions for network drivers.

Long line.

Also, should this depend on `NET`?

> +use kernel::{
> +    bindings, c_str,

We should avoid using `bindings` outside the `kernel` crate (or, in
the future, subsystem crates). Ideally this may be a hard error in the
future (we have to see if we need flexibility in some places).

> +// device driver specific information
> +struct Stats {}

Please follow the documentation style used elsewhere.

> +module! {
> +    type: DummyNetdev,
> +    name: "rust_net_dummy",
> +    author: "Rust for Linux Contributors",
> +    description: "Rust dummy netdev",
> +    license: "GPL v2",
> +}

Please move this to the top like in the other samples -- it is the
convention we are following so far (even though it is different from
the C side, and could change, but we should remain consistent).

>  # Compile Rust sources (.rs)
>  # ----------------------------------------------------------------------=
-----
>
> -rust_allowed_features :=3D new_uninit
> +rust_allowed_features :=3D allocator_api,new_uninit

Please add a note that you are adding this in the commit message, and
which functionality we need from it.

Thanks!

Cheers,
Miguel
