Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FD2C4167B
	for <rust-for-linux@archiver.kernel.org>; Tue, 13 Dec 2022 01:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234027AbiLMBSX (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 12 Dec 2022 20:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233761AbiLMBSW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 12 Dec 2022 20:18:22 -0500
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE63DEBC
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Dec 2022 17:18:21 -0800 (PST)
Received: by mail-qt1-x830.google.com with SMTP id cg5so10651815qtb.12
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Dec 2022 17:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v1qlp2GTj5x/LkTSxfePaRyJL4fqAt8PlJEzH2bzb7I=;
        b=ZGUcpYl3WCUCAmSbHPOYgGi1Mr5al02m2Riul5cdqCqBBm6zJVef3JRhXH2W8Y5jG6
         2NLH9kWHvaymO8AjwpPGyIo8jcatEiF0ZyMGUCvMGrk+wSI9Pr8vF99Wt5WB3htApnKg
         b4FCWRmKE/gatcP/BuQ5l/zRd3IF5fzPRlbjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1qlp2GTj5x/LkTSxfePaRyJL4fqAt8PlJEzH2bzb7I=;
        b=AZtKb8zzHTQEW/7rw5DLfjbew2aZtxb0ZTBecujgogcrT8IjaK5X9n/hC3PJV0NGy9
         HsaFPuFMW9LdHmANdNFK06cH6dU0yLn+OfZjd0Gds55fnWG2laR5UL9eO1EEWNbv1CK4
         SbTcDzT+zfAgHsm4DyPpr2B6QyK4sFy47HuE29HzAERey6KMIaR/M32D/8B0Cfwr3v8a
         7CWKNXIFppshfyJFs1whxpGijBPVidnAWIMWsl2WmOMiwEgd0JzGLoESVN+3bq3Bt5rO
         +Wm28xtTyX909TWfAHtPkbIcXZQAjQ3LOsEiLn/ep3S4elEammVCmPQm61TcsTK6ffYf
         p98A==
X-Gm-Message-State: ANoB5plwa3jPzU48ZaqOtEKYdlVQEMj1Ji2GnYwQsPnQVpVJHhdFfW7m
        nZxQgLEPIAtlBA/h24GhJaLuQlZ/VU661zku
X-Google-Smtp-Source: AA0mqf4GFUXlDibDZwRDcVdQy7YUh36NmRUY90BFi/1MX8D8M5s+O0DLaGfIXnnIHmPvGwaBAB9FAQ==
X-Received: by 2002:a05:622a:1928:b0:3a6:9c77:eb00 with SMTP id w40-20020a05622a192800b003a69c77eb00mr22721082qtc.43.1670894300441;
        Mon, 12 Dec 2022 17:18:20 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id c6-20020ac853c6000000b003a7e66e5b67sm6717388qtq.78.2022.12.12.17.18.19
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 17:18:19 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id x24so5917443qkf.5
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Dec 2022 17:18:19 -0800 (PST)
X-Received: by 2002:ae9:ef48:0:b0:6fe:d4a6:dcef with SMTP id
 d69-20020ae9ef48000000b006fed4a6dcefmr10621664qkg.594.1670894299003; Mon, 12
 Dec 2022 17:18:19 -0800 (PST)
MIME-Version: 1.0
References: <20221211005609.270457-1-ojeda@kernel.org>
In-Reply-To: <20221211005609.270457-1-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 12 Dec 2022 17:18:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiW=ioE_6N988=fseYLTzaCXaULNzippLMTRTcT=oPa0A@mail.gmail.com>
Message-ID: <CAHk-=wiW=ioE_6N988=fseYLTzaCXaULNzippLMTRTcT=oPa0A@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.2
To:     ojeda@kernel.org
Cc:     Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Dec 10, 2022 at 4:56 PM <ojeda@kernel.org> wrote:
>
> - String and formatting: new types `CString`, `CStr`, `BStr` and
>   `Formatter`; new macros `c_str!`, `b_str!` and `fmt!`.

Heh. You have an unusual habit of using the back-tick instead of the
regular single quote character. It's not wrong, just surprising. I
ended up just replacing it with the regular single quote.

Maybe I'm biased against it, because I grew up with it being a dead
key, and while my current keyboard has it very easily accessible, in
many situations it's actually very inconvenient (ie it ends up being a
dead key to generate acute grave on many European keyboard layouts).

Anyway, not a big deal. Just odd enough for me to react to that thing.

At least you didn't do the thing where you are trying to match it with
the tick going the *other* way (which doesn't even exist in ASCII and
requires UTF-8), which is literally impossible to type without going
through strange contortions.

Or, worse yet, do the crazy traditional "pair apostrophe with
backtick" that also looks very ugly in most fonts because the two
characters aren't even visually symmetrical in modern fonts and often
have different weights.

So it's unusual, and I edited it in the commit message, but it's not
one of the actively horrid options.

              Linus
