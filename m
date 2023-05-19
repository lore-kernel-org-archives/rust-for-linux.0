Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B48FC77B7A
	for <rust-for-linux@archiver.kernel.org>; Fri, 19 May 2023 09:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjESJpS (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 19 May 2023 05:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231484AbjESJod (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 19 May 2023 05:44:33 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B44B1FDA
        for <rust-for-linux@vger.kernel.org>; Fri, 19 May 2023 02:43:11 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-561bad0999aso63801597b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 19 May 2023 02:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684489337; x=1687081337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSbexTpIDWFKTxIj9uHgD7rGvKby6+WkT0yDQfZhD+w=;
        b=0bBmjPkohTtvvlkvia/8urb44+bLMMzBP55rf2YP0+6CbNNARGd/AYaZ32xavtUSZO
         VwNg+G8m7Ye2FG3arr//xXruErVnxHZn5pkJeUtf5GK9WMHSmv3/eTf/OXqy4HQaKf7j
         x7zgUM1hoeZbSgYqGVJfoEnqxMrPYaiRMm1Te40sMKiF09Fykp1SS0rAfwPQAtgs+JId
         QlASrIjFE5qUbHAwYilquIDX0bJgtme1ZSYXY4w81pGKY1tBX6niGvryI/BFvM0dWtQu
         B4eQkuUKv2gooWjtdnKwPOa0m/Vz9SRMij5Yg6IHqZgM0P5EpUq10j6AW/miPcEzvZZ8
         IH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684489337; x=1687081337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pSbexTpIDWFKTxIj9uHgD7rGvKby6+WkT0yDQfZhD+w=;
        b=P/pR9l2eeVb0f8X7y2zNdnVcYvE7hoGCjw/42Lt8xgClroPubOQNqNt0QZfSZUKdue
         edLloV+0h10dyeh11Pf3e26eNklAShaCk7AX3s4KVxe8QamyYjTh6/IxwmE7gnAdoeNE
         xfRUWqT+MFnYGpNgTVSwF2UuTqZAVqXi+vGC47RYWpAC2+YwUe+315zeZ52xX8H6ZF07
         HzDbJR0My/soMqT9ppSDoy8NiGqoh9InrkF7DOsi/Ri/2+GiJPiAeKHU0A6TjfMHULbP
         g45BR9Oa5rkzjXZxq7Vn1tuhWPA5qoip5tP6oiGV9Byd+h2TO+/3DBu/owtwpx67oJg5
         Zivw==
X-Gm-Message-State: AC+VfDz/HLi7XjTkpexYSPgl8kB/AVhrqeHbSYyiikEtaXd3uojSvtHx
        oru/f8nVuxmj0d9QG/AcMXItDjw3qO8whT8=
X-Google-Smtp-Source: ACHHUZ5/SZ/ktbdcdpuHzvlk/gFp5Ebc1vqNkocbohyl/ggFPbbhB79vbjQcakn/l+TC3ggL2hAN7h/T6fE2gmQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:af49:0:b0:561:9091:ff91 with SMTP id
 x9-20020a81af49000000b005619091ff91mr900753ywj.2.1684489336986; Fri, 19 May
 2023 02:42:16 -0700 (PDT)
Date:   Fri, 19 May 2023 09:42:14 +0000
In-Reply-To: <ZGaXdS+psZoEZBMr@boqun-archlinux>
Mime-Version: 1.0
References: <ZGaXdS+psZoEZBMr@boqun-archlinux>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230519094214.3433619-1-aliceryhl@google.com>
Subject: Re: [PATCH v1 1/2] rust: specify when `ARef` is thread safe
From:   Alice Ryhl <aliceryhl@google.com>
To:     boqun.feng@gmail.com
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com, gary@garyguo.net,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mingo@redhat.com, ojeda@kernel.org, patches@lists.linux.dev,
        peterz@infradead.org, rust-for-linux@vger.kernel.org,
        wedsonaf@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 5/18/23 23:24, Boqun Feng wrote:
> On Wed, May 17, 2023 at 09:59:04AM +0000, Alice Ryhl wrote:
>> +// SAFETY: It is safe to send `ARef<T>` to another thread when the underlying `T` is `Sync` because
>> +// it effectively means sharing `&T` (which is safe because `T` is `Sync`); additionally, it needs
>> +// `T` to be `Send` because any thread that has an `ARef<T>` may ultimately access `T` directly, for
>
> Does the "ultimately access `T` directly" here imply mutably or
> exclusively? If so, it makes sense to me to call it out. I'm trying to
> make sure we can agree on some "common terminologies" ;)

It means "access using a mutable reference". I agree that "directly" is a bit
unclear - I copied it from the safety comment on Arc.

Alice
