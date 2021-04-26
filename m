Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9E7C433B4
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 20:23:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4175613AA
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 20:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241848AbhDZUXo (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 16:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241598AbhDZUXo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 16:23:44 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C14C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 13:23:01 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 82so66539706yby.7
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 13:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rv90d9Kr4NOkoR1j6kqwvw8FLcXO6EPJVgJXhyx76Q4=;
        b=bKVPuPhqSZ7+ZzDa75NwdUmb2nYsTREb0MFc4sU/U3UyKPk4aOGlHgSr+s7z84T1vN
         sHK2yW8knFW4XVhiLsZ6rkl9ROhcgYMMMZ1UVNKHJg4jz9BT3S79AURSU0jhp7sUKpGO
         oBQfUHJ6MPyK291MnZCzHEocb78Ky5UN3nxv0fWg/KRPS8Kx6PZm5NMPkSTjGRnde99i
         j9UWYhTAbx9GR6g4uP/EDC3z4xlOfyGm82kEtpAYvr5K9/iHUDfxX3WTE9ywJvcsIlJ7
         yIZXuhXXdaekhdfIpG4lI4RXgzd5xzh06HXHWo19+YusAEBbjW0PNP9SdjCLUOybY7yT
         KXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rv90d9Kr4NOkoR1j6kqwvw8FLcXO6EPJVgJXhyx76Q4=;
        b=A6tvx7MToMsILOTmCzs6TAc+VrDGUyBT2teoAmGUCy4h/7pIYQfT68wa5+S5zoH/B7
         t0EmuL1sbPJCtrsrvSKNIptOpmfjt1xLlrDl/kcgvXg5pu4BcTfHlIFX5wDKkAnJYEM7
         Py2SeiikvXlJoD88GKEXe2pigqBnlB9bFjnqLmXeqFoj7sB9gOEtDrpzoKTgQ6NDwHy2
         OwBV8SYYuZtbChNyB8AVCt//DgzkIC37arYET3qKbvfaDU5Pfz4NpMgGV0fLp4L2AJXl
         VyZpIDdf0vf9iq1VIexa5a9Mr8vLcbvjKVRDe1eNTtXF4byFvR3+VvuyFItRwdC6NmGx
         OkMw==
X-Gm-Message-State: AOAM53129D+1ht/tEDC58bdrV5kfl2Vo86fLdsYR1uEYWB6YwQrJK7Ww
        ZuMqWC3gN6FIrI0UwTbuo+1JgsovKcek5vkHApQ=
X-Google-Smtp-Source: ABdhPJz86BVuS8J3BTMJ7iW+9122FTarm31yltxWb8uKxQPEwwSh5tpCVFKnN0UT1oAYblE/YRYL3qF55Se8vxNgJrs=
X-Received: by 2002:a25:bc8b:: with SMTP id e11mr28150484ybk.115.1619468580525;
 Mon, 26 Apr 2021 13:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAGngYiUHmkGTP7encnQOHv9CU6H4+RTN96oJb9B7DY4cuGPwAQ@mail.gmail.com>
In-Reply-To: <CAGngYiUHmkGTP7encnQOHv9CU6H4+RTN96oJb9B7DY4cuGPwAQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 26 Apr 2021 22:22:49 +0200
Message-ID: <CANiq72mAP1YWV6pxPXRD6_RjqCZyAHTkvTc3G2C8v=axi-9NtA@mail.gmail.com>
Subject: Re: [RFC] Short Circuit simplest Rust driver that touches real hardware?
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 26, 2021 at 9:48 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> (Is this the correct forum for this discussion? Should it go on
> Rust-for-Linux's GitHub instead?)

(Yes! No, this is exactly the kind of discussion that should go in the
mailing list :)

Cheers,
Miguel
