Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E67C77B73
	for <rust-for-linux@archiver.kernel.org>; Wed, 31 May 2023 14:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237529AbjEaOMM (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 31 May 2023 10:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237531AbjEaOLy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 31 May 2023 10:11:54 -0400
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E13BE1711
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 07:08:38 -0700 (PDT)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5654242df11so102839697b3.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 May 2023 07:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685541756; x=1688133756;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LkdmJU7MS1CA/Dj/0Gr76+y/wuVU2Ut+UYAk4XMq1Lg=;
        b=Ul62Teod+ZCunAd2EaQQxKG83SZcds9E9ARf6Guo7N40whc2dZSgIbAE/efE5+07k3
         6J8STcdoUa+bUIB5012q2gLmDiwH85tW8sZnC4zKBkPsfswcvG55+lsK8NU7nhTwjESI
         y+XhYHIYN8tNQHohIYV427qwc0uyQXSz+F/vrpiroQ+0WX2t1IYKHoTOGDsmJpMdDtKl
         M2XO1w/dieA+wC7EV+O7Pb1QnNcZPegV/y1rhq/zDznyxUsQPTRXAn2IOrEB9axqM6b3
         osENZfZYT9q6lZTWEFOfHmGlHjB81v0DYFQQr2RzPVDB68XIFPbNjZnKTb9+icmY9Suk
         lvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685541756; x=1688133756;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LkdmJU7MS1CA/Dj/0Gr76+y/wuVU2Ut+UYAk4XMq1Lg=;
        b=ib7ApU5giwHEg/HLjIY4r0h+PMpftJXw9swN6un8nn54VF6d0RQBLjzR6mEHbbKpfe
         Tvyaz+WrP/tWfJnO6/8FQ0/z7osVnpVaaDz+gndDmPHUE51cUY1NurQjFS6XozO1NR/Z
         SRbqczSG2tm9M7WM5pxhZAqg1yrT1r6CUYVgyxMpZbEcp6r0fWaWGZ4MO616VbR3gq7E
         8lpNoV2DEY6aj1AVJMCf2j7MSPYXfN7aFMHFPKMeQNqBi2eCp9oKeAI5Tiwi3LfbDvrG
         Y/xd+BZ7ozBYOTh1PgU3TWnC0l6l0bS0AQ+80x5dso+YMCwALrcVL2CwckWZrgB5ZljN
         Th8Q==
X-Gm-Message-State: AC+VfDzNyDbRGVC/S6O9nxU2HZw9ZRRkJqyRl6hCRUEFueJyVSJyT2bh
        htLBA3hOfyTKEm3g33Gt3hPQ+lRiZprtMR0=
X-Google-Smtp-Source: ACHHUZ50A+8qlR08pz8bSpq1xdjUBTlxwXtgKuxqeCBhz/sJHN7MEZ8M5JmPDryHbJli2rjh2e3mkYiU0zWrKlQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a81:af15:0:b0:568:ee6d:3364 with SMTP id
 n21-20020a81af15000000b00568ee6d3364mr1151085ywh.4.1685541756307; Wed, 31 May
 2023 07:02:36 -0700 (PDT)
Date:   Wed, 31 May 2023 14:02:33 +0000
In-Reply-To: <875y8geiye.fsf@metaspace.dk>
Mime-Version: 1.0
References: <875y8geiye.fsf@metaspace.dk>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230531140233.3707302-1-aliceryhl@google.com>
Subject: Re: [PATCH v1 4/7] rust: workqueue: define built-in queues
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
>> +/// Returns the system freezable work queue (`system_freezable_wq`).
>> +///
>> +/// It is equivalent to the one returned by [`system`] except that it's freezable.
> 
> Can we add a short definition of what "freezable" means?

I don't know what it means, but I would be happy to add an explanation
if you have one.

Alice
