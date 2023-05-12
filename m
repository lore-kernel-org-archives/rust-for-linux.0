Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B35C77B7F
	for <rust-for-linux@archiver.kernel.org>; Fri, 12 May 2023 17:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236716AbjELR3s (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 12 May 2023 13:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235775AbjELR3s (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 12 May 2023 13:29:48 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02465E5D
        for <rust-for-linux@vger.kernel.org>; Fri, 12 May 2023 10:29:47 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-51b661097bfso7183798a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 12 May 2023 10:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1683912586; x=1686504586;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=R1kCvuryMHsFO2mHpkYGGBtTve3Q7WEfvsZIrGLBy+M=;
        b=XPkEbnEQrJcA9kBV44J3LUSsi2+josMPi43vuSB+cYYZgQCDURMBaKkKZrko5jNQTB
         B6arjiJOAKw6WzD4phdJTPjlOFNEUWZ3n/eUopX4EpQ4diJQiXsiNW+Mo3ztQCHO0N2g
         1/iq0KhOIKBVIe6ttcVZDceplziC639WKs9LoeaWSvFU7H0q6kY0KgRfp5mrJ5lBj6Za
         jMNdHSxLyq06YLO7BnVBOodkM30w/SkOX+Ac09JpBEU189RDzg65iYT12H3fdJ7owyKW
         /VIF/d4neXcZDkgXFapNwcg0UmP8O2EmQOoLoyMDsjPXCKlUs/U/OEjGx/kg6mGwklD2
         XjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683912586; x=1686504586;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1kCvuryMHsFO2mHpkYGGBtTve3Q7WEfvsZIrGLBy+M=;
        b=l+JNWBd3bu3Gs4cbQ74oPQ92C4UpfYJEVRGjL8zKubC4i3VGbq5ZbQpl4xhbbdm6mT
         5rJvkiY3snylJfQmpdQe99zyuagv8UzzmSRsjgfPgaNJvaub67C5s+DkMr3AFTT4fyQr
         F2QyuRRIJLDLLOkihWufinV7nT5DcnodEmZiRiw8xD/DYSULzEnkZp/4Y33XyMJvb+EX
         pW6MY+FVKdEu29dwOLCUptTLUSIbVIj5Ae5lMBs35gNxAwiRJIve509p0cLN0EKQi5W4
         FF3X/ybY9I1Vg1AuRDMhwhr9yEKxdr39doukb3vshTldRfGWnn0qdaF4SMiQo+jSf01d
         5nhQ==
X-Gm-Message-State: AC+VfDy1RI2MMkXUZxiAxbxPlBnZ8ZVX7otp4bGXJoWfKEoiObdYalPW
        ktnDssd6gHd3Wv4xfNYvsrvmew==
X-Google-Smtp-Source: ACHHUZ7LL3aC8Z/WvhcNzSO5r4cxusiD6K6cemOQ3vp56w6AvA7Ok9DuYgCX82voHO6j5IkaDpbrOw==
X-Received: by 2002:a17:90a:7e90:b0:24e:272:2469 with SMTP id j16-20020a17090a7e9000b0024e02722469mr25665003pjl.18.1683912586345;
        Fri, 12 May 2023 10:29:46 -0700 (PDT)
Received: from localhost ([64.141.80.140])
        by smtp.gmail.com with ESMTPSA id iq14-20020a17090afb4e00b0024df400a9e6sm21935527pjb.37.2023.05.12.10.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 10:29:46 -0700 (PDT)
References: <a68fca00-666a-bbf4-b4d3-acd409dd69d2@gmail.com>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Ryo Munakata <ryomnktml@gmail.com>
Cc:     rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: Rust ENC28J60 ethernet driver working on Raspberry Pi
Date:   Fri, 12 May 2023 19:28:09 +0200
In-reply-to: <a68fca00-666a-bbf4-b4d3-acd409dd69d2@gmail.com>
Message-ID: <87mt29e9vb.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Ryo Munakata <ryomnktml@gmail.com> writes:

> Hi all,
>
> I've written an ethernet driver for ENC28J60, a stand-alone ethernet controller
> with a SPI interface, in Rust.
> It works fine on Raspberry Pi 4B with Raspbian AArch64.
> You can connect to the internet and play some videos on YouTube with it
> (10BASE-T though).
> I hope it will be an example of real-world drivers in Rust.
>
> * ENC28J60 ethernet driver in Rust
> enc28j60rs: https://github.com/pfpacket/enc28j60rs
> `impl Sync/Send`, mostly because of raw pointers, and the initialization of
> `workqueue::Work` and `sync::Spinlock`
> require a tiny bit of "unsafe" code, but otherwise no unsafe code used.
>
> * The forked kernel with Rust support for SPI and netdev
> https://github.com/pfpacket/linux-rpi-rust/tree/rust-netdev
> Forked from the Raspberry Pi tree and merged Rust-for-Linux `rust` branch into
> it.
> (BTW are there any easier way to get Rust-for-Linux work on Raspberry Pi? If so
> please let me know.)
> Then I added the SPI support referencing rust/kernel/platform.rs and netdev
> support.
> The netdev support is based on the following GitHub PR from Fujita-san:
> https://github.com/Rust-for-Linux/linux/pull/908

This is cool, thanks! I will check it out at some point.

Best regards
Andreas Hindborg
