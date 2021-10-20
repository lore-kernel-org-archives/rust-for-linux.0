Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85AEDC433FE
	for <rust-for-linux@archiver.kernel.org>; Wed, 20 Oct 2021 23:24:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 666FC60EE2
	for <rust-for-linux@archiver.kernel.org>; Wed, 20 Oct 2021 23:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231148AbhJTX02 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 20 Oct 2021 19:26:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhJTX01 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 20 Oct 2021 19:26:27 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FA71C06161C
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Oct 2021 16:24:12 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id o184so14726344iof.6
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Oct 2021 16:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qH7eOzPJtr8yICb5cgYAI3d5Ys+K7hw5AywuqWhbzEw=;
        b=XXNUY0FMZaWCrJyMgXyRSOzFJp6u0mS6WUbpBra/ZjMgJ1nBoedM1NEsJENqvAvWCC
         JkNS58H6T3Hmz/4R4GM7JhxQyJQ65CiwjncOsG3cb6zRS3O3PZ/mDdrGoUmlG/vvkOhi
         XqcQXc3J14fK2fdDYe7cSMyy+s7Jb+G52pb6YbXW3PSmwTErhxBITEzOC0ILcQPyfLkF
         hOxrlSy+3CQ7LhpvRDdyFV1/XlacWivUfuyWVs6sYSR+OT8YTA4hyPP3U1+obd929sVj
         etsnY8E7AJwtG46zZA08qmNFoWQqQFpri/LZ1reC3wMh6mfHOF3t9mU7lBYG7naulFQT
         9ndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qH7eOzPJtr8yICb5cgYAI3d5Ys+K7hw5AywuqWhbzEw=;
        b=ACOKgqtDt3WbalkYNtLR+TwcMq7t0kNCVhdBAiXdFqpG1J5/94vvBbCjp3jS+EN2BQ
         4E6+rgwVMaBeidDnkFjsHJbRdfYkDVdGYA50iXWG0fJRqO8tM2wgUnpEb7U+CrUZF9ma
         2mV07IdUnNdHTUt5VPdUbwhktEmH9PFjvTgFi4Nge+aGJAvk5wmXZdG8HfvJxgA36EdK
         8FERFhaWCKUN0Z8fUsg4aRxZvyLr2yZC4HR2/JJeCGWPFSI/LnABz8ZSjz7RezUcCWCY
         /nv+qRs4aXxJ9lfTynYfCtCQe5etsQtC+BALHahtqPZdJ/Gnp5fHbWTlCe5q+O0WCjuo
         cUEg==
X-Gm-Message-State: AOAM530AVQM7eBcwwGih1L7k5sXvGciHgturNStOdo7yPB9mogllTP2Q
        2LcSndLLeaUnxzTH6IuEBLW5zJOhT+qNO7GHdtT7Ett+bIJkKA==
X-Google-Smtp-Source: ABdhPJz5Acz5mQFN3Ucgk6pJ9bX87RkvDt2KaYqTVvV0+wvaqBnP08E+88NXDaIucTBM+tAj7nk0tV6qudzTRNvfjtY=
X-Received: by 2002:a05:6638:45e:: with SMTP id r30mr1503579jap.133.1634772251849;
 Wed, 20 Oct 2021 16:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAPOgqxFkNBF+DnGv2YC0zAT1xfrqQTLuHurtP=6xPwyowBXU1Q@mail.gmail.com>
In-Reply-To: <CAPOgqxFkNBF+DnGv2YC0zAT1xfrqQTLuHurtP=6xPwyowBXU1Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 21 Oct 2021 01:24:00 +0200
Message-ID: <CANiq72nKn7MS7pAeA3ydRRJv64OFjtCaB30R=B0Za0zfLqUG-Q@mail.gmail.com>
Subject: Re: Question about compilation
To:     Amy Parker <apark0006@student.cerritos.edu>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Amy,

On Thu, Oct 21, 2021 at 12:56 AM Amy Parker
<apark0006@student.cerritos.edu> wrote:
>
> Where/how do the Rust parts of the kernel on the Rust tree get
> compiled in? I don't see a Kconfig for `rust/`, and I can't seem to
> trace how they get controlled elsewhere. If there's any explanations
> or guides on how this is done for substituting in Rust, please let me
> know! I've been trying to figure it out as I'm aiming to translate a C
> module into Rust.

There is no individual control at the moment, i.e. if you have a
feature enabled in the kernel, it will get enabled for C as well as
for Rust (if Rust support is enabled).

Then we use conditional compilation in the `kernel` crate, e.g.
`#[cfg(CONFIG_FOO)]` may guard a `pub mod foo;`.

Note that the organization of what is now the `kernel` crate (and its
bindings) may change in the future, e.g. we may move to a model where
subsystems have the Rust code in their folders etc.

Cheers,
Miguel
