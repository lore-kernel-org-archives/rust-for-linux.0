Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47800C7EE29
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 00:20:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbjFJAUD (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 20:20:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFJAUC (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 20:20:02 -0400
Received: from out-56.mta1.migadu.com (out-56.mta1.migadu.com [IPv6:2001:41d0:203:375::38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF2D3A81
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 17:20:00 -0700 (PDT)
Date:   Fri, 9 Jun 2023 20:19:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686356399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=O+7gz8M8Tt0srTsZFVbAYxrBY9Zxj+jROKKGFmvB+bI=;
        b=pwoyxMsK2iF8aZsmm0T6JO8PZjwoZqDRCJTuwFNbNlKvrLkqSs0krxHO98CgUDcdZFTsi8
        zWymBgwVNxECGHz/36t//qqaDht5VRuPjJy3r5a8fU3zOxZOE3U3taIWO8wrPQWjp8HhuX
        +CcGvqfltXy/vn1ZhApt7UNyo+g4xTg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        jejb@linux.ibm.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
Message-ID: <ZIPBrFkKosGVArBi@moria.home.lan>
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
> 
> diff --git a/rust/serde/de/format.rs b/rust/serde/de/format.rs
> index f14580b8d162..33233766fc27 100644
> --- a/rust/serde/de/format.rs
> +++ b/rust/serde/de/format.rs
> @@ -1,3 +1,5 @@
> +// SPDX-License-Identifier: Apache-2.0 OR MIT
> +
>  use lib::fmt::{self, Write};
>  use lib::str;

Hang on, are we applying our own local modifications to code vendored
from an outside repository?

We gotta stop doing this - this turns our version into an unsupported
fork. What do we then do when we need to merge in security updates from
the upstream repository?

The only sane thing to do is keep the vendored code in lockstep with the
upstream repository - i.e. always a direct copy of a specific commit.
Any changes for the kernel need to be applied to the upstream repository
(which could be an intermediate repository, not necessarly _the_
upstream repository; the point is, that way there's a proper revision
history for _that_ repo, and changes can get merged upstream).

Otherwise, we're setting ourselves up for a maintainence nightmare...
