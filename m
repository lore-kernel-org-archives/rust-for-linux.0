Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54614C77B73
	for <rust-for-linux@archiver.kernel.org>; Wed, 24 May 2023 11:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234562AbjEXLLd (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 24 May 2023 07:11:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232155AbjEXLLc (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 24 May 2023 07:11:32 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C7AB7
        for <rust-for-linux@vger.kernel.org>; Wed, 24 May 2023 04:11:31 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-513ddd8e39cso868191a12.2
        for <rust-for-linux@vger.kernel.org>; Wed, 24 May 2023 04:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1684926690; x=1687518690;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4mh/uplWXEJG8R+eeG89iIATTJ5tXDpqPwH0/Cpz+94=;
        b=Ealvqf6m5eTtrTJw51t/UJcXmkP4y9/lCnZH/rfLC2p1LCmw5L2podZOi9x4uyfp42
         8BpGUAGcvSr0zooJbm/yd+HMtz9kh6YAJBttV5LW1foF3EEDwcfuUH3MDfcTqjtTWwrL
         cwEdXAixIuP1wKTZnHMAobXmu+IjqV1ZJyo+JgCgctPEtbFTvfDWnxKN2tqKhvw8tDrn
         o1RYy1vGzVcxOpH8pwVnpRjAo5boR7L7fvzosXftH8G+3aRDeftjnvZ7h4vW0xNCfRMd
         M+VSr+3qH7pw3z17P0nY/78Vbb3ODNQ8MsOH6O3UnwVtRV83T4Wl4/+urGCkxQzRwGrs
         sWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684926690; x=1687518690;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4mh/uplWXEJG8R+eeG89iIATTJ5tXDpqPwH0/Cpz+94=;
        b=aOKItRWyZmoAfMpVph3X3X/ewSCv7pAbOxxWqfeFMlWkrMZqDsFMN+3Jx849ZNyq+f
         kfAWodaphHKkhIMXTmSaY8mLIdiWJRA0UNZPJfJdoQwXZsiO3ZPMpxjFukOFL37VHGUj
         SSlUzUWsYfFDDTFGOceCT3hKwsJToTQSTkXMXW2Emrg2ukrHdT+s55qIoo+/dOP94FHW
         nEexRapwdm7pqEzf/fjkUFhDioyMp5Jt/Ff9lmRef20l+itb72MnIOcKx4Dumcpg40CX
         kQBIKzukybYDrnKKu1Z8b6ld+BK0QYpbxDrVYVWO3Tabad3JDdoT6lqMrcnMsEZOMMo/
         jlcA==
X-Gm-Message-State: AC+VfDzi45bbuq4s2qtFg81aUTUtNnmvQOjKASlbcNg6GKAiSNRIg1Al
        f3BIIFhmG0elKVVE0JmY1wLSnSGbtO5dQtI=
X-Google-Smtp-Source: ACHHUZ5+4OdHMonxT5AAGoSedUaFjM79+wW2g2Tg0tZikEMfewz+SKNu6+lWkRHbxOW7yIJB/AFDxLBZhC6BAz0=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a50:c34a:0:b0:504:89cf:8170 with SMTP id
 q10-20020a50c34a000000b0050489cf8170mr758066edb.4.1684926689900; Wed, 24 May
 2023 04:11:29 -0700 (PDT)
Date:   Wed, 24 May 2023 11:11:27 +0000
In-Reply-To: <87edn6do1b.fsf@metaspace.dk>
Mime-Version: 1.0
References: <87edn6do1b.fsf@metaspace.dk>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
Message-ID: <20230524111127.2491643-1-aliceryhl@google.com>
Subject: Re: [PATCH v1 3/7] rust: sync: add `Arc::{from_raw, into_raw}`
From:   Alice Ryhl <aliceryhl@google.com>
To:     nmi@metaspace.dk
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

Andreas Hindborg <nmi@metaspace.dk> writes:
> Alice Ryhl <aliceryhl@google.com> writes:
>> +        // This preserves the metadata in the pointer, if any.
>> +        let metadata = core::ptr::metadata(ptr as *const ArcInner<T>);
> 
> I can't follow this. How does this work? `ptr` was for field
> `inner.data: T`, but we are casting to `ArcInner<T>`.
> 
>> +        let ptr = (ptr as *mut u8).wrapping_sub(val_offset) as *mut ();
>> +        let ptr = core::ptr::from_raw_parts_mut(ptr, metadata);
> 
> Metadata was obtained from a pointer pointing to `inner.data`, we then
> move it back to beginning of `ArcInner<T>` and then reconstruct the
> potentially fat pointer with metadata from the pointer to `T`? How can
> this be right?

The metadata of a struct is always the metadata of its last field, so
both `*mut T` and `*mut ArcInner<T>` have the same metadata. Because of
that, moving the metadata over from one type to the other is ok.

The reason that I cast to an `ArcInner<T>` pointer before calling
`metadata` is because I get a type mismatch otherwise for the metadata,
since the compiler doesn't unify the metadata types when the type is
generic.

Alice
