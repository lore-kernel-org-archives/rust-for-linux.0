Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BFCC636CC
	for <rust-for-linux@archiver.kernel.org>; Mon, 13 Feb 2023 17:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbjBMRni (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 13 Feb 2023 12:43:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjBMRnh (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 13 Feb 2023 12:43:37 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F7B41C7F1
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 09:43:36 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7D83B3F138
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 17:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676310214;
        bh=92AwtEIk4tSFvds2ogNMkv3Byy8L08pLtOu+QAH2HLM=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=snQCEwItOp01bn/6Akrx+oQLCCpJUVTPF0vCkl1FkBvPtDMKD95j2eGymQscqic6n
         iR+GtZcitFj1AveFfeCy9dWWVFpbsGPzbu+2kleby2l49zRD+tqNbpaHDLbViHXWYm
         fTJAtqRH/aqDQMNbMLftuhHDxPPA5U6rG6XJ7Zgu1vcJ2PQsA5l75QQT6mtV5TP+p5
         1U/wWPk1zMg5v48n/RSeUJZNMvaKkdvU4zVgOTRrkFt3G4uYMjwekaXRwQL5k8G63G
         seo4BIE1ELzRl038tm7KG4yTyluue1iE9pKgjMnQK9DWQgZpIvkzId8I5oHInrL9+8
         nXV2t7H6bgfYA==
Received: by mail-ed1-f69.google.com with SMTP id eo7-20020a056402530700b004aab4319cedso7997637edb.2
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Feb 2023 09:43:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92AwtEIk4tSFvds2ogNMkv3Byy8L08pLtOu+QAH2HLM=;
        b=2RBk4FQTZHK0VP210nd+or5sx/pSJq1fO1zcFIGHWN3Gyz0tveKzTzvwqYiuI4Xvth
         Gt8YoZGrrLkb2uNZKbDa690HXXotBd2tipsmszul9TgU16OHYSN4jLktjU5vTzgHyQrN
         Nxd001CgaF9JAVayyc0+vTHzEbF0UbY5jhr/7Yyv/8bR7F/BxH4HMC18YcnHAlAmEDPC
         QQGhpzatOmcDnF1GK7+zDXen6Kwc+H32ck+vVylXeHqG4mnnLM1ta9/JGPdxwxTvFUy5
         BykECiIBFqE9taCKHjWIip7IS2LQSZh2s4EgnBJG+PeK2AgPwwofvMf36yeWHAVabi68
         LHDg==
X-Gm-Message-State: AO0yUKXsbboY4vLjcX3SqmN2H/SytKWPqoIuY+vOoXsp4kF+7E93o+yP
        5oW2aiD/ywFgD/ph3t93qOSyuLHmIeJi1HyG3cvxvHFt7T9PK+/OkG+gFuFNPDhxY4GwYWaqY+3
        amjKB2GxZo6Iu3aQXy7eaOe0Ha9y1pAe/raeHnqeCeb9U
X-Received: by 2002:a50:d0ce:0:b0:4ac:aa4d:51b8 with SMTP id g14-20020a50d0ce000000b004acaa4d51b8mr10224474edf.17.1676310214065;
        Mon, 13 Feb 2023 09:43:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+FgGH4T/lCPgHkgjdP42X02A6Bc6RCVLpZeYniNtHchdPfEKEaUt8cYaecg1fD6CYvf4LEug==
X-Received: by 2002:a50:d0ce:0:b0:4ac:aa4d:51b8 with SMTP id g14-20020a50d0ce000000b004acaa4d51b8mr10224456edf.17.1676310213849;
        Mon, 13 Feb 2023 09:43:33 -0800 (PST)
Received: from localhost (host-87-7-128-191.retail.telecomitalia.it. [87.7.128.191])
        by smtp.gmail.com with ESMTPSA id f22-20020a50a6d6000000b004acc6cbc451sm1962685edc.36.2023.02.13.09.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 09:43:33 -0800 (PST)
Date:   Mon, 13 Feb 2023 18:43:32 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Eric Curtin <ecurtin@redhat.com>
Cc:     Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
        miguel.ojeda.sandonis@gmail.com, alex.gaynor@gmail.com,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dxu@dxuuu.xyz,
        gary@garyguo.net, linux-kernel@vger.kernel.org, ojeda@kernel.org,
        rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Subject: Re: [PATCH] rust: fix regexp in scripts/is_rust_module.sh
Message-ID: <Y+p2xKIN6TJnQinK@righiandr-XPS-13-7390>
References: <'CANiq72=FZtNmYvbb-YPHmQ=bm8rH8VO3M9nemT4i03g9A2PD2Q@mail.gmail.com'>
 <20230213151339.661225-1-yakoyoku@gmail.com>
 <Y+pbtZUaRM+gkOUC@righiandr-XPS-13-7390>
 <CAOgh=FySHZSceM_JKjSNX5qTXBSv3Kv3KP6yT27VXADt-_oB5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOgh=FySHZSceM_JKjSNX5qTXBSv3Kv3KP6yT27VXADt-_oB5w@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Feb 13, 2023 at 04:03:46PM +0000, Eric Curtin wrote:
> On Mon, 13 Feb 2023 at 15:48, Andrea Righi <andrea.righi@canonical.com> wrote:
> >
> > On Mon, Feb 13, 2023 at 12:13:39PM -0300, Martin Rodriguez Reboredo wrote:
> > > On Mon, Feb 13, 2023 at 1:19 PM Miguel Ojeda <ojeda@kernel.org> wrote:
> > > > On Fri, Feb 10, 2023 at 4:26 PM Andrea Righi <andrea.righi@canonical.com> wrote:
> > > > >
> > > > > nm can use "R" or "r" to show read-only data sections, but
> > > > > scripts/is_rust_module.sh can only recognize "r", so with some versions
> > > > > of binutils it can fail to detect if a module is a Rust module or not.
> > > >
> > > > Do you know which versions? If so, it would be nice to document it here.
> > > >
> > > > > Moreover, with this patch applied I can also relax the constraint of
> > > > > "RUST depends on !DEBUG_INFO_BTF" and build a kernel with Rust and BTF
> > > > > enabled at the same time (of course BTF generation is still skipped for
> > > > > Rust modules).
> > > >
> > > > Even if that build succeeds, can you load the modules? i.e. the
> > > > constraint was there due to
> > > > https://github.com/Rust-for-Linux/linux/issues/735.
> > >
> > > Issue was that the kernel couldn't even load C modules, Rust CUs must be
> > > skipped in vmlinux for it to work, and because of that the constraint
> > > !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE [1] cannot be relaxed until
> > > version 1.24+ of Pahole is the minimum requirement by the kernel. I'm OK
> > > with this change but keep in mind that it won't remedy that condition.
> > >
> > > Link: https://lore.kernel.org/bpf/20230111152050.559334-1-yakoyoku@gmail.com/ [1]
> >
> > Oh yes, I'm using pahole 1.24, that's probably why it's all working for
> > me. So we can't just drop !DEBUG_INFO_BTF, but we can definitely relax
> > the constraint to "!DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE".
> 
> Yup the patch is ok, but we can only build with RUST and
> DEBUG_INFO_BTF if we have pahole 1.24+ because that is the version
> smart enough to exclude the Rust CUs.
> 
> If you have a version of pahole < 1.24 and you want to include RUST
> you basically should not have DEBUG_INFO_BTF on at all because your
> build will fail (unless this change alters the list of CUs passed to
> pahole).
> 
> What is a little confusing is scripts/is_rust_module.sh and pahole
> "--lang_exclude=rust" feature both attempt to do the same thing,
> recognize and skip Rust CUs

Yep, "pahole --lang_exclude=rust" makes scripts/is_rust_module.sh
obsolete, so with this applied:
https://lore.kernel.org/bpf/20230111152050.559334-1-yakoyoku@gmail.com/

I can just drop scripts/is_rust_module.sh and everything is still
working.

So, if that patch is applied we can do another patch to get rid of
is_rust_module.sh completely (because to my knowledge this script is
only used to exclude the BTF generation for the Rust modules).

-Andrea
