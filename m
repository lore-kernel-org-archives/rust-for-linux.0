Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C564DEB64D9
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 15:06:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344389AbjFOPGG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 11:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344386AbjFOPGD (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 11:06:03 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6BAB2954
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 08:06:00 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b4470e1500so10370741fa.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 08:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686841559; x=1689433559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jdmx61CCyPVj8HlY4X0Z7dqPyWUbIZIFyCw1WxU93CA=;
        b=aoZKTHBveUH5NVXN+qIKUWiFSXc6gwQ/bxVib10AJFfhrJgip8yOrgmt6S8kQWiUsB
         XZGgYzK+rHfbk9Rc7w+bHfDVBouPTfGWHrYGWbtaFLTq+85hE0C0hKyQ9XTBdz//WDrG
         KsYnhdxX8DLWuYrac8SEWIvNTSWVXm25U64eHJ31EOVyj9o+iQzSmvaGtndFQER2T7gK
         vhljf26nu/WiBJpiwdZiBtPhA+CuntLDgsih/NqPuvPVG1bJVo88VaBxXVFCFWwEP2Mr
         Qis7OCQWEkiR35HKoi0KneXgJ+iraGHLahkIvmCUADjr2utCOsq+H3fWp4JepamR8j7H
         2KyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686841559; x=1689433559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jdmx61CCyPVj8HlY4X0Z7dqPyWUbIZIFyCw1WxU93CA=;
        b=D6ueboXv/+B8wfoSxlbftTv7LfiwlPPFV+JXKblCywBNPYXZ9P8/4oTxGIbGcNb1LP
         Cye4fsSK92UfLrxpJbycfsZ9b0Nj3QBLuZwZFPobJMTb87gzn8Seec5S/ly7sQ6rywXs
         oDU0EnMO/xfoVAMvMPmIXGk8FMU5chok5DAS5GKLXJsfPnuhAXjPzKph+oUGihjw1Daj
         duU9M4p4AtWCi8HqsTGkVjH6BQW5x3VS4ZzHVKz4SFrAcZO/QRuTmFwI8wiX7mNOfsMs
         ETjMv7yj/aB3dO2Y7cprvlV5uI8MRi3AOMEyc3+4HO8LzHRO1hOQy5vSw0ClKLzyLvA8
         WRNg==
X-Gm-Message-State: AC+VfDzTrXQMeAKJfVe2NlcvB0qwaVash7Yb4OJKuVbdx5NVgnNcl+uu
        Mb3P77UidWL/jtFnvIKG23XH+0dGkjKh7ouL8H0=
X-Google-Smtp-Source: ACHHUZ7+inHz5bgNNrNGKQV8QoG7/Y86TBD+vAS6JgPqNF0kAJKMpEkFFUAm94bYb4RhbBo8vzTrdMPZ/3vfcZeXfcE=
X-Received: by 2002:a2e:994d:0:b0:2b3:4cff:60c6 with SMTP id
 r13-20020a2e994d000000b002b34cff60c6mr3176208ljj.1.1686841558512; Thu, 15 Jun
 2023 08:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-32-amiculas@cisco.com>
 <ZIPDCGM9HbPhR2yW@moria.home.lan>
In-Reply-To: <ZIPDCGM9HbPhR2yW@moria.home.lan>
From:   Ariel Miculas <ariel.miculas@gmail.com>
Date:   Thu, 15 Jun 2023 18:05:47 +0300
Message-ID: <CAPDJoNuLfNWBqem7cD+vppfgg-3uBDQ9hnqJfAJEHev8fHnHyA@mail.gmail.com>
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Ariel Miculas <amiculas@cisco.com>, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 3:29=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Fri, Jun 09, 2023 at 09:30:29AM +0300, Ariel Miculas wrote:
> > From: Miguel Ojeda <ojeda@kernel.org>
> >
> > Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> > ---
> >  rust/serde/de/format.rs         | 2 ++
> >  rust/serde/de/ignored_any.rs    | 2 ++
> >  rust/serde/de/impls.rs          | 2 ++
> >  rust/serde/de/mod.rs            | 2 ++
> >  rust/serde/de/seed.rs           | 2 ++
> >  rust/serde/de/utf8.rs           | 2 ++
> >  rust/serde/de/value.rs          | 2 ++
> >  rust/serde/integer128.rs        | 2 ++
> >  rust/serde/lib.rs               | 2 ++
> >  rust/serde/macros.rs            | 2 ++
> >  rust/serde/private/de.rs        | 2 ++
> >  rust/serde/private/doc.rs       | 2 ++
> >  rust/serde/private/mod.rs       | 2 ++
> >  rust/serde/private/ser.rs       | 2 ++
> >  rust/serde/private/size_hint.rs | 2 ++
> >  rust/serde/ser/fmt.rs           | 2 ++
> >  rust/serde/ser/impls.rs         | 2 ++
> >  rust/serde/ser/impossible.rs    | 2 ++
> >  rust/serde/ser/mod.rs           | 2 ++
> >  rust/serde/std_error.rs         | 2 ++
> >  20 files changed, 40 insertions(+)
>
> Separately from that - are we sure we want to be pulling Serde into the
> kernel?
>
> Don't get me wrong, Serde is amazing - it's highly ergonomic, and makes
> a lot of compatibility issues just completely go away. It's
> impresssively well done.
>
> But it's a full json parser (are you using it in json mode here? it
> supports multiple formats), and object size is going to be a
> consideration. In particular, the way it works is by generating (via
> procedural macros) encode/decode functions for every type you use
> #[derive] an encoder/decoder for, so depending on how that was
> implemented that's going to add up.
>
> I would need to see text size numbers - the bloaty tool might be
> useful here: https://github.com/google/bloaty
>
> I'd give serious consideration to Cap'n proto instead, it's not as
> ergonomic as Serde (the get/set interface is not ideal, ask me for more
> details on how this could be fixed) but it's lower overhead than Serde.
I've been checking out Cap'n proto and indeed that get/set interface
seems cumbersome, so how do you fix it?
>
> https://github.com/capnproto/capnproto-rust

Regards,
Ariel
