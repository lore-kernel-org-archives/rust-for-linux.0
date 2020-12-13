Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF50C19425
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Dec 2020 00:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F0E622AEC
	for <rust-for-linux@archiver.kernel.org>; Sun, 13 Dec 2020 00:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389411AbgLMAv1 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 12 Dec 2020 19:51:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732853AbgLMAvU (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 12 Dec 2020 19:51:20 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5412C0613CF
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 16:50:35 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id o144so11400263ybc.0
        for <rust-for-linux@vger.kernel.org>; Sat, 12 Dec 2020 16:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1uRM/7N9lPucGQGQuoKWAGLIyDq+3vnmo7MIBZvOEGk=;
        b=pTpNiJL5g1ERGa7IM64lODqhx/52bRBbqEu+FtyUPJR453nqJFHk9GIxa03N3kNl55
         8ykhgekb+cqlLvg9RqNS/ZTU1F5jUzpwZgwuask+EGJ8vxCtt3w5Ayhg2ntqTYA+Iut2
         fG59ZKosxbt31r4yDularpAcr4ZZ/lEwWZR62NFMaS9hYzcESrUKFa+infVp3EuQ45Od
         W+VT+iGLbIJBktGWhHF4kOJ6aNIJaDEEireCm7tfgPdzgnwqX77M6/tVF6KTCAFnwHnW
         9LkMhDj6kvgBVnw03A8CPblF998tU13nAht6PAbK6VQMvxy4/lsMZhyusqckXNS5scTb
         iFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1uRM/7N9lPucGQGQuoKWAGLIyDq+3vnmo7MIBZvOEGk=;
        b=FcjbkZb9N6iQq7CcPkIG8J5nkpMvSHQsGqVZ8a4vzjEqQfAsLTqmrCX16X4Tqs/tqQ
         Odcw2jsF8JIV+W/XMIHzKZWNjzvad1N6jKLE8UpKSVdLwAkGrlfB4aagdaK+qre6PRfb
         BROo4HY2NTnHyRCvZfTy1qbFZ/zvea82Hx/JpgtVWBzbWy+ImQIugcq1/6w5AtRB+gbH
         HsKX5EeKpkgDxC/vvInXDfXWdQY96MbFKRO+FiLaEyz+wXIFHT3S58kZZRNSJPcBt/TX
         fsDqZ8AvDNnSZfJHC54NRbRPyfAAhKl4OvMhrK5ACUPB1slFTYbQWFcOHSkck7igHfoY
         7nHw==
X-Gm-Message-State: AOAM531KV4nikdxWtuWrO5J3F/53gsDgefgyNgrV7UUG1P1oGAuq72dx
        bAAaBoLYlFaFCGqxn9YzK+QKXju8o/FMq16XwHw=
X-Google-Smtp-Source: ABdhPJw8Eif/6LyhqS7YtWFxX1FQ8YviMed5AHJR42HaMn43tdimomZdqIVFCM0fwQOm2qW+Zz9HnVoeWtJLuAsujCY=
X-Received: by 2002:a25:ac03:: with SMTP id w3mr27264554ybi.135.1607820634723;
 Sat, 12 Dec 2020 16:50:34 -0800 (PST)
MIME-Version: 1.0
References: <CAMKQLNLp+XfVcQf_+8OHJO=faTkwfdiFYR2s72LoAryHxFBJFA@mail.gmail.com>
 <CANiq72maQNCGT=ff9BrsqY81mXjzeYpKxDy9rZL36cmgfCZt-w@mail.gmail.com> <CAMKQLN++0y2fVHNJhthemZ4BhQCAqXyFygj-jACZQnqfFBmkbg@mail.gmail.com>
In-Reply-To: <CAMKQLN++0y2fVHNJhthemZ4BhQCAqXyFygj-jACZQnqfFBmkbg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 13 Dec 2020 01:50:23 +0100
Message-ID: <CANiq72m17CZswGE5-kKgA07W3Owq3-dtdbPTYvtxmMHzfqPGig@mail.gmail.com>
Subject: Re: File operations
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Dec 13, 2020 at 1:01 AM Wedson Almeida Filho
<wedsonaf@google.com> wrote:
>
> Yes, that's what I am working towards. If the non-trivial driver is
> filled with function declarations like those though, wrapped in
> `Option`s and closures, I think it may be tougher sell.

Perhaps we should rethink how the file ops are defined altogether, so
that they are easier for clients (i.e. rather than try to minimize the
boilerplate that we have now).

For instance, could we remove the `const`s in `FileOperations` and do
it another way? e.g. give `FileOperations` all the functions with
default empty implementations? Or a builder pattern, perhaps, where we
pass functions for each?

In the worst case, if we end up with macro magic, we can go directly
to a macro that implements file ops entirely assigning things to the
vtable as needed if they are found; rather than trying to simply the
boilerplate the current `file_operations.rs` gives us:

make_file_operations! {
    fn read() {
        ...
    }
}


Cheers,
Miguel
