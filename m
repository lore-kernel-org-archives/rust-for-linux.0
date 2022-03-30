Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3615CC433F5
	for <rust-for-linux@archiver.kernel.org>; Wed, 30 Mar 2022 04:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbiC3EdR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 30 Mar 2022 00:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242586AbiC3EdQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 30 Mar 2022 00:33:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7072921E37
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Mar 2022 21:31:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CD65561560
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Mar 2022 04:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D12C340F0;
        Wed, 30 Mar 2022 04:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1648614691;
        bh=C2luH/s+fJ+OwT7JwgehGauCcr8Fg8M34oXudNWmX6E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1MPgHLnSZyivqdHbZWqLf+BD+YQtI2DUQkfombC3qioLbnRSP/DcROmIFFw/M1cPh
         +KxfxSfUvkoUeq+kbrAolsntFth+6tQ4D3J5sJQCCaowheogKORtQuAWqLw9Dfulas
         yxGfo5m1ynhewh131RqogPG5iYpjYEzpLgshKKG0=
Date:   Wed, 30 Mar 2022 06:31:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chris Suter <chris@sutes.me>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Geert Stappers <stappers@stappers.nl>,
        rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Fwd: Adding crates
Message-ID: <YkPdIMowqBsJORiK@kroah.com>
References: <CAKfU0DKvQYjhgiKN83+DZW3CQOkSEdQcy9nXUfFLVn1Uju6GkQ@mail.gmail.com>
 <CAKfU0DLS5icaFn0Mve6+y9Tn1vL+eLKqfquvXbX4oCpYH+VapQ@mail.gmail.com>
 <20220328054136.27mt2xdaltz4unby@gpm.stappers.nl>
 <CAKfU0D+gaC6s6kBBQ9OV+E9PFcm997efY-cUwP3bFWmuDDugbA@mail.gmail.com>
 <YkKXvnsvr0qz/pR2@kroah.com>
 <CAKfU0DLv3K7benXuofXqJwsgxUHA10bu8XWmyBZ0Z_PpZFMACg@mail.gmail.com>
 <CANiq72mrBpJm_6rjapicBoO_mkg4_hEpi9aRTAkj+gtiGkC3Aw@mail.gmail.com>
 <CAKfU0DJ1AqR4cy4=706qRGESozHii9dPL5BYQV047cZkyn3RzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfU0DJ1AqR4cy4=706qRGESozHii9dPL5BYQV047cZkyn3RzA@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Mar 30, 2022 at 11:03:50AM +1100, Chris Suter wrote:
> Hi Miguel,
> 
> On Wed, Mar 30, 2022 at 2:47 AM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Tue, Mar 29, 2022 at 9:49 AM Chris Suter <chris@sutes.me> wrote:
> > >
> > > I'm interested in quite a few crates but the first and perhaps most
> > > significant would be futures. I'm not necessarily looking for a
> > > "generic" solution at this point, any solution would do — just enough
> > > to help me make a little progress and then maybe I could contribute
> > > back later. I can probably figure it out myself, but I was hoping to
> > > save some time.
> >
> > If you are just looking to experiment with some third-party crates,
> > then as mentioned in the other thread, what you could do is copy and
> > adapt the code. For instance, if the crates you need do not use Cargo
> > build scripts, this may be as simple as copying the sources of the
> > Rust modules into your kernel module (which is a crate), so that you
> > do not need to deal with build systems.
> 
> I'm working with an existing code base and there are quite a few
> crates I need to bring in or find replacements for. I'm hoping to
> minimise or isolate the changes I need to make to the existing code
> base. Obviously, some changes are going to be unavoidable.

What type of existing Rust codebase should be ported to be inside the
kernel?

> > But if you are looking to do something else, then please note there is
> > no plan to add support for building/linking against third-party
> > crates. This is why we ask what crates would be useful and why -- so
> > that we can consider adding similar facilities to the kernel (possibly
> > importing those third-party crates).
> 
> Like I said, I'm interested in futures. Why it's useful: async Rust is
> arguably more common and easier to use than other forms of
> multi-threaded processing. Other crates that I'd like: anyhow,
> bincode, byteorder, log, once_cell, pin-project, rand, serde, slab,
> static_assertions, uuid plus some more esoteric ones.

Almost none of those make sense when you are writing kernel code.  Are
you sure you want all of this within the kernel itself?

What does this codebase do?  Have a link to it anywhere?

thanks,

greg k-h
