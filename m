Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99ECDC7EE2E
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 13:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238387AbjFINFr (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 09:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240519AbjFINFo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 09:05:44 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F01530DA
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 06:05:43 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-569e7aec37bso25037897b3.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 06:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686315943; x=1688907943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jt8xvqC2nPhBwkNP4OUqRm94IjtUiSOb8Mmp+FzN9Mk=;
        b=t5QTYuRK0di0z1o55MZaORz3xMCtAxan1FaLB/ffcAlR93intIIQy6MJ0N06SNrhC1
         3SPwTBSe0C3LrVqUT8tMnQaJq255vWq5I1aH/trIDMlKnMUMZz9An1f+wt+5WYp6XBjU
         mJS0oWoxxdNaH+BCSKXE1jE4nK9SsqCs5nES6nUMXowKZLq063TCBwhHdBGBEPDA9zjW
         MYiecrBjQKByerGm5giQ+tK50ACP1dA8wSXyjBo1Nno0Gxv16QbNLEN/r1np4qSan6cI
         B1zn41qOhHJBa2YxTfx6H/JueFvzL6mvCwr6VX4QlE3NmYJEYdt0abs68zAjO8BvbKhW
         5EDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686315943; x=1688907943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jt8xvqC2nPhBwkNP4OUqRm94IjtUiSOb8Mmp+FzN9Mk=;
        b=VmCVTvSeHaaRtI9TzRvu/0qz25OHhYDAm1Iw9TkQ3dqR5JS0J5xG5S9XKKHCrK90GC
         zGVvgdyQiwWogQc5zmhqpu7fbq9QmO9pDGhYIYfa8UllgOYZvDMLDRTvwVURJSGlaFdO
         tz8QKtQxj9QebeO3eS0V+Yj7xXBAnni8VeYtARxLt1W8Bv1MRnWmUZeroKeWePgFka6/
         FM43T+7mcNgnNc6mTJoMPF3vGjRb6hj+l0XRG1EVKOw0+hljOmjuSTST8y19bHU9Tx92
         id2jlM6GVp+5bZIW2NFYw3VQPFWE0N1U1EwKRXzBRIuiSk0W25g1fzYMAzRgbCAitSrk
         ADtw==
X-Gm-Message-State: AC+VfDwN90go4ozgcrXkK1cy6OD88TYhsbPCSgG2VK0kauMdkKE7C9B+
        I605c4oc//yEQ6sPPUpa4gv5JhrB6H9E6Qg=
X-Google-Smtp-Source: ACHHUZ7QoU2zQfij1jE77i3FaSipHaW0/XKcHSRc3sXUAhZ5HvUY1L0EiqlaYqU3IZEhVkf6uHE/7TN7YbakvIg=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:ad4f:0:b0:565:ba21:8123 with SMTP id
 l15-20020a81ad4f000000b00565ba218123mr823294ywk.1.1686315942787; Fri, 09 Jun
 2023 06:05:42 -0700 (PDT)
Date:   Fri,  9 Jun 2023 13:05:39 +0000
In-Reply-To: <CANiq72nAcGKBVcVLrfAOkqaKsfftV6D1u97wqNxT38JnNsKp5A@mail.gmail.com>
Mime-Version: 1.0
References: <CANiq72nAcGKBVcVLrfAOkqaKsfftV6D1u97wqNxT38JnNsKp5A@mail.gmail.com>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230609130540.1643605-1-aliceryhl@google.com>
Subject: Re: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
From:   Alice Ryhl <aliceryhl@google.com>
To:     miguel.ojeda.sandonis@gmail.com, brauner@kernel.org
Cc:     amiculas@cisco.com, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Miguel Ojeda writes:
> That would be great, thanks Christian! (Cc'ing Alice for binderfs -- I
> think Rust Binder is keeping binderfs in C for the moment, but if you
> are willing to try things, they are probably interested :)

Yeah, Rust binder already needs bindings to a lot of other parts of the
kernel, so I decided to not rewrite the binderfs part for now to cut
down on the number of subsystems I would need to upstream bindings for.
Upstreaming bindings has proved to be a lot of work.

If someone else wants to upstream the filesystem bindings that binderfs
would need, then we can certainly look into using them in Rust binder.

Alice

