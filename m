Return-Path: <rust-for-linux-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D02C433EF
	for <rust-for-linux@archiver.kernel.org>; Mon, 28 Mar 2022 05:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238156AbiC1Fsy (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Mon, 28 Mar 2022 01:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbiC1Fsx (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Mon, 28 Mar 2022 01:48:53 -0400
X-Greylist: delayed 332 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 27 Mar 2022 22:47:13 PDT
Received: from gpm.stappers.nl (gpm.stappers.nl [IPv6:2001:981:6c6a:1::49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 08E975006F
        for <rust-for-linux@vger.kernel.org>; Sun, 27 Mar 2022 22:47:12 -0700 (PDT)
Received: by gpm.stappers.nl (Postfix, from userid 1000)
        id 6507B30412F; Mon, 28 Mar 2022 07:41:37 +0200 (CEST)
Date:   Mon, 28 Mar 2022 07:41:36 +0200
From:   Geert Stappers <stappers@stappers.nl>
To:     Chris Suter <chris@sutes.me>
Cc:     rust-for-linux@vger.kernel.org
Subject: Re: Fwd: Adding crates
Message-ID: <20220328054136.27mt2xdaltz4unby@gpm.stappers.nl>
References: <CAKfU0DKvQYjhgiKN83+DZW3CQOkSEdQcy9nXUfFLVn1Uju6GkQ@mail.gmail.com>
 <CAKfU0DLS5icaFn0Mve6+y9Tn1vL+eLKqfquvXbX4oCpYH+VapQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfU0DLS5icaFn0Mve6+y9Tn1vL+eLKqfquvXbX4oCpYH+VapQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Mon, Mar 28, 2022 at 11:41:43AM +1100, Chris Suter wrote:
> Hey folks,
> 
> I'm playing with a kernel module written in Rust, and for the thing
> I'm working on, I need to pull in a number of crates. The most
> significant of those might be some async ones: (e.g. futures,
> async_trait). What's the best way to pull those in and get them
> building with my module? In particular, I'm interested in how to
> structure the Makefile to make it work. Are there any examples I could
> follow?

See https://lore.kernel.org/rust-for-linux/CANiq72my9N51hhryv-Cp79eUmPVCx6q=0fJrhkzmvT+nVPq+WQ@mail.gmail.com/T/#t
for a recent thread "Using 3rd party crates in an out-of-tree module"
 

> Cheers,
> Chris

 
Groeten
Geert Stappers
-- 
Silence is hard to parse
