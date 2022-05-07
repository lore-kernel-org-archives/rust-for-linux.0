Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10606C433F5
	for <rust-for-linux@archiver.kernel.org>; Sat,  7 May 2022 17:30:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357178AbiEGRem (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 7 May 2022 13:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348737AbiEGRel (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 7 May 2022 13:34:41 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE8B1CFE9
        for <rust-for-linux@vger.kernel.org>; Sat,  7 May 2022 10:30:54 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id g23so11889885edy.13
        for <rust-for-linux@vger.kernel.org>; Sat, 07 May 2022 10:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SbGNwQXbrJylNFijJzYWuzwhfMF9JmIb4u30urdLo90=;
        b=bPxox2idQ5mR+ZFEf9mfeAxCDTS84W20pUAAr0BAsuIU6hEdstpbHfWZFBKAsJLFU9
         ElJdN/QYHmpMXFO4F3E/to6yH7mhKnRsB+z77K9YaCScoNDi4r9VBISYrwNWPgrPO5yg
         UCPEJQERyMfz+7EaUWKSAM5jJ6WElGolbN/xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SbGNwQXbrJylNFijJzYWuzwhfMF9JmIb4u30urdLo90=;
        b=pVm7VED9KsjjkzQ1X64NZMije2cRTtvj+FCG5E53bxvUoy2hAJScZ/LzCSByjs5W4G
         e1aoV0IxL3Mi6kWlnBd9c+1h0PzzPXVUJhWHixPWaZQczTSV7qfQcF6QKWXFHnU2OxA6
         5N+Zd3SFCvr8eZM4bTBIY/Fnq3szCGKALugNtpz39hzHwozGzrxgG3XRXOkuAceIfoGo
         co5Nk7VC2iFNujo9LG7onOLJCbd8f3ORcydOW+zaZYMyycobezNboQ9dC+hvxMe96Asv
         JCJbOqS1/8tz0l0HxwCw/0iv56C1wow0lQsyTWKrguSwYiOjgTk+NSPo0CrHPoz/iKO6
         zXEA==
X-Gm-Message-State: AOAM5303MfrIaOZ0kGtY2z384P7AVxpM/MfJXNzvc7H0vJL3mIpEp/eb
        0PS7S3n79ndh6xz05DF+P6Xqz4ZN+4+49IK8
X-Google-Smtp-Source: ABdhPJy75kFjxJdxMPkKcTMywFbBoRfSvyOKC/0rOiXDgAnjEgivEBLvDqqTs+BsMvN3g/wWGb0Svw==
X-Received: by 2002:aa7:cd70:0:b0:426:49a3:9533 with SMTP id ca16-20020aa7cd70000000b0042649a39533mr9310245edb.34.1651944652408;
        Sat, 07 May 2022 10:30:52 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id g10-20020aa7dc4a000000b0042617ba63basm3721054edu.68.2022.05.07.10.30.51
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 May 2022 10:30:51 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id p189so6206886wmp.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 May 2022 10:30:51 -0700 (PDT)
X-Received: by 2002:a05:600c:4f06:b0:394:836b:1552 with SMTP id
 l6-20020a05600c4f0600b00394836b1552mr3211905wmq.145.1651944650603; Sat, 07
 May 2022 10:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220507052451.12890-1-ojeda@kernel.org> <20220507052451.12890-8-ojeda@kernel.org>
In-Reply-To: <20220507052451.12890-8-ojeda@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 7 May 2022 10:30:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh00UW9i+hGYjmLZW5MOAti9FFBarGBL909k5PfH4r2fg@mail.gmail.com>
Message-ID: <CAHk-=wh00UW9i+hGYjmLZW5MOAti9FFBarGBL909k5PfH4r2fg@mail.gmail.com>
Subject: Re: [PATCH v6 07/23] rust: import upstream `alloc` crate
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, May 6, 2022 at 10:26 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> This is a subset of the Rust standard library `alloc` crate,
> version 1.60.0, from:
>
>     https://github.com/rust-lang/rust/tree/1.60.0/library/alloc/src
>
> The files are copied as-is, with no modifications whatsoever
> (not even adding the SPDX identifiers).
>
> The next patch modifies [..]

Now, the next patch clarifies this, but I think that you should at
least mention the actual copyright license status here.

Yes, it's MIT/Apache, and yes, that's GPLv2 compatible, but that's not
obvious from this fairly large patch.

And when you then do things like "git blame" to look at where code
came from, you'll see all this code came in through a commit that says
"copied as-is" with just a link that may or may not be stable and
available to whoever looks at it then.

So keep the link for the actual details, but I think that when
importing big chunks like this it's just a good idea to make that
original license explicit rather than "look at that link".

Just saying "MIT or Apache" here, and then having the link as the
"here are the details" would make me happier.

I use git blame all the time to find who to contact when there are
issues, and in that kind of workflow it's fairly unhelpful to see some
reference to "The next patch".

So I agree whole-heartedly with the "import the original, do the
required changes separately", but I would like to see that original
import really explicitly clarify the license status, and not require
people to dig for it through external links.

              Linus
