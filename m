Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92BEC433DB
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 Feb 2021 05:45:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 806AD64E68
	for <rust-for-linux@archiver.kernel.org>; Mon, 15 Feb 2021 05:45:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbhBOFoz (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 15 Feb 2021 00:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhBOFoy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 15 Feb 2021 00:44:54 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47740C061574
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Feb 2021 21:44:14 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id r2so3094854plr.10
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Feb 2021 21:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ozdxoYIDVh0OfsguRzlWIB+uin076odZMq7nNW1dJ8=;
        b=mU+O4In3r3fd8KQSJgqRvHwnzK8BQFa6hF8HWlbOCOvpTAjsepIHFjIr5N2LlOGTc+
         Urb3VuqkoQOgYKeolwZbe92poLXQVXXFsROfRJLUnVQoM+GW+sJaXDT2qQzelhE2pM2T
         GBlW/9OSgGHqRAV/9fcZ3G25w3NzIGxLgc9yRgPgg2TGHQcUvkRpq6njfrz+WYLsomGV
         MVuT/aPrKcGlyWoa1bewAHA/uM8dJdJlX92QJ/0BC+MfEOFZvZoBTYL30acPXXDHgJoI
         QhiEWUL5AJsfzasKJrltWJlle/An7x1+v2cIePA9RBpPjpz55Es40lV8BZhmD9+CjGnE
         teew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ozdxoYIDVh0OfsguRzlWIB+uin076odZMq7nNW1dJ8=;
        b=Ab1Jw5ORk5ybfNvpDADoJhOv9A1nA3yBJsGN3u60USShqJmKjq52q/gGdg6bw/nayA
         SBmZY7qrj8XV3s1OfUqZvdhSsa09l00W2iuYRD4WcucPbXNnXZaABnvw5lL3CWkikM1J
         egmb5oF0McHRuBwYs0Un9vra3pe0U1VqmzGCrr5Wwf+guZYL85+RVrwHEpbYKVfbOafP
         Rvn6jYaUHsmyrrsKk3cJhT58u1sdl0C7KD0Z/p2LzSuP6jWyLMbty7hR32A5LGBIxnpR
         BFPsXB0niI+zXGiA0YGDc9Ct2yiWDtIiW/pqAhXVsNucvqHd7pXg52KHSv/qHPXOspYo
         7S8w==
X-Gm-Message-State: AOAM533f+QMX7GDdNUdnxXblbBgpis6DSdhGqKctbpuvDYT9lGj1Da6I
        oRIGBnffxkjDVIVtnRMAZ6NUJeCj5ZX+bpu+Gqg=
X-Google-Smtp-Source: ABdhPJxNWLG001+2sbRzR9a1YzZW1kVAAzGBvWKrZFEGwMvPUNnzPeYAWnH96NaUKBGIxMQVNK7fMbGGhBLnRKxlNZE=
X-Received: by 2002:a17:90a:5417:: with SMTP id z23mr14285066pjh.111.1613367853128;
 Sun, 14 Feb 2021 21:44:13 -0800 (PST)
MIME-Version: 1.0
References: <CANiq72knSgMU30A2ALaJGY5FWumPKU18ThvfjR1t14_77kYLrQ@mail.gmail.com>
In-Reply-To: <CANiq72knSgMU30A2ALaJGY5FWumPKU18ThvfjR1t14_77kYLrQ@mail.gmail.com>
From:   Alex Gaynor <alex.gaynor@gmail.com>
Date:   Mon, 15 Feb 2021 00:44:02 -0500
Message-ID: <CAFRnB2XAs0YEeLQV-wNt9p8f377ANTqhxbj0eq55=eh2BDLp8A@mail.gmail.com>
Subject: Re: Upstreaming plan
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

For folks who haven't committed them to memory,
https://github.com/Rust-for-Linux/linux/issues?q=is%3Aissue+is%3Aopen+label%3A%22upstream+-+required%22
is our list of issues that we currently think are shoul be done
pre-upstreaming. I'll commit to taking on #53, hopefully this week.

Thanks for putting this schedule together Miguel!

Alex

On Mon, Feb 15, 2021 at 12:37 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi all,
>
> I think we are in a reasonable position to start thinking about
> upstreaming. While things are still experimental and will be for a
> while; and while there are many bits to be solved (e.g. an example
> driver and everything it may entail), the setup is closer to how
> things will look like, which means maintainers can start giving
> feedback. Plus things look fairly usable for other developers too.
>
> Today v5.11 was released, and this is the approximate kernel release schedule:
>
>   2021-04-18 v5.12 released
>   2021-05-02 v5.13 end of merge window
>   2021-06-13 v5.13 released
>   2021-06-27 v5.14 end of merge window
>
> I propose we target v5.13's merge window for the upstreaming. If we
> don't make it (likely), that is fine, we can use it as a test drive to
> solve whatever is left and be ready for v5.14.
>
> To that end, the plan can be:
>
>   - Up to around 2021-03-28 (6 weeks): finish whatever features we may
> want to have in the initial PR; including cleanups and any example
> module/driver, etc.
>
>   - 2021-03-29 - 2021-04-04 (1 week): Then I will rebase and draft a
> series for upstreaming. Here it is where we should do a full review of
> the entire diff, just in case something got messed up in the different
> syncs, plus allows us to spot any final touches.
>
>   - 2021-04-05 - 2021-04-18 (2 weeks): Send the series as an RFC 2
> weeks or so before v5.13 merge window to the LKML. This way we get
> some general feedback and discussion, plus Linus et. al. can be aware
> we might send it. Depending how things go here, we can decide whether
> to go for v5.13 merge window or delay to v5.14 (then the same plan
> would apply, shifted by 2 months).
>
> Thoughts welcome! -- Specially if you have something baking that may
> need more time than those initial ~6 weeks (e.g. you are busy etc.).
>
> Cheers,
> Miguel



-- 
All that is necessary for evil to succeed is for good people to do nothing.
