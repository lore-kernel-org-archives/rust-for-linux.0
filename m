Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBC5C77B7A
	for <rust-for-linux@archiver.kernel.org>; Fri, 19 May 2023 09:43:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbjESJnb (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 19 May 2023 05:43:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbjESJnN (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 19 May 2023 05:43:13 -0400
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0FF30C3
        for <rust-for-linux@vger.kernel.org>; Fri, 19 May 2023 02:41:21 -0700 (PDT)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-94a356c74e0so336841166b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 19 May 2023 02:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684489244; x=1687081244;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qWpQ3Z9uo5d0lko+yuj7LVhbX1lJ1BOQYyhbdzAiJWo=;
        b=dyt7NwVO2a1gKgywYFDD8VjInLnFEg9pkbesUJ5JP62K+efVqGabn2ejkuN+LA0w+3
         7skaMDSCg4NECg+cB+RSOxApwoffaQAtr+X/Aadf95/LadOlW2OybzUpZM2hLDUDP/Rj
         j23AANItbXkHlUHz5AemgqeZt/ql4Uws1OqRWWb50SWAR3QIBqOYgpm4ZZYPVRzLg+Dm
         p4BMj2purjRFRRLB1LFM8so/mUBz31z3Fimh19+TyWPUPdzALTMS5bsDjUIRFj7AVmBT
         sjluU/ZYj/ZOLN7F6l2bDDVzSOj5BVThpWdNmyUAKBVHGZn2ygORwCveYpBHY39Y/io9
         Xfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684489244; x=1687081244;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWpQ3Z9uo5d0lko+yuj7LVhbX1lJ1BOQYyhbdzAiJWo=;
        b=Hy0/jyVWbM3ot2sLBVla+Kjvo/tOg2F5vKktYzBV0VW/ro+hHvN9l3CzsWDcON0pU/
         +Lt+FLklzeH8qXtZ7Vr9K9U30dLj3R3AY5AntX4PBPT9W02F77y0t2YG4JorrKRucFBS
         tYQAzvlzfgY8Wpdln1kOW+zy7jacoUHjww2DA8cVGSZQbryG1OoqtNIiGJhu+/6SHX+V
         2n+FvAj8NGXJIIIl0j4GjwMhmtHwQm9rDe1AxZLpxZNJEyP6+iMs5l3+DgFrPQtmfql5
         0HhXXB4FyRSiXEH3smczGk2+h7d9T1Pus6aHpVjbRXrV2xNTMQka60kPBVE3vo7D2IRE
         UDFg==
X-Gm-Message-State: AC+VfDz4n3hlt4fSeJNP1YHNyXDz2rRPSzUu3yq+pDfxMJp0lLz3Bm0k
        0oziQCFtdkyOReAlqG0bQ2pThmmRQGNQmCM=
X-Google-Smtp-Source: ACHHUZ5n/GWQx8DIeNB1oencH1Ize+8S1lQNiMrR+ccKmOwSjb/TZ7lXLIx1yetd0ozoxs/LbXo6AOMtrxnl+is=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a17:907:a067:b0:94a:8224:dbbc with SMTP
 id ia7-20020a170907a06700b0094a8224dbbcmr440656ejc.5.1684489244727; Fri, 19
 May 2023 02:40:44 -0700 (PDT)
Date:   Fri, 19 May 2023 09:40:42 +0000
In-Reply-To: <8e42aad3-d94e-3cb4-ee59-90ded31cea9e@gmail.com>
Mime-Version: 1.0
References: <8e42aad3-d94e-3cb4-ee59-90ded31cea9e@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230519094042.3432952-1-aliceryhl@google.com>
Subject: Re: [PATCH v1 1/7] rust: workqueue: add low-level workqueue bindings
From:   Alice Ryhl <aliceryhl@google.com>
To:     yakoyoku@gmail.com
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com,
        boqun.feng@gmail.com, gary@garyguo.net, jiangshanlai@gmail.com,
        linux-kernel@vger.kernel.org, ojeda@kernel.org,
        patches@lists.linux.dev, rust-for-linux@vger.kernel.org,
        tj@kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On 5/18/23 16:51, Martin Rodriguez Reboredo wrote:
> On 5/17/23 17:31, Alice Ryhl wrote:
>> +    /// Enqueues a work item.
>> +    ///
>> +    /// This may fail if the work item is already enqueued in a workqueue.
>
> Wouldn't be worth to mention that, if not implied, the item it's going
> to be worked on an unbound CPU?

I'm not really sure what you mean. Can you elaborate?

Alice
