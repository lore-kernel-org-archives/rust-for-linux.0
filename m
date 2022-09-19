Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D95F7ECAAD8
	for <rust-for-linux@archiver.kernel.org>; Mon, 19 Sep 2022 01:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiISB7Q (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 18 Sep 2022 21:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiISB7P (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 18 Sep 2022 21:59:15 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E2F11C12
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Sep 2022 18:59:14 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id 129so28495218vsi.10
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Sep 2022 18:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PDfsRy66YcNThAjGAYN2NfGkWNYHb2if5awrhYx3Xf8=;
        b=BG/A/sYkkaQWt6omaWkFEN7mVISxTRmpJztqwgKbNwwweXYJLZuEJS7WT50S5f1ros
         sg699SLxg0hFHGdfyU6f/pDu7DEcPIDMFDqwjddQXiwb2sov8ReUvd1i3M4AKUuGmuas
         FOcqho4Zv0VN++9B5CJ6XG43MeTHa/iRTDzd8st5w0srbSET9yMCeiM8Wv0FoOXmJtd6
         p/ELKvDf0NJMgN0cVe6ZJ0z/wN1Gj+mgg79ZEzkldcWNz4wJMviP9c/NCRsFKhC3hyNl
         10pHayTbvQwH+aWixfMLVO6WXlCRxqbIsi26gXIJY7uPMj3FV3XKbaOLd7mZeRSc2IT8
         vOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PDfsRy66YcNThAjGAYN2NfGkWNYHb2if5awrhYx3Xf8=;
        b=rCpQcgE0ABEb94Trh09sCFNrwheT3F/tjj0bnMZmWeaAYiA4oC0e6tYRFA4luJgPIO
         JLw2btWC1xJqZYk83Oz5qGTrsc7jAWz31ShkWHgcfLIc5nh2DZmrG1sX7RUdp3xO9we3
         ceZ7JKpp9cipMHLGg4P0N+/aGmn9IbZxmzXRoNfY4sv9teYh5lF46tvZknlwqKbzU9W7
         mVbg32T+zHU/vetW+lX8oeWPlWHz2E0erdbVkfgnzFcWR2JCY94+LMfKzODojodhREdm
         wN905I1oqrAg7Qa2AZcZ4n5w7ciohkWyBtpBvQHaGitfkP7jcOpRIGqQKfyYu2ei3EW/
         7XEQ==
X-Gm-Message-State: ACrzQf1QLDmuMqaRErBU+duhXC0RpW1bjo5QQRbDFpgl28OMAeylfKhQ
        6MXB8WymHQQn1EZ7K40ElN9xDvduOLozkX4I/TFuq+z4
X-Google-Smtp-Source: AMsMyM545N9WadGJUCPlthukTSrAcycZZZ32UNeApf8pHbMdRaf2Nf28jnHQXxjYHid6u95oNAAG5zZdalmPEjSALbQ=
X-Received: by 2002:a67:c29e:0:b0:398:73e7:aa27 with SMTP id
 k30-20020a67c29e000000b0039873e7aa27mr5187182vsj.27.1663552753736; Sun, 18
 Sep 2022 18:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220919.103820.680182888079022491.fujita@lima-default>
In-Reply-To: <20220919.103820.680182888079022491.fujita@lima-default>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Sun, 18 Sep 2022 21:59:02 -0400
Message-ID: <CAFRnB2U9EBdRLy0YCdQjCvgHra4T9bB+hrW==5iGWNhS-U7MUQ@mail.gmail.com>
Subject: Re: Rust e1000 driver (Intel Ethernet adapter)
To:     FUJITA Tomonori <tomo@exabit.dev>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

That's great to see. Thanks for your work on this and looking forward
to seeing the pull requests!

Alex


On Sun, Sep 18, 2022 at 9:57 PM FUJITA Tomonori <tomo@exabit.dev> wrote:
>
> Hi,
>
> I've implemented Rust e1000 driver (Intel Ethernet adapter):
>
> https://github.com/fujita/rust-e1000
>
> There are many places to use the C bindings directly for now. I try to
> clean up and push abstractions for NIC drivers (DMA, PCI, network,
> etc).
>
> I can ping on QEMU. Needs a bit more work for real hardware.
>
> Thanks,



-- 
All that is necessary for evil to succeed is for good people to do nothing.
