Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE54CC7EE25
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 00:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbjFJAZw (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 20:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjFJAZw (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 20:25:52 -0400
Received: from out-38.mta1.migadu.com (out-38.mta1.migadu.com [IPv6:2001:41d0:203:375::26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAB73A81
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 17:25:50 -0700 (PDT)
Date:   Fri, 9 Jun 2023 20:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686356746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KnXoZLNZoQqF4WsY7FeKq6X5VrU3pbObDu5muUphryA=;
        b=xFHl2TqPtRKFl8nqcpkxsnCu1UqPnUDEMhFJTqdUvtyaIVqOD3LaJyU5XVfO/TeKnzqRlE
        ffNYvnI7bA6M7891VaAud38tStlHLBDSpFf6zXNFHI5uAYGoy4KT/OfY0v1LjK549ReGOZ
        /hye8Sj3ZZpVhwAllDqo9C0kxgsmO3w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
Message-ID: <ZIPDCGM9HbPhR2yW@moria.home.lan>
References: <20230609063118.24852-1-amiculas@cisco.com>
 <20230609063118.24852-32-amiculas@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609063118.24852-32-amiculas@cisco.com>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 09, 2023 at 09:30:29AM +0300, Ariel Miculas wrote:
> From: Miguel Ojeda <ojeda@kernel.org>
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/serde/de/format.rs         | 2 ++
>  rust/serde/de/ignored_any.rs    | 2 ++
>  rust/serde/de/impls.rs          | 2 ++
>  rust/serde/de/mod.rs            | 2 ++
>  rust/serde/de/seed.rs           | 2 ++
>  rust/serde/de/utf8.rs           | 2 ++
>  rust/serde/de/value.rs          | 2 ++
>  rust/serde/integer128.rs        | 2 ++
>  rust/serde/lib.rs               | 2 ++
>  rust/serde/macros.rs            | 2 ++
>  rust/serde/private/de.rs        | 2 ++
>  rust/serde/private/doc.rs       | 2 ++
>  rust/serde/private/mod.rs       | 2 ++
>  rust/serde/private/ser.rs       | 2 ++
>  rust/serde/private/size_hint.rs | 2 ++
>  rust/serde/ser/fmt.rs           | 2 ++
>  rust/serde/ser/impls.rs         | 2 ++
>  rust/serde/ser/impossible.rs    | 2 ++
>  rust/serde/ser/mod.rs           | 2 ++
>  rust/serde/std_error.rs         | 2 ++
>  20 files changed, 40 insertions(+)

Separately from that - are we sure we want to be pulling Serde into the
kernel?

Don't get me wrong, Serde is amazing - it's highly ergonomic, and makes
a lot of compatibility issues just completely go away. It's
impresssively well done.

But it's a full json parser (are you using it in json mode here? it
supports multiple formats), and object size is going to be a
consideration. In particular, the way it works is by generating (via
procedural macros) encode/decode functions for every type you use
#[derive] an encoder/decoder for, so depending on how that was
implemented that's going to add up.

I would need to see text size numbers - the bloaty tool might be
useful here: https://github.com/google/bloaty

I'd give serious consideration to Cap'n proto instead, it's not as
ergonomic as Serde (the get/set interface is not ideal, ask me for more
details on how this could be fixed) but it's lower overhead than Serde.

https://github.com/capnproto/capnproto-rust
