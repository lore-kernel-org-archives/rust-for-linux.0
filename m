Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F603C7EE2F
	for <rust-for-linux@archiver.kernel.org>; Tue,  6 Jun 2023 22:29:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239853AbjFFW3G (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Tue, 6 Jun 2023 18:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234064AbjFFW3F (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Tue, 6 Jun 2023 18:29:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C79171B;
        Tue,  6 Jun 2023 15:29:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7009F62D9A;
        Tue,  6 Jun 2023 22:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61186C4339C;
        Tue,  6 Jun 2023 22:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686090543;
        bh=BE/Y78iy49nztkz3B5s6KdQt99eoZP/TQ2E6JCvgLgs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cPjbOJUanlgEhGuh3eudn3EeTrBQfiBtMJrMUPZe0/CrAOZQNkCimZAbZyJec3UN/
         7L0HYyfYZLNfR+SHaI0eavaM8akiWXPRTb8EcUrJ9nqPf/eEIymhJRSMUjQ5aXJA5a
         6Ci1lBAWpOHT15pFRT/sRhVJ+Mx8cpZNXpN0fpaeBgxoLWHo4lfOVB3jPkYLbZ2EWb
         Z4VKa7xQGJeqrdyROpyCcvcEePM+ldBIsMu6GT1dzjm+bpqO7H9EM2qEmCwUrkCP95
         q3El9eKvBLEzaca3grvyj/LtQQQIazW6RqvrGOTXEWIjeLycs/vFEmA5eZi2ccTazk
         KCQBP8SdJ125g==
Date:   Tue, 6 Jun 2023 15:29:01 -0700
From:   Josh Poimboeuf <jpoimboe@kernel.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        Miroslav Benes <mbenes@suse.cz>,
        kernel test robot <lkp@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        rust-for-linux@vger.kernel.org
Subject: Re: [tip:objtool/core 8/12] vmlinux.o: warning: objtool:
 rust_begin_unwind+0x5c: rust_helper_BUG() is missing a __noreturn annotation
Message-ID: <20230606222901.kzz5dpglz7c5okhk@treble>
References: <202306070408.EFxuDoRs-lkp@intel.com>
 <20230606215212.r7if2gsynajugf6j@treble>
 <CANiq72nD3wvOxfUq9mxTiPDbf+VKmbU+eVepO7QY_G2LT-UOEg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nD3wvOxfUq9mxTiPDbf+VKmbU+eVepO7QY_G2LT-UOEg@mail.gmail.com>
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Wed, Jun 07, 2023 at 12:22:45AM +0200, Miguel Ojeda wrote:
> On Tue, Jun 6, 2023 at 11:52 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > So it seems to be an issue with bindgen, though that github issue has
> > been resolved.  Any idea when this will show up in a toolchain?
> >
> > In the meantime we may have to get objtool to manually silence the
> > warning, unless you have any better ideas.
> 
> We were going to update `bindgen`, so we can just do that -- one more
> reason to do so! :)
> 
> If the update goes into the upcoming merge window, would that be fine
> with you? Or do you need it for this current cycle?

The next merge window would be good.  Eventually I want to get objtool
to zero warnings so we can do -Werror, but we're not there yet :-)

Thanks!

-- 
Josh
