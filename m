Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1ABC77B73
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 12:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbjFDMs1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 4 Jun 2023 08:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjFDMs0 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 4 Jun 2023 08:48:26 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E0FB8
        for <rust-for-linux@vger.kernel.org>; Sun,  4 Jun 2023 05:48:25 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-565ef5a707dso55837037b3.3
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jun 2023 05:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685882905; x=1688474905;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W2wsh+HZqKbIC4MEyhUQcdl+yWcLfJeLuCNo+bMI0+A=;
        b=0tqsIZBI04LHM/lqCVm7GeQrgV7fhapOi2uApbKHWViyEFq2VdpN9sxaQzWf3FF4E2
         4Kizph830JI4ayNiKam2M+bKTm0pBM3QJRgl6Evxx7Bt6H89QHwlFhlBVRqiVFO6Mpw9
         ruwLBJPzu3K0eMFzeZYmubEX/YXYvJ1JUS2rniZnagpXU6x7qNg/99L2aykVguuR1VI0
         xL2h52qB9CDsVQjENHxm7Esgce4AvMeQJ94WI//442P0CUR5FUrkcTacFKmbHZzxRk5Z
         WIYONz0Ou6diyuWYPXCv+uFj9YW5c2QjouQSWwda8sSSfKrXNf84rBPhhS8wV3YpyFpg
         ijqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685882905; x=1688474905;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2wsh+HZqKbIC4MEyhUQcdl+yWcLfJeLuCNo+bMI0+A=;
        b=aLkoGvthCsKUXlkYSjf+Qiv0gLge9TLUMQbr8xjKQGXcUmubmlBLBwcWKVWcanMZ92
         bxEK8YwX7ycuEGbjsz1AlYKemkQie0/2lDZT4wQS4CFfx1DAsmWaD9UOMjs9AHhBkhFA
         E58Nqj1leaSyEdwo0F5d9d+yFinbzJWmIWTPoC11ri+A6LtBHIHUlQUrmvsQbgQSBndu
         gcgQsJSyIn5ICp4bC4VibtxcjB/wc2DCI25OcMqAv6ILzuJaWrYpem28Ya4No1XVMmyR
         kC9gk87Id7/b0ldinN0kJzacdGBRqZ9Y/Y7QT5bxS151wFeWWgohTys8sxeujcySMNdk
         X8gg==
X-Gm-Message-State: AC+VfDzmgAU++sdeWMn8Oo2posBjq9wQJkEu2wJX73mud78BLi+cNBgb
        TbIgt58XYpDj4Zr1r6TbPczBagRJ8VBOkvQ=
X-Google-Smtp-Source: ACHHUZ5KiA/UMqR5IMIFgRKcVGX5x2j4kH/WklMW4QJd6zgPFzWoI6olNAPbzBbXxR0DLPIy7JD+Fl0NzX7uW08=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:b284:0:b0:568:ee83:d871 with SMTP id
 q126-20020a81b284000000b00568ee83d871mr2875615ywh.7.1685882905019; Sun, 04
 Jun 2023 05:48:25 -0700 (PDT)
Date:   Sun,  4 Jun 2023 12:48:21 +0000
In-Reply-To: <0101018884325a5f-da4bd02e-aab8-40f5-8812-3fce5cff34ae-000000@us-west-2.amazonses.com>
Mime-Version: 1.0
References: <0101018884325a5f-da4bd02e-aab8-40f5-8812-3fce5cff34ae-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230604124821.1380522-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/5] rust: add support for ethernet operations
From:   Alice Ryhl <aliceryhl@google.com>
To:     tomo@exabit.dev
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

FUJITA Tomonori writes:
> +    /// Sets `ethtool_ops` of `net_device`.
> +    pub fn set_ether_operations<U>(&mut self, adapter: EtherOperationsAdapter<U, D>) -> Result
> +    where
> +        U: EtherOperations<D>,
> +    {
> +        if self.is_registered {
> +            Err(code::EINVAL)
> +        } else {
> +            adapter.set_ether_ops(&mut self.dev);
> +            Ok(())
> +        }
> +    }

The `EtherOperationsAdapter` struct seems unnecessary here. How about
using this signature instead?

pub fn set_ether_operations<U: EtherOperations<D>>(&mut self) -> Result

Or even

pub fn set_ether_operations(&mut self) -> Result
where
    D: EtherOperations
