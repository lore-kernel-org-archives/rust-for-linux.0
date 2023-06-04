Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B2BC77B73
	for <rust-for-linux@archiver.kernel.org>; Sun,  4 Jun 2023 12:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjFDMsn (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sun, 4 Jun 2023 08:48:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjFDMsm (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sun, 4 Jun 2023 08:48:42 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21A7D2
        for <rust-for-linux@vger.kernel.org>; Sun,  4 Jun 2023 05:48:41 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-97463348446so195371866b.2
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jun 2023 05:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685882920; x=1688474920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5UpSkDtLnO354B314XqylFBgqeHDKm3Y6CMJYvuh++Y=;
        b=gJRYK8+Bx87YZoXli6ZSuMzvl6RQ7WYWo+Jyo0Zh0ZRCigz4rBmc8EslvygW6QuLEn
         4tso3/yOE/qIkyxq5mkHGBWPN2UyGbIdDAGmtChNFneRRo6q7oCWcdPDHLVCnr0Zlt4H
         Dc0R3sfF8kplVoFBLqht4P51DJM/TV3gOwOyG9Ph0DL3LNNZR5JrNRlvXLq5WLrUmQ0g
         gwCLguSiwgIZEx7ngQKE0S0duEiDg7lihrXSTEaP28+7RpcESRjjkxggDq9J6zGxvWUS
         u+XQ+Ap1aqXqauYw1Eh35vMXkRTXXwOGaQA5xN6tffW5AiVq0UThNhuecn4BrOB1b+Jr
         rzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685882920; x=1688474920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5UpSkDtLnO354B314XqylFBgqeHDKm3Y6CMJYvuh++Y=;
        b=WNquUrL+fKoZj8VQhg0mk4wVReSzrKROjv0Z8U//7/x2LcM7TTmHzZmUq9KKoKS0zi
         BT+KUOouY0zipeMwVzFUGjdJNExDBrhXnW4a5DICQd6EPQ3W8s2IVkggqTMrD6In1LSU
         z+wtm+TwFnJZpnSAYLLhs6uulPIxYXl3UUwXJwYSIFKDZjUCnDrfix3hvE7MOAvsZ/hr
         io4UXJ46zeSVo22nwXcfvysdSoRmZYgiWhIvHZbZTE9UyFbGGcgvF7RVcHTTVWk5taHn
         RIsT7Npn3YkWaF6jbbH8RjFWKc/hjLAa3fEiTIbIm+whbP28lxfHYZueeKQNux1vdaaJ
         PDIA==
X-Gm-Message-State: AC+VfDx69UEHn8BpKkXfeFWfkaVeRU/qWEv3ruybz8eOfQzncUaBoJ99
        A4t5G0fUIGevXI1YYp/JN6T1GftZPrIFpl8=
X-Google-Smtp-Source: ACHHUZ4Etc6PgAdWF4FpxPOaXiPrfnFdsXDk9sgxjIekuA9cR6C6dVL3vpR2y1QiEw5y2v8PGDHASl95L0O3UgM=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:761b:b0:977:d0a0:be8c with SMTP
 id jx27-20020a170907761b00b00977d0a0be8cmr645599ejc.1.1685882920329; Sun, 04
 Jun 2023 05:48:40 -0700 (PDT)
Date:   Sun,  4 Jun 2023 12:48:37 +0000
In-Reply-To: <0101018884325bd2-663fb619-646c-46f6-96d8-769e87a469cf-000000@us-west-2.amazonses.com>
Mime-Version: 1.0
References: <0101018884325bd2-663fb619-646c-46f6-96d8-769e87a469cf-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230604124838.1381423-1-aliceryhl@google.com>
Subject: Re: [PATCH 4/5] rust: add methods for configure net_device
From:   Alice Ryhl <aliceryhl@google.com>
To:     tomo@exabit.dev
Cc:     fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

FUJITA Tomonori writes:
> +    /// Sets the name of a device.
> +    pub fn set_name(&mut self, name: &'static CStr) -> Result {
> +        // SAFETY: The safety requirement ensures that the pointer is valid.
> +        unsafe {
> +            if name.len() > (*self.0).name.len() {
> +                return Err(code::EINVAL);
> +            }
> +            for i in 0..name.len() {
> +                (*self.0).name[i] = name[i] as i8;
> +            }
> +        }
> +        Ok(())
> +    }

You should use `name: &CStr` here instead because you don't need the
provided string to stay valid after the call.

Alice
