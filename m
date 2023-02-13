Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4B8C636D4
	for <rust-for-linux@archiver.kernel.org>; Mon, 13 Feb 2023 16:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbjBMQEx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 13 Feb 2023 11:04:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjBMQEw (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 13 Feb 2023 11:04:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2F351C58B
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 08:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676304246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Z+3XeIGkgLxorQE2MKfz/0QshNsn2TACmyCRtPNykmc=;
        b=PHvzMn595336qlwwPskbn5rakNY7lNg+t6EKb46ac6cUZpWls6WpZYI5EMa72hJVfiGIAE
        ltm0DrxCHyJB+M3BXIaA/vdtTFFp9e5dR/5Qy24Kz4STMLEjfZS06Uhae3DPdG5+5hxew5
        KrUnV7IjB452oXH15NB1NnqYt1jjKmI=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-LOMdeCf2M2SkoGH3AZIOOQ-1; Mon, 13 Feb 2023 11:04:03 -0500
X-MC-Unique: LOMdeCf2M2SkoGH3AZIOOQ-1
Received: by mail-vs1-f69.google.com with SMTP id z21-20020a67ca15000000b00411d9dbb998so2276001vsk.1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 08:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z+3XeIGkgLxorQE2MKfz/0QshNsn2TACmyCRtPNykmc=;
        b=KHx8KiCLA2Tr+VcB8bslQGc37w4gKV7nh1uGbA5e2jhcv9ofbbpMPUxmNh91Ij7VGg
         bpc9jR89qKKnWp5JxWCWlYm+B63HoP5rNTPqKM+se73NQypsl+2ZJN9YNkffoxb2D0Ve
         CbA70HOKNXcmwlmIDAm1aiAf7ZTkzhwhcpp6wJBSv9js6+lvlLZ2akzVeZHyyreRZmhq
         NkA/b5k74Gey2CmsNr7cTdIoPFtGh52svAeY2AYwmrg0hqFAcgi/ceGSUB/uFP37QhKX
         jx2dizDV3Q1+Ocob9SsC5eeBuhmvUfINfJFa6FPP33u55sStgSqS0Z8yLDZlNzkXHE2w
         tM0w==
X-Gm-Message-State: AO0yUKUcSK9GcuRw2nheVXPiUVatLQT1fswnJb3afqx+9TO6Vo7ap4ac
        SfgzVB8yIGYGqEaOHdD2BMGrcsqZy+PrRNz94tm354LIxHITJeRAmFU4ZWLoL9yrNYw2fzBgjFr
        abKuRo6IMMYS5McaTLqatzqbU/qSvtMa3aOQPVBCZ6yw=
X-Received: by 2002:a05:6102:3750:b0:411:bd2e:11ac with SMTP id u16-20020a056102375000b00411bd2e11acmr2920849vst.75.1676304242481;
        Mon, 13 Feb 2023 08:04:02 -0800 (PST)
X-Google-Smtp-Source: AK7set8f2Uc45pxarfLQxoAEndqNBof2SbJiNo6wh8cEftHeFujSHMV+bZPuLuaL05xaIESBdpPxqaZ9Sv0rQStmnOQ=
X-Received: by 2002:a05:6102:3750:b0:411:bd2e:11ac with SMTP id
 u16-20020a056102375000b00411bd2e11acmr2920835vst.75.1676304242260; Mon, 13
 Feb 2023 08:04:02 -0800 (PST)
MIME-Version: 1.0
References: <'CANiq72=FZtNmYvbb-YPHmQ=bm8rH8VO3M9nemT4i03g9A2PD2Q@mail.gmail.com'>
 <20230213151339.661225-1-yakoyoku@gmail.com> <Y+pbtZUaRM+gkOUC@righiandr-XPS-13-7390>
In-Reply-To: <Y+pbtZUaRM+gkOUC@righiandr-XPS-13-7390>
From:   Eric Curtin <ecurtin@redhat.com>
Date:   Mon, 13 Feb 2023 16:03:46 +0000
Message-ID: <CAOgh=FySHZSceM_JKjSNX5qTXBSv3Kv3KP6yT27VXADt-_oB5w@mail.gmail.com>
Subject: Re: [PATCH] rust: fix regexp in scripts/is_rust_module.sh
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
        miguel.ojeda.sandonis@gmail.com, alex.gaynor@gmail.com,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dxu@dxuuu.xyz,
        gary@garyguo.net, linux-kernel@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, 13 Feb 2023 at 15:48, Andrea Righi <andrea.righi@canonical.com> wrote:
>
> On Mon, Feb 13, 2023 at 12:13:39PM -0300, Martin Rodriguez Reboredo wrote:
> > On Mon, Feb 13, 2023 at 1:19 PM Miguel Ojeda <ojeda@kernel.org> wrote:
> > > On Fri, Feb 10, 2023 at 4:26 PM Andrea Righi <andrea.righi@canonical.com> wrote:
> > > >
> > > > nm can use "R" or "r" to show read-only data sections, but
> > > > scripts/is_rust_module.sh can only recognize "r", so with some versions
> > > > of binutils it can fail to detect if a module is a Rust module or not.
> > >
> > > Do you know which versions? If so, it would be nice to document it here.
> > >
> > > > Moreover, with this patch applied I can also relax the constraint of
> > > > "RUST depends on !DEBUG_INFO_BTF" and build a kernel with Rust and BTF
> > > > enabled at the same time (of course BTF generation is still skipped for
> > > > Rust modules).
> > >
> > > Even if that build succeeds, can you load the modules? i.e. the
> > > constraint was there due to
> > > https://github.com/Rust-for-Linux/linux/issues/735.
> >
> > Issue was that the kernel couldn't even load C modules, Rust CUs must be
> > skipped in vmlinux for it to work, and because of that the constraint
> > !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE [1] cannot be relaxed until
> > version 1.24+ of Pahole is the minimum requirement by the kernel. I'm OK
> > with this change but keep in mind that it won't remedy that condition.
> >
> > Link: https://lore.kernel.org/bpf/20230111152050.559334-1-yakoyoku@gmail.com/ [1]
>
> Oh yes, I'm using pahole 1.24, that's probably why it's all working for
> me. So we can't just drop !DEBUG_INFO_BTF, but we can definitely relax
> the constraint to "!DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE".

Yup the patch is ok, but we can only build with RUST and
DEBUG_INFO_BTF if we have pahole 1.24+ because that is the version
smart enough to exclude the Rust CUs.

If you have a version of pahole < 1.24 and you want to include RUST
you basically should not have DEBUG_INFO_BTF on at all because your
build will fail (unless this change alters the list of CUs passed to
pahole).

What is a little confusing is scripts/is_rust_module.sh and pahole
"--lang_exclude=rust" feature both attempt to do the same thing,
recognize and skip Rust CUs

>
> -Andrea
>

