Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2307EC7EE23
	for <rust-for-linux@archiver.kernel.org>; Wed, 31 May 2023 14:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237330AbjEaOJD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 31 May 2023 10:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236190AbjEaOIv (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 31 May 2023 10:08:51 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4785359A
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 07:04:46 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-bacfa4eefd3so6843759276.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 07:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685541828; x=1688133828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgZNa9EtHrAIwO3wPspMKG7VOPoKw+bLM8tIqIzljU4=;
        b=73dq1vBSAi729Lilf8hsEKhqFYXzhRCBI6uMLZyuvErH5WN8nLHGymQsclfH1xkkds
         +6qlOW1V0G/D72xBKfuy805DJKiqGU7jlVl9I4OHIcm2kJXPH0nINc3ZYotFu4YITGC8
         2xTH5sY9WC25b/N2LfFTeCJAZSMhYGlOgQI1yfrwpRfCnNIqb+JBCt1Mx2N4U8vorlD0
         FDY1w0Neh0xfk1ErY/wQC70kl5CmojKosloDEqjNLa6zSAPbiY5V63vnIPxsoCHGBSIt
         rP66wSjY08cx2dXI60q6pBlD0u1cD4rKvT2s0DnC/vcelPtgnbW6H/dzVyqzMEPCrI1k
         Qfpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685541828; x=1688133828;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgZNa9EtHrAIwO3wPspMKG7VOPoKw+bLM8tIqIzljU4=;
        b=Tj9GD8bm+3pi4auW+YJaxC5+Ewhw6Vs5gIsCQ32fnSfxK3ckDY+JB/YeDYHM6+j2wI
         k0G0/2kBbfgruElGFZRFC/X07d8UCfqC3YpwTF2KNcy0iEwIFvK8FuFViyfEeeamo0XU
         Cj61CMARxPaIlNrGTcZICZlE5P9Sb6INPk0O/AzfKfumA7Iom4Td26GZfEU+z2/ibv6T
         mmS3/FMX59flWXKrk3mMfaJ4EeFbh3rLDXEf9z7Qv1iOixDRSlpk08iPFQBValTf14gK
         zAYAYaqontpJxe4mtbR7M8TUjGoRuAMeCxGDhqNKZf/yB358mL/NZD3TcV2z1i1vKgCa
         kElw==
X-Gm-Message-State: AC+VfDwYAjJFePTiF7oC9ZCgzFnXmwO5JXZOXy1Z4BkHHdHnCFRacZsj
        n5PKeOGw5Z9/tEMoqQq/D53bWR1uLLLG/gY=
X-Google-Smtp-Source: ACHHUZ6DEtgX4K6pdimvH3NmwoYvDCaDL753Abz2f/W5Qjy+z7CORXWoLXb2LvEYZj0nfLJnZLh7+T0qXaxZI94=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:3444:0:b0:ba8:37f6:a586 with SMTP id
 b65-20020a253444000000b00ba837f6a586mr3364248yba.3.1685541828239; Wed, 31 May
 2023 07:03:48 -0700 (PDT)
Date:   Wed, 31 May 2023 14:03:46 +0000
In-Reply-To: <xAv635eVJdklAFBXcwxhVWRvgkMs37YDjANEArFkcOdoyH27NSHwbBGgJ6b9Q1EvX8gACiNqkaDYNvwdMWy6YHbeGM4qz1xW54-02UjzzZA=@proton.me>
Mime-Version: 1.0
References: <xAv635eVJdklAFBXcwxhVWRvgkMs37YDjANEArFkcOdoyH27NSHwbBGgJ6b9Q1EvX8gACiNqkaDYNvwdMWy6YHbeGM4qz1xW54-02UjzzZA=@proton.me>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230531140346.3707802-1-aliceryhl@google.com>
Subject: Re: [PATCH v1 7/7] rust: workqueue: add `try_spawn` helper method
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
>> +    /// Tries to spawn the given function or closure as a work item.
>> +    ///
>> +    /// This method can fail because it allocates memory to store the work item.
>> +    pub fn try_spawn<T: 'static + Send + Fn()>(&self, func: T) -> Result {
> 
> Why is this `Fn()` instead of `FnOnce()`?

That's a mistake. Good catch. It will be fixed in the next version.

Alice
