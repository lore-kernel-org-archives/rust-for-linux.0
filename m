Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34888C433FE
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Dec 2020 01:01:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05FB122AAD
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Dec 2020 01:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727209AbgLMBBh (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 12 Dec 2020 20:01:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgLMBBh (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 12 Dec 2020 20:01:37 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30411C0613CF
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 17:00:57 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id k78so11892431ybf.12
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 17:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aR1J1v6lZbNiWv2+ZBB7jVJCWXicL8bmLfYPdGyxHgM=;
        b=YakVwQUWDntRM4EU/G64x+uLClckBBEBbVAydK6QCgx7QDC/lJFC5MvTcFNSTeqmLI
         1Vc5wUY4LZbDhvAIOf2lV5QaA/uVU2cv2eBtMMayz0bgjUJa3YEw8iQmIqhtTrLCIfMP
         FOzjwOxThsHtdiLd5p4IHbxLyIRI3m4t6fEae2parCqTGOXx/cdwBhDoaO2mbuyq7P9B
         toxtqe0GyWIvhgXVnvoXWOm9lvEaJgCUUhKbrCyQVnlfo1hmxSnjJGJolaixLW3jF7U+
         LTrGiM2oYe/eZfKvgbS+HKf4s3aqqjE6jTCMa7/ngw4w+XJqwvA9JzNmnFQH6hX7cGbn
         8VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aR1J1v6lZbNiWv2+ZBB7jVJCWXicL8bmLfYPdGyxHgM=;
        b=P6sGQv/HPaAzVGG7Ens54THQ0OtOll/3vML1LBUYv8eB7dh2Q5uwy87M088QDaCAPy
         PT9FEbXzrJYF91ymVhvXTiUgKa3Dc0vttAChNJEOyMANjm/O/C++kNgepQnb+bvt2c9x
         b9/5WL2+HZ8zlX/90dUcbBSPMn58Px5/JPt5PINHMuoQdmue4vWF3bYMmlAF+xDUjV9a
         TFYn+R0ZGw07ETvSLukUhfcT/A+HSzzi6/Xc7nWbfiK1S5K8t/iAReu89yFRR17KNLDM
         J0h0trp2C1yb4EshJpUPH+RSHaStICfgFgxz6py9s8WTqHZEF6BrmpOLAUYxYc3dzFVq
         jsWg==
X-Gm-Message-State: AOAM530MFg73h7IiEtadvOlVhKtXznmFzRZgd6YPHzGpzg0kgOjxjReH
        garSCItoDkJfh0pF4UQAD19uUoBZeOvxpPr7A7ZZiDvV
X-Google-Smtp-Source: ABdhPJyQ6/sdunwEL254tURhntb3L2felakgNQx165uNWMLtlrvDtO5Lq2vA9OdEujQX9XgrpR6os7vGjKCa9M+2Rb8=
X-Received: by 2002:a25:ef0c:: with SMTP id g12mr7633186ybd.26.1607821256576;
 Sat, 12 Dec 2020 17:00:56 -0800 (PST)
MIME-Version: 1.0
References: <aa2ff401-d552-fd46-b2c3-2058af8226c3@kloenk.de>
 <CANiq72kKthjwUvBpHHPbhFsE555DriFVTtm2ziFTjwnPH_aA=A@mail.gmail.com>
 <cc71bee3-32e7-f3a5-8afa-a373438e5b36@kloenk.de> <d417fec0-c5c6-edda-796e-a861f5518eed@kloenk.de>
 <CANiq72negqN+2eOjieYW1Zas1ays3t3W-+wZisXjF9q=kob3yw@mail.gmail.com>
 <6c621482-94c7-b34b-6d46-5036df3fc1ff@kloenk.de> <CANiq72mfzkVVV+zV-GRWo+kTh=b3VayPz-9Bk+Yn35YuusDEQA@mail.gmail.com>
 <CAMKQLNJKZ+z985+zB0WJ+fiQkLT-q_bNrYH_qvh_xPDcQuiDyw@mail.gmail.com>
In-Reply-To: <CAMKQLNJKZ+z985+zB0WJ+fiQkLT-q_bNrYH_qvh_xPDcQuiDyw@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 13 Dec 2020 02:00:45 +0100
Message-ID: <CANiq72nxgR8UZRdC6gSj3jBF+7cj6c5JXjaZgGY6XULrHjJEoA@mail.gmail.com>
Subject: Re: module as seperate crate
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Finn Behrens <me@kloenk.de>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Dec 13, 2020 at 12:48 AM Wedson Almeida Filho
<wedsonaf@google.com> wrote:
>
> Thank you, Miguel!

You're welcome!

> Finn,
>
> I posted on your PR before, but I think this is a better forum for
> this. IIUC, you are implementing the pr_* family of functions and you
> need a mutex for that. If this is the case, I think using a mutex is
> probably not the ideal solution because it precludes the functions
> from being used in contexts where blocking the task is not allowed.

Agreed. However, I think I am not following why a mutex is needed for
implementing the printing functions. `printk()` is designed to be able
to be called from any context and formatting should be done on a local
buffer.

Cheers,
Miguel
