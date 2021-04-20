Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BA2C433ED
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 17:21:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3C8F613AF
	for <rust-for-linux@archiver.kernel.org>; Tue, 20 Apr 2021 17:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbhDTRWO (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbhDTRWO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 20 Apr 2021 13:22:14 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778AEC06174A
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 10:21:42 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id 82so43921415yby.7
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Apr 2021 10:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4Z5T8GsWFSo1q30KuGV9bNfkGDmVj5PXKN6+fNCc6dE=;
        b=iv6jqeTjyOPw0cLE4Lcp8cT/Yznx6SoRNiqH1H41qQ3nm5sdGFlz90kLRPtgZA0hIo
         5KGp3DU+3O8PCrLvp/krbzXPpLRjJudnm/6zAiNVcBewsc18L6r6ebsi7wOStZ6c9cYh
         BPAGuGbtw9q1VA2uMtGFhRY/akLM8/wnfleYrU4Pi6M9weLUF9A39Tmb8Cjd6uzp16nb
         c+6uX0oAXUHvgfZwiKdK1UlEYK1dLfOs03kwE6XG1laoTpJQQ69fBEHWMGODGT+BCyX1
         VdzAxQYr9pbfXrygNtgd0NQg98TOQ1kj2cUFQJS4anJa5DGmbrrZDt5GKNQZiZKcKk0k
         f2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4Z5T8GsWFSo1q30KuGV9bNfkGDmVj5PXKN6+fNCc6dE=;
        b=DKC+5Npv34bfxuj0dGNHaMQUUykgJRBbwgXnd5TKh/PFZPObiQfXMEI/ydFPTwU/M/
         CI1jZyuuv2cRKz51BCmHP6cj5GYib1u/fqNiH0xte5ZKg5STPoCU4DgcmBz4kh+q170+
         QhF8j5iLXB7ri8JESQXVtMSejTSd6A2+Noz57xuTx55yAoBKzMrlnDDZ3lzDG/hRHs+m
         as5Ki5hWJT8bb6n+cD0TBFkiVi1XKBgzCLlp0Q3lpcvJV2b7N4dzAsgHQwRODfaQvJdc
         XcN3uuS7xxXw/+8YhfgscF87eeGoyw6dPXljDawzd2/7TxSqNfRcIWC3Q/CGWgQd2RQE
         ah4w==
X-Gm-Message-State: AOAM5311JHFhtAO2biLROXMCIwdR7HyxgN7cerKA0LMjoYjJJ88ITbVF
        DobiCFE1StDZlZFabNz5kl2a085qby1vyPw18JiNSeWI/EM=
X-Google-Smtp-Source: ABdhPJz88ewS87+dO+QSwAb9fNZawai56QPwb2lZ7zJTCXA4q6/Upzxqgd43IbrreEOGHx+ShEiGAQ0NJJzXkF0gx7w=
X-Received: by 2002:a25:bfc9:: with SMTP id q9mr24855422ybm.33.1618939301841;
 Tue, 20 Apr 2021 10:21:41 -0700 (PDT)
MIME-Version: 1.0
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 20 Apr 2021 19:21:31 +0200
Message-ID: <CANiq72kRDzRQX2Lz0AMLe+iZsWV4PSRe8PL9JHGh07fCMB+0tw@mail.gmail.com>
Subject: Video conferencing platform choice
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Cc:     Geert Stappers <stappers@stappers.nl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi all,

Geert Stappers has suggested to use v1d30 instead of Google Meet for
the conferencing service (and he has kindly offered to foot the bill
too -- at least the initial one).

I will ask in the upcoming meeting about this, but for those that
cannot attend and/or may not want to join through the current service,
please let me know before Saturday if you have a preference between
those two (publicly or privately, but please Cc Geert).

Cheers,
Miguel
