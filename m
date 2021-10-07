Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BAAC433EF
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 14:16:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B43AC61263
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 14:16:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241961AbhJGOSG (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 10:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbhJGOSG (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 10:18:06 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E61CC061570
        for <rust-for-linux@vger.kernel.org>; Thu,  7 Oct 2021 07:16:12 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id w14so6084968qkf.5
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Oct 2021 07:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CqmpeBKXPeCWG5yhm1g9in1p1BGDIrI8z6UPDnu3A0M=;
        b=EkiY7tK+vfhh0rqcUJOQorw8BG5Tut0ol90dSWPGAGgHei59qVUX6t3V6t8meZuljV
         WbiAYhcCFStEOU95atGZesJ3g0bBo1JRsauaZdzuaS3733Htp83UfNYN3nSWqKNLJBZf
         x0m5NqUPDDj7B3Og7ygc+OeIlazyycWzA1AflgoHhOR9c+WwNSMgQ4kNcOaYHlmAJuM5
         wzDzyQj7WH6HglCrR+p/73pvpWxxjqh9UrnVBDrayUGsbFMMsgHu1dSORiyiFFxbzcmz
         feH/eT500VExHOyTepVBoNAEO6VJbwYYsj8gukfKQDFgcRIA2FhGDbRbj3ils0UxdQ6f
         CVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CqmpeBKXPeCWG5yhm1g9in1p1BGDIrI8z6UPDnu3A0M=;
        b=l6jjYN1yY4wKsd8vLjoxlUQuT4tASCH19wgaxD6IvpTTohHsEutdcqx6obVs2H7ka6
         VPABR8Qt9lzaf2KHweiMpOTlRFYSxkRSm+uBKBrKXyDFI4LBRM7S7BBRMyTx65TGSpUF
         kID6b+Zs5kJV9Oe5d2MZA0KY5C+rgqZhux3F6B8VGiS/RyQpydnumrRha/Wecz4Jdbv0
         vDlfMz6vM4OCahnt9KsrqFIqALbkC/KCxrt373TTSZgL4XtuJoPul+Lslv5b24KCzqPL
         zF1zwZoS0WzPmInGuziI5ZZZ8u2dgZMRM44qp4oBs5EPb1raOOrsAzYUy3+D70yd20r/
         crgA==
X-Gm-Message-State: AOAM531lNCB1pzQ2p7FegTmgNnrkQfpE78MmhhGMBnJ4Sv61JlVHjnnc
        bZEehQ0GG1S2lx91cLaeIg4=
X-Google-Smtp-Source: ABdhPJxMxwR0gqz6cQY4HuvIaCZqJIdKB2J9XarqnZvcOXQxG4EqxSpS8HGAm2rBCT6vnKevkAEtOQ==
X-Received: by 2002:a37:9cd0:: with SMTP id f199mr3502256qke.499.1633616171690;
        Thu, 07 Oct 2021 07:16:11 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id m27sm13466456qkm.57.2021.10.07.07.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 07:16:10 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailauth.nyi.internal (Postfix) with ESMTP id C7DBC27C005B;
        Thu,  7 Oct 2021 10:16:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 07 Oct 2021 10:16:09 -0400
X-ME-Sender: <xms:KAFfYQv85wA3-KUbu1G4osk3h2ahqRVu3egJBfBEWZAqpqyRNbQllA>
    <xme:KAFfYddOUvt9KDvC68QQK9RdZxLWi2TMVwiAUbjcwTRZ6NcHtU0AUj4eGaFGOdkM9
    ZF0omy59oTvXaFP9A>
X-ME-Received: <xmr:KAFfYbwTdQzQQkyoNLjNH89CsLytcMlyOr4dp6WivKoUekHy5CvNkR5brVY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgjeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvffukfhfgggtuggj
    sehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvg
    hnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepudfhlefgvdfhieejheev
    heeghfdtjeekfeehgfegheeitdefveevtdevveeghfevnecuffhomhgrihhnpehlihhvvg
    hjohhurhhnrghlrdgtohhmpdhruhhsthdqlhgrnhhgrdhorhhgpdhllhhvmhdrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvg
X-ME-Proxy: <xmx:KAFfYTO7x_u78xpMjaGJN1S7mj_mkX77GWyc338kA1krO5RiMbiyBg>
    <xmx:KAFfYQ9Lgq-9WBCdX7n2VpkcABckbNXoCIG6InQDgV_rSnXudMxZvw>
    <xmx:KAFfYbULpH41YRMC3fOb2itpJiLnfKDcOGvWYz1Ta-tx8-6ht4tG0g>
    <xmx:KAFfYfZSPDjtqbPPz-RyfxO3DxqnGuFulZ_gSu9Lfpix8S8HKmgREg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 10:16:08 -0400 (EDT)
Date:   Thu, 7 Oct 2021 22:15:02 +0800
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Marco Elver <elver@google.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux@vger.kernel.org
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <YV8A5iQczHApZlD6@boqun-archlinux>
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

Hi Marco,

On Thu, Oct 07, 2021 at 03:01:07PM +0200, Marco Elver wrote:
> Hi Paul,
> 
> Thanks for writing up https://paulmck.livejournal.com/64970.html --
> these were also my thoughts. Similarly for KASAN.
> 
> Sanitizer integration will also, over time, provide quantitative data
> on the rate of bugs in C code, unsafe-Rust, and of course safe-Rust
> code as well as any number of interactions between them once the
> fuzzers are let loose on Rust code.
> 
> Re integrating KCSAN with Rust, this should be doable since rustc does
> support ThreadSanitizer instrumentation:
> https://rustc-dev-guide.rust-lang.org/sanitizers.html
> 
> Just need to pass all the rest of the -mllvm options to rustc as well,
> and ensure it's not attempting to link against compiler-rt. I haven't
> tried, so wouldn't know how it currently behaves.
> 

Thanks for looking into this, and I think you're right: if rustc
supports ThreadSanitizer, then basic features os KCSAN should work.

> Also of importance will be the __tsan_atomic*() instrumentation, which
> KCSAN already provides: my guess is that whatever subset of the LKMM
> Rust initially provides (looking at the current version it certainly
> is the case), the backend will lower them to LLVM atomic intrinsics
> [1], which ThreadSanitizer instrumentation turns into __tsan_atomic*()
> calls.
> [1] https://llvm.org/docs/Atomics.html
> 

Besides atomics, the counterpart of READ_ONCE() and WRITE_ONCE() should
also be looked into, IOW the core::ptr::{read,write}_volatile()
(although I don't think their semantics is completely defined since the
memory model of Rust is incomplete). There could easily be cases where
Rust-side do writes with lock critical sections while C-side do reads
out of the lock critical sections, so Rust-side need to play the
volatile game.

I'm not sure whether rustc will generate special instrumentation for
{read,write}_volatile(), if not, we need to provide something similar to
KCSAN does for READ_ONCE() and WRITE_ONCE().

Regards,
Boqun

> Thanks,
> -- Marco
