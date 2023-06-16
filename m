Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542EFEB64D9
	for <rust-for-linux@archiver.kernel.org>; Fri, 16 Jun 2023 02:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239971AbjFPCDD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Thu, 15 Jun 2023 22:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239232AbjFPCDB (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Thu, 15 Jun 2023 22:03:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EE32D42
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jun 2023 19:02:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B98CD61F2C
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Jun 2023 02:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E9BC433C8;
        Fri, 16 Jun 2023 02:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686880974;
        bh=lcf0TFVlPPOkQFWuWXCwI1kwRPZ8JdZc98xqsZTKaMg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HMhlxCqNsLZHAzdy1HjUjzpMtYclLtOvWbHNzFxwMAoZZjpmcWoci71EWLwFscd6J
         d4/f5h6wSmNOOIKHhHp8X7GjetJm0sJdMrcNmMqevqmOwUpZEl5c7BAl30w2qSzoFO
         qpt+NMmFmJHWhB7r29qvwywOfI6NxadYLD2nqtIxO6EtG0SP1wlWBn7sVdADYJgfYu
         LcMKVv4r0iVDOBrRGwuWR+oHr+rqRbr0yjy3+VWUfUulEUVeW3lzxEMs8L5y5aDkba
         l9oDlenMkktNwe1yo8wR1yYPuWy3dxxnFD84iXRdsHSsjnnXW+sbnraeiMLOY2quK8
         v3DQNtCpSMfcg==
Date:   Thu, 15 Jun 2023 19:02:52 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     FUJITA Tomonori <fujita.tomonori@gmail.com>,
        netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
        aliceryhl@google.com, miguel.ojeda.sandonis@gmail.com
Subject: Re: [PATCH 0/5] Rust abstractions for network device drivers
Message-ID: <20230615190252.4e010230@kernel.org>
In-Reply-To: <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
References: <20230613045326.3938283-1-fujita.tomonori@gmail.com>
        <20230614230128.199724bd@kernel.org>
        <8e9e2908-c0da-49ec-86ef-b20fb3bd71c3@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Thu, 15 Jun 2023 14:51:10 +0200 Andrew Lunn wrote:
> On Wed, Jun 14, 2023 at 11:01:28PM -0700, Jakub Kicinski wrote:
> > On Tue, 13 Jun 2023 13:53:21 +0900 FUJITA Tomonori wrote:  
> > > This patchset adds minimum Rust abstractions for network device
> > > drivers and an example of a Rust network device driver, a simpler
> > > version of drivers/net/dummy.c.
> > > 
> > > The dummy network device driver doesn't attach any bus such as PCI so
> > > the dependency is minimum. Hopefully, it would make reviewing easier.
> > > 
> > > Thanks a lot for reviewing on RFC patchset at rust-for-linux ml.
> > > Hopefully, I've addressed all the issues.  
> > 
> > First things first, what are the current expectations for subsystems
> > accepting rust code?
> > 
> > I was hoping someone from the Rust side is going to review this.
> > We try to review stuff within 48h at netdev, and there's no review :S  
> 
> As pointed out elsewhere, i've looked the code over. I cannot say
> anything about the rust, but i don't see anything too obviously wrong
> with the way it use a few netdev API calls.

The skb freeing looks shady from functional perspective.
I'm guessing some form of destructor frees the skb automatically
in xmit handler(?), but (a) no reason support, (b) kfree_skb_reason()
is most certainly not safe to call on all xmit paths...

> > My immediate instinct is that I'd rather not merge toy implementations
> > unless someone within the netdev community can vouch for the code.  
> 
> It is definitely toy. But you have to start somewhere.
> 
> What might be useful is an idea of the roadmap. How does this go from
> toy to something useful?
> 
> I see two different threads of work.
> 
> One is getting enough in place to find where rust is lacking. netdev
> uses a lot of inline C functions, which don't seem to map too well to
> Rust. And rust does not seem to have the concept of per CPU memory,
> needed for statistics. So it would be good to be able to have some
> code which can be profiled to see how bad this actually is, and then
> provide a test bed for finding solutions for these problems.
> 
> The second is just wrapping more API calls to allow more capable
> drivers to be written. Implementing the loopback driver seems like the
> next obvious step. Then maybe a big jump to virtio_net?

I'd have thought that a simple SPI driver or some such would be 
a better match.

> Like dummy and loopback, it is something which everybody can have, no
> physical hardware needed. It also has a lot of netdev features, NAPI,
> RSS, statistics, BPF & XDP. So it is a good playground, both for
> features and to profiling and performance optimisation.

IMO we have too much useless playground stuff in C already, don't get me
started. Let's get a real device prove that this thing can actually work
:( We can waste years implementing imaginary device drivers that nobody
ends up using.
