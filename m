Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB598C433EF
	for <rust-for-linux@archiver.kernel.org>; Tue, 29 Mar 2022 05:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbiC2FY7 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 29 Mar 2022 01:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbiC2FY5 (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 29 Mar 2022 01:24:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CB022500
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Mar 2022 22:23:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D1A56144D
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Mar 2022 05:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC14C2BBE4;
        Tue, 29 Mar 2022 05:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1648531393;
        bh=znO5E7uXUjn7vSMWau6NAveX7XvIXnMhDVHLsOnVxM8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dp5zqGYOinrjO9x5pxMnfJil+G2Esvp2N3PdDgJpYtru0EVnznXAHaKiq8eIz1I3O
         Jo8OoBKRM+PJp8iZkSYfCXTNpQ8m4qAEe7Ii3nsgGAebx02/Civ/S98d+QmVzmgD9W
         DPgUZEaIOJczZkSYA6ozYVFaSjMABqdXjgWLSG4k=
Date:   Tue, 29 Mar 2022 07:23:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Chris Suter <chris@sutes.me>
Cc:     Geert Stappers <stappers@stappers.nl>,
        rust-for-linux@vger.kernel.org
Subject: Re: Fwd: Adding crates
Message-ID: <YkKXvnsvr0qz/pR2@kroah.com>
References: <CAKfU0DKvQYjhgiKN83+DZW3CQOkSEdQcy9nXUfFLVn1Uju6GkQ@mail.gmail.com>
 <CAKfU0DLS5icaFn0Mve6+y9Tn1vL+eLKqfquvXbX4oCpYH+VapQ@mail.gmail.com>
 <20220328054136.27mt2xdaltz4unby@gpm.stappers.nl>
 <CAKfU0D+gaC6s6kBBQ9OV+E9PFcm997efY-cUwP3bFWmuDDugbA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfU0D+gaC6s6kBBQ9OV+E9PFcm997efY-cUwP3bFWmuDDugbA@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Tue, Mar 29, 2022 at 08:38:29AM +1100, Chris Suter wrote:
> I skimmed that thread, but unless I'm missing something, it seems to
> be pretty much "don't do it", which doesn't work for me right now.

Why not?  What is the deadline?

And what specific crates do you need and why?  There is no "generic"
solution here other than "do not do this."

thanks,

greg k-h
