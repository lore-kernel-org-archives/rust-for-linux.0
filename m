Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFD7C433DB
	for <rust-for-linux@archiver.kernel.org>; Mon,  1 Feb 2021 20:32:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FAF564EC8
	for <rust-for-linux@archiver.kernel.org>; Mon,  1 Feb 2021 20:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhBAUbp (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 1 Feb 2021 15:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhBAUbo (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 1 Feb 2021 15:31:44 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D80C061573
        for <rust-for-linux@vger.kernel.org>; Mon,  1 Feb 2021 12:31:04 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id q201so14612998ybg.8
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Feb 2021 12:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J1mQYNuWMgMXC8DcK6FLAJGsEbMrh/ZixKrwoHEnqdc=;
        b=Nm3086fLqseyC1gaJFx/4uGp710mhL5lYqf07FC6UAHi83j0ABuN/Q61GmkvTrmBRA
         0lR7R4p+jkMzMWlTB79/9EKsHBw3yEjWhJHBe3y/G2VLDRG/wwLkO2ZmzSImBfpDMSRK
         YPLBq8L+vLLKkTtVDqJtCxH44q0bd0NoTQYrFZV/Z9kpa3wxuhkFdgQRoh7ftkEU8aL0
         bPaIZJmUpAQtrZsK00Utn9TAm1blTO9njMrYgqeUYMPT9jYdkOEoznMMBjF618za1Eix
         E5SZHlPE9V6zis1dNr/mwYp9PkTnVC4/ixAc+QCNHjefdmkAWx0wsmoTg60kgG2+7Nts
         Y3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J1mQYNuWMgMXC8DcK6FLAJGsEbMrh/ZixKrwoHEnqdc=;
        b=CrYJ7wjRf4ODdLGTBfhq3Sx55E8vRn54gJT0ZPfSUk6ziwQCq/efQaUGuRWxA0WoeB
         tXX+/WUNgvyTLMmR9D/WMhAY2ADlN1pP86/z3foLhnDvmrb0jXbZU2iKoAeF+3TeU4Ge
         YPIsQDxcinFgsVufiWorrfBP/gIIDWJRKkOtc/W4dgkQAz7VDjdyZWq1+j8Hr32NXPny
         mQL9NAOUCJpyTJZ+E7W94dv+1lotnNGBwLbMevIh5ZWR/w/aS1+WjWZJ+MB8UTzWkbvb
         SjI9BRHfgfdu3ZtJtXPyje/M0BU15NLlLM88JFqvoLfW50r7AA818aKrUU93vVCojz7a
         OuPQ==
X-Gm-Message-State: AOAM532ZAhEVuOdSJeUSPTxqT9cYP9B8H0aOrMts8VAbef8KGrh1wPZ9
        vL9IN84Gx807nPV8GcuCjhkhRLAzLGfFwU6AKTc=
X-Google-Smtp-Source: ABdhPJxhz3ER1+YH7acSX/WuL8IFjcl11EGi61DVr4ke+lHoliya8Fr3CMd/nmdcJBdtOaiAzDH/XWNOyT11gXt+lWg=
X-Received: by 2002:a25:2d43:: with SMTP id s3mr11983364ybe.33.1612211464067;
 Mon, 01 Feb 2021 12:31:04 -0800 (PST)
MIME-Version: 1.0
References: <CAKwvOd=5CWsfW-UY-k0ocTwLV0nLq3sUVVmFvNPLmTcqFxTz9Q@mail.gmail.com>
In-Reply-To: <CAKwvOd=5CWsfW-UY-k0ocTwLV0nLq3sUVVmFvNPLmTcqFxTz9Q@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 1 Feb 2021 21:30:53 +0100
Message-ID: <CANiq72k+6vxpxNPKFJH+thWG7jwgLXnMZ03pU+TZfuHjOphSAg@mail.gmail.com>
Subject: Re: "ClangBuiltLinux: What's Next?" - Nick Desaulniers (LCA 2021 Online)
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Nick,

On Mon, Feb 1, 2021 at 8:28 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> https://youtu.be/GpiWVXKs9Z0

Thanks for the Rust for Linux slide! (Cc'ing the ML).

By the way, since you mention it in the slides: I am on the WG14
committee, so I can try to help anybody that wants to bring a paper
related to the kernel. For instance, N2631 secure_clear is a paper I
am working on to give C a way to guarantee a memory clear which is
used in the kernel and other projects (and we had bugs with it in the
past!).

Cheers,
Miguel
