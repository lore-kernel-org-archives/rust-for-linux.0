Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0FB8C433DB
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 Mar 2021 09:29:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AD21619BF
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 Mar 2021 09:29:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhCWJ2d (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 Mar 2021 05:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCWJ2Q (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 Mar 2021 05:28:16 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3D5C061574;
        Tue, 23 Mar 2021 02:28:16 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id j2so9642491ybj.8;
        Tue, 23 Mar 2021 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f4H0kivupb5TYJXKdAmaaH+GD+IJXaN+JMsocYW2kUY=;
        b=AxBxRUewNli2rtiqdcgNkpOd+pj8a2oITIWefNfkca6ZYPTtwwTmBmKVcOKFe13KqZ
         ZuIDbVfVL4pJUDxV5QjNL6KvhMLtlBht2TePRIY7S5dS2Po9vnraHBlQZ2XaltGI99m7
         urPrGOEBunDQ/Sr4kvNXX7sUN/UQw7ui0Exhjk1ognJGA+tiPLEW2HNovceUOduaWf35
         k9P2pnTwv1LNt5RuLneWbJC9u31Vi4Pd6t8yQfn2K8glQe7/0J6i1WhZZyfOjzffF6sb
         WCAPMml3GzOtm75j6hh2fhDKbN0OO9agtSbo4CKVliFnD6vKdfSRLbGbakdGJWDZ8mfZ
         Lgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f4H0kivupb5TYJXKdAmaaH+GD+IJXaN+JMsocYW2kUY=;
        b=HQvzzJIuAduFTeWUt+X6GsFeYhGBw/e87LnFcvxyJTH7j95BUoS1NBba6qTbmxtYC4
         CSISViT1Wh8xXovTbXUbYyuK2wufX+QfkvCudIAjgHfasTxcBCISrLDlJ6itB8kWjWmU
         sHAiDkNKxbeACkVE7A3rp+V4jLcdMnVBvyw/b7LTS6AjIDmhRO2bJrv/ML+HLZSLuIfC
         ZCVT6BqVf3lN9ASIlZLYx4e050WeJhEJH4vhmpvrAc1Xjvgq+aT0U/AfbVnswjuvZhc5
         k70unsc4Lui1yg8/ZiVwMs0lCI2GDVSfxNeksFHN9HbK2GEyE4MetlKiSRXYfaj50Xsq
         dThA==
X-Gm-Message-State: AOAM530DPLQFCw8fL5hK8leYLRMvnpLDyWq7DcNbCBF+092W0OGXSetE
        1+uARZZDN5FKDAE0ZGCjFq+BnV1mvX9u2ZhOJJfot1yepbc=
X-Google-Smtp-Source: ABdhPJyWHwFyJOKdqJHyKNGZydCjCeUAiyLOFA9kYL9VdL40ys7b34QihOEAVOnXFFnisHuJUZ7kMdTs33/WqrLFeYA=
X-Received: by 2002:a25:e748:: with SMTP id e69mr3784250ybh.93.1616491695744;
 Tue, 23 Mar 2021 02:28:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210323032624.1039422-1-mpe@ellerman.id.au> <20210323032624.1039422-4-mpe@ellerman.id.au>
In-Reply-To: <20210323032624.1039422-4-mpe@ellerman.id.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 23 Mar 2021 10:28:04 +0100
Message-ID: <CANiq72=E3WrNzRG90R4c_uG-oMRpdmN+G=ddeQhhLofh2ajEkg@mail.gmail.com>
Subject: Re: [PATCH 3/4] powerpc/rust: Add target.json for ppc64le
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     rust-for-linux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Mar 23, 2021 at 4:27 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> ppc64le only for now. We'll eventually need to come up with some way to
> change the target.json that's used based on more than just $(ARCH).

Indeed, it is one reason I didn't tackle e.g. x86 32-bit, because I
wanted to figure out how to do the whole `target.json` cleanly (i.e.
likely have a script generate them on the fly), so I thought it was
better to wait post-RFC.

Cheers,
Miguel
