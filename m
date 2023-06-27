Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 818F5EB64D9
	for <rust-for-linux@archiver.kernel.org>; Tue, 27 Jun 2023 08:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjF0IjL (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 27 Jun 2023 04:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjF0Iiv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 27 Jun 2023 04:38:51 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C50335AC
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jun 2023 01:38:05 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-bd6df68105cso6015765276.2
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jun 2023 01:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687855084; x=1690447084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX1lTnuqVI3xAbN0fkRezsoOIB0K6fV+WnbtqyeDXzY=;
        b=NKcD/UfQpGef7fdG3Tncm/U34Ba3BIuBrO0YDK445gyZQVjIL/6eUBqRmFl8t0vS/s
         c+Lkpdamq7kXAJasvS1boxlS4oEC4i8uvpZ3+Iee1hyKcQmLXyAIWDKmOfUHJLieaYsa
         o7Rsc1rnc/8w3lXhV9mMCOiS5gNBgSEEDcoNMTlXcP2d1ILVJXZbXRmkv8a7/HXV0PFX
         uqnuARTlCnK4ui11KrIKZhbF3bM92C+b/D/D6PX6dz1P19awu1TUX8O+5vXX8vtD0U/S
         wovBmhW7jVUbVYX88X/dtseKjkz6PUxwBB0bvVR+Se/V/MFWahX7DB88KGYdy4A1uMye
         IY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687855084; x=1690447084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZX1lTnuqVI3xAbN0fkRezsoOIB0K6fV+WnbtqyeDXzY=;
        b=X3v5HoGtLrdlqvJcENV8+XfkgEzaWMRsI4YfN/+c+2CzTUsC0UcyQAIGfysO/qLKS9
         JBW05Zxn8n2j5IH9CxIauA/7klqO5/WwkKK0O7kQnpt+SixyeYSIk+a250G7BvoyEDCM
         2aqg/VmjXPIr2IUlPbz8nxNLVkOnm3GVewRDoZ1u5a3YXmUlqyNkTNsYlf6mfGV8hvPB
         C9N6FIL1ffBKjTa11qpHjsDdXVqJg+ZCe9w3EcN0LFPdsHDoOfn1kKHdOdU+4c2+/0+t
         2sLHRZIvYxdZd9eJSFiQzqgnhNQvQzJA7nT6mJOc66DNroMdVh0NWsKsyr/TBm/i5dbn
         nD5w==
X-Gm-Message-State: AC+VfDyPRChlst332RInB2RPfOyyntnoXWqSUw7C2PiKupjxwHXFIm9t
        AWblsKvX09aceIyqGq67LTFtXAShAJzPtpM=
X-Google-Smtp-Source: ACHHUZ7sJFtiw5uGwhdVMFxKYmXzmNFpEiedpDpJFFo2lYQOaQ0104CTQKmue7tZvryVzKj88m1TeFAxt/7aCus=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:d886:0:b0:bc4:5077:f59e with SMTP id
 p128-20020a25d886000000b00bc45077f59emr14311498ybg.13.1687855084298; Tue, 27
 Jun 2023 01:38:04 -0700 (PDT)
Date:   Tue, 27 Jun 2023 08:38:01 +0000
In-Reply-To: <kHwlRfK_EtV6I7xbaDgyCbR2Xz0cHmM4Sh_edMi-Wr0JaJNlvVEQH9ZOqWuSr5hBx6cu8nreQdIlWNrHLQ6ehUT4hWtgBalWeQpcVVlBOQ0=@proton.me>
Mime-Version: 1.0
References: <kHwlRfK_EtV6I7xbaDgyCbR2Xz0cHmM4Sh_edMi-Wr0JaJNlvVEQH9ZOqWuSr5hBx6cu8nreQdIlWNrHLQ6ehUT4hWtgBalWeQpcVVlBOQ0=@proton.me>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230627083801.1737103-1-aliceryhl@google.com>
Subject: Re: [PATCH v2 8/8] rust: workqueue: add examples
From:   Alice Ryhl <aliceryhl@google.com>
To:     benno.lossin@proton.me
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
        jiangshanlai@gmail.com, linux-kernel@vger.kernel.org,
        ojeda@kernel.org, patches@lists.linux.dev,
        rust-for-linux@vger.kernel.org, tj@kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Benno Lossin <benno.lossin@proton.me> writes:
> On 01.06.23 15:49, Alice Ryhl wrote:
>> This adds two examples of how to use the workqueue. The first example
>> shows how to use it when you only have one `work_struct` field, and the
>> second example shows how to use it when you have multiple `work_struct`
>> fields.
>> 
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> 
> I really like that you added these examples!
> Is there some particular reason you decided to not use
> 0 as the first index in the second example? (you can keep
> it this way)

In my head, it felt more natural for the first field to be called 1 and
the second field to be called 2. But it doesn't really matter which
numbers you use.

Alice

