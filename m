Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 365ABC1B08C
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Jul 2021 22:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FD09613C2
	for <rust-for-linux@archiver.kernel.org>; Wed, 14 Jul 2021 22:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236587AbhGNWn0 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Jul 2021 18:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236737AbhGNWnZ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Jul 2021 18:43:25 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A98EC061762
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jul 2021 15:40:32 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id s18so5759562ljg.7
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jul 2021 15:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XF9g4Kiw/Fnjhra0A3NHssg/L+MsgY/bbhNOhs2yWkg=;
        b=XwnAiopxVuee/+xvAawo1KbGDlP9AIOqV52u6nh+zQy7X8YyvYLVsIWrsG5z4hsAZo
         Us04RZB8+P1gHRtT9c5f7srdMs0z/wnINhl02yV17re/Cvj3nskjZ10AhDcDnZq6QQVD
         AjLwXMP+HKQ5AC55ituGLykCuW4g6U7vxsBmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XF9g4Kiw/Fnjhra0A3NHssg/L+MsgY/bbhNOhs2yWkg=;
        b=LEToq9jvHDoJ1jFEnuKLiuEtjTLRq0EXpGR2FUeOXluTawzKo5KHx51Xqz4xCU0Rlv
         OY7OEbZ+QIR5J+Zqar8JTAJqBJGQlpWy/4l1Im2GwSaISIRiJZJq2PArfzMA/p/KPgtI
         rG3dvQ20XS/is4zRw5svJrK9aNKd9zymnZhn35H9cVTmNL/P3TWnTi3vK/NRWNJpO8vJ
         GETY1A4kbAXeXt7Qc9/rYOGCVgRRT3JCWgqiJS4MAcFPysK7H9XZVeo4ELmWNQ4FXlyB
         PaMn6qdNf3x8mm0jJzEpd1NYAdfYycicRQTcLL72XxUVFei9XDVj/OOw/PBipZHBL3a1
         qqWg==
X-Gm-Message-State: AOAM5318563YOjSHl5H6zlLYGvBJNrJuw+PUhi3dtH3unQ7nunP52MZQ
        NNTBJMGtLWMqLcn7E7o5fMKrXqRni/to04wh
X-Google-Smtp-Source: ABdhPJwTj6V1PjjxLtif4QSAIGNDQLZKEABoYoIgzBcFjPg02mjbekXcNFcnqfHYIfJGySWkI7kU/Q==
X-Received: by 2002:a2e:9e8e:: with SMTP id f14mr145704ljk.468.1626302430254;
        Wed, 14 Jul 2021 15:40:30 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id s15sm263208lfp.216.2021.07.14.15.40.28
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 15:40:28 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id t17so6413676lfq.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jul 2021 15:40:28 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr265721lfa.421.1626302428152;
 Wed, 14 Jul 2021 15:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-3-ojeda@kernel.org>
 <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
 <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com>
 <87mtqo1wv6.fsf@disp2133> <CAHk-=whdi_biEOrzrYn7OC+wq+ckoaa5dFAATdM=n9P7Dp0YOA@mail.gmail.com>
 <87a6mo1v0q.fsf@disp2133>
In-Reply-To: <87a6mo1v0q.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Jul 2021 15:40:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjWiu5uak824BeWu5J+9n1NhQ9UKDGgcUfrumra6r+Z0A@mail.gmail.com>
Message-ID: <CAHk-=wjWiu5uak824BeWu5J+9n1NhQ9UKDGgcUfrumra6r+Z0A@mail.gmail.com>
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jul 14, 2021 at 1:49 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Sorry I was meaning to ask should the C symbols that get hashed
> include their types in the hash as well?  Because if everything
> is going to be hashed we need to clear definition of what we do
> with good old C symbols as well.

Oh, I guess if we wanted to be fancy, we could make the modversion
information be part of the hash.

Because we already have that, and that's kind of what it is. But I
wasn't actually thinking that fancy - I'd leave the C hash as just the
name hash with no type info.

Unless somebody really wants to do that modversions thing. It *would*
be a very natural thing to do in that "link using hashes" world view..

                Linus
