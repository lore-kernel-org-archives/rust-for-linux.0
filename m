Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD9BC433ED
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Apr 2021 00:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71190610CE
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Apr 2021 00:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhDOAXW (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 14 Apr 2021 20:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhDOAXW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 14 Apr 2021 20:23:22 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9A37C061574
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 17:22:59 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id l22so17820238ljc.9
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Apr 2021 17:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yXZNUo89r2h1yes0UyVOBhU7OBJhuW/Q19qWBxn/2nM=;
        b=rXj+cH/RJJkrB/AlmWQGkz1A8EbtqNB8KsnTCaMCUwWaZA1N7BmjNBTIwkXkA4mZbo
         sVrXJkLciidxw0LrI6ww5V+5d02ksBfZlhmr45AvcPXr6nRSoBNgInd6OLWlbh1GyYCc
         zNvfXQNGJfy4PyfXfL7Xcojhh5kHWQWSoHm/rpq8xLCUOL3lJpJRhfewGiGhvArNBGAY
         NyBLc8ZYmgurVBwz7FzkK4PY9dOl07m/dOSZc75lfLCg38Bfxu9P5cbB7oY2MsiL5RMz
         EEPWWKaiHm+TAR/UqXwcno6h3cgNtJRkd+Ro07iV83uZKO4Wy55/U5cfFm+nq2mkRH+E
         FRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yXZNUo89r2h1yes0UyVOBhU7OBJhuW/Q19qWBxn/2nM=;
        b=YeW9zg06K/8s8yagFnLuBwxDMdICZlSgLGIVlJxxHjy+V4KX1VA32bEf/PIKr4kpe9
         Pe/B24neXGlUPICUt0Om+0l4FVKVdy5UTMKdW7OTIASM0PWSmfjO7KCGv2hvOYautuL1
         JXONFnWDJcpl5uyAtCm3lgMXhAxVQPvajMGs8B9R+UDl27dcg7iD6lGy0A3i5sNY1G39
         1T/ikpYgFdlWK4vNZcIKv54g6DXHOKF3nnrD5SaGNSkfJPnjN79Rat8TzOFzVh2QwU2y
         qa9uQD5tz+frQh9K2Ahex9UfGpfvh52CoLq7FI4Lq4dAQmaVxCvHO1ivBPLX7KSS+fiA
         vpeg==
X-Gm-Message-State: AOAM530kGUWumqt8+Memc4mHPdgqIrnmNDtOUh41ro229WLE3z+O4dwH
        hvRRCadsaZZhjIfVyKLV5+rfKuVon0F9FX3j/Z5vXQ==
X-Google-Smtp-Source: ABdhPJwuIf84XGcLpyrpotifCJFS1sv3n4h0mHFn320uKh8eaoB7u9uNPGDcrrYVDBF0cLM74gjBTXavRVGSwP/cZNE=
X-Received: by 2002:a2e:b817:: with SMTP id u23mr304996ljo.116.1618446178052;
 Wed, 14 Apr 2021 17:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-1-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Apr 2021 17:22:46 -0700
Message-ID: <CAKwvOdm8s7Yp8e=8tpscY805-bjQWyoNVzhFZnH4KL-q9ZP4Hw@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 14, 2021 at 11:47 AM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> Some of you have noticed the past few weeks and months that
> a serious attempt to bring a second language to the kernel was
> being forged. We are finally here, with an RFC that adds support
> for Rust to the Linux kernel.
>
> This cover letter is fairly long, since there are quite a few topics
> to describe, but I hope it answers as many questions as possible
> before the discussion starts.
>
> If you are interested in following this effort, please join us
> in the mailing list at:
>
>     rust-for-linux@vger.kernel.org
>
> and take a look at the project itself at:
>
>     https://github.com/Rust-for-Linux

Looks like Wedson's writeup is now live. Nice job Wedson!
https://security.googleblog.com/2021/04/rust-in-linux-kernel.html
-- 
Thanks,
~Nick Desaulniers
