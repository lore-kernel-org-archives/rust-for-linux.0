Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B654CC77B7A
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 15:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234989AbjFJP2e (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 11:28:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234867AbjFJP2d (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 11:28:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99D93193
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 08:28:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2EAAA6097D
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 15:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DA1C433D2;
        Sat, 10 Jun 2023 15:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686410911;
        bh=tNbXqGS3hCTR7gsMAQe/1rqWlJo9hvPR6lEziBAqi+0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=buksOp9PPM3Mv1xEyGcFWv6xaB3xRom32Qg8DNPbwVnp7AEHO2Ocm45k0aZRoYvxC
         YfGrd0Td72PToCnNnizpgB4bnFD0+KYqcfRsmyAbsvvurs0tXlo3G9UtyU2cAbgYc6
         V+uz2w9mAyU6g/5oTe4U48ujmLkWI8+93NHt4fVQ=
Date:   Sat, 10 Jun 2023 17:28:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Ariel Miculas <amiculas@cisco.com>, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>, jejb@linux.ibm.com
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
Message-ID: <2023061059-appraiser-unfasten-c8be@gregkh>
References: <20230609063118.24852-1-amiculas@cisco.com>
 <20230609063118.24852-32-amiculas@cisco.com>
 <ZIPBrFkKosGVArBi@moria.home.lan>
 <2023061014-candy-dedicator-d946@gregkh>
 <ZIR4HF/GygRNAhbv@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIR4HF/GygRNAhbv@moria.home.lan>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sat, Jun 10, 2023 at 09:18:20AM -0400, Kent Overstreet wrote:
> On Sat, Jun 10, 2023 at 08:43:10AM +0200, Greg KH wrote:
> > On Fri, Jun 09, 2023 at 08:19:56PM -0400, Kent Overstreet wrote:
> > > Hang on, are we applying our own local modifications to code vendored
> > > from an outside repository?
> > 
> > For adding a single license line, I think it's going to be ok, those are
> > trivial to handle :)
> 
> They'll still be lost when the package is updated from upstream. Just do
> a proper upstream patch - I see no reason why SPDX identifiers wouldn't
> be accepted by the host project.

Great, then submit them upstream also, but for now, when added to the
kernel tree, they need to be present.

thanks,

greg k-h
