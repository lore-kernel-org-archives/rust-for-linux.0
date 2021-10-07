Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD237C433F5
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 14:44:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BDE661245
	for <rust-for-linux@archiver.kernel.org>; Thu,  7 Oct 2021 14:44:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242123AbhJGOqj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 7 Oct 2021 10:46:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242097AbhJGOqj (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 7 Oct 2021 10:46:39 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F53C061570
        for <rust-for-linux@vger.kernel.org>; Thu,  7 Oct 2021 07:44:45 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id z24so1609209qtv.9
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Oct 2021 07:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h2WMqBtwnFLyTqXqeBzucsF1CbmEs9P3PKcX4LkuraI=;
        b=dYJRX/2TH+McKePm6tUEbXJ5hSXRAk14ewWJK4oXEom9bdyFS//67cGRlC6l36oW1n
         JKo+VWq7jVwTG0bGGmk5OkwwfS9p/PnxSC/vz94CkV158gJNOEeYjT44Btzue1cJD4Yc
         6t8C4GqTEpSgyF+JsJHa8HBhyRsn1TWvOTWlpMU9n5salNJP3KO0Xe5FlxQtR3F7/gS0
         K5sKjRZ67ZczuI9s/Gw+e5zlHYCx4WVZD7d+153ziErVcfUVZ6Rr3hcBbOIESbFnT41H
         0Eihn1/Al5+BZKZ+kjfe1r6KEIn/me8jkSp0kKk06km0G+mVWMc4bbuuyopzpWE54Z5w
         8mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h2WMqBtwnFLyTqXqeBzucsF1CbmEs9P3PKcX4LkuraI=;
        b=wr1qnzdqOwPi2uQhl6fHO/qmreoBB9M4qGhnHTHAtMiS3De/7r2YgGiIEu6IE5Mwj4
         /9pWxZmTIDmWbQo0qA2C4wqDSh+mlUF3eApXmoMAPxEBMY1tx7QZ/DZT5KjR91Gfpy4Z
         xNVMeOIxMYLTLA0za64snGDmPo174vdzHmXHtGsXv7fdzZLRBDKLGhf5DTPaNTmrW7hg
         KaUZu1h+ZvRvP5AIkQ+U3QS7fJHC9Aw0bnuv0mfUOgYE7PsMjbJXVWkjyUcI22SV1gC9
         QVylzkeBEHf88tgmVnNfMRP5xAs1HipH0u52VJPJbDHAIzAsySik3eJU0IXayljOv2YK
         I90Q==
X-Gm-Message-State: AOAM532I9O7PLs3mKdahR6ccwTOzcrJe7DG41WWeuIjbxrriLXy/gDc/
        UNdugEp5lG4BMZs+DqlvdR1FjqAkHbY8ng==
X-Google-Smtp-Source: ABdhPJz+4qY0V5j/4N6LYlo0y/UPoKio7OvbE12/HpxYZ9mFN3fyuCi3Zy1w/ylpfd4uz/qxnUbhkA==
X-Received: by 2002:ac8:6147:: with SMTP id d7mr5274254qtm.38.1633617884561;
        Thu, 07 Oct 2021 07:44:44 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id l28sm15588797qtn.1.2021.10.07.07.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 07:44:43 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailauth.nyi.internal (Postfix) with ESMTP id D201A27C0061;
        Thu,  7 Oct 2021 10:44:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 07 Oct 2021 10:44:42 -0400
X-ME-Sender: <xms:2gdfYey3TpmV4klGvLTy6Y8crUuTiHLUqH6mMadV5hL7r61RKXhIkg>
    <xme:2gdfYaRzSH10363no8lxl4roJJLAKgCuPf9FkTSr4n2r-7fZoGNGMmEykkChjCpCX
    8GS5mZiql_1fdPdnw>
X-ME-Received: <xmr:2gdfYQXtTjpyFZ-BXrNZb_fgJkpm2Fvg4szDnHzQPx6mWWeumm5v0r8ndGJGIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelkedgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhepleetgeffteekkeehkeeiffekfeeffedujeetteeileetudduffduffdutddt
    feevnecuffhomhgrihhnpehllhhvmhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:2gdfYUjVDNjg9mas7qyubCiMXcKh0D0PKU9f1tw8x4eV0cLh7nSIMw>
    <xmx:2gdfYQBEuc89KjyUXZ4icuuKx8gAFRE9TIA1CXiDtFUCr5hLjn92yA>
    <xmx:2gdfYVKQ4BU290nxtrP_Lc1hwM0uVePm5CyLA68VLJEXRylF999cAA>
    <xmx:2gdfYTPuF_uyfgmwi2yjo8VNSSxCQ_VycMcuw2MO8kHQbVdNvszR3A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Oct 2021 10:44:42 -0400 (EDT)
Date:   Thu, 7 Oct 2021 22:43:36 +0800
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Marco Elver <elver@google.com>
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        rust-for-linux@vger.kernel.org
Subject: Re: Can the Kernel Concurrency Sanitizer Own Rust Code?
Message-ID: <YV8HmFZ6RqPMVmSY@boqun-archlinux>
References: <CANpmjNMijbiMqd6w37_Lrh7bV=aRm45f9j5R=A0CcRnd5nU-Ww@mail.gmail.com>
 <YV8A5iQczHApZlD6@boqun-archlinux>
 <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNOA3NfGDLK2dribst+0899GrwWsinMp7YKYiGvAjnT-qA@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, Oct 07, 2021 at 04:22:41PM +0200, Marco Elver wrote:
> On Thu, 7 Oct 2021 at 16:16, Boqun Feng <boqun.feng@gmail.com> wrote:
> [...]
> > > Also of importance will be the __tsan_atomic*() instrumentation, which
> > > KCSAN already provides: my guess is that whatever subset of the LKMM
> > > Rust initially provides (looking at the current version it certainly
> > > is the case), the backend will lower them to LLVM atomic intrinsics
> > > [1], which ThreadSanitizer instrumentation turns into __tsan_atomic*()
> > > calls.
> > > [1] https://llvm.org/docs/Atomics.html
> > >
> >
> > Besides atomics, the counterpart of READ_ONCE() and WRITE_ONCE() should
> > also be looked into, IOW the core::ptr::{read,write}_volatile()
> > (although I don't think their semantics is completely defined since the
> > memory model of Rust is incomplete). There could easily be cases where
> > Rust-side do writes with lock critical sections while C-side do reads
> > out of the lock critical sections, so Rust-side need to play the
> > volatile game.
> >
> > I'm not sure whether rustc will generate special instrumentation for
> > {read,write}_volatile(), if not, we need to provide something similar to
> > KCSAN does for READ_ONCE() and WRITE_ONCE().
> 
> For volatile (i.e. *ONCE()) KCSAN no longer does anything special.
> This was one of the major compiler changes (-mllvm
> -tsan-distinguish-volatile=1, and similarly for GCC) to get KCSAN
> merged in the end.
> 

Ah, I should have remembered this ;-) Thanks!

Regards,
Boqun

> So if rustc lowers core::ptr::{read,write}_volatile() to volatile in
> LLVM IR (which I assume it does), then everything works as intended,
> and no extra explicit instrumentation is required.
> 
> Thanks,
> -- Marco
