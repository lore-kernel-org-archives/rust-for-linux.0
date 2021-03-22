Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969FCC433C1
	for <rust-for-linux@archiver.kernel.org>; Mon, 22 Mar 2021 06:53:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CD546196F
	for <rust-for-linux@archiver.kernel.org>; Mon, 22 Mar 2021 06:53:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhCVGxZ (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 22 Mar 2021 02:53:25 -0400
Received: from gpm.stappers.nl ([82.161.218.215]:52460 "EHLO gpm.stappers.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230071AbhCVGxE (ORCPT <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 22 Mar 2021 02:53:04 -0400
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 06C7D304176; Mon, 22 Mar 2021 07:53:00 +0100 (CET)
Date:   Mon, 22 Mar 2021 07:53:00 +0100
From:   Geert Stappers <stappers@stappers.nl>
To:     Joshua Abraham <j.abraham1776@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        rust-for-linux@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: drivers/char/rust_example fails to load 2021-03-20 builds
Message-ID: <20210322065300.dgory3vfe5jjfvak@gpm.stappers.nl>
References: <CAMmOe3SaBn9+XzjhZC8QxmZnHQkvB0R=nV4NaRRyMRF6EfcvvA@mail.gmail.com>
 <CANiq72m=kDd97+n1Zxwi5+7M8cwreoq1P_u5YZ25Dcyx40jNdA@mail.gmail.com>
 <CAMmOe3TNt2vgX=fp77yvOx7s3+CeDonkd=Unb-y2hau66M-fsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmOe3TNt2vgX=fp77yvOx7s3+CeDonkd=Unb-y2hau66M-fsg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Mar 21, 2021 at 09:53:27PM -0500, Joshua Abraham wrote:
> Hey Miguel,
> 
> > Please give a go to the nightly from a month ago, i.e. 2021-02-20.
> 
> Cheers, using rustc 1.52.0-nightly (9b471a3f5 2021-02-19) fixed the issue.

How to tell "use older parts in toolchain"?
Yeah, probably a Rust newbie question, still a sincere question.
Was a older version installed? How to tell `rustup` to keep old
versions? Was done with a cargo.toml entry? Or with file
`rust-toolchain`?  Please tell   (Please spoon feed me ;-)


> Interesting that the newer nightly compiler creates these new
> relocations for the code!

Not each change is an improvement.  Hopefully came the change with a
flag to modify the new default behaviour.



Groeten
Geert Stappers
-- 
Silence is hard to parse
