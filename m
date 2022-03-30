Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00512C433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 30 Mar 2022 20:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350071AbiC3Upo (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 30 Mar 2022 16:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350915AbiC3Upn (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 30 Mar 2022 16:45:43 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA44C46B1A
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Mar 2022 13:43:56 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id b17so8229292qvf.12
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Mar 2022 13:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=putBo6CBsYkIAA4IlvMFhQgc/ET6bDe3sdb3HiCWzpo=;
        b=hB8kOy54je+6CwItfI3ew4drTjAcRt6sURCXAsmK+Ke3TpnCWfq/mGVH5OYCH4G8Il
         aqqvvDccb8Oain7gVUujhNqRvzCa8VFrv/zsXb2TKxU+oTUORiUfCyky7NiBKB1InPtX
         HPbfyzA86qMbwLvCQQy1DQgj3jqBEu+3A42KJ9mD/Cv5i+I0cnJ++IRnvV4pT8PtWMef
         pygC9HAmKyKCf6nyEBIBH2SX3l0aTjfbEFaKJQTl63gQCcDL2NJZTkmFtpwuHg8sXHHz
         mWHCTk1iBaYPf4wZvFtVIn0Kuv8GtTgnwV1qSixpfwPA2k1+j67dhhGk0G7s/Qy0u74f
         Tttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=putBo6CBsYkIAA4IlvMFhQgc/ET6bDe3sdb3HiCWzpo=;
        b=kpugjgE9cGq/hVRrm/UcepSkQT0rLjSFj89wL8KMHtFJvbiMzLXdjeaKaL3mCUOplB
         Ey2gS82dzUosVV7KqQrjc+raU8tz0EFa4GeZONV6+13CwvLZb0aIr42ACWtxpWvHIrUW
         xD148I/YNrpTaW1XPIaDYAxSg/2InDBEpku0/d+w41TBPjc9iGR9zjMnkdguZ60U919V
         zODy0p264DI6QA/7ibCfm0nTG40ubfqFkw21PU0XZ7ofZtT/wls5PiAB8dyn/DByPzE/
         N9AzXxNyL8dKFTIqxsk2xU/hkGfPmw+ODk6DJMPKwiyXQCscsPRgRu+KoBCCgyPjUkuC
         ZEOQ==
X-Gm-Message-State: AOAM532P0AkwwbtqmRbGVfr1lSCn1nyBtYko8ChGA/czeGUxs5ybsyAM
        5ZmduWZa7VHGo6QEtb2NcxQuZOf8RWUd
X-Google-Smtp-Source: ABdhPJy9STF0LB+BUxRwDzntiryO0paw/vhgc9yXbE+Gk9y8/dmZquzovp6aaXfrDIsABl0DZAT97Q==
X-Received: by 2002:a05:6214:1d29:b0:440:f6d0:fd29 with SMTP id f9-20020a0562141d2900b00440f6d0fd29mr1313446qvd.62.1648673035891;
        Wed, 30 Mar 2022 13:43:55 -0700 (PDT)
Received: from moria.home.lan (c-73-219-103-14.hsd1.vt.comcast.net. [73.219.103.14])
        by smtp.gmail.com with ESMTPSA id bm1-20020a05620a198100b0047bf910892bsm12277499qkb.65.2022.03.30.13.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 13:43:54 -0700 (PDT)
Date:   Wed, 30 Mar 2022 16:43:53 -0400
From:   Kent Overstreet <kent.overstreet@gmail.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Chris Suter <chris@sutes.me>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Geert Stappers <stappers@stappers.nl>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Fwd: Adding crates
Message-ID: <20220330204353.57w3fxtaw4wwqvi3@moria.home.lan>
References: <CAKfU0DKvQYjhgiKN83+DZW3CQOkSEdQcy9nXUfFLVn1Uju6GkQ@mail.gmail.com>
 <CAKfU0DLS5icaFn0Mve6+y9Tn1vL+eLKqfquvXbX4oCpYH+VapQ@mail.gmail.com>
 <20220328054136.27mt2xdaltz4unby@gpm.stappers.nl>
 <CAKfU0D+gaC6s6kBBQ9OV+E9PFcm997efY-cUwP3bFWmuDDugbA@mail.gmail.com>
 <YkKXvnsvr0qz/pR2@kroah.com>
 <CAKfU0DLv3K7benXuofXqJwsgxUHA10bu8XWmyBZ0Z_PpZFMACg@mail.gmail.com>
 <CANiq72mrBpJm_6rjapicBoO_mkg4_hEpi9aRTAkj+gtiGkC3Aw@mail.gmail.com>
 <CAKfU0DJ1AqR4cy4=706qRGESozHii9dPL5BYQV047cZkyn3RzA@mail.gmail.com>
 <YkPdIMowqBsJORiK@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkPdIMowqBsJORiK@kroah.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Mar 30, 2022 at 06:31:28AM +0200, Greg KH wrote:
> On Wed, Mar 30, 2022 at 11:03:50AM +1100, Chris Suter wrote:
> > Hi Miguel,
> > 
> > On Wed, Mar 30, 2022 at 2:47 AM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > On Tue, Mar 29, 2022 at 9:49 AM Chris Suter <chris@sutes.me> wrote:
> > > >
> > > > I'm interested in quite a few crates but the first and perhaps most
> > > > significant would be futures. I'm not necessarily looking for a
> > > > "generic" solution at this point, any solution would do — just enough
> > > > to help me make a little progress and then maybe I could contribute
> > > > back later. I can probably figure it out myself, but I was hoping to
> > > > save some time.
> > >
> > > If you are just looking to experiment with some third-party crates,
> > > then as mentioned in the other thread, what you could do is copy and
> > > adapt the code. For instance, if the crates you need do not use Cargo
> > > build scripts, this may be as simple as copying the sources of the
> > > Rust modules into your kernel module (which is a crate), so that you
> > > do not need to deal with build systems.
> > 
> > I'm working with an existing code base and there are quite a few
> > crates I need to bring in or find replacements for. I'm hoping to
> > minimise or isolate the changes I need to make to the existing code
> > base. Obviously, some changes are going to be unavoidable.
> 
> What type of existing Rust codebase should be ported to be inside the
> kernel?

Greg, I think your point of view made sense in the past, but the world is
changing. We used to not want to share code between kernel space and userspace
as much in the first place, and in C it has historically been impractical, but
consider the following:

 - We already have large swaths of code being imported from userspace into the
   kernel as-is - e.g. zstd, and I bet I could find a lot more if I went
   digging.

   Right now we do this by just importing the code wholesale, but when changes
   end up needing to be applied for it to work in the kernel, this is a
   maintenance nightmare when we then need to re-merge from upstream.

   It would be far better to get the changes needed for use in the kernel merged
   with upstream, and then just use upstream directly like any other package
   (with version pinning, so that when upstream changes, we review those changes
   before updating the version the kernel depends on). And Rust's conditional
   compilation & generics story is _much_ better than what we've had in the past
   in C and C++, meaning writing Rust code that works in both userspace and
   kernelspace is much saner than in the past.

 - People are also starting to want to take kernel code and use it in userspace
   more often. In filesystem land, where I want, you need to do this or else you
   have massive duplication (& corresponding maintenance nightmare) between
   kernelspace and e.g. userspace fsck. In other areas, people just want to be
   able to write and run tests in userspace - e.g. xarrays, maple trees, and
   this is something we should encourage!

   But, when the kernel space & userspace environments are completely different,
   this is a massive undertaking. For bcachefs I had to write shim
   implementations for a _ton_ of code, most of which was quick and dirty
   throwaway code that's a pain in the ass to work with and that I would really
   like to delete.

The solution to problems like these are to stop thinking that kernelspace and
userspace _have_ to be completely different beasts - they really don't have to
be! and start encouraging different thinking and tooling improvements that will
make our lives easier.

In the kernel we also reinvent the wheel a _lot_ with our core data structures.
Some of the stuff we have is awesome, some is... amazing in some ways but
terrifying to have to deal with when it breaks (rhashtables, I'm looking at
you), but often the glaringly obvious basic stuff is missing - why do we have
nothing like CCAN darray? never mind, I finally just wrote one...

But code sharing for core data structures is finally starting to look tractable:
kernel side GFP flags is getting deprecated in favour of
memalloc_no*_save/restore (thank you Willy!) - that's a big one. And the Rust
people, to their credit, have been taking seriously kernel land's needs to
always check for memory allocation failure - Rust is explicitly targeted at bare
metal, kernel stuff!

Anyways. Just try and keep an open mind...
