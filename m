Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A8BC07E96
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jul 2021 17:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91C8961C5F
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jul 2021 17:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhGFRV6 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jul 2021 13:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbhGFRV6 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jul 2021 13:21:58 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED32DC06175F
        for <rust-for-linux@vger.kernel.org>; Tue,  6 Jul 2021 10:19:19 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id f20so12187402pfa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Jul 2021 10:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student-cerritos-edu.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=xrzFBTAq0ZKpdWfndQXJn/n+uFOiH53JYTB36xwFHPI=;
        b=ZncqXsqcvHdTLD4Kn9PKfU8uuQ+kXHFxqo4EFylSfEocm1dleZ/KJwgkydezr15fic
         qdlfALe3BrYKGY2g646R0I8Ak0aOLLw+HOhRHfJ+CO2Berol0AfnZ/HpvpSzj6TXGGyw
         Q1T+Nvi3pUt+2MqYcRw5f5fX7RYd0Qe7OF+A5yuyvS1cQrdfNJ3XTGt19iwnXwT4m2gY
         bGjjPi5OSuIJpprH5WbTekvlgsCYtAr8Nh6x86BOEkPAKDN/g9A4P2OVROgrSqBOYBfG
         nEtiGC/COpQtAI83zbGnGWOhidYpXHGW6V4yCy/ERYIhs5GVlj7Jt1HCuojgP2lJsBNX
         tFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=xrzFBTAq0ZKpdWfndQXJn/n+uFOiH53JYTB36xwFHPI=;
        b=i9Vs8hYRdMMie4pNHylZDfXkYXW+0iC3+DPSrZSttjrtt6jmtlWkKQ8qWLyw5HPIvT
         MY5N9vqkwR+Si+OMgIbkagjPq5sXS2XpVq0B+MVF2L6PNB3AJizsGp2fUZPhbb7cZaSK
         BDjYAAOBQURHWjh3guoy6UgLesJHa96rrznAXPImsmKB2OHpxCGtd556LO866+uO44uY
         K56QWy24wwXxgPSLqYmxmlGWtLh3IyapLrF89H8bPUIKDOaSz5uDnSroDcDJLpzrhMr1
         hdXR14SRongBWMXRNBLuRRH6NWaF+RP2Mc7qRWVYb4ol+/iheqHzqBw85I2yY8wjlv2O
         yiWg==
X-Gm-Message-State: AOAM532enseSNG0MW/56x7dM3v9t9Dk/xfQuShdinxKIvommrDTONBkP
        SF15drt3I9aF87JPdSNIPvcJHpOT6R6h1Q==
X-Google-Smtp-Source: ABdhPJz7qF/coKcAy2FjCCnPpSDWnkVv8iiO65V0gwlE4zTua7GAfGd1avDGYwEsOQdlAJzEYmewhg==
X-Received: by 2002:a63:471b:: with SMTP id u27mr22395332pga.301.1625591959111;
        Tue, 06 Jul 2021 10:19:19 -0700 (PDT)
Received: from [192.168.0.133] (066-215-081-126.biz.spectrum.com. [66.215.81.126])
        by smtp.gmail.com with ESMTPSA id j15sm17232996pfh.194.2021.07.06.10.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 10:19:18 -0700 (PDT)
To:     linux-newbie@vger.kernel.org, rust-for-linux@vger.kernel.org
From:   Amy Parker <apark0006@student.cerritos.edu>
Subject: Assisting with kernel Rust development
Message-ID: <f2f6fb7d-18cb-3256-b6c3-2d09905b02ca@student.cerritos.edu>
Date:   Tue, 6 Jul 2021 10:19:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hello!

My name is Amy Parker. You may have seen me on the kernel forums before under my previous email address <enbyamy@gmail.com>.

It's been a while since I've attempted to contribute to the kernel, so I figured I'd post here. My previous attempt had been under Matthew Wilcox's direction to modify the DAX driver for NVDIMMs to use XA_ZERO_ENTRY to represent a zero page instead of DAX_ZERO_PAGE (allowing us to save a constant) - but this failed since the ascending values of other flags conflicted with the value presented by XA_ZERO_ENTRY.

I saw the recent patch sequence adding Rust support to the kernel. As a Rust developer, I figured I could get back into kernel development because of this, and was wondering how I could help. Are there any active objectives that need work?

