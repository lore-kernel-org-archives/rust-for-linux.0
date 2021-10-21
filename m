Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929B6C433EF
	for <rust-for-linux@archiver.kernel.org>; Thu, 21 Oct 2021 01:56:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7268F610A2
	for <rust-for-linux@archiver.kernel.org>; Thu, 21 Oct 2021 01:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhJUB6P (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 20 Oct 2021 21:58:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhJUB6P (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 20 Oct 2021 21:58:15 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0CA6C06161C
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Oct 2021 18:55:59 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id w23so689366lje.7
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Oct 2021 18:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.cerritos.edu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9quJXHzg1cEG6mba8oU+mh7HERJI3wDZhyfMM7Flb0o=;
        b=NXbiVr7QJahMjglTIiXSaEkbOYBUrt9xh4+WS0N6eDmSTh9XXdZvkkm6rb2shys/SJ
         frUjgnMEFznjCEeaRgjkHlBE7sDYFiDHhsxDCPEHsPgyjaIOHDnOymCGnmy9coMBGS6l
         1QFrJbuhAlxjwpeCNIDxHcOIgb1Z1QPSZo/zE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9quJXHzg1cEG6mba8oU+mh7HERJI3wDZhyfMM7Flb0o=;
        b=KOutqCkxHDX90zeXuWIo/IheFabfgh4udAqozJJS71a3tarKAJ4KaloFgIdHz7PUcl
         Sbd3mpczgBvQCuRM9NA+tbDbaS52BoyXEicbrZL4Juudnc7A4PzHpuGbPUhy/QLQBwPL
         YVrVQxtZ/Lt4aOV1sENwqrl1fob45hfJfav/sDxckS0xIbJhZQ+y/18zU8o6rs6zEjHT
         qEgNKfIROqITThIEsCMZLSeDGTNcnud18kaBpIVTQYX5+aQLj6Qd92vxDfkGRjX7xAMm
         tDx5ix3s3nN/veLhZisv5pOIwEkM0yQ2ylef+H9p5ibEf1MAdHJnKvMVjU2e+NKbNCQM
         2vIw==
X-Gm-Message-State: AOAM531zlq6Gvau0lkj8m0hXQgqlZ/jq3VXv0q/I9geATXxROxGPFfM4
        uRCZG954S1N0whz6pp1DRioHc1mx0lKc/TaU6bQSxQ==
X-Google-Smtp-Source: ABdhPJzfQ7bji40pLkneye1VMc/JFDJ10BdMKp3EJFBcgS5sP7iDUCJGyz0hXKCfcCeuqIi+popEaAO373tTFCG/ja0=
X-Received: by 2002:a2e:3005:: with SMTP id w5mr2641177ljw.228.1634781358134;
 Wed, 20 Oct 2021 18:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPOgqxFkNBF+DnGv2YC0zAT1xfrqQTLuHurtP=6xPwyowBXU1Q@mail.gmail.com>
 <CANiq72nKn7MS7pAeA3ydRRJv64OFjtCaB30R=B0Za0zfLqUG-Q@mail.gmail.com>
In-Reply-To: <CANiq72nKn7MS7pAeA3ydRRJv64OFjtCaB30R=B0Za0zfLqUG-Q@mail.gmail.com>
From:   Amy Parker <apark0006@student.cerritos.edu>
Date:   Wed, 20 Oct 2021 18:55:46 -0700
Message-ID: <CAPOgqxGvV3n5eC6kvU1uRXCOpxpz8n-rwVZZ5Q3eXcKVH_h4GA@mail.gmail.com>
Subject: Re: Question about compilation
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi!

So how do the Rust versions get linked over the C editions? How does
it become that the Rust variant is the one actually executing at
runtime?

Thank you so much Miguel!

    - amyip

On Wed, Oct 20, 2021 at 4:24 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi Amy,
>
> On Thu, Oct 21, 2021 at 12:56 AM Amy Parker
> <apark0006@student.cerritos.edu> wrote:
> >
> > Where/how do the Rust parts of the kernel on the Rust tree get
> > compiled in? I don't see a Kconfig for `rust/`, and I can't seem to
> > trace how they get controlled elsewhere. If there's any explanations
> > or guides on how this is done for substituting in Rust, please let me
> > know! I've been trying to figure it out as I'm aiming to translate a C
> > module into Rust.
>
> There is no individual control at the moment, i.e. if you have a
> feature enabled in the kernel, it will get enabled for C as well as
> for Rust (if Rust support is enabled).
>
> Then we use conditional compilation in the `kernel` crate, e.g.
> `#[cfg(CONFIG_FOO)]` may guard a `pub mod foo;`.
>
> Note that the organization of what is now the `kernel` crate (and its
> bindings) may change in the future, e.g. we may move to a model where
> subsystems have the Rust code in their folders etc.
>
> Cheers,
> Miguel



-- 
Amy Iris Parker
Please refer to me using she/her pronouns.
CIS Major
Dual Enrollment with WHS co2025
