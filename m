Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6595C678D5
	for <rust-for-linux@archiver.kernel.org>; Tue,  7 Mar 2023 12:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbjCGM7l (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 7 Mar 2023 07:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjCGM7Y (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 7 Mar 2023 07:59:24 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136997B4A0
        for <rust-for-linux@vger.kernel.org>; Tue,  7 Mar 2023 04:58:39 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p26so7687681wmc.4
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Mar 2023 04:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20210112.gappssmtp.com; s=20210112; t=1678193918;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/Cy/OujEvrfcgtxPDuxMYp8s8ng0EOqDDkVszWumlc=;
        b=TGPUjYNpDx/QPw20JCz5TtjaNYMDyJieQmDNClQ4JrH94qOsexFMclQooJxhwpRc5N
         B7a49mLYHpVbv9EdfaGhjrYpaSKn+/idY4P5F9dXczgSYrOW1cTZw0v0nfXANfmdOQVT
         vTa+H5v4C4gvExvz7ZnvYjKvaIvsv8XdBD0Y9FAYZBPBd0sZ7lcu4SdKllVIz4bza2CQ
         KqM5X/ZCbjpypB7l38jrnSRefjWT6zxDSaimQr5zkW9sK7WHfcsGAlru0RqOREmzv5Ho
         rIXfsXSJgWk75UrWiJx2u74l2hF4MzKzkv5uQDYW+audTAImBpcily54sNPvCLFtKpwB
         ly4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678193918;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n/Cy/OujEvrfcgtxPDuxMYp8s8ng0EOqDDkVszWumlc=;
        b=2pbZSjrHncDKwWlyrdk8epJdQ/N3UN0xErQgdpn5bk+dq+fX5NvCbbuPwHATfu6BBq
         Yr/DO/NRL0KFx2PmwlVfuf2hf0B5///Fvgh4Q8n3RnyDhipKfqW/1nXNhWTFM2pegrbo
         bTQ+iLYVSmvHHe4/7zhHekpB104p1A3lbQY+XM7dSEtWq/cVKYYiAtzUNRpJTa5B1l/c
         FaDrOqMnW6tlp8po1zUqnAXq0m4YXmi+fjVIqjzfcEWWd7n2xz+BJ9QzVPnllawlBMT2
         xoY8M929ZJRPgRXyRuyXdojLTUyU/d/8GTNFQvPCMfQvXN5e4r+6SjfU9d/Rf79KGVnb
         ipzQ==
X-Gm-Message-State: AO0yUKVQU/mhzx+y+dOo2F4dYm5XVbof08BKvZEPAg4SgSGHvWxRkBBM
        +lDVSkUYVcvdYBq+GtFDUWcnNA==
X-Google-Smtp-Source: AK7set/D4A4p19IRPCyUevUEJCTN9mTsfWxBu+p9Nnr+gZbVJ/onBxvG4vdlW0zE1acL1wtSjU4lYg==
X-Received: by 2002:a7b:cc10:0:b0:3eb:3104:efef with SMTP id f16-20020a7bcc10000000b003eb3104efefmr12335752wmh.31.1678193918141;
        Tue, 07 Mar 2023 04:58:38 -0800 (PST)
Received: from localhost ([165.225.194.197])
        by smtp.gmail.com with ESMTPSA id n8-20020a05600c304800b003e21f01c426sm12787712wmh.9.2023.03.07.04.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:58:37 -0800 (PST)
References: <20230307120736.75492-1-nmi@metaspace.dk>
 <CANiq72mvL3f-MZiZiZp-uZDQGCnYJ9yFh_QTWrTMUkUdiXdm=Q@mail.gmail.com>
User-agent: mu4e 1.9.18; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Asahi Lina <lina@asahilina.net>, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj=C3=B6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scripts: rust-analyzer: Skip crate module directories
Date:   Tue, 07 Mar 2023 13:53:53 +0100
In-reply-to: <CANiq72mvL3f-MZiZiZp-uZDQGCnYJ9yFh_QTWrTMUkUdiXdm=Q@mail.gmail.com>
Message-ID: <87edq0iupw.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Tue, Mar 7, 2023 at 1:08=E2=80=AFPM Andreas Hindborg <nmi@metaspace.dk=
> wrote:
>>
>> When generating rust-analyzer configuration, skip module directories.
>
> This is https://github.com/Rust-for-Linux/linux/pull/883, also handled
> by Vinay's patch
> https://lore.kernel.org/rust-for-linux/20230118160220.776302-1-varmavinay=
m@gmail.com/.

Awesome, three solutions to the same problem =F0=9F=98=85

>
> Lina's approach is arguably a bit more idiomatic in Python in that it
> is usually encouraged to follow the "Easier to ask for forgiveness
> than permission" approach.
>
> Lina, would you like to submit yours? Or do you prefer a `Link: ` /
> `Reported-by: ` / `Co-developed-by: ` here?
>
>> If `driver_mod` is a module of the crate `driver`, the directory `driver=
_mod`
>> may not contain `Makefile`, and `generate_rust_analyzer.py` will fail.
>
> By the way, note that in the kernel crate we are avoiding `mod.rs`
> files, instead using `name.rs` in the parent folder, in other to make
> it easier to find the files. I will add a note about it in the docs.

Thanks for pointing that out :)

BR Andreas
