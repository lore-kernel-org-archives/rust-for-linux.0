Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2F4C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 14 Feb 2022 14:49:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355372AbiBNOtI (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 14 Feb 2022 09:49:08 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355357AbiBNOtH (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 14 Feb 2022 09:49:07 -0500
Received: from gpm.stappers.nl (gpm.stappers.nl [82.161.218.215])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B29E44C402
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Feb 2022 06:48:58 -0800 (PST)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 30A4930412F; Mon, 14 Feb 2022 15:48:57 +0100 (CET)
Date:   Mon, 14 Feb 2022 15:48:57 +0100
From:   Geert Stappers <stappers@stappers.nl>
To:     rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 00/20] Rust support, nn/nn
Message-ID: <20220214144857.cr2pzqlnhzycu5zd@gpm.stappers.nl>
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220213093135.7hvlvbsawcu2bjzg@gpm.stappers.nl>
 <YgjVmGiEygx1QNqF@kroah.com>
 <20220213105256.wvkwsccjtjleel7h@gpm.stappers.nl>
 <CANiq72=YFvXdSJ16ZiYwk8TZgsStJpJOUKR0EVq8Zsoq6BNf_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=YFvXdSJ16ZiYwk8TZgsStJpJOUKR0EVq8Zsoq6BNf_Q@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Feb 14, 2022 at 03:16:34PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 14, 2022 at 2:57 PM Geert Stappers wrote:
} } Greg KH told:
} } } Geert Stappers asked:
} } } } Where is patch 20/20
} } } In the archive
> > Ah, Subject: [PATCH v4 20/20] [RFC] drivers: android: Binder IPC in Rust
> > Thanks.  So 20/20 does exist.  That it is
> > NOT at https://lore.kernel.org/rust-for-linux/ remains odd.
> 
> Sorry about that, some patches bounced since they were too long

Ah, too long, that explains it.


> (number 6, 10, 15 and 20 in rust-for-linux and number 15 in linux-doc
> and linux-kbuild).

Oops, I didn't miss other patches.  I hope they (patch 6, 10, 15 and 20)
get the review attention to get accepted.

These are URLs of them: (patchnumber plus one due the cover letter)

https://lore.kernel.org/r/20220212130410.6901-7-ojeda@kernel.org
https://lore.kernel.org/r/20220212130410.6901-11-ojeda@kernel.org
https://lore.kernel.org/r/20220212130410.6901-16-ojeda@kernel.org
https://lore.kernel.org/r/20220212130410.6901-21-ojeda@kernel.org



Groeten
Geert Stappers
-- 
Silence is hard to parse
