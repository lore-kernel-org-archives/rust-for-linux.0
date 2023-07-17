Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A85EB64DC
	for <rust-for-linux@archiver.kernel.org>; Mon, 17 Jul 2023 13:53:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbjGQNxU (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 17 Jul 2023 09:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbjGQNxP (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 17 Jul 2023 09:53:15 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DA3D1
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Jul 2023 06:53:14 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c6db61f7f64so4525187276.0
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Jul 2023 06:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689601994; x=1690206794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7a5j4gvhnG5mrdZ/F4z3dJKPADNbpn8JJt+6WIEe8sU=;
        b=lK2MzwZAd8EF2hJ82Wrids5Yon9GdRQhhNLfZ2ksqHpFJYE6J0xTMaiMwll8uAghz1
         Q62+KB6AQNgPBSOKx8vtCAfk+h9fYbT/aJZn/4nhnPfduu7vlXDMKEg4WyZZ2FFixDoq
         oDgqbcwo0gIXZODKkk4NXKi3u+mZG5rGW28+W2IGOYejqkl9UHoT9i6jCSgrXCkd4SPQ
         i6d91L8Htl5aAkcJmprFUFouxpSIdoRyLSnLuX0qBZr0vhnT4QEuUyzkpgeOOV2dHqBb
         5gTDJFFnbQho1EeFjkMi82uQfx7G3caOKn/DQAw/gzC/yuy69GoBodepUdF460PeP/1Z
         CrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689601994; x=1690206794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7a5j4gvhnG5mrdZ/F4z3dJKPADNbpn8JJt+6WIEe8sU=;
        b=mAl9wI3HdDRAHS203+yMZWX+P4IZlibteuCt/RVx2oFMaAjKSGDsQz8iu3YNfFH5hE
         keHJc1sbNa/G13KR4F57rpBLuqNxdIZYbMxAZnSLi27AoiVuNh9qy8aKYb1On2wU4I1O
         c3kcdXHsXjDZFEUI575Tict4GynrgNpPlHsOs8snVOsci1cfTmK90UYLrv9MBAX/0WOZ
         RNzVHiLr+YRf2PRU6QmXwzB6fdh+tawwVWKfF82xDwFrXomXJ/+iIpeK6Qw/aJ1VtC+U
         NnzfSI0w6c8cYNXbVd3QYD6uQWkvck1cUpe7LHtzxcbN4ErQXi3fj6o15dOH0UWNO0TE
         RkHw==
X-Gm-Message-State: ABy/qLb4FywmJThSj/THpNjPdlIQ+qQ+UGJVR/wa1SjgXVNJDGbyPpNY
        qgn7hoHEmyTZ4R7d0fnAnFWKwq/pTgYzBnw=
X-Google-Smtp-Source: APBJJlFqfJxS9tr9kwuqTLxh56qQM4RllSCU5YzQj4nW0duV/3DgusRHSW5nZK7P7bx+oV8x7DiAddAcyBASxqQ=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:6c8])
 (user=aliceryhl job=sendgmr) by 2002:a25:2556:0:b0:c22:38c2:43de with SMTP id
 l83-20020a252556000000b00c2238c243demr96482ybl.11.1689601993768; Mon, 17 Jul
 2023 06:53:13 -0700 (PDT)
Date:   Mon, 17 Jul 2023 13:53:11 +0000
In-Reply-To: <ZK3WUBTb1dHfjnh8@boqun-archlinux>
Mime-Version: 1.0
References: <ZK3WUBTb1dHfjnh8@boqun-archlinux>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230717135311.1841165-1-aliceryhl@google.com>
Subject: Re: [PATCH v3 4/9] rust: workqueue: add low-level workqueue bindings
From:   Alice Ryhl <aliceryhl@google.com>
To:     boqun.feng@gmail.com
Cc:     alex.gaynor@gmail.com, aliceryhl@google.com,
        benno.lossin@proton.me, bjorn3_gh@protonmail.com, gary@garyguo.net,
        jiangshanlai@gmail.com, linux-kernel@vger.kernel.org,
        nmi@metaspace.dk, ojeda@kernel.org, patches@lists.linux.dev,
        rust-for-linux@vger.kernel.org, tj@kernel.org, wedsonaf@gmail.com,
        yakoyoku@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Boqun Feng <boqun.feng@gmail.com> writes:
>> +// SAFETY: Kernel workqueues are usable from any thread.
>> +unsafe impl Send for Queue {}
>> +unsafe impl Sync for Queue {}
> 
> I don't think "usable from any thread" is the accurate wording here, it
> sounds to me that there are types that cannot be used for a particular
> type of threads ;-)
> 
> Maybe
> 
> 	// SAFETY: Accesses to workqueues used by [`Queue`] are
> 	// thread-safe.
> 
> ?

Sure, I'll make that change in the next version.

Alice

