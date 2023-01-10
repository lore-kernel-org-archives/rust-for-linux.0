Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9727C46467
	for <rust-for-linux@archiver.kernel.org>; Tue, 10 Jan 2023 21:21:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbjAJVVJ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 10 Jan 2023 16:21:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbjAJVVH (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 10 Jan 2023 16:21:07 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD09C1AA09;
        Tue, 10 Jan 2023 13:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=LBYx7tyllNxxanNj4C/c3Rthmyngs458XvfvtfnV0JE=; b=ZwT07gRdDTytos5AC5hgG5ugv8
        6YuKG7mj6bEipP8Pkjdv/wbJsmWe9hmTgWTBaeHLlF+B7eUiL3DiYG6lZMSttgFVe+F/Pzk5eLGb3
        bmOdYs5f7Nh104PnhauwddMe8X2ypx+b2puirEjXRrHLZjIlF8GyQkTHnPckiMOJvD6Lj3BmVNq1w
        +v5TDMOAfWS64Xofp/x9S78w7SRzo4Z0LfdWHYVueTtHOu5pwQjAd6gyitkVlflOIrTaV8bXUWylq
        meMHae66blHXjYBpk67QgZ/ARhIKEJshzvmDGE/hK/aKE5KMdgypmiT++yaJUXbKnitVRYGas2CCV
        HevjIrgw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pFM3L-003Xj6-IH; Tue, 10 Jan 2023 21:21:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5FBC03001E5;
        Tue, 10 Jan 2023 22:20:50 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 418EE2C4CABC3; Tue, 10 Jan 2023 22:20:50 +0100 (CET)
Date:   Tue, 10 Jan 2023 22:20:50 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Boqun Feng <boqun.feng@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@gmail.com>,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Gary Guo <gary@garyguo.net>,
        =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
        linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/7] rust: sync: add `Arc` for ref-counted allocations
Message-ID: <Y73WsvEEIS0jHlVb@hirez.programming.kicks-ass.net>
References: <20221228060346.352362-1-wedsonaf@gmail.com>
 <Y73JF1rvF/No/JRi@boqun-archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y73JF1rvF/No/JRi@boqun-archlinux>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Jan 10, 2023 at 12:22:47PM -0800, Boqun Feng wrote:

> First, I'd really appreciate it that Will, Peter or Mark can take a look
> at the series and see if they are happy or not ;-)

I only have 1 patch, and since I don't speak rust I have very limited
feedback. Having to use out-of-line functions seems sub-optimal, but
I suppose that's a limitation of the Rust-C bindings.

Afaict this is like C++ shared_ptr<> and using refcount_t seems okay for
that, not sure what else you're asking.

