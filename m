Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6D10C54E94
	for <rust-for-linux@archiver.kernel.org>; Wed, 25 Jan 2023 17:49:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbjAYRtS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 25 Jan 2023 12:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236095AbjAYRtP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 25 Jan 2023 12:49:15 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8710445F46
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 09:49:14 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id 188so23983802ybi.9
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Jan 2023 09:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iNUgTTWkhbC3LwoZEHDVFpS4dso89vLAA/nNQ0uxNkE=;
        b=Qo0TIbO31+67CHjk8Kh0PqFUGQ3gL4g81Hhx1wyW+WE1PdLjhJkYDTlUSelaC9CJU5
         cXRdDa87ZXmymKuqrKq3a7skVIhqd60xFGDD+9ftmGN6pg8mSPLvvuVjBp8DePUo8cW2
         Ww6PNojX/uvsMMFqN5aW8LqP66PgBTlvWrtkc6UkHnl0mbJrP7v6C1GAkTZoPO9uyy+e
         NAUNRa096/RxYnPugPwqUaKlHCk5ZTnaT6VgpBx+S31f2afFLw5HahbhM+Q+Jm8f+3bT
         rHN5ZqPhMIjDE3USoMO4R1yVdDpBu0AygzwtbT86gdFrsF97TgFdpy4/sw5XhAc73t8j
         erSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iNUgTTWkhbC3LwoZEHDVFpS4dso89vLAA/nNQ0uxNkE=;
        b=kUIosXmwVEyqkyTgii3xLjggIO63mj6tHLbNl723vNaLX9bjmCVw63U0Go2tYNWuxP
         T6+9oHhjeM23A0Z9ocRFB08xobnHA7/Yl+euwGP1Pxo84JShhviwtE/gDj1gcvgU1xKT
         c1bwk+9qK1MrrxIhW7TDZHDrVYeKWqWSZ34Pkqy5U+Q8hSiwwSyYu02xVlmxIEVirxA2
         5rpBOPF+Fmg5KeWrkdfQS5G+4QP3HQ/idd3rxDQg+BDCnrqNmBREgXg6M5/JB/xrnckX
         RtmZSKKfdZqvpiF/6zda5MDY/fMwmZysGodbpfzXv1H4Z4HQz17puYqkZmVQ0ouvvXNh
         ZoPw==
X-Gm-Message-State: AFqh2krOVZ3GB+NU2DlcAP61nvGBPcJ9B+gMotqEr9oTqnN5E7md8GfG
        /LdAaas+6m88wzmXZAuVrhgs4UcIt1vnznShI174aUkHstdFhw==
X-Google-Smtp-Source: AMrXdXsJ421XTeD0+AhSQGtGM4uwa/NMoBDB9AiarskjVAH/JNNAC6EHGRtAdggrjLKxl/jKtQYk5TTySd5oCccDBPo=
X-Received: by 2002:a25:8d06:0:b0:7b4:bdd7:e631 with SMTP id
 n6-20020a258d06000000b007b4bdd7e631mr3551099ybl.507.1674668953753; Wed, 25
 Jan 2023 09:49:13 -0800 (PST)
MIME-Version: 1.0
References: <20230125163739.3798252-1-Jamie.Cunliffe@arm.com> <20230125163739.3798252-4-Jamie.Cunliffe@arm.com>
In-Reply-To: <20230125163739.3798252-4-Jamie.Cunliffe@arm.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 25 Jan 2023 18:49:02 +0100
Message-ID: <CANiq72nxBAN5r=ZTWGLXgv5bsQGRoP2oOHx5gUsGqHLC-qK9tA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: rust: Disable neon and fp target features.
To:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jan 25, 2023 at 5:38 PM Jamie Cunliffe <Jamie.Cunliffe@arm.com> wrote:
>
> Disable the neon and fp target features to avoid fp & simd
> registers. The use of fp-armv8 will cause a warning from rustc about
> an unknown feature that is specified.

This would be https://github.com/rust-lang/rust/issues/96472, right?
(if I misunderstood and it is something else, please let me know!)

> The target feature is still
> passed through to LLVM, this behaviour is documented as part of the
> warning. This will be fixed in a future version of the rustc
> toolchain.

The cover letter had the link, which could be nice to have here in a
`Link: ` tag maybe.

Cheers,
Miguel
