Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7106BC433EF
	for <rust-for-linux@archiver.kernel.org>; Wed, 20 Oct 2021 22:56:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E98860F59
	for <rust-for-linux@archiver.kernel.org>; Wed, 20 Oct 2021 22:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhJTW66 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 20 Oct 2021 18:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbhJTW66 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 20 Oct 2021 18:58:58 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523C5C06161C
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Oct 2021 15:56:43 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id y26so507826lfa.11
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Oct 2021 15:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.cerritos.edu; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=PEI2thkkrsp/Znsgo5MAeAQF7FIHwnk4evfy07jKH14=;
        b=OsaVU5UEpM7m1Wsq5fq9nWFgHp5BYE7A7P7lkJg0bPe4NZsyrkBNJYJjABh99h6qET
         MNdFXXVw2w+D89o16LEHB4Sjqa6dwCyYSaJWJ7F0U7dk7H/1QlkMqYESF5wMnoFgWXHw
         2DF0jpC43r9qLA0i2VPA4Wqt1jbtiBjXBz8aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=PEI2thkkrsp/Znsgo5MAeAQF7FIHwnk4evfy07jKH14=;
        b=KwddaPY3inra8rBuZbiZPg9FD/d33qHytXpj6E9J99+8I4wXt9+zmlFCpyAgpGb00C
         0dcsgiSdh4pokTkWfB/rv3/KqhBadVfnT0DvmVWmVeq5whOQCsiZZ4zCXUPaA3n7/zkG
         t5qMef9jl762wB8b+QAm9hd37xCiYTd3QhRWOEbfoCwRs6FlqgSYGwvKfb36uZZp7K79
         iUVMctU/C2hNdeUKGkeH/Un70UmtdSXzXss9HApbWYYOXfW5tlBYA34dS4yHBzxAB9PC
         qmXdGcXr7Ud3/joBbOZo1Q592RqK3xhxWkCa0FzTO7TknWNoXMKDkX4nGUOjze/OHNxC
         +MDg==
X-Gm-Message-State: AOAM530BOu9nAj1bUIyaKoHupp5lkvZzlDKRVchSM73EU4w5cg3xGD97
        dXbxZniiR8+W93YgPiSnjeOD8DYzLWGqH2DGMSTYN2Gmg4c=
X-Google-Smtp-Source: ABdhPJxRGe74dWGokD2j1ACafrznjqVrZZepdZvuEH9kjX7bN9V+jb36BHsLfVJaPKsP3XyStQv4mPxVoMRrOOAb8E8=
X-Received: by 2002:a05:6512:3082:: with SMTP id z2mr1931028lfd.515.1634770601214;
 Wed, 20 Oct 2021 15:56:41 -0700 (PDT)
MIME-Version: 1.0
From:   Amy Parker <apark0006@student.cerritos.edu>
Date:   Wed, 20 Oct 2021 15:56:30 -0700
Message-ID: <CAPOgqxFkNBF+DnGv2YC0zAT1xfrqQTLuHurtP=6xPwyowBXU1Q@mail.gmail.com>
Subject: Question about compilation
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Cc:     ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello! I'm (somewhat) new to Rust for Linux.

Where/how do the Rust parts of the kernel on the Rust tree get
compiled in? I don't see a Kconfig for `rust/`, and I can't seem to
trace how they get controlled elsewhere. If there's any explanations
or guides on how this is done for substituting in Rust, please let me
know! I've been trying to figure it out as I'm aiming to translate a C
module into Rust.

Thank you so much!


    - amyip
