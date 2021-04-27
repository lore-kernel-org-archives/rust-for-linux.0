Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECFEC433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 15:20:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A34FD610FC
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 15:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbhD0PVE (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Apr 2021 11:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235659AbhD0PVD (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Apr 2021 11:21:03 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B3A6C061574
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 08:20:20 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id k14so9958348wrv.5
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Apr 2021 08:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=SigWeWp1YMrBz1j3jzYM3JaMXVFx7QRyejs8uDgc9uY=;
        b=GMFYBlDJYh9qQ8GtLUn+hX506DkSshFzWTGzhaVxOf5HbULJfOsSAnWBy5rpI3aA7c
         o8q7Kb/XawB4Ti5aWz8owxTYXdkZOKPna3sJJSkAovmeEZDbaV1pTcUSD0TVMTp3WW/H
         Hf5IO0IJ/9IhefmBgI7KtXRAFs2bDQpVk+//rAxLrVGY/VGqnQbfxMV7Y6TnzVCQP+Vs
         8SRbWlzqqk8pY6pOJW5sS43C65R59SIJm9k6ZqUWOz/xzG/WJVdF0pMtKz4kD88nmjsE
         W4jvyZNLATHyXZ6JSYMGIQABDMtV3dVdhR8xeEE4o6G+IPUqYu+J0xr3b7nvw+loLx4h
         BKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=SigWeWp1YMrBz1j3jzYM3JaMXVFx7QRyejs8uDgc9uY=;
        b=f7NrXKNrv5NEfe61cFrA6GZp7yFJPSO8Cuj21RV1NRZxbJCDKMQMfNcUOK7JQfx9ZT
         uppHy1YKqTuLXF9KhBYiFSAQR3zY8FMKNTOJ61IEgc1quc7kcvq9hl3unmlzLFoqiQsj
         j5W2nYWHqi9CzcjhW9ak/4gY11DfAgg63Ft0B/oGv8ve1o47GRzAl0yhzgsrj0iPTKN7
         1dkkfmObc1RVPf0umB7UExex9eVKy9/BNPNhPPlmA5o35spoCVIyLV7rEt1yAuMOFKRC
         rIBnuu7ee5b2yfGteUVEIcCsyeki4ruZXkhCOn/A/CSRPbon7XTVj98jDMeioftxBA1a
         2MqQ==
X-Gm-Message-State: AOAM531hgGg/DxPgCRbQIz36chKLNEf+e3oYO0fAPe9Se2yv5byfBTYb
        obQcNMTXedw20Pk6YL9t14fWfAa9ukwDLw==
X-Google-Smtp-Source: ABdhPJw9NVCLLppBPWpTWmdgTVW+Op72Z0Q6n1DDTu3ZAFmArwYbvtg7mecOZXekdIB3AljjMGs58g==
X-Received: by 2002:a05:6000:1ac5:: with SMTP id i5mr29902283wry.412.1619536818735;
        Tue, 27 Apr 2021 08:20:18 -0700 (PDT)
Received: from agape.jhs ([5.171.81.92])
        by smtp.gmail.com with ESMTPSA id s6sm3678071wms.0.2021.04.27.08.20.18
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 08:20:18 -0700 (PDT)
Date:   Tue, 27 Apr 2021 17:20:16 +0200
From:   Fabio Aiuto <fabioaiuto83@gmail.com>
To:     rust-for-linux@vger.kernel.org
Subject: Question on Box<T> smart pointer
Message-ID: <20210427152015.GA4653@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

I have a question. There's one thing I miss.

If Box<T> smart pointer allows allocating space on the heap,
how is this behaviour overridden in linux kernel Rust?

I mean, in c we have all API's to allocate heap space,
but using "pure" Box<T> in kernel space what kind of
allocation provides?

If this question is stupid I apologize in advance,

thank you,

fabio
