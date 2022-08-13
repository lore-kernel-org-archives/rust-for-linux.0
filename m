Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB94EC19F2D
	for <rust-for-linux@archiver.kernel.org>; Sat, 13 Aug 2022 15:31:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239756AbiHMPbF (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 13 Aug 2022 11:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239475AbiHMPbE (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 13 Aug 2022 11:31:04 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67BED1A836
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Aug 2022 08:31:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C20BFCE092B
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Aug 2022 15:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2717C433D6;
        Sat, 13 Aug 2022 15:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660404660;
        bh=F+5eRj8KAg7yAauMLZ5FO/kcKTjXMbKMpWKcBd+pejY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B1WWUIKUHENgf4SvTqomRTMH0DwY6cAum9/VxTorQ6RZU5/JKi7TTO768VKGCLN9/
         u0qzmRTQTc11ftrY0Zf7qhtYCck2mBZmDhw+t4x6ifYYNeTsEbsGMIX/aTZocMOIwz
         T9itSnCnzyi5cBlCE2lrJLY33ukAPb+1gsCbu3Jw=
Date:   Sat, 13 Aug 2022 17:30:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Asahi Lina <lina@asahilina.net>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Rust for Linux <rust-for-linux@vger.kernel.org>
Subject: Re: Writing the Apple AGX GPU driver in Rust?
Message-ID: <YvfDsavi5gkmbTjh@kroah.com>
References: <70657af9-90bb-ee9e-4877-df4b14c134a5@asahilina.net>
 <CANiq72=71W-d7385YySknCWrToigDwrQ6nz2fh2zEWSQtrH2qg@mail.gmail.com>
 <a5a60b82-4079-b637-405d-78ac425174d9@asahilina.net>
 <CANiq72nAajzDYdaW9bHR9_KcLUudN3FX50fvh0ObqhWS7V69-A@mail.gmail.com>
 <2e32387f-e232-58b2-611f-37a72d7db140@asahilina.net>
 <CANiq72=Miq=7m2eDYX2mp2udzz_uiJhLvq+Ojy3tiMxas=+qww@mail.gmail.com>
 <048d48aa-c11b-35f4-afba-47446b4ecdef@asahilina.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <048d48aa-c11b-35f4-afba-47446b4ecdef@asahilina.net>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Aug 14, 2022 at 12:06:08AM +0900, Asahi Lina wrote:
> > From what I have been told, dual-licensing in the kernel quickly makes
> > things trickier. Whether your case would be an issue or not depends on
> > the tree that will pick up your patches, whether they accept
> > dual-licensed stuff, whether the thing being abstracted is GPL-only or
> > not, etc.
> 
> That's odd, I've never heard of dual-licensing being an issue in the
> kernel. Lots of drivers are dual licensed, as is the DRM core as I
> mentioned... I did a quick search for SPDX lines and about 10% of them
> are some kind of dual license in the entire kernel.

Most of those are legacy drivers and/or for the few Linux subsystems
that do allow this, like DRM.

For some subsystems that did dual-licensing, like IB, they regret doing
that as it has caused nothing but pain and suffering over time and there
was no benefit in the end at all..  Other subsystems can handle this
properly but it is a lot of extra work that usually isn't worth it
(again, DRM is the exception, they know what they are doing here.)

For new stuff, in subsystems that do not do this, it gets really really
tricky very quickly.  Talk to licensing lawyers about all of the issues
involved if you want the gory details.  Because of this, I require new
files that are added to subsystems that I maintain to have a lawyer from
the company involved to sign-off on the patch to verify that they
understand the issues and are ok with this.

One of the biggest issue is having dual-licensed code use code from
gpl-only subsystems.  What happens then is ripe for lots and lots of
arguing by lots of lawyers.  For core interface code, like the Rust core
is, avoiding all of that nightmare is a good idea by just keeping it
simple as a single license (GPL) to remove any arguing at all.

So be careful here.  If you are adding a new driver, sticking with what
the existing subsystem does is good (and probably required as you did
copy code from those existing drivers when writing your driver).  But
for new stuff and new subsystems, be very careful and consult a lawyer
if you have problems.

And as many people have stated many times in the past, if you can't
consult a lawyer, then just stick with the single license as it's not
worth the trouble or problems of trying to do something out-of-the
ordinary.

But again, I'm not a lawyer, talk to one if you want the full gory
details.

thanks,

greg k-h
