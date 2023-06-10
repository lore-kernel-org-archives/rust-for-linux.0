Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7463FC7EE2F
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 13:21:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232419AbjFJNVD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 09:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjFJNVC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 09:21:02 -0400
Received: from out-7.mta0.migadu.com (out-7.mta0.migadu.com [91.218.175.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2FD830E8
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 06:20:58 -0700 (PDT)
Date:   Sat, 10 Jun 2023 09:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686403256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xdyhC18NXQSByJOWQtlrcE/QiMaQzcPWM2b6tk8RVXs=;
        b=M+ZMsZCz4KA7pFQtwInDdS9qF6uFpBGMxvynkp9kOafcaj3Na2xzt4rwLXelFD3sNb1c1r
        JGqIulXTd0rF2IbTHsUhyrnxntQhC8F6GnN14wJwCYvWI1N/CFbso++uuNx5kqPIoTKKiQ
        y3zX5PfLbzPZ3nuJcS2UoNYRGv/DalA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
Cc:     Ariel Miculas <amiculas@cisco.com>, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
Message-ID: <ZIR4tVA43Pen0ULQ@moria.home.lan>
References: <20230609063118.24852-1-amiculas@cisco.com>
 <20230609063118.24852-32-amiculas@cisco.com>
 <ZIPDCGM9HbPhR2yW@moria.home.lan>
 <87v8fvit4m.fsf@metaspace.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8fvit4m.fsf@metaspace.dk>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 11:04:24AM +0200, Andreas Hindborg (Samsung) wrote:
> 
> Kent Overstreet <kent.overstreet@linux.dev> writes:
> 
> > On Fri, Jun 09, 2023 at 09:30:29AM +0300, Ariel Miculas wrote:
> >> From: Miguel Ojeda <ojeda@kernel.org>
> >> 
> >> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> >> ---
> >>  rust/serde/de/format.rs         | 2 ++
> >>  rust/serde/de/ignored_any.rs    | 2 ++
> >>  rust/serde/de/impls.rs          | 2 ++
> >>  rust/serde/de/mod.rs            | 2 ++
> >>  rust/serde/de/seed.rs           | 2 ++
> >>  rust/serde/de/utf8.rs           | 2 ++
> >>  rust/serde/de/value.rs          | 2 ++
> >>  rust/serde/integer128.rs        | 2 ++
> >>  rust/serde/lib.rs               | 2 ++
> >>  rust/serde/macros.rs            | 2 ++
> >>  rust/serde/private/de.rs        | 2 ++
> >>  rust/serde/private/doc.rs       | 2 ++
> >>  rust/serde/private/mod.rs       | 2 ++
> >>  rust/serde/private/ser.rs       | 2 ++
> >>  rust/serde/private/size_hint.rs | 2 ++
> >>  rust/serde/ser/fmt.rs           | 2 ++
> >>  rust/serde/ser/impls.rs         | 2 ++
> >>  rust/serde/ser/impossible.rs    | 2 ++
> >>  rust/serde/ser/mod.rs           | 2 ++
> >>  rust/serde/std_error.rs         | 2 ++
> >>  20 files changed, 40 insertions(+)
> >
> > Separately from that - are we sure we want to be pulling Serde into the
> > kernel?
> >
> > Don't get me wrong, Serde is amazing - it's highly ergonomic, and makes
> > a lot of compatibility issues just completely go away. It's
> > impresssively well done.
> >
> > But it's a full json parser (are you using it in json mode here? it
> 
> I think the json capability lives in serde_json, so this is actually not
> a full json parser.

Good to know

I don't think I'm the only one who's curious though - what's serde being
used for here? On disk data structures of some kind?

I'm probably not the only filesystem author eagerly waiting for the day
when I can stop using carefully packed C structs for this, with all the
sharp edges that entails...
