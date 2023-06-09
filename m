Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A79A9C7EE25
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 13:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239895AbjFINMF (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbjFINMF (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 09:12:05 -0400
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A4DB1A4
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 06:12:02 -0700 (PDT)
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5147d242f01so2243331a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 06:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686316321; x=1688908321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6FYf760aDIFMjExdvm0ecXDGk1sh7cV64WKqG9avAX4=;
        b=RWIdiEPso96mMUlCjirIZY2BndghmnoDXg5gLc6UBf1aawDlQj8CxzLLe2B4wvy86Q
         MuPJX0uuDz0o63mLEmHliE7C1egC3sNb5sqhwKdcOianhaztJvDIjiTSNQ9Rntgkcfa4
         iQ3HqjHb/37CEu1nJhVRLf0bdqNBjtxLGqvb9OruTqcmRl/xt61JjrBa4N1ho4tSjlpx
         nYaMpaZHpCEShDSX5SFOd0X0UWjTHwtC89wOwIPxobwyxMmb7WQi+t/mlrt/ygiEvDau
         EpCBUHeySPznFmBvslXz9eLbqyn5/PQx1uQvlI/LcwlI323fm8DoObdDOQTTMOi5haCJ
         yDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686316321; x=1688908321;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6FYf760aDIFMjExdvm0ecXDGk1sh7cV64WKqG9avAX4=;
        b=dzLLT4Cagw8dbNGPZILEMDiPogCDWbUviM056H+eh1sBBXuzaEHeLgaqEQWxz/HenK
         OUoUsuhjngrf5xMYzlPWSvjgnQd07lCYd2X5yU6TxH50G9CCurDFkTHOz2HKXY28sgl1
         caDIR8lVgtVUqkJ9v3g+uM3tQNYm0Gt8JUDXlTtZG+DVAhiuxMLMtrGC5DLY5FR2ljHz
         9XdoSgv8nDtvyiNIjP8yD+3CPreq1qpD/U8xHhUk8eDOrWBq5+4ypMjX4fCc5KM7AY0c
         C8vOWLymvaQeD04xXilt/1dLeUeIprUdT2godEcc28X6/Sc8AwT8xs5b/b3IG5wXhWFE
         M5ig==
X-Gm-Message-State: AC+VfDyXBJUdZeIO76Wqte08/kAbUdVRMuqLV6E/6yaUuX5hPcgamNyl
        8YtogYmgLUyoMiVsVS1EW25YnXQ+G54C4wc=
X-Google-Smtp-Source: ACHHUZ7AJ2lgOzMELsua//vN9EWR4eoi6XUlXB/NZOPBlbDFvevD3mZSQGDQ8LvTE1lvXY8bV1FxqsVhgA64hwQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:a40c:0:b0:510:b26e:9901 with SMTP id
 u12-20020a50a40c000000b00510b26e9901mr623812edb.4.1686316320838; Fri, 09 Jun
 2023 06:12:00 -0700 (PDT)
Date:   Fri,  9 Jun 2023 13:11:58 +0000
In-Reply-To: <01010188a025632b-16a4fb69-5601-4f46-a170-52b5f2921ed2-000000@us-west-2.amazonses.com>
Mime-Version: 1.0
References: <01010188a025632b-16a4fb69-5601-4f46-a170-52b5f2921ed2-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230609131158.1646249-1-aliceryhl@google.com>
Subject: Re: [PATCH 5/5] samples: rust: add dummy network driver sample
From:   Alice Ryhl <aliceryhl@google.com>
To:     tomo@exabit.dev
Cc:     aliceryhl@google.com, andrew@lunn.ch, fujita.tomonori@gmail.com,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

FUJITA Tomonori writes:
> On Thu,  8 Jun 2023 08:22:25 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>> fn start_xmit(_dev: &mut Device, data: &Stats, mut skb: SkBuff) -> TxCode {
>>     let cur_packets = data.packets.load(Ordering::Relaxed);
>>     data.packets.store(cur_packets + 1, Ordering::Relaxed);
>>     skb.tx_timestamp();
>>     TxCode::Ok
>> }
>> 
>> My understanding is that (unlike `fetch_add`) relaxed loads/stores just
>> compile down to non-atomic mov instructions on most architectures. (But
>> I could be wrong.)
>> 
>> Of course, this assumes that `start_xmit` can only race with
>> `get_stats64` and not with itself. Otherwise you will lose updates.
> 
> Hmm, the official doc [1] says on the Relaxed ordering:
> 
> "No ordering constraints, only atomic operations."
> 
> so I expect that fetch_add() always gives an atomic operation. I
> assume that the ordering argument is about the ordering between this
> atomic operation and other operations on different variables.
> 
> I tried to compile fetch_add() with Ordering::Relaxed and looks ok,
> got `lock inc` operation on x86_64 and ldadd on aarch64.
> 
> [1] https://doc.rust-lang.org/std/sync/atomic/enum.Ordering.html#variant.Relaxed

Yes, `fetch_add` definitely gives an atomic instruction. I was referring
to the `load` and `store` operations.

Alice

