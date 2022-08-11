Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C666C19F2A
	for <rust-for-linux@archiver.kernel.org>; Thu, 11 Aug 2022 13:28:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235556AbiHKN25 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 11 Aug 2022 09:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234394AbiHKN24 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 11 Aug 2022 09:28:56 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E708A7C1
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Aug 2022 06:28:55 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id j8so33491833ejx.9
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Aug 2022 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=PrxK1nZmIZ+BI/PTOkS5D0ti6c0JmkDkpbtLgTG9IbQ=;
        b=FQc4k1jna3mwxeM7v1A5HjiNvLxsQwkdvkJwwp1Cu5rzOnqQmis0YqRNocS5qdM2Q2
         jLOApkm3ES6+FamZN0UrDkc/7tAoTS93G8z8yZ5QW6RtFLTW7z+r6a3zwYs+4+KbrsEn
         gYWVhpqNMTA4qdKe9XArLKJA1iFUn8tNKtiA/YHbhiTz9rbARB+u7kd0BrVdEBa+2ZcF
         L/oKKZaUBOpUBP+xMZqLBvmT7i0lygd4owkvdNP0vTDCMrY3TaFt2z917VnxOpe8qXJC
         nmLeyUH9AO7ovLQ7m6bzBa7gpz8nJ6vQ7heO/FZLiLF5H3qaTQEOSmfsQivi6HCQo4fu
         Dd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=PrxK1nZmIZ+BI/PTOkS5D0ti6c0JmkDkpbtLgTG9IbQ=;
        b=7lR76xLbd53I4uSzuXL8oK6LTccEQ61rMWky47VUSUXIgkaX774rkLex/E63UVeZnk
         VN601pnYGmAhOqvl56d+1pABe0be872gF6c5XrI5QuWatpLL3oReV82rHNga3TkKUN2r
         2N7iU0zpBu//50upj8929TM5h5TFmgMUI1QFk/EWnTRrgfOyGzB5mpK/5kj12gjV0ir2
         htZOmJta4KCrIt1qWgwIdMgglIT1ha+S5gjKsamRECsJDbfx4CoJx4WJ1MGODbo7dOPl
         Pd+/2Zhl0zE51631+LvmeLXaQifsY+bO+uX2B8Zi6HL9HYonbSNikhv7AFMqhcy6quyy
         y1kA==
X-Gm-Message-State: ACgBeo2qsRGl8KQhPZ0hzsGlwMW95+K1A14Qy7b0dtT12YQafnQJ43Cs
        QT7BLed6DUt7QXC4VJlPff0KUdkhDKYJFvvSBWT6HQm3FLI=
X-Google-Smtp-Source: AA6agR4ORahm0dz0POXYtA3ME1QbTIpcyOoy9XfrRxFzG1KvMrlLISnUntne1QQz2Jy1YgaeG3nIUXrWnvddxt2n1rU=
X-Received: by 2002:a17:906:974f:b0:734:804b:b338 with SMTP id
 o15-20020a170906974f00b00734804bb338mr2653352ejy.508.1660224533930; Thu, 11
 Aug 2022 06:28:53 -0700 (PDT)
MIME-Version: 1.0
From:   FUJITA Tomonori <fujita.tomonori@gmail.com>
Date:   Thu, 11 Aug 2022 22:28:42 +0900
Message-ID: <CAJ+Zx=3FVCkJW6j0K_gkF0q3iXeRs-HaVZay94bgS4sav8q8nw@mail.gmail.com>
Subject: abstraction for NIC drivers
To:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi,

Someone is working on abstraction for NIC drivers?

I'm interested in abstraction for hardware device drivers (dma, pci,
etc). I've worked for storage drivers (play with NVMe on QEMU), trying
to push one for PCI firstly:

https://github.com/Rust-for-Linux/linux/pull/856

Thanks,
