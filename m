Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108C8C7619A
	for <rust-for-linux@archiver.kernel.org>; Wed,  5 Apr 2023 19:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbjDETSx (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Wed, 5 Apr 2023 15:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjDETSx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Wed, 5 Apr 2023 15:18:53 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 950675FFA;
        Wed,  5 Apr 2023 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=1WceT7uarOJB+m/Xc4WcMgeqPVhWuV2FTYN+2lJ1++8=; b=mTRWrUvj7ivETCwmvKVYiaSAwY
        Ion/otxLpsUjZO6LrIHJuQE53DfVPQuNWFv1cA3+vJVhnlr50x8LkwEWiO2An8+Y+aYMQOthXTnwT
        O5DcxXkDWrqIyAy36FBrI7HhfDmWwusmAmvRS6GAG+roVh9GvwHOL2TQTbn8otzalGvjxRdaitmJy
        4bhJ4wcS1l8U8TahZk7G3Y8+egm3pTOTAO34D50KkG/OvCbtibe32yX333UOP3x7I0s8uhFQdroD6
        VnsnEOEK3PbyY2eYQ7pduJYts9uyOJOtjmlMAoeRz13l6RbFsg6SOzoIWf4mKTplFG22Z/73olKys
        lW7pZDEA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pk8eK-00A3g3-0u;
        Wed, 05 Apr 2023 19:18:28 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CFAB7300202;
        Wed,  5 Apr 2023 21:18:26 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id ACA8E200D7A67; Wed,  5 Apr 2023 21:18:26 +0200 (CEST)
Date:   Wed, 5 Apr 2023 21:18:26 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Wedson Almeida Filho <wedsonaf@gmail.com>,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        linux-kernel@vger.kernel.org,
        Wedson Almeida Filho <walmeida@microsoft.com>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v2 03/13] rust: lock: introduce `Mutex`
Message-ID: <20230405191826.GA365912@hirez.programming.kicks-ass.net>
References: <20230405175111.5974-1-wedsonaf@gmail.com>
 <20230405175111.5974-3-wedsonaf@gmail.com>
 <2023040554-promoter-chevron-10b2@gregkh>
 <2023040509-tamer-clinic-c14c@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023040509-tamer-clinic-c14c@gregkh>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Apr 05, 2023 at 08:04:22PM +0200, Greg KH wrote:
> On Wed, Apr 05, 2023 at 08:03:11PM +0200, Greg KH wrote:
> > On Wed, Apr 05, 2023 at 02:51:01PM -0300, Wedson Almeida Filho wrote:
> > > +void rust_helper_mutex_lock(struct mutex *lock)
> > > +{
> > > +	mutex_lock(lock);
> > > +}
> > > +EXPORT_SYMBOL_GPL(rust_helper_mutex_lock);
> > > +
> > 
> > No need to ever unlock a mutex?
> 
> Oh nevermind, mutex_lock() is a macro, mutex_unlock() is not...

Yeah, so I despise all these stupid helpers... but I suppose it's the
best they could come up with to interface the languages :/

The only hope is that the thing can do cross-language LTO or something
to re-inline stuff.
