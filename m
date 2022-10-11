Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B5CEC433FE
	for <rust-for-linux@archiver.kernel.org>; Tue, 11 Oct 2022 07:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbiJKHJa (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 11 Oct 2022 03:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbiJKHJa (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 11 Oct 2022 03:09:30 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21A47FE53
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Oct 2022 00:09:27 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id a17so6740926ilq.1
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Oct 2022 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L1VEp698p0l4yqDSy/YEFIG0qq57fEk+iV/QTIthqPQ=;
        b=X7ZuHZqiX2P0VvEaptevPqE63ITtybxWMsZ/+RG5QsKK82yVilop3bybinBR4F8us0
         fwaqyBIrFAGP4pJwXpeyg01jAjDRW6TF9h+dKva0BE6wboGnx48LckhjPXUZpTkCmrMs
         EfPhGU78OSjUdF9WowlBxS+uJAbpClVxM9RnqXGoKiiiuinVaGeLsUM8NjrPjqgzy8KJ
         MUXhKX+I1dSGzg2r7nZf2xtig2LwQIsL4s7kevBB91R/YS2Y6NTOEvj7LXYwkVW3HFrm
         xtlCphOwwSrco6E1i3Wto/L8EGUW3K904uW2Uiu7ic8wTinboeCV5s/jc6Dp3SMY0QvN
         OGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1VEp698p0l4yqDSy/YEFIG0qq57fEk+iV/QTIthqPQ=;
        b=E8KjM4MiPqi0DHOUO1ll3fu7poSTPzYjLoHQefeqRMtY0VP0SER4ql9nQ9H5HZZagZ
         iTpRZiQTrghBksu8YSt3fJ3s2xuRSFdOsI34qHymQuFZ4voPhdnsnZzgC1XiQnUvrGwv
         ToVJzqeKsqGuqYxFSeVncr91okFSzDjSk0XHzjyBWbTpLop2zNDnmXp60S9Y0nP7r7aD
         q18Dk5QMF2iLjly+aDDrOph8IwDaaNV58Pyj4NbNB4lUDgs1N/woG2h+lDoxBOtk4SR+
         ygo45QxJ2/DXGqlRQlfsLBDV8nTKfpeNkYDSFbH9CQsuCsMAKN5NnLhFUCMeujoGqb9N
         qStA==
X-Gm-Message-State: ACrzQf0+OL40iPEgJfZN8jhn3JwNI3AlU1cXsKEzHs3DEoSuIP4DS6RR
        yvGccx7/4GCpqlCpQHrnBTD4B46AZ4VvxEpSuiU=
X-Google-Smtp-Source: AMsMyM6fUkmkiqJ6vELlv6e20xg4LBTXhHh9UTYHD2GVqlmO4bEYD8mofIhOOnUtFgLAmzII4co5iZ4bqLbqxkVcA7o=
X-Received: by 2002:a05:6e02:184a:b0:2fa:3064:2a7a with SMTP id
 b10-20020a056e02184a00b002fa30642a7amr11466082ilv.97.1665472167055; Tue, 11
 Oct 2022 00:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <CANc8B5MUDNfR=zLrigH0DtR1YVDc1hwp3Usz-_vEczBppP+cqA@mail.gmail.com>
 <20221011.152006.627622596401854552.fujita@lima-default>
In-Reply-To: <20221011.152006.627622596401854552.fujita@lima-default>
From:   Gioh Kim <gurugio@gmail.com>
Date:   Tue, 11 Oct 2022 16:09:16 +0900
Message-ID: <CANc8B5NE1QURMsaHrLgA6z5Dq++5dVxKGeTLZdOyiJt10bDtSw@mail.gmail.com>
Subject: Re: wrapper for __register_blkdev and unregister_blkdev
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org, andreas.hindborg@wdc.com,
        wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi

On Tue, Oct 11, 2022 at 3:20 PM FUJITA Tomonori <tomo@exabit.dev> wrote:
>
> Hi,
>
> On Tue, 11 Oct 2022 12:01:16 +0900
> Gioh Kim <gurugio@gmail.com> wrote:
>
> > I tried to make the ramdisk module for exercise but found that
> > there is no wrapper for block layer APIs.
> > I thought it would be great if somebody is working for the block layer.
> > So I just implemented a wrapper of only __register_blkdev and
> > unregister_blkdev for testing.
> > https://github.com/Rust-for-Linux/linux/commit/65fd073d9f2ccbdabeae444ff34a72e23d717845
>
> I think that you could use Andreas's NVMe driver tree:
>
> https://github.com/metaspace/rust-linux/tree/nvme
>
> Andreas has worked on the block layer abstraction that Wedson
> implemented.

Great!
Thank you very much.
I'll check them out.


>
> It doesn't have Rust APIs for register_blkdev/unregister_blkdev()
> because the NVMe driver doesn't directly call them. But easy to add
> them.
>
> I planed to work on the block layer but there was already Wedson's
> work so I've been working on other stuff.
>
> Thanks,



-- 

Best regards,
Gioh Kim

On Tue, Oct 11, 2022 at 3:20 PM FUJITA Tomonori <tomo@exabit.dev> wrote:
>
> Hi,
>
> On Tue, 11 Oct 2022 12:01:16 +0900
> Gioh Kim <gurugio@gmail.com> wrote:
>
> > I tried to make the ramdisk module for exercise but found that
> > there is no wrapper for block layer APIs.
> > I thought it would be great if somebody is working for the block layer.
> > So I just implemented a wrapper of only __register_blkdev and
> > unregister_blkdev for testing.
> > https://github.com/Rust-for-Linux/linux/commit/65fd073d9f2ccbdabeae444ff34a72e23d717845
>
> I think that you could use Andreas's NVMe driver tree:
>
> https://github.com/metaspace/rust-linux/tree/nvme
>
> Andreas has worked on the block layer abstraction that Wedson
> implemented.
>
> It doesn't have Rust APIs for register_blkdev/unregister_blkdev()
> because the NVMe driver doesn't directly call them. But easy to add
> them.
>
> I planed to work on the block layer but there was already Wedson's
> work so I've been working on other stuff.
>
> Thanks,



-- 

Best regards,
Gioh Kim
