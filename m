Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5F0C7EE23
	for <rust-for-linux@archiver.kernel.org>; Tue, 23 May 2023 10:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236432AbjEWKEJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 23 May 2023 06:04:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236492AbjEWKDx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 23 May 2023 06:03:53 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4899B12B
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 03:03:34 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-ba81b24b878so16561081276.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 May 2023 03:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684836213; x=1687428213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lhbu9xWkX3wLR4lq6dHzqQfPPOyNOfH06YqwJA9yG9w=;
        b=4dGLh+H8/haGhmxxd255Mz98LoY9lbqlzhvIM0z5TVaS8s7iiloqpEQFQ2qP1Jt9PE
         zKpqTTulmUI/MWJQvFQXhUCnpdIaOpFNGdGvsPNhSJwihz3YaSDyHUCqKHELkhMuL8Hu
         +nSXeD+NZLAvNBHsHokuZd+gTNoQggLV7wIWR3U68CYwaFDMTli0094VK1HT++cFNryg
         zaBKyFBiBb7yJR1v0cAXkCSSTWoKOYUs8N6tfJ7RbJ2vk6ypbgOgDiANKcjZkoN2coRA
         p+JGDbr97LlwKRbllnPDz4+36UKAESyhAXUJpaFwHvg62hN6Ea4uP0p2RkC8LvTnIsVw
         m/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684836213; x=1687428213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lhbu9xWkX3wLR4lq6dHzqQfPPOyNOfH06YqwJA9yG9w=;
        b=IrO//nPPA24lh/sOIF5kB3iIgQtaiMrjWwlRjqHlWlfpmnzJfwbQUw6pAuSOdUjmPl
         L/a2gX3XRDgVQ6+YR5TWLbfqLuLS3y4oWXiXj3oXjoFqUYEyWibHCe80qyu3974iIeuw
         7ulAThysTb4aKtyObQDaTZg88rOei/dRjubCcdywQDxcru3plqT2Ly9vbkOyNBity4cN
         2ENRzV0YKbIGU27jp3TFY2uVWh/u3BN5c9RDU1LLwKbs3JqJ9krYY0tHPjRCb3Vv2yg1
         mAheF2QgnbVpliDn50kk6f/6jCfP5jDFlM2aD2tZK+VD76JPOQtr2QF9sQVXHuT2Wxy6
         waoQ==
X-Gm-Message-State: AC+VfDzxzndpSuR1IZTv2D3vqjhkwuJI7HcedGmLuyG3xI4pd7tkGyIh
        KuaSawkfGPZ0zcWCfgzqchZJO3BDGuPjALo=
X-Google-Smtp-Source: ACHHUZ4NyfEHvy9cwuuqUdgnYfvSx3Y0xS9fHqMoUQEZs42xAAW/AgpB44Yzdmz7fLNz6YiTYLzDdVorZ13CiOU=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:d6c1:0:b0:ba8:17de:552f with SMTP id
 n184-20020a25d6c1000000b00ba817de552fmr5502594ybg.3.1684836213484; Tue, 23
 May 2023 03:03:33 -0700 (PDT)
Date:   Tue, 23 May 2023 10:03:30 +0000
In-Reply-To: <beb2932e-7f16-e368-9cb5-edbe115fcb67@gmail.com>
Mime-Version: 1.0
References: <beb2932e-7f16-e368-9cb5-edbe115fcb67@gmail.com>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230523100331.4070035-1-aliceryhl@google.com>
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

On 5/19/23 09:04, Martin Rodriguez Reboredo wrote:
> On 5/19/23 06:40, Alice Ryhl wrote:
>> On 5/18/23 16:51, Martin Rodriguez Reboredo wrote:
>>> On 5/17/23 17:31, Alice Ryhl wrote:
>>>> +    /// Enqueues a work item.
>>>> +    ///
>>>> +    /// This may fail if the work item is already enqueued in a workqueue.
>>>
>>> Wouldn't be worth to mention that, if not implied, the item it's going
>>> to be worked on an unbound CPU?
>> 
>> I'm not really sure what you mean. Can you elaborate?
> 
> I've meant that if it's good to mention that `queue_work_on` is going
> to be called with `WORK_CPU_UNBOUND` so that API users know about it.

Ah, I misunderstood at first. I thought you were commenting on the "This
may fail if ..." sentence. I'll go ahead and add that to the
documentation. I will include it in the next patch set once I have
looked at your other reviews.

This part of the next version will look like this:

+    /// Enqueues a work item.
+    ///
+    /// This may fail if the work item is already enqueued in a workqueue.
+    ///
+    /// The work item will be submitted using `WORK_CPU_UNBOUND`.
+    pub fn enqueue<T: WorkItem + Send + 'static>(&self, w: T) -> T::EnqueueOutput {

Alice
