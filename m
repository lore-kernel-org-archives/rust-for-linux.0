Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40540C7EE29
	for <rust-for-linux@archiver.kernel.org>; Sat, 10 Jun 2023 00:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjFJAJg (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 20:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjFJAJf (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 20:09:35 -0400
Received: from out-40.mta1.migadu.com (out-40.mta1.migadu.com [IPv6:2001:41d0:203:375::28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B4A2D41
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 17:09:34 -0700 (PDT)
Date:   Fri, 9 Jun 2023 20:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686355772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lCr/nFmNM0TUzbK5jS8fyhgO1zU9KRm9magfO54yldQ=;
        b=QvNCPB7mGFH8aaA92uG3eglMski6upOf4Q8z8s9yZGX7wCITY6ZVdrVs+3yt4l94yeQJdN
        eZtk/hKcpGQ0QePJKx+mHJjyjhyvqfz9hbcGIDenLyV64157RkyCgqFOHqCiH3LJxZg3ul
        Dk99KgswhhHrzlYoauzoxB4ww+VHW1I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Kent Overstreet <kent.overstreet@linux.dev>
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 00/80] Rust PuzzleFS filesystem driver
Message-ID: <ZIO/OqxmFkTFzyDh@moria.home.lan>
References: <20230609063118.24852-1-amiculas@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609063118.24852-1-amiculas@cisco.com>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 09, 2023 at 09:29:58AM +0300, Ariel Miculas wrote:
> Hi all!
> 
> This is a proof of concept driver written for the PuzzleFS
> next-generation container filesystem [1].

I can't find the link to the git tree that corresponds to the patch
series you just posted. Could you make sure that is front and center
when submitting large patch series? I find it a lot easier to get my
head around a large body of code by fetching into my local repository.
