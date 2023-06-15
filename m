Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC8FEB64D9
	for <rust-for-linux@archiver.kernel.org>; Thu, 15 Jun 2023 12:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjFOMvR (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 08:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238684AbjFOMvQ (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 08:51:16 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C052E2135;
        Thu, 15 Jun 2023 05:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=MNAFuQ8hfKgcuhcvIiasDHuTSCnTCBsJ0odlSe3mtpo=; b=ZE/hkQauX0ZWwfou6azbigdIDb
        g4SndsqHBZub9QEdIt8HsBqpJGSdW5fRiiWw/KK2qe5fBQfRNnKltBwcQPUQDr35vdeNnV4fcLFg3
        J7UAZG+2uWeVJIOJpK7Mw4Dxnvs3UVVSw0Xgyr2FvzDxvcCH5iSbfEmR10YsFSTFz8JU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q9mRS-00Gafp-Fr; Thu, 15 Jun 2023 14:51:10 +0200
Date:   Thu, 15 Jun 2023 14:51:10 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
 <20230614230128.199724bd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614230128.199724bd@kernel.org>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jun 14, 2023 at 11:01:28PM -0700, Jakub Kicinski wrote:
> On Tue, 13 Jun 2023 13:53:21 +0900 FUJITA Tomonori wrote:
> > This patchset adds minimum Rust abstractions for network device
> > drivers and an example of a Rust network device driver, a simpler
> > version of drivers/net/dummy.c.
> > 
> > The dummy network device driver doesn't attach any bus such as PCI so
> > the dependency is minimum. Hopefully, it would make reviewing easier.
> > 
> > Thanks a lot for reviewing on RFC patchset at rust-for-linux ml.
> > Hopefully, I've addressed all the issues.
> 
> First things first, what are the current expectations for subsystems
> accepting rust code?
> 
> I was hoping someone from the Rust side is going to review this.
> We try to review stuff within 48h at netdev, and there's no review :S

As pointed out elsewhere, i've looked the code over. I cannot say
anything about the rust, but i don't see anything too obviously wrong
with the way it use a few netdev API calls.

> My immediate instinct is that I'd rather not merge toy implementations
> unless someone within the netdev community can vouch for the code.

It is definitely toy. But you have to start somewhere.

What might be useful is an idea of the roadmap. How does this go from
toy to something useful?

I see two different threads of work.

One is getting enough in place to find where rust is lacking. netdev
uses a lot of inline C functions, which don't seem to map too well to
Rust. And rust does not seem to have the concept of per CPU memory,
needed for statistics. So it would be good to be able to have some
code which can be profiled to see how bad this actually is, and then
provide a test bed for finding solutions for these problems.

The second is just wrapping more API calls to allow more capable
drivers to be written. Implementing the loopback driver seems like the
next obvious step. Then maybe a big jump to virtio_net? Like dummy and
loopback, it is something which everybody can have, no physical
hardware needed. It also has a lot of netdev features, NAPI, RSS,
statistics, BPF & XDP. So it is a good playground, both for features
and to profiling and performance optimisation.

    Andrew
