Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F91C4707A
	for <rust-for-linux@archiver.kernel.org>; Fri, 21 May 2021 17:42:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B24BB613AF
	for <rust-for-linux@archiver.kernel.org>; Fri, 21 May 2021 17:42:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbhEURoR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 21 May 2021 13:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235879AbhEURoR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 21 May 2021 13:44:17 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D14C061574
        for <rust-for-linux@vger.kernel.org>; Fri, 21 May 2021 10:42:52 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id k127so20562079qkc.6
        for <rust-for-linux@vger.kernel.org>; Fri, 21 May 2021 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=kzI/KG/c7APIE0vhxUzCFaRe1PYbby2V0jlVV8MFpi0=;
        b=j8gn3kctRwffho8kKCpFR8QlN0ZfSsVjSzeGFgZhUjGpDaI1oWUCH+gVBFGhYUuUN+
         Vr4tH5Rt4rV9joVbX9xiCDiFix+kzNsZE77J8BoZWp4I+J02oyMnfbgUOA3j7DQZezv2
         +Ja8wHnDzCvmXbjKAE8DMpVJ1Es4WQKKLSiTX9meXAAFDqFQAXMcX7V0yq3/cPDjRElB
         fsgp3Z3Dt6POexMeprp00cO0x6YMWOCyPacRFPV15DHlF0dwshd6pKDvZckKRV6SlSKq
         SQoaAzucxMkNrymJx4G6AOHRlo0xPioPVyXZw7uG1dMLiZdhKCpCQuuGED4tg8IACmEI
         Rm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=kzI/KG/c7APIE0vhxUzCFaRe1PYbby2V0jlVV8MFpi0=;
        b=mDYZuBIQfdBEPIkGznMt7SyRg/SvfV/mmxL8BHBWXCmbsdX+cgG/ngbZuUd5jbqDm1
         RoKwuKVd1rbftcgru6FWM2Mx/jwCgeM3774Y9WmVs6hLgFUxR3eR/KYebYFDi6H/LeJ3
         brCtcnAf7Wb5VrzA8n/LHy6UkNTOG9uRu1OH8pY2/1IawS0sOOpbaUqxsYKFE02n4dpN
         WM1sAMdLSQ05RvnxrLqn8XVDoNvBDh/QABdkUa2duItsQJ9xl2oC+zydkTc94swcQT3K
         iTMn8PW66qC9kv2md2Q9W4STWLnJU4IuBVzJeS/GkUl2mc4byb+MD5MxZ3GGAy/QSArn
         KqGA==
X-Gm-Message-State: AOAM531i2vl/TEZN7nQHDvZAT19Ej+rD9WDrN8cgEyZR/gdXYTzag90R
        8wKgy4Ns9+cdf5THwkCrwXQkxXCoi8M6jivkr+3g6jo9IFt1Zg==
X-Google-Smtp-Source: ABdhPJwc4qAimQ9MunqX0mEODhajcnH07G+jAqB3s9FzNrNx94KSxDewGLT/Hy2ZnugdkYQfbrF8UKNf9tIsGQ6VzO0=
X-Received: by 2002:a37:9d12:: with SMTP id g18mr13247110qke.199.1621618971468;
 Fri, 21 May 2021 10:42:51 -0700 (PDT)
MIME-Version: 1.0
From:   Hanqing Zhao <ouckarlzhao@gmail.com>
Date:   Fri, 21 May 2021 13:42:40 -0400
Message-ID: <CAKmvQ+WEAFJCAn2my8iRUZBDvREExsFCydUxZxUxfSV51MK_Uw@mail.gmail.com>
Subject: [KernelAllocator] Usage of GlobalAlloc
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

While implementing an alloc crate, I intend to pass custom parameters
and extra parameters such as
memory flags (GFP_KERNEL, GFP_ATOMIC, etc) through the `Layout` parameter.

However, the current implementation of GlobalAlloc
(https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs#L13)
is not actually used,
because the kernel allocation directly resorts to `__rust_alloc`
( https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/allocator.rs\#L34),
`__rust_dealloc`, etc.

In this way, it hinders me to use the `layout` parameter.
Is this intended or avoidable?

Best,
Hanqing Zhao
Georgia Tech
