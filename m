Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71CAC433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 00:13:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EDE861178
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Apr 2021 00:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233916AbhD0ANp (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 26 Apr 2021 20:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232022AbhD0ANo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 26 Apr 2021 20:13:44 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE31C061574
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 17:13:01 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id a22-20020a05600c2256b029014294520f18so1546927wmm.1
        for <rust-for-linux@vger.kernel.org>; Mon, 26 Apr 2021 17:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7Bp/F7Cf22qcTzexcJJ1ORMiz6P1X83v6J45elCCSVU=;
        b=fJimkuLF2QWa1EpFVTLPz7fJ4KtEi44+4H/3ApsqbZaTronmi/H9QEw3ENvCikp5YQ
         Usj7UfgVM6u6TI4dBrc+UYDI9+cxh6SKrjAesJwzRSTqAyTkoEAXmDnr3JXZ/1OcqsYX
         mkMTz7Rmk5T7qT8cN29CsLtiO5Fgp1hmR//GXbDttHxR/XpB2WUGdUglur0bnFp+Imy0
         G4LsueJRBh3uoQLyW1hfPOTzb7GwDVW7wRsfDJhpm/IH/WpqM0wZanrWSAHCzzG/oZgB
         l/i5dE8Fl/MAP4FRTeWPbJbcQFapc0cvwAyOg4L6/ip6iBBGn5xtpU/g1NQM8sZi8eCr
         P0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7Bp/F7Cf22qcTzexcJJ1ORMiz6P1X83v6J45elCCSVU=;
        b=ZVBoIYTREFsM268McIxKebp3HDAx5mkvR2Key0N/cSxP7zJQS5Vhktv5eNxpZK34Rk
         Osccln5c9XUWo6H8LpnbJYfxm+7Gi1mfe9XNkoFoOpQDs16Q7AnkDmmbrLjJhDVSeIHE
         IUZLVhFbMpyyzxhitIpSrMNY+6zqk6SzaoLsPRab52obzvSNJ46kGVRiYVGUeMyqh/ub
         DFACx17YDZeY4B6ZCMqhE4vDvtR9UO3UDFAoI4gPbQ5hGdJB2JVl2FGhM4kggssJF3OL
         qjVmSodgivYicZuou7P3KZpeCIq6Xr9r8XX1eVp8sXTTAfc8vknIpWi00Ohh8i83kak0
         t6oA==
X-Gm-Message-State: AOAM531kAqM7rqhxpg3ogooqL1/l5XjvQTWEMwbHsSOVgZil431IyZWL
        vX2thV/x4PWSQW1odJLmUGhM
X-Google-Smtp-Source: ABdhPJyGQDqVPbbB3X4Ta7yjIOFqmvm6WJqy2ORbjRDV4ef72QLMqck8Xii9UmNgtCp+T1PnHk8iWw==
X-Received: by 2002:a7b:cb85:: with SMTP id m5mr1348448wmi.53.1619482379801;
        Mon, 26 Apr 2021 17:12:59 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:12fe:7da3:d4af:86a4])
        by smtp.gmail.com with ESMTPSA id r13sm2251536wrn.2.2021.04.26.17.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 17:12:59 -0700 (PDT)
Date:   Tue, 27 Apr 2021 01:12:55 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Carlos <carloscarral13@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: Exposing semaphores
Message-ID: <YIdXB88mPZ6alJix@google.com>
References: <YIdUf1C5VtWn/D2G@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIdUf1C5VtWn/D2G@localhost.localdomain>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Apr 26, 2021 at 07:02:07PM -0500, Carlos wrote:
> Semaphores are the first missing primitive that caught my attention, and
> being such an important part of the kernel itself, I will make exposing
> this functionality my first priority instead.

If the semaphores are used only for mutual exclusion, then you may want to just
use a mutex or spinlock that are already there. But that's only if you're
primarily interested in getting a rust scull to work first.

If you actually want to implement semaphores, go for it!
