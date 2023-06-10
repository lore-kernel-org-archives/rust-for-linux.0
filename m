Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016BDC7EE2E
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 11:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjFJLYi (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 07:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjFJLYi (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 07:24:38 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF883598
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 04:24:37 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-56ce96063bcso5325407b3.1
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 04:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686396276; x=1688988276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn+vrSiz/JB0fDNiZjyRzQzmtLZqvEN1uJ7QKVYu+Hc=;
        b=BJfJ/MIaoLG9wB/ookezVMaoPZOFrulzxVnS9zUa1jBp+vHBVkuqhey60MaLcMBG13
         tdhdCHPCYakFQMGWwfbXclHbwqrFH0U8SdQK5WcXFjh02ZAyBURd2V+cvAYhySpvo85i
         AiLpuZ5n8rDb56YGj5EhA6Bcmo4RSBOExp0eb5/hYjx1e/b6NTLGMnAuNXkcK/pS1l/m
         Al7iV9qQ8FSIsF2uCu/ZG61ODGF7Zn7e1mTcQ6sKqX2NMGE+MBnqmoE5//GQ+eUAdbSs
         /VqCPT6Cp+fCc4CbK/NUj28tu5BW7oQeSAos8sLb6KsYy4bvEdhSTQyyuMqtJ43bafB8
         1v7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686396276; x=1688988276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nn+vrSiz/JB0fDNiZjyRzQzmtLZqvEN1uJ7QKVYu+Hc=;
        b=ir/fL1EIxpnxq8yF9BbG0az+7WTAgAiST7WOIoRlNmKddn0AR1f4V5ABsQDv9X6fgM
         v82Gqy6rW9Il2ftb7t4XIwMrntXX0NUxnbGUzq91qNtgfJTdwRrHAHqvTG+U3QpJjB3x
         fkFhWkGeDAttM36lpCtotv0jhnLf97zcofh+R0MQh2NLYk97sTFLCJke78cd4VJ2eAj/
         kr7hOn0RSWzIbfYmla9zk5NemQsl6+YjFmQWG/u9Sp+RTcI4oTF+zpq1SVtnclMlSvtt
         ROpOJeZ7flFJExWJQ+jQWHUlo7PGXhJsl0zID9N0F9hR0sGUG+YVgl2TO4qCE3DIedL2
         OAQQ==
X-Gm-Message-State: AC+VfDxx0zxByUsCPvM3Zt0q8w81t6yO4reDAk5z+3wHVn6VL+A6uiZ8
        0BrJz/qfUk/i7n9NcMHV/ihNyLLzCAkFwQg0ZZ0=
X-Google-Smtp-Source: ACHHUZ4ffTTFt3DJC0OuRELh8/PCYREx5BbpbODubXlGqjv+MVVXFpiwKrV/1y2zJ5YmdCQEBYDNzLkrseZ5IeUgUK4=
X-Received: by 2002:a0d:dbd3:0:b0:561:80b2:53d8 with SMTP id
 d202-20020a0ddbd3000000b0056180b253d8mr4854490ywe.20.1686396276358; Sat, 10
 Jun 2023 04:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <01010188a42d5244-fffbd047-446b-4cbf-8a62-9c036d177276-000000@us-west-2.amazonses.com>
 <CANiq72k09iAEhevUUpUpM=Yg=5MFEb92PhgaM7FPAU3hs0+QeQ@mail.gmail.com> <01010188a4c8250d-fd7d7649-8aff-494c-bd9d-dc3a21fec9ae-000000@us-west-2.amazonses.com>
In-Reply-To: <01010188a4c8250d-fd7d7649-8aff-494c-bd9d-dc3a21fec9ae-000000@us-west-2.amazonses.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 10 Jun 2023 13:24:25 +0200
Message-ID: <CANiq72kLt1uKKT3ZfxT9at7v2VeaACckMcGf1p+ni4vQmZM4xw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] add abstractions for network device drivers
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        andrew@lunn.ch, fujita.tomonori@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 12:09=E2=80=AFPM FUJITA Tomonori <tomo@exabit.dev> =
wrote:
>
> I think this v2 is ready for netdev but sent to here just to make
> sure.

That is fine (and thanks!), but for the future, please explicitly
mention this in the cover letter and mark them as RFC; otherwise other
maintainers/lists may think they are actual patches (it happened
before :).

Even for Rust-subsystem-only patches, it is a good idea to do so, so
that we know which ones are intended for review purposes only.

Cheers,
Miguel
