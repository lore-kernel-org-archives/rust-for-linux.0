Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F203C433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 20:20:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FA43613AE
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 20:20:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241101AbhDZUVg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 16:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238112AbhDZUVg (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 16:21:36 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F538C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 13:20:53 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id q192so12844432ybg.4
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 13:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RhdWOxQfOQJ3SwPiJ5fmW7Kv9kPzf2xIObphLJlDPNk=;
        b=VD5rehzbFcDLMBumNTnjj2D7OcKN41va10PWfHQwNMOKk9Ty2tzFtQXFxce95q+Gsy
         G4hf8dGboPFPxTRePYa1Q8t84EnIGxogIiEHHcpdyg7NoU+VdNB4H6Wguq3fEQm/bIsu
         wjrArbFYpaNgyKFcL6bLUelkRaj8DuEo8JDjd6qxgmBbFB5JMSCpzXU+qftVW4Ynna+c
         VsnzyZ5VJe6BD+XPso+DySrIKQBg+qCHYhbuzMkd4XOAicyAtnSQozYksZR3Nh5BhxeI
         PLwhBxn2PoqYbB6s+XeNTVoISTiBkl96L4VI3AGFizhXy28aEp3IOSSjKzr2Ioiam3LQ
         KDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RhdWOxQfOQJ3SwPiJ5fmW7Kv9kPzf2xIObphLJlDPNk=;
        b=T4Uk1l7rAgo1PzZFj/rJ1veaLHYScDTkdzqSrvDlrYfV7KE81cbEiwfOhbpLuBXwS1
         +C8cGgznh9cUkEVYrsuSlC9QbwJk7MVKwDTTrzvpDzf6162yfZdgPBLD8G8Pf5c7dS7I
         CVgsa7I9n49VFjoWKTrZKmBMo3cLOC2hxlXTu39bPuGG9MMZKO66CnQP3wzOLdIu6SIb
         C/JLoy3Ec3TIzOInA6zcCdAGtNHcmfzK9HB/07js+iRrc9ZdTeTWxGuktd9UfxMoNAtw
         q7Ibi+zy6dkbA2RQ4c03iUQtktxjzTvcUy4KR+e+UpWuM8BkGUWfscc2zWewDZKc1mtz
         cn1Q==
X-Gm-Message-State: AOAM532PBJLvZYix0RYKRF6MK4AINYIG3MrKgk3cOjter/ht+ZRxDwdm
        iJFDPV3Dr8HNYNTjMMSOoTjP47F5+nDgEHzu91I=
X-Google-Smtp-Source: ABdhPJxZrqF9QmAPJQlKNK3Fm0R9uInmwtBOSg+VgjE+JMAdZb73918qQr2JVJzQ8afXoLTqgt5lmS3ZpE5JMJ84YHQ=
X-Received: by 2002:a25:23d7:: with SMTP id j206mr4294129ybj.247.1619468452741;
 Mon, 26 Apr 2021 13:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmvQ+U7LbwLRyY6FC70Y9-1Sdp8KdYRXryUvk9oTHvJSh29nQ@mail.gmail.com>
 <CANiq72knPX3GHHPPrZ=ErgX=1DttMXjOShcA1ZF4TENzNRaWzg@mail.gmail.com> <CAKmvQ+UGiKVchv3DpR-QhyWqQ6-kx9HETNUcZqAv+An0ZgQwCg@mail.gmail.com>
In-Reply-To: <CAKmvQ+UGiKVchv3DpR-QhyWqQ6-kx9HETNUcZqAv+An0ZgQwCg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 26 Apr 2021 22:20:41 +0200
Message-ID: <CANiq72=oSMO1yGKFdOfVSZbLcsTVeJCXmbD_RdpnOqqKw4p55A@mail.gmail.com>
Subject: Re: [Question] import third-party crates in kernel modules
To:     Hanqing Zhao <ouckarlzhao@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 26, 2021 at 9:10 PM Hanqing Zhao <ouckarlzhao@gmail.com> wrote:
>
> I am actually writing a new alloc crate for linux kernel.

Please note that we are still evaluating how to approach this. The
best way to get involved with high-level design is to join the
meetings.

> I think it would be better if we can import 3rd-party crates while
> developing and testing our own kernel modules,
> i.e., we do not need to guarantee that the kernel module having
> 3rd-party dependencies can become an in-tree module,
> but we can compile a .ko that has a 3rd-part dependency
> during offline development and testing.

We need whatever infrastructure is required to be available for
in-tree modules too (and we need to focus on those first). A lot of
things are missing, indeed, but we will get there!

Meanwhile, perhaps you can manually import them as a workaround -- I
understand that missing functionality can be a bit painful.

Cheers,
Miguel
