Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A22C433FE
	for <rust-for-linux@archiver.kernel.org>; Mon, 25 Oct 2021 05:49:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A58A60F9C
	for <rust-for-linux@archiver.kernel.org>; Mon, 25 Oct 2021 05:49:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhJYFv2 (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 25 Oct 2021 01:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbhJYFvW (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 25 Oct 2021 01:51:22 -0400
X-Greylist: delayed 413 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 24 Oct 2021 22:49:00 PDT
Received: from gpm.stappers.nl (gpm.stappers.nl [IPv6:2001:981:6c6a:1::49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 62097C061745
        for <rust-for-linux@vger.kernel.org>; Sun, 24 Oct 2021 22:49:00 -0700 (PDT)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id D65A13041A7; Mon, 25 Oct 2021 07:41:58 +0200 (CEST)
Date:   Mon, 25 Oct 2021 07:41:57 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Amy Parker <apark0006@student.cerritos.edu>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Subject: Re: Current driver status
Message-ID: <20211025054157.bvwwijkg3zqyjz2m@gpm.stappers.nl>
References: <CAPOgqxF0KV=ULD9dx-6-Z+0-Z7kitkTGcGoqYNuP7uWHaNNZRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPOgqxF0KV=ULD9dx-6-Z+0-Z7kitkTGcGoqYNuP7uWHaNNZRA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Sun, Oct 24, 2021 at 04:49:45PM -0700, Amy Parker wrote:
> Hello,
> 
> Are there any reference drivers or other running components written in
> Rust for the kernel in branch rust or rust-next? If not, is there an
> outlined process for building one?
> 
> Thanks!
> 

Thanks for breaking silence on that topic.

Reporting my point of view:

* It is all new.
  New as in "not yet done".
* Ideas were discussed.
  Discussion ended in "It MUST be the HIGHEST quality"
* There was an existing driver ported to Rust.
  I don't know if it got added to the patch set
  or that it is only a posting somewhere on the Internet.



So it boils down that a driver written in Rust waits
on a person that didn't knew it could not be done.

My hope is on a 1991-08-25 alike message:

   I wrote some Rust driver for the fun.
   It works for me.  Find it at ....
   

Plus follow-up messages that improve that creation.
While ignoring the "that is NOT good enough" posts.


Groeten
Geert Stappers
-- 
Silence is hard to parse
