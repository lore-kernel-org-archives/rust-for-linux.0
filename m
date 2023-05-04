Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871FFC7EE21
	for <rust-for-linux@archiver.kernel.org>; Thu,  4 May 2023 18:59:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjEDS7C (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 4 May 2023 14:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjEDS7B (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 4 May 2023 14:59:01 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A7334C07
        for <rust-for-linux@vger.kernel.org>; Thu,  4 May 2023 11:59:00 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-96598a7c5e0so142218566b.3
        for <rust-for-linux@vger.kernel.org>; Thu, 04 May 2023 11:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20221208.gappssmtp.com; s=20221208; t=1683226739; x=1685818739;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=5Gnpb8Pit9ODAQa/Dl7YsN552lqqxPpumkkQRUQtbno=;
        b=gFxUXXv74ptlEz90pPEpPK/SWJEikKvKD/UjZFkDR5Y1K+cPsbQK6zF7NXWxsS96pJ
         aY8rVOAwuzAH7feAtshqmAvfAOslz4PvTyiCbT6bSTK6LUkyloV1MXl6oCqKuHBtf9ia
         gZHMdEiiTtJZRjaLV7St4BOeYT9ZF60YUxPkOsio8bDOMCt7Lo43mXCMUJQfvzOILhyL
         xzkyvpibU9t5qYLtFbqyew/ai7jV0ycgnXnjYnuMZ8ae6ltJV46szGZsekHfUXWtpZbA
         B/a9Ldb2QMbBzhGkw+DelMLRT2H3NZ/fV4ZrHFbYVLa3za2eAHjup4gMF0K/eI26wOoc
         sphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683226739; x=1685818739;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Gnpb8Pit9ODAQa/Dl7YsN552lqqxPpumkkQRUQtbno=;
        b=f4lSmdF4/4i5C8U6vqeGJ+QisExmEcsuaC/RUQ4Yf6QrYNy/pWt6Iz7e+zCy2Q1rTT
         eDCqP9Eve8yk7a2XbgArq49c88R0FsFaNLRozWl7M/KMSwibUbtzYLTTfhMn67p/iOCX
         8fGtgTOrjrDTTJ5VLz7RiWcfZo64zuuE2MDvIc0AqfdcrD9mA9Py8nX8JmFEqJJHMC5n
         uRVXin1UcJLCbbRwC5H1bws1mTK1mKQjQA9p1430EN6/GSicoQQb95OvdNvB9E5h1U0e
         97otKb5G+kQOidZgVSDWDUWKB5hld28wSkJQayf82rzpbsNoqkmEt6SmySCdiQjg3SSA
         /n7Q==
X-Gm-Message-State: AC+VfDxT4yL4QzMj6fLsCU5Mqqod/gJqHTYIUeN9kCyj7XdB24zVacC4
        liraztnJ0N/Y8pJMPUeca9RPng==
X-Google-Smtp-Source: ACHHUZ7brWhm7CLYDsOZJTQscaZ8hG+0gbAUXFqR5sBWrv85AvVFR38ZNrkAtrPNgicnV1jQ+2tyZA==
X-Received: by 2002:a17:907:2ce2:b0:8aa:a9fe:a3fc with SMTP id hz2-20020a1709072ce200b008aaa9fea3fcmr9416573ejc.8.1683226738785;
        Thu, 04 May 2023 11:58:58 -0700 (PDT)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id h20-20020a1709070b1400b009658f5a90d2sm1834778ejl.189.2023.05.04.11.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 11:58:58 -0700 (PDT)
References: <20230503090708.2524310-1-nmi@metaspace.dk>
 <da7b815d-3da8-38e5-9b25-b9cfb6878293@acm.org>
 <87jzxot0jk.fsf@metaspace.dk>
 <b9a1c1b2-3baa-2cad-31ae-8b14e4ee5709@acm.org>
User-agent: mu4e 1.10.3; emacs 28.2.50
From:   Andreas Hindborg <nmi@metaspace.dk>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Keith Busch <kbusch@kernel.org>,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        Hannes Reinecke <hare@suse.de>,
        lsf-pc@lists.linux-foundation.org, rust-for-linux@vger.kernel.org,
        linux-block@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?utf-8?Q?Bj?= =?utf-8?Q?=C3=B6rn?= Roy Baron 
        <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
        open list <linux-kernel@vger.kernel.org>, gost.dev@samsung.com
Subject: Re: [RFC PATCH 00/11] Rust null block driver
Date:   Thu, 04 May 2023 20:46:35 +0200
In-reply-to: <b9a1c1b2-3baa-2cad-31ae-8b14e4ee5709@acm.org>
Message-ID: <87fs8budn1.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org


Bart Van Assche <bvanassche@acm.org> writes:

> On 5/4/23 11:15, Andreas Hindborg wrote:
>> If it is still unclear to you why this effort was started, please do let
>> me know and I shall try to clarify further :)
>
> It seems like I was too polite in my previous email. What I meant is that
> rewriting code is useful if it provides a clear advantage to the users of
> a driver. For null_blk, the users are kernel developers. The code that has
> been posted is the start of a rewrite of the null_blk driver. The benefits
> of this rewrite (making low-level memory errors less likely) do not outweigh
> the risks that this effort will introduce functional or performance regressions.

If this turns in to a full rewrite instead of just a demonstrator, we
will be in the lucky situation that we have the existing C version to
verify performance and functionality against. Unnoticed regressions are
unlikely in this sense.

If we want to have Rust abstractions for the block layer in the kernel
(some people do), then having a simple driver in Rust to regression test
these abstractions with, is good value.

Best regards,
Andreas
