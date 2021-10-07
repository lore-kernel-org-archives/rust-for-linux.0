Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6DBC433F5
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 17:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FBA761248
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 17:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233719AbhJGRqI (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 13:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhJGRqH (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 13:46:07 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F363FC061570
        for <rust-for-linux@vger.kernel.org>; Thu,  7 Oct 2021 10:44:13 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id 134so7640113iou.12
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Oct 2021 10:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Z2Nt1ECMKgdwM/761fTZR4jFazW97iKGpDreDJ78HM=;
        b=Ts9uM/Uzc9verEDTKWviRpy/nsNMvS+Kt2KXoAeTzwvFu0VEG1oMALpcKle2r4kS57
         f3kOTK5X8wmOpH7S8Ha2Jen4gtwd9SMrXnvlrmCmfo4KrhaiLxmtDuC1td4T3mK5GAci
         AP5uQZsY+FjKt9K2nlAtD8Dl6QJGx3EK5KSDV3Ms0cOs5B1pHTM4P1YaRj5jaX3dNNM6
         zYb+HeHdEF5an9Vf6aE36roW/OA0RcZ/G6seXmS+dbJ/16B5yIxxEVdzL1L1HRqb524e
         3KgeYodhM3oa7BefA4hDW/JGxMhywxZKVvy0yRDRdAe4jzMaYRrAopFD+zxW3T6AdC8C
         8H8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Z2Nt1ECMKgdwM/761fTZR4jFazW97iKGpDreDJ78HM=;
        b=Hf/ppHTDdfYwcXOP+0yvPbwpLX7XTVUkpo8jeo5jKhlFYAcKVQJ+iXUJF+GDFjt5oU
         KCOcWas61t/K1TNABmn5Tejom/7PTpyKad6/12c2sf2M7JCsjhl44rJPEpsRhOm2Hi5/
         nOnz36gQv+nFFTH4mXRNaUGQf5inqCVRjJ+0IcvkwSnIuOclQ7dz9viwRMXica3ac8Tx
         R8cBhanqwsfWzeLamY6GcT/uoBjHsPISfuKYTTkmZjNfzXCHCzSVJ1bzwNEqOfNOltly
         N36tzhLDmF/X7xIjPL6Rvs/OTdDj1mwXOYBigboc2g96mYU0QkjsI2XmqNjbMoK7RQt0
         TqRg==
X-Gm-Message-State: AOAM531KxeeGH79WqVF6NPcGRwkuBIEcqMAYrHOJ5unI0EeeScd14+tA
        LqFT1E6ZN+MeQJspRWU/QXJJ4JuXLkH0ztpiWD0=
X-Google-Smtp-Source: ABdhPJxLH0IMP69exwFsNlgKLghlCksriJa5TljJvXbJd7fldVUeTuy+Ycz216UvnjH287B/K/YWHEh7nm1QXXfT2zE=
X-Received: by 2002:a05:6638:297:: with SMTP id c23mr4122812jaq.131.1633628652593;
 Thu, 07 Oct 2021 10:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux> <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
In-Reply-To: <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 7 Oct 2021 19:44:01 +0200
Message-ID: <CANiq72k2TwCY1Os2siGB=hBNRtrhzJtgRS5FQ3JDDYM-TXyq2Q@mail.gmail.com>
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
To:     Marco Elver <elver@google.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Oct 7, 2021 at 5:47 PM Marco Elver <elver@google.com> wrote:
>
> So if rustc lowers core::ptr::{read,write}_volatile() to volatile in
> LLVM IR (which I assume it does)

Yeah, it should, e.g. https://godbolt.org/z/hsnozhvc4

Cheers,
Miguel
