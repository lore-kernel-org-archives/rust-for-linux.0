Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFC7C7EE2E
	for <rust-for-linux@archiver.kernel.org>; Sun, 11 Jun 2023 17:48:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjFKRsS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 11 Jun 2023 13:48:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjFKRsR (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 11 Jun 2023 13:48:17 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A3F187
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jun 2023 10:48:16 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-bc4f89f0f2fso1618239276.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Jun 2023 10:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686505696; x=1689097696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VzoGNa0EwDmFXGs+sD8CbxNLCfUp/FCTOi7J91TnjM=;
        b=hbs7KyLoSjcSExIkY9NhYFAR3nSXuxisAOu/3hxouje3k1qtsh7MdkV5CEPDn8W7NY
         V4gvvYssQN9Mwu2hRMBctbNN3am4Q0nhuoNzMbSlFbzyH9ODXlW1Lc75k/LvP8LM1Gtg
         FIizBv09QKluVOmaPtaD4W+E/LmZfAWwBarin/AHUe10+H7A+FmKb+wE52pYzsnOncDq
         +jTqydzeJgK793qzb2JC7/kigaE2sU+coxBKNBOXkjFgxjEuq+BH4FU+kMINYezP07bn
         IF7uMxkUeicOL1ZlB9UVQuVVRGsfzhpFJYgZKXWuuQI8dI9rR/KNaHJQ/HFabH2PFn4a
         Y1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686505696; x=1689097696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VzoGNa0EwDmFXGs+sD8CbxNLCfUp/FCTOi7J91TnjM=;
        b=WgXrTgEgg3Exh5wfXs61f5ZRR3AIxJc7NaeBEy5gZH5kvLza3B/J0L2i/M+Eq7Vgpc
         i0F69aGQ4/j1s8xckrqz/YJXkvbZlQkMhX9Byq7dabiIhFy0VOGYpjmUMPwi2upk8MYF
         SmBiVRW/kRf7EBmPdb7IXxQCSukJgBDVEKQKkW5d2ExGVVmqDLIgauh0JiEEGG0g/BZe
         o+AM+PSK9iyMjF479ew4q8IOATrL6x67dyGlwkycFsJ/oi7Xup3xRRcofSkn4wkESyYb
         FXElYRXJVeqfRHoRv0bDIUhj4jYlCSpC9NyYTIpUruRcspzco0rrE4v2iSqG+0S6Xlnf
         6hOw==
X-Gm-Message-State: AC+VfDwkMq1aCz5b+LF9fH0poJbR/Ke4J7ksmLXFTbNJuvlB63vasmX3
        xHJuS4c2adwBx0mW4+icL8jSQRhr/ur7LwQAEY0=
X-Google-Smtp-Source: ACHHUZ71EO5T44xBUaaDKnfEceldeOesu4t7HBG+eIvBO+vT7qaH97nK98XuN6qf6FvsgXFj0x8hVGynWnD6M49p4mo=
X-Received: by 2002:a0d:ca46:0:b0:565:beb0:75b4 with SMTP id
 m67-20020a0dca46000000b00565beb075b4mr7421436ywd.49.1686505695708; Sun, 11
 Jun 2023 10:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230610071848.3722492-1-tomo@exabit.dev> <01010188a42d5319-9cd7b5ec-5b06-4d08-88cb-c2a82a8e3a0d-000000@us-west-2.amazonses.com>
 <18368b79-f204-4bc2-b591-859d3ddb22f1@lunn.ch> <964b5c9f-6eab-d7ff-1ce6-dc11f15898d4@ryhl.io>
 <1d3ade6a-1333-4729-a8e1-13e2aceeeb12@lunn.ch>
In-Reply-To: <1d3ade6a-1333-4729-a8e1-13e2aceeeb12@lunn.ch>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 11 Jun 2023 19:48:04 +0200
Message-ID: <CANiq72kyUhvmG6KB32X1vuhNzOOJbs7R1JbK+vnPELX4tG73RA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] rust: core abstractions for network device drivers
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Alice Ryhl <alice@ryhl.io>, FUJITA Tomonori <tomo@exabit.dev>,
        rust-for-linux@vger.kernel.org, aliceryhl@google.com,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        Andreas Hindborg <a.hindborg@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Jun 11, 2023 at 6:01=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> Ah, thanks for the explanation.
>
> This is going to be a problem for networking. The hot path has a lot
> of inline functions, because a function call is expensive. So there
> are going to be a lot of little wrappers like this. I don't want to
> encourage early optimisation without proper profiling, but at some
> point you might want to replace these wrappers with Rust, using
> whatever its equivalent of inline is.

Yeah, other use cases will also need that solved, e.g. Andreas for his
NVMe work.

We discussed reimplementing performance-critical bits in Rust as you
suggest, as well as cross-language LTO. We also talked about possible
alternative approaches like "manual local LTO" for the helpers only
via feeding their LLVM IR to `rustc`, which may recover most of the
performance without having to go for full LTO and its associated
kernel link times.

Cheers,
Miguel
