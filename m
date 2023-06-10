Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5A2C7EE29
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 06:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjFJGnP (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Sat, 10 Jun 2023 02:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjFJGnO (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Sat, 10 Jun 2023 02:43:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28633A89
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 23:43:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 56A1D601B6
        for <rust-for-linux@vger.kernel.org>; Sat, 10 Jun 2023 06:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5105DC433EF;
        Sat, 10 Jun 2023 06:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686379392;
        bh=U1IooEhZT6M56Re43P2SaaDMnCdVJF8obCyCEYO1LTY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FrPUmxlpdoh7GVMqzNoboPjckBvrizvIFidkNYOagWPO9sMivwh0jhi/cF69XGQKj
         eJ4iZFbCVrWm7b1BfT5R2N6XAUudnoKjuD53J2/DmXUxEOYZENg8ltHnTVhVP29vL0
         by7Ealr/ghbPPsqVABJ5ixJuCndpP7mtrY118y9M=
Date:   Sat, 10 Jun 2023 08:43:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Ariel Miculas <amiculas@cisco.com>, rust-for-linux@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>, jejb@linux.ibm.com
Subject: Re: [PATCH 31/80] rust: serde: add SPDX License Identifiers
Message-ID: <2023061014-candy-dedicator-d946@gregkh>
References: <20230609063118.24852-1-amiculas@cisco.com>
 <20230609063118.24852-32-amiculas@cisco.com>
 <ZIPBrFkKosGVArBi@moria.home.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIPBrFkKosGVArBi@moria.home.lan>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 09, 2023 at 08:19:56PM -0400, Kent Overstreet wrote:
> Hang on, are we applying our own local modifications to code vendored
> from an outside repository?

For adding a single license line, I think it's going to be ok, those are
trivial to handle :)

> We gotta stop doing this - this turns our version into an unsupported
> fork. What do we then do when we need to merge in security updates from
> the upstream repository?

Same as we do for other parts of the kernel that are copies of other
codebases, we merge them in as needed.

thanks,

greg k-h
