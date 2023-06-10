Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC97C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 13:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233126AbjFJNSa (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 09:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230311AbjFJNS3 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 09:18:29 -0400
Received: from out-28.mta1.migadu.com (out-28.mta1.migadu.com [IPv6:2001:41d0:203:375::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1012C30E4
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 06:18:28 -0700 (PDT)
Date:   Sat, 10 Jun 2023 09:18:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686403105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=z05A/9lvC4NdpvLtVloPqSA6Labr6OOGCW/+2DhrChw=;
        b=ucSUWKkBWxbt2padhIdxlQWXSMQIvaHlufd56jh1GLYGCvQI3qRkeFuVIHgMfhpW5+Z9AX
        vl9oZv1+ULx0g0M+LPuUQDFPKhlUxEtDXy8Mgzyv5VizhR0xWWYkRfYJFlc6xMG0y7gwO+
        sv+H2w3pCX+fdK8HIjmMM18mg2+Gguk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Ariel Miculas <amiculas@cisco.com>, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>, jejb@linux.ibm.com
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
Message-ID: <ZIR4HF/GygRNAhbv@moria.home.lan>
References: <20230609063118.24852-1-amiculas@cisco.com>
 <20230609063118.24852-32-amiculas@cisco.com>
 <ZIPBrFkKosGVArBi@moria.home.lan>
 <2023061014-candy-dedicator-d946@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023061014-candy-dedicator-d946@gregkh>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 08:43:10AM +0200, Greg KH wrote:
> On Fri, Jun 09, 2023 at 08:19:56PM -0400, Kent Overstreet wrote:
> > Hang on, are we applying our own local modifications to code vendored
> > from an outside repository?
> 
> For adding a single license line, I think it's going to be ok, those are
> trivial to handle :)

They'll still be lost when the package is updated from upstream. Just do
a proper upstream patch - I see no reason why SPDX identifiers wouldn't
be accepted by the host project.

> 
> > We gotta stop doing this - this turns our version into an unsupported
> > fork. What do we then do when we need to merge in security updates from
> > the upstream repository?
> 
> Same as we do for other parts of the kernel that are copies of other
> codebases, we merge them in as needed.

Yeah, and that workflow still leaves something to be desired...
