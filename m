Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9827BC433ED
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 19:48:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66A8261185
	for <rust-for-linux@archiver.kernel.org>; Mon, 26 Apr 2021 19:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241562AbhDZTs4 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 15:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241549AbhDZTsz (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 15:48:55 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CCB9C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 12:48:11 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id x5so6817457wrv.13
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 12:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+y9c+6nl2PvVY33TB3mI5eax6XP5Vq8+uvcR/aofNYc=;
        b=hA4Pd6AgkGv+gfRQ0q8Pzf+pMo2FH4Cm7BVyITZnCOu23oRnbA2UQI4eqK87IFlxGS
         K3QlARZ3gsALmYB69F9XzTOF3SPawDOGZslsMWBRsvTY8MbJ8eCLkRJRnI9oHxNi4MXd
         3+JPR0lkVd2iNdqhhK8872rkG/07z9iXM021NXlpDa2QjcanN5XhaIP0Xf/m7nm9bHgM
         4KP1+Ccz97/hm824oNq0D0JSAvnTl5NFAgmjXmVsZpicB6hEzuQxMSLMVOovV6Xj5Gbm
         ZKco5eJ6dEv1VSi3+Wq7EufjyWnz2UOGc8rQUuwZk9gpUGASUjElgyXG6C8E253A25D+
         D0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=+y9c+6nl2PvVY33TB3mI5eax6XP5Vq8+uvcR/aofNYc=;
        b=OcQkPXF9KvDbOX3aUUtSz3vq18XyjFGFS/+8SnFz/D5t9bVmiLanSMnOGCSRUtzMSV
         cTSm55qoUUmYTrj1jWaNwdRxxlRS+0u18B4tMiepJidK14cLSQn8/sPoJvqks2wYDUuH
         d4uE/xT7aUFR4fj+s1N7DzRunAbyE7LLdRvMWxHT2VPknt0cqPq7MU1xrdpW2iZQiXFT
         hdYKZlCihyZlKYDHUsxJEX9ILozT8yi5c1al9CPCcerh9j9SA7ni8jn30IV4nVo6LKuU
         wYo628CkAKwAEiQ9FQohk6Ul80saRFEDYghi7X6UuWTXLj/KsXud6ybS4kEONgWugdZ8
         oDMg==
X-Gm-Message-State: AOAM531uZH4QiASYpzOjf/EjqbXIjBIHpMQo6r2ndJ2aQQ+cX6b6FQKp
        B6wyGhWLRsPw8vG3fY6/yfH6o5wDIUQNjO85l93mrr6ioQEttDpJ
X-Google-Smtp-Source: ABdhPJx15HmoXDpyuZwiVtGWomCBJmpW7QpiQorqnAv7cN+0mHtxzn7mcPyHev0XyNk/YBBOp7USa/0xyiG5b46+9Fo=
X-Received: by 2002:a05:6000:8b:: with SMTP id m11mr25031565wrx.224.1619466489978;
 Mon, 26 Apr 2021 12:48:09 -0700 (PDT)
MIME-Version: 1.0
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Mon, 26 Apr 2021 15:47:59 -0400
Message-ID: <CAGngYiUHmkGTP7encnQOHv9CU6H4+RTN96oJb9B7DY4cuGPwAQ@mail.gmail.com>
Subject: [RFC] Short Circuit simplest Rust driver that touches real hardware?
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

(Is this the correct forum for this discussion? Should it go on
Rust-for-Linux's GitHub instead?)

Senior Linux people have expressed interest in seeing a Rust driver
that touches actual hardware. Nvme has been suggested as an excellent
candidate. But, that's going to be quite complex, and possibly a long
way off still.

Is there merit in "short circuiting" a Rust driver that touches actual
hardware? I.e. only do the minimum that's reasonably required, to
drive a trivial piece of hardware.

Suggestion:
1. implement `platform_device` in Rust, just enough to be `probe()`d
by the kernel, and receive a live `struct device *` - we should wrap
this pointer in a suitable Rust abstraction of course.
2. implement the simplest `IoMemBlock` in Rust. Since we have a live
`struct device *`, the `IoMemBlock` constructor can simply call
`devm_platform_get_and_ioremap_resource(our struct device *)` in C,
which will automatically use the right method to retrieve the `void
__iomem *`: devicetree, platform data, etc, we don't have to care.
3. use the `IoMemBlock` above to implement a trivial iomem-only driver
as a module. A few possible candidates:
* h/w random number generator in Raspberry Pi Zero: `brcm,bcm2835-rng`
* SoC thermal sensor in Raspberry Pi Zero: `brcm,bcm2835-thermal`
4. we don't have `hwrng` or `thermal_hwmon` devices in Rust yet, but
we could perhaps expose this as a `misc_device`, which is something we
already have. A single temp or randnum readout might do the trick.

The Raspberry Pi Zero can be purchased for $10. There is [QEMU
support](https://qemu.readthedocs.io/en/latest/system/arm/raspi.html)
for the peripherals above.

Feedback and ideas welcome !
